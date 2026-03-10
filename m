Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9E8F3C27D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBTi+Diqk25yIasnhVjZ42wpi09vWfP+RtyQmstJvHA=; b=ZhzapEn+ubW8iKQgAFuehnANRu
	EZ5X+EUsA0fCGtzoroev1pz9bMNsb1oi3cyw+BYXiqxqFkhSaSjNWUtEgvZACRZsVcSIobS+Njcnz
	RQgf+aoNBbIFHl0whTWSFCOdGtNjOnldq9elUrbiWS2feRzLmT9pzR7HTC7tM4aUunGdQy0XD7yk9
	yS9QkAexLbH2SqwzeaKyRQH4VzBGh6YlY2GNzxVIQOwUXHpI2C/ED7sqMI5lmWKQXOjV7LpYGM6DS
	jEFVxQxN6Ty6xdlzvT9ha9jHNjSIHNLfiQ1szAWr3NG5Y9pSJnhXAdPk0++9fWSbozqE17B4O0tST
	T+mbuP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztT3-000000096ZG-3t5q;
	Tue, 10 Mar 2026 09:33:33 +0000
Received: from mail-m32124.qiye.163.com ([220.197.32.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztT0-000000096XY-0MGb;
	Tue, 10 Mar 2026 09:33:32 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3665d3ef2;
	Tue, 10 Mar 2026 17:33:22 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/rockchip: Drop global rk_ops in favor of per-device
 ops
To: Simon Xue <xxm@rock-chips.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Heiko Stuebner <heiko@sntech.de>
References: <20260310084812.126082-1-xxm@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <a2719902-e5cb-bd4d-4eb4-a01371a57aed@rock-chips.com>
Date: Tue, 10 Mar 2026 17:33:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260310084812.126082-1-xxm@rock-chips.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd718098809cckunm7907381ceb4dc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxKSFZCTUIdSkpCHkpCTxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LfN4T1hyZ7F/Fgc3GdQa6KkyTJsBBYXeMneDyaHtkZD66iT4bIqkSGQ+21SreSvQnHOsDGsZPoyJML87v5z5OGZ3hpaF3rLUmaeCanZdLysYoiEe1/WhuqnTqYue/i9OmmJWrM4Uo+vjt3wmtvTkMaY0A1mI5Ls2sqt30XxO3BY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=mBTi+Diqk25yIasnhVjZ42wpi09vWfP+RtyQmstJvHA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_023331_441528_60020838 
X-CRM114-Status: GOOD (  18.20  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Simon,

在 2026/03/10 星期二 16:48, Simon Xue 写道:
> The driver currently uses a global rk_ops pointer, forcing all IOMMU
> instances to share the same operations. This restricts the driver from
> supporting SoCs that might integrate different versions of IOMMU hardware.
> 
> Since the IOMMU framework passes the master device information to
> iommu_paging_domain_alloc(), the global variable is no longer needed.
> 
> Fix this by moving rk_ops into struct rk_iommu and struct rk_iommu_domain.
> Initialize it per-device during probe via of_device_get_match_data(),
> and replace all global references with the instance-specific pointers.
> 
> Signed-off-by: Simon Xue <xxm@rock-chips.com>
> ---

...

>   					 SPAGE_SIZE, DMA_TO_DEVICE);
> @@ -1212,15 +1215,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   	iommu->num_mmu = 0;
>   
>   	ops = of_device_get_match_data(dev);

Could you remove this one-time-used ops variable and use iommu->rk_ops
directly. The other parts make sense to me.

> -	if (!rk_ops)
> -		rk_ops = ops;
> -
> -	/*
> -	 * That should not happen unless different versions of the
> -	 * hardware block are embedded the same SoC
> -	 */
> -	if (WARN_ON(rk_ops != ops))
> -		return -EINVAL;
> +	iommu->rk_ops = ops;
>   
>   	iommu->bases = devm_kcalloc(dev, num_res, sizeof(*iommu->bases),
>   				    GFP_KERNEL);
> @@ -1286,7 +1281,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   			goto err_pm_disable;
>   	}
>   
> -	dma_set_mask_and_coherent(dev, rk_ops->dma_bit_mask);
> +	dma_set_mask_and_coherent(dev, iommu->rk_ops->dma_bit_mask);
>   
>   	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
>   	if (err)
> 

