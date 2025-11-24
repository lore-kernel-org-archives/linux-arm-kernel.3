Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC8CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHFdMTG2+HmRhF/FWoRVjEvoIBg22P4/gKri5wecEPE=; b=fUv9s8OhIH1wz7HJ47FJHQ5eEK
	nA/kzRG6cDQNEa+qXX3PvCrln7sho+wZDEfhP9yd5zULbrNZg0huymYx2cuKY7c52u2uV5sdXIHT1
	delAxa4mKrdlT1cEpvDYuNxXOZqM4gm82DbA+0clmPT24MzZRxed8I9OBQIHnYq4mgo38T9vM+OIl
	Cg2sOfQWtaJWwEmfiH1Z5Xbm0QzMewq//H9DH5u/BjKH1ynjEHBQrWQqHGk/l5LtAGhvJH20UVdAL
	2xQzRcxRsYJDrOz6D8CGbPgAz32QbB0KMmuYAGUKQfdMOiYHttlv7XgfhzDFcUUsl28AgapZMbAkm
	xppSE1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSZQ-0000000BJQ0-2Vrz;
	Mon, 24 Nov 2025 09:09:16 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSZN-0000000BJP2-0FzN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:09:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2A6scxsiPNAisxESXytsq3eg5ZHBwoQidJcyi7vGpV3NCD/C0iU1bTFC5cNonao1UHXP4KnAS3Fjwt3tXnSAyUJiUUsOfxqkFs07X/svTuleQdQsDbY4DlmOT9IVmwaMxaT66TB6mtrohXn9+oe4g28ByqEH5Ju3BfXhbGu64n+UPXHNCCxJXukmOj1bWjzlOa/v9sW2QJrIn9spwJg04zNfs7SlEk5YnDk2ZoQu4sLzZuXxAEgLhr5y2T2CxiKG7OJFoyyZet8alHp+ByltFDEhxz2k+1wwibj2SV9D4w3UfCmmuVtW9I8XXB8Yrpu8OO0jbOBdAeSYHOR48lbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHFdMTG2+HmRhF/FWoRVjEvoIBg22P4/gKri5wecEPE=;
 b=gcKTdYjce+N1Axs+uULgsRCh9QGtTWIPsI6neaMxkLIWA9V8PsyZUpq11QkwXmCcnDYmxvevlt2hCUAk8XbZlAErWZaz4CN/KQ4LMqwkFpcF7pYGJ2K5SdyRYhBKQkAX8SRqMFDeaQz11NYWeps5pOUekmpa+d1lqlURrRk/5UEw/9tDB2coq4ajeyHtsPjSG0jJIUJsMT4pinS4luzCdbfdhT2X5QwCeV8gvKoCT+4wQn08RT//LVn6dZZI1kvhUu2J/OWFeORV3YSecV4o9M3Zbty5+vvOd55UQboH/cr2GTqQdeN4eYgxa4mfsqmkX5ekUI5lf40IRyFc3KWB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHFdMTG2+HmRhF/FWoRVjEvoIBg22P4/gKri5wecEPE=;
 b=bbSty2aL1vIHMl2rniuKljtUaqTOoVxkheRZR9GuXfkptfwN47y8gpxpHgtPIDcp6PRuUAACt/v6y53iTBcwC23zmaOnYHevTP25fWABU11FKgPC35E8gbArjiKz16ZX0Z1Mz8Lnuu23x/6eFnlulFewVSloP/IqAaI4de4BZlthgmxK2CaTjTdNzQ+5j2gyKQLsiz10gJ9X4oWfWyOrrZIin7VUzPwaz75BraLP30PILRHIEwMRfT1Nv9qOBzshKMtubQb8ql8HuxX3zAvEWXs6ybh2NfE2k2GZNfyTjZYTTjAKMCy2wI2e1yxbyUfLqyB1tLFA2Gz6FFF/7kFCdA==
Received: from AS9PR04CA0066.eurprd04.prod.outlook.com (2603:10a6:20b:48b::19)
 by AS4P195MB1480.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 09:09:05 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b:cafe::e3) by AS9PR04CA0066.outlook.office365.com
 (2603:10a6:20b:48b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 09:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 09:09:04 +0000
Received: from ls-radium.phytec (172.25.39.17) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 24 Nov
 2025 10:09:01 +0100
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am62a-phycore-som: Enable cpsw_mac_syscon in U-Boot
Date: Mon, 24 Nov 2025 01:08:42 -0800
Message-ID: <20251124090842.3377294-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251124090842.3377294-1-d.schultz@phytec.de>
References: <20251124090842.3377294-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|AS4P195MB1480:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c6baa3-ec85-4838-774f-08de2b391d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xS3WqQ9cV/Lm/Sam9kKFlfg8/z1bZL3yemP5ir7c0UcqgwSZD+jW3BMJKrmz?=
 =?us-ascii?Q?KDNV26KnipKQZUZfAeuehXL9tGfd8dXvJTsxxOeDh1lHTzSlVlBLQgi6vY6v?=
 =?us-ascii?Q?FhmijLU6MLFGZ2WoxNDMppXVbVHudlOTOKkkzmt7dxx/dUHEyYp0yLXEbBJy?=
 =?us-ascii?Q?kbrW+YGqstopnrKSEXJdjurXNcLvqUuysV/mtkB+Q367yxvdOd4lUvqE8I0G?=
 =?us-ascii?Q?AAByqtk5Aam5IsLOimfPIL0VLMJLkUGJJIa4+hhOBNaQ7swLhumzQjgql4dv?=
 =?us-ascii?Q?3NjY/+q4hW+jRZOrtHk2MDnc0D1RkTk5MBXcTxPYlvFsJj0mMRSsb37WF1lC?=
 =?us-ascii?Q?Rf+D0MJidIWCNYZ9VTRxvWaOHUiC09bTP1N70wIlXCAyWovoK4DSu3DyS/cN?=
 =?us-ascii?Q?E7DOG2ppefgL9dM/9VsHJCxpT0+Ow4velpg32U7F+p1tQAEm2snqWc0WHjY9?=
 =?us-ascii?Q?kwKQhzfJq5ewbm1V1gSYgr286bCRIXFazbdJK3oQqYduGfcurI1feuPPyJeq?=
 =?us-ascii?Q?K5slbmC17mD4pJuzS1GDtB9wNLPUAwVo2WvHsfB3h8jRGXwnxR7Kd4mxywuj?=
 =?us-ascii?Q?i9w6/l+tA460vyB3N0ihK/3vJ2DueXmZXtNPwgbpRY1WrHvuENw7dM3pS5YX?=
 =?us-ascii?Q?zYLUTfxCKZjYfGWs82pjtKqHZ6I81rFQP/9EGiKPwPS52+Oo5PvAY++DA9bu?=
 =?us-ascii?Q?wkExFxm5MGbsusuZTlUP6+9bybZ1KUlcU2d0WmIEUc0NQs9KpEuyJJi97RIV?=
 =?us-ascii?Q?Dyx0HPKJSxde0+4abk9dJf5xpl0sEf/NqvhEUi2CDuNxnsvTil+dAbjzB7qB?=
 =?us-ascii?Q?dsCXGMcHHSlkCv3k/G5j8Kd3FAqHo8tPIMMbgBhOsDaJ2VtnlUshKwj1aRkw?=
 =?us-ascii?Q?vo/rRF9+ZbuRzCSPM0GatzzKDYccf7ap3cFxhX5aoAqCt3KUV9DHWVd6vd4K?=
 =?us-ascii?Q?VxJLUbjTMUIN0IPRpQw5ZwsxwmrQHS6r2DCCx2mlJM/9Kzfb+KA5QSeIZo8c?=
 =?us-ascii?Q?rKmMfi9IKzPXD9sJR5u/vvLj7qdk7kXdAcyLCUia0/gVBs9hb4zbFKchhaw1?=
 =?us-ascii?Q?oCmqIuAgUX61VuOa02vooAvSRf9tnJyrEsW1ZLc0VPNFV2SWNaP0plUW6qkJ?=
 =?us-ascii?Q?/FGNo9N0LkcwbihRPgSUIfw6h9pqsQwj/+MCA/bzZywnFWKgxgHcrcG5JPdp?=
 =?us-ascii?Q?rV32X32Is+kh3akhA5BZ405umYzvvtCEZI46NxLGXqD82KqpEa2W1p1R/a/F?=
 =?us-ascii?Q?Oz0l/nS9qsRFB9CphzMiYxeeSvJYXi2n9HRQGJsEKW29jABUnvSTue6cDMhg?=
 =?us-ascii?Q?XDKKOJyzETVi9HtC5/4vkj6hA3oa6eNBV8E1E74JmmOa1TDgsRzhBbSeZZPF?=
 =?us-ascii?Q?rMK1EihDuUbn8qCFu9x1uhqbgnajsdIA5yGDWVOMKKQI9Ok19wc6zUg11T9G?=
 =?us-ascii?Q?ucLaJYNqLlGp+xALBA5sW4d4OWR1ePbRhmaEIn36wpW0zrWz3W31yZTEdKGO?=
 =?us-ascii?Q?5wJ/ytYDIzrtayWl2N2rA04Gzr4TO6sYDE3ViLKCSuEmzhouWt85GTYyRr+3?=
 =?us-ascii?Q?5simFtV7IZu/6ACB1Nk=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 09:09:04.0883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c6baa3-ec85-4838-774f-08de2b391d80
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_010913_121589_F585F080 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Add the "bootph-all" property to cpsw_mac_syscon.

This fuse region contains the internal MAC address. Without this
syscon node enabled, this interface will get a random MAC during
network boot. This is problematic because the AM62Ax network
boot is using BOOTP protocol for some binaries and this protocol
does not support dynamic lease expiration. Therefore, the DHCP
server can run out of free IP addresses.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
Changes in v2:
  Moved changes from k2-am62a-main.dsti to k3-am62a-phycore-som.dtsi

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index b3d012a5a26a..7f00576a4bd2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -197,6 +197,11 @@ &cpsw_port1 {
 	bootph-all;
 };
 
+
+&cpsw_mac_syscon {
+	bootph-all;
+};
+
 &cpsw3g_mdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mdio1_pins_default>;
-- 
2.25.1


