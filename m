Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A9FEA3F37
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOE8xK50LVNC2vo6WIvOKj85WNoxYu8GAz9RsmluCws=; b=gbSPK9erv3dX/TeAjblDlMGoFg
	k2jlLjepjKhzt3INihd1Lggqo+dUeTqhCunqHLn72Sryfku4hz4ECNEsjo5rq70WLNxVTTgVerhX7
	+Uw6NQgmFLA6b3HvqlVyfy9N1vQT10uPn2ltKRiLUQ4JfGPq/EOvo3k6LzoK0/Rr4C597CQ0fm1IQ
	v1KAizKJMiXO0EyYpwGPWD/I/WF5th1bX7DUkXZnIQ/Qhq07UwyXJ4QVC+7KGg7Yr21tvb9J25NMc
	auieclnZ5BOK7LEXiPkMTOj19jd+8uPR8u+JS/w2+mVWsdxJewdlbTTL5PlpVMf6lHwpzEeAl+FDu
	y/m0Tpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbC-0000000Gnon-0nDd;
	Tue, 10 Feb 2026 10:04:02 +0000
Received: from mail-northeuropeazon11012051.outbound.protection.outlook.com ([52.101.66.51] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbA-0000000Gno1-0f1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 10:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8WBhXV0ZZiIj41vOfddKI+np1bmzPm5DUj1p+4CsiSMYRR00qAks/dxZC89ZIno249YyfUYG6qO7Io6nXCZKBGZVf3aSpA3HKeAyNlKfpUUk9GXL/xIcBCWqtLTlBZi9lOVmoThRQnZWL64UDQy8+eFceqvKFPC0oW9WdN4OU1ZSgXUQXKnJbW46o8jwYfavjOYXOfpV+NZCbClr0zG63EZ/V1togIjHGyk3sMLmkVMHclncse4X0+RXV+/rTsD48esNfqaPfxYI4QEl6htBG2GD2RG8OimMYrXORlErlOKXAcBPiqSdu+Knvh853K95R/DBZmdCZD1IOFiJLuE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOE8xK50LVNC2vo6WIvOKj85WNoxYu8GAz9RsmluCws=;
 b=WzYUeiGPDGRIvsd7lokZYw0r6Zcc3ZWOAhsgUyFHbUdIYWh43MjM/IPdx0/Va8udNk8HnNCFXxRw0tM18PTfSpfFZ3NNOyAy0H8qGSJuybBxnP6HJr/+jMtlm+QvSWrRp6rOubMWthr7ZQYnGyH/+08iFjZw4+AMEsj4ET1TuVBoCshsUYrvGd9ai5HSbks1cM76w1eTq2T8g438TkcWqkTxx+KpU8fxX6Pj3Henef25wLey56jyF9JQgsAuo9mtTBSKMHq3GzIYlaC0mHnQlPes0WyfXWFsDgKfzjYGxdG+afwh1tvH7XzccFGoWHtTm0qAR/UUTbiz8xxp3PgSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOE8xK50LVNC2vo6WIvOKj85WNoxYu8GAz9RsmluCws=;
 b=ADHwGlNUC6TS8pcGq4cTTvCBy2YMBdxClsJ/rJbU7eBMEHR3EwRuOzSbxYEw5qcdYd5+s0nr0JgSINh9QYI6r6SpPftJUuZGIlLCgjO7RameFCJ/K3foCowhKgSMMTD7vlm0c6NTqbLEgQ0DWYJWGaqQb1lj/Kccuz6NVhB/ivRhMKbdCJkk/4dlcCevKkLEahhxHm7RcYiIqpX3CCrPZlwYG9KumIwDQh39PBXRNbleFTQY/2lFVJcbRBX6XnIbttg4ev+w1Plmhxa71lVVLREqegB6uu1XNM23q2Vbz5XlaMGQZs3knH9iruJpXztEZOwHnikLZplgmHIoa0tZCA==
Received: from AS4P189CA0044.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::13)
 by AS8PR10MB6972.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 10:03:54 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::64) by AS4P189CA0044.outlook.office365.com
 (2603:10a6:20b:5dd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:03:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:53 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:44 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:52 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:03:54 +0100
Subject: [PATCH v2 1/9] arm64: dts: st: add i2c2 pins for stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260210-display-v2-1-0592bd514958@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS8PR10MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d310e1-be71-4b26-f1a2-08de688bb297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3dzd0NoOFFxNk9BcWFucVNzMGcrTlhiU1M0UXJFTExLODMrYmFUaVhsc1JD?=
 =?utf-8?B?L0hma216cjZwR0hGZ3ZHejlSQnNtdjVXa1hTb3BTZ3lsOWhrZXNiNTdHK2hu?=
 =?utf-8?B?UTFSOS8yMEVJUjg2NDdyamxYQlRGeHRJeUdxcmdpN08vNDBZajFmMWlqdGNr?=
 =?utf-8?B?ZWo0MUNVNTNEMHRkNXgwZzZTanRKVWJkWEpqeXJuQUlrcHdlK216ZDRxQUFn?=
 =?utf-8?B?dVRPbEszMC9WandTazYvL0RScjN4bUJZYk5kSnE3Vm9lMERGQlVEMEZHbVF6?=
 =?utf-8?B?S3R4bDlQWlp0bGxVSG9qdDNBZW41TWZkSFA5SmJnQ1RzRnEvQzBibnVFZ3pH?=
 =?utf-8?B?d0twdC82VUVSUURxUHE4Q2tYaWx6VFZib3N2NXYzN3czZzJKSXdMdEd5bmdU?=
 =?utf-8?B?bUtWdTE4WE5GN0NIZFhjWmdsTjROc0tDQ1pzRzB4dHhWbnRHRC8wVm81QnRw?=
 =?utf-8?B?MnZlNnRPMmNLTkJxZmEyaGx1cUFxVDhEaXNKLy8rblExc0t5NTdXdjNnODV5?=
 =?utf-8?B?cDhCS04ySXdSYmlnZmdYQnJ5M1FjdVBRSHlpeVZvL2Y1TG80bVNsdFpQc29H?=
 =?utf-8?B?NFZlbDY0WWRwUnB0aFlDWGJPd3Vvb3BDV09MVXprZVdZcG5QQTdmdlBQakRR?=
 =?utf-8?B?R2kxRU1vMC9nY0ovU1hRYTNuM1lBN01TVVBzUDNkWXNnTU80N1NtMkFWOEhM?=
 =?utf-8?B?c1FLMzZJRDdKdTZna25IaUwxMlBHbzJEaENWa1hSVGdJeTZnR1hEazNDMllH?=
 =?utf-8?B?MDRCQmxvd2NFb0QrYjg4QzNrVGtGL3M0RVg0bmdzR3d1ckJXb1VoMVhzVkhI?=
 =?utf-8?B?TWFOa0VFTUs4bXRDSFNWZkdzNElvaityVDdmOUJLY2NEZjJpNW92Q3FIWmww?=
 =?utf-8?B?Z0JTTENQa0F3TUhxckdCVmpwS2lHdjRoQU50amxuejhmeEFyWTBqRVNNajcr?=
 =?utf-8?B?dUJwRjZxODNocUxIUDBEMm1ZKzJlRDRsaHVncHRndDN2YWd3NmNhZ2pHbDRG?=
 =?utf-8?B?aDZjQUEyR3dMcFJ3QUp4cm8yRmxIZVhaMEh6NFJyUWdsWEd5Rmk4QldwTTRR?=
 =?utf-8?B?blk3aWd4NXdHVlpiK3hlZVpVa2w1V0xIOGFDUVF2OC9relVoR1IyVVZFbDA5?=
 =?utf-8?B?SzhoeFFTcWJmWGQyOFcxMEVNalpoWTA4ZERNS1NmN2lIRVd5V3c1NjlJU1ZC?=
 =?utf-8?B?VFBkcFczbUNlTEtvWlVPdkZ3R3U2QlE5d0tpdmVTZlhOUEwzOWNnYzFrbkFx?=
 =?utf-8?B?ZDNVblN1VjBlSTM1b2p3WnB2QU1KUkN5UmhUSGRBZTJRbzAyRk1hTDJpSW0y?=
 =?utf-8?B?ei84QkdBMk80SmF3Mkp6RVFjWXJnM0tIa2RkdWI0ZDBnODZIR1JqeG1xSFJT?=
 =?utf-8?B?dGxPOEFJMnZhdW1XUXR1RVhEcXZxMk1JQVBWcEVKbGliclB1MTZNd3o3bzRw?=
 =?utf-8?B?dDhibkNjN1dGb3p0NXJBbUlSNjZyZnVCN2MwV3dYc2cxZFhYNFdjaEc4SXBS?=
 =?utf-8?B?eWt4RFd3NXZBRVczdFJhNGlXaTllWHdhMzRoL0tzSnlDbXZiajJxTzgxcjgv?=
 =?utf-8?B?YWkvZDRCV2Fsc3gvZWdGUUFtMjNxa1ZTd0RyTGFQbys3SlYxRWYzR0YzOVIr?=
 =?utf-8?B?MFFkTTRMcXcwcngySno1bUxJdGVqTVNDcThmS1hPZWRVWXNJTnFIclhDUHI2?=
 =?utf-8?B?SEJ3bTNYZTVDSjMwbTMzVTRaREpBeGtuSEd0d0JDd2dIOG9hcldqeHNPcVIx?=
 =?utf-8?B?U1o3bDZ2Y3MvUHY2Nm5DZFJ1aCt0M2M3NnBjMGJtSE83YlQrSGRROUltMzB3?=
 =?utf-8?B?WitudE1nbTFvWW1XbTJHTnVmYUdwK2tPTDJBa0REc3BHMmlmKytEY2pMbzR1?=
 =?utf-8?B?RGdPMHVjMTN1YWZYYUZ6eTVyOEZRcU9zdzdlU3hoZTBGR0lBNHd5TVR0eGJj?=
 =?utf-8?B?cllTVWpzb2pNZGxoUkswblZVb0NrNkRuVno5SWlRNFlWdXdhNUhjR0ROd3l4?=
 =?utf-8?B?cEV2MHdoM3BiSVdZN0hzVEkwd0xwaDQ5R21NQTQxTkQvQkJMakhvaVdOTlRr?=
 =?utf-8?B?Q2ltYjErUWlFWi9Tbk42bXROWExWM1VMcllXd1hyVG5TRGhsSzJhc0hQK1Uv?=
 =?utf-8?B?eUZ5N245MEMyVElwMHJpdzlSd1JQSGh2UDhGV0paTE11Sk16MG9ubzd6Yk92?=
 =?utf-8?B?bnhaN3VEMXVyWDhrM0s0NzJWZ3NwMkp2UUhNVElGRUpzVWdGbGwyZlJkbEVm?=
 =?utf-8?B?MUhSVEYydkNHdk9JdFZCMktaV1R3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A1d5Fkk3PVTcBJOiEKTt8CItBIJOA7JeZyDpuAKrOzd25eyEv4FQWCxADum+KXU+DFt3ac/Kts74X/P9sKN7IZRfhbe2J5kM7ZhyPSIjQSlIXYqgOn1nFT/fKjvZhPIQxkLG2jBIXuv3wkSRmrrWZncqjlvvf85c503YqWQixEy2SMeu7B2r15q5zfiWmo5LX55DtFJoCk4jg8r0+mIDiQhL/R2ENiZaqgETSjRyMAqHqC3r8g3N7tVZFyu+rTsTkx2qq29CF1UiaCcYu7yzhgytoBgH9InOQsqW8xamax0KG2zEOK4QcIlaaGanf/MA5TIXVa+5yoA7N50P7Ju56XJF/ojfPx84kngQolQRDZiAvFy2XZbOu+SmouEbdQPztfnxX1YVifZ7fzAmA+wHic+ePOl8Ovitjlo4s3cH8n0qs6r5ByB+mgRBixNhA1ek
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:53.8420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d310e1-be71-4b26-f1a2-08de688bb297
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6972
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_020400_228670_C5E1FB23 
X-CRM114-Status: UNSURE (   8.83  )
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

Add the i2c2 pins used on several boards.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c34cd33cd855fb28b65a39b59b49e089345ce9a6..2f853f3fae6d84756300f19da32d6cb0297d9e20 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -212,6 +212,23 @@ pins {
 		};
 	};
 
+	i2c2_pins_b: i2c2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, AF9)>, /* I2C2_SCL */
+				 <STM32_PINMUX('F', 0, AF9)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins_b: i2c2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* I2C2_SCL */
+				 <STM32_PINMUX('F', 0, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* OSPI1_CLK */

-- 
2.43.0


