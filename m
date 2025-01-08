Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7222E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntdmAnzrmKEdik76S3k2Sqibao4Hg1fMJIxwDwAihec=; b=cfcYHDW1ggrKCczyfKzXfFcmXo
	jNNp/YphWaoi7niZLhAiH3PQFyqYSf54zlcxbHo9NEyKt598g/nCIH3KOUel1P8wESLna8QckACLB
	q2SsVO27oMqKnilIdxusV27MiDOa1fr8qL9jCBQRqTl5adlV6uY94KDFQ4WMJAUfhxN6CA1Cyq068
	3p5QazSr2Q2d3RvrQBXUyD90i/r9kFowDvV8eGkexLwil+5bYug2c/n5k5Ehe1rdMMJ/3dNYn72H1
	SMNLdWuRnqGz4vxRv1BL+ulyYfkImqg/mS0HjtK9rnkc5A/PGJ3mS2CyyvzlwiBxDftx04xGQW2hF
	TcXtY/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTgk-000000084W3-2UL8;
	Wed, 08 Jan 2025 10:53:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTOn-000000080NI-3W8G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:34:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B77C613D5;
	Wed,  8 Jan 2025 02:35:21 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D9D73F673;
	Wed,  8 Jan 2025 02:34:50 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH v2 14/15] arm64: Enable kpkeys_hardened_pgtables support
Date: Wed,  8 Jan 2025 10:32:49 +0000
Message-ID: <20250108103250.3188419-15-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108103250.3188419-1-kevin.brodsky@arm.com>
References: <20250108103250.3188419-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_023453_920725_49047473 
X-CRM114-Status: GOOD (  12.25  )
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

kpkeys_hardened_pgtables should be enabled as early as possible (if
selected). It does however require kpkeys being available, which
means on arm64 POE being detected and enabled. POE is a boot
feature, so calling kpkeys_hardened_pgtables_enable() just after
setup_boot_cpu_features() in smp_prepare_boot_cpu() is the best we
can do.

With that done, all the bits are in place and we can advertise
support for kpkeys_hardened_pgtables by selecting
ARCH_HAS_KPKEYS_HARDENED_PGTABLES if ARM64_POE is enabled.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/Kconfig      | 1 +
 arch/arm64/kernel/smp.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 688ffd9bf503..654e6dff9a79 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2185,6 +2185,7 @@ config ARM64_POE
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	select ARCH_HAS_KPKEYS
+	select ARCH_HAS_KPKEYS_HARDENED_PGTABLES
 	help
 	  The Permission Overlay Extension is used to implement Memory
 	  Protection Keys. Memory Protection Keys provides a mechanism for
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..074cab55f9db 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -35,6 +35,7 @@
 #include <linux/kgdb.h>
 #include <linux/kvm_host.h>
 #include <linux/nmi.h>
+#include <linux/kpkeys.h>
 
 #include <asm/alternative.h>
 #include <asm/atomic.h>
@@ -468,6 +469,7 @@ void __init smp_prepare_boot_cpu(void)
 	if (system_uses_irq_prio_masking())
 		init_gic_priority_masking();
 
+	kpkeys_hardened_pgtables_enable();
 	kasan_init_hw_tags();
 	/* Init percpu seeds for random tags after cpus are set up. */
 	kasan_init_sw_tags();
-- 
2.47.0


