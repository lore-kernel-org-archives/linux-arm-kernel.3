Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F370ECA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMSORSmtqvmnnn1Q4Fxg50fGXDrULgei+dRWnF+vMqk=; b=kw/l75YC6CM5EkkKfotquv2S0F
	Ywdm8gCuGkLUwzAS/1tFpI/zcEl3zw49JZcfFgDPZqRne8XsjJCIth6JppRkMIKahG+I4ZCU3fMAk
	IIwF/U1PvfWWgnue+MOQ8szQF6E29jOhfcYmh/RdMoBvhYa/BXBagaqhwJ7nKuKcXjR89SglkxNdY
	3qFs8UYy+AC6AC2Qd77SZk8YrPaXhwDWn6c6rokU5ZckxGHmomcdcQTBmY3IsOc1bpu0lzlKs5zGA
	bhr3uxdoW5Z7crWvZ4LfxeSVMFwTxjgYrPVuhyhOA7/p+bi8F+dIu6mEM+hc3VrYZixMJond8Bbwb
	BAFO5SWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBK0m-00000001mZD-2a1M;
	Mon, 28 Sep 2026 22:39:52 +0000
Received: from mail-northeuropeazon11010046.outbound.protection.outlook.com ([52.101.84.46] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzc-00000001lfo-0kc4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrFiAz9FFmcUSDVDjE5Pa4MNg+12b7nTmvfjTjoMphXMKOtrAZU59vlLveM/Rkq4d1OYTGllyrjcA7DqRWvrXb/7Rawlm9H4KgN0ZtA84K1A1K+vbTp2rBnl3JCrpqm0Vs7/1nsfTITpfr6KxbnkYDyz+lwJYsGxpsB6EG5YH/8A8LmpFIftOEh5wH4R+p5rCns/I8aFFFAS5ZUASnKEteJsG746tOdmTcM5PN9Gz0UYnv0sHH1Te9PF1Ejnb4rz0Oo+7yjggFzDW8GPaPcEet0UrwbseudgaHJZWI+ZdMTv3Ay7QvVjRP0MSHT+AfXTflfIDrLNmW5QKP6Ei7BU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMSORSmtqvmnnn1Q4Fxg50fGXDrULgei+dRWnF+vMqk=;
 b=TL8SrON8HHB3/beNpom+iqqLZcC2XTaRWTMTKq727oY8wt/I2s+lGVr7f2IzWycny6weh/iyanImLdjdqRQJf4BLr90ouU3uy4xSEtMm4LQGvFfpKigkv2B9oBglvNX0pCQTmEv4hwxFd4PvcRSDka/AzdCoEUHSmYuES2Lxnz4B2BPOCASNJqEAFq5e828DhE1/Gi85K1iu6/lYCmvxpmBuzITIfuAyvdYvAuzBteKbdTAKL77jYh9Z92uzzRaZISgCEgQHScS7wXPusdyhSqq8kGfI1+1+yEUuBbb9zjmB1XibrcVutTWKFjreNHkhmUc8MrjbHAybDV0XbF2OlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMSORSmtqvmnnn1Q4Fxg50fGXDrULgei+dRWnF+vMqk=;
 b=HMB0AIIR5PuWCttsY3zhDMwoadcNiTIBgmpf9ohV9njk4uOQSwPbJOOcPzGb/UB7WTVBGf0H7QZkoYH9jup1MtqkwGTvKOniU3TStgcoO5XMfGE5N0SDEDFY5ElMrpA24gaJ+oXOaqcEwP5o1Ue5lFpDGOcLlcX559Tdw6QiHI0=
Received: from DU2PR04CA0353.eurprd04.prod.outlook.com (2603:10a6:10:2b4::13)
 by DB9PR02MB9969.eurprd02.prod.outlook.com (2603:10a6:10:45c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:36 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::57) by DU2PR04CA0353.outlook.office365.com
 (2603:10a6:10:2b4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:35 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:25 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 13/16] arm64: dts: exynosautov920: Add missing space in
 compatible
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <e55caed5ef7d902b9e1f0635ad704c61a6dbb7cc.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:24 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|DB9PR02MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d280d6-4793-495d-e03c-08df1db13bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|30052699003|36860700016|1800799024|376014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CrJb54bOIORbAvl+K0+een8mQuHXGgCT1dYtXgeULRNu8RB/+a+zvgyau0z2vrgNX1Rl71m+K2cH9VE3dli2L/2Kl3xZ0E8L5UfwmohygFfHfUmQk4ySev4drMo+U3HxapA6lYOMfQ7J2noRVnz+emDG9eGWZD+NIvEhT0jeDNQUidUxnV6GMmLJY3CHFMwH7RBvH5biZlQYZdPOuHd4HB8Vc0Sofwa1NCF1JCqqXzvupc0os+pCNUTEGJ5/9FRbu7d87MBYnQn83ex6OBcXxXuP0LnfO8IMITJMOGN7MFrhfFFFS3Oix//b/yeM6p+D3U9yJItAHvyJ+gMwk1OaGztlT2+vpssZ8AVjB9oo9X24jfkaaP3gVoDkJeRh2esGAqwhXWCoL0HF/7lWYC5htqEKbzzyoSJq87VJgyVQdBUsLK3QJHKsgxgtym2VHSisl8OtHLy1SciDgkqPCKrlonXVR8X4Ij1P8GdVzT1UdmRu29ayH0KyjoLTYU/7fKi8z52sCfXrg4eLU4yNVNmff5Jz5oPXsxaJhgzmRKRwoGA0y2VYOoKjNAb2zTs09/mCvE8d9jwpq4JM3+oV0Qw8hzrBv+rt1Zxx4n9J8ZWJl5S0mlZSYnzNbBGuMc+ixKR7kQvPVglifJcUPGI5cjlBY/OIU1e6w3g8mtUOvpiMwvfxbFpj+2bk9iUjb7p0p+u5eTvkQ6EhCj6haFP7iYDCMw==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(36860700016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zfgXRQUAhQ8ci3cU1TBsh56QmSGYWdtpBKHvW2rNHtYy7S9kU2zCvkbUKR2Fv2Y5xTYpQ5gr9H6zZh/6XgeKaWdfWJsa+zQBtbxh/aniyLdv/lVMFRQLrcyFZNfOMdSJijG1b/IiP3lpTzy5n493BWWyVvKCwfrxaXtvi4v+JdScPEXKPAtf4qtF8WypGsokxf/6QWu8pvhEnWMZtTrywXuwZxHo/noMIK54Lum+mi5ZLNnOL/XdvvdeQfRKUQpTvnPt69jQso4JoT3hHoBmYOKlC7LsJcv9TRCJkAg+SDTV+eVkKwknHTonvr6cejGo/7yDt7wMmxBo5Ztvx4g2Hr3H7Xi6iM+vXY4c4qVyJICfxqTG0MVwtIp4j5FYBMUR/EyJCieeEjL2iTISu9cO9vFxGZeOMWvV5cqwmGpovyaZ2aDjc2nxR8kA1c5qrYUN
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:35.6563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d280d6-4793-495d-e03c-08df1db13bb7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153840_221279_746836F0 
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

Tabs should be a space between multiple property data. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index d2b694a7e6f9d..ba02fc28e42eb 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1429,7 +1429,7 @@ wakeup-interrupt-controller {
 
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynosautov920-pmu",
-				     "samsung,exynos7-pmu","syscon";
+				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
 		};
 
-- 
2.43.0


