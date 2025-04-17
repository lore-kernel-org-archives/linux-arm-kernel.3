Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D7C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrWZEBaWAkproY8CI+qS1Q6z3QO/fCAcsTOlY185XKo=; b=sLq6UCTMIY1J9rMi52GPyzNS1y
	L9nqg2LEU8z9Ik67XUjIwRy01goxGAYtGK/Ob29N2fKFrNTFI3DW3uPnuOH6DUYrkGvFgxzhV40HS
	FYbYnMnGRguWeukF4Mou0wcM5l6SMBpGLBRQ3qLScd0IZPRSi0WOVFNwZBAPr7UPpQHemfEAp0oQr
	KXWmgic5606BFX5J8dJqivQjDgQaXf1+ONdsnprjLuQihBJw4/V+ZqZc1lhumjGvvsXGt1hEinGUe
	3RaJNhrIkMhVvYwTvlV3QzG1rnoqyN66FYE8QD2yKmatMO1mYEO7R+1a8q9vDZxmVCh9XZPU9BUz1
	6EsNX74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PbZ-0000000DCIO-1fi1;
	Thu, 17 Apr 2025 13:48:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PBh-0000000D86T-41yP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 13:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NrWZEBaWAkproY8CI+qS1Q6z3QO/fCAcsTOlY185XKo=; b=JcYwNWH0bkNp9PjcDJFD9V4PDB
	ZE607Qa6F/ITvKbIpOElyrf2lkSlenxFEOs4blsTl2o4pj1oY07VlOm5DIWb6YOmB5/C4gafCAJE1
	nCVun99tu4nARmLWE/0ose4WFoOBDTlYWxqhC4xHTgKIEFZY3Vzg1KihZ230kXZdFi4awIfrrtbj7
	FMcl9eXpokJXvZnxA11/5esklHe5x64T8faOR0eopWks8Zcjp14qajGmdGAASL0jlQU1tes/vFD4p
	coxFHxDegy+WmhmhC87NglCvlhw6TbGEYWcVcktmlLLAz5N6/ly3NpBoAclkQoIGs3yZPbVUVnA7s
	T+CsoUUw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5PBc-0000000AIgn-2r3A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:21:52 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HB3Wok009343;
	Thu, 17 Apr 2025 15:21:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NrWZEBaWAkproY8CI+qS1Q6z3QO/fCAcsTOlY185XKo=; b=lDc0YiXTREIbwcIC
	B2Y2Chk00CN81va+2lLgowyCMSPHhsoUtJo13DeRFoaHAWxNfHz9WGwySEV2mL3E
	p9Nqy3rHwAKZbr7hNX5jWux5jP2Cr65y8xNM4Ky77TQ9/JOLYXwNGC+EBJvDddVe
	Mvoxuqqh9jt67KExsR+h1oDDglGb69MhF3CI0Fp8Je9sgKy6mxG9U71nsnuIgY7O
	z3/s1qC0bcr7E41ltXm4R4sHsqVG6L6KjHqI0QW/kFTDY9pYqAs2saeIkeqU9L38
	yrT0bA3chP5ZF3+JoZP06YaHFvzlnlrwxhFhlRul/vCk+LEyPDBFnUE639oatEH7
	ZNbvew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46034ndvgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:21:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7251140057;
	Thu, 17 Apr 2025 15:20:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D6A3996A64;
	Thu, 17 Apr 2025 15:18:51 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 15:18:51 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <cassel@kernel.org>, <johan+linaro@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 3/9] dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
Date: Thu, 17 Apr 2025 15:18:27 +0200
Message-ID: <20250417131833.3427126-4-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417131833.3427126-1-christian.bruel@foss.st.com>
References: <20250417131833.3427126-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_142148_879272_6BA4BADB 
X-CRM114-Status: GOOD (  11.66  )
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

STM32MP25 PCIe Controller is based on the DesignWare core configured as
end point mode from the SYSCFG register.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/pci/st,stm32-pcie-ep.yaml        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml

diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
new file mode 100644
index 000000000000..fc1bbe19e616
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32MP25 PCIe Endpoint
+
+maintainers:
+  - Christian Bruel <christian.bruel@foss.st.com>
+
+description:
+  PCIe endpoint controller based on the Synopsys DesignWare PCIe core.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie-ep.yaml#
+  - $ref: /schemas/pci/st,stm32-pcie-common.yaml#
+
+properties:
+  compatible:
+    const: st,stm32mp25-pcie-ep
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers.
+      - description: PCIe configuration registers.
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: addr_space
+
+  reset-gpios:
+    description: GPIO controlled connection to PERST# signal
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+required:
+  - phys
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    pcie-ep@48400000 {
+        compatible = "st,stm32mp25-pcie-ep";
+        reg = <0x48400000 0x400000>,
+              <0x10000000 0x8000000>;
+        reg-names = "dbi", "addr_space";
+        clocks = <&rcc CK_BUS_PCIE>;
+        phys = <&combophy PHY_TYPE_PCIE>;
+        resets = <&rcc PCIE_R>;
+        pinctrl-names = "default", "init";
+        pinctrl-0 = <&pcie_pins_a>;
+        pinctrl-1 = <&pcie_init_pins_a>;
+        reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
+        access-controllers = <&rifsc 68>;
+        power-domains = <&CLUSTER_PD>;
+    };
-- 
2.34.1


