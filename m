Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2396FF4613F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkLWv63ztEsGm0CP1Kd4bPB8fc4L3xn1J/qiHwyWQdo=; b=MtAH7EnTEsZYJtlNqMrcEfSfgH
	STEMEL6latslvTDc8JYFuv0ENRKCfLjhCDKnqKI213dRW8qvMix0B4QV+QFRgLcYSTm36HKTAqJND
	UPu5OWNsdRq97lMIUPTn9H2QPBJeOVgp2JHfNTwaIlNOkO//7sW8opN25r8dRLFuaUTQd4W+AhXVY
	Q5gNaMklRm/tZe2IAp90KBKW4aIjn1xqsaqSsv66YLVxtKtXaVzu3tA2bRl801mD7rlFQhf4RHibP
	tnMkvZvLdsCXBNrnPW+ESVadcs9rdzwc08ckUlJmMeTQxx/sf5dxraz+/om/vfJxZVLFKFi7218v6
	HsswSi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51MB-00000001TG0-0hDZ;
	Tue, 24 Mar 2026 12:59:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51M1-00000001T67-2P32
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:59:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8334C1756;
	Tue, 24 Mar 2026 05:59:21 -0700 (PDT)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA4343FAF5;
	Tue, 24 Mar 2026 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774357167; bh=cI6+kEqrdMQNjiXPET9BxZL18c1fuR39tKuDEBydRTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ChG1aWlwjsO0k0NiceCezHeiFPIFqYSvmpk7+kRItYlbJGIAYx9arcrN+HRy2X63i
	 s13VEtLiv0syMrQVUFaINlDsaitCr+1cIaa9o1ZuMJtCmnz8fjd7mM8Cm/aSFADCuQ
	 CDx62GMO3fg5c5roX6EzMk8SAvkCLEk6iy3b6vK8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	joey.gouly@arm.com,
	Sascha.Bischoff@arm.com
Subject: [BOOTWRAPPER PATCH v2 2/2] Add support for GICv5
Date: Tue, 24 Mar 2026 12:59:06 +0000
Message-Id: <20260324125906.67012-3-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260324125906.67012-1-vladimir.murzin@arm.com>
References: <20260324125906.67012-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055929_698551_E6AA0F62 
X-CRM114-Status: GOOD (  27.15  )
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

Performs the minimal initialization required for GICv5 support. GICv5
support can be requested with --with-gic=v5.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 Makefile.am                    |   7 ++
 arch/aarch64/include/asm/cpu.h |  11 +++
 common/gic-v5.c                | 134 +++++++++++++++++++++++++++++++++
 configure.ac                   |   7 +-
 scripts/FDT.pm                 |  16 ++++
 scripts/findbase-by-regname.pl |  44 +++++++++++
 6 files changed, 216 insertions(+), 3 deletions(-)
 create mode 100644 common/gic-v5.c
 create mode 100755 scripts/findbase-by-regname.pl

diff --git a/Makefile.am b/Makefile.am
index 2710494..aacd639 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -82,6 +82,13 @@ PSCI_NODE	:=
 CPU_NODES	:=
 endif
 
+if GICV5
+GIC_IRS_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase-by-regname.pl $(KERNEL_DTB) "el3-config" 'arm,gic-v5-irs')
+GIC_IWB_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,gic-v5-iwb')
+DEFINES		+= -DGIC_IRS_BASE=$(GIC_IRS_BASE)
+DEFINES		+= -DGIC_IWB_BASE=$(GIC_IWB_BASE)
+endif
+
 if GICV3
 GIC_DIST_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,gic-v3')
 GIC_RDIST_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 1 'arm,gic-v3')
diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index ac50474..af4191c 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -128,6 +128,7 @@
 #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
 
 #define ID_AA64PFR2_EL1			s3_0_c0_c4_2
+#define ID_AA64PFR2_EL1_GCIE		BITS(15, 12)
 #define ID_AA64PFR2_EL1_FPMR		BITS(35, 32)
 
 #define ID_AA64SMFR0_EL1		s3_0_c0_c4_5
@@ -169,6 +170,11 @@
 #define ICC_CTLR_EL3		S3_6_C12_C12_4
 #define ICC_PMR_EL1		S3_0_C4_C6_0
 
+#define ICC_PPI_DOMAINR0_EL3	S3_6_C12_C8_4
+#define ICC_PPI_DOMAINR1_EL3	S3_6_C12_C8_5
+#define ICC_PPI_DOMAINR2_EL3	S3_6_C12_C8_6
+#define ICC_PPI_DOMAINR3_EL3	S3_6_C12_C8_7
+
 #define VSTCR_EL2		s3_4_c2_c6_2
 #define VSCTLR_EL2		s3_4_c2_c0_0
 
@@ -245,6 +251,11 @@ static inline int has_gicv3_sysreg(void)
 	return !!mrs_field(ID_AA64PFR0_EL1, GIC);
 }
 
+static inline int has_gicv5_sysreg(void)
+{
+	return !!mrs_field(ID_AA64PFR2_EL1, GCIE);
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/common/gic-v5.c b/common/gic-v5.c
new file mode 100644
index 0000000..cef2ece
--- /dev/null
+++ b/common/gic-v5.c
@@ -0,0 +1,134 @@
+/*
+ * gic-v5.c
+ *
+ * Copyright (C) 2025 ARM Limited. All rights reserved.
+ *
+ * Use of this source code is governed by a BSD-style license that can be
+ * found in the LICENSE.txt file.
+ */
+
+#include <stdint.h>
+
+#include <cpu.h>
+#include <gic.h>
+#include <asm/io.h>
+
+#define IWB_IDR0			0x0
+#define IWB_IDR0_IW_RANGE_SHIFT		0x0
+#define IWB_IDR0_IW_RANGE_MASK		0x7ff
+
+#define IWB_CR0				0x80
+#define IWB_CR0_IWBEN			(1 << 0)
+#define IWB_CR0_IDLE			(1 << 1)
+
+#define IWB_WENABLE_STATUSR		0xc0
+#define IWB_WENABLE_STATUSR_IDLE	(1 << 0)
+
+#define IWB_WDOMAIN_STATUSR		0xc4
+#define IWB_WDOMAIN_STATUSR_IDLE	(1 << 0)
+
+#define IWB_WENABLER			0x2000
+#define IWB_WDOMAINR			0x8000
+
+#define IRS_IDR6			0x0018
+#define IRS_IDR6_SPI_IRS_RANGE_MASK	0x1ffffff
+
+#define IRS_IDR7			0x001c
+#define IRS_IDR7_SPI_BASE_MASK		0xffffff
+
+#define IRS_SPI_SELR			0x108
+#define IRS_SPI_DOMAINR			0x10c
+
+#define IRS_SPI_STATUSR			0x0118
+#define IRS_SPI_STATUSR_IDLE		(1 << 0)
+
+
+static void gic_iwb_init(void) {
+	void *iwb_ptr = (void *)GIC_IWB_BASE;
+	unsigned int num;
+	unsigned int i;
+
+	/* Get number of implemented wires */
+	num = ((raw_readl(iwb_ptr + IWB_IDR0) >> IWB_IDR0_IW_RANGE_SHIFT) & IWB_IDR0_IW_RANGE_MASK) + 1;
+
+	/* Disable all wires */
+	for (i = 0; i < num; i++)
+		raw_writel(0, iwb_ptr + IWB_WENABLER + i * 4);
+
+
+	while (!(raw_readl(iwb_ptr + IWB_WENABLE_STATUSR) & IWB_WENABLE_STATUSR_IDLE));
+
+	/* Asign all wires to Non-Secure domain */
+	for (i = 0; i < num * 2; i++)
+		raw_writel(0x55555555, iwb_ptr + IWB_WDOMAINR + i * 4);
+
+	while (!(raw_readl(iwb_ptr + IWB_WDOMAIN_STATUSR) & IWB_WDOMAIN_STATUSR_IDLE));
+
+	/* Enable IWB */
+	raw_writel(IWB_CR0_IWBEN, iwb_ptr + IWB_CR0);
+
+	while (!(raw_readl(iwb_ptr + IWB_CR0) & IWB_CR0_IDLE));
+}
+
+static void gic_irs_init(void) {
+	void *irs_ptr = (void *)GIC_IRS_BASE;
+	unsigned int range;
+	unsigned int base;
+	unsigned int i;
+
+	/* Get the range of implemented SPI's ids */
+	base = raw_readl(irs_ptr + IRS_IDR7) & IRS_IDR7_SPI_BASE_MASK;
+	range = raw_readl(irs_ptr + IRS_IDR6) & IRS_IDR6_SPI_IRS_RANGE_MASK;
+
+	for (i = base; i < base + range; i++) {
+		/* Select SPI */
+		raw_writel(i, irs_ptr + IRS_SPI_SELR);
+		while (!(raw_readl(irs_ptr + IRS_SPI_STATUSR) & IRS_SPI_STATUSR_IDLE));
+
+		/* Asign SPI to Non-Secure domain */
+		raw_writel(1, irs_ptr + IRS_SPI_DOMAINR);
+		while (!(raw_readl(irs_ptr + IRS_SPI_STATUSR) & IRS_SPI_STATUSR_IDLE));
+	}
+}
+
+static void gic_ppi_init(void) {
+	uint64_t val = 0;
+
+	val |= 1UL << (2 * 31); // Trace Buffer Unit
+	val |= 1UL << (2 * 30); // EL1 Physical Timer
+	val |= 1UL << (2 * 28); // Non-secure EL2 Virtual Timer
+	val |= 1UL << (2 * 27); // EL1 Virtual Timer
+	val |= 1UL << (2 * 26); // Non-secure EL2 Physical Timer
+	val |= 1UL << (2 * 25); // GIC maintenance interrupt
+	val |= 1UL << (2 * 24); // Generic CTI interrupt trigger event
+	val |= 1UL << (2 * 23); // PMU overflow interrupt request
+	val |= 1UL << (2 * 22); // Debug communication channel
+	val |= 1UL << (2 * 21); // Profiling Buffer management interrupt request
+	val |= 1UL << (2 * 15); // Hardware accelerator for cleaning Dirty state interrupt
+	val |= 1UL << (2 * 3);  // Reserved for software usage
+
+	/* Asign PPI to Non-Secure domain */
+	msr(ICC_PPI_DOMAINR0_EL3, val);
+	isb();
+}
+
+void gic_secure_init(void)
+{
+	/*
+	 * If GICv5 is not available, skip initialisation. The OS will probably
+	 * fail with a warning, but this should be easier to debug than a
+	 * failure within the boot wrapper.
+	 */
+	if (!has_gicv5_sysreg())
+		return;
+
+	if (this_cpu_logical_id() == 0) {
+		gic_iwb_init();
+		gic_irs_init();
+	}
+
+	gic_ppi_init();
+
+	return;
+}
+
diff --git a/configure.ac b/configure.ac
index 6f486c4..f4faff7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -141,18 +141,19 @@ AC_SUBST([XEN_CMDLINE], [$X_CMDLINE])
 
 
 AC_ARG_WITH([gic],
-  AS_HELP_STRING([--with-gic={v2|v3}], [select GIC version]),
+  AS_HELP_STRING([--with-gic={v2|v3|v5}], [select GIC version]),
   [GIC_VERSION=$withval],
   [GIC_VERSION=v2])
 
 AS_CASE([$GIC_VERSION],
-  [v2|v3], [],
-  [AC_MSG_ERROR([Invalid GIC version: $GIC_VERSION (use v2 or v3)])])
+  [v2|v3|v5], [],
+  [AC_MSG_ERROR([Invalid GIC version: $GIC_VERSION (use v2, v3, or v5)])])
 
 AC_SUBST([GIC_VERSION], [$GIC_VERSION])
 
 AM_CONDITIONAL([GICV2], [test "x$GIC_VERSION" = "xv2"])
 AM_CONDITIONAL([GICV3], [test "x$GIC_VERSION" = "xv3"])
+AM_CONDITIONAL([GICV5], [test "x$GIC_VERSION" = "xv5"])
 
 
 # Ensure that we have all the needed programs
diff --git a/scripts/FDT.pm b/scripts/FDT.pm
index 9adf70b..3f49ba6 100755
--- a/scripts/FDT.pm
+++ b/scripts/FDT.pm
@@ -322,6 +322,22 @@ sub get_num_reg_cells
 	return ($ac, $sc);
 }
 
+sub get_regname_idx
+{
+    my $self = shift;
+    my $regname = shift;
+
+    my $prop = $self->get_property("reg-names");
+
+    return undef if (not defined($prop));
+
+    my @names = $prop->read_strings();
+
+    my ($idx) = grep { $names[$_] eq $regname } 0 .. $#names;
+
+    return $idx;
+}
+
 sub translate_address
 {
 	my $self = shift;
diff --git a/scripts/findbase-by-regname.pl b/scripts/findbase-by-regname.pl
new file mode 100755
index 0000000..49cd0ce
--- /dev/null
+++ b/scripts/findbase-by-regname.pl
@@ -0,0 +1,44 @@
+#!/usr/bin/perl -w
+# Find device register base addresses.
+#
+# Usage: ./$0 <DTB> <regname> <compatible ...>
+#
+# Copyright (C) 2026 ARM Limited. All rights reserved.
+#
+# Use of this source code is governed by a BSD-style license that can be
+# found in the LICENSE.txt file.
+
+use warnings;
+use strict;
+
+use FDT;
+
+my $filename = shift;
+die("No filename provided") unless defined($filename);
+
+my $regname = shift;
+die("no reg regname provided") unless defined($regname);
+
+my @compats = shift;
+
+open (my $fh, "<:raw", $filename) or die("Unable to open file '$filename'");
+
+my $fdt = FDT->parse($fh) or die("Unable to parse DTB");
+
+my $root = $fdt->get_root();
+
+my @devs = ();
+for my $compat (@compats) {
+	push @devs, $root->find_compatible($compat);
+}
+
+# We only care about finding the first matching device
+my $dev = shift @devs;
+die("No matching devices found") if (not defined($dev));
+
+my $idx = $dev->get_regname_idx($regname);
+die("Cannot find reg name $regname") if (not defined($idx));
+my ($addr, $size) = $dev->get_translated_reg($idx);
+die("Cannot find reg entry $idx") if (not defined($addr) or not defined($size));
+
+printf("0x%016x\n", $addr);
-- 
2.34.1


