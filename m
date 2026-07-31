Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25BAC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+qGFmMCXxXQZUlVzsydvaIqjrBJVb6+5+UuTkV7tvA=; b=o+lOgJE1C1w9N0dDj94EVdiB05
	O9xyB6EhkxrZTfL1A31XYR5cCLiJPBep8UnEgDWrI5RVGKAZf3K5TO2u6JiZHPgg9Wvh9BvQKz4DA
	0Mkc9cFANjKXsDZhTGYtEXauvKmVzn//oDYy8kHdqD7mm1isBW/gwJ3mVTuIo5YC5cxTLYcN+rBLY
	whnnF9189+QD4HfNw7IZK7eSV9ZC839Nlbnu0o0BUtoeWRusepCGjTlKiVqLkUI4fEWmZYybrLPMd
	4xTUCLMv9QOt7oioKSKz6Ampd7oxLaRHGg72gQNrUletvRHaCK6/TQpSA893E9zFI9bJlkXqbWNLt
	DoPsAz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoTR-0000000Cnzn-3vcZ;
	Fri, 31 Jul 2026 14:44:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoS2-0000000Cmd9-1eE3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:43:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D71A741917;
	Fri, 31 Jul 2026 14:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A271F000E9;
	Fri, 31 Jul 2026 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785508985;
	bh=9+qGFmMCXxXQZUlVzsydvaIqjrBJVb6+5+UuTkV7tvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TZIl3IsXiSU+hgVXvm1gocGrPNPPEgz0n3o7mA/lxvs9aBT09pIYUytCvkHUd2cmv
	 fee5TXMLe0SV1LKGw0GitCNzyAowetwG5lc1gRlm3w7+d5q+470L0XrneX0SLckVx7
	 ELPswYs/7Y/pSSsrRRAbzexJu8x/1AKhNtFBsL/Lk3W89xgD1dL5cVT6YB0MZBciYT
	 2zsJZjuqrAcqlmBKDvJMMawaWEBsJM6xv4NGR8Z7hz3qTaSV0CZTFFWpfcKjTU1QPn
	 lB10Ebt5/DuJ953OG5T+/T5Kmk4Uvo/8BIC4IVATvEJ86ghWB541erc0mzccbyg4eS
	 EroTjBT+69CvA==
Date: Fri, 31 Jul 2026 15:43:01 +0100
From: Will Deacon <will@kernel.org>
To: Aman Priyadarshi <amanp@apple.com>
Cc: catalin.marinas@arm.com, Jason@zx2c4.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: archrandom: avoid trapping ID register read in
 __cpu_has_rng()
Message-ID: <amy0dVzgY-uPTTtU@google.com>
References: <20260720140615.99343-1-amanp@apple.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720140615.99343-1-amanp@apple.com>
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

Hi Aman,

On Mon, Jul 20, 2026 at 03:06:15PM +0100, Aman Priyadarshi wrote:
> __cpu_has_rng() has an early-boot fallback, taken before the
> ARM64_HAS_RNG alternative is patched, that calls
> this_cpu_has_cap(ARM64_HAS_RNG). With SCOPE_LOCAL_CPU that resolves the
> capability by reading ID_AA64ISAR0_EL1 directly from hardware via
> __read_sysreg_by_encoding(), on every invocation.
> 
> Until the CRNG is seeded, crng_make_state() routes every get_random_*()
> through extract_entropy(), which drains architectural entropy via
> arch_get_random_seed_longs()/arch_get_random_longs() and so calls
> __cpu_has_rng() several times per request. On a direct (non-EFI) boot
> there is no bootloader seed, so the CRNG stays unseeded for much of
> boot and essentially every early randomness consumer takes this path.
> 
> Under virtualization this is costly: the hypervisor traps guest
> accesses to the ID registers (HCR_EL2.TID3), making each read a vmexit,
> producing ~200k trapped ID_AA64ISAR0_EL1 reads during boot.
> 
> The register value is invariant, so read the sanitised feature register
> instead. read_sanitised_ftr_reg() returns the cached value from
> arm64_ftr_regs[] with no sysreg access, and hence no trap. That array
> is populated by cpuinfo_store_boot_cpu() in smp_prepare_boot_cpu(),
> before the first early RNG use in random_init_early(), so it is always
> valid here.
> 
> With this change the trapped reads drop from ~200k to handful number of
> times, and the boot time drops roughly by 6.3% in the test environment.

Yikes, that's quite a compelling performance improvement.

> diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
> index 8babfbe31f95..8067e9a35641 100644
> --- a/arch/arm64/include/asm/archrandom.h
> +++ b/arch/arm64/include/asm/archrandom.h
> @@ -61,8 +61,22 @@ static inline bool __arm64_rndrrs(unsigned long *v)
>  
>  static __always_inline bool __cpu_has_rng(void)
>  {
> -	if (unlikely(!system_capabilities_finalized() && !preemptible()))
> -		return this_cpu_has_cap(ARM64_HAS_RNG);
> +	if (unlikely(!system_capabilities_finalized() && !preemptible())) {
> +		/*
> +		 * Until the ARM64_HAS_RNG alternative is patched we can't use
> +		 * the static-branch form, so consult the feature register
> +		 * directly. Don't use this_cpu_has_cap() here: it reads
> +		 * ID_AA64ISAR0_EL1 from hardware on every call, under
> +		 * virtualization each ID register read traps to the hypervisor
> +		 * (HCR_EL2.TID3) -- producing a storm of vmexits during boot.
> +		 * The sanitised value is cached in memory.
> +		 */
> +		u64 isar0 = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
> +
> +		return cpuid_feature_extract_unsigned_field(isar0,
> +				ID_AA64ISAR0_EL1_RNDR_SHIFT) >=
> +			ID_AA64ISAR0_EL1_RNDR_IMP;
> +	}

You can probably rewrite this a little more cleanly along the lines of
the (not even compile-tested) diff below. I was about to do that, but
then I got a bit confused by the whole thing. The preemptible() check is
presumably not needed if we're accessing the in-memory feature registers
rather than the per-CPU id registers, but then how do you handle races
with concurrent updates to the "safe value" made by CPUs concurrently
coming online?

Will

--->8

diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
index 8babfbe31f95..1c6ccc1776cd 100644
--- a/arch/arm64/include/asm/archrandom.h
+++ b/arch/arm64/include/asm/archrandom.h
@@ -61,8 +61,17 @@ static inline bool __arm64_rndrrs(unsigned long *v)

 static __always_inline bool __cpu_has_rng(void)
 {
-       if (unlikely(!system_capabilities_finalized() && !preemptible()))
-               return this_cpu_has_cap(ARM64_HAS_RNG);
+       if (unlikely(!system_capabilities_finalized() && !preemptible())) {
+               /*
+                * Query the in-memory sanitised value to avoid a potential
+                * trap when accessing the ID register under a hypervisor.
+                */
+               u64 isar0 = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
+               u64 rndr = SYS_FIELD_GET(ID_AA64ISAR0_EL1, RNDR, isar0);
+
+               return rndr >= ID_AA64ISAR0_EL1_RNDR_IMP;
+       }
+
        return alternative_has_cap_unlikely(ARM64_HAS_RNG);
 }

