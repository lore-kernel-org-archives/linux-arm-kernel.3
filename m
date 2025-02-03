Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A07C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DSfztf+YFHh7lJoCiiO7DeGAKOV5B4L4xTaMeERC30=; b=0wOGDCfCmjiWLJJufnu0YRIqqj
	C45YWnUAQ/xcwn4bhWqpd/kwFQJGbEifyL8IAi0OSTSgjYokT4a/u48KemofvGoo7eZdZxrvrHK3b
	xdJmNfHoEYS2db9tqSdIkgS0GXmOVMCs5UB8IODHRy+ST1kiN1I4W+zvt6u0SPTZ4tjLrIKh76GDA
	hzfUM1h+Ftv7MJVaklgkF22/3VvA7CGQPuZ+gUiM8BJW8LhtdA8uaWE2lCAp9akpjoHUj1vsn65aN
	abkr9Mwh7Y9hiwVJfZQVRVIKEWhUHyvonkspxofRGeFSqvqJiyy/Vovj8QG4E7Wv4+2UXIcctN0u4
	0wz9nJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetrr-0000000F8qt-1jGB;
	Mon, 03 Feb 2025 10:39:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetZH-0000000F6DK-3n6P
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4DSfztf+YFHh7lJoCiiO7DeGAKOV5B4L4xTaMeERC30=; b=HsU6UCatxBH2dBN0CxBNwPWUUE
	x2bY4e0KcEnTjxY621ZEJ5aFupwOotJg0s1OD13FKSzUZ08fIS1UGjrAMapnIEkVL9anI4qcBzujw
	EfoBMHOR4miIMAu8ecAaNJgsU1Yl7fwDLbyJItYUWfDq2NqQIQb4uly9mTknmzodaiegWzD+neJwl
	I0btFQaeAIzuUNySjneoXqyXIcIDkGaURET1vY1wFj/jRKy7Q+QxZSek73Ybg59kWoymNOowPx9lQ
	hsGjjnSTWIFdUVITNvfXLxIL6BoqesReOzuHyu/hHCp/SiUU1ZiwjjCf+VOmZoKGY7GK98IBH8Bky
	HqnOVnSQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetZE-0000000G3aM-14oq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:20:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDDA811FB;
	Mon,  3 Feb 2025 02:20:59 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 086153F63F;
	Mon,  3 Feb 2025 02:20:31 -0800 (PST)
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
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v3 14/15] arm64: Enable kpkeys_hardened_pgtables support
Date: Mon,  3 Feb 2025 10:18:38 +0000
Message-ID: <20250203101839.1223008-15-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203101839.1223008-1-kevin.brodsky@arm.com>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102036_530379_51D7A747 
X-CRM114-Status: GOOD (  11.86  )
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
index 34f15348ada8..df26902d385c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2187,6 +2187,7 @@ config ARM64_POE
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


