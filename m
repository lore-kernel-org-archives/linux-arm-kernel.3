Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A453ECD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 21:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQ/ggcBcEh5IdD7UgK2xAanxGYnpsj//J2HtyG47oGI=; b=tstovoTQAivb44GBhdkge8qTFg
	h72vLcjSX3I7x0euSCVA7ueg4Gr/T/Otb62lrNnK5bhgR7/NPy1T1pC0J5rc/Rr2z0/4bbzVKhM1q
	P6frWejK1wgI5TNTtDWr+Hj6pKzhrA6AsEEWAe8bRk8tQn+ot4nr9YpdwWcNyb25a0njyj3WDVfdP
	kY95tHcryuvILxvrDGyLYg6IWG87C8CBjkqtXzjAVwRoGaE/8zNL8X9/xdICSL6SaMDsnmPdH1Agw
	Mo6/Fq5JckzntGdiboqme5fM40F1Jx5lViF/sxMDL6mpWkjryNx99wP6U8EReoljkLQycVukn5H92
	ogsoVmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSM42-00000004lfD-0Xa9;
	Wed, 27 May 2026 21:45:22 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSM3v-00000004ldd-3r84
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 21:45:17 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-135de949041so11705144c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 14:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779918314; x=1780523114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ/ggcBcEh5IdD7UgK2xAanxGYnpsj//J2HtyG47oGI=;
        b=W5cyefYKyWYLyQjnrOBbIeJpASgPHm285m2t3chZ7phe5m5YDtY5NSW3MEqxYeASKs
         jwVFQk2Nm78Pj8TvkZSC1WCC20Z4FZuGA7JP3yOW4uqn7BjHHZsLtrtKDI5HBmggQsvH
         AIOH/tGtiip0/SkOtd8X9+VcOhLr7UeirSqbPvvQTt88cmVjQtWfty45rxQ3/eiW3yGg
         gOOHtpWUDsWBbzfaRGHDQDU9JoN1bYLaQG5Emi5nPds4ktR5lrjc7w4QmlF1Po6dMkZT
         dJ1fYcKXPTPpsRJpINjhBMM6RwDzCammP70K4YCAjiXjZraTGTK0m2nXQfzY/oJZoo5p
         q0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779918314; x=1780523114;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HQ/ggcBcEh5IdD7UgK2xAanxGYnpsj//J2HtyG47oGI=;
        b=Nrw0YVn2Xeg44oZlca7f1+M4Iaj+6v5nIGahyWi1z9kTXofekzdlOaOolv0i/0fSsq
         ENHERRF1VkKq+7DWIbBYzhvTaYg3Ic1pkcSqDiW0CWVDoVi47I3oWaTKITEdZGZyp1hb
         b21tSdVgjnAwjHZsyHdOjDe86uDz+0VZIPFuEWdRuQweUKh8QP0v/tnm42YpsYckfj9v
         dNCpYxLu6OPWpjN6eQnnP1a/xB/hPEn0n/kfe5dR4o8U1bDYXNPiTnajJr0hVBavCPzu
         a82WYV9MwwHsJp7yzuGB9aOKlwd7O9C+wUNHwe852xnW/zVdKvOeCLvT7RMH3+nXVyee
         7fEA==
X-Forwarded-Encrypted: i=1; AFNElJ+6SWYcM4w/pA5E7Rl+hq7hxOFLjOJWhpmhqV7m7Sm+HCuI57oaPBkEdZiPd6t0ZFHRy2tw/2+hkNQZgFtm2I/V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqg7rog2xTS/se/Ye90ifxtRfRjX6KbM56lNapS1nYLjMHEwSw
	QZ43LBhXddujW9q/qCmKE3fgRe0l5eKGHIy0CUvy/PDTBHWK5eApcVZJ11sBDuZQCjGxSQ==
X-Received: from dycoi4.prod.google.com ([2002:a05:7301:da84:b0:2ee:de47:cde3])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:cd99:b0:2e2:4979:ec7
 with SMTP id 5a478bee46e88-3044908e3demr10854479eec.10.1779918314266; Wed, 27
 May 2026 14:45:14 -0700 (PDT)
Date: Wed, 27 May 2026 14:45:08 -0700
In-Reply-To: <20260527214510.3907973-1-xur@google.com>
Mime-Version: 1.0
References: <20260527214510.3907973-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527214510.3907973-3-xur@google.com>
Subject: [PATCH v3 2/2] kconfig: Remove the architecture specific config for Propeller
From: xur@google.com
To: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Rong Xu <xur@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_144515_959562_080FAE81 
X-CRM114-Status: GOOD (  14.16  )
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

From: Rong Xu <xur@google.com>

The CONFIG_PROPELLER_CLANG option currently depends on
ARCH_SUPPORTS_PROPELLER_CLANG, but this dependency seems unnecessary.

Remove ARCH_SUPPORTS_PROPELLER_CLANG and allow users to control
Propeller builds solely through CONFIG_PROPELLER_CLANG. This simplifies
the kconfig and avoids potential confusion.

For arm64, change vmlinux.lds.S to ensure the .llvm_bb_addr_map is
explicitly placed within its own section.

Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Will Deacon <will@kernel.org>
Tested-by: Yabin Cui <yabinc@google.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/Kconfig                    | 4 ----
 arch/arm64/kernel/vmlinux.lds.S | 3 +++
 arch/x86/Kconfig                | 1 -
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e510c585ea84..e4eaca9c917c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -879,12 +879,8 @@ config AUTOFDO_CLANG
=20
 	  If unsure, say N.
=20
-config ARCH_SUPPORTS_PROPELLER_CLANG
-	bool
-
 config PROPELLER_CLANG
 	bool "Enable Clang's Propeller build"
-	depends on ARCH_SUPPORTS_PROPELLER_CLANG
 	depends on CC_IS_CLANG && CLANG_VERSION >=3D 190000
 	help
 	  This option enables Clang=E2=80=99s Propeller build. When the Propeller
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.ld=
s.S
index e1ac876200a3..44a42e7c66cf 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -368,6 +368,9 @@ SECTIONS
=20
 	STABS_DEBUG
 	DWARF_DEBUG
+#ifdef CONFIG_PROPELLER_CLANG
+        .llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
+#endif
 	MODINFO
 	ELF_DETAILS
=20
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 10bf3984102e..b875d2f27e48 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -130,7 +130,6 @@ config X86
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_RT
-	select ARCH_SUPPORTS_PROPELLER_CLANG    if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if X86_CX8
 	select ARCH_USE_MEMTEST
--=20
2.54.0.794.g4f17f83d09-goog


