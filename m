Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BECC44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbpOBSnI+9jiw78wxoX70+0gie2FdspusOSCLhj95eY=; b=DeHzjxKlzwmqFbqSOZnkVxWcj2
	hh+vNRgX6Q1nPWlp0HhkxLnS9oRc/X812Ls61FnRepXxYHlPimOr9dp2xjRYCuiY8Fp1M0HFCHqXL
	grr1ALwPEqghlJ1qyunELH3GF0MMsEUneK2roKp63fKnrhOwGqQQH4Ur/JZZOtNap+KMe0s7vA6UA
	2uER8HXEW9XdiRAuy97FXWmCCKogd0FG8F9Y7NiceOJHaXafjK8d++w/0aYiXbk/eJFajAygkFbcY
	xUhK3Op4DDQizVDIDKkYmchNAteSRZlBl4Hr1mX963AuZveCGYrSDHIAjDDjTW3RJAQN13AAGo+Tq
	UtU1PXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfc0-00000001w8K-2osT;
	Fri, 17 Jul 2026 10:16:08 +0000
Received: from mail-m8232.xmail.ntesmail.com ([156.224.82.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfbw-00000001w7L-1vKP;
	Fri, 17 Jul 2026 10:16:06 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 46967b36d;
	Fri, 17 Jul 2026 18:15:57 +0800 (GMT+08:00)
Message-ID: <b7d71a44-eb65-4b09-a378-225249276f65@rock-chips.com>
Date: Fri, 17 Jul 2026 18:15:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/9] iommu/rockchip: skip orphaned-fault banks in
 rk_iommu_is_stall_active
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
 p.zabel@pengutronix.de, ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260717085220.3212274-1-gahing@gahingwoo.com>
 <20260717085220.3212274-5-gahing@gahingwoo.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260717085220.3212274-5-gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f6f9362c509dakunm876b5dc29bf1c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTk5KVk4YS0MZSENMThkYTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=VdF6lLYZgjTQ1SOh7jv+ryfjA6mqipmpMUmAjwk+RDgVhmEzKJ3Cq95QdQl9AS63aMdsMjNRbFXWQyp/Hn4Pl6t2XWyaDLxgNBVp0nU2wPlW/xYli1ENHs1EpboToGcm6hkQXFdJEVKn//ZJTPMTzs64Dl2n3ke9MRpInqb1YVU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=dbpOBSnI+9jiw78wxoX70+0gie2FdspusOSCLhj95eY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_031604_776945_569D55BF 
X-CRM114-Status: GOOD (  18.60  )
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

Hello Jiaxing, 

On 7/17/2026 4:50 PM, Jiaxing Hu wrote:
> Boot firmware can leave a PAGE_FAULT_ACTIVE condition in an IOMMU bank
> before the driver has configured paging.  Such a bank shows:
> 

I'm not sure what's happening here. Does this issue still occur when
you reset the MMU?

>   PAGE_FAULT_ACTIVE=1  STALL_ACTIVE=0  IDLE=1
> 
> rk_iommu_is_stall_active() sees STALL_ACTIVE=0 and reports the whole
> IOMMU as "not stalled", so any subsequent readx_poll_timeout() loop
> waiting for the stall to complete never sees a passing result even
> after the other banks have correctly entered stall mode.
> 
> Detect the orphaned-fault pattern (PAGE_FAULT_ACTIVE & !STALL_ACTIVE &
> IDLE) and skip those banks in the stall check.  They have no in-flight
> transaction, so they are already quiescent.
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/iommu/rockchip-iommu.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 0013cf196..f42ffcafb 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -378,9 +378,23 @@ static bool rk_iommu_is_stall_active(struct rk_iommu *iommu)
>  	bool active = true;
>  	int i;
>  
> -	for (i = 0; i < iommu->num_mmu; i++)
> -		active &= !!(rk_iommu_read(iommu->bases[i], RK_MMU_STATUS) &
> -					   RK_MMU_STATUS_STALL_ACTIVE);
> +	for (i = 0; i < iommu->num_mmu; i++) {
> +		u32 status = rk_iommu_read(iommu->bases[i], RK_MMU_STATUS);
> +
> +		/*
> +		 * A bank stuck with PAGE_FAULT_ACTIVE but without STALL_ACTIVE
> +		 * and with IDLE set has an orphaned fault left by firmware before
> +		 * paging was configured.  It cannot enter stall mode but has no
> +		 * transaction in flight, so it is already quiescent.  Skip it
> +		 * rather than treating it as "not stalled."
> +		 */
> +		if ((status & RK_MMU_STATUS_PAGE_FAULT_ACTIVE) &&
> +		    !(status & RK_MMU_STATUS_STALL_ACTIVE) &&
> +		    (status & RK_MMU_STATUS_IDLE))
> +			continue;
> +
> +		active &= !!(status & RK_MMU_STATUS_STALL_ACTIVE);
> +	}
>  
>  	return active;
>  }

-- 
Best, 
Chaoyi

