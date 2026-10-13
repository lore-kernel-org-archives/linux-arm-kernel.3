Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D60FCC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTwlneqj3qr3pDNWamOjPtbvpbl/6xcVvo91j7W6eTk=; b=1Mr+XzgY/uleUynw2sv7x/gv9r
	XI3tKkmR6az+Wx7Nz8KUWr6rQ1CGflLY24RNgCSyrzG0EwZ8aKBzSSB8M6gmzdPamb2qcJcAcJwaY
	OPzt2lCab6nCUK4LPeMulE8qv3cZW8RCilT2MfRnNtEP7gMkdhRxY4MQlFIsLP3iedoM6nQjVIjpq
	CEAcS4R9OSjpngnYDuK8lCZO1cfhwwHM0GwUp8+08naZfjQYBUYeQhyrAbQJ9tb6P32AZGFni7lh6
	8KPFX5QPgqtVU9umhRuah4tm57ncMs4ppSy5ckUUamBvsLl/rK972h4FUMCU8NNHTYdBbj4+aIATA
	MlG9xB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAT-0000000E0VT-0VHF;
	Tue, 13 Oct 2026 20:32:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAQ-0000000E0U1-3ipY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:32:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so29460705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923529; x=1792528329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTwlneqj3qr3pDNWamOjPtbvpbl/6xcVvo91j7W6eTk=;
        b=Czk+NeGijUbJmdFfwr+glriXSivX389Prl9xx4kYLi5kHoDyy5U2j+UWbBFufui8aR
         UjIvE9/rVvVsVdYajh7KvDInf4A6RDYKxe7tEfVe5+Xc+OxsZUxwBQ8i5DJL9t2/vpYa
         WTSf76Iqus+MMJRZ0fu3+70q2AwhsFRIqSo+AbfDU1TCOR1ZORcPEa6f4dGWCmTe6N7Z
         LrjwfyfSv46aXC8s9Gf5T/ttqUtA4n30od0jFud3+MXA77Pq5DKMu8V8pJXUd/yVYaqo
         5TkdeqN/vmXcrPLnQ1D1XR56TFxi2EILtC4lq13xdqx84/oUE0CMqSHwtsu2wcQKFU6z
         5WCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923529; x=1792528329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTwlneqj3qr3pDNWamOjPtbvpbl/6xcVvo91j7W6eTk=;
        b=UxaWzGd+u6EX885LJl1a7G0yxedNiSAT7Kg8syAOkr5PiGcLf043QbBaicQzaZSQAp
         V4Lu/EyHiacT0Pyo3DxBxQFVez0+KkS2k+uOR9DxsvBFM4dd0OPUPNe7Nh6s4ytA/SjZ
         YO00OgR2DFEyZZCQ7bLGvLWILvib5JJq/hTClBIWMwQzDP3uB2Rzo22Y0rlo2l9MWs7L
         JL23cgIf72Z575ae3YcOQS6dLSicRmEaqlrCOsqMsbcvEiqgRCfbwtGl5x2mSUGuSNl1
         Q5vBV/YLtYEtwS+4o1HOZfSRaGQbf6bdN2GOFE01+9/s9/ntJgi5vMiWycm0/vQWDL4o
         d8Og==
X-Forwarded-Encrypted: i=1; AKwUvBwTek8nmvUjMlisF4ufCKtbOfgMtEXHMPyBzo8C9GWmB5kaizcYuzoL1y05hv9CJyWu+27st4tlpipWNw6QFahk@lists.infradead.org
X-Gm-Message-State: AFq9FYKVsHGreSGtjJUWc165jT0DeyKMyBEU5SNdJEfPVo9dqpYKaDEy
	BuhIj62bVhI3Xrv1zk4hCXAjFNPZBpNfndpbxp57SyTZIYSseCShhxsu
X-Gm-Gg: AYBFou1fMDOvnxO//HQHFzxG2XCSOg+7Nbj4flIwGbrVvIMcu17RZnk4OsQebi4Bl9q
	qEF1Wzip90JtCV705DSizQG/HxmKTPNPv1SHzFLZ5T/rD+RZKNJrR3ATyhLZTR2ouFm8dawtWC+
	/LgnUdPsileqnCMlSY/Kej6FlpejePqJILYAWAte23dt1/sZr+Wze8jYRYS8MKNY3MZAA+sDLF4
	dOe8VbXr8sGBnp3CGhE0Elts/iwOgMB1VD59Z+ej/5efVWeqe1Btij9s6UszOzjtCbrVVgT64Uf
	kUchInqFNHnyjbqHtgzsuYisLW+wRpDsceZflhJClLpUKsrjr7fsTagw0KQpAbcpHoxObB/zarT
	nzYRt348j1hQJK48fjryh5DN9ZIXetzhYnpjfAAvQ5qcoKQ5ksunuHeSN+zLWn5oWaICCHfL7RW
	B5qLmt3QSKAbJYxFJhBhjW9ju9omPjUJAnvkVKHjAbsS8MeqCo5wz3Oy0jtn/3LYbIugTCdH+iV
	PVJH5ZaPNUvLLJvfu69VvtYkGLxDOl/d/8v2EGlA36PxCCaqqMqytnQHkjK/7Iwxzef/WgEcBtF
	fulHgWUEYSyyCR1Vf6Bx8lQzFPITzF+4H6dMiTZnBm81ZL70K79Sm1zmtpHkbp6mqfUpMm11RsF
	Ke/I+3A==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr279439145e9.20.1791923528844;
        Tue, 13 Oct 2026 13:32:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:04 -0700 (PDT)
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
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] ARM: rust: Enable Rust support for ARMv5TE
Date: Tue, 13 Oct 2026 22:31:38 +0200
Message-Id: <20261013203140.31741-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_133210_963353_BF24CA3E 
X-CRM114-Status: GOOD (  16.49  )
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

The arm-unknown-linux-gnueabi target enables +v6 and emits instructions
that ARMv5 does not support. -Ctarget-cpu=arm926ej-s does not remove
+v6, while -Ctarget-feature=-v6 produces an unstable-feature warning.

Use armv5te-unknown-linux-gnueabi for CPU_32v5. It uses the Linux
soft-float EABI, requires strict alignment and declares 32-bit atomics.
Select it alongside -march so Rust and C follow the same CPU selection.
Kernels containing ARMv4 or ARMv4T CPUs remain excluded. CPU_32v5 also
covers ARM1020, for which C already uses -march=armv5te.

The kernel crate implements atomics through C helpers. The preceding
patch supplies the missing 2-byte xchg() on pre-ARMv6 CPUs.
core::sync::atomic remains unusable because LLVM lowers its operations
to __sync_* libcalls that the kernel does not provide. No in-tree code
uses them.

Tested the Rust samples, KUnit suites and doctests in QEMU versatilepb
with versatile_defconfig and on a Microchip SAM9X75 Curiosity board.

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


