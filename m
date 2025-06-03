Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A88AC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aprRrtcxOanHlGEgCXxPfxoWn2srMRb0/PvId8f/qLY=; b=B3FawuvLCmCs79xBKnaxGVpkUE
	e2kYiDGfB2CWvKuzstyS652xnqUJMXxKKUhyxCkmSVNDGUsCJtByeXmp3vrDKURIYkqFTvpP83AvZ
	QzwsxsnTMmk+p2RPd7xeYHdKTqIi6DfP0MwAWq7KqswCG39us3eBU2n4WU6iD5aXaTwHGD8Ur7B0F
	AF+hjeKSnaYzlJID+WOLO6hBFDkm9VQebjWmNz9duYwOqM/iABqQpNMQs6W0GUxyqN7O2nO6GdIO7
	Ux7Awu2I8fe6U/1lZqJY7dBrW8Wp32MBVeagZkRdLmEfzrsYHJaGZIgVPr2QFteK93h0ZFxn17xPh
	VPrsg8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNgw-0000000ASgD-01XZ;
	Tue, 03 Jun 2025 09:12:18 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNZT-0000000AQyd-1zSY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:04:36 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537vHVb008494;
	Tue, 3 Jun 2025 11:04:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	aprRrtcxOanHlGEgCXxPfxoWn2srMRb0/PvId8f/qLY=; b=P2z4eeXhhO95O0iB
	rkrijNzIBLH3xJ6OUbLTXy+XrDD8G9SaDh04hM/l9sifEbvvvWc3IJGaw4lNs7m0
	QsysvaLj+xaGMIeT+llTgpamc8u3PAv8ZPMlESzzFGR8UunF00ElpHv6/UbkNfQE
	lnMRRdSHHLNatEwpBwOJe6IIGH+JzpgMUVmavdZMhrY0BOrSc5rtCI1tNHP83MHc
	YNqT+tT7Yint52KP+sPNrh+ulkTna+QeWevcG/vRwWtKOleZuCcQa78/wH7FyXwQ
	ajAVIWGD86KYZRj3AslePuZUj+VIzwCrLCJRUHMH87xdn4SnLKBYGTed3GGwaNpX
	7EfUbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8taywr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CA4B840082;
	Tue,  3 Jun 2025 11:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2CE546CF2C2;
	Tue,  3 Jun 2025 11:02:32 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:31 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:07 +0200
Subject: [PATCH v2 1/7] ARM: dts: stm32: fullfill diversity with OPP for
 STM32M15xF SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-1-5be0854a9299@foss.st.com>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
In-Reply-To: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.237]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_020435_810528_D1B478B9 
X-CRM114-Status: GOOD (  11.62  )
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

This commit creates new file to manage security features and supported OPP
on STM32MP15xF SOCs. On STM32MP15xY, "Y" gives information:
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
Changes in v2:
- Remove empty files (stm32mp15xa.dtsi and stm32mp15xd.dtsi)
- Drop stm32mp15xc.dtsi updates (no stm32mp15xa.dtsi inclusion nor
  license update)
- Move cryp1 node under etzpc firewall bus
---
 arch/arm/boot/dts/st/stm32mp15xf.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xf.dtsi b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ffa55d64bea30a67c32b9e378f3a082acdae593c
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+&etzpc {
+	cryp1: cryp@54001000 {
+		compatible = "st,stm32mp1-cryp";
+		reg = <0x54001000 0x400>;
+		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rcc CRYP1>;
+		resets = <&rcc CRYP1_R>;
+		access-controllers = <&etzpc 9>;
+		status = "disabled";
+	};
+};

-- 
2.25.1


