Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7933E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWUViwKb9YyQ8v4y65dgLraNpNyCQDT2uHU/J7LxPdg=; b=4VZxk9oJ69+zEZeV/JTfmn8ukh
	tRdXhE3F8jDVhtqx6ezDOD36oyEuZdX6ELLazHp10p7NcGWO+Z+oyiluCfelrIn1caoAKLL6H5ck2
	9b6YBOSUPsTHH45/28uV7bTO0oQXMm2RkojfNKrTN54K1oik6idGhyccVtlTg7Ye8Y07ZRVin/IKa
	7kQajm684mv779aLTPkix0YZCu9tPX2Akd1g5BNjur++D0pNSJL+xHdJyYabTMhckjHk7Rf9+4ndl
	CTb4Vi8qW3T07b1wCIsgtIjwRsGe72EAZI0zj85Va2Nl7bIDtr9fHnEotL9Q6J2DiJQ2lSjPqYU8W
	a9nO8R3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVSq-00000001G2U-3AT5;
	Fri, 06 Dec 2024 10:21:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVL5-00000001DIJ-28nc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:13:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 358B312FC;
	Fri,  6 Dec 2024 02:14:03 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BFBA3F71E;
	Fri,  6 Dec 2024 02:13:32 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	jannh@google.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	kees@kernel.org,
	maz@kernel.org,
	pierre.langlois@arm.com,
	qperret@google.com,
	ryan.roberts@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH 07/16] arm64: Enable kpkeys
Date: Fri,  6 Dec 2024 10:11:01 +0000
Message-ID: <20241206101110.1646108-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206101110.1646108-1-kevin.brodsky@arm.com>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021335_588997_7D48F13E 
X-CRM114-Status: GOOD (  11.14  )
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

This is the final step to enable kpkeys on arm64. We enable
POE at EL1 by setting TCR2_EL1.POE, and initialise POR_EL1 so that
it enables access to the default pkey/POIndex (default kpkeys
level). An ISB is added so that POE restrictions are enforced
immediately.

Having done this, we can now select ARCH_HAS_KPKEYS if ARM64_POE is
enabled.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/Kconfig             | 1 +
 arch/arm64/kernel/cpufeature.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5..f35964641c1a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2183,6 +2183,7 @@ config ARM64_POE
 	def_bool y
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
+	select ARCH_HAS_KPKEYS
 	help
 	  The Permission Overlay Extension is used to implement Memory
 	  Protection Keys. Memory Protection Keys provides a mechanism for
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed8..3925bf04fb2f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -75,6 +75,7 @@
 #include <linux/cpu.h>
 #include <linux/kasan.h>
 #include <linux/percpu.h>
+#include <linux/kpkeys.h>
 
 #include <asm/cpu.h>
 #include <asm/cpufeature.h>
@@ -2376,8 +2377,10 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
 #ifdef CONFIG_ARM64_POE
 static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
 {
-	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1x_E0POE);
+	write_sysreg_s(por_set_kpkeys_level(0, KPKEYS_LVL_DEFAULT), SYS_POR_EL1);
+	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1x_E0POE | TCR2_EL1x_POE);
 	sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_E0POE);
+	isb();
 }
 #endif
 
-- 
2.47.0


