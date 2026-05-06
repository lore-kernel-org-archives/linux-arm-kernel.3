Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B7ECD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW/1TkLYgr5XIE7num5dj3NAKJ9Yh/bWgbju0gAjnHY=; b=cCYr2kxjvS492JUDoRimXRHGWe
	FUk2AUwAVvUGBr9e/msVsrl5x6dDlI1HDV9UddTWHCpPaRD44JQyCdqt8TbcfP3xX6O+Wvh2fxn3R
	cLE0yzf9scqN1881jTvO5kzT4l1AbIMD13DAK3qmUMrJzpJ0fGFrCHXj1jL3Vab3O4L/eqTq8Hla+
	ag2TtMuXACErVBi2vT8qdqAa2TWezgMFDBFV5ZU1RFzQr90IZXt4XRkGFHVK5oEzaSZCsXvuI8/ih
	oyaCKeNrBS02WHwTDU5As9dDGH2RWYXP+gXlMvNisJqYd3Vp8CaMUtBejiMWsDow8WXJaKZKsmgfp
	XyhDjboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcve-000000010Xo-0PVD;
	Wed, 06 May 2026 14:08:46 +0000
Received: from mail-westus3azon11011046.outbound.protection.outlook.com ([40.107.208.46] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcvd-000000010WL-1AEV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4j5mp+bGOIyduhuoCmY739EhoqaE7F/tZZ7TZhyImhCGkTCSKJ38zgrNJs+WrgFWZkGCNw34VV9LB7L5oGXLeOC4LJB8HTR5fXuTC500zj5ZZhNvaw8csiOlWkBEsQkg3SiS2GhuKAC86VT3Qy8urPu51lKd76/p7xbU7mcAd+j7RkqGb8yBI81HIvfM9uu5UulgFFVXNmluAw2n8ibogQ4O4ce3qEux4rwR6M+9MFXuGHSQJJkRAOKKzKznadmpDkIFO6j47PbsalqjJ++O4ocEciBjDbnJbnd8a7Ww5inSemXqE864Hii+TPDTAc5FeD+3HIKzzksRPMYkBKRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW/1TkLYgr5XIE7num5dj3NAKJ9Yh/bWgbju0gAjnHY=;
 b=ngV8vbpKupNBQyu/Y5dLatDrYh1V+rOJ1uz7c34NyCtpoWATvB3D/GxaU0RQZglp8CC9kK6+aDf5PkKlfLBrf4DUtJINGMwdK2WejOEXy0LyOozc9EE50dwXQl4iaSG/Jc7d/v0r7O6dVJ99zWjkEHudMSuJOAooG/Isz017X23xaAvE2khOb07M3uyrulFJUK7TcTMXtQoJnjTPYgcGvjkmyiEgm/vn50RwOP7b88V2eBUrUCjSy5hIUN5aKMn2J72PzAbeuXtWbS1vXXT4ep533xoVoW/Ufd9AW3UE1W6YZ7bavLsQ/B1C6B2lzVDXR3OBx+KaePIYIdU5GWX+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW/1TkLYgr5XIE7num5dj3NAKJ9Yh/bWgbju0gAjnHY=;
 b=VMCmfuP9moyGGGR+buMrRM/ya69/hPgfBz0E2/jnagadmskBK4XpdK+3+y+vF5uAOnUUvPA2Ads10Z0HLUYhBgYqXR4EXQSixGvvWF7a/lwTG7hFa70A6g4LUfwkfn8lx6E98YV31q326dAp0Fo+1sC8L0m16G4vB/Z9wfWTKjU=
Received: from SN7PR04CA0215.namprd04.prod.outlook.com (2603:10b6:806:127::10)
 by PH3PPFBE2296547.namprd10.prod.outlook.com (2603:10b6:518:1::7c4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:08:38 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:127:cafe::41) by SN7PR04CA0215.outlook.office365.com
 (2603:10b6:806:127::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:08:36 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:08:32 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 09:08:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 09:08:32 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWm1221395;
	Wed, 6 May 2026 09:08:25 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 01/13] arm64: dts: ti: k3-am642-hummingboard-t: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:33 +0530
Message-ID: <20260506141040.1368918-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|PH3PPFBE2296547:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aef3cd8-f864-4ae5-74b3-08deab78f71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 2VV00E4IPmJ4rEyYKmyR7xcwqYQ4U/327+XzjYBlgFN2WJnmapcf3hbdFcJTYj2WEWRtVIAaiDS+1kTkSxkDH8Hnzlwtttg5LJmXL9MY+6UNh8QlGQTBmySe/N1zkmYoF+ExhlJt3kTrhrBrvQnp5UjnUWp1jwk78Kej8ENExmdAxcrnlvdKfQp3915ra+y9PmpQTvH0FibkXaaaYIaTql3HSMuNXOZNyUJeHFf9bEn5Zl7Sr/i2B2Bno9kwy+FDB3ZUG53IMDs5qWxxf2/qV6GEb1bWHu1km5tXJHlOTJN/6nXPW78I9phieqZvnFD2vilcehAMy6q6x1RQiajWx6kIxB8nhAC/5w0fdyKGmY5gY8uWMvxl9JESt80AWGxv9ylAB+VnqXOCO4CuCjTg3vpGJ0iXJSEEKbYEKztoGl9Q5YA1Ik0SBW26MPtJufZk1suD0dCA1j9gatkmwpzS5yu8cf0CQBLCHKBkQlIjdyjQZ9BvhMwYYLwxVmibyP9rFBrb/cx0xA9UIx6b72EfClYwYRtvsoobp3ajMOHTlTbTrG+A+RrzDP6+GXiFF9kdMEEHvCPbDpAMiO4axEwUkQcOzGVpF5/7si7tUfSuClxiV6naE6oK/LJXNAdN1x2oV2IEzEPD58kdekSAWxagEiizW94aKUIUHexYALsfGB1S8bRL2/zDWzoW6c6+ev0TPdKrg4o54qAS3OQSn7SUPonXw5pE8YUuaXij7pmvq9UcJenVQvzSRuVTSfzD9D1tWnoQL/L99oqZ6EX/r/Zy1yLQaxkjIOL4vIRK0CI0DW4=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HeCthE1K3VvV4m7voowzGQsI+IJoIlD2tyJvdrWCPa0fc3RLE4BELDCQ5LBkbzwlJ8URYlzyIG/4MegG7BCYMp0r1zkQt4xMOeAlTHr/WIfED2MhkTG6OLVoIY06oeD8f+9wTejlbH99PD+2fp4QxZFbKQk/4S1icCrQq9CXN16VbI2/SH7VPnozscD1uZhZcKjoE6Vjy+9hPoobAX9gJy0/e4HOC+e8caIJO3mt9mJ5ESDkWHWEbx888vVSPWO0flpI17PWuUwWDYeZxPfqtc+qDhsqFopC3IZ0twhcas42ChYjKzyO+z8jwLy4nAXswQvU478D3hK9lLyiJId/lGQwDoulIsVuzh7cuoxmwnnKsx8ESId/vzSMxMdSkZoYGWbL9hphs99vDFwjVec7TPZo1AZZU4WjxyeBxgj8iW2vDJQzuR8THcO2HMr3QgRt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:08:36.2839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aef3cd8-f864-4ae5-74b3-08deab78f71e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFBE2296547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070845_323629_8CD29B49 
X-CRM114-Status: GOOD (  10.40  )
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

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: e2b691804319 ("arm64: dts: ti: k3-am642-hummingboard-t: Convert overlay to board dts")
Fixes: bbef42084cc1 ("arm64: dts: ti: hummingboard-t: add overlays for m.2 pci-e and usb-3")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Acked-by: Josua Mayer <josua@solid-run.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-2-s-vadapalli@ti.com/
Changes since v1:
- Collected Acked-by tag.

 arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
index ee9bd618f370..90a158531f60 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
@@ -15,6 +15,14 @@ / {
 	model = "SolidRun AM642 HummingBoard-T with USB-3.1 Gen 1";
 };
 
+&serdes_wiz0 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
+};
+
 &serdes0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -23,6 +31,7 @@ serdes0_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		#phy-cells = <0>;
 		resets = <&serdes_wiz0 1>;
 	};
-- 
2.51.1


