Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEFACC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=; b=entCoiZMH83h7ROByMu9lNI/1K
	F/ahfaEBp8Vl21+jdXs+NBUuCtuPkE+mXrBMqpyku/AkKwp5gIlwQybv9tFSt/keseSANZxaoiV3G
	Zc2CRMndrUFJqB9aUn0KV6DZ1+enrtv1hxdid1r+itGSmAd1R933i0ZVhD2bQlmIqAVCpP4ll8dDW
	BPQyHE0Lk7+Xr8idVDOdEh6qRAD4U7cr4Njw3/k0cWO+2TT2DUWMHb/PBC1C1jegoEhc7fEWRqil5
	Sd/m5wJsUwC9ccN07HZPqQakT7vRgtNlJukvJqxEOEkcnAYVswOwMbGj+N09k4mccmXpY5nYJtq85
	DdtFKXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAd-0000000E0an-133h;
	Tue, 13 Oct 2026 20:32:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAZ-0000000E0YB-11ND
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:32:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so3707895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923537; x=1792528337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=i0JPp/bjVU5m3XR0JHWY16hrTiUwzkXrdlMvUxpi/kgi2BvxfnosRuDVEJLGOsUGV8
         rVqRPGWpfIBocQXbNLZhDaihsCnRtZyHqLAIUpf9MOhTKVPHJSNfzgW44lxcS9bqzBFA
         xmCaG5a2stm1+uFlHe0oWOCc1AMpi/FtBbEOuMb+CmdawNJeRldlp3baSb0pHDwxZpnG
         ygNaFN0TEivJ7Y8tc7aGTy5Qbf1Ncv5iOu+ieHzrxIVQTGlX/Sl8XtcwuWigA2Vl0ZFb
         ca/eQTKC497unX074gO+0UgHlMVYdTUZUFkR3O8WHNgiR+0TyKREQOR+BgO1QXTRzuLK
         XwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923537; x=1792528337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=lfB2YTJbw4HlrFIFPfly9QUFKmFqTX+jst5wnbMN61OLi5FDix9sam0XN8GxYogM+E
         8zJpWh7hm4YVtqiRxQjffnlculVEelgAx9L6vYbNPz3cwEBEI7SshIhCAyhtLVI/GGdg
         W19VSzaxb34Ca9D248TGW+9Wen4nuWuUXgLm1lTO4UbPF1I7EAdGl8Z1/Mu709wZTmjy
         tc26q6FXVQBQPphAlSd84a8h2irxcMrRXW/iwINGZ9axOrDmEpZzhEPpIG2Nketi4qwM
         6WFhXpU9qlh+LY3ASHosdhgDUTgo5+qD2vUQqpWhfhZly9C/0zTfKJz7tH7m5vT7dQPZ
         D2KQ==
X-Forwarded-Encrypted: i=1; AKwUvByJQAx4vwl6tbDZo93BF1Q3kiMiLK7h9ZplndvztVGhN0MAOnDDWF2JoOgH7VdtdI6z8AMR0IDlVRnelljI6sGT@lists.infradead.org
X-Gm-Message-State: AFq9FYKx6rrQ4n7Le/dSB7pE3KP3rUDxuVSbbN6Vf3qdFzOUw/xX7Tbf
	8tVpM5aZgOsJvA4oILVMvuV47E2G5DJi8Yiz9LjC1H3VYfHvgzcw2qDx
X-Gm-Gg: AYBFou35st/lUWBezG3vfNRnyqNHkhtk6083bzZSZoKNMtR2cLwrcJimFywVeTsBwS/
	Kj08yObALXl7pBCJvC5Pi53vgnTYn5nHUraWoBNVFwPAi/GlhqTIySeOioO+rXrU1V0X2hA5tWy
	IQ0P01gZR+z6gSHYco3bE6t0qJk4w1ufdf/3GPK8C8amzw4nyhIpqxbs4yNZFWo6feJyaxQwOOc
	L9kGfRVGu90h+Lo20PGJgiIy2TH04676QnshUPmglytlz9rfn2DFc9jVmEUdQXuVjuZB9uiLU2N
	jhgCzr4k10kJ/3pi+UgmmgGARxVNKGteHa5e/SvPz39k1cUMD0/C4bzcB1WbvI59duq7aZnPclT
	k9hi7WVPBjfm/wf4Q6vFf82/yQ5nC8hAirk2EvYYMLhLJMJiyszPDeSfFPvNw2Nh7F08epQjJYY
	XaDP3QmY4T4m5f819muO5KAy85qMeMfSm8Y8KofbBW7/UAFh49KTzNl99tWRo7hX7/2mJhoqgOR
	FpGYE8TMpCbv1rr2TCAZZ37u6fwqahEzODQCFeJ6qekTlpX7g0Rb5dhESbGbhAjygnnUgR2uz1x
	qU6vOE+3gT7QiN/TFd479keAa6dc70AptA2UYOLzXYhEshgnvnJoOjcTeiaFKEtsGbISZ8fn+6x
	RnbwcAA==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr72732765e9.33.1791923537100;
        Tue, 13 Oct 2026 13:32:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:12 -0700 (PDT)
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
Subject: [PATCH v3 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Tue, 13 Oct 2026 22:31:39 +0200
Message-Id: <20261013203140.31741-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_133219_311856_768DE121 
X-CRM114-Status: GOOD (  15.99  )
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

The armv5te target emits clz and blx, which ARMv4T lacks. Use rustc's
armv4t-unknown-linux-gnueabi target for CPU_32v4T. A combined ARMv4T and
ARMv5 kernel then uses ARMv4T code for both C and Rust.

Plain ARMv4 remains excluded because rustc has no matching Linux target.
This also depends on the preceding 16-bit xchg() support for pre-ARMv6
CPUs.

Tested the Rust samples, KUnit suites and doctests in QEMU sx1 (ARM925T)
with omap1_defconfig and on a Microchip SAM9X75 Curiosity board with
at91_dt_defconfig.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 8 ++++----
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Makefile                   | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index d6d1bef44c8f..3f39cf55b6f4 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -12,15 +12,15 @@ which uses ``libclang``.
 Below is a general summary of architectures that currently work. Level of
 support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 
-=============  ================  ==============================================
+=============  ================  ======================================================
 Architecture   Level of support  Constraints
-=============  ================  ==============================================
-``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
+=============  ================  ======================================================
+``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``s390``       Maintained        ``CONFIG_EXPOLINE`` must be disabled.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
-=============  ================  ==============================================
+=============  ================  ======================================================
 
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9275a85f95e9..cf782fc04872 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -176,7 +176,7 @@ config ARM
 config ARM_RUST_TARGET
 	def_bool y
 	depends on (CPU_32v6K && !CPU_V6) || \
-		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+		   ((CPU_32v5 || CPU_32v4T) && !CPU_32v4)
 
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 168779e9e93d..a72843890241 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -77,6 +77,7 @@ arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 # the +v6 of the generic target, so older CPUs need their own target.
 rust-target-y				:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
-- 
2.39.5 (Apple Git-154)


