Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D69FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bECw3EsseEirtVQombF/0xruVz+qGRMuLn4PkfpuhP0=; b=SdwC/XKhN30rQuetbLEKEoetSL
	wmXAkCba7v/BDXbZys5jUVEPwN24DIkbCGzvI2Ll9E9JGdcmDLwz4fs5XcHo1ldnLsdgxYAar6NFa
	RfXyb7cWD2fHjdbhBMYoYMsB7QneRfqKu9l8QmLXUM22aQSPEPDiG/zF5KT3GQS44RZR9FVX0Z/La
	tOBTHnjjRHi1OhyQGgWEMTbPvS9GUqWsf45Cd8lIg78wnpLK8MU5lbOVpMqsxDXpX9TR4z9LdDu6I
	thUXaUxLnuvxaR6U1Gr4r/KrqkSGWjrcw9LHEhUsV9WgkO9G3mHSQZ7injR41uJ2PZdY0xQ9rjADY
	T32A7jPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIA0-0000000GkaG-2hqN;
	Tue, 05 May 2026 15:58:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKI9x-0000000GkYT-30xY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:58:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E337307A;
	Tue,  5 May 2026 08:58:03 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C72E73F905;
	Tue,  5 May 2026 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777996688; bh=Xuvp4LNkPrZpjDlqGpQ4sGF4Ii5mNXQnM6ZUP+x7rAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E8Xvr1s1w0Vw41RrUKGBrRUY7pIvIlsrk73D9zWIG+d69xQKqsVd5yl/LCnCIBqxp
	 p+u8xqJUWpy3y3qtWaLfJSfOjTn1JS/L9B8sCTm9ypNsYEbt9ZJntArqiglm5ndNk3
	 C4wFq6k8grXog9iAg1ZyAFaXhJXzD6UIZUijl4xQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	sudeep.holla@arm.com,
	robh@kernel.org,
	maz@kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [RFC PATCH v2 2/4] psci: Add support for Early detection and init
Date: Tue,  5 May 2026 16:57:40 +0100
Message-ID: <20260505155742.623287-3-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505155742.623287-1-suzuki.poulose@arm.com>
References: <20260429103535.266728-1-suzuki.poulose@arm.com>
 <20260505155742.623287-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_085809_935993_4B60A6C6 
X-CRM114-Status: GOOD (  20.79  )
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

Allow early detection of the PSCI conduit and presence of SMCCC. Primary motive
is to detect if we are a Realm as early as possible to make better decisions

 1. For mapping the memory without BBML2_NOABORT
 2. Making use of the earlycon, to be able to debug problems at early boot.

Add a new psci_early_init_conduit() which can probe the PSCI and SMCCC. This is
optional, and could really fallback to the normal if the architecture cannot
reliably detect the conduit. Later patches will make use of this.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/firmware/psci/psci.c | 49 ++++++++++++++++++++++++++++++++++--
 include/linux/psci.h         |  2 ++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22..fa0839513d64 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -80,6 +80,11 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+static inline bool psci_probed(void)
+{
+	return psci_ops.get_version != NULL;
+}
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -270,6 +275,15 @@ static unsigned long psci_migrate_info_up_cpu(void)
 
 static void set_conduit(enum arm_smccc_conduit conduit)
 {
+	/*
+	 * If we have set the conduit already, make sure
+	 * it is the same as we have found.
+	 */
+	if (psci_conduit != SMCCC_CONDUIT_NONE) {
+		WARN_ON(conduit != psci_conduit);
+		return;
+	}
+
 	switch (conduit) {
 	case SMCCC_CONDUIT_HVC:
 		invoke_psci_fn = __invoke_psci_fn_hvc;
@@ -679,7 +693,16 @@ static void __init psci_0_2_set_functions(void)
  */
 static int __init psci_probe(void)
 {
-	u32 ver = psci_0_2_get_version();
+	u32 ver;
+
+	/* Make sure we have a set CONDUIT */
+	if (WARN_ON(psci_conduit == SMCCC_CONDUIT_NONE))
+		return -ENODEV;
+
+	if (WARN_ON(psci_probed()))
+		return 0;
+
+	ver = psci_0_2_get_version();
 
 	pr_info("PSCIv%d.%d detected in firmware.\n",
 			PSCI_VERSION_MAJOR(ver),
@@ -717,10 +740,12 @@ static int __init psci_0_2_init(const struct device_node *np)
 {
 	int err;
 
+	if (psci_probed())
+		return 0;
+
 	err = get_set_conduit_method(np);
 	if (err)
 		return err;
-
 	/*
 	 * Starting with v0.2, the PSCI specification introduced a call
 	 * (PSCI_VERSION) that allows probing the firmware version, so
@@ -739,6 +764,9 @@ static int __init psci_0_1_init(const struct device_node *np)
 	u32 id;
 	int err;
 
+	if (psci_probed())
+		return 0;
+
 	err = get_set_conduit_method(np);
 	if (err)
 		return err;
@@ -816,6 +844,20 @@ int __init psci_dt_init(void)
 	return ret;
 }
 
+int __init psci_early_init_conduit(enum arm_smccc_conduit conduit)
+{
+	switch (conduit) {
+	case SMCCC_CONDUIT_HVC:
+	case SMCCC_CONDUIT_SMC:
+		set_conduit(conduit);
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+	return psci_probe();
+}
+
 #ifdef CONFIG_ACPI
 /*
  * We use PSCI 0.2+ when ACPI is deployed on ARM64 and it's
@@ -823,6 +865,9 @@ int __init psci_dt_init(void)
  */
 int __init psci_acpi_init(void)
 {
+	if (psci_probed())
+		return 0;
+
 	if (!acpi_psci_present()) {
 		pr_info("is not implemented in ACPI.\n");
 		return -EOPNOTSUPP;
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc4..8f98d61a69e4 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -59,4 +59,6 @@ static inline bool acpi_psci_present(void) { return false; }
 static inline bool acpi_psci_use_hvc(void) {return false; }
 #endif
 
+int __init psci_early_init_conduit(enum arm_smccc_conduit);
+
 #endif /* __LINUX_PSCI_H */
-- 
2.43.0


