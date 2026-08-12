Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE801C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSMdY5M0XlUkqX8oZtNk3e2J5OeqtGVracVF68FB0qQ=; b=31njafcbdIqGRvSWVfySzBTYNm
	YGsFRylkUEtUTOy7KXaBcrTgFWsMTuA5Mqj/dcb13CGiagYYyAq5z7ACONlV5B9/nlvq7Z7bvmIFy
	1f/Jwtc+6H4WrZNNXwNkkAt7gCnpeJG3t35YudqDMtFbhFIBXTp2yeUsGfJB8g6I++EaO4aSdEHhN
	B9uVE38kSWL5B9dMQHNwggjJBMnMpdNzIZQmNKX+LX+8z3o2WZiWLgr0MFeqa6rfkVcg9ImpZXaCX
	g9PPou4kRgps5N3s0kJoHEScs7E+yVcm7C38IPJZOFbJtl/vpS80LSZTZFrn0brl/V41sM2PqMvUX
	aCCXz+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu50H-0000000Fi2r-0hJC;
	Wed, 12 Aug 2026 09:12:07 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu506-0000000Fhtt-1TgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+CJQsepdarzwUTnXVxykiTqRFe78CfOqnwux3/EsOhLzTlXwmtEVv+ymStYeukPJ2ySjWr1g5iUbjhaCWIZ9cJcijLZkoY2Wq2H9ZkP2J9+BGvnczlYzn/aN+QpNUKmwDog+NmqZLzy51RI+dvUSgb4USbEqncs+oi37NsO2KWXHOZ0Zy/uwyn/3kGDaGKfDgAHgAzD47hN0V6e9RtHKNVzGpTAWmFA2jFnOoaTBzk3LaCWqrx2h0ArGsaKUPR2kXune/+o211RI4aN3FR+25+DAG9i2ZUdOdJ8spbcQXIjd0+qoaL7jMozU6UcFZ9fcKZG+Z0ZS0hdyV+UZcTfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSMdY5M0XlUkqX8oZtNk3e2J5OeqtGVracVF68FB0qQ=;
 b=QLSgPmsiai8U3+GtUR/8esTykz0YC997He000D43A1r8twiGokkteGsN1ckjC94XQ8CyOzj8E4cOz120g3viil/ejgStSx9+fnHLg14i/8ODbYmh3tEvTd+duJ18BGd0b66kg6Bx0ddu/qPo0sNTHsJePuemg5hgzQWnCotejqDaHf3Wm7ZBU4BwbCa7cUILAHr3WXa9I5oFQkGBA5ocXycjC9OZIWXNbIZ4xTIe7RH9NttBDAj37iCPJ7YaRJfaHjWXAyfXW0oKGKtt1ttqwVcrvJmzHGAcvKNoBNZCvvCG/5+xEbdWTYrD/RFF5dJkd0Hvk4pa2g2sndhkxYYEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSMdY5M0XlUkqX8oZtNk3e2J5OeqtGVracVF68FB0qQ=;
 b=E89Mb9p8KNYyyRzOaSrxeV7SCjFMPNXrXCRCsp15yBPMiXBz39gM+q3AK1u+q769RVQh5x8y1v9BTe0kEk6p5hBCLFAiUWeLNp7IRt7xAvETjBLrA0r0YJlJp4j9oL3Oba58hB/bIytB1SBWE5y1M8Mc5Xdewd4BFeNxErGt/5zTYwsFjk+FrCms+hxQY3oEXjk0KLGlGRtdogNoJqoJLPnEgP4/uWeLkN5Nt4S5Qufm37pMvFZqU0djlQL3lCvgODYQ13Z2yBI+0pUFo/5O6JLKHvWgGmsTKZ+MWF8dRxzDYHlB/eEDlDwh6b0jww/QrwGRi0d3Z+nZ555O+pknYw==
Received: from DUZPR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::17) by AS1PR10MB5505.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:470::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 09:11:47 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::a2) by DUZPR01CA0039.outlook.office365.com
 (2603:10a6:10:468::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 09:11:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 12 Aug 2026 09:11:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 12 Aug
 2026 11:16:42 +0200
Received: from localhost (10.252.2.245) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 12 Aug
 2026 11:11:46 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>, <linusw@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [net-next,PATCH v2 3/5] arm64: dts: st: add 3v3 regulator to ethernet on stm32mp235f-dk
Date: Wed, 12 Aug 2026 11:11:20 +0200
Message-ID: <20260812091122.566439-4-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812091122.566439-1-christophe.roullier@foss.st.com>
References: <20260812091122.566439-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.2.245]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|AS1PR10MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: ec27811a-84ff-42c4-caca-08def851bc76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|7416014|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: enEjvneYXOyAXFWO5BH0zUgYUEaMuunq7uJvhs1hvrYqr3hUbltoweASjbva1k1U9fuyxaD1v/wFyAkv8ZRabZOb3yZ4e3QCO4qLzl5MsTV+hHnCkf3xgVBdeyRuKZz9JdUKAgHIYDKJknu6Wb9zSTRPWz+IA/5+pKkHHfwn8u4+c3a2M4A8qLoOPa+hymlss9azEx2hQYhWcslOy4XqZ/6U9j0GTsWn/OcdPzIyLL9C1JCMLnbVsirCD6R6Yjy4FgxLajELacWsJM0qhLiiQRVA/d2a8gu99sBwzng8GArGH1FNBJwEb3DxGOP2DsZ41PVDnqdCXOYMW4CBnEZqs/BFIY90BVFQWUWAuOo9y7Q7HlBgUUPkzyz7NFSsE0aIkxVTADLOmgYYfsRMmS5yIA3yWISQRcvQJh0lAe7Q6+PQZIMQ5vxDMJdac78DOMB+p71n6xhJekpUNtBNvm6uXCeObJHkPcu2+VWQwx2TXP5g0zpev3h73ZDNlCdgFjYqQrw4Gn/8gku5K00VyfVFgjqndtGMUQVoQOGlvSEOH7I44MqH31MAd+SRRISro2dAsQmrza5qyxfQk2iJaOpb9HgaXfDsxzA4KXHAvR3agIaw95qtJG4YI4Egc3WKkqWQagF02CKNZoxZ88GUKJ+GI4f6N/NSS9FNlCKwlUcusx5oBAJqQ3NtBh5L2CpIZn/lvxKp1fCVRLng9dgcqSXxHdXPDSqFsM394rIYaIIukEuOAACTYYpQLZ/aXO+ZPkYr
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(7416014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e65SA7lCLbLDl9nrP8606shkS/e4XH7se1lp2cVShIGUGHRycg7SAvFStFsPIfkn/DNtnwwZTpO+PTMOdDPGuJekXMoDTrolavyUY4cctwaKB/LaOPfPU9Ae9d22DCtCwTd5MlrbRPWnaq8fskiDh73PFzRWgqzZ6VPlUpQC08sVdGNaF5O77nsyoXyowkdeMRk6BIXGuXbXV1ugfJfMKCObK97BNiQ/3FC2fgUs3B4dDhKdACUD039x18RMtrBw6ee3ZunB7v3Tqz3FyKR3sZxtCADk7yHOaIXm+Mq9yzTGLR6tKURCfooq3LTCOWKumvccPki1M+CsWoY1brOqDazm+gAGIO7YuKOdIFWR34lrS51gUqWf4PDGAUJ9VlKmIMFA+s6PDGLZL2OKK0uGhgyXUXW1HSBbQtNY3uaVpRmniiHRAicE4ZHBn78YsSea
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 09:11:47.0002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec27811a-84ff-42c4-caca-08def851bc76
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5505
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_021154_598282_010DA8C7 
X-CRM114-Status: UNSURE (   9.25  )
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

The Ethernet PHY is supplied by 3v3 PMIC regulator, add it to Ethernet
node.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index dd4efbe5a46e8..fb49cd2da2c69 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -137,6 +137,7 @@ &ethernet1 {
 	pinctrl-names = "default", "sleep";
 	phy-handle = <&phy1_eth1>;
 	phy-mode = "rgmii-id";
+	phy-supply = <&scmi_v3v3>;
 	status = "okay";
 
 	mdio {
-- 
2.43.0


