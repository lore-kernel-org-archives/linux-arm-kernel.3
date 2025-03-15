Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A51C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvhsAAfn7qJdbIzMAT/QGP63mN5kUeL+Wsxr6okLB4c=; b=CM5eZNpPCtc5nFQ8Hj4SzB3J2q
	RPiCZ7tzb2qMfnmuZIhs26SVuq5sa3gSyh1rWJ7YFEEmlj6AkKv9IGdEeNidcJOKo24e+XOluOcYZ
	DHynckR1EKDfkfa3b0/7F4QNkmDDMJNlpMUdkSEppWxxXjHPZd5bTXp9qyRoipQXWAHoAEyZt+O+q
	GHUSnt07SI2JyGk2Ut5TfQPx+2n2di3mLTMXKYrFMREbATsGDwHuza3jnlJyaKzF8B5Epx2k9i/mb
	K1CvjNPU9/NGj/5i5UgFpF2Fjk62fKpJ08MVot5IkkeHo+osmILr2y5r9VF4JefBFEt9cWrswQuvB
	w3dvMYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFIs-0000000FaYN-3H8c;
	Sat, 15 Mar 2025 00:23:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFFW-0000000FZQh-3f9b
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 00:19:36 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9FAF2203345D;
	Fri, 14 Mar 2025 17:19:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9FAF2203345D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741997973;
	bh=qvhsAAfn7qJdbIzMAT/QGP63mN5kUeL+Wsxr6okLB4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWtm2YXeI3ejA1AOMhUMiCsrzrjKAnn8wiBqX+0nwWYdyMFngl/5nAA/bILFTv1ym
	 /iKGt5OhMYPVwJ8upXLKFz47A7Ky9zPzxXuzi0i1ePO7wt+gWxUXw6UxnLVtDIXdQt
	 ZCnxb60PB7Qz/5qsavDrXVwqwiJx2oMWxx+awxcc=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lenb@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@redhat.com,
	oliver.upton@linux.dev,
	rafael@kernel.org,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v6 02/11] arm64: hyperv: Use SMCCC to detect hypervisor presence
Date: Fri, 14 Mar 2025 17:19:22 -0700
Message-ID: <20250315001931.631210-3-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250315001931.631210-1-romank@linux.microsoft.com>
References: <20250315001931.631210-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_171934_968001_0F8DA733 
X-CRM114-Status: GOOD (  15.34  )
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
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/arm64/hyperv/mshyperv.c | 43 +++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 2265ea5ce5ad..c5b03d3af7c5 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -27,6 +27,41 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 	return 0;
 }
 
+static bool __init hyperv_detect_via_acpi(void)
+{
+	if (acpi_disabled)
+		return false;
+#if IS_ENABLED(CONFIG_ACPI)
+	/*
+	 * Hypervisor ID is only available in ACPI v6+, and the
+	 * structure layout was extended in v6 to accommodate that
+	 * new field.
+	 *
+	 * At the very minimum, this check makes sure not to read
+	 * past the FADT structure.
+	 *
+	 * It is also needed to catch running in some unknown
+	 * non-Hyper-V environment that has ACPI 5.x or less.
+	 * In such a case, it can't be Hyper-V.
+	 */
+	if (acpi_gbl_FADT.header.revision < 6)
+		return false;
+	return strncmp((char *)&acpi_gbl_FADT.hypervisor_id, "MsHyperV", 8) == 0;
+#else
+	return false;
+#endif
+}
+
+static bool __init hyperv_detect_via_smccc(void)
+{
+	uuid_t hyperv_uuid = UUID_INIT(
+		0x4d32ba58, 0x4764, 0xcd24,
+		0x75, 0x6c, 0xef, 0x8e,
+		0x24, 0x70, 0x59, 0x16);
+
+	return arm_smccc_hyp_present(&hyperv_uuid);
+}
+
 static int __init hyperv_init(void)
 {
 	struct hv_get_vp_registers_output	result;
@@ -35,13 +70,11 @@ static int __init hyperv_init(void)
 
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
-- 
2.43.0


