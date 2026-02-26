Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF34AFC5922
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yfcKdJ8UV1sLhFrjZe8+ZeEdGD7kNqlg5Bcfg5fU6E=; b=ONh2Lo4eqDrrvw5o75u2yXAIPJ
	M9SE2jm8InYa9UaSS1mWY3LLgqV4mtXwQA5c0WtukLYd1ZNFXeFRHoOyevfpNM4uCi8n8FN6cyq04
	iLALuLsIdV18hINSIqAzZSCNQMkM8pGcPvVwQUxPWbv5t7tlVXRagbuzr9xF0Z4BV/anUExy5BYd8
	Opk4ivW7T/YhnpuYCYsQqTf6H4L1IA/R7sFVI2g050O2KlH3U1GijTB+xxiiyCT6g1ysWPsJ3ZfWZ
	W84UDYKYJ9do8+v7R+TsM4GtRXdldQ8O6xSu+NSqSxTNvOWgimTvXvENkT1jnyoCo9f1Oe7ciNxR1
	Eb0Ty9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYez-00000005vKB-1kTy;
	Thu, 26 Feb 2026 10:31:57 +0000
Received: from mail-norwayeastazon11013046.outbound.protection.outlook.com ([40.107.159.46] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYew-00000005vI1-1j6F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:31:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQxiVTaiUr65k/JfXJtem3ECnXwCNYKtvvHiCUD4oi6yCYI3/t6FU7/ivh8+vsoZ0fEQoocCiWSQYRpkvVN4L3ldzVSib2+zDCKXbdxo9ruM8E+90Xs+sI0zzaof2lXM8+7/XDwFvV/r/67dE39lQfG6ZgNG8p4Jz22nj1jIJ/CiEkzTd1RFk1HtPX3jlUYDWMdGMo9Rd3ytTSJMEZtmXxRc0QgBGNyUlH+DosWkgn7axYusSs7TzR7Nu4SbhBdziDcVViy3rHAJWHeGV9jL03gW8Fr5JfqsTLX2mnb8ljCRhn/97u0SHsWN1uvXUcnsNC7RP6bhae2wnhKbGB62HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yfcKdJ8UV1sLhFrjZe8+ZeEdGD7kNqlg5Bcfg5fU6E=;
 b=E2Scwj7NuMSBpFj7PM1dGFCyaEDeft7q4k2cH9EGUflRj/XN4TAO2PVyDw194Z6jWjQRfrYvb0vo1ueKkpfAwaSMUWtHD1aQWEX7RdoerBPzmFiBdHzg82/H0ZBtKacYXt1AmFT0tZWyM7/Nm22OgcyHQXEGleyFo7Ay1UVX0eT9rHuGXgrLnoiNuOVY0/9pSCiZN73K0wSNtfEMZPm8m2ZQSq6GDU3TCEP3ks5zkHjMp8vsvgFqXKeeCrZ0CjmZqc08k9L3OdeBgB4Eip8vWE3/g9Kd8EX+S7g/W9weeoA3zP5eW/wlWeCZt29ub/ilmjaXShYXMDPwiA4VoI5EVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yfcKdJ8UV1sLhFrjZe8+ZeEdGD7kNqlg5Bcfg5fU6E=;
 b=KvDjeT/20mjP2bFZuXYqNS+A66bp8zmTHKLVYWtpJTarlsK3p3Ec8vvqbdPTrrV1PndhHN56aa2FL2xqTJsvHMFkzrWNvRLX7zGvqQEaQh2mREMbXT+zjz+mMO52Xz6yetsm0AK16Iyh7SS57HDPJLiMVm7ZNCJmmuFK1NM5jeKIitJ641D9R+gDVAcj1n86xmpOWyq4N1yeFv/0wzu0Qr26llSO571CkrJztauOwGiacbI8OE6zyzdcqLiDoQWieBzqr73bi798iJaxP4BCPjeDMgChqoJYmUAubxIu0X0PznUB6DQJDeG/6zLIm/CA047ILuV0pauiiLqyJpnn5A==
Received: from DUZPR01CA0351.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::12) by VI1PR10MB3614.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:13e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:31:48 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::3b) by DUZPR01CA0351.outlook.office365.com
 (2603:10a6:10:4b8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:05 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:47 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:23 +0100
Subject: [PATCH v6 08/12] arm: dts: stm32: enable the debug bus on
 stm32mp1x boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-8-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|VI1PR10MB3614:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1b3ded-e430-45a8-1037-08de75223f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: XyxXCWTB1zTcCet2F70fZyNeHFdhMi0Qv8bE4LEn7Ybxnzx/tqKDq2v8uPI9o4XmO16VI7Fjb/AzVZQGPEMP2EHoPyQ+uRiWUdSPD/AkNX1VvR3g576aq5aJdPPN/9UZfg3sBZbsftBtCp8JEXX/PbFxzNAXwHpy5kflGqEDpfr/UewYMw21hvLo8WXzXMi5PTC/dPa+GTzfMiZ9UiNymSC5BOff8xJeGEeek03E8efaDiznISW/FwMCahCPWv7m9D9d1VAMWjZVPgzrUjbI/Ru5haaoiJUMQRsBVLLVGNl2XnKQgCnbXaR2zllAqRidgH1AFR9OlfGPZryjtwYpmLSfzfHwsRLP7eNasUmXdAmTiDCJuufV5SE9F9IRQ71+0SOXs/JhsrkGT70M393Kxw4WnxigbfX/dc60aCqBpxeAeN0BUQFamg1v7ieRpNXAdn5axRoE5zFrHH7i0V5ZOem9kUsCt4ilF/k4y/zsU+V+5v06V71kHsZoM3RR5SzoCDft1fa3FH2SjPJIP3DTKspp1AexjNcTpMINteRwwc1GI0GQnzmVOa10gsPXXyjWke3ud+qdEROqCU9FG1qA9t+WKdml2YX3rK0F8sPIFtWbtDHtCAaBhAm5n2joiRjnmLnCv+nP7I2aZZO4wq88zKCy1R7cGw8sjah6IuFg//h21VyxYSMeimNzIBTobjFXi3n4cUYAz3NYPP3+i8GcGkHg+qd7AQLFHnP+dh+njRNbgjAnhC8zOf+fdaRFklr/E7GaDPNb3NDReS8UPiO0J98AN9cpMtjwS+TbjKbTZe6bmQLqp992ColEfbYTfOXRf8WBabhbNi1HRXW3f9pD5pJEcupkEoaWhiQAGjz1pqg=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: coPVxx07mut1cNztnewiixikjPcTtZsHWDsVUxau1gnqaaXylzhpSw3lKq3KOUPsWVyHlmunRvw0pFTtXDzby6OIkm3h9NPJ/keM/koIGGAp8xaKO3xD9f0FDziOGG2eoSLlppG7opkZ47jxyiUP5uSqQMBuYw2t/hTnjVhzUAUd2DoaNE2lvIgQxQUDj3AHcv42TRTsN6EmWoEFgKYhJJrNlBfb50xTqP8LEGiGpqltcGQaD9+B3Jxpwq4UexF6oxnbZVTDCzFNZEO2d1g027qjlmFMMFPspd5Bn3efTx1RWmMs9K2JRDfZ0OFeUVTO/6dzmYhzu3KFFIvP/tpFBwGmqEVYyAgG6dMgaVgQQnqod/kSkUgt4tubgHft2QfVffZya/wpWFq1HakeCS2t0IDvKFesVkJU3KMyZ6wlCLHhFIC+0vdPiOlBH+1/6oox
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:47.8974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1b3ded-e430-45a8-1037-08de75223f09
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_023154_455817_72ED8347 
X-CRM114-Status: UNSURE (   8.71  )
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

On stm32mp1x boards, enable the debug bus so we always try to probe
the debug peripherals, if their status and the debug configuration
allow it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  | 4 ++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 8dcf68b212b4..0a47687bd9ed 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -187,6 +187,10 @@ &cryp {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmipp {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmipp_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 4e46d58bf61f..d91b4ba79527 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,10 @@ &cec {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dcmi {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 7ed2b01958fe..98b27b5d1311 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -155,6 +155,10 @@ &crc1 {
 	status = "okay";
 };
 
+&dbg_bus {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };

-- 
2.43.0


