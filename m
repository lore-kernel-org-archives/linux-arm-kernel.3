Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96508CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWLFTt24RYDJvEJDwU+vEARTDOg0wmnK2jYoZBai8H0=; b=Cs5FxG+SBehSOJvnMfv2oE7zWY
	tgZgMVPTsP+I8+JMlWrF/RKVyHM0wqp9lo3mW0KrVInnEUgwe3bIuZXxWKxFTGkEGT5OeMdSFf4Hg
	EVejix1XIiJ0FzGEYXGa/2fIfDTGeZbRR64oQLLFK1D4TrXVzokeuHDuXpWMZpGBrU43vlmk2wIs3
	MoOeHEh6AG4srJfpINReleY3jNWo0mwkm6KYsId93jtXVzpz6csywKAfQATfmvMS8CKQq4smH6bg5
	nmNxSt61pqZ65iv4CN4ZAbtU0UvK7Yv7qfofy6EkgWsU2BRIzUzCiDubhilI9MVnUnRGLaesty4IY
	Zh/OA8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpS-00000003YWg-26BA;
	Thu, 08 Oct 2026 05:38:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpP-00000003YUf-1vbQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:38:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48b060ec084so1815744f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 22:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437882; x=1792042682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWLFTt24RYDJvEJDwU+vEARTDOg0wmnK2jYoZBai8H0=;
        b=gONe9rR94C/MVEb8phf2KvgmG24J1d8dFZ6ew1lFxbr8aBo2E0Mk2oGNdTuA8fsTCG
         PknAoSHgPXOcfGkSV8jpqy7V2CtLVybHz0unG0O/qu3/Ax1WJoKtICMKx0d6dnK9Z5sz
         ks2KYHFVEIGmIXQcJ4A5lnKRn2JGtkkUDyOF+qUn7n1XLezrbBWrQQBjAXRAKxRuqtb1
         F1NWfSI6KbCsAC4BBeNP5G16OCnkkM0tHq2AwTRU8TBdXBvuqW1Fo7G2BZYrRVIYqXhP
         6AiCQUhOD0vDCljX99g9Xo6gm6Jmw9kQy296h/4yn9ziNrkTrgmQ+D1q4A3euCmHaRjR
         WV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437882; x=1792042682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWLFTt24RYDJvEJDwU+vEARTDOg0wmnK2jYoZBai8H0=;
        b=cA/EsbnvIXeb/4YMwmV136ot6E1O44RrnwAvwuFYGIo0YY1O4VDBcGtZwaWsBMvm0z
         se6ZBhQD6mMflSnNzQMC6IN+8nJV2yeee/2vfQWUJMUSJDHTZTe8ZoPKaR8VIotkaCsY
         mxzsGXbzuq+mtnLfmKiqyTisb5DUbDGNM+RoynN476itL0XIcrXvSq7Ld5uQeaUNcqkJ
         9qVJlRm4GkKkOTdwyxlBB+NNSpKQPa+aqe2vEGHjOK2knQNR36vXcJWM7wGq18hLEudI
         uT/Kb97dCCyQNJCBCgaFUZicQE3hn3K4UoJJkBArHKDTdCa3JLz+HkU6wOfBq4ZtcyaA
         iulg==
X-Forwarded-Encrypted: i=1; AKwUvBzajUdChGw4hNMNqpwqrxKHGY1aCSphDyDKTJcuKrDhsdkA5DaUR83q2I2X0RHm8AasAg4NUI37thZNR9fXvSGf@lists.infradead.org
X-Gm-Message-State: AFq9FYLz8U9ql5wPiYSmfJ6RlopbxRfCZl3S4Jo3j3iwC3t1yJAFXcZe
	kfN3iBj0mPsHihyNHq2d2BZrKcG20COF4V2leA0bT/2Jen+6EZfElD0r
X-Gm-Gg: AYBFou0ZPVcDgNrtN+ba9RuHmay8/GoCW5/yMlfFIqh2k22es56gy4bycADYYbYh74b
	8QIJnMUgU5mSx/9LXESg7TURDQtRVGHh+Dz4A3NhW0KEZC9TylQ1dhnJeIJ4XmerKQ/6APSE5Ui
	7MoeoDeHX03eBVLoE2Ym6n6o51NxxxPhrTwTQJi+Lm0JIsMyUjxPL/Uq1o7BacycNIchKJrq4w1
	H3dRqUeZR1ODnsSDSJgZZsiPOM7hfivO1SqoZhRcIP3xq0XflZAy0gIDpidTIz8uvtLMYEhZHgR
	KV2GV/8edMnotC9h0DfZAmGhlT56BO4zor8dKscvecb1hM/l+nf8E+XwrngJlrCHPuanG5rnQeH
	kqe0WYNEzt9xp/B5xq5ByccIzty4Qic1RymcO5Tq43NZLSTiccMP8aT3/qIjPazzbiad+mWwwYT
	OXqUyOwfwf9JGLZMVosyUAJDlQlKqhq7qR4zGbAcy3o+jhZdlgELsi0sUpqP3EHVWJsMyhece2U
	+8aj3lm3pOsId44+V1gS6ou74SqMMKSLnKbVUJw2fGIifLjwsJOnNzc/PGG/W7V6Wfvxky2fRBs
	jwZ2e/UgGcGKW878t/V/cO8bgCA3k9fmbSwTIIbdZLYLwpSqxBffuD31e5rAvuJovzce1uWr2Uz
	FRvFmlZM=
X-Received: by 2002:adf:e19c:0:b0:48c:4e9e:dc7 with SMTP id ffacd0b85a97d-48c727871f9mr7979486f8f.42.1791437881355;
        Wed, 07 Oct 2026 22:38:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:00 -0700 (PDT)
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
Subject: [PATCH v2 3/6] ARM: rust: Enable Rust support for ARMv6K-only kernels
Date: Thu,  8 Oct 2026 07:37:43 +0200
Message-Id: <20261008053746.49631-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_223803_535253_F753518C 
X-CRM114-Status: GOOD (  15.84  )
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

HAVE_RUST is selected for CPU_32v7 only. A combined ARMv6K and ARMv7
kernel has CPU_32v7 and can use Rust today. A kernel built for ARMv6K
alone cannot. There is no technical reason for that.

No CPU flags are passed to rustc on ARM. The arm-unknown-linux-gnueabi
target has +v6 in its feature list, so Rust code is built as ARMv6 on
all of these kernels already.

Select HAVE_RUST for CPU_32v6K instead. CPU_V7 selects CPU_32v6K, so
ARMv7 stays covered.

Plain ARMv6 (CPU_V6, ARM1136r0) is excluded. It has no 1- and 2-byte
xchg() and no 2-byte cmpxchg(), which the Rust atomic helpers need. A
kernel that combines CPU_V6 with ARMv7 can enable Rust today and does
not link.

Tested in QEMU raspi0 (ARM1176) with bcm2835_defconfig without
ARCH_MULTI_V7. The Rust samples, all Rust KUnit suites and the
doctests pass with the current and with the minimum tool versions.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 2 +-
 rust/helpers/atomic_ext.c           | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 4f980815e92a..bdc42a24bf30 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv7 Little Endian only.
+``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ffbc7f386131..b5816f28783a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index c267d5190529..1d157df29229 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -42,7 +42,7 @@ GEN_READ_SET_HELPERS(ptr, const void *)
  * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding xchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_XCHG_HELPER(tname, type, suffix)					\
@@ -66,7 +66,7 @@ GEN_XCHG_HELPERS(ptr, const void *)
  * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding try_cmpxchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_TRY_CMPXCHG_HELPER(tname, type, suffix)				\
-- 
2.39.5 (Apple Git-154)


