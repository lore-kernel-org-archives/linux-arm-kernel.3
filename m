Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDB9C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 22:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMZY2rnPLYUjm4Au9yd8KB0DTNWhfRQzCwBMACGnhms=; b=Euuhf7MvRnQIw20i9XC3r4rhRQ
	lw17pVkIS1VRebnxUnp1mudbZOrKWju6Ek/i9pImAQQxfhbZvfOlcp43pjB5sek7E6PaKX2QwVh1k
	+rk9W4C2Kh4cEA+wgP4dyjMgqbZwZMNdS4c0NR9a+6QQp2eVybH4UsstFShw1dYC9KxirTyyNG3R4
	XqKV5GddJ3z0CN0k9nfH08bHLhJ27vy6X9jeVZdlv5gl9Trr8RHwMyBzDyOxgwBJcjpFsOOaKf2Lx
	/XqbtmPadarTjD2aW3HmroIra1jT/LCCMgQS4sE2vBuXquRDw+B6hZ5dTI3YZejBpmfPTBu5VQeex
	dTaNS2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDU7-00000009BlY-1w9Z;
	Mon, 02 Jun 2025 22:18:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDRr-00000009BNL-2loe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Jun 2025 22:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JMZY2rnPLYUjm4Au9yd8KB0DTNWhfRQzCwBMACGnhms=; b=mCADkBU304efHA+YSYWj97Hmjm
	lhd1BtJVtnC2nvC5xhthySS2hGL5v5WHri0y80jh1qEYi2zVbx79F5tajETpFOC7jOhlWHMpwHedE
	rc/neWhJo9PUzTu0BBHzM+o27bxmeDoSEBvmbXDjuBS+9eDHYsZ/+ppQJDcceDCEcJghQ/0ne84fG
	eXQjfplbmtXSgr2b+hn99jQS35kRyviuR9d/kPSHu8NcJ7Q6hGh/Uw9kRfr7TEANjiW5PzurJ1Wqc
	kVE7Og3j0B+vFoCG9H+e3lXyjS74KgpLEAbKa2kHQ27a9uyqtGtNPkJ0u/MlCRTAKUuRp411jZSU4
	fn4fMOKg==;
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDRo-00000000gNM-0035
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 22:16:02 +0000
Date: Mon, 2 Jun 2025 15:15:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748902554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JMZY2rnPLYUjm4Au9yd8KB0DTNWhfRQzCwBMACGnhms=;
	b=tTuEyZFtmo7HE+33x7wE6vP4kNqw4C28hL5Snm7XFixdKRD/GuN+jCSaDjmBjyhhfmyII/
	t4WMbe8NVBAKCO3jEiazPalCWz0BPsPaffibJBYMKTax2sR+h7vP8iL3XXjwZcQynvUciS
	IsFAYeIfl42ZZzeoAbwyCMO0XpbhIPk=
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
Subject: Re: [PATCH 01/17] arm64: cpufeature: Add cpucap for HPMN0
Message-ID: <aD4ijUaSGm9b2g5H@linux.dev>
References: <20250602192702.2125115-1-coltonlewis@google.com>
 <20250602192702.2125115-2-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602192702.2125115-2-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_231600_959295_413E0886 
X-CRM114-Status: GOOD (  19.24  )
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

Hi Colton,

On Mon, Jun 02, 2025 at 07:26:46PM +0000, Colton Lewis wrote:
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
> index a3da020f1d1c..578eea321a60 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -541,6 +541,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
>  };
>  
>  static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
>  	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
> @@ -2884,6 +2885,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
>  	},
> +	{
> +		.desc = "Hypervisor PMU Partitioning 0 Guest Counters",

nit: just use the the FEAT_xxx name for the description (i.e. "HPMN0").

Thanks,
Oliver

