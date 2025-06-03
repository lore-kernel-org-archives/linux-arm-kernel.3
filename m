Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB2BC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sa3PvMTjDrUYBUsUzFDVt6E2oQTiF06NUOJk9Q3vBMY=; b=fXDlBGGqOXXZSLjni5170xIzYM
	KlrBI4t64J64JiOH2XQuGux2FWOJyXBZaGQbi1obtWjd5vqf663/Swg3OZdl/1Gz0ZCU8z4z8XkU8
	u5K3qNS7dOHILHQ4uYYD+J+4Og3binqX3qd4QRT1EcKsM2CipJ+TTNYaES328KMJhtq+TuYJ+pKlM
	7qnreNPZ4Qoa1DZSx/VpO6q3j5S2GM1Eb7GNq0QcEPjAs37Dx8RPMBAslCOOIRYi94NgI/25+F5lc
	NidNxDRJdEOvKWQHeWFP1jFJPqtZC27Md2N7Wswv2diy5s8Vo75WaKBqRPRRiGPUAdWOQaoE/zJ5p
	mkjYo5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNlE-0000000ATQo-1zCJ;
	Tue, 03 Jun 2025 09:16:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNZU-0000000AQyj-1a7D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:04:38 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538SF3X003221;
	Tue, 3 Jun 2025 11:04:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sa3PvMTjDrUYBUsUzFDVt6E2oQTiF06NUOJk9Q3vBMY=; b=6B4/subnPGkFeI6j
	VzpNwRjowiDd/EkUP50gd8MIREugu67RQ7+CtV4CeHXPRkJyzMwYGHhOX3vZdIWj
	4CBNt7Us1JuMKvqPO+YR7iAXm3BD5/ymDsam/bL0tePb4dQaplv4irea5iE/SNZg
	e2mKNJ+ZIKN2LuUR7kJiiBT6eOwnbQZOeTiI/5D+qu4RqjYUq3eU7P9rocK0CdGw
	cVrxPukl46QMB3W7pj4msZ2c65AW0G6D7m3vMhB5Kao4KCVszE7WqLAm0q1BBq/j
	7cTcUmauvZO4kcTH4/W1BXKaFC1VJVHZoOsfdq7DHH4uXJCfwfNZFtccc0RmQBs4
	ViyTRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g93ayj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 74E5540080;
	Tue,  3 Jun 2025 11:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FAD76CF2C3;
	Tue,  3 Jun 2025 11:02:33 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:33 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:09 +0200
Subject: [PATCH v2 3/7] dt-bindings: regulator: Add STM32MP15 SCMI
 regulator identifiers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-3-5be0854a9299@foss.st.com>
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
	<himanshu.bhavani@siliconsignals.io>,
        Etienne Carriere
	<etienne.carriere@foss.st.com>,
        Pascal Paillet <p.paillet@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.237]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_020436_712508_DB8CEA6A 
X-CRM114-Status: GOOD (  11.68  )
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

From: Etienne Carriere <etienne.carriere@foss.st.com>

These bindings will be used for the SCMI voltage domain.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

---
Changes in v2:
- Add external regulators and Pascal's SoB
---
 .../dt-bindings/regulator/st,stm32mp15-regulator.h | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/dt-bindings/regulator/st,stm32mp15-regulator.h b/include/dt-bindings/regulator/st,stm32mp15-regulator.h
new file mode 100644
index 0000000000000000000000000000000000000000..7052507cb3e509c6802d74682d7f9700377fe7c7
--- /dev/null
+++ b/include/dt-bindings/regulator/st,stm32mp15-regulator.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef __DT_BINDINGS_REGULATOR_ST_STM32MP15_REGULATOR_H
+#define __DT_BINDINGS_REGULATOR_ST_STM32MP15_REGULATOR_H
+
+/* SCMI voltage domain identifiers */
+
+/* SOC Internal regulators */
+#define VOLTD_SCMI_REG11		0
+#define VOLTD_SCMI_REG18		1
+#define VOLTD_SCMI_USB33		2
+
+/* STPMIC1 regulators */
+#define VOLTD_SCMI_STPMIC1_BUCK1	3
+#define VOLTD_SCMI_STPMIC1_BUCK2	4
+#define VOLTD_SCMI_STPMIC1_BUCK3	5
+#define VOLTD_SCMI_STPMIC1_BUCK4	6
+#define VOLTD_SCMI_STPMIC1_LDO1		7
+#define VOLTD_SCMI_STPMIC1_LDO2		8
+#define VOLTD_SCMI_STPMIC1_LDO3		9
+#define VOLTD_SCMI_STPMIC1_LDO4		10
+#define VOLTD_SCMI_STPMIC1_LDO5		11
+#define VOLTD_SCMI_STPMIC1_LDO6		12
+#define VOLTD_SCMI_STPMIC1_VREFDDR	13
+#define VOLTD_SCMI_STPMIC1_BOOST	14
+#define VOLTD_SCMI_STPMIC1_PWR_SW1	15
+#define VOLTD_SCMI_STPMIC1_PWR_SW2	16
+#define VOLTD_SCMI_VREFBUF		17
+
+/* External regulators */
+#define VOLTD_SCMI_REGU0		18
+#define VOLTD_SCMI_REGU1		19
+#define VOLTD_SCMI_REGU2		20
+#define VOLTD_SCMI_REGU3		21
+#define VOLTD_SCMI_REGU4		22
+
+#endif /*__DT_BINDINGS_REGULATOR_ST_STM32MP15_REGULATOR_H */

-- 
2.25.1


