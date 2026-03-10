Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3CEEB104B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLqsjdzmuooo7CLedHC7AqpuPSTNFUGZmAR0YC8RY7s=; b=1a4ig992DNUe4ncW9YpfdCCQNJ
	VkexhVVjZHToaxDPoh+PMmLlE4JhMMiCXiYR+AwMPdNf4U7eV3GVCnEBlSXprklb3GFZ07t4JmeBq
	fa5uSwGczBe7SKkrxZNnV8T8yXxPf1W4PN1ya5eHQrfEc+WHU6XiP5gh5S60rFLFDfAAeqJeUQirO
	22GkPEUuUfnarv3ZZytwlxyeoyAE/BEW6e5mvfNrDPXj//siLGQ/xnkQc/jk2JhoFs5/sNAEnTOMR
	IGdTKW5AHZBNMZykhFpdhjlsey0rrWkU/40AUPPxGjg4ktZKfjcyOF6zjHCIWmgnAhn+p7/emQ6ZX
	QgorzZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzv7J-00000009GfY-13Mg;
	Tue, 10 Mar 2026 11:19:13 +0000
Received: from mail-centralusazon11010000.outbound.protection.outlook.com ([52.101.61.0] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzv7G-00000009GeU-1tFY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:19:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBWIKY25eJh7YyOls+q7Ml9QL3oErf9eh5VI5CbryBEbIeAk+LwmaLk9v9qGIlHFT1Hs5qUPYXWZCOu4NTI/GzDpRBkgtqHRbaJbbUjw6nra8FfvWbkY2U4D2UZhBMjwn6OcFxXEzjXRZogcTKaJ7+NO+JUGQAkV3CVPssgoxt6CwctkHN+6vh8CU59hXntJXLPTLL+DqR2maURw4tj3npl/e8NA5s3sJ1dZQMgBBRf1aUQXcf4mKm7aMvPg+340zxxvklXilLXZPy9bQGWjfV4dvVkmEWFsewjvgdtmHcH0npZDr1SqBFmZsM36LKrVRkj4FuUFQElKdbbChwYq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLqsjdzmuooo7CLedHC7AqpuPSTNFUGZmAR0YC8RY7s=;
 b=WJL/Pchbqvab+Yar73C4qWAOn62lLT6i/auDYxmnl4nFKcm7m3p4x6fGfq1auysLCw8r4fvL30GzUiRckIq8nHwBJlHVFjbw2q3Y0ZpKzNQwFK/QOI9C75RaiCInMyVE3cyyud5L3aLQEyW6paI/GHphJ39uyyULkYz1exN37aJvnjUasu9FX4mmBNC5NaWjH5nbkhYPKQ6ugYQD6xZEBjBLmN+zjCTWmMEaAUbjURzowC/HaiduXdcsd2aWd7Gz6lQ5Xd6mwVljeLYROTLm+gphbodihgSZ+QU5D0Q2Kh/1EzMoOYvRx6qqWEjtZ9rdwgTCSK76Q+H9hiEk2tIhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLqsjdzmuooo7CLedHC7AqpuPSTNFUGZmAR0YC8RY7s=;
 b=Tx3erZIeJT5E1iukHfJkzdPysFG2oFKeCfCByMtyydj8wkFxugF254yF9sIv9DxRnn6jwl94hioVaChVlKucHvero1TdE8HxgiMMJPzcueW85Y687/GWT4NTxm/eTwbNZIQTVNg/2b50reZ+mjAEnvFurOVZ2INUdDCSwVMiYZI=
Received: from SJ0PR05CA0107.namprd05.prod.outlook.com (2603:10b6:a03:334::22)
 by IA0PR10MB6915.namprd10.prod.outlook.com (2603:10b6:208:431::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 11:19:05 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::c5) by SJ0PR05CA0107.outlook.office365.com
 (2603:10b6:a03:334::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 11:19:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 11:19:03 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 06:19:02 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 06:19:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 06:19:02 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ABIm7b2963300;
	Tue, 10 Mar 2026 06:18:56 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
	<khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
	<lee@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <s-ramamoorthy@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <d-gole@ti.com>,
	<k-willis@ti.com>, <a-kaur@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62-lp-sk: Add system-power-controller
Date: Tue, 10 Mar 2026 16:48:45 +0530
Message-ID: <20260310111846.1084623-2-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310111846.1084623-1-a-kaur@ti.com>
References: <20260310111846.1084623-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|IA0PR10MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 25765bfd-1637-4ace-e901-08de7e96d65e
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|921020;
X-Microsoft-Antispam-Message-Info: CCcaJUwIsrHad7e6H5csZumYaK821M8CMCdNmP/CzPfULC9zGNtdBOZAPA77LZRWTy54XvM4Vri0Bi3luGeEgWPNADoQO5GhjO/Cbb83UIkqP1Hs2tOKuh1Y7fakWBEinTjAVwxFGcWHSw8iVGakqp6dgJxX/EbbOe3HxYsLcJIT7TniTh7O5X6ihHYb0Q8nJqiu33EZ8pR/0iZUzF5549OYVCLMt+BTI9gwI4PGJk+THFD1cVptSbUBktsNbgde0YUGpdw48GaITp7+jDWBAHnCogjL5NAT+RY89TH6wkfsGUNx4Ljnhb+OGrpkjChlbaoo3SmhIfCI/Tov5Tp1aO/GnbvkFboA50MoRkfD1nENHkhQw2kYMtUaYCeFvMu5mmon8tORHZjcgDjeKfhtg9xOuJia7OIpFQTPQujcCce5uJ4EEnKDWfPqSHjxLhJtMzttYTdwjiOtFInOC6zD4RgrcQx07Wt9hOCNJMvMNCnE9oal7ENKYO/wtaANFwSXmKqKBF74fjwKn/T6n++i5+zUYiOz/zBPf1rENSfn+PQ1NITfMmrvMsmYkrZgJvkg+hwyl7ZTk0nKvKdv68rpg4bMR/hLFJHnPI4tRAyBdqz9ZH3oJhBOyo+e02blrM1efppdVpgnir0Ff6iSqN79OKJXFeKudLy32mL40xrIrulFS2RRVVTCGoIG2lCkLPa9jvztIuGKh6tnbS8wvjoKQ+09acNhd/40UZVJ6haAg9IBRimzKqWBvkFq2tnzr7ItyaCn4teWnEyzfrBrFWn7vUBLIKy28rBpU1Sl7obvEc+tOC0azJD/TSQLAeUhsVb2
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kEXTo4EkUBDfHJJW6C2p8XxjnGfyQskp1R182Ko1uf/YSnr8SmsNWrPLNjUn1XFOmmYY6jUE/UAXbz0pQPxGqKrY0hkMroPsRzBlSEAanFsV3/nfa6J1OjVeRkaWmLGzCZYQ2wWwjp5YLaMLC2Ut0JGmFrzY983iNza5Ef3JA2MbpbCtdT8LDnO4Z3YVwI+jxB/C2p+2mzUPIYLrIGx+QFQAiM6PX1gEHvqBuL4FzG9+mhhrrO1+zlwsUP4zFRfBwF7m3FVZrhlarNv/Ddn0Dj5Vo8Lo9n9NtVmHWqHWPcMj7CnEccfvbIRvact7SLn2bf1c1iF+n3G0KcW0goQpXpZ0FrEfyxaaaXjSCH4S2++Z6VsKf/2xg6IfCZOgZyvwlhtG8YtgF7EGZ73aF4IuP4UhxBaOc7se3887upEI27nDLOXi6Re/OQhhwqecP5IU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:19:03.8645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25765bfd-1637-4ace-e901-08de7e96d65e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_041910_490662_CD8EE9A5 
X-CRM114-Status: GOOD (  10.20  )
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

On AM62-LP-SK, the TPS65219 PMIC is the system power controller
responsible for handling system poweroff. Add the "system-power-controller"
property to the PMIC node to explicitly designate it as such.

Among all in-tree device trees using the TPS65219 PMIC (verified via
compatible string), AM62-LP-SK was the only one missing this property.
This patch corrects that omission.

This property will be used by the PMIC driver to conditionally register
the poweroff handler, ensuring only the designated power controller
registers for system poweroff operations.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 3e2d8f669535..786a7d695b33 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -206,6 +206,7 @@ tps65219: pmic@30 {
 
 		interrupt-parent = <&gic500>;
 		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+		system-power-controller;
 
 		regulators {
 			buck1_reg: buck1 {
-- 
2.34.1


