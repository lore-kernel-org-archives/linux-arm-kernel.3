Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6695510775F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XJPBQgqMtZro3DWHw5JoH5gMLOofLHGSw4RgUHvUKk=; b=KkV0c2+CIPH90GaXwh4CoV4GI0
	eadV1gkd2TmThPnJ4QKKz1e4nllAjPzXf8Lk3qz8TwFMqA9oRHhtLdQK+B0hN7VIXH+cunXVdxuOH
	8WQI8hR7E9/JQ75FzOLVIP3p983ZVOtb+wfcfr7WCtOaslK3TkSyS8ojmodY+hBxDSJeZskKYZX6e
	SNz8ETbuaWuJbFXTCcshbhFpUX1JBR4YiJXUDGilgZIB88C9E6gb4S+RsFe3wI8tPHiQrOzBz1Gen
	A7cAZqo1y6bMMa3yPaITdJy2aS5U7aFiriWmY4VDJdBTzhj1EjRm/Nbf+I3Nc8qQcI3+g23b6KiQw
	4ZLXaJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uhv-000000094Wx-2VIh;
	Wed, 18 Mar 2026 17:29:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uhu-000000094WJ-05WR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11AC961119;
	Wed, 18 Mar 2026 17:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDE1C19421;
	Wed, 18 Mar 2026 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773854960;
	bh=OoWBoRjX5YwXNai1Ank9CYLDZQ6fMoAqcKmDftRaaRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dlpulkqYw6bC8ONGLy9by34iYHRu/Y+TJ5MBJvqO6oxkE9/DviOl3VCHswzNZJiXo
	 zbnNpdxWv0LupNNiR7h+8Gk8K3SjXAOLlz/rVcSCZTsVkYZZ1+9lvzoZjnT0583DGQ
	 k1eG6VdvmFin8kn6G3YJFlfPHSw1TuAfdZSNrF8jIWKiq3WNagwo3+mTmEfWPesxbu
	 Hp10+6quf1Sf05zvV7HfWSqarppnlqD32a3X/iObyes9hGSAkc0lcR82cGx/yhpWjQ
	 47ww32nHN9wPGdjPxldIsGojV6DZaduTDaZQ5K/MTTzM4ILhayW0C2aIRTqx8eXfqa
	 47HQZ2YLI8l6w==
Date: Wed, 18 Mar 2026 17:29:33 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 04/30] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
Message-ID: <20260318172933.GB2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-4-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-4-43f7683a0fb7@kernel.org>
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

On Fri, Mar 06, 2026 at 05:00:56PM +0000, Mark Brown wrote:
> As with SVE we can only virtualise SME vector lengths that are supported by
> all CPUs in the system, implement similar checks to those for SVE. Since
> unlike SVE there are no specific vector lengths that are architecturally
> required the handling is subtly different, we report a system where this
> happens with a maximum vector length of SME_VQ_INVALID.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/fpsimd.h |  2 ++
>  arch/arm64/kernel/fpsimd.c      | 21 ++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> index e97729aa3b2f..0cd8a866e844 100644
> --- a/arch/arm64/include/asm/fpsimd.h
> +++ b/arch/arm64/include/asm/fpsimd.h
> @@ -69,6 +69,8 @@ static inline void cpacr_restore(unsigned long cpacr)
>  #define ARCH_SVE_VQ_MAX ((ZCR_ELx_LEN_MASK >> ZCR_ELx_LEN_SHIFT) + 1)
>  #define SME_VQ_MAX	((SMCR_ELx_LEN_MASK >> SMCR_ELx_LEN_SHIFT) + 1)
>  
> +#define SME_VQ_INVALID	(SME_VQ_MAX + 1)
> +
>  struct task_struct;
>  
>  extern void fpsimd_save_state(struct user_fpsimd_state *state);
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 2af0e0c5b9f4..49c050ef6db9 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1218,7 +1218,8 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
>  void __init sme_setup(void)
>  {
>  	struct vl_info *info = &vl_info[ARM64_VEC_SME];
> -	int min_bit, max_bit;
> +	DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
> +	int min_bit, max_bit, b;
>  
>  	if (!system_supports_sme())
>  		return;
> @@ -1249,12 +1250,30 @@ void __init sme_setup(void)
>  	 */
>  	set_sme_default_vl(find_supported_vector_length(ARM64_VEC_SME, 32));
>  
> +	bitmap_andnot(tmp_map, info->vq_partial_map, info->vq_map,
> +		      SVE_VQ_MAX);
> +
> +	b = find_last_bit(tmp_map, SVE_VQ_MAX);
> +	if (b >= SVE_VQ_MAX)
> +		/* All VLs virtualisable */
> +		info->max_virtualisable_vl = sve_vl_from_vq(ARCH_SVE_VQ_MAX);
> +	else if (b == SVE_VQ_MAX - 1)
> +		/* No virtualisable VLs */
> +		info->max_virtualisable_vl = sve_vl_from_vq(SME_VQ_INVALID);
> +	else
> +		info->max_virtualisable_vl = sve_vl_from_vq(__bit_to_vq(b +  1));

nit: "b + 1"

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>

> +
>  	pr_info("SME: minimum available vector length %u bytes per vector\n",
>  		info->min_vl);
>  	pr_info("SME: maximum available vector length %u bytes per vector\n",
>  		info->max_vl);
>  	pr_info("SME: default vector length %u bytes per vector\n",
>  		get_sme_default_vl());
> +
> +	/* KVM decides whether to support mismatched systems. Just warn here: */
> +	if (info->max_virtualisable_vl < info->max_vl ||
> +	    info->max_virtualisable_vl == sve_vl_from_vq(SME_VQ_INVALID))
> +		pr_warn("SME: unvirtualisable vector lengths present\n");
>  }
>  
>  void sme_suspend_exit(void)
> 
> -- 
> 2.47.3
> 
> 

