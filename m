Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE64EC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 01:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ke8cvJN/HfyiHGq5dWCetxLWOqUXILvWweb02I4ZK1c=; b=m3HhkQzykIqpBVYKhWpTq2DfYX
	pySYEwRWz9AhPBV1IiLG51++lewu6m4KudzV0Tp6WNpL2TY4yTxywBU2Suvm6cOqhWYyJgTAnmlA/
	H0GTsnZcH8tArnr9UuLgisfx8SUqrqb+Xapjfm3yh2P7DSuDEM8LDV9hEHxeBDC1Fpz8ZuiJ/DKaE
	Qqnpl6VatAQjXsui1ramXDFfwG5+5Y+2SESqm1wXSDv+WBl2W6xbgXg0FaddI/AIWRGPI5ULzioAa
	/+zg1WD+nG656f/FazQGY2kiZKyOowPTHOT38k8k3/qLoPMEiBh8aMz1OPGTfy45l9VQ9Hv7Cs/2a
	/l8nwP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1qq-00000005s7o-3Heq;
	Wed, 12 Feb 2025 01:47:44 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1mf-00000005r3n-3T9g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 01:43:27 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7E4B22107AB7;
	Tue, 11 Feb 2025 17:43:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7E4B22107AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739324603;
	bh=ke8cvJN/HfyiHGq5dWCetxLWOqUXILvWweb02I4ZK1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HBSEQ717Slt2XikuFXsv6EVMcSlkRpZmNGfZWorh0dzembs4fchjiNu946G6p0Pos
	 NJEHBGxXxmJHGILF4w9YBh9Bc/mqdVs1wG8zfhiioyX0nYfyP+l2xWCwM3AF3DMOAd
	 rIM8Kt2aVsfaBgHnF1RPL5yBOSEdHukKmafKctNA=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mingo@redhat.com,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect hypervisor presence
Date: Tue, 11 Feb 2025 17:43:16 -0800
Message-ID: <20250212014321.1108840-2-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212014321.1108840-1-romank@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174325_913600_4DBA9383 
X-CRM114-Status: GOOD (  15.32  )
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

The arm64 Hyper-V startup path relies on ACPI to detect
running under a Hyper-V compatible hypervisor. That
doesn't work on non-ACPI systems.

Hoist the ACPI detection logic into a separate function. Then
use the vendor-specific hypervisor service call (implemented
recently in Hyper-V) via SMCCC in the non-ACPI case.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c      | 43 +++++++++++++++++++++++++++----
 arch/arm64/include/asm/mshyperv.h |  5 ++++
 2 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index fc49949b7df6..fe6185bf3bf2 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -27,6 +27,36 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 	return 0;
 }
 
+static bool hyperv_detect_via_acpi(void)
+{
+	if (acpi_disabled)
+		return false;
+#if IS_ENABLED(CONFIG_ACPI)
+	/* Hypervisor ID is only available in ACPI v6+. */
+	if (acpi_gbl_FADT.header.revision < 6)
+		return false;
+	return strncmp((char *)&acpi_gbl_FADT.hypervisor_id, "MsHyperV", 8) == 0;
+#else
+	return false;
+#endif
+}
+
+static bool hyperv_detect_via_smccc(void)
+{
+	struct arm_smccc_res res = {};
+
+	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
+		return false;
+	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
+		return false;
+
+	return res.a0 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_0 &&
+		res.a1 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_1 &&
+		res.a2 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_2 &&
+		res.a3 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_3;
+}
+
 static int __init hyperv_init(void)
 {
 	struct hv_get_vp_registers_output	result;
@@ -35,13 +65,11 @@ static int __init hyperv_init(void)
 
 	/*
 	 * Allow for a kernel built with CONFIG_HYPERV to be running in
-	 * a non-Hyper-V environment, including on DT instead of ACPI.
+	 * a non-Hyper-V environment.
+	 *
 	 * In such cases, do nothing and return success.
 	 */
-	if (acpi_disabled)
-		return 0;
-
-	if (strncmp((char *)&acpi_gbl_FADT.hypervisor_id, "MsHyperV", 8))
+	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
 		return 0;
 
 	/* Setup the guest ID */
@@ -72,6 +100,11 @@ static int __init hyperv_init(void)
 		return ret;
 	}
 
+	ms_hyperv.vtl = get_vtl();
+	/* Report if non-default VTL */
+	if (ms_hyperv.vtl > 0)
+		pr_info("Linux runs in Hyper-V Virtual Trust Level\n");
+
 	ms_hyperv_late_init();
 
 	hyperv_initialized = true;
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index 2e2f83bafcfb..a6d7eb9e167b 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -50,4 +50,9 @@ static inline u64 hv_get_msr(unsigned int reg)
 
 #include <asm-generic/mshyperv.h>
 
+#define ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_0	0x4d32ba58U
+#define ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_1	0xcd244764U
+#define ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_2	0x8eef6c75U
+#define ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_3	0x16597024U
+
 #endif
-- 
2.43.0


