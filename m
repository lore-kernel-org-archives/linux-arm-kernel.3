Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5103C98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aGzUbv8x/qChEM/5fcor4kLUFepBVWkPmo87o0g+kKg=; b=ijVkLKtXKJbqvirsznTauzWtS9
	izxy4NdzAwaEAU0MxDcfY692IW/nZAqae5rBvjZKeU4avBTS4BGjF/x89OQdQi5z5MakSWHAp+CeD
	7sR6XShjkRth7x6iJReVVK32+1IblnXJ737uPf27cKG2b8UKkGEhIWRFlgI0YWHqTnfqhDDpn0GAE
	WWyscAI944s0j8qoQ9ZkIZLPG08uD6/ZemhFBDPWSWl13TlUQ4xdN3OIq0rP/IJLuTngCa/INR2OI
	xk2n4DIF177f/iIDiGkGcpJfUHHAKwz185TFQd+ckmbi3rBtPigY5ercCZck++C3hRr/cmfCX+S5I
	6qv7HWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAonX-0000000GNjI-0JdS;
	Sun, 27 Sep 2026 13:20:07 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAonU-0000000GNif-26qs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 13:20:05 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so25709105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790515202; x=1791120002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGzUbv8x/qChEM/5fcor4kLUFepBVWkPmo87o0g+kKg=;
        b=LkhhS0oai+0CG8pA/q2IXqgHct8pDUatB4s8sbQsoidOg+DURYLAp/XJkBgsn+7BK7
         Sr6qMvhIJNLUF5H56FfVmn34gO9AwtZWBpspNFH3KWRG68wOZ5dpCiwAWAQiBku3qmxc
         O2cIPtcr2N0VwL3h21CdzRZyTLNMdG3TbyHHlhIl/CL2Y3Bdggtf30ZjYkEyLE0qN3I8
         Q/HvZ+kXcBWzgaK2jkDjEtnKSjCeAhT5QcMULvpqTRn4tJDSBcLAbcj04Xa+HaFpoECw
         cs9bcM78RLWSYqJJwchJyIQ2K+fuLdAZdtj1fO7it32y4WHAZmEJnmu1l9+Eoadw4Sw5
         agWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515202; x=1791120002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGzUbv8x/qChEM/5fcor4kLUFepBVWkPmo87o0g+kKg=;
        b=T+vFPUHC11y7bNSlqfcBhy/U5XlNbXZYNizWCZnG1Ln3J9goSPPtJg/AfQQHQt1SLm
         zO+JxlXsA/uFSVUgZODOofBeDE97QGK+ws93h8AJdA+HrDRdfohNVBQyu6SabLiNz+rR
         A3oDFMsQn35eXtWP0R8mSlZ7+U5MTuxY0VSNKTZxnTYSX8RQTxgjaO0jF37FXT9n2EIf
         GrlJKuTVktJJ9foVzSAhLqBIwdly0KLXnXxCagswwSvCDEwB4o1xS3nQPJUSx0/Jw3UI
         XzO9KsMiX6CzypZdIEJZKmVl1iuUvm2M8+ZOdQKeeoiMERqoOr5/nVkzknD8bHlt/Ufv
         DaUg==
X-Forwarded-Encrypted: i=1; AKwUvBy6X5rBS9KRW8+vIxoujyGGsfHwPLJ5APAkBLBoap0n+6ntqtUKrK052pTIAYWbAP4/Dtx3r2hlb4rAhG5O3PyH@lists.infradead.org
X-Gm-Message-State: AFuF++mWh4btsGXO+AhTJ7xSbBjjlBwKZ7yHWxqwToTK1eE3C3HNIyha
	+CawoWa+cHIFbk3CiXsAikNURfg409D4lROPNNgtZ4NOw5QnmB6AB4OI
X-Gm-Gg: AYBFou2FAT/Bao2xEB1onDxDLdixsM1Uo+M16Z/dQerFeCMMGi82vRPGJMaXvYUHHHS
	TTdHcHXfmtN8V3TFuKziBguVdRBDtkzIqCG9556sNQ6Kjm+TtnESa7YnjRV8ut5qisqnHdu1y2B
	6fOpBuL44q8bO5RIujOSEoSclZDKoMsQZ6qibZ4H7xppiXBiyx56vdkgMRTq2U5a6tD9iHJRVZC
	CqAbA1Tgi4RTBnaryIdD5uzvMZB4tD1COFyg9ZUOdvR33qC3GX+TPed0lbK5hbL3W8jxcQqoYLh
	Q7+3wfj7/4Y/gNrjTSQYhQp7B3gGSis1z1gtMr9QpzFoSBxsAve+AuRaitumsaEoLrNail64BY2
	n/yb5xaUp0BKfXvRYdCZGYZdEmiKt61kBmqyNXC80xNFtrf9Jk8/st51WoTEUNUSjOQnzg7T2SF
	CSTZQLIasFif0qlIkD49RmBwPurE8DeRhrIX4r212+Q2B8lu9fOo7kWrpQ5QyA46Ptv6Jk/RjGK
	yd6qWHF/HgFlJFbwQ3l0bgxUPuxtlZPJAwLr7k=
X-Received: by 2002:a05:600c:4e53:b0:49f:d58f:1f8b with SMTP id 5b1f17b1804b1-49fe66d807bmr178581125e9.18.1790515202245;
        Sun, 27 Sep 2026 06:20:02 -0700 (PDT)
Received: from lima-dev.. (89-67-112-196.dynamic.play.pl. [89.67.112.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm73615905e9.11.2026.09.27.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:20:01 -0700 (PDT)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Demian Shulhan <demyansh@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Date: Sun, 27 Sep 2026 15:17:56 +0200
Message-ID: <20260927131838.6774-1-demyansh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_062004_563807_D3B929EF 
X-CRM114-Status: GOOD (  11.35  )
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

arm64 currently uses the generic csum_partial_copy_nocheck(), which
performs memcpy() followed by a second pass for csum_partial(). This
double pass exerts unnecessary pressure on the L1 cache.

Replace it with a single-pass implementation. The new implementation
provides a general-purpose register path for short buffers and atomic
contexts, and a kernel-mode NEON path for lengths >= 1024 bytes.

Measured in-kernel on an Ampere Altra (Neoverse-N1):
- Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
- NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
  4096 bytes.
On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
1.6-2.4x above. No length or alignment regresses on either
microarchitecture.

Patch 1 implements the fused routines and the dispatcher.
Patch 2 adds KUnit test coverage for the new API and internal paths.

Tested: in-kernel benchmark module on Neoverse-N1 with both
implementations cross-checked (0 mismatches); KUnit suite under QEMU
(with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
testing of both routines against a naive reference with PROT_NONE guard
pages, gcc 13 and clang 18 W=1 builds, checkpatch --strict.

Demian Shulhan (2):
  arm64: csum: Add fused copy and Internet checksum
  lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()

 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/Makefile           |   7 +-
 arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
 arch/arm64/lib/csum-copy.c        | 108 +++++++
 arch/arm64/lib/csum-copy.h        |  84 ++++++
 arch/arm64/lib/csum.c             |  54 ++++
 lib/Kconfig.debug                 |  10 +
 lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++++
 8 files changed, 896 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/lib/csum-copy-neon.c
 create mode 100644 arch/arm64/lib/csum-copy.c
 create mode 100644 arch/arm64/lib/csum-copy.h


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0


