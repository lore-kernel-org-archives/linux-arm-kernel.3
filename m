Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3271DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6i59xOsB2P1poB0rSQ5FPpBfoLh4uAEDe2LmcbwelDg=; b=FE2kiaP31ix6VN9JL+necLbkJa
	vwB12+0xz4dgYTIYLePGh922jUFmrXmz9j6KNNUWc1Q2bxQFrYiNQu0K0pxD5atONYFuo469yRXL4
	wXacnZhXPD1VKBv5FAKprd3j+gt6Y26D1yGA/eCdRIscsXeoX+6rD7QUbRiFtl0BAXbdYPlMFNNFd
	7D22NwojgPMZncIQb1Az4ld5dj6U9AalTq0PGUlK6oVCilthj1xbcaqhjk2spl32jZ4ntLwuE6twz
	MVYOOvs+G2zBNYI0SZ0t3ieEpiEF2P05HIRBoNdQR9efOTBXsZjCMUkRvGpxHbQAx90DjAojv6YfG
	C+OQYDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsQ2-000000039FY-1WHg;
	Fri, 16 May 2025 10:35:58 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsGv-0000000384W-0HKu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 10:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1747391189;
	bh=6i59xOsB2P1poB0rSQ5FPpBfoLh4uAEDe2LmcbwelDg=;
	h=From:To:Cc:Subject:Date:From;
	b=FHI8037Cbd3vejQlthmvBYBGSCM0cKrF0FoXmevvW73Q/D2YSXURyNIiv8b13IP9O
	 xMY2srcR9H5V4rftjfpLk45pGQKHxPtIUUPQVTuLkG+VRj70j3Yj8aNlvF81vxNhsG
	 N8Z7rZYFrAoL6uODytsqsp+6XFnIjvmmkhKAVNbg=
Received: from stargazer.. (unknown [IPv6:240e:457:1000:4d1d:620b:9b2:5a59:f0a1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 400A265F62;
	Fri, 16 May 2025 06:26:21 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Mingcong Bai <jeffbai@aosc.io>,
	Xi Ruoyao <xry111@xry111.site>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: [PATCH v3] arm64: Add override for MPAM
Date: Fri, 16 May 2025 18:25:56 +0800
Message-ID: <20250516102556.9688-1-xry111@xry111.site>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_032633_130147_C4B7A875 
X-CRM114-Status: GOOD (  19.41  )
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

As the message of the commit 09e6b306f3ba ("arm64: cpufeature: discover
CPU support for MPAM") already states, if a buggy firmware fails to
either enable MPAM or emulate the trap as if it were disabled, the
kernel will just fail to boot.  While upgrading the firmware should be
the best solution, we have some hardware of which the vendor have made
no response 2 months after we requested a firmware update.  Allow
overriding it so our devices don't become some e-waste.

Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Mingcong Bai <jeffbai@aosc.io>
Tested-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
Tested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---

[v2]->v3:
- Fix typos in the subject and a comment.
- Remove a useless #include directive.

[v1]->v2:
- Handle the override and initialize EL2 mpam in finalise_el2_state
- Move info->mpamidr assignment to {init,update}_cpu_features

[v1]: https://lore.kernel.org/linux-arm-kernel/20250401055650.22542-1-xry111@xry111.site/

 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/arm64/include/asm/el2_setup.h            | 24 ++++++++-----------
 arch/arm64/kernel/cpufeature.c                |  7 ++++--
 arch/arm64/kernel/cpuinfo.c                   |  7 ++++--
 arch/arm64/kernel/pi/idreg-override.c         |  2 ++
 5 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8f75ec177399..0bfcbeab7a3b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -458,6 +458,9 @@
 	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
 			Set instructions support
 
+	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
+			Monitoring support
+
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
 
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index d40e427ddad9..2e6b9086efc5 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -294,19 +294,6 @@
 .Lskip_gcs_\@:
 .endm
 
-.macro __init_el2_mpam
-	/* Memory Partitioning And Monitoring: disable EL2 traps */
-	mrs	x1, id_aa64pfr0_el1
-	ubfx	x0, x1, #ID_AA64PFR0_EL1_MPAM_SHIFT, #4
-	cbz	x0, .Lskip_mpam_\@		// skip if no MPAM
-	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
-						// and disable lower traps
-	mrs_s	x0, SYS_MPAMIDR_EL1
-	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@	// skip if no MPAMHCR reg
-	msr_s	SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
-.Lskip_mpam_\@:
-.endm
-
 /**
  * Initialize EL2 registers to sane values. This should be called early on all
  * cores that were booted in EL2. Note that everything gets initialised as
@@ -324,7 +311,6 @@
 	__init_el2_stage2
 	__init_el2_gicv3
 	__init_el2_hstr
-	__init_el2_mpam
 	__init_el2_nvhe_idregs
 	__init_el2_cptr
 	__init_el2_fgt
@@ -371,6 +357,16 @@
 #endif
 
 .macro finalise_el2_state
+	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
+
+.Linit_mpam_\@:
+	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
+						// and disable lower traps
+	mrs_s	x0, SYS_MPAMIDR_EL1
+	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@  // skip if no MPAMHCR reg
+	msr_s   SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
+
+.Lskip_mpam_\@:
 	check_override id_aa64pfr0, ID_AA64PFR0_EL1_SVE_SHIFT, .Linit_sve_\@, .Lskip_sve_\@, x1, x2
 
 .Linit_sve_\@:	/* SVE register access */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 4c46d80aa64b..7b8c998a0466 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1198,8 +1198,10 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
+	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
+	}
 
 	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
@@ -1450,7 +1452,8 @@ void update_cpu_features(int cpu,
 		cpacr_restore(cpacr);
 	}
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0)) {
+	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
+		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
 					info->reg_mpamidr, boot->reg_mpamidr);
 	}
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 285d7d538342..15d39fbc6085 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -494,8 +494,11 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
 		__cpuinfo_store_cpu_32bit(&info->aarch32);
 
-	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
-		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
+	/*
+	 * info->reg_mpamidr deferred to {init,update}_cpu_features because we
+	 * don't want to read it (and trigger a trap on buggy firmware) if
+	 * using an aa64pfr0_el1 override to unconditionally disable MPAM.
+	 */
 
 	if (IS_ENABLED(CONFIG_ARM64_SME) &&
 	    id_aa64pfr1_sme(info->reg_id_aa64pfr1)) {
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index c6b185b885f7..836e5a9b98d0 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -127,6 +127,7 @@ static const struct ftr_set_desc pfr0 __prel64_initconst = {
 	.fields		= {
 	        FIELD("sve", ID_AA64PFR0_EL1_SVE_SHIFT, pfr0_sve_filter),
 		FIELD("el0", ID_AA64PFR0_EL1_EL0_SHIFT, NULL),
+		FIELD("mpam", ID_AA64PFR0_EL1_MPAM_SHIFT, NULL),
 		{}
 	},
 };
@@ -246,6 +247,7 @@ static const struct {
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },
 	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
 	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
+	{ "arm64.nompam",		"id_aa64pfr0.mpam=0" },
 };
 
 static int __init parse_hexdigit(const char *p, u64 *v)
-- 
2.49.0


