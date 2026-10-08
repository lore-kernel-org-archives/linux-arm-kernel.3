Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955DECA6002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 05:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMKKbcz+29LcMEVBUnKydYLylxMe84zHBke0K0F7tBw=; b=StRRpnnz4DzQVZCLny1qGkt03I
	W3VufrvgfDb/6Bm0j5w1YYBv+kIE9AB00ZqPMk2H1oxkjgdgz9/eGR4YbopzqBOJLNRoF/yqA9pl1
	wrRmwCrjqh5fjRy1U5mFUNeuPiGc2wHDhlFXlAIZambLsu1JkJGW9sK+0CZ+DM//Z5nmAgoJt6R61
	hJf5wc9OPrLkZqIQv7ZZrTUYTfMc443O0Jfg1/DmQXM+h0QQ8NrtAAeb9ZzAHUSP4ql/pJ65fZ1NV
	bRMjTAlAeANvO/VC5MezJYUaKlA9I7cnIKV5E/eJ8ieprKYvrqZX3JjObwwzau7wVUVFWaFrWZ5J5
	ro/dwSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpU-00000003YYG-2lzl;
	Thu, 08 Oct 2026 05:38:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpQ-00000003YVj-3jd9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:38:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso3903082f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437883; x=1792042683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMKKbcz+29LcMEVBUnKydYLylxMe84zHBke0K0F7tBw=;
        b=VfBOmhu9rDSIzzLCsABHxz4b5uolsNthzr/VH3uyuO/DQrLdgTy+BBORidpM5y3/FZ
         D08rxOCYJw5nSRQ02QfwkyInBidfH3zf0Tlbhj9f0InfnAKju3mP7I8n6MI8RoeKzeE2
         gPlW7EZ7oysCHOmCiuxZidBrxC9sONTtPf3883KVzy1nK9pli5Tk9Z5o0Y0KsCvA6tby
         sGDfSldLRmKzD6RqvesOUPW83AAHOGW02xi95TtQJklRDorO+EA7lOsYXkutq45gxwXJ
         Bk9JTcT4W3/m5OEwYAHJe18BND9bh/FGO4bCS+aQrDIJg5SnJTga/wLfsIDJuJCiXW9G
         duVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437883; x=1792042683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMKKbcz+29LcMEVBUnKydYLylxMe84zHBke0K0F7tBw=;
        b=TuGeFMB0r7/XaUgQwGrvkY1dfpkI7xW3SAHuPqGCShfXBYVyj+ekyGfmgAfrVqmhLO
         4Lsv7w5kXN5XyUY0GzjMaWw0hvXC+BNCfqUAd8FnuEOQpq+ADUorrRF5mhtiiI01F9pz
         OeyY5pQcBj4tRSjT4qytgxTW/rpUWBAnbMuvd/i2QZ848kcbs4l/oO6747/8JfwSCWkA
         G9flJU4Gk58VGRXajKTmCAYmLh51+4iMbQeGCP5kuP1RCF5IfYIUlA5AG2+1nuH8pv+d
         31pkNORxux/NI+idLp+eAdHCQqZiBaeTuDjXLxoZrVGJMeRgCCslVSjodjSX6QjE4ZQs
         lsBA==
X-Forwarded-Encrypted: i=1; AKwUvBzZZOb+wsVmvqz9F7a1Re+naXu+uv/Hb0Hm2tG+FqTjPbHINeyOedxfOLh6yy8JK8YaRjRMPN6L+eMXrGWp3+tT@lists.infradead.org
X-Gm-Message-State: AFq9FYKCxxUbXBUwJGylUVTgRollwj3FPPvvxj9igRytzLwmvq5yBveN
	j1JOmaS9UUIyQudA7Xtsp4AQ3bm6uQ6HYKBs0aQ0wdV1bu0CRcgh+hi2
X-Gm-Gg: AYBFou3LXB5XhsxL0i9hw/5fAMXfAellQX4NteROskqrh6tDADl7jV1sxbCrZh0OWvm
	rf1c5f6VEwzagcjf6Tx5d1SO2wFp9mmilQJLMLE28zSYIfoU8/aDV8GCxDcc/LKljFYjTYVrVZt
	gEScYuJTsOTGze7zb+tInBE4l2yy7ffmPNuxSJ0OSMiRIND+tH8rdhRR1+MeV7Bh89Liyjj1gfJ
	p6RT1GTWYJJ6KvbSqRrnAXTggNgpesUlrsYtqx3cgV00VDVzoUNBzul2bzDXqIsaL1/Q7mFlQu/
	1HCEowo4erd7g9QEe3bq3Tqgw4B/byRPllWLeXNSPfKT7Zsz+jNJZJCFenwjEf28oQj+GNzd+v7
	613wh23wqfXN84608KlzZMN6wOgELK/AkpV45trYygjwCvqKC4/d0XQCZWiW2YKkRVbSCCtNiKB
	o2aTgD003kbXZQg0A7OuyJDHXQe8EifTmp8dSgC1pnRCIqzC+X4fDiA7IwB0jP7xKqjZ4lJijwE
	3y5h9+dRFQWM2MMs4WN67oO1S8RhiG8BPv081imCFlRO2Mmncodio+QEqk16PRBbdNQRTR0P8QN
	5MVjN1Drh07D8psvcUf0shA3UZyyp6UtrOb0HLgdcTpq/aeSYrg4abj9mRzIRZkUq9NX+3EbWTJ
	fsGJt+/A=
X-Received: by 2002:a05:6000:46d9:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-48c7276a71amr5394670f8f.10.1791437883101;
        Wed, 07 Oct 2026 22:38:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:02 -0700 (PDT)
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
Subject: [PATCH v2 4/6] ARM: rust: Enable Rust support for ARMv5TE
Date: Thu,  8 Oct 2026 07:37:44 +0200
Message-Id: <20261008053746.49631-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_223804_967075_1B94ADF5 
X-CRM114-Status: GOOD (  21.85  )
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

The arm-unknown-linux-gnueabi target used so far has +v6 in its
feature list and emits ARMv6 instructions such as uxtb, uxth and rev.
It cannot be used for ARMv5.

-Ctarget-cpu does not help. It can add features but it does not remove
the +v6 of the target. libcore built with -Ctarget-cpu=arm926ej-s is
still ARMv6. Adding -Ctarget-feature=-v6 gives ARMv5TE code, but rustc
warns about an unstable feature on every invocation. The generic target
also declares 64-bit atomics, where the ARMv5 one declares 32 bit.

Use rustc's armv5te-unknown-linux-gnueabi target for CPU_32v5. It keeps
the Linux EABI (no short enums, unlike the -none-eabi targets) and is
soft-float and strict-align. The target is chosen next to the -march
option so that both follow the same CPU selection.

Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
lowest architecture and stay excluded here. CPU_32v5 also covers the
ARMv5T ARM1020. C code is already built with -march=armv5te there, so
Rust matches.

The kernel crate implements atomics through the C helpers rather than
core::sync::atomic, so the missing atomic instructions on ARMv5 do not
matter. The only gap was the 2-byte xchg() added by "ARM: cmpxchg:
support 2-byte xchg() on pre-ARMv6 CPUs".

core::sync::atomic types up to 32 bits still compile on this target,
but LLVM lowers them to __sync_* libcalls which the kernel does not
provide. Nothing in the tree uses them. Such code would fail to link
on ARMv5 while it links on ARMv7.

Tested in QEMU versatilepb (ARM926EJ-S) with versatile_defconfig. The
Rust samples, all Rust KUnit suites and the doctests pass with the
current and with the minimum tool versions. They also pass on a
Microchip SAM9X75 Curiosity board (ARM926EJ-S).

Link: https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
Link: https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 8 +++++++-
 arch/arm/Makefile                   | 7 ++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index bdc42a24bf30..d6d1bef44c8f 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
+``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b5816f28783a..9275a85f95e9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && ARM_RUST_TARGET && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
@@ -172,6 +172,12 @@ config ARM
 	  Europe.  There is an ARM Linux project with a web page at
 	  <http://www.arm.linux.org.uk/>.
 
+# The CPU selections for which rustc has a matching target
+config ARM_RUST_TARGET
+	def_bool y
+	depends on (CPU_32v6K && !CPU_V6) || \
+		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
 	help
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77..168779e9e93d 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,6 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
+# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
+# the +v6 of the generic target, so older CPUs need their own target.
+rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
 # testing for a specific architecture or later rather impossible.
@@ -150,7 +155,7 @@ endif
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
 KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
-KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
+KBUILD_RUSTFLAGS += --target=$(rust-target-y)
 
 CHECKFLAGS	+= -D__arm__
 
-- 
2.39.5 (Apple Git-154)


