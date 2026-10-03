Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB03CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+FUoa7O6EqJD1Y05Er2fK+U4nTQNlxggxHHVkGMPXA=; b=DCnm/ZsmxnMVuNOSLNSAaSY07O
	7aQGbO7AdnNv9uPxOG//Iy/tOdbDnrmS9dSTvGS4Vdh0gA/JxkilHuhfBONz+z2YVfhmGiEP3ERHZ
	2coJiSlaKrKjZm7oq3c6MtxqZaJZkAt3NwzGBMm3xb6v5K7qBQueOBvl/eqz3Q+OQahdpG7me7sh8
	ef3LvbtcIE/E6WTonwJiwR1ZN0Em3yvaJt6r+OAGIZonbpCwUjpUu3eUbbPJfl3qk4a4kYpBzWiB8
	ur4WG40FAJDd/hSBCEPSaE9UBsw1sE3JKQIyXkO5IXhMU0/7q3ql8G5BTrHM/LN0zLfVZxql9hrfU
	UfqTLSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwCY-0000000DINc-0ceX;
	Sat, 03 Oct 2026 09:38:42 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwCU-0000000DILX-2PLE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:38:39 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so7434115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020317; x=1791625117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+FUoa7O6EqJD1Y05Er2fK+U4nTQNlxggxHHVkGMPXA=;
        b=l/p8z3JpzLpzsehfp9cM24Ln3lB/ea1jFDHR2RcOQ/eAmaito8Au0gxvWk5+I8hO+x
         e5LItaDbT3fFUEhc74jE/zHKpXjwH3jjhf+ROb1a5ShjRAxeUI2rNU9+ZbhwmplWRc2X
         04d5OH+9fcGWI7jB5gdrQaEdKCraINkLppkG2Pr/n2IPEbzJp7vRr2ioCBWyLsAkKr4U
         Oa8zWFnweRGoZ7QL50BSViitycVDb9TmKgVr0n/zZ0a1BN0gqzdl2ZVl8z7TcL0tOHyj
         nIovkda3iX4YB9ij9chaSwcDGYY4wRp706ESjYaYCVPASTDJ50tfcjmqB26v6w3wUt/u
         whFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020317; x=1791625117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+FUoa7O6EqJD1Y05Er2fK+U4nTQNlxggxHHVkGMPXA=;
        b=HT4yAkulqZ8bd0Ok23CerpWBeqOLLkg9p3g4JFQvox6WRSFxHrS61hCoP9LLMrWvKt
         xJ/mE7S8Nt60ZRQLXGQqeiegAOqOunUnNXL+g2T38kGq4qYWZZSK+vgZwQReJCA+lpEL
         Rm+gAmQ+lyf/tVVsgl0yyObMSHjWo7RWmKX8mODo4p3fmkzaVKoC3WXSuIqzhfMxf1w3
         EEP4IZoDxRFfb93QnJxDDPd1JwXzc3Qzeuqti1CCGCcSU32B3sdsmR7bQqpmiWdqAenv
         XqhiJ4AObFzudlD+xWtz1JqzgNOqb1ec0ED6/4LMmeiImpEtFyxwyTDft0jChoAliBLN
         1mtA==
X-Forwarded-Encrypted: i=1; AKwUvByu4m54w2HPOR/9qK2DEss9hLwjDx85v1U2HV7AqgkRCK3tehz6ebsPo1w5Vg5yWye3pBqz15gV4QkrvppUJLHt@lists.infradead.org
X-Gm-Message-State: AFuF++mQ9DL2n1GuVYIjayB7uvzja0on1iEcYoxlwlrAp901QT5zi0ef
	a1Dqk7tSRYZupXPdPqnbHLtNkxSXyqFbwVtFIaNiZ/ppO35CgqphOdfe
X-Gm-Gg: AYBFou0L8FkpTaNWB1I2jWxJpm9OruM2jD/wD6VpJUxoAz46D9yMs49BRIz1iSxo1/N
	B0XBmL0hFW8j4hfB/E1qzIti8XQ1eXqQgTEC4vspTMPIoTUwbO0tkVRoA/LDI5ByqeseFD4H2OQ
	QuX5s49w/VmFH9ky1WWvflO+oTVBolRBXdx72tPfjdjQzV2E/WnEZ6H5wc7ceiLVDKfd8Yjy9hf
	G3r8Wx9C6NtGysNv7WHIA8ZN51D98lmEF1TsK++58we0qh1g5n1KsDCiOL84qW9K6pJ57MWMuyY
	pAR6EVa72qqRd7WhDbNqIPNGoTTlZq1h9Sj/Gi87/5XFSthTVMXxILau1Sh971igU/MTRaqqAX+
	lDcjQPrgDuU4WzcN5EJI4434QU7vdTbF3JpYmoGltM3c5tCi80g3vSWel61YRy3I6yoqb1ErKub
	TGaEyFqXLSBZAEKjll0GDev1AfW8NFaMgHIZVZMzEq4tkgjU/gols4aCu1HL4azsZo9qjao6yLU
	HEH+OXLRUo8BfxWnT+IjO0fLnYS3ZJz10YGoeJZBY2i6rvcxDINrVSUrMiE/gNbLQyzR899gKVz
	q4KsnvAtlsJyAuxWV7zAs5JxGT5+SPXgPB2npr+uP8IKsp6JIwYZdEh0acQZyPbZyzXyxZZuYvv
	GF0gCfo4=
X-Received: by 2002:a05:600c:46ca:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a0275790b7mr85076925e9.12.1791020316829;
        Sat, 03 Oct 2026 02:38:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm136528375e9.6.2026.10.03.02.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 02:38:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Date: Sat,  3 Oct 2026 11:38:27 +0200
Message-Id: <20261003093827.77857-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261003093827.77857-1-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_023838_638199_1E1786C3 
X-CRM114-Status: GOOD (  16.02  )
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

HAVE_RUST is currently selected for CPU_32v7 only. The
arm-unknown-linux-gnueabi target used for ARMv7 emits ARMv6
instructions (+v6), so it cannot be used for ARMv5. Use rustc's
built-in armv5te-unknown-linux-gnueabi target instead. It keeps the
Linux EABI (no short enums, unlike the -none-eabi targets) and is
soft-float and strict-align.

Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
lowest architecture and stay excluded. CPU_32v5 also covers the ARMv5T
ARM1020. C code is already built with -march=armv5te there, so Rust
matches.

The kernel crate implements atomics through the C helpers rather than
core::sync::atomic, so the missing atomic instructions on ARMv5 do not
matter. The only gap was the 2-byte xchg() added by "ARM: cmpxchg:
support 2-byte xchg() on pre-ARMv6 CPUs".

core::sync::atomic types up to 32 bits still compile on this target,
but LLVM lowers them to __sync_* libcalls which the kernel does not
provide. Nothing in the tree uses them. Such code would fail to link
on ARMv5 while it links on ARMv7.

Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2
in QEMU versatilepb and on a Microchip SAM9X75 Curiosity board (both
ARM926EJ-S). The Rust samples, all Rust KUnit suites and the doctests
pass.

Link: https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
Link: https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Makefile                   | 4 ++++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 4f980815e92a..2193d8e1e156 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv7 Little Endian only.
+``arm``        Maintained        ARMv5TE and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ffbc7f386131..f6b14d9f0e1f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && (CPU_32v7 || (CPU_32v5 && !CPU_32v4T && !CPU_32v4)) && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77..ef94eae1f047 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -150,7 +150,11 @@ endif
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
 KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
+ifdef CONFIG_CPU_32v5
+KBUILD_RUSTFLAGS += --target=armv5te-unknown-linux-gnueabi
+else
 KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
+endif
 
 CHECKFLAGS	+= -D__arm__
 
-- 
2.39.5 (Apple Git-154)


