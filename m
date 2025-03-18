Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574DFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 18:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfGL4F0w2AaqjsJxXtj0FluPYAKV08hzUTKLQn1NlEQ=; b=shZPWcw256eRqYdhMPRGkOP/Tf
	OlmAiIZgUSB1qucIr2PaO0R1h5Bh6wQ3ZLS7X4ya7XnEf+sadT485zFSlH0hxiZQNzc54T/qLxlJ8
	vALJKFx7aIUaVtSYDJ2eL2C7y+zSn+8tuMrlaQYJ2wkIRIDyeRt4QnwRfe9BBibZHb/JjMfmgh2vi
	hzEGnCj51Go1p71urD1uiJjUXzpVpwSzLdtwslyARn6dTcQzPCoa9Lb6r1ejw5P7AuXlz0wypeG7Y
	8uYEF1Gm80RbyA5CTcwJyO4uvM7UlR3CGmMFBQ3QrTNtOZDs1nj0px+mDo4oDRqxdw1K5C35+nUa7
	hkJKSfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubtG-00000006pOj-48xP;
	Tue, 18 Mar 2025 18:42:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubrZ-00000006pHz-2UCL;
	Tue, 18 Mar 2025 18:40:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2726F13D5;
	Tue, 18 Mar 2025 11:40:37 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27BD03F694;
	Tue, 18 Mar 2025 11:40:22 -0700 (PDT)
Message-ID: <9bd56bd6-ce7d-495f-9bb3-ce7f07975f62@arm.com>
Date: Tue, 18 Mar 2025 18:40:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/rockchip: Add flush_iotlb_all ops
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>
References: <20250318152049.14781-1-detlev.casanova@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250318152049.14781-1-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_114029_722088_B1218D46 
X-CRM114-Status: GOOD (  27.59  )
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

On 18/03/2025 3:20 pm, Detlev Casanova wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> On some Rockchip cores (like the vdpu34x video decoder), the IOMMU device
> is inside the the device that uses it.
> 
> The IOMMU device can still be driven by the iommu driver, but when an
> error occurs in the main device (e.g. a decoding error that resets the
> decoder), the IOMMU device will also be reseted.
> In such situation, the IOMMU driver and the hardware are out of sync and
> IOMMU errors will start popping up.
> 
> To avoid that, add a flush_iotlb_all function that will let the main drivers
> (e.g. rkvdec) tell the IOMMU driver to write all its cached mappings into
> the IOMMU hardware when such an error occured.

Eww, this is the exact opposite of what flush_iotlb_all represents, and 
I really don't like the idea of the public IOMMU API being abused for 
inter-driver communication. Please have some kind of proper reset 
notifier mechanism - in fact with runtime PM could you not already 
invoke a suspend/resume cycle via the device links? AFAICS it would also 
work to attach to a different domain then switch back again. Or at worst 
just export a public interface for the other driver to invoke 
rk_iommu_resume() directly. Just don't hide it in something completely 
inappropriate - I mean, consider if someone wants to implement 
IOMMU_CAP_DEFERRED_FLUSH support here in future...

Thanks,
Robin.

> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   drivers/iommu/rockchip-iommu.c | 45 ++++++++++++++++++++++++++++++----
>   1 file changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 323cc665c357..7086716cb8fc 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -899,6 +899,40 @@ static size_t rk_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
>   	return unmap_size;
>   }
>   
> +static void rk_iommu_flush_iotlb_all(struct iommu_domain *domain)
> +{
> +	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
> +	struct list_head *pos;
> +	unsigned long flags;
> +	int i, ret;
> +
> +	spin_lock_irqsave(&rk_domain->iommus_lock, flags);
> +	list_for_each(pos, &rk_domain->iommus) {
> +		struct rk_iommu *iommu = list_entry(pos, struct rk_iommu, node);
> +
> +		ret = pm_runtime_get_if_in_use(iommu->dev);
> +		if (!ret || WARN_ON_ONCE(ret < 0))
> +			continue;
> +
> +		if (WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks)))
> +			continue;
> +
> +		rk_iommu_enable_stall(iommu);
> +		for (i = 0; i < iommu->num_mmu; i++) {
> +			rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR,
> +				rk_ops->mk_dtentries(rk_domain->dt_dma));
> +			rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE);
> +			rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
> +		}
> +		rk_iommu_enable_paging(iommu);
> +		rk_iommu_disable_stall(iommu);
> +
> +		clk_bulk_disable(iommu->num_clocks, iommu->clocks);
> +		pm_runtime_put(iommu->dev);
> +	}
> +	spin_unlock_irqrestore(&rk_domain->iommus_lock, flags);
> +}
> +
>   static struct rk_iommu *rk_iommu_from_dev(struct device *dev)
>   {
>   	struct rk_iommudata *data = dev_iommu_priv_get(dev);
> @@ -1172,11 +1206,12 @@ static const struct iommu_ops rk_iommu_ops = {
>   	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
>   	.of_xlate = rk_iommu_of_xlate,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
> -		.attach_dev	= rk_iommu_attach_device,
> -		.map_pages	= rk_iommu_map,
> -		.unmap_pages	= rk_iommu_unmap,
> -		.iova_to_phys	= rk_iommu_iova_to_phys,
> -		.free		= rk_iommu_domain_free,
> +		.attach_dev		= rk_iommu_attach_device,
> +		.map_pages		= rk_iommu_map,
> +		.unmap_pages		= rk_iommu_unmap,
> +		.flush_iotlb_all	= rk_iommu_flush_iotlb_all,
> +		.iova_to_phys		= rk_iommu_iova_to_phys,
> +		.free			= rk_iommu_domain_free,
>   	}
>   };
>   

