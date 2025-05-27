Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547D1C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xt2bCMTIvh87COE2sGKEmCIvYsCqTkRKv6pvRr+MTSc=; b=flGz/G4A8djJDrRGjnlh754Sf5
	RpqgyyFRbmVYxqmLb7KfrhKvCNfDAyeb7Pnl2RJoMwK8ToZumD7zlWyhm79htP/1JcKFT5MjE38EM
	B9CmauTOBPIQLr+tihQ5hUUYLuBwkNyeXBgduWC4TcPupZCg/hTYtWZNEvr9SPkarz3KBxf3VNaD5
	NJcFMU3BtpyzwxDt+zcxdXEWSDYMxsMT8Ox6nPCk7XZaGe4abTVKBXypFpNlr0/QswqghxgQY9/PN
	12QrzHdQi7skSnfG1Fm4H975JtaBuCToI0NypVMvGSsLO8uvKmxT58hecGLbvCnF300vcbA6gxDpR
	Vp1jFFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuAB-0000000AnLc-2HKe;
	Tue, 27 May 2025 13:16:15 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJu06-0000000AllP-0HP5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:05:51 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9XLmJ031268;
	Tue, 27 May 2025 15:05:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Xt2bCMTIvh87COE2sGKEmCIvYsCqTkRKv6pvRr+MTSc=; b=oZonfTbcryO3BEhb
	yy9lD0nt4kTjfJ6wItrXG1td105+XN+feeYvad32VZXP6IKqN6ZOP2r56mB81nFO
	Q+HVZxrq+iXaDky5D6pzPuApi+M/cWS0lIYRE88Pf0u3Bqw5mx2LFJiS18odi/yu
	TFP6fvfiWEB2Q9Uj8rfuWF8/A8GfCBVJMBZHnsfjAW0tJPl/FD9JS9KDvGL3F6e2
	0ljDPZlsPGOwn8Voc4PApJ7DMTmnj2XdcOz/nnPm7qYWktwetftiQA1VF9m6ujWX
	m8wFnPP2UsVGjAiyW7qgqbunYro+QLPKMhar1NQqo+zp5hVGiC3Z9qm7SIcCWA3m
	+WH/rQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4j1nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:05:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3EAE140055;
	Tue, 27 May 2025 15:04:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 970A6AE078E;
	Tue, 27 May 2025 15:03:47 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:47 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 27 May 2025 15:03:17 +0200
Subject: [PATCH 1/5] ARM: dts: stm32: fullfill diversity with OPP for
 STM32M15x SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250527-stm32mp157f-dk2-v1-1-8aef885a4928@foss.st.com>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
In-Reply-To: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.86.139]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_060550_423119_87870E0F 
X-CRM114-Status: GOOD (  14.05  )
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

From: Alexandre Torgue <alexandre.torgue@foss.st.com>

This commit creates new files to manage security features and supported OPP
on STM32MP15x SOCs. On STM32MP15xY, "Y" gives information:
 -Y = A means no cryp IP and no secure boot + A7-CPU@650MHz.
 -Y = C means cryp IP + optee + secure boot + A7-CPU@650MHz.
 -Y = D means no cryp IP and no secure boot + A7-CPU@800MHz.
 -Y = F means cryp IP + optee + secure boot + A7-CPU@800MHz.

It fullfills the initial STM32MP15x SoC diversity introduced by
commit 0eda69b6c5f9 ("ARM: dts: stm32: Manage security diversity
for STM32M15x SOCs").

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xa.dtsi |  5 +++++
 arch/arm/boot/dts/st/stm32mp15xc.dtsi |  4 +++-
 arch/arm/boot/dts/st/stm32mp15xd.dtsi |  5 +++++
 arch/arm/boot/dts/st/stm32mp15xf.dtsi | 20 ++++++++++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xa.dtsi b/arch/arm/boot/dts/st/stm32mp15xa.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..cb55f5966f74011d12d7a5c6ad047569d25d4e98
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xa.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
diff --git a/arch/arm/boot/dts/st/stm32mp15xc.dtsi b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
index 97465717f932fc223647af76e88a6182cf3c870f..4d30a2a537f15c1e145635b090de0f0222526579 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
@@ -1,9 +1,11 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 /*
  * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
  */
 
+#include "stm32mp15xa.dtsi"
+
 &etzpc {
 	cryp1: cryp@54001000 {
 		compatible = "st,stm32mp1-cryp";
diff --git a/arch/arm/boot/dts/st/stm32mp15xd.dtsi b/arch/arm/boot/dts/st/stm32mp15xd.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..cb55f5966f74011d12d7a5c6ad047569d25d4e98
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xd.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
diff --git a/arch/arm/boot/dts/st/stm32mp15xf.dtsi b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..5f6a2952125d00d468e2e4012024f02380cfaa49
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp15xd.dtsi"
+
+/ {
+	soc {
+		cryp1: cryp@54001000 {
+			compatible = "st,stm32mp1-cryp";
+			reg = <0x54001000 0x400>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc CRYP1>;
+			resets = <&rcc CRYP1_R>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.25.1


