Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D9CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uj/tYH5fz4eZnkUUYPeR644wINHfC6f99gDFdC6aJ0c=; b=xJn/vvMe/inltL6s++tEOAuByL
	yqTQR94nf2GC/wOxq8vXLEIbdDDmycNH43erRwbTFsF1Oc4jAl9JjFgdPpD6xob226xd0MKFvkCWN
	MlNPhdlnnner3SUvZB6WGxA+tEMcNMZimixqR/dwyKvIZL3otLzhPo5guOqnl7DS57lTQclFDTMnj
	YZeMeqpCL7jKvIrkuigvznZpGRq1KymoBXrX72LvhBEAsp1N+EvT5oIeXItcBIOQY9WsuJ77usV+Q
	73X70prYiaJO1iil4jwszywXEasTRMAWZyI86sBmmWHywpsVIj9S8ystTAnvVTEvCvcC6nddJIziX
	FoGmbcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHc7f-0000000ErKV-1Hs4;
	Wed, 21 May 2025 05:36:11 +0000
Received: from mail-vi1eur03on20703.outbound.protection.outlook.com ([2a01:111:f403:260c::703] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHc5b-0000000Er5e-2CE8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 05:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPD38e8b39wbjgjWC46Qyj49f+62P3Kp5vST+d9StKw9uXxTIlnLuDkPgsF1iOZXJO8KsqNo8n+5gvAySdRoNDk0XIUSwaUtTMU3aoYAf9Nz16SRQtt3wNuYHsmjjS5gj87ght51xCXytC6IOFF9mvNM+ag+NeeCSP4VYIMw0k3zr5EFM9b/BE5WZsjT2BCa+d1yYNewSn6gekYl7S6fIwZbpg/gSgMQ1Umsc08ollJOXZdP0Pbm4fV0u4XXESVV9Ne0RDi2DD+edZ2QErZrFnu1mwF8Y0h5kpPXNU2sg00vSwBMhQJoTKzPAWI5FLH2zJ7J9OBHnL7daZ2gwESdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uj/tYH5fz4eZnkUUYPeR644wINHfC6f99gDFdC6aJ0c=;
 b=myp8Igw3KDpSXOd466uDALbIMMee3x0PEUf7qVX/px75JLxo1p/nApe37YxtdmTJc7e7CONTgOLM+NIYZzOpSjngooU9dluyoRGT3bDCgcS8VqN9FmzHn6HXiOnfJnfJ+O7vHKMayQYWciRrXwQTj+AIsQV3sEIM3/uzGdZOU+TbLda2gdAv3GzVeDx/ThZtgn9DfPFC1Zq3ZTwNAwnITliCADQLsJB3NajNoQLIsJ2O6Giy+9tJpAeuraEn7kCw5100GCHrHMsq8+2ibCjb4MEjv3qTi8xfi1U6DRAVIkkxIehFeTWCPVV8WUysot5hs6oI9vwTGWn83yNnALjKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj/tYH5fz4eZnkUUYPeR644wINHfC6f99gDFdC6aJ0c=;
 b=q+ptHpZSkZiMRoJve3XoXMXqV+m3J6cpU4q4ipWj7l94fYyJ3wG4uGLiL1vBGKqKgBXkAH5mwRIQ948S2+OJpLLXg3g60AnDrh+29ovWoJKlSqC7KfnS507OsDhb1m/LFK76+psr9dhhyDzUEREX50gm9bZq+gy5dvFAjpwVFuyqL6CZBSCRFR4ZzyssBPyHjFJeHrNLohc6x7s98x+WNV0ap19f0Oz9vfLKrvxEFKkiOzAN2o6O6R6dLWfVa55XE+VTi/iv2nGmQzD1F8AwOZ77cD26pm7DaYE4L1DNtxk8gI+IGETUG85033fg7ILbIJaFayg633nSaREnbBgWdw==
Received: from DU2PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:10:232::13)
 by AS8P195MB2295.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 05:33:54 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::f6) by DU2PR04CA0068.outlook.office365.com
 (2603:10a6:10:232::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Wed,
 21 May 2025 05:33:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 05:33:54 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 21 May
 2025 07:33:53 +0200
Received: from phytec.de (172.25.0.51) by Florix.phytec.de (172.25.0.13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 21 May
 2025 07:33:53 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH] arm64: dts: ti: k3-am642-phyboard-electra: Fix PRU-ICSSG Ethernet ports
Date: Wed, 21 May 2025 07:33:39 +0200
Message-ID: <20250521053339.1751844-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|AS8P195MB2295:EE_
X-MS-Office365-Filtering-Correlation-Id: c9be4556-01da-415d-be72-08dd9829134e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MbXWKTdE0L35kYX+iMBfxDvIgYoQoglLAmDYKySyaFYeV0yEg2cdjQzAD7Qd?=
 =?us-ascii?Q?hG/wgYPILtoONDv7JkL3BrlyURlwF9G3amrJjsom/82XQpsuI3VjjmeXhrlc?=
 =?us-ascii?Q?SEXpaVj06MRa5SQJSP5Ply0X2do3qJybVln1uikWzimhM+L6c7BdzhsmVmtU?=
 =?us-ascii?Q?vf4Ylwe0ZypQgev40sqNag+42VyImKcM7V4/o1T8GTADdahZr2NnFdr8dVyB?=
 =?us-ascii?Q?OA4FTf/ibyfNL7QhTN7GriH9nfz8x9+MhljAKzusrAPCwNPQkbyad0HsXh3+?=
 =?us-ascii?Q?u60AcvptFZVqneVrnok1tqZOo4HK83aiJQ5IJkkC1jLsoIBp/1BtHrELWmkS?=
 =?us-ascii?Q?3QTBxC89IhjpZy7u73M8AbVMcQRwsDWZHs1CqaXqb7wyUTeHzjnhOQtCgbFX?=
 =?us-ascii?Q?IPhcPdhh7ZwAX6ImVkBNYaLqVYqkcR2Q7gkCETgDvQ9vYCXUER3mAwgBRiIT?=
 =?us-ascii?Q?e6ux3fjcIdmZqK85olwpn873M61ANVEmOoDxgulpj3q5j6kG/6Mxlb3nyNH3?=
 =?us-ascii?Q?HKNRFwQ5tSDf6xK9/YIhN7yXbhGticYtRJ2u2Cqr7Et7xYlyHnxyIjN+PGuQ?=
 =?us-ascii?Q?VaZqSsEY87Fm9Pwyk1XEGN0PIQuN+jvLPloI/MkCGjhCZQ99kAfXwIuR3maY?=
 =?us-ascii?Q?uEP0/qULDBZrFy0h7xR92Ck/KKzaH5J/Vdbz2b7nZugFcOOAC6KEpe1U1gR0?=
 =?us-ascii?Q?9A/vE6DCf8zCsmwXGwPCPyq7eSelgKKvqhPhq0oiNMMtwP4htUQsnw2KRnVq?=
 =?us-ascii?Q?UaGLhMANYOvDjlFdRl8b6eG5B20b6NRY99ENSXB9Sz8uduP7mVd60oaMbiht?=
 =?us-ascii?Q?mrbqsnkEF5Wgbpjm31hc6Bv20CgqXjWIMAz17B/QuXxygH8xwKt1czrC1YoL?=
 =?us-ascii?Q?BR1GbWqAvRTb7XnrL+I14wKOfpn7N8XplLlCXUNkzOadCeKvTIs/agUL6JcS?=
 =?us-ascii?Q?ar2Nu+f9nZXl5l6jpXt5BQkghPaerhCtK0zo2acOIxPVcGnpOd6gbs/M1JGY?=
 =?us-ascii?Q?ZykK65z/eIW/ulz4wkOX51ZTnJio9bhedi3m83uaUdXVdsq/DSJmoFzybhT2?=
 =?us-ascii?Q?2taFdpqXPh93tU7Iw2SAvG96OX+Aybu5N4vtATQZcvxjr17yRQkDRDZDuHVB?=
 =?us-ascii?Q?wqgOR0dbg1rbRWUw+Bbg1M3JRmCON2gG1D3UO3elbM/BCvrVCctKV40mjlFH?=
 =?us-ascii?Q?nn7CUt2gkkBzYUV0ipX6lEttDyhbOEoShi91NZcCgV+/VEhY4sDu5/t4yCYt?=
 =?us-ascii?Q?4njhKJUPkOQjnpFlFR5HtrKKHlAaBmhu0Kenltew+JhmiguI0Y6w++gpg8DK?=
 =?us-ascii?Q?JyRfrJ3gkDU0+p4O4sNUakdFcHqxZ3QYCVZxetKq+0DUaDuK9Wn+orBU0PR8?=
 =?us-ascii?Q?42q+P03ONSmkI/8S5U/PE34/m7m6kqj1JRUzvdqQlGS+uN1CnVNorZ9PBoFj?=
 =?us-ascii?Q?5Qavm5mWjWwiTYpNcGLWRDz1mSvl+0ATVqHL2m7LjIxrIcSWAmCeOva07ZUI?=
 =?us-ascii?Q?AuKvqoYKTxrg7A+yZDlQW2lzoUjNjc7BUjt0?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 05:33:54.0768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9be4556-01da-415d-be72-08dd9829134e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_223403_861024_284BAB0C 
X-CRM114-Status: GOOD (  10.60  )
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

For the ICSSG PHYs to operate correctly, a 25 MHz reference clock must
be supplied on CLKOUT0. Previously, our bootloader configured this
clock, which is why the PRU Ethernet ports appeared to work, but the
change never made it into the device tree.

Add clock properties to make EXT_REFCLK1.CLKOUT0 output a 25MHz clock.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
index f63c101b7d61..129524eb5b91 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
@@ -322,6 +322,8 @@ AM64X_IOPAD(0x0040, PIN_OUTPUT, 7)	/* (U21) GPMC0_AD1.GPIO0_16 */
 &icssg0_mdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&icssg0_mdio_pins_default &clkout0_pins_default>;
+	assigned-clocks = <&k3_clks 157 123>;
+	assigned-clock-parents = <&k3_clks 157 125>;
 	status = "okay";
 
 	icssg0_phy1: ethernet-phy@1 {
-- 
2.34.1


