Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B70C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhOEEMHI/nRYp11Ph+S+PlR1DHlnxLJ3PZkuoX7/3EE=; b=CgJDmKYRF67IGUkRnS3RTaIiYj
	NljY59J88YKz6BXKExBCNOw7Nm1PVROu2hR2+EgEf1G5bJjE5qSTVyPKKDKRqBXeHaUaZcwM2FVfX
	hkUqOkh55LU1zuR2RTn86Iz03bPyclaOGFltfBAp9Av5+DRe9Xh5cYElClsFq2GqOvo1zdQjJYXDV
	rWv6iAjo/XibeTgJUXABX/04efECuDDJoTdePFeAtrm1LnaCnVK/WSlknH4KvHtLfjr0b5y41rEoq
	SzBBKEkApEhwf9ycdjX7DvvW2C/+y0lKDnZbl4anL72KyMKPT77TecCihcvT2HmY8zMwm9d0S1ed+
	MvvRO7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmr3o-0000000GYQe-37Kr;
	Tue, 25 Feb 2025 09:17:04 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqkw-0000000GU93-0rpl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:57:35 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7xNNi032266;
	Tue, 25 Feb 2025 09:57:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fhOEEMHI/nRYp11Ph+S+PlR1DHlnxLJ3PZkuoX7/3EE=; b=iOvKLUu1LmQDEXEI
	HdioaYPZfIHujnKJjfJjkO8IrTPdh4aFNUEwFQJZbkKTK4w6yBjAvnPpncA43wPP
	LSFdRooSThnGU8BnTwYachwdawdePd189+jdmRvqN37qvj1aPFoC6GRFwSurQ0uP
	qQrJWPZWDv7+yYZ811b0zKNUO9Rvn7be+Y/BVRZBC/KyMfjxlDJ8FcJCkurzPm/+
	6xxLN1vWRIJ5JLY8aR3SSegrhYg+jfy2GNom0BoFtrgvJKVvM/H5KfWpmix3zfxX
	U4GErEYUrQ2pqTBSlujKj4LkxVlmtFrl/6OvbwUAKQR2CJEB2iZNE3mMUAEX/Lcz
	+1dzww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1u5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:57:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 180BF4009D;
	Tue, 25 Feb 2025 09:56:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B23BA42D934;
	Tue, 25 Feb 2025 09:54:36 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:54:36 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 25 Feb 2025 09:54:13 +0100
Subject: [PATCH v2 10/10] arm64: dts: st: add stm32mp215f-dk board support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250225-b4-stm32mp2_new_dts-v2-10-1a628c1580c7@foss.st.com>
References: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
In-Reply-To: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_005734_559206_0177CFCD 
X-CRM114-Status: GOOD (  11.97  )
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

Add STM32MP215F Discovery Kit board support. It embeds a STM32MP235FAN SoC,
with 2GB of LPDDR4, 1*USB2 peripheral bus powered typeC, 1*ETH, wifi/BT
combo, LCD 18bit connector, CSI camera connector, ...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/boot/dts/st/Makefile           |  1 +
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts | 49 +++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 06364152206997863d0991c25589de73c63494fb..63908113ae36ba19378ac1fedc0309ef46555f17 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 dtb-$(CONFIG_ARCH_STM32) += \
+	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
 	stm32mp257f-dk.dtb \
 	stm32mp257f-ev1.dtb
diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
new file mode 100644
index 0000000000000000000000000000000000000000..7bdaeaa5ab0fbe99a7e39b623d5e7a0e469d3e50
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp215.dtsi"
+#include "stm32mp21xf.dtsi"
+
+/ {
+	model = "STMicroelectronics STM32MP215F-DK Discovery Board";
+	compatible = "st,stm32mp215f-dk", "st,stm32mp215";
+
+	aliases {
+		serial0 = &usart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fw@80000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x4000000>;
+			no-map;
+		};
+	};
+};
+
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&usart2 {
+	status = "okay";
+};

-- 
2.25.1


