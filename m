Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45530CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhlZQtQGGH+o1PC9FG1bXh4bzpsQsyhDPSlIK1P1gUw=; b=qOCHbcdm2ZngKu9m7hCcqTe7tU
	BQOPYggCBDAzxlSz+sGe/yRceAqNxjaA7YB6WOwxv0usFrtt0r5JkU8HIUYm8ELtAzpjVBzpI58CJ
	kZQ/rYOtYKvPRvPt+sTgiOi4rOeHf988dSBnNvddfpIqUtlN+WvXvqTHeLau6GEdQbnL+7Sbgg7ld
	FQFOfcvbhnZgf9yqKsL8sDAX7UQYttoU8kbVYdkHgR0sZg39FAm+jJCzK3j1jQsv/qvqD9VAGpGDb
	7LqmVnbv4I1d0FFNYg4Epdr4Y6nSy50AsFlMyBRemkXN9CwMDS5T5Trwu8jkGKoJZJ5zHn6AXavho
	xPKOmBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOswn-000000006Fq-1hvQ;
	Fri, 28 Nov 2025 07:31:17 +0000
Received: from mail-m3281.qiye.163.com ([220.197.32.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOswk-000000006FG-4C1f;
	Fri, 28 Nov 2025 07:31:16 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b3cd4919;
	Fri, 28 Nov 2025 15:31:08 +0800 (GMT+08:00)
Message-ID: <7797ac67-6f57-409a-83c8-0ca21a2d2475@rock-chips.com>
Date: Fri, 28 Nov 2025 15:31:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/2] iommu/rockchip: Use devm_clk_bulk_get_all() to get
 multiple iface clock
To: Chaoyi Chen <kernel@airkyi.com>
References: <20251128071322.92-1-kernel@airkyi.com>
 <20251128071322.92-3-kernel@airkyi.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251128071322.92-3-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ac95f769b09cckunmc7305c7c6e1258
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUJDQ1ZIGkMfHkxJHh5PThlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Hah5/jGePtDDELU7fuGQKBjUJX4Xv8n9cmCZg6hdNhAIQyy4LLFccBZd+upwrE+eU0toqzG4hi1Li9+AkKdYVQ3r7vxE/4B3rbCMwOnMuKQz9GblxsL/s9SZTJlMMnlV1yCZdLWSHPdgXtjLc1xVs/94ztH64ZshQpxgWDfH+z0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=YhlZQtQGGH+o1PC9FG1bXh4bzpsQsyhDPSlIK1P1gUw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_233115_527652_95A1A9AB 
X-CRM114-Status: GOOD (  21.30  )
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

在 2025/11/28 星期五 15:13, Chaoyi Chen 写道:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The iommu found on RK3576 NPU and RK3576 RKVDEC contain 4 clock.
> 
> Just use devm_clk_bulk_get_all() to get all the clocks and use them.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Change comment.
> 
>   drivers/iommu/rockchip-iommu.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 0861dd469bd8..76f71fb679f8 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -93,11 +93,6 @@ struct rk_iommu_domain {
>   	struct iommu_domain domain;
>   };
>   
> -/* list of clocks required by IOMMU */
> -static const char * const rk_iommu_clocks[] = {
> -	"aclk", "iface",
> -};
> -
>   struct rk_iommu_ops {
>   	phys_addr_t (*pt_address)(u32 dte);
>   	u32 (*mk_dtentries)(dma_addr_t pt_dma);
> @@ -1236,25 +1231,18 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   	iommu->reset_disabled = device_property_read_bool(dev,
>   					"rockchip,disable-mmu-reset");
>   
> -	iommu->num_clocks = ARRAY_SIZE(rk_iommu_clocks);
> -	iommu->clocks = devm_kcalloc(iommu->dev, iommu->num_clocks,
> -				     sizeof(*iommu->clocks), GFP_KERNEL);
> -	if (!iommu->clocks)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < iommu->num_clocks; ++i)
> -		iommu->clocks[i].id = rk_iommu_clocks[i];
> -
>   	/*
>   	 * iommu clocks should be present for all new devices and devicetrees
>   	 * but there are older devicetrees without clocks out in the wild.
>   	 * So clocks as optional for the time being.
>   	 */
> -	err = devm_clk_bulk_get(iommu->dev, iommu->num_clocks, iommu->clocks);
> +	err = devm_clk_bulk_get_all(dev, &iommu->clocks);
>   	if (err == -ENOENT)
>   		iommu->num_clocks = 0;
> -	else if (err)
> +	else if (err < 0)
>   		return err;
> +	else
> +		iommu->num_clocks = err;
>   
>   	err = clk_bulk_prepare(iommu->num_clocks, iommu->clocks);
>   	if (err)


