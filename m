Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01861CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 05:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=; b=L4nV/GFdZTXEpiAPfkrVpKARwU
	avNus35c1RYs2Fp2rXF/QKx50Peo26tyYHMv6p/rVn5H9m/J+8ZwITfLyBtWhCRw9GET4KqFDIDY1
	r873spOAPttup/W59n//jLAdYHeZDYNcmnFbl59iRCCg7B59Ux20cJChRhDsY8y7Ujs+RD8Lt8FNp
	HxFFJq1qS1FSqVCbzLFWPRSQcGVdCiGAEUyBuIrT67yDx6m6aWVBCMxwn03gGHKZwu4CIRUqfRYe7
	iv/T2IEig/daIhHKDQP0fHPDM/sCVD/hpNUaGQSKKdHt+Rt3laVl2BuO9r6b8huHcK+avEZWug+Hc
	J+WFT60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpY-00000003Yb5-0g6F;
	Thu, 08 Oct 2026 05:38:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpU-00000003YX5-0Fp8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:38:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49e73611928so1862825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 22:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437886; x=1792042686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=qoJ+ftl2YyrLo2WN22Ojx3mgJZoC4ulitJby3NXkubbVH0ch4bEO07OZG+zjIXOt0I
         0aHCg/uUPCOf8XzbwW7sKC78SW7j7vb3JlvEWs/XmtErdNyRbW0zVuTuEJcaf494Fq2/
         Mzy9w4ef03z6zMDsU+82uUhQnktDitudt2onBMU20SWtxRdMhWyE1PjKzddEnbzXZcEZ
         U07oSr4oniidNKBVlmMUrREbSJN+PjQmFraqy9+T8Il6Yj3VVVWuAUYsSwUfQuOFm3wv
         oYQvPI+Pr3STsQWU25nCmP3WZ7H79e+jRVPcekzoyAns2wfv9V+5lRLq3TB/EftMuCu8
         +dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437886; x=1792042686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=GJdWNXR1KC611iSilqA+gB3E8iFJQNmWy+lmaPRhPZTC6ooRecrMCT1zKkW3KIU/el
         7BkVpypJR3F/P+f/Ef7ajzhxPpL1X16HIPmKCWcqvuVCiuGx95H6vCbZBZ+MJPO+PQ9B
         wI4MrvG6geG9T/aTb0UsDHeknqF8a67nfg+uT9nv6GgHCXyzSGqSviVVZS/zENacSG9F
         IDaalTMTWtt+wTQEVDVpeL0C2JDlh0xA3/cCO7Xm+4dMx19TN9yWdY61iQcGk88gIoaT
         sjLtpmRC0u4h5bzqIMW7FtN5W6SAQt3xXlPNvtAdFqTxOQ3HpwUBhrDqh+ECEeX3KpRF
         IHAA==
X-Forwarded-Encrypted: i=1; AKwUvByWb9Wzd8OK1hAbLFllvBGuxAZIZsVQeQ6KCj0GdpHtJ/Kqo0zqRNeHUSr5tV5ed45SxskGU8RP8d80aA1D0M87@lists.infradead.org
X-Gm-Message-State: AFuF++nkQCyjjHJ4hD9OJeGbNgF4D0tAxfxW4b8sFNDiANm/DQZwuvCM
	hKwopJsv7Vq5HnIY6hkr7DGaHngn0n0QrcNte+2tk55BWlhPqtRVn2h0
X-Gm-Gg: AYBFou075f0kQPJOclqLCMEyOy50z9ve5DXbAScLFsySjupZiN5PWPYGy9GOKxjoBoc
	fUwn8Ey6ZeJ/Iwtk+V2t/nD86+/sbNadSGrfPmige5la/NICcsSEjNrjjPElgbyH7jidTRLjJ7/
	lk6Ea7lfkNOs6UV1Ses+dT1ohiBKstxfpg8SwB9dLat3wbuxgUDHiuFUP3KrgQyNJP329n4JAvD
	IF0k7AjNrUvOEmfo1hmYCjFtqCL2w6NXQ3tfPyJ1xNWAPMRIeqTaOcUZGoA+yg0Uh+cJQk8JzD8
	462FQF6b6AQc4kNcw0753lx1n/XBS6otDXjLOjhgvEcD0cJ3DTHnM1+qIs6t7ulsuZO6wz9LjYb
	F9IAuWaaaMpjWN/28WB1Y7kiYUrKEQ5OG4FrdrMdINLV3gScz2IPjCHmYzL7T1ly9ToxZS1aV97
	AVfwhvEq2zZsTa2FpTSG45GIpbJY/hZKnBTrXFV5m5PK8aJTmyEZv/1c+p3fsXrImal7YUBk9Fw
	4IO/vaUc9LaQa68nAaw5lCZOrTFyWz9RaDWrPph2WGSibP4LVrOQsXsFTvEMwa/D92XU92zJ6Lo
	qeqJnft4GD8+11CQm8wel/ls6Oy1ospzQl1YCuB27NUWhO7w0paUaxGyfn7FUAKC4Xf8Rf5qG1u
	aM2hLvb8=
X-Received: by 2002:a05:600c:4691:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a1851b3756mr26848495e9.9.1791437884887;
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Thu,  8 Oct 2026 07:37:45 +0200
Message-Id: <20261008053746.49631-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_223808_128967_22CC35A6 
X-CRM114-Status: GOOD (  16.78  )
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

The armv5te target emits clz and blx, which ARMv4T lacks. Kernels that
contain an ARMv4T CPU are excluded from Rust for that reason.

Nothing else in the Rust code depends on ARMv5. Use rustc's
armv4t-unknown-linux-gnueabi target for these kernels. Like the C code,
the Rust code of a combined ARMv4T and ARMv5 kernel is then built for
ARMv4T.

ARMv4 (StrongARM, FA526) stays excluded. It has no bx and rustc has no
target for it.

Tested in QEMU sx1 (OMAP310, ARM925T) with omap1_defconfig. The Rust
samples, all Rust KUnit suites and the doctests pass with the current
and with the minimum tool versions.

at91_dt_defconfig combines ARMv4T and ARMv5 and is built for ARMv4T.
That kernel passes the same tests on a Microchip SAM9X75 Curiosity
board (ARM926EJ-S).

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


