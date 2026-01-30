Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF79E6BF10
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 21:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FmJDLmg7avb7I+Kra62xPecUUkYJ+PfRnFKZfXFcq4=; b=syzeHioc00Ijwc4InBiWgJSauo
	K+gAE4Mr+td4Lb9sKsI6MyAzVtvg09qlIW7ou4lBqrcNj6Y8iTFct8pPxWv9iyF9tI3n4afjbAklN
	32lJHukWeTt9prMgT1WJNRdqF9xcWwcO1E47xxo0eN34z4nJ/VMyY70LV4YW5gs/FCCIcYacC/MwI
	wLTWqvGAnFt1Qk0GJRijYqEWOouh3tLuHQMkZs4wwSkYjoL9Vo7Xq+uoIE3Se3NLJ2LqKc+LXIF7u
	ZqRl/uiJav74bbSPZaeKZ0KLA7MTCb798vsXrGYTPyRD7ltoSwASpwGkwH7I3XASGfaO/Bq4nKjhD
	Ea+GE/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvat-00000001yJw-1yqL;
	Fri, 30 Jan 2026 20:59:55 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvai-00000001yBU-3Bry
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ58ctqMX4ifC4n+F7spFfKNhx4+/7v1Y6VoXBl0uytF4nHDweldS5t+GhffFtCr86YY1gWT9UwvWTEoI+5OW0sKHsIw889bTXOj4+yHyxKWXUmvBI+FudD+wi1rr2Kr8Drbky61Wk/9QqhT5fp4xW5m9URzxN/2Ou+q9tghjJZKT74oVnVwiDFIp8FmJ3qv9Nzuvl9KyX2uynwgtdCSyFnksiCWo1MvQA9WMDy0ld0OfUytJ2JiwO4j7hFIk9y5i+DP0BVxHpa2O0bt0+hS7y7YPAH58x923R6vKK+viNq/RuLgfKkSxz9BOQz4AvG4T6elikTHX1IzTIcaRifYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FmJDLmg7avb7I+Kra62xPecUUkYJ+PfRnFKZfXFcq4=;
 b=hZ4/BeHHONz6G/LGA2lGmDJqZq7dJ6hCvdX9aLXnG4LRN7gMVuwiSstA13/st9Dpe1jSPSZ4AG3lVhYwJwvwWPd8c32shqE7h9k24MD3q+IBI425Fgc0/MFCxkhzMktRU/UoqOYYUolJiWc8YikV89QfYCqG9VWj+RqizrW8K+vLwEs52oTkNn+MWYTnyoAeqZ7OdfUvnfDi3GqeG7dslZr4vOoLTPlG6xoOVHOM79sZV00DuNhVdBmXDRQWmCibwuogSyWdjf5k6dQkiuYZEoF06TEgWfUaotkCsQltT7qmcIUb7pVqG6afdCcs8SllTrKCJdJhPV5XKjE3gT3zMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FmJDLmg7avb7I+Kra62xPecUUkYJ+PfRnFKZfXFcq4=;
 b=WnhuGbkQq478lehvJl+EW0OzjfRlZZ7Iy0hovsmMJPG1WoefKzJL83MAGX4Z5C9WI5pdgn6k1pvQAqTrFvO0uxMZ3V5+mHDRQwgh8afYnlz3aGDbfpmcWNyc7hAr6jarhCyPtnlsTBdMuK0QW4e8NymofSVQC7BPZzzHBo6AloNoeEEZgP1aEnlATpZk++qen25D0UrV8mYPI3GNVsxs/cl7QbMzFWwycgnOrwzFJcvLbxYEvN++PoJVimEAIZJRJwrro0O3j/A6dOxzJHYOVu+xsWie7oN0EzpFG1N0PJmSgylqhSY0jm2sWK6GsM17Z965vsmZUJMi57DqTc/C4g==
Received: from DUZPR01CA0114.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::13) by DU7PPF2541BF4ED.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:18:3::bc9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 20:59:39 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::14) by DUZPR01CA0114.outlook.office365.com
 (2603:10a6:10:4bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Fri,
 30 Jan 2026 21:00:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 20:59:39 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:59:35 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>,
	<Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
	"Vignesh Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/6] arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay
Date: Fri, 30 Jan 2026 12:58:16 -0800
Message-ID: <20260130205820.83189-7-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130205820.83189-1-d.haller@phytec.de>
References: <20260130205820.83189-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|DU7PPF2541BF4ED:EE_
X-MS-Office365-Filtering-Correlation-Id: 75bb692f-58a9-4e61-9402-08de60427bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IvemZKefn1CP/0vd5ZNDGmEDBC+cNBCoKlvtMnTxJeQDW+fU6snkNxauNKMw?=
 =?us-ascii?Q?HDYBgLSgiE7c5/cYjUaDVid5DXrVmDYSfXO9PJ9DHS4eNd4ejHkkspkE+6j0?=
 =?us-ascii?Q?hKco8RcvWjwFjnuk0Ika57LV2sBtfdOOkk4tWLeo/CSBx2tqpm9f4+8tBdmc?=
 =?us-ascii?Q?EJobOGTGGnwI25NzjhwdNXuF/ijLUkb0ZTmUfvl+P/8vGEUMzMsyBfTwf7zC?=
 =?us-ascii?Q?AlMctDQmO0nZcgYS7GPvubAWy5Y2Q/wh0b3wvNKckI/uw0+koTRGvPXdP5Ny?=
 =?us-ascii?Q?MnhFBeKWkM5xziC7JDtgqWTEh4etPaXpddrJ7+IX47Zp7mAlJM01zmNZzYxC?=
 =?us-ascii?Q?6lX9LrniyZcH5LsQFy9Fh+KavLFNEJ6yxRXDEJpMkE6DsJwocKmyFYm9ySnR?=
 =?us-ascii?Q?m/TaA/ANQBljgvRsoMlAM5emIo4Gmak+WWgHXlZP0xkhBYB5VpIUm6owyhSq?=
 =?us-ascii?Q?MT7Sh2Nv2e3vShMYSxNx4mSaOsE2zW+wjHvMsuqvTXkNA77dKnKctDQl/7Et?=
 =?us-ascii?Q?sEUVtW1Kl7aaS13dgRnH9HSaBMnwFSszXdoLNSMfuPuV3CrSQcXsDAJRRXAb?=
 =?us-ascii?Q?2gHzCD1l/pxRS4DdCHZ07j7/Q6me3P0T5aWbR9057D+4bjohEp04Xo7/7+WB?=
 =?us-ascii?Q?wjshAEG1TuuhKljPSnk7xtNnFUoTKUHWmKxH5nmWpnmKsu1Z+lVmezy1fddj?=
 =?us-ascii?Q?FzNGTlOJCc8js5+ehPsIJEgV8qdtBu0uaT7fRlUd6cUfIMwMT+ks2YWc+sZD?=
 =?us-ascii?Q?bD2DTLWrXHrCQe1owLwwDx0r0rhOkNipzrku/QGHPZWSsjTwI6gyKRPmKOl2?=
 =?us-ascii?Q?chh6mnTzn0fmqqtAu0fdZmcGvD8DcJs3o8J1NzYeqsLeyXv0vXwuFIfKUjLQ?=
 =?us-ascii?Q?v0xr8VhSfWj4pr8xx28Uxvy6TsD007tmS8EymjPVu4W0HL5c2oHh5OwJh3sB?=
 =?us-ascii?Q?NaNUj6DJX9U6I0UocaMxTcuGFgCQpx6km1NZiA50hTkwDHasOgA60sMxEN98?=
 =?us-ascii?Q?3JyIokGH3myur9sbd0FZY3zD+GKM6O+rhdWLw8QuY3xqvtWscZF8PP0LPQgY?=
 =?us-ascii?Q?QnB18vxYVAKG99qTvvjaLygdUazFSrV38hOP0TakDEsDZEAQYSzYaMrLlc9S?=
 =?us-ascii?Q?AT0EP5fkHBUA5k6bFrwMVGu+QU7Fi8EJt3qBLLY6i+xOxtqLjmMo+txCdc6N?=
 =?us-ascii?Q?U1COLqyW3iPdp9dSt6dkLM+3p7juV2Wko0w6Cebe2uiiwtTcyIYTocXFwzj8?=
 =?us-ascii?Q?NgEMGAV5UsWLZNqxWH7wiPfZH01RQUo7SUwNkw/OjrQLlqbUNaF+Lv4Cl17Y?=
 =?us-ascii?Q?C3JGO6qCjMhd7uEv3DPGRBOZQxasrHvefSVc55wUALVHoM00QuN3waFkpTqu?=
 =?us-ascii?Q?OOzdSiU511Ae6HpP8AxKVWfBw9/KGRQB68tk5TnRFSVqIkstW5jSTr0AKrU+?=
 =?us-ascii?Q?154isAmptjqy0JYUwVnnmBtlvvZgaFn8VnOF6IxEnDKwM1yrd+ktzOHieRbe?=
 =?us-ascii?Q?kfm5IJpfdLDu2ukUklMyD3STnGgka74B/EDULotpUN1hkWUsoFWBaXErJVHk?=
 =?us-ascii?Q?qL5uhVxNM/J4JN/Zgox2g8WIs5L/3T8I6+URD3Od52QMH8HlamO8SZeZxdg5?=
 =?us-ascii?Q?TN3x5pCqBjvfdDKDIt1Z2Vk4YEFmiIrPeem3Avw8bCDjhRaOhK6B3XDlBq0G?=
 =?us-ascii?Q?0ZYTBtGYHuGTObwFXVOag91IAlA=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UOSxm6E/GW4S6AX3UbnjnIyNKyJqp5RwIAwx+KaDehissXgvWFGu24gv5AkFB4l5WOs++dr0K5N/DPWyuhooDniVFyUHpOPuovD26dqiZFH9pgX6tUos5LhiNuE6VhTdiCuBLI12RkDtY744uG+jAVq80Z1TyTYArk1+nNRqpRlFRI4njn5FLlejd/i5r/V+ujLqZIUStOZr2L7bGa/K4mnQ/nLOoYGdGAabvsDI1+MnXx1XrcIXFNLBfvYP3edNiLlRq6y1/BZjx9PtyThljXlPrKsNXrn5xeVcuakySzKlt0BSdwvEBDc3GjeVTAbhSP9W2qUPtM0qMdU1g6gasIo+Mu5E0vdDxnxl74s5otiAKsb9n3WcO6LltesG1Vs7OZ+9t+IvLPBDc1hspo6KG9vFll9KNQnNyUVgtl/CStYTlqPGmVolSqMvQ3I7H/dM
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:39.6162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bb692f-58a9-4e61-9402-08de60427bf3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF2541BF4ED
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_125944_825787_6F8FCCBE 
X-CRM114-Status: GOOD (  15.27  )
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

Add an overlay to use the PEB-AV-15 AV-Adapter. It's a small expansion board
using a Lontium LT8912B DSI->HDMI bridge and a TLV320AIC3007 audio codec.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-am68-phyboard-izar-peb-av-15.dtso   | 192 ++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a188e62e32b4..ae5994818ad2 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -135,6 +135,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-lvds-ph128800t006.dtb
 k3-am68-phyboard-izar-lvds-ph128800t006-dtbs := k3-am68-phyboard-izar.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-peb-av-15.dtb
+k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
+        k3-am68-phyboard-izar-peb-av-15.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
@@ -323,6 +326,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-kontron-sa67-base-gpios.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
+	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
new file mode 100644
index 000000000000..bec959d2e97f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-or-only or MIT
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	audio_refclk1: audio-clock {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <19200000>;
+	};
+
+	hdmi: hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		ddc-i2c-bus = <&main_i2c2>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&lt8912b_out>;
+			};
+		};
+	};
+
+	reg_audio_3v3: regulator-audio-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3_AUDIO";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_audio_1v8: regulator-audio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC1V8_AUDIO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "PEB-AV-15";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Microphone", "Mic Jack";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPLOUT",
+			"Headphone Jack", "HPROUT",
+			"MIC3R", "Mic Jack",
+			"Mic Jack", "Mic Bias";
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,bitclock-master = <&link0_codec>;
+		simple-audio-card,frame-master = <&link0_codec>;
+
+		link0_cpu: simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+		};
+
+		link0_codec: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&audio_refclk1>;
+		};
+	};
+
+};
+
+&dphy_tx1 {
+        status = "okay";
+};
+
+&dsi1 {
+	status= "okay";
+};
+
+&dsi1_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	port@0 {
+		reg = <0>;
+		dsi1_out: endpoint {
+			remote-endpoint = <&lt8912b_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi1_in: endpoint {
+			remote-endpoint = <&dpi3_out>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@3 {
+                reg = <3>;
+                dpi3_out: endpoint {
+                        remote-endpoint = <&dsi1_in>;
+                };
+        };
+};
+
+&mcasp0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp0_pins>;
+
+	#sound-dai-cells= <0>;
+
+	op-mode = <0>;	/* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+
+	/* 4 serializers */
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		2 0 0 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+	status = "okay";
+};
+
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	audio_codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		#sound-dai-cells= <0>;
+		ai3x-micbias-vg = <2>;
+		AVDD-supply = <&reg_audio_3v3>;
+		IOVDD-supply = <&reg_audio_3v3>;
+		DRVDD-supply = <&reg_audio_3v3>;
+		DVDD-supply = <&reg_audio_1v8>;
+
+	};
+
+	bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt8912b_in: endpoint {
+					data-lanes = <0 1 2 3>;
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lt8912b_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	mcasp0_pins: mcasp0-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x03C, PIN_INPUT, 1) /* (U27) WCLK, MCASP0_AFSX.MCASP0_AFSX */
+			J721S2_IOPAD(0x038, PIN_INPUT, 1) /* (AB28) BCLK, MCASP0_ACLKX.MCASP0_ACLKX */
+			J721S2_IOPAD(0x040, PIN_OUTPUT, 1) /* (AC28) DOUT, MCASP0_AXR0.MCASP0_AXR0 */
+			J721S2_IOPAD(0x07C, PIN_INPUT, 1) /* (T27) DIN, MCASP0_AXR3.MCASP0_AXR3 */
+		>;
+	};
+};
-- 
2.43.0


