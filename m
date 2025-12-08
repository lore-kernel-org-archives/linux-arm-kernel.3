Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A803FD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 02:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EX3r36Y3+GGh6sPJvDukpPQhyrwazsMSdsilDqqLyY=; b=vZ1Aw5vErYilKUpbwmSfAwG7ND
	w9DuSq3OzMiL9Kn9JhgtEvMfRC0rq8hfIHGu1x0MwvsWZeFXUp+Qmv6YQxlT3HyosBnGvydsluaFc
	4EJDQmOpNKD5lahx/ppppS/YN97q7IjIygRoqCf5+laM3mdiqRhcwvTTH0c1fj6KXQWqTsMHrXdma
	87CLs26ftwjQXGfObYngibbQ009XP5PSkhuPKwxokKZdtC/9I6CeijTlereMQ88DDC7zDsd1R3Y0X
	+/gFUEAIteSqns7xnkBTPKsv0eGFLLBNHqmL+m7heqEGnAJN2ZvZEUC7WOEl3W9tnap6rVLnCmzjp
	cecSRk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR4A-0000000CUMA-0LMr;
	Mon, 08 Dec 2025 02:33:34 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR45-0000000CUKV-3GfD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 02:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765161207; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/EX3r36Y3+GGh6sPJvDukpPQhyrwazsMSdsilDqqLyY=;
	b=BEvaFLOhn/zzifZ/2BcpNSgT/OI2iZMe6EHmS23kL33ImQvBHmdUzoJ9TTfD39rIJjLOeaQ3vLj1tOfvuVB6WTr5PDHI1+beGM/BDomgY7cJBVLGmRzbMEA583yz9SOHHkRTe0MMUaY+feAx/XWwR+pRmMeJfAaLsDtr99W9FoI=
Received: from 30.246.178.18(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WuF439A_1765161203 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 08 Dec 2025 10:33:24 +0800
Message-ID: <b4d96532-09b5-4162-8d9e-c41ca2baba0b@linux.alibaba.com>
Date: Mon, 8 Dec 2025 10:33:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc v2 2/4] iommu/arm-smmu-v3: Ignore STE MEV when
 computing the update sequence
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
 robin.murphy@arm.com
Cc: joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 skolothumtho@nvidia.com, praan@google.com
References: <cover.1765140287.git.nicolinc@nvidia.com>
 <08fd4d48e684732ad58064f690195f31a64979c4.1765140287.git.nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <08fd4d48e684732ad58064f690195f31a64979c4.1765140287.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_183330_116912_19DD826B 
X-CRM114-Status: GOOD (  17.06  )
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



在 2025/12/8 04:49, Nicolin Chen 写道:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Nested CD tables set the MEV bit to try to reduce multi-fault spamming on
> the hypervisor. Since MEV is in STE word 1 this causes a breaking update
> sequence that is not required and impacts real workloads.
> 
> For the purposes of STE updates the value of MEV doesn't matter, if it is
> set/cleared early or late it just results in a change to the fault reports
> that must be supported by the kernel anyhow. The spec says:
> 
>   Note: Software must expect, and be able to deal with, coalesced fault
>   records even when MEV == 0.
> 
> So ignore MEV when computing the update sequence to avoid creating a
> breaking update.
> 
> Fixes: da0c56520e88 ("iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e22c0890041b..3e161d8298d9 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1085,6 +1085,16 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
>   VISIBLE_IF_KUNIT
>   void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
>   {
> +	/*
> +	 * MEV does not meaningfully impact the operation of the HW, it only
> +	 * changes how many fault events are generated, thus we can ignore it
> +	 * when computing the ordering. The spec notes the device can act like
> +	 * MEV=1 anyhow:
> +	 *
> +	 *  Note: Software must expect, and be able to deal with, coalesced
> +	 *  fault records even when MEV == 0.
> +	 */
> +	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
>   }
>   EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_ignored);
>   


Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

