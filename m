Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D78DC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcDUuHIzpA5LChowCsRJya3d7qQYR4H5AYNdkyfZwIU=; b=Z3lqmmM1xhlhyS3gAXYGUss6bb
	xdKg5Xc7ZCKxiuow0YQqvsAm2LL4rZ6GLMxhfK10JgpCNbMcjGl9UZz9OgOi+UmE8ZCE3ePw2Tkg5
	brG08y5ZUaJvwxsRnLGo+Dho/qYRaBDAfHrDSlgD/DH/AsfDtWGAarV697CmvM3RN6Iac0QuMccSJ
	nRyP4d0miCXYcj8Xe2Ok2ldM3zgDMAJ/ynh494aBrMS7+4khEfSlP4HX3YC6CeBcHKp+tn14KcP1V
	lsx+5YNPisl2PTJv6F6GuVTo5q4m0aJpce1SvzxF9fywqd4Snc/D0a3SPIkQcdDZm9YVY2TMq43pv
	uZXMiLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPtN-0000000DV76-37xo;
	Fri, 21 Aug 2026 14:06:45 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPtK-0000000DV5L-2Uz3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y92hcVnMxnRDlyYCo4559A72ylhO1NmJ4FIeEr50+qgRCP/PEncH1xQeY+X/V60ijRABrEhkjHXRItyuJw5sNQe/aYgBQMNzcnR+fXWWiasGuLEmQFb8M3QJEMhiSkHjqRirS4gBltuEDLGIrU87muBfM2dGNMIIhpKG53UWqWlVhtG5Dz3pif49gT3RBb1bqztMmEhAC3bClRDRbpFx6YeaHAMam2Rkt8XjKj5st9vcqbNT7b09SydzOzcxUgKvebSW3bKKocSzz1832TQfoeWi5/aXSFTjbOT3vrVEY9Vh1l1pdunEHjMaPuyeoIoWtNuIy7pZhxci4fFiWC8kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcDUuHIzpA5LChowCsRJya3d7qQYR4H5AYNdkyfZwIU=;
 b=NsNF/V/E2X51zTZAvElSU3G5jwsWeprIUn9+8o8rWR9onDNYfVDWsXPy8CaiSB4lFCDb4q9P4MJt+Hz4Hc0g5fLHkbrTwoM2Jre0ZPsYZ02FmzXZBVKt/DZp8B39FDZAfoSQc50YJe49/j7EHvd6dWyo225xF+nHUjGu7strwQ+9FFZ/2/OxVUEwT+llyYnVQO9P+MZcjDRSLMI1aS25e9R5mtFV7RhcCzUerNuEnH61weMfhWp3zUA7HuGIK8x4egHwXSpr97hjSoldfykvZ+oFzF6OQEvFezohFae7ZYiZypfgkmU23T8R9yiTIDeLnVPf1OHw94XdkYIrSDDWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcDUuHIzpA5LChowCsRJya3d7qQYR4H5AYNdkyfZwIU=;
 b=osnmx+HdljLZ9pW4VOE8tBx5IPKtBBrLNNfu6eLLNq162zLInBOwjDfmOX/PRtkZxn89jsvmEtzTTHQuW7u0J9gqJuSIeLy1/hwsRW2Xvxl8n/y5qesD5AzeTx8V2Qupu6DQqSPRtWzq1P4z6oEkxgXM6NZKKXBJRPDuPhKPzmQw9RSnqgwra7wMIMGLPcTgHRT1hmjPyTzG4fxTWSR+mJaJwZldM3qbPME0YGbH/M9G4PxQqkNACbTSXklhZaSN3ezWA1ekA0VMLGvYMKWCu9XpxLLIc7EJZKUSUni1qHxbopi049AqaZBbAUOcdKbvnOULQolvXrRLPtRpSVRYcw==
Received: from AS4P192CA0026.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::10)
 by PAWPR10MB6757.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:06:35 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::62) by AS4P192CA0026.outlook.office365.com
 (2603:10a6:20b:5e1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 14:06:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:06:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:12:00 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:06:24 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 16:06:11 +0200
Subject: [PATCH 3/3] ARM: dts: stm32: fix vdda supply for onboard hub on
 stm32mp135f-dk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-usb_fixes_vdda-v1-v1-3-0c213062165f@foss.st.com>
References: <20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com>
In-Reply-To: <20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Popescu
	<catalin.popescu@leica-geosystems.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|PAWPR10MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 40522574-e86d-4b75-e3de-08deff8d6948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|7416014|36860700016|376014|1800799024|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: g0OQknNtaKrrmnQRxb981WDQHkzF+f4ZFRiBTelNI/vltNgLRBv2DfDnMO2DyH+Vn6ulCa7ZhWdL7HcSre+NEvDcyUz9JQDTRPNpwMfSQVowLlAN8GFehoFVVOECllJBbh8MyqZ0wqsp95tqyviy/7gWNOYK3MEab4oiK0wZ6jELaP7M+rqVS/Qnrm/hcB8c/NZ28ykcqRfDMSQ9lD/KrnNAagG1N1rQiRtglef4gS18B/ysyaPF63/MgTJkqGNmUeSkgmSvrmlsNKh9IAoH8c2g2PfD38Z0CX1PQdneSW8MRHCZFMv6Y2YdZ58p/Spr0mOaaY4Ui6YrPY/FWJ201URkXvyoy0W8ywFg6n+0L5/K/zIVR7f3aM6EDe0guuNCXvcNv9kmstk4AitBeTOUkYzOd/AXAOjoPq22uUJZ5Wg225mqAjanjzjIsQDjVAOwGtRN3QP5mlyTiJYBrjFk+3m5SSglqjEO4BEx0d2D3rWRADUb66B8vIfa73ZdMahucZybStZ1CHQRJV/36s5gwkofKnybaypIL26IESRjn2DPi1OPnQO5D4y/WILLRAAayvKQPBW09MC0xY+6ooXzmrvp1OJ8w43jL1isj+ht37m1TgdiKzyMwUtb49D5NERVBTkyAe5bYHnMxgVkQj74xFJsM2ZpfPcCQ7hY8ykFYCGF7+o6gPkUMu7TQgNjeX+d7hOAXD2JzYpogC4sgoHtmA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(36860700016)(376014)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9PJ0QQ4cS8SRfyG6Bdv0FDbumiPx9wnxksJfKDEE2cn6XfXRa6zBclLGKdLHDL3mJFSg2F+Y3pJ+V6wagVGQiUB8j7xzpO5Sk1InBsatLU29AQG7F14PACkDNyIRIxNzz4q+ZaxNcx9xFDEdraRgXwBpvr47RB/WKDzWmoCliDj/Rmi7f4WEwVkX1R0gFO+kIVGljh3oKFRCljAd+k9nQ4v9OQ9QCn42CEeCgzboA/Ycy1/cyPdfca38mpj1WMJRVltAq9XcMWMAI6juYlGDhhaUmIPtzz2zzw/DvICMyxHDy73Sf68L+U3vDyqJ+4guCWNADl1VS/lrjXdAfg/ZLQG9T3Z2W/V1yJSJqKmUbbivOMArfIasPxDU8v9SMHpk54RfSwva/nEKBBCOigBpQC3Vz0KFpjASIKBkGEvZlMX91kApf/3bO/iJgbvdIfro
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:06:35.4120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40522574-e86d-4b75-e3de-08deff8d6948
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_070642_883628_582E378D 
X-CRM114-Status: UNSURE (   9.85  )
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

stm32mp135f-dk uses Microchip USB2514 HUB. Since vdda supply has been
added, the regulator framework wrongly associates the 'vdda' supply
dedicated to ADC, so the wrong regulator is referenced.
Only the 3v3 regulator is used to supply both the digital and the analog
part of the HUB.

Fixes: 673655f7944f ("usb: misc: onboard_dev: add vdda support for Microchip USB2514")
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..5528b99ecf50 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -628,6 +628,7 @@ hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
 		vdd-supply = <&scmi_v3v3_sw>;
+		vdda-supply = <&scmi_v3v3_sw>;
 	};
 };
 

-- 
2.43.0


