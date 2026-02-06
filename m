Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAB8EE6B43
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjyxBPWvNeeTih9VYn48iujO3DcdrnxYvwtSX0++FbY=; b=t+uB5pLgsfRRCWHsajwYUk9wGl
	MFrbuzhn8DmpJKzUyffjMAAXWxa6yZ5RKEOh+nTKyxeKs9ljfSIIjpfMwQrNU9ZG2cIx9885rDdu8
	URHuW7iMENqTRv3x5PaUguwiiG6AOCEc5KTS49gWcUGD4dpNTKzvJZZSU4nrjV5P9UwcrGqS+mOUD
	ac1S7Q7CrJVkwyn7kRM1ItJpyRK80qQ8MDzQzd6ZFmMU5kjufAVA8uf+HIFAX/3lNpgTZ7yD1NmUH
	3B3KtT4seq0dDhCU0tp8soQ47Uj/gEBeDlLCS+m1vvcdYxF3iDCwzyF2eKut8hviaIRyztqImWuzE
	QuuJHwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPkb-0000000Bd7J-2AMo;
	Fri, 06 Feb 2026 17:36:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPkY-0000000Bd6M-158Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 17:36:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D352339;
	Fri,  6 Feb 2026 09:36:01 -0800 (PST)
Received: from [10.57.54.83] (unknown [10.57.54.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DB4E3F778;
	Fri,  6 Feb 2026 09:36:06 -0800 (PST)
Message-ID: <9c15f736-9737-400f-a757-2640d07ba551@arm.com>
Date: Fri, 6 Feb 2026 17:36:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Restrict MMU-700 errata 2268618 and
 2812531 to affected
To: Zhiyuan Dai <daizhiyuan@phytium.com.cn>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260206-smmuv3-v2-1-f381a2125392@phytium.com.cn>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260206-smmuv3-v2-1-f381a2125392@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_093610_361321_4A954B96 
X-CRM114-Status: GOOD (  16.08  )
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

On 2026-02-06 8:18 am, Zhiyuan Dai wrote:
> According to SDEN-1786925, Arm errata 2268618 and 2812531 are present in
> r0p0, r0p1, and r1p0, and fixed in r1p1.
> 
> Introduce this patch to avoid performance degradation caused by
> restricting features on unaffected revisions.
> 
> Signed-off-by: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
> ---
> Changelog:
> - Change the revision threshold from < 0 to < 1 to correctly.
> - Link to v1: https://lore.kernel.org/linux-iommu/3f22f7b8-449c-40d9-b4c8-fff3e520d563@arm.com/raw
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..d5c35be5c858 100644
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
> +			if (variant <= 1 && revision < 1) {

This still breaks r0p1, and you've not addressed the other point I made...

I've now dug up the old branch where I started my own patch (back in May 
2024, yikes!), and gone through the newer errata for MMU-700 plus the 
newer MMU S3 and MMU L1 products that have also inherited some of its 
bugs - I'll finish writing up a cover letter for that and share it on 
Monday.

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
> 
> ---
> base-commit: b7ff7151e653aa296ab6c5495b2c1ab7c21eb250
> change-id: 20260206-smmuv3-a88772377c20
> 
> Best regards,


