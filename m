Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C659EE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yf6xYXO+cqCHuNPn9EzJI2MMIj4iqgWSPjT38rgx9/k=; b=N7HuzV7ow9YooL
	SvIqZM3eBosue4/XJfrVLEvBGjJWI08FtvWMElUU9Nnkvce9B6XfJEsZLBkxTpF1T/JO3jbkxdD0+
	18RfECcDNNqWXsr4CL/wVRgKCqUIJV6Dd5pmrJdOY8O41gCw+/QpVQVvCmGApkpr4xBgaq8EhtB0X
	1mY562khr0MAbdvggwNUqi3f3SHl+dJUIBNay2ubeWyyP+WzSnsO+Ni7ZEZamKhAs3RR61BLeOe2C
	3Zv/cLT9RPSeLWYWNFZTbEoamhOK6ZoIFIszRRFBZ/rhPf/OR0N9cTHdPM/MlGLYwX4EM3MTm8BjZ
	y9gsIBbcjXGXaWkKrS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam6v-00000005a5r-2Z4g;
	Wed, 31 Dec 2025 02:38:53 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vam6m-00000005a2p-0BBL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:38:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTWQ4fivrp25dGV/SqdyqHSU5IN70bSxEgdII0puZtFGISE1yFU2MMiWp37ILePy94vSVssKHVqLnU1WKD23F9Yt/34dbNi/5gN1IUE1FLvsOompgJWvgIYpXL43JbZWesuvQHwVVKPPSI3fcgBcMOLr7LpjBn/Hgez+Qwda8O3JG3lSsvuY5tWm6s5CzSJB59Tm3ofI7vkTBVb5cDAqq+oFiFdkZXogTAl+snbzAVqSgRVvi6R4h2Z/bg279SkhPvVvSmyj5mJ6gGIhRI+JwAe4k+FNVSzWd6hrCANKlpmr3BybR9SiSSrZ1D7C+maQMgDq9boRfuEd0u+q4byU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf6xYXO+cqCHuNPn9EzJI2MMIj4iqgWSPjT38rgx9/k=;
 b=DwX5x+IHRYVfDO82Z2qY5P4XCJ5MysoaTkRIrhI97cQDmegX2XsiHp/eFS5O/WfN2h/Xn77IpPaFXJA5Nck5Be2Zbre0+WZLtv6kafLp0SMIFb/aP0Qu3ciiMLGB6+/59O/QNbfIEjX97pMCMl+f/y77qEElfhoMwjlQSWDMnIi2ZNsOjUv9wgRmEb3CbbjSF6xepmb++OSqxGbly5v2Od6Pi0aahLqM4681UKp6BnvD2TLJFOHWJY+Qn2IqAwRNExBI45MIKBcKI4C7KTpKOcb+gSzXjNh7hXXtwIol429FNE0bgk8afk0+GICtDETytEXnrC99T4Y7+Zxr2A/saQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf6xYXO+cqCHuNPn9EzJI2MMIj4iqgWSPjT38rgx9/k=;
 b=HsOVh+L0t0BhOFICeH82HnQxcF/0U1l6ph4HCJE0dtLjpwxMExzMxG4mnlJexw1PcRORS+r86mxtJP0CBQLTcfv05TF3zjm3c5cNNldnzEinygHMAPrQqHxlmsB6aMIg3Tgw3FPeOip5IYItG3of6gKO1db11yTZVGJIgCnHGuA=
Received: from BN9PR03CA0493.namprd03.prod.outlook.com (2603:10b6:408:130::18)
 by IA1PR10MB7165.namprd10.prod.outlook.com (2603:10b6:208:3fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 02:38:38 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:130:cafe::dd) by BN9PR03CA0493.outlook.office365.com
 (2603:10b6:408:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 02:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 02:38:38 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:38:34 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:38:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 20:38:33 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BV2cXV71704518;
	Tue, 30 Dec 2025 20:38:33 -0600
From: Kendall Willis <k-willis@ti.com>
Subject: [PATCH v2 0/5] arm64: dts: ti: k3-am62: Support Main UART wakeup
Date: Tue, 30 Dec 2025 20:38:19 -0600
Message-ID: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJuMVGkC/z3Myw6CMBCF4Vchs3bIdFpEWfkexkWhRSZyMW29h
 fDuNi5cfsk5/wrRB/ERmmKF4J8SZZkzeFdAN9j56lFcNjBxpVgTtgYfNiR0VuIH80ZmdCmiI2W
 toWpPLUN+34Pv5f0rny/ZfVgmTEPw9t+jIxlWfOC61LUmrQwqvOFLxlHiKUnZLRNs2xct9Pdcp
 AAAAA==
X-Change-ID: 20251230-b4-uart-daisy-chain-dts-d01aa40560b2
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Kendall Willis
	<k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148713; l=2682;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=8FuQUt6OrIQ52dSwjO9Qe5duWZ/mKMz70sdjRL1Vm1g=;
 b=x8BkZ5vcCoORCW3BdXIwzKnbfFIebasnE54C8h1CRSJk8ud9b7kubPEYQyD/Y9c/5vgU2mIxw
 fuw2A5T2meeAfjoNPD9Pluydxa7qGgsbYi/6emFXytrEqPxnmBk9T6o
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|IA1PR10MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb8a3f0-3422-494e-30b1-08de4815b3d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TStaK1RjNDRoR29XQ1piZjFrZERIYzl3a1A2eVE3Y292SjdiVldIclI3WThk?=
 =?utf-8?B?SHFwVzJ3RUs3bHU0NytiSVp5eDAvVGhZdHVmd3creFpNS1BRbXlKbXRYV2tS?=
 =?utf-8?B?M3lNdm04a2JJSDRqZEtnZ2EyTWFrakNueTVYeU11ZzE3WmJkbE8wQ00wZGlk?=
 =?utf-8?B?THNNdHpWWkFTMVRaVzljL1VaQU11bHlqZkRSeU0rZmpWazV6blYyMG1aY3cx?=
 =?utf-8?B?YUcwOUVTclNVQmJINEZkN1o2SjB3WldFNFNKT0hqb2N2MGlyd3BMMkRMNmov?=
 =?utf-8?B?ZTJLb1NLME0xSW1XQjczYThxZTBGd0dWZmFaWkJ6Skl4SVgzRWhHdFVzQ3Q0?=
 =?utf-8?B?dkI0SW9qZllHcTN0ZFE5VHREUzdLSjhmUjdraC9oMDBaVVpaRWtqVENMU3lO?=
 =?utf-8?B?SytCNFZ2OW52clJOaktVVGFabmNzK21sbWZwSDVlYlRZdmlzeWNpYlRKajRX?=
 =?utf-8?B?eWJ1VlNHMHFpd3NPYm5GWXk0WTU2S2xWMS96clRLV2dSTHk5NnRNZWxrdEZV?=
 =?utf-8?B?ek1obEFEbE1TbHdnamUrZWk3SEpEYm40c2ZxWXdnaVhFSXkxTlVaOVZoSUw5?=
 =?utf-8?B?cUtTZWdtSFArTDhPNjFQQk1CWGFoNHVwMU5ScGw4R3ZVc0dBTjFQVU52Ukt4?=
 =?utf-8?B?QjZtbXdzK0FRSDNGemRGV1lrNUNrNHdab0xpT1dIdXh0VFNrcURSZjZHSVV2?=
 =?utf-8?B?WGlvYitYNmxzbkF5N0svM3R0QWhLL1A0NEh6eXhDT29La0ovTHcyWFdObG1q?=
 =?utf-8?B?WEFyUUk3K1huSTYyTnI4bjNZY21IN1NkTFMzK2NZTTRYbHhadmlkWG5NRnJx?=
 =?utf-8?B?WjBxWHJxS3NORW5XaXdaNGtDUTVYaSswWlZxSDdMVUJ6TU5NOWhtTko3VGVE?=
 =?utf-8?B?ZFYreHlqU3A4K3l4UkRhK2Z1L09xTk96ZnhvU3Q4ZWg3TTJkZGd3MXk4VWVn?=
 =?utf-8?B?NzNFWERucVdnZDlSS1IwRHAvUzZreFRBektxdDJvU2FSMlZlQXpGNHBuNEpW?=
 =?utf-8?B?YUhQampyMHZsMW5HU0h2QXUvM0xRZEFlamI1eEtuN0FpT0dEZ28wK0xsbjZ5?=
 =?utf-8?B?QmVieWZuY291UUoraktFdzEyVHVuWSt5NjdHZFJGVlAvNnRyV1FRVyt4WTh0?=
 =?utf-8?B?RXJ6NWNndS8wZk85YWlPV09VSGFHcUFJT2pVNExLcHkxTStUMU5zK0lRbXJY?=
 =?utf-8?B?Y0s1K3lTb2k0NjFSSGEvSkxwemk4RTB0dFB0U05nRVZRUGlTbitDd0o4NHB1?=
 =?utf-8?B?TzRQOHhNcmVRQVNjeVBmR2JUU0ZTRDI2aUhtSXh6cXg0MmxQSmRETWxJdWpN?=
 =?utf-8?B?VWZ3bzRDSHhRU1RnNkIwMjliUlBxNWQ2YlhVVHhRR0RGUGlmWGRObUpDdndl?=
 =?utf-8?B?dVQ4ZTNBR2FydzFJU1c1ZnhQZHo1QTFWQUp1VVRObGlrVTNPSnNyOUNIamlp?=
 =?utf-8?B?ZUp3ZE1HMTZ2dHRIVndXRGIxbDl1R3JYa3JDaTlvQ2pxb0lUb0JJM2F2eWw3?=
 =?utf-8?B?VmlURGsrSmgyeHIwRTQxRTBwblp6N2xIU0gzamVXV3FQWG1IZVBhbjIrMkFi?=
 =?utf-8?B?eEZ3ZXB5aTBYblRlY3RZNFNaNHZvZGV0c2dNNWl4Z0IxZWpnZUJ3RFBZUmZO?=
 =?utf-8?B?TGEwd21FVWIvMTVSc21zcWRzUkl1RG4wd295M2huUWppZkkxVG5xSFBhQXhX?=
 =?utf-8?B?NDV0V2JzeDdySUNWcnQxQjVWekdsRUFzL0NpWmcyNm8yZnFkb3cwUXozWWpi?=
 =?utf-8?B?T3Jqd05NejZXVDJ6dzJscVhNczZtck92ckZOM1lKUk9Gc1NSemV4bUFMZTFu?=
 =?utf-8?B?NDJRYnFBc0l5bnlYdFdrakFjMktMcC9KUjFzVkNFMDZZTm1Td1FwbkpsNDdG?=
 =?utf-8?B?MDJCSEROaDkzcVlFU3hLZWxNNnNmZi9JYkhwVUcwT05wa1F2OE8wZVE1aC96?=
 =?utf-8?B?RTBWVStKcSthVVozTVI1eHpvby8xWlp4dGMweVYwb0NxUzZ1U3dFR0VEM3RN?=
 =?utf-8?B?RFZmUzRYUjI4TVdmWlRQWDEyTmNmM0FwVXM1YzIzQmlSN05WRU4wV1JTR2U4?=
 =?utf-8?B?eGFpYTR2dkNPY3pHV3dhOWFHRmRISHh3QjJ3K2llM2taQzhmWWhKU2RFN0t4?=
 =?utf-8?Q?6wcM=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:38:38.0370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb8a3f0-3422-494e-30b1-08de4815b3d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_183844_087076_080CF35D 
X-CRM114-Status: UNSURE (   9.29  )
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

This series adds wakeup support for the Main UART in the device tree of
the TI AM62 family of devices. It defines the specific pins and pinctrl
states needed to wakeup the system from the Main UART via I/O
daisy-chaining. The wakeup-source property is configured to describe the
low power modes the system can wakeup from using the Main UART.

Implementation
--------------
This series is intended to be implemented along with the following
series:

1. "pmdomain: ti_sci: handle wakeup constraint for out-of-band wakeup":
   Skips setting constraints for wakeup sources that have
   out-of-band wakeup capability.
   https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/pmdomain

2. "serial: 8250: omap: set out-of-band wakeup if wakeup pinctrl exists":
   Implements out-of-band wakeup from the UARTs for TI K3 SoCs.
   https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/uart-wakeup

3. "arm64: dts: ti: k3-am62: Support Main UART wakeup": (this series)
   implements the functionality to wakeup the system from the Main UART.
   https://github.com/kwillis01/linux/tree/b4/uart-daisy-chain-dts

Testing
-------
Tested on a AM62P SK EVM board and a AM62L EVM board with all the above
mentioned series implemented. Suspend/resume verified with the Main UART
wakeup source by entering a keypress on the console.

This github branch has all the necessary patches to test the series
using v6.19-rc1:
https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/all

Revisions
---------
v1->v2:
 - Define AM62L system idle states
 - Enable Main UART wakeup for AM62L SoC
 - Rebase to v6.19-rc3

v1: https://lore.kernel.org/all/20250904212827.3730314-1-k-willis@ti.com/

---
Kendall Willis (5):
      arm64: dts: ti: k3-am62l: Define possible system states
      arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
      arm64: dts: ti: k3-am62a7-sk: Enable Main UART wakeup
      arm64: dts: ti: k3-am62p5-sk: Enable Main UART wakeup
      arm64: dts: ti: k3-am62l3-evm: Enable Main UART wakeup

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts        | 24 ++++++++++++++++++++----
 arch/arm64/boot/dts/ti/k3-am62l.dtsi           | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts       | 22 ++++++++++++++++++----
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 24 ++++++++++++++++++++----
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 ++++++++++++++++++++----
 5 files changed, 90 insertions(+), 16 deletions(-)
---
base-commit: f323ed34dc9831effb1ee95403bc364869d29d4c
change-id: 20251230-b4-uart-daisy-chain-dts-d01aa40560b2

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


