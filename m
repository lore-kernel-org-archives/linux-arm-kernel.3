Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C818D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GY/3BAplObLOWLiMmMhdzuiyonlo2hPySFg8J0DmMRg=; b=mCWmQT3mtuofW2JpILdmx41NYb
	5kJ/fewez4DA6R6PT+l8RlKoKjX8yW6svfgqegQ7pQXrOoaFXwng+ZN8qZhLBMv4bwpqZHrsOatrm
	fwg036aOBN5xNVtO/yR8mkSrHX4OW9ViUWSyF4jaDw8w1xbmDpB99VPI8WPDuETbIdv2MO2ARB4An
	sp7i/0Bf+Mvy4vdV//JwDqimN0R+s0Pb/Hv91ytDk2DJjbeqstgHQwVFVOfhFuzMGGrUnnphaFJJk
	DCgSAZxxQr4J0n5+O0dRTx708j2o2fyFlejBmS+rx9M1W90f/242PbPeVEjF19brjBhTn5QoYtwel
	CJH0PJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Si-00000003HOa-3rAP;
	Tue, 20 Jan 2026 06:43:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sd-00000003HLO-1qsS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:32 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0AF6020B716C;
	Mon, 19 Jan 2026 22:43:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0AF6020B716C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891410;
	bh=GY/3BAplObLOWLiMmMhdzuiyonlo2hPySFg8J0DmMRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OyE5IrEXEydCDRpaah6ewzB23X17QX/RjBGB29tQkSo3l2hB8CFiO6YmqRj0708qp
	 EfkZmdhRxrU1OIR3rZ4960CcronEfP/kE700rK8djoXhNeQhKHhgnxNT6HJRWUZ94I
	 Oo0gffN1n2BT7OZCtpE2b2IsuJYEKTvJMyFBk6po=
From: Mukesh R <mrathor@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joro@8bytes.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	nunodasneves@linux.microsoft.com,
	mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: [PATCH v0 03/15] x86/hyperv: add insufficient memory support in irqdomain.c
Date: Mon, 19 Jan 2026 22:42:18 -0800
Message-ID: <20260120064230.3602565-4-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224331_509220_F2E2100E 
X-CRM114-Status: GOOD (  12.87  )
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

From: Mukesh Rathor <mrathor@linux.microsoft.com>

Passthru exposes insufficient memory hypercall failure in the current map
device interrupt hypercall. In case of such a failure, we must deposit
more memory and redo the hypercall. Add support for that. Deposit memory
needs partition id, make that a parameter to the map interrupt function.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 arch/x86/hyperv/irqdomain.c | 38 +++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
index f6b61483b3b8..ccbe5848a28f 100644
--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -13,8 +13,9 @@
 #include <linux/irqchip/irq-msi-lib.h>
 #include <asm/mshyperv.h>
 
-static int hv_map_interrupt(union hv_device_id hv_devid, bool level,
-		int cpu, int vector, struct hv_interrupt_entry *ret_entry)
+static u64 hv_map_interrupt_hcall(u64 ptid, union hv_device_id hv_devid,
+				  bool level, int cpu, int vector,
+				  struct hv_interrupt_entry *ret_entry)
 {
 	struct hv_input_map_device_interrupt *input;
 	struct hv_output_map_device_interrupt *output;
@@ -30,8 +31,10 @@ static int hv_map_interrupt(union hv_device_id hv_devid, bool level,
 
 	intr_desc = &input->interrupt_descriptor;
 	memset(input, 0, sizeof(*input));
-	input->partition_id = hv_current_partition_id;
+
+	input->partition_id = ptid;
 	input->device_id = hv_devid.as_uint64;
+
 	intr_desc->interrupt_type = HV_X64_INTERRUPT_TYPE_FIXED;
 	intr_desc->vector_count = 1;
 	intr_desc->target.vector = vector;
@@ -64,6 +67,28 @@ static int hv_map_interrupt(union hv_device_id hv_devid, bool level,
 
 	local_irq_restore(flags);
 
+	return status;
+}
+
+static int hv_map_interrupt(u64 ptid, union hv_device_id device_id, bool level,
+			    int cpu, int vector,
+			    struct hv_interrupt_entry *ret_entry)
+{
+	u64 status;
+	int rc, deposit_pgs = 16;		/* don't loop forever */
+
+	while (deposit_pgs--) {
+		status = hv_map_interrupt_hcall(ptid, device_id, level, cpu,
+						vector, ret_entry);
+
+		if (hv_result(status) != HV_STATUS_INSUFFICIENT_MEMORY)
+			break;
+
+		rc = hv_call_deposit_pages(NUMA_NO_NODE, ptid, 1);
+		if (rc)
+			break;
+	};
+
 	if (!hv_result_success(status))
 		hv_status_err(status, "\n");
 
@@ -199,8 +224,8 @@ int hv_map_msi_interrupt(struct irq_data *data,
 	hv_devid = hv_build_devid_type_pci(pdev);
 	cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
 
-	return hv_map_interrupt(hv_devid, false, cpu, cfg->vector,
-				out_entry ? out_entry : &dummy);
+	return hv_map_interrupt(hv_current_partition_id, hv_devid, false, cpu,
+				cfg->vector, out_entry ? out_entry : &dummy);
 }
 EXPORT_SYMBOL_GPL(hv_map_msi_interrupt);
 
@@ -422,6 +447,7 @@ int hv_map_ioapic_interrupt(int ioapic_id, bool level, int cpu, int vector,
 	hv_devid.device_type = HV_DEVICE_TYPE_IOAPIC;
 	hv_devid.ioapic.ioapic_id = (u8)ioapic_id;
 
-	return hv_map_interrupt(hv_devid, level, cpu, vector, entry);
+	return hv_map_interrupt(hv_current_partition_id, hv_devid, level, cpu,
+				vector, entry);
 }
 EXPORT_SYMBOL_GPL(hv_map_ioapic_interrupt);
-- 
2.51.2.vfs.0.1


