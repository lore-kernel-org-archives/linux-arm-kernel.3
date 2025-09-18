Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31063CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9S9kop3F/oxrwW55hOl1x+H/R8lAwoyDUtoI3GcQWU=; b=qB/NIoTZlkebfAzkRcMY8TeNF2
	3Lx/BluNfspEEukGikNATHlqC4cElitIXQ/pnbAjyt2xb+j4tMxhuthqgVweHKEuDpNychmn85q46
	cpTZMSSwDvUrZPTJbX514TJDjruA7B0GDD78wUyTLJj9lIklx7NzxI+oPvLJmMxyfoxQj+I7wIRJM
	RjXyyFnm3QjI6dFr8VDH5od9Cdgh1nlQF3RG/on25aDMgRBH287Wjk4hTwzJAv/0cqMYOAZFb+aRK
	Wog5791OD5nNtgn217CP0KxHVeezsKZWaCPCro8HjD3NI6RAqUjCF0tGXLuLok0VuksZJekTIOFM4
	oLtDwh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDGc-0000000HIof-13PM;
	Thu, 18 Sep 2025 11:57:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDGa-0000000HInc-3OyA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A2D460211
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE710C4CEFC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196655;
	bh=QnCGG1F/hqyhQaGreicIO5t9aXuxNFzDWO6EGQXut+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L5hKn77iLZnqH2V8qLIMIipq7e2jhxcKM2rUX/sebVosDrQZLHFeBCjxk/cfX2H5y
	 /QWfVKJ1ilXILb+r95fj6GmtOaICVSj39OQOORutfLLdSMudLcJWp+M/yy17UJE73s
	 l9fB5hXNQguBHpNXprZNNrusoXaO8tbTr1LJdP+Wde0Pd5kEofQNq5Exrr5QHq7iGn
	 c9Qi4ERaTz79nzOaSPtEHKWq6zCkpJp67bMiXwi3+pxosnrqdOeaIs4CcLyAon9ot5
	 B+cv1w9BHDMYpdQEW1uaxPiQNkES+oVZZAZ5IMbqEX1f8VYQDNa0RT+7HcLPSeE750
	 bdguiUEvr/odg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57933d3e498so569007e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 04:57:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsGoV5SWUaN3hzp5/QPKlkPS8hCzauQkILF8tfxPV7qT6v4fFgmdycj03bdm+EJQFl/Uzd6bgi258V4nKcfpEw@lists.infradead.org
X-Gm-Message-State: AOJu0YzvKcr/yNsLFVQDzbeIAO/b1pRlkoG3jM7lLmNuOLxuSDsWn2qN
	iBqSTnY2FMplM8C6FPEaZHPJGXo1Ywejox9rs8bIpmp38X9MzsFYHkmoNM1f1jG/wVTvODFnEtD
	rponBM8177B1Sv1kvLW0TTc6/harTS+w=
X-Google-Smtp-Source: AGHT+IHYPtDHABOS+XktnkbTA9g5LgHepKlyYBaYIJE5P4XpCc/WpYv7sbOdTy9UHPafSUFpUFHKJcQW3E4vVmbVLVU=
X-Received: by 2002:a05:6512:3b8e:b0:577:9ee:7d55 with SMTP id
 2adb3069b0e04-577999d49c0mr2000638e87.28.1758196654077; Thu, 18 Sep 2025
 04:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com> <20250918103010.2973462-15-ardb+git@google.com>
In-Reply-To: <20250918103010.2973462-15-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 18 Sep 2025 13:57:22 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE+hvMQLU6UF3QvTyo9Y1eUjCnPcPnMU9bOe4FDZ-N+EQ@mail.gmail.com>
X-Gm-Features: AS18NWArWnMLbH2kRQX7johssD9UyrnwA4cP-veatvN2_G57llXGRNMEAsjOnCY
Message-ID: <CAMj1kXE+hvMQLU6UF3QvTyo9Y1eUjCnPcPnMU9bOe4FDZ-N+EQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] arm64/fpsimd: Drop special handling for EFI
 runtime services
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 18 Sept 2025 at 12:30, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Now that the use of kernel mode FP/SIMD is generally permitted when IRQs
> are disabled, the only purpose served by the EFI-specific fallback code
> in fpsimd.c is the case where an EFI call occurs from hardirq or NMI
> context. No such cases are known to occur in practice, and it is
> doubtful whether calling into the EFI firmware for any reason under such
> conditions would be a good idea to begin with.
>
> So disallow EFI runtime services in such cases. This means all the
> fallback code can be dropped.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/fpsimd.h |   4 -
>  arch/arm64/kernel/efi.c         |   8 +-
>  arch/arm64/kernel/fpsimd.c      | 121 --------------------
>  3 files changed, 6 insertions(+), 127 deletions(-)
>

This patch is incomplete, the following needs to be folded in as well:

 arch/arm64/kernel/fpsimd.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e543dd569bd7..c846161a002b 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -180,13 +180,6 @@
        set_default_vl(ARM64_VEC_SVE, val);
 }

-static u8 *efi_sve_state;
-
-#else /* ! CONFIG_ARM64_SVE */
-
-/* Dummy declaration for code that will be optimised out: */
-extern u8 *efi_sve_state;
-
 #endif /* ! CONFIG_ARM64_SVE */

 #ifdef CONFIG_ARM64_SME
@@ -1086,36 +1079,6 @@
        return 0;
 }

-static void __init sve_efi_setup(void)
-{
-       int max_vl = 0;
-       int i;
-
-       if (!IS_ENABLED(CONFIG_EFI))
-               return;
-
-       for (i = 0; i < ARRAY_SIZE(vl_info); i++)
-               max_vl = max(vl_info[i].max_vl, max_vl);
-
-       /*
-        * alloc_percpu() warns and prints a backtrace if this goes wrong.
-        * This is evidence of a crippled system and we are returning void,
-        * so no attempt is made to handle this situation here.
-        */
-       if (!sve_vl_valid(max_vl))
-               goto fail;
-
-       efi_sve_state = kmalloc(SVE_SIG_REGS_SIZE(sve_vq_from_vl(max_vl)),
-                               GFP_KERNEL);
-       if (!efi_sve_state)
-               goto fail;
-
-       return;
-
-fail:
-       panic("Cannot allocate memory for EFI SVE save/restore");
-}
-
 void cpu_enable_sve(const struct arm64_cpu_capabilities *__always_unused p)
 {
        write_sysreg(read_sysreg(CPACR_EL1) | CPACR_EL1_ZEN_EL1EN, CPACR_EL1);
@@ -1176,8 +1139,6 @@
        if (sve_max_virtualisable_vl() < sve_max_vl())
                pr_warn("%s: unvirtualisable vector lengths present\n",
                        info->name);
-
-       sve_efi_setup();
 }

 /*

