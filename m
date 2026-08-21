Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D815DC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AE51F/S9XDD2b65sYa2P5KOJm0k5jmvVqjN9+i/AyM=; b=cRqU8JcqPUsL6JiTZioh4G1Dbv
	f7mgtabyRIbC7ZO4FzHwcoAEotNysrqmENtM8GDGNJtOJA3EL/psOGrMlYmDHCBnYzlzU+HN8Nvug
	8IsvZ4x+INhZTWT/Q7GJXKWomhTfMvHSijJHqpH+QXL+WJmF3Ux0I/so9+eoLSwj5VheDIzhrCJRB
	sr04otfw+m+cCAOTC8L2R7XmD84UjYkbv5w/W+rgzokKqvh4Q1lTO65oNNniL0aif8T0PNKwGRTN7
	7FQ5nUODDVtv9hz4P2SrlFDxFA3aZI5y9uBgMUd5K9sz1L5+QGXBFFRbEdqOOjoZUW69xS/nCqo/q
	n9WVt8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQgr-0000000DbXP-13mc;
	Fri, 21 Aug 2026 14:57:53 +0000
Received: from mail-northeuropeazon11011017.outbound.protection.outlook.com ([52.101.65.17] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQgo-0000000DbVW-3lHu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:57:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucdClTE/oG8As4CuKwXfHGEC3wEPRrEOL+byiXe3cUqXeJOu1XLmytTOz8dKNV/pSwLZk2sd9vFoUu/M7NL6neE4znfF4j07UWYI/iGUjm5xpoSufQRTFek00gpairJOdIulbzJZvdDlg3Rwc40FLEvTMkpp1B22t+us7OBuH9lYbg7afcLTTAMohgcAn6QLn7cld0lfn4KlJd9MQw1RYkl1lfG6EbDNhb7tmmJWjyQleZJZj6Orw2EWkDx384P9alN5spZUprlKTJoi+RMl9NSLU4Yk7drCTZT+chx3fL3onZIilAnzsEh3n0XNqz1Rc8ZvPiJ+GMTwm+VJxJY0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AE51F/S9XDD2b65sYa2P5KOJm0k5jmvVqjN9+i/AyM=;
 b=bgvRCLy98jHj7KKtgLsI6O2oMYIhCHQFpNSK5H4Cy2FtTHPjBjg83Of1LG9jwhtL7NZZ0fVXuVwkpOVUsmwdeEl8a557BfRTioUSMaoS0aSsqSrB6MbR5soYIppkDxWsgwZ4i/O01poYgKSn5MqtuBSvNx66jH6CUm48Jh1BFa8fqFU2Sj4lWTqsKjb120IjvCKEdWylO2eZ0Jdz8o5HlKXbhnyQ+LdUm2n+larbRfDEV3f0lcmtC9EMnTQiv8nm4Nt/t0QYB0l935Ffu0cKi9dfqtiOIIUitH6sbWx64giCvWrLizunmGvLWhIEPyHEbViT7qfdhneGdeyCATpC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AE51F/S9XDD2b65sYa2P5KOJm0k5jmvVqjN9+i/AyM=;
 b=dg1P12DKIQ2gO7fuO1Oz1Z2OzkdkSOJDjSsMxp5j1X3Bdabc9scvpHVPH9u4+ujJYLAeZSe23wyZ+5yZ25xB7nA6gbVUOTgCK4FiSGyEzDtkwf43lC+ONtmWDD/FRSN6A64xDHDmFz8yVyxavDXCabuVQMck4BxuOX/uLzhUyY2/+Gc2WUwpm5DTi+/Z+cPTFyDRItzkbfUmxRJdeNfkRMoiTk9zcRgTdcQ13EG/mzw3UkgTVShioSDFctabUsL3L598yBVrztHo6rK97tl4KzbFBjR59mqa/ha5YK1UAB/INpstsJCuS+UfDWFOam4MvO4ekSsR9WICCQ5FpzUT0w==
Received: from AS4P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::10)
 by DB9PR10MB5641.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:57:43 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::17) by AS4P189CA0006.outlook.office365.com
 (2603:10a6:20b:5d7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 14:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:57:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 17:02:42 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:57:42 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 16:57:38 +0200
Subject: [PATCH v2 1/3] ARM: dts: stm32: fix vdda supply for onboard hub on
 stm32mp15 DK boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-usb_fixes_vdda-v1-v2-1-23cc919b59fb@foss.st.com>
References: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
In-Reply-To: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|DB9PR10MB5641:EE_
X-MS-Office365-Filtering-Correlation-Id: 7062c3ca-d683-4936-7969-08deff948db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: Zj0hO9jEHusa1qND+49WGnDCTZck0I8wh9Q3eWsKPlG6t0tpg0vkcqh+jiLHBb4ndXhFxt95dzPJiRVsphMbdWxsn8wgHrMouCZiG5fy0I8Y8zgxaU+glpKzwkSwFDhHXl5rJ1CeAdjtNPhevTVi0+RPZCMx+xS759ZZxkrw5DAU4U1XoI4xyA2qSpxk+/GMlpCssXdKmtMcBhVPkoBxwszh86kTkU+f3/xb8G4dT+k3VKnyvHyeGxQacGLu2PoaXsVjPy5EhvqmdkRn3KBrJV/T1S1AZCCxRq14vyeU8K+IKqGQSilfSBV2eWKAtXtNXK1a2S0ZJ6DCGy7a4VVPZCQ3LsPDZsvgp3Qzx55xiOpgHoQV7tEB9iDIhaVXqwgDP3+vgVgIm2mwktQ6Dwznulkb1s36EW8065aNT4d7XpW46UjHd70xOwKoECOshf1o7FC/YvuQARXks0aMHSocD+o9kECLgPboma1PrEmU3sux02rnFyZN8/RDWbsQgxss9jy1McsUGqd63y5y9uqGL2L9098yrO9k9IMz1CJOuZmJ/swDck6USsJEyOUslAp2xNJCka+gW29gWF1Lwuk87NkzUiB7hdPP7WB6ao225DeFRDWjsbv+vCPpaB+yPC9xWwl4zCNGlRydvGzfx9t9N+2au1e8dFPmeHJNpdtKoo5vFaRnLRMGQnEF9klfUssU4Nuyz3t6NIpLdgwu2gmX/g==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EoMFTRSC4E5ilTLuIP6Etrw/a6MnUw6u2VR+rPmdUM8wvALQCQLiVqE0ud9EgfLo0yKNBlmbUkgfsjmJuOg2JuSvNntYaYZxb0AT+MNPfdTlXOxu6Dq4vH+EMUxwbJGkduINkW08VA5UoHulDJhXzK30GMaV2kiP36CrQvBuzEeIMlCl//m26Zl9dcvvY823a8yT69ZwpQxTtITSROX0cz48TBpcG5BcgdNQ0pjoycwB9ba+yn54t2FxpFuzt5A1w2aCCtr6HlO5yDaQXl+w3LMGZruIyh0aYLYff/mglSAcbKo0HeV4uyA11T8RXvubY80HvO0TlgbAlsEXlxClKRnn6cYerls4y7svbtaJNqtNUOR+H3zoy8v3eeVhV2p3X6cgf0/7rIp+7C1SXU8kovktmVUX/BGD5GrlhGeaEnd9lo+/JhEXdn8iIhBFyane
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:57:42.9903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7062c3ca-d683-4936-7969-08deff948db7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_075750_943332_B86585FB 
X-CRM114-Status: GOOD (  10.97  )
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

stm32mp15 DK boards use Microchip USB2514 HUB. Since vdda supply has been
added, the regulator framework wrongly associates the 'vdda' supply
dedicated to ADC, so the wrong regulator is referenced.
Only the 3v3 regulator is used to supply both the digital and the analog
part of the HUB.

Fixes: 673655f7944f ("usb: misc: onboard_dev: add vdda support for Microchip USB2514")
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- Overwrite vdda-supply in stm32mp157f-dk2-scmi, as pointed by Sashiko
---
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi | 1 +
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
index 89de85a2eff3..172347769e02 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
@@ -180,6 +180,7 @@ &sdmmc3 {
 &usbh_ehci {
 	hub@1 {
 		vdd-supply = <&scmi_v3v3>;
+		vdda-supply = <&scmi_v3v3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 599ea07bdb19..01ac3d7d6d0e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -764,6 +764,7 @@ hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
 		vdd-supply = <&v3v3>;
+		vdda-supply = <&v3v3>;
 	};
 };
 

-- 
2.43.0


