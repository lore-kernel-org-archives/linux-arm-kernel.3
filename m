Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BF9D31763
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyuAtQyhTSA7LS3dSL0vetYnuP2tfqRP4xODv6XglSg=; b=R+i4ztwDCXgKqXpn8SOXPncMOb
	P6hbziQQuOg+VZR0caJNQAba+DhEE6mO25RJnLPNDpP1CSca7HpWQaOHSk5JR2uE+WMBUJDKmpY8y
	ta/WirB7KkE8mgQYlW5OSIX+R6RusfhnULi4t4CPh0wtF2dgja4SjvfAUVgjtC/fehlysgLWRXu1h
	AHolxRymUP+Sd+Kz0V1d++/6AapkSB9UJ/BZ0p9z5xlSJd4n7+yekF2gHWGgdrxiYDpzgB8isrKCz
	DrILrhbFaVIKYMjCd9XXeId0FmykH/sGgijaXjco0kEkZgsKtNFI0jBh5mtNthBGNf/g7PX9w/Gje
	XEaChnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MGa-000000001BD-262G;
	Tue, 05 Nov 2024 16:18:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxJ-0000000HX33-2z7A
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 15:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OyuAtQyhTSA7LS3dSL0vetYnuP2tfqRP4xODv6XglSg=; b=lrH/hE8NNVJpGnN5mc2kEQZREs
	+OpYoFjKQ/xzk48qkLZWGqv+glRtpzz9hQalSdFH/7KvfStOiZl4UxT5BlrzuaTgJkumklusTkPCd
	7rmqg0ktXNdEWIukagbWPiK2Pm2P2AgjMKWqyGwk1oM8fXJIQgmW3+8R9zu/ZiIR1pF7tB9CsYYFE
	f+C2EMz4pCVS9PRLRS4BBDp7Y1txUIB2lTAVb/P4jsKrpZVybn4HwpSS/uphBwb2mdFOt6aUwDBIC
	w5QiXtcM7tcg8rqDqUS7fDBooie92zTjpygrv2rn3RF2RWwfUQcAMcjq0q4/N1XG4ZuAOkDTEKAiQ
	fqHdaCoA==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxF-0000000Bme2-2PUb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:56 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5FtUqF005589;
	Tue, 5 Nov 2024 15:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=O
	yuAtQyhTSA7LS3dSL0vetYnuP2tfqRP4xODv6XglSg=; b=CPFu4gtV3fpBnDk2V
	G+V92zsH//N2nKZoikGD3vayw13hSM1Hcn2babztnT/nK8WBYdZLQe6nTHvm9863
	sGrN9lMoqWkgEzFHG9E9FhltWfmBNPByMRKf8SCoazT6XgQLLljNs+4Tsz9JobCP
	+QeIB9uSsM/JC3mr5LPF6VAhyLFRu92Tw09mH6CtxK/qoxRFdg4Y211/UXzGqL5+
	i9oFk8k888NNnzf6v1U4SYXRObsEGdxtOCgDTv69nXIEv4L74+BRaBLp098Kvurh
	I/QiDeZZ6GjuUqR58JNQRiJ9EZkK1jldAAXxx4v2VytgA46vad95M+w8fhcRsDgg
	MLt4w==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42nd212ju1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:36 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:35 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:22 +0000
Subject: [PATCH 16/21] drm/imagination: Move ELF fw utils to common file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-16-4ed30e865892@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7100;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=UIrxOyYskkd2zV7XfHusZkCrqZMoV3h5lYs9UyJn5W0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOczTnfb0pbFk06G9N4687Pxsu4ntC//T3n+lIvkXP
 QT28X+W6ShlYRDjYJAVU2TZscJyhdofNS2JG7+KYeawMoEMYeDiFICJ/HFnZNgdbbPQ2f9jkvXZ
 y4w10979u3XiptQl3xqlOs7ZyT+v3Wdi+KepkCDn0Lvj4yPRnr6r0idLw/f9mf36p0TlwcCYKWd
 6d7ADAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Q9aA4J2a c=1 sm=1 tr=0 ts=672a40ac cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8 a=nDXPDgtXl5tloLhz4E0A:9 a=QEXdDO2ut3YA:10
 a=CMhdClSkCJESED5Bpcyf:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: NQ5F50QJAP-3yDJEPQ6WleE3Kb4qEiOe
X-Proofpoint-ORIG-GUID: NQ5F50QJAP-3yDJEPQ6WleE3Kb4qEiOe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_155854_104322_9175BEE5 
X-CRM114-Status: GOOD (  21.15  )
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

Currently only MIPS firmware processors use ELF-formatted firmware. When
adding support for RISC-V firmware processors, it will be useful to have
ELF handling functions ready to go.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile      |  1 +
 drivers/gpu/drm/imagination/pvr_fw.h      |  5 +++
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 59 +--------------------------
 drivers/gpu/drm/imagination/pvr_fw_util.c | 67 +++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 9bc6a3884c2239e44265f3cdebee149841b270de..077e4762c7c383b6e339da1584c3865d830ef8d6 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -16,6 +16,7 @@ powervr-y := \
 	pvr_fw_mips.o \
 	pvr_fw_startstop.o \
 	pvr_fw_trace.o \
+	pvr_fw_util.o \
 	pvr_gem.o \
 	pvr_hwrt.o \
 	pvr_job.o \
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index ab69f40a7fbc6304171f16dd16d825a68b0362a5..8d3f0ee0aac69373f15ac5919d5b0f27c67cb284 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -478,4 +478,9 @@ pvr_fw_object_get_fw_addr(struct pvr_fw_object *fw_obj, u32 *fw_addr_out)
 	pvr_fw_object_get_fw_addr_offset(fw_obj, 0, fw_addr_out);
 }
 
+/* Util functions defined in pvr_util.c. These are intended for use in pvr_fw_<arch>.c files. */
+int
+pvr_fw_process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw, u8 *fw_code_ptr,
+				  u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr);
+
 #endif /* PVR_FW_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index 524a9bd0a20b64c509f5708cc61d93b4c864b835..7f341ceb0661c61ac059654faeec91e149036467 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -8,7 +8,6 @@
 #include "pvr_rogue_mips.h"
 #include "pvr_vm_mips.h"
 
-#include <linux/elf.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -16,60 +15,6 @@
 #define ROGUE_FW_HEAP_MIPS_SHIFT 24 /* 16 MB */
 #define ROGUE_FW_HEAP_MIPS_RESERVED_SIZE SZ_1M
 
-/**
- * process_elf_command_stream() - Process ELF firmware image and populate
- *                                firmware sections
- * @pvr_dev: Device pointer.
- * @fw: Pointer to firmware image.
- * @fw_code_ptr: Pointer to FW code section.
- * @fw_data_ptr: Pointer to FW data section.
- * @fw_core_code_ptr: Pointer to FW coremem code section.
- * @fw_core_data_ptr: Pointer to FW coremem data section.
- *
- * Returns :
- *  * 0 on success, or
- *  * -EINVAL on any error in ELF command stream.
- */
-static int
-process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw, u8 *fw_code_ptr,
-			   u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr)
-{
-	struct elf32_hdr *header = (struct elf32_hdr *)fw;
-	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
-	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
-	u32 entry;
-	int err;
-
-	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
-		void *write_addr;
-
-		/* Only consider loadable entries in the ELF segment table */
-		if (program_header->p_type != PT_LOAD)
-			continue;
-
-		err = pvr_fw_find_mmu_segment(pvr_dev, program_header->p_vaddr,
-					      program_header->p_memsz, fw_code_ptr, fw_data_ptr,
-					      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
-		if (err) {
-			drm_err(drm_dev,
-				"Addr 0x%x (size: %d) not found in any firmware segment",
-				program_header->p_vaddr, program_header->p_memsz);
-			return err;
-		}
-
-		/* Write to FW allocation only if available */
-		if (write_addr) {
-			memcpy(write_addr, fw + program_header->p_offset,
-			       program_header->p_filesz);
-
-			memset((u8 *)write_addr + program_header->p_filesz, 0,
-			       program_header->p_memsz - program_header->p_filesz);
-		}
-	}
-
-	return 0;
-}
-
 static int
 pvr_mips_init(struct pvr_device *pvr_dev)
 {
@@ -100,8 +45,8 @@ pvr_mips_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
 	u32 page_nr;
 	int err;
 
-	err = process_elf_command_stream(pvr_dev, fw, fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
-					 fw_core_data_ptr);
+	err = pvr_fw_process_elf_command_stream(pvr_dev, fw, fw_code_ptr, fw_data_ptr,
+						fw_core_code_ptr, fw_core_data_ptr);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_util.c b/drivers/gpu/drm/imagination/pvr_fw_util.c
new file mode 100644
index 0000000000000000000000000000000000000000..7bc8a5c48e9b0eed2045607ab2cfed80a60a32b5
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_util.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright (c) 2024 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+
+#include <linux/elf.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+/**
+ * pvr_fw_process_elf_command_stream() - Process ELF firmware image and populate
+ *                                       firmware sections
+ * @pvr_dev: Device pointer.
+ * @fw: Pointer to firmware image.
+ * @fw_code_ptr: Pointer to FW code section.
+ * @fw_data_ptr: Pointer to FW data section.
+ * @fw_core_code_ptr: Pointer to FW coremem code section.
+ * @fw_core_data_ptr: Pointer to FW coremem data section.
+ *
+ * Returns :
+ *  * 0 on success, or
+ *  * -EINVAL on any error in ELF command stream.
+ */
+int
+pvr_fw_process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw,
+				  u8 *fw_code_ptr, u8 *fw_data_ptr,
+				  u8 *fw_core_code_ptr, u8 *fw_core_data_ptr)
+{
+	struct elf32_hdr *header = (struct elf32_hdr *)fw;
+	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 entry;
+	int err;
+
+	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
+		void *write_addr;
+
+		/* Only consider loadable entries in the ELF segment table */
+		if (program_header->p_type != PT_LOAD)
+			continue;
+
+		err = pvr_fw_find_mmu_segment(pvr_dev, program_header->p_vaddr,
+					      program_header->p_memsz, fw_code_ptr, fw_data_ptr,
+					      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
+		if (err) {
+			drm_err(drm_dev,
+				"Addr 0x%x (size: %d) not found in any firmware segment",
+				program_header->p_vaddr, program_header->p_memsz);
+			return err;
+		}
+
+		/* Write to FW allocation only if available */
+		if (write_addr) {
+			memcpy(write_addr, fw + program_header->p_offset,
+			       program_header->p_filesz);
+
+			memset((u8 *)write_addr + program_header->p_filesz, 0,
+			       program_header->p_memsz - program_header->p_filesz);
+		}
+	}
+
+	return 0;
+}

-- 
2.47.0


