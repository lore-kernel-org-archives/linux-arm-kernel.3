Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB10EC1EB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+ENMmsbQH5qjcy7VG1F6v6lPgsi1c0fJYkiwX7xyMQ=; b=CZMCxhItt6FSOgo/i8LPGQFxT3
	gkGSEMAHJwCjpP9gbDVmnpO2VxVKpflVNEUtRvyDvvW3nt1zO1MfAhA5D/nj+b/GSvAEbQ7LNE3HJ
	HUq2sCpF/taxH2PLE+dpEsBQ28tuPSFAsLH77tY6cfuapA7+n98+2z33q6rot85aCMLQUX1aZ9lEP
	gp0rRUZTHbtAq0rlLTRTpASJ3YonRaHS9jFP2qcs9XpB/utsb81WplutlKLtv6zYjPI5fDLSWOHHj
	Mgiqyn/2kuNQUX041UrDAgONaNkCwOJ9omtvWrvXOE4eeyPCU0rpPRZKUBPZvMKRLCGDaFVdOa722
	gOCfbWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnz38-00000009vMn-1egB;
	Thu, 05 Feb 2026 13:05:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnz36-00000009vLp-05Lx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:05:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9112339;
	Thu,  5 Feb 2026 05:05:21 -0800 (PST)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FC983F778;
	Thu,  5 Feb 2026 05:05:26 -0800 (PST)
Message-ID: <3f22f7b8-449c-40d9-b4c8-fff3e520d563@arm.com>
Date: Thu, 5 Feb 2026 13:05:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Restrict MMU-700 errata 2268618 and
 2812531 to affected
To: Zhiyuan Dai <daizhiyuan@phytium.com.cn>, will@kernel.org, joro@8bytes.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260205093356.4328-1-daizhiyuan@phytium.com.cn>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260205093356.4328-1-daizhiyuan@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_050532_102847_D814DEB9 
X-CRM114-Status: GOOD (  17.59  )
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

On 05/02/2026 9:33 am, Zhiyuan Dai wrote:
> According to SDEN-1786925, Arm errata 2268618 and 2812531 are present in
> r0p0, r0p1, and r1p0, and fixed in r1p1.

This is a bit fiddly, since these workarounds also overlap some other 
errata that IIRC were *not* fixed in r1p1 - it's been on my to-do list 
to figure this out for a while now, sorry I haven't had a chance to get 
to it.

> Introduce this patch to avoid performance degradation caused by
> restricting features on unaffected revisions.

I'm curious, can you clarify the performance impact? At the time I was 
pretty sure that the ARM_SMMU_OPT_CMDQ_FORCE_SYNC was just for safety 
and never likely to be hit in practice, since with range invalidations 
any unmap should never end up with anywhere near 16 TLBIs in a single 
batch anyway. Is that no longer the case?

> Signed-off-by: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..7eadb27eb9be 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4272,11 +4272,13 @@ static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
>   				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
>   			break;
>   		case IIDR_PRODUCTID_ARM_MMU_700:
> -			/* Arm erratum 2812531 */
> -			smmu->features &= ~ARM_SMMU_FEAT_BTM;
> -			smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
> -			/* Arm errata 2268618, 2812531 */
> -			smmu->features &= ~ARM_SMMU_FEAT_NESTING;
> +			if (variant <= 1 && revision < 0) {

revision is unsigned, it cannot be < 0. This just breaks the workarounds 
entirely.

Thanks,
Robin.

> +				/* Arm erratum 2812531 */
> +				smmu->features &= ~ARM_SMMU_FEAT_BTM;
> +				smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
> +				/* Arm errata 2268618, 2812531 */
> +				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
> +			}
>   			break;
>   		}
>   		break;


