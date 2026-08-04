Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C527C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1+3Xl/LvEsHpsuuIQyCRhwtoW1+jd+HCRIxs4HZPvw=; b=scC+0ir4svu4PdUeqM2NcyRaBY
	q/saQoMnWIiFu+S/qnx8h8DgdNLmgUydGvek72pDARRlvfY4bVsIZa5oNz5HRvHPL5kvoGAZJMShF
	VkpZJW7dfgSJXgitIqeP6KMQj1Mh2CgylfVL+seAIRetkmBUrxOMhuSeEx5sW4ujS9kDHixUAehTE
	xxa6miSrX0NAjnObptGTZljfzC4KT0oGAdS3TItAl/7AW5fTRVw2VV2THRkAI0C7y9Q0aVqsFI11w
	1QQrTnFTCrqjNgcGRcv62J/atoejMJLKr+V977FwYtnlcjvC5NlybOKPloYRg/VrX4x1YNBujoq+r
	LBRfz0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF4z-00000001uLc-0qoK;
	Tue, 04 Aug 2026 13:21:13 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF4x-00000001uKo-1MX5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWeIqlIA4y0W7PhkDIqV9TRnoBgbL9olkD5mMg43rc82GtPkqDZU6MIOW2qDi795hm269RT8AZ580HhNvtl3ghErvnsQxKhiCeCap5Ph5v898oLD5OFLzwEEnAuVZS488QlUfe0Yr8KO/t4LsPPecAS8g208ToMl7CCcDjwdYu3CLMjFcnRXRinM7yUMyVwketnWBbfFsEh55RJ4ZL9FyESPAV4q2xvnoOZDHKgNsHz79Uf/McGPyH8KPu6/QD/T0jWOsqQTL+f59pnfxbsS7jAWhBhzNd3w8xFzZdgA2XqKOdQaCcDdfmwAUFm4GOPsHB9kKhOvX3OIfWNHwQybAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1+3Xl/LvEsHpsuuIQyCRhwtoW1+jd+HCRIxs4HZPvw=;
 b=vBBvXOdbPvL1NcIaDHQuB3hU/rVZJGSuWctxwlahefOpqNr1YS0HFXO+l20VZ/G4dkqZWMffFoHl8hHHZXKktUyYpkeCgVKBcoRNOu90XHErZIKziUWEmSilVHpN4TlfO6OiiMMCEkvcQQ/2Amm4vD+PbkTBVKAzT35dSB5LKfPyei3dCO72a/F7OXxywhi+k8zkUbBAefxSehb0RZQZKGbsafAveNyzvWE7qssdegfVAr0uzYa8vCfNiUckwNKKgHRIGiwJsARTzCenMf6euLGDxjY2X2lQqJABcOPpY5bfJj+S4sdnu/eZI1SQW594v2NgPwv+QBJ+8JWeJdFBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1+3Xl/LvEsHpsuuIQyCRhwtoW1+jd+HCRIxs4HZPvw=;
 b=Bf04mgXUpvJnb5Lr8QHkkV2RZ0nXnSBjnuxdqf0o81ksaMXn7xvdDy0oZTBJjglO6rxYnJuXAQCrTC/76+uMY4tSzsLh4ZYNLS4ULaDQQgFZegmZpDiClAHPAyGTWMswCGAe/gdVIycGMgI+PTMtwkL21UyP9ZyBQJDcs1D08AKc1WmEaXOKjsVAETcd4Rm220i3P0qUcT3JueK2yt00GhDp5I4jiX1qSDDpxXOzh55zdBc6IDiKGZqmpx4EvUVMKpRt1yyEAz7LwrfYh0nQZSMtrM1Q6NzjOMrlN45XkYkcvoBS6Ue4gd4Df9guOa+39IOx16J1Hsor6hpWY+auLQ==
Received: from DB9PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::29) by VI0PR10MB9349.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:2b9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:21:05 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::55) by DB9PR01CA0024.outlook.office365.com
 (2603:10a6:10:1d8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 13:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 4 Aug 2026 13:21:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 4 Aug
 2026 15:25:56 +0200
Received: from localhost (10.48.87.235) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 4 Aug
 2026 15:21:04 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
	<antonio.borneo@foss.st.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] arm64: dts: st: add 3v3 regulator to ethernet on stm32mp257f-dk
Date: Tue, 4 Aug 2026 15:20:50 +0200
Message-ID: <20260804132052.205273-3-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804132052.205273-1-christophe.roullier@foss.st.com>
References: <20260804132052.205273-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.235]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C5:EE_|VI0PR10MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: de734e86-6c9a-450f-4caf-08def22b3cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|10067099003|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AySw0D4H1Bf+9lk9UIAOSlstGklXhsj5RMQobQp+m8A9Nd0uLleRBhl1cdiTyZTuyC0So/+6a7diEOOc7q9gVAio2HXO5iVyNd9MmepmJcuf1niEwGESiyUYoI4qWAua1lNhXXMmkBCnlUsF8wpffU2QlK98BA978td7TIZIb1uSevHVwfosaMx6KQjyqrSvfu4IWAXcmBCO5TBhlhHS6ykgC3VJpadvMW7nMHtDDRVso4Djft/REU9qzjJtoHKq4lP7Fg6/mbfCP4gsvvuIKOGv+Qu06gKQN2HtLddXh6bgXE/h4ENRejIJxPpCIavX20ETnAtmAbThkkeX9JCQcEhVpfLCfGsKc4EABgESpT1E0GVch1qUH/KZW8TY2MdfkPpEi4q0w5mS7KGw3fofSBWht2rjOrpJHPlcq/Q6kvCrT5tf8U4EEBJyOvDxaUZ1mMHX3D/Vkkp5RSmt4Z3OoKKq7b100WjdFyP94Ita7CV5i63V4ak95AOIVZQExRPclCmbmCl4G3jPGxLjUhwTA8JwPassjtUsYQRxAlDHHlnasF9gFmhiKBpczGShu/rrylvAMeOaVMZ4Gya6w3OS2oPAJObGYQobmlpemRj6WY2Y3kv01/m0msx7/wEDPJrYR2X7v2amFjA1T/blxjGJAmTrNIyy9gP3K61Z3YsRD0kTX7IIZOCkHSMHPxXuFNsJDlVzetkkFDU5no1iZAwZ+usuFMicCzhNALWdjnUoy1cxxLYN7/qVB3lEoOR8/hzw
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(10067099003)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WIifp8ucfcBPbGS5eE9PPjy9rs+ZhtjzO0y8lgYha5HRslZY7uje+ycRUqmPihqOuMdD6BJczGmCkB5jorXTLPriis/TcqwV/XtW9yUnR+APqptknngUaca+zAFavOIMMFL/icR9meDrN/S/ba1KFZWFOYZOIaELM4gl2KzeBtI0QaM0/8kMrABXQU9zPHrWysqIpESJjsyGf6UHID+OSiKQEY8WO18xWr2OuuzZjpu9LnFBj/lDxAORl/LdcnmWCezbpb0NyS8wIUNGFQvdkn5uW1KU0Lx/ChmwiO3MFEMxQJbh4Q13UGq+vGkvzhiF9+tqfSimIVNFohm16UNq9IurP40GDIvIiXkY62Aj3MoKHhnZuZJfUcLjMaiQtCRZCGDYIPs2OfiMq4djOq/9qI4/pU4HcC9u7hx78D/XikMvEcgMtXTLdVui8p1zjdf9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:21:04.8467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de734e86-6c9a-450f-4caf-08def22b3cbe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_062111_424820_DC3452C7 
X-CRM114-Status: UNSURE (   9.49  )
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
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 8daf3dfd5133..e98a773448ee 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -144,6 +144,7 @@ &ethernet1 {
 	pinctrl-names = "default", "sleep";
 	phy-handle = <&phy1_eth1>;
 	phy-mode = "rgmii-id";
+	phy-supply = <&scmi_v3v3>;
 	status = "okay";
 
 	mdio {
-- 
2.43.0


