Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1261C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/zlovYkaw6CK6HANLI9igiT9FiqGDvrGT1y2KkK0JU=; b=YJ93PDMSPQ08qBZzg0O9hDmYcC
	0UXx+4APWzMO6NFHH2sDtRBD+e6NcFXd9x3CQfHX8eChH54M6EjK/pTpEAZ/KQZU/eR7ham06/rMJ
	wHpTqbQRsTZ9U9MkvatbMUFomzlDGS9C8FRtEnsaHGccge8bc0pdvBXrGCHV5MHggqZJs1cc9k9iH
	tIsU0ug2zI0IKeEiuvuN2HzPydP8aVA+X+WUo0g+RdkNKS8LXqALffj//PFuPdRAkF6M5qBFFofAS
	r0beTICoaOEfzQ9+OJxcsIZtO/Rd85evT7BUHPMbPiye8UczA/zxEOqQMaYVjxtPoUKl22IjpMCW8
	Rf+ZGzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2xJ-00000006bWf-2JGy;
	Thu, 06 Feb 2025 14:34:13 +0000
Received: from mail-bn8nam11on20623.outbound.protection.outlook.com ([2a01:111:f403:2414::623] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2mY-00000006Yh8-0PmG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:23:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inc5iG8YaBHJ2QL5iEV9oW44k4SUgQWWC083PDAO/7QTdk62YIk34dKWdPREbwVW50ERSI8kmIaN1jtpqU6ZyoGaZI5E+qwbAAjBMd7Bhad037OxSwCg+UfTk9vkpG84PL2VQDU8CE8MdMSpggQSeRyMdcrf6qFZa9ZD+BJT/FXN0pOf081GaAy1KZkRs3ryAu9S2m28e+32oCoermXBVossghhl2kEBvtLLLfZURy09zTClWJMzpwdxmvzTHsFHXZIqv8T547oNkM8jWqYnJxCRdBiTAvjTMkuijSSk3wEL2KGxD2LkhVQf+zu/pMDawS6dWxA1KtGvoZ31KHkIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/zlovYkaw6CK6HANLI9igiT9FiqGDvrGT1y2KkK0JU=;
 b=ZGeR6uW7oGnA0d1BZvMZPYHE7kpBmi++Mk6R/TEJR4E9zuw9wF4/eWBjzq4koF6PNhSyk3b5x+yleVnpVHKinKdVinGEJi0MuooT5YzepJ6T5W97ktIDdw6j9yp8iGuDVZV1vKnmwbvpnPRz6LTy/52HsPTwLTv9IJya1Wb69uOTPf/fZrZYHT+ahonQoduGBKE/kKXcVjc1MxmwNXqaVLpATcEuoggtbqSSyQLBCwJDDOwc0zjDFRvUcLORvDKiRM92K4B0BybnCxl1yRW9R0Ly/vg40z/N8Yd3R5VEUZOfk4yOz3rNpxu2Gi2CERZzYohYxnhvB42q6BzXx0NqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/zlovYkaw6CK6HANLI9igiT9FiqGDvrGT1y2KkK0JU=;
 b=oRoGaRpOEm59a+X7B5Gobp7fpwFuJsjun4T8/2QhvN74GaNn8v2Z8toY2I0JcLFO74Ph3h23WEIwIgcdjh3vCvZRvH+kDzIXKk+vLWY66u/h1VXebOUkSumu8d0dgS42nHG46+GQ149qXhjSx+hpmXKdtckz9rxb/Oi16vKJsP0=
Received: from MW4P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::8) by
 SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 14:23:01 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::c7) by MW4P221CA0003.outlook.office365.com
 (2603:10b6:303:8b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 14:22:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 14:22:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 08:22:58 -0600
Received: from xsjwillw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 08:22:57 -0600
From: Ronak Jain <ronak.jain@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <nava.kishore.manne@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ronak Jain <ronak.jain@amd.com>
Subject: [PATCH 3/3] dt-bindings: firmware: xilinx: Move FPGA schema references under allOf
Date: Thu, 6 Feb 2025 06:22:44 -0800
Message-ID: <20250206142244.2553237-4-ronak.jain@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250206142244.2553237-1-ronak.jain@amd.com>
References: <20250206142244.2553237-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ronak.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a4e58d-a3d7-4aa7-a689-08dd46b9c1d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hTvg1IUiSjwafelBaLnEmzZbLk8DWy32AJimYxgqr+IiEnNpa9XMaUJgt0VH?=
 =?us-ascii?Q?1EXkqOUadxj1HGyE60bh1eft9D+t4pZev6dylOsRt+uHb/geIGldpDEqmFK6?=
 =?us-ascii?Q?VShqGa68G95LotNkvR5yJaRa800sqWo9rgbtIbXVIvAG7sxNaK3nMfAZ8X/c?=
 =?us-ascii?Q?t7jBsKqoSTMzXwK7A64nNRSE4fSICsmrWN9At2l9oW0w7pgM9N/7PXMcfmMs?=
 =?us-ascii?Q?bz5syx+B6RQ2qPg0CTw1ln6hPqnxFzBAOhRmgC2IlOIiKZAnl51xbjMS677T?=
 =?us-ascii?Q?O312s7dRrpgsfaD3NNj99uKvU/wGk4dsJmyBD2d00PnmR2oIMmfSTzPX4hY9?=
 =?us-ascii?Q?tWSH5k5uMj8wY8S7wTwVnf8rgCQUV/b4UUVzVNvZE+b+6wg3d5OIBA4GHRb5?=
 =?us-ascii?Q?aS0gWnIsBnyi1rXE72KKU+5EMn2VB6sF1FG8rfgr7zZyZP0TCnFOzy6MvREe?=
 =?us-ascii?Q?9TKW+ek0O8OTFh7eEOLXahP95+p5EG9NXi8FnoGRsBJCRk8Ak+PoMlV1cWgf?=
 =?us-ascii?Q?5Wq6Su14n5+mtiYDbGlul30wTY2FjUzJDlLA3KY4gXHys+VlpmmIXNTTmLFQ?=
 =?us-ascii?Q?Z0JVGRaF9QJv+bzHNbEuDlKQ5uuXaxS4nSaiHFd3V+NiO4ALNySdoc7iVA4x?=
 =?us-ascii?Q?KKBs7nygMYYQ104FnU3WKVWj2r69g2GbYHU87JYe4RZJ/2miM+qHua9f7XlO?=
 =?us-ascii?Q?9qKl/sqbsab1mXDSkqdYQOvZ3d9oqr1EagPae9DAYGjwn4ju6/dCvHc3Eqk2?=
 =?us-ascii?Q?72z83ueovt5/EQR1Fk8FVouNZps6rhhOR2As2WMxhOvZYb3Fl3MuKiECV2Sy?=
 =?us-ascii?Q?qcgKKewanUdtXWYwvgar1/09cJf2l3GYO8bACDLK5i3MEnZRauLgNzziNGZp?=
 =?us-ascii?Q?OHc7OHgB2PGKj/yriqxfa/8/LymPcNRJ2mT1nXTSuPjtFHicVRHb0jpIzRVr?=
 =?us-ascii?Q?uZsI2JRLG59szFxnn/dXqNAVooOQeIQr+I6Ul7OVkfBajmqmRC7ldeplGN1x?=
 =?us-ascii?Q?XNpRM3QuAkr9TwAxJsKyZ/LJGOAJq9A2aEOQ7jg8ghUtlMhjAMsD/drolJum?=
 =?us-ascii?Q?Q2gRz8b14ek+VvzsordGSzoFq2cYkb6o/DXOb4XGCYI9rIqzKCQaVye383j/?=
 =?us-ascii?Q?HtbqMJOBaeZPnZ9Kff3dyxG0Kcs6kLumWXbVzVPrUGuIFlXH84EpNWID/4D+?=
 =?us-ascii?Q?p5NWYp+iiatz5ij2oqN8vGBl5duSWYht1ljxPOn1IF+1inafmiYCUAS9+TKy?=
 =?us-ascii?Q?/QovnnYRefXpJQWdGqZPe3hZDpDm2YTGRwLlnH0DtoksuIclL6QKfRoXc3nU?=
 =?us-ascii?Q?kulsACBmFhPkjuuntSDbzmhPUTGBPPSD9qgtLJFP7XXAq1M/gLxqSI0fy7XW?=
 =?us-ascii?Q?AbLWWaiC+LEAUrIuHpvYPxfy9e4n/GXvdr3QpLWhIixYZHWTHXPFh/jYdytc?=
 =?us-ascii?Q?6rkq6vFvnJDlEB+JnK/et1rn22pMhtKw47ztx8GjmLmbvHlV4Z9xTtnT4yBa?=
 =?us-ascii?Q?fm+yeYQ79KD4B7Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:22:58.9945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a4e58d-a3d7-4aa7-a689-08dd46b9c1d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062306_141428_F27EE954 
X-CRM114-Status: GOOD (  10.33  )
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

The "pcap" and "versal-fpga" schema references are moved under the
conditional schema "allOf" to align with the expected structure so
that versal-fpga is only available via the versal firmware and pcap
via zynqmp firmware.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
---
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index d50438b0fca8..46d18ce4a045 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -69,7 +69,6 @@ properties:
     type: object
 
   pcap:
-    $ref: /schemas/fpga/xlnx,zynqmp-pcap-fpga.yaml
     description: The ZynqMP SoC uses the PCAP (Processor Configuration Port) to
       configure the Programmable Logic (PL). The configuration uses the
       firmware interface.
@@ -93,7 +92,6 @@ properties:
     type: object
 
   versal-fpga:
-    $ref: /schemas/fpga/xlnx,versal-fpga.yaml#
     description: Compatible of the FPGA device.
     type: object
 
@@ -115,10 +113,14 @@ allOf:
       properties:
         pinctrl:
           $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
+        pcap:
+          $ref: /schemas/fpga/xlnx,zynqmp-pcap-fpga.yaml#
     else:
       properties:
         pinctrl:
           $ref: /schemas/pinctrl/xlnx,versal-pinctrl.yaml#
+        versal-fpga:
+          $ref: /schemas/fpga/xlnx,versal-fpga.yaml#
 
 required:
   - compatible
-- 
2.34.1


