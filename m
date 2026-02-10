Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD1EA3F37
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBkcdQ48qD5gZhzMhOt0LR6v6wSNICtCjazg/yHk9fQ=; b=slrfW6E8cSe/HVx2CJaUM3kQzl
	oflRvoBkhOQrW5HCvxlRG+3B7vR+OCu42sciteou5Fa8LK7rtnk3FaiexDZffyHW85ZEylWmVhz1b
	NQ3TPMFdXKeFmm9Mw/V9YrWV4ZcGe5D1rO+fN6zPzB3nzcZP9R/DR3l1x/a0wC3OIepsCaP1ddXfI
	flKrnDYHDjCJl6dcxpNYR4JUa5UIxCdqQc9O9syTl7ujmn1QVIouLE8FbQJegQG/GyZ5COUbwZitB
	5X5fhNuHsWNxV/KtWOQcrRQjMTlMJkUA+0fT+0sago5xqtoCFFY/SjHZJIGa3BlIFrXUJ336R/Bp3
	RnqghnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbL-0000000Gnvf-0Crv;
	Tue, 10 Feb 2026 10:04:11 +0000
Received: from mail-francesouthazon11011041.outbound.protection.outlook.com ([40.107.130.41] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbE-0000000GnoX-0DER
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 10:04:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9whfdyBdUI1zzjzAlqeamjuPOObzl7+RBfH8REz/d7Yr0MY/CZdzY6xWAeSOTBXA12ckXPdA94C1AtSishIJ45PcQM7jExCIAZvsFHMYeGlEDnaiQPd6jvtdcyd7Pz6aAtiCfN0dQEEIU2g3sEAfBjWXbWotCWzuaqNIddl65xqlDDAOEorH9h8tDvhid/ePEgBnKu0u3dxWp6+fsag4CMKcABw6X+ql54LWWjc59x8aTqkXaHQLIROwZhf7eerb8UnO3WyNj7/0xlNHh8B/dKppn7kACNIFtB0otN2qXqUpWYp5jcbY6VNKFIAbs7HLoYgDFf6x+C+ln+L3ePPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBkcdQ48qD5gZhzMhOt0LR6v6wSNICtCjazg/yHk9fQ=;
 b=eLTbLHQWdI0WRWh1NARIf50HuMcvwqVJzESgXFiSo9a57rj+VTCWcInSe/TCSlAK55GFLrMvuZrCWalmX+JyYAK+zI1/TZqWzt4gQzJwYGtym0BY7lJF+F/C/nUGGHXxNv2BZQD+ffDfGyVly+1MeHUsV1dnNoXaNNieQx07wHN+557ZKwP0wpMsSt1ld8arXu9NF7hAEvur1HLK1reIRzcrKq/yvhEJ3gnP/BV5qjdCFZtSKbFxLH0ajEjDXFMLkCYCL02WT1P6Hjep6bLfQNYYcH86IOm3mlhnE5i0q3Fum7sReseakaGB/Sa7cLqnSXwtPSGImsaU5JQwZXaEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBkcdQ48qD5gZhzMhOt0LR6v6wSNICtCjazg/yHk9fQ=;
 b=du45Le6juGFLmoRBAwm5q8wdeekrq2DqP8BpH5qE9gCAcgf8TroXPP4rgZqsZMQjCsMFQjbDbVVCOTm1KkyEQsWSNKfANH8VkQJfFusGBU2pwakr8bwjSwQDYVOQLxVpnYqeMT5VWUBCQDdYzezIlcY0M7sjgc5VYqfQASTkYjByncvQcl0F3QbgkjEHxt3mYPz49/xjWCU2tWapoda7V3Ko9RCJ8TsY8nXeURRdDuBd8cLX3oKOfikpL7k4KK96JZNGAbOHXMwMXxltntONoUPFRJZxfuBF4/BWqNWhWBQIgM4WD/V5qZkrRSeUPIcJkSc4SxIoAv4Q2Owd8jtdCQ==
Received: from AS4P189CA0042.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::20)
 by DBAPR10MB4059.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 10:03:55 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::71) by AS4P189CA0042.outlook.office365.com
 (2603:10a6:20b:5dd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:03:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:55 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:45 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:53 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:03:56 +0100
Subject: [PATCH v2 3/9] arm64: dts: st: add ltdc support on stm32mp235
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260210-display-v2-3-0592bd514958@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?=
	<rgallaispou@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.75.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|DBAPR10MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 6952640f-4dad-4c44-cdff-08de688bb3a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R01QWTdqYmYrT3FtQ0Fpdkw3K2pPcUI1aTdqcXprMm5ZdWU5WEQvRUZXbVhH?=
 =?utf-8?B?YUU3c1orSjRiMnVNZUlYSUw5ckg5ankxZ2liZm4rSUNnOFdiZjBiYnFveExS?=
 =?utf-8?B?VWUvbUxxbjNQU1dVYmdjZjltRm1PK2NpV3NzRTVwYjY0NnNvdUowMVAxek9V?=
 =?utf-8?B?ODYvZ2pIcTVoQjh6ank5TFppcDFqWkZRdHRRclFKV21CVnd5MkQyWU5ady9x?=
 =?utf-8?B?alJ0anVtUjlkdk52aEowNFMvSXI3T2FIcnppNDdlSUdUSmprazExSE9tSnZs?=
 =?utf-8?B?TGxZT012aFdVNElSZmJWK3FaUTRJWlhjclp4YkFYeS95U2EyZUZsVzBnU1R2?=
 =?utf-8?B?eDN2UUFqMlRsaU1GOVVDMEdMdm1LSnZua09leXRIV3hHVVEvU2VUamw4Q3cr?=
 =?utf-8?B?RXFFOGpJWVRmWGlwVzdFemV5SXc2M0YrZnZmYnVKemx1T3FRSjZjeXNFUkJD?=
 =?utf-8?B?RUZHYlpSQkJPV0xuS25yVTNTZ0pIWTVEeGROWUpVbmZLaFVUQUFiREFpb1A0?=
 =?utf-8?B?Rm5JdS9QQ0FEUFU2L0xaS3oveEk0dlBVNHl3eUpueW0rcHhLd1RweWJyb2Jo?=
 =?utf-8?B?QkF3RzVJbi9hZmkyMUwxOWwwZ05SOGU3WHlhYW4wT1l3RVhyMFRzVlQ5QkFF?=
 =?utf-8?B?MFZTSGRzeVFOZkt1NmxGZU52dEZieXRkNXRXYmRFYmVwME5JdHdYSzdNeXZz?=
 =?utf-8?B?a252bk9VS0NQSHdGbEt3Q0NSdDVaeGVpQnJQNDduaGxxSnNCWitOQjhlUFdv?=
 =?utf-8?B?cmtDUWJWWUdhYi9aUHpyR21OcTdpYWtpd2FvenlGQXMzV3J4YlUrU3dXRlor?=
 =?utf-8?B?N2xsTG5NeXkvNEdrNGE4c0llVE5GMDZaNmh6aFZKQ3Y1Y1kyR1IyTnJEUVRO?=
 =?utf-8?B?Vm5FSG43QjBqMVNKRXF0QWdXZXN0UmFCR3BrZDNwR3NPZEhvb29NcDYra2NV?=
 =?utf-8?B?eW9TSXZVOWszS3UzV3pFSW16aHZ6MnZZSWxTdzd2eHA2Y1MvL01Jd0k2TEZW?=
 =?utf-8?B?ZVBLRE5BeTc0SG9jY1MvYXhwVHBMdTFmUWUzY0Z5eEhRNXVYVi9lK3lCcmNu?=
 =?utf-8?B?cHBGc29jTml0YzV4elczSmlPVDZhRkt2OENZTFJrUEVvRWtIR0c3ZnRHeWFC?=
 =?utf-8?B?dlZMUlBRcElBZmdpVWU2OFgwSGJDb0tNajVoQm4vY1E1QXZvaGV0eU50L3V2?=
 =?utf-8?B?ZWdCYUVTMGFKNlJTcVZBdCt1TXMxc1MxVkhEcm1aeXRHTU1hZWxRazZucW5E?=
 =?utf-8?B?eGtmVWVFMEh0bXMrSWVJU3l2QzZDMzJ3OU1uVDQ0dUR5UGtTM3BwZlowbk10?=
 =?utf-8?B?YkNMQkk0UENNdmJoRTVkeEdUWjdLa1liOEZNVm9ZS2dHS1FBUjZLVXFsQWdP?=
 =?utf-8?B?bWhmdGo2U2VycGg5ak8xWXFKa3NiczhRZzhHT0ZKQ2diUTZLRDIwVHV2WlEx?=
 =?utf-8?B?b0hvb0NYa3FxUWk0eHpMNDlBS1hTYVJmMDF6dTZkN3RDd3Bmekd0UmNPWjEx?=
 =?utf-8?B?VFlVQXhVSy9SQmRURnQrby92elB3bGtwV3pBMlF3b3A1VUNlelVlSkdSdys2?=
 =?utf-8?B?ckFJcGVvY1FTVkh5dThhMHJUanloa013UlBWUWZjSERycTMxbDdvNlc2OFJ6?=
 =?utf-8?B?UmZMM0REWkk4M2FuQ1JOcVNNcTZiTERMQ0ZnSTRyZm13dDZ5Mng2b0hDeDlJ?=
 =?utf-8?B?SVF5Q00wWDhFNTBYRVpIQjUwakRoMEsrUVlDdFZQMGN6L2h0VzlPcnB1aUtq?=
 =?utf-8?B?SlVOeFQzazZ0L3ZHYUhVSy9lejZYNWNwcjBKbFUzRFpBMG42TDJRYSt4K1M5?=
 =?utf-8?B?SkMyN3luUEhIZ1RkdTRGYkgvN2RDWjlvSXQ3dGJCd25zd2MwcjcrTE52TlpL?=
 =?utf-8?B?YUlFb2tTdjhOT2VHelVZanlWRnYwN1UwSmd3VVA5c3l2U1FkNkUwdWR5cHIy?=
 =?utf-8?B?ZC82d1NGN1RIWnkrV1FNVC91eE5wUkRqQ2R5VEVRc2ZNNUg0d1FjbVdnOUor?=
 =?utf-8?B?NFRuczBqU2Rpak1TRitGMlg3UUdYTFU5bDBBMlpFNTZMSEp4QURFaUwxOEZW?=
 =?utf-8?B?L3VEUjNSNUdHcGJURUJhYWZWSFNTUkZ5SGNTR3ppMnkwQzUrK2hDYUhmMTUw?=
 =?utf-8?B?TUdZRWlyQkYzcVVOZXBodVJyV0xiMGQ4L00rN1k2SDQ1QkMvdHpkcUUwek9J?=
 =?utf-8?B?d2Zwdzhyb1FZT2tsTm9uaGdNRi9PVUg0eWFGNkhoc0trVzA2Skhlc3ZXVmVv?=
 =?utf-8?B?aE4rcEo1MXBLOWNsWFNsNlN1Q0V3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nnWvdQWGcz86IiU4P1g6MIE6H2IbxfNgEAc8DrUs5KMZdWjHYb7vYqYZ+wdco5Q/bb0IO3rukkZy+q9pTQWaSWgh9jum5Myan05ecNhSpAfpr4DgKgteiPuhhlsEtjV6+gYc4g8O+mp4ucK86muq20Htf8J9NIRyecH9nHMHZZuAJC4UrBuaIRffY4Leb+2WEw3IEZd09ZHpPLgHdKrWRmxZyQdtQHl476+4LAbRv3qRF0oj4ijyeuc9jHnD3WRaYogFRt2kIBBoV+OGLfb0OI/QQkbfKHrVg+//0NpzeUQTuFtBkjmo0bBgp+/1kPCI6jo6sZpyrsAbdXCkV7jrtcN5kYcufynAEhhiwgixSgSpdjhm5bXpl9FLbR5HNZtWL6UyNMWAM7isestCSPtHLpHqMz5ciWUdb2fdOsaIg1L6nKuxcKd+iLF4lCjS/lbp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:55.5751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6952640f-4dad-4c44-cdff-08de688bb3a0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_020404_099329_2D2431A7 
X-CRM114-Status: UNSURE (   9.97  )
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

Add the LTDC node for stm32mp235 SoC and handle its loopback clocks.

ck_ker_ltdc has the CLK_SET_RATE_PARENT flag.  While having this flag is
semantically correct, it for now leads to an improper setting of the
clock rate.  The ck_ker_ltdc parent clock is the flexgen 27, which does
not support changing rates yet.  To overcome this issue, a fixed clock
can be used for the kernel clock.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 6 ++++++
 arch/arm64/boot/dts/st/stm32mp235.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index a6840882f512b132b69b917ccbc6cfd4a502a481..05055bc523850282a2e2b217b180930b39231189 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -45,6 +45,12 @@ clk_dsi_txbyte: clock-0 {
 		clock-frequency = <0>;
 	};
 
+	clk_flexgen_27_fixed: clk-54000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <54000000>;
+	};
+
 	clk_rcbsec: clk-64000000 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/st/stm32mp235.dtsi b/arch/arm64/boot/dts/st/stm32mp235.dtsi
index 2719c088dd594ba90f683d8809b54fecf471ba40..ae98f503529f0a2473f250b4d9195820135ee1bc 100644
--- a/arch/arm64/boot/dts/st/stm32mp235.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp235.dtsi
@@ -5,6 +5,12 @@
  */
 #include "stm32mp233.dtsi"
 
+&ltdc {
+	compatible = "st,stm32mp255-ltdc";
+	clocks = <&clk_flexgen_27_fixed>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
+	clock-names = "lcd", "bus", "ref", "lvds";
+};
+
 &rifsc {
 	vdec: vdec@480d0000 {
 		compatible = "st,stm32mp25-vdec";

-- 
2.43.0


