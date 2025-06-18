Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71990C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CXk3ifDtDFAe6gmm4YlVTUCGBcJoPmgL4ZKjmCDKcE=; b=dd/PIkCJFpdiZznnBomsNnJhfN
	cZEdiFqW4Dz3iYzMMFR6euUU9fnTzKFE07QfTZ3d7LScdtEdiARx6VXwIQczcwYkd+310O1hy0rYU
	dnb0B6BQIFEiZcTtonPq/CZlNr9JOTvay6ycSLY0DsHf9NQHUM3jsfnVuDDTHIzBTCE60xpprATTm
	ff41+F83JuarCHDPCMYZxjhzd0xzk0Va8VbA9x0XlDTWblGtXn0hV//qSaz17hboabeWW0JJEEXFP
	+zDFshyDfhjXt6QJj4GHqJTmRj48Bc/aWkbHlAz6+3mpGbnqvLwr+gd7jItrgeN8TlJ31UcWExcOd
	j6WUKa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr3m-00000009xKb-3fPd;
	Wed, 18 Jun 2025 11:34:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpsw-00000009kV2-1bUa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52A625C6409;
	Wed, 18 Jun 2025 10:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32ECC4CEE7;
	Wed, 18 Jun 2025 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750241953;
	bh=cMjcYS3nYWnZwMk3IuZcL+D8usjwsSZbBSXX5Y6yRtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i6wKPjQp+prz+15NPaOgNmPqfGAHBHDh4fZv1CGPy6gn303Bmp/cchlDR/dvVNmQK
	 xz0fvEDTCf+IXpv5t9+0K5rrPnYBQV9GWPnf7q09htC8k+D3jps2zGFcuGo3spCYXJ
	 ENupCQlH5zGGzlJ9+PzKl7mJjvTHwhTAiwA3/s3IbyqH8DJgbK8tQjMni+NDPwazzB
	 9EKRVOrfZolHvlcrYgWqYD4OzNV5p6GfrxdNIBZ8I0HCCSug/k1bBTh7DQgmzY1dTv
	 c2XSHReAN9597rAqgIRePuTg2P5Wn10+NciqUKX2ULBhXkLEg6c/gAIaU/iWUQag1M
	 ttyL5YMB5rVQQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 18 Jun 2025 12:17:31 +0200
Subject: [PATCH v5 16/27] arm64: cpucaps: Rename GICv3 CPU interface
 capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-gicv5-host-v5-16-d9e622ac5539@kernel.org>
References: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
In-Reply-To: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_031914_524959_EB5414FD 
X-CRM114-Status: GOOD (  14.20  )
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

In preparation for adding a GICv5 CPU interface capability,
rework the existing GICv3 CPUIF capability - change its name and
description so that the subsequent GICv5 CPUIF capability
can be added with a more consistent naming on top.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 10 +++++-----
 arch/arm64/tools/cpucaps       |  2 +-
 drivers/irqchip/irq-gic.c      |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b34044e20128..42ba76b6c8cd 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2296,11 +2296,11 @@ static bool can_use_gic_priorities(const struct arm64_cpu_capabilities *entry,
 				   int scope)
 {
 	/*
-	 * ARM64_HAS_GIC_CPUIF_SYSREGS has a lower index, and is a boot CPU
+	 * ARM64_HAS_GICV3_CPUIF has a lower index, and is a boot CPU
 	 * feature, so will be detected earlier.
 	 */
-	BUILD_BUG_ON(ARM64_HAS_GIC_PRIO_MASKING <= ARM64_HAS_GIC_CPUIF_SYSREGS);
-	if (!cpus_have_cap(ARM64_HAS_GIC_CPUIF_SYSREGS))
+	BUILD_BUG_ON(ARM64_HAS_GIC_PRIO_MASKING <= ARM64_HAS_GICV3_CPUIF);
+	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF))
 		return false;
 
 	return enable_pseudo_nmi;
@@ -2496,8 +2496,8 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_always,
 	},
 	{
-		.desc = "GIC system register CPU interface",
-		.capability = ARM64_HAS_GIC_CPUIF_SYSREGS,
+		.desc = "GICv3 CPU interface",
+		.capability = ARM64_HAS_GICV3_CPUIF,
 		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
 		.matches = has_useable_gicv3_cpuif,
 		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, GIC, IMP)
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 10effd4cff6b..a7a4d9e6e12e 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -35,7 +35,7 @@ HAS_GENERIC_AUTH
 HAS_GENERIC_AUTH_ARCH_QARMA3
 HAS_GENERIC_AUTH_ARCH_QARMA5
 HAS_GENERIC_AUTH_IMP_DEF
-HAS_GIC_CPUIF_SYSREGS
+HAS_GICV3_CPUIF
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 6503573557fd..1269ab8eb726 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -54,7 +54,7 @@
 
 static void gic_check_cpu_features(void)
 {
-	WARN_TAINT_ONCE(this_cpu_has_cap(ARM64_HAS_GIC_CPUIF_SYSREGS),
+	WARN_TAINT_ONCE(this_cpu_has_cap(ARM64_HAS_GICV3_CPUIF),
 			TAINT_CPU_OUT_OF_SPEC,
 			"GICv3 system registers enabled, broken firmware!\n");
 }

-- 
2.48.0


