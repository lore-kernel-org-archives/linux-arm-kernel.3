Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D5FC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 22:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2+6YzGCH9kvF8OEuWUHwwZtKWajMltLjCzPTk0Dvcs=; b=Ew2XM3Q281eEyZzT9CvXgehFmI
	igxdfVeYb0YqjGrfA0nKNhRjSZtpBBqZbDSca3Vp+wC4G6TD/Ntx/mjhdg8RYYnPIwNzxqBS5MrNf
	FM0ODwb3+HrGrCXNTRiUbV6huQmM2zL7pjWAvwb9wvqs7PUC6EJuLWgXV+QTMabexE0MlN1KZ8DE7
	zuuFyFGEc3kzSsRmS0gLRouYWr9FlAae89Te4YfM04r2kryEx9eBq7DkqPhu2INcr94qClTfwgQKb
	6M58QjexxB653FJARKPOxmwhh7XOtl7SXxuF2/IMhkoHRg2OYsOh34/GvZjkST3f+gcoFD/LmcKQS
	wHYUJkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfrT-0000000FfJP-0VSl;
	Fri, 07 Mar 2025 22:08:07 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfmc-0000000FdxK-44zD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 22:03:08 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 437382038F41;
	Fri,  7 Mar 2025 14:03:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 437382038F41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741384986;
	bh=x2+6YzGCH9kvF8OEuWUHwwZtKWajMltLjCzPTk0Dvcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=In1feEoej6g5R7YwZKrifZ7XSySTtbdcPhNwaBQT5494/M+viSKmvOWWNrrNvQ/Oz
	 xNuxOm3d0XjQT+vyIU0IFIgfV3vHUxLsfWAki95awHyrPmpsE30jQoPkJE117JU+C7
	 ii1Hw0jDB8CvmyB6mMfoA6GPskf6aNzT23flev+Q=
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
Subject: [PATCH hyperv-next v5 02/11] arm64: hyperv: Use SMCCC to detect hypervisor presence
Date: Fri,  7 Mar 2025 14:02:54 -0800
Message-ID: <20250307220304.247725-3-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307220304.247725-1-romank@linux.microsoft.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_140307_094306_120060C9 
X-CRM114-Status: GOOD (  15.60  )
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
 arch/arm64/hyperv/mshyperv.c | 43 +++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 29fcfd595f48..c647db56fd6b 100644
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


