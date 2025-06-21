Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64B0C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 00:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCQ8zfuNYckMQwi0qvUEsR7Le3lMOKXcVy5xk0DxTYA=; b=aIGPqLZ+MbVn8S22BQ8Em2m+G1
	lOeQkaJrO5WqgwPy6FCU+MBdiYEQlkWQ38+7KkeXHSiuWkYwA10Lz9AKM9ZB4qOW5bLPfX7Lf+nFF
	oRvbd/fj9GfW9qjz8k1TzMfgmEPbFXWNJ1rvDYJvVz+Hb5V/A30HEh75/6NbhIqK4BuQ/AEJ/VVyz
	zRpoihUEBJEePojs4tCDORLzVCUaKl4I0iq6v+UB13eWaCcPM5wmJhVrXN5/nWaM+Wn0eTcnn4DnH
	y+KNwk9z31Vt40zOriuoac37HPrzkgIQuBsUqtxMR6wHZ/QNvqyzDzFjBtqPCs1kn1xcWBh4Ic8uE
	W5rQ88Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSmOz-0000000Gsaj-0bkC;
	Sat, 21 Jun 2025 00:48:13 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSmLQ-0000000GsCN-3vlt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 00:44:34 +0000
Date: Fri, 20 Jun 2025 17:44:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750466669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yCQ8zfuNYckMQwi0qvUEsR7Le3lMOKXcVy5xk0DxTYA=;
	b=UZ/5ECnuGxQxLGkdlEVk5aN863gG4arF7YO8/7tQT2PR15Yom3lU3nhRIGghO8pVgcTkKp
	TKcxke9ArrcHNI70a7paWMs4pBKKKrKAbEQDXIak/UGnQARCQoas/eaBbznjs45wzybj7J
	f7oqDRxJ5PeJ0wwRzxTWPQ1SYlxg0V8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 01/23] arm64: cpufeature: Add cpucap for HPMN0
Message-ID: <aFYAXjzICzgmSyLI@linux.dev>
References: <20250620221326.1261128-1-coltonlewis@google.com>
 <20250620221326.1261128-2-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620221326.1261128-2-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_174433_178009_DF44F7D6 
X-CRM114-Status: GOOD (  19.34  )
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

On Fri, Jun 20, 2025 at 10:13:01PM +0000, Colton Lewis wrote:
> Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
> counters reserved for the guest.
> 
> This required changing HPMN0 to an UnsignedEnum in tools/sysreg
> because otherwise not all the appropriate macros are generated to add
> it to arm64_cpu_capabilities_arm64_features.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 8 ++++++++
>  arch/arm64/tools/cpucaps       | 1 +
>  arch/arm64/tools/sysreg        | 6 +++---
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index b34044e20128..278294fdc97d 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -548,6 +548,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
>  };
>  
>  static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
>  	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
> @@ -2896,6 +2897,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
>  	},
> +	{
> +		.desc = "Allow MDCR_EL2.HPMN = 0",

This feedback still stands...

		.desc = "HPMN0",

[*] https://lore.kernel.org/kvm/aD4ijUaSGm9b2g5H@linux.dev/

> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.capability = ARM64_HAS_HPMN0,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
> +	},
>  #ifdef CONFIG_ARM64_SME
>  	{
>  		.desc = "Scalable Matrix Extension",
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 10effd4cff6b..5b196ba21629 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -39,6 +39,7 @@ HAS_GIC_CPUIF_SYSREGS
>  HAS_GIC_PRIO_MASKING
>  HAS_GIC_PRIO_RELAXED_SYNC
>  HAS_HCR_NV1
> +HAS_HPMN0
>  HAS_HCX
>  HAS_LDAPR
>  HAS_LPA2
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 8a8cf6874298..d29742481754 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1531,9 +1531,9 @@ EndEnum
>  EndSysreg
>  
>  Sysreg	ID_AA64DFR0_EL1	3	0	0	5	0
> -Enum	63:60	HPMN0
> -	0b0000	UNPREDICTABLE
> -	0b0001	DEF
> +UnsignedEnum	63:60	HPMN0
> +	0b0000	NI
> +	0b0001	IMP
>  EndEnum
>  UnsignedEnum	59:56	ExtTrcBuff
>  	0b0000	NI
> -- 
> 2.50.0.714.g196bf9f422-goog
> 

