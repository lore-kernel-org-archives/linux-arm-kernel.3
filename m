Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED2AC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMB3kdudxv8TrcapxFj5B9OBJzTRJDhaP9dPwNZXGIM=; b=n2/Qm5cV01oWrprThnVnalw8Tb
	n7lNJt3jyjuZ3sCu45svCKmfmM34IEab+3i7NDTOfY9Iyp5yy0rv+Rjr7aWjXyVE9vz+aMJTeSkSG
	KRlPy8J0ND8Ttp3lF/cYLvFT54gQOZpPl5HZTENa1t9wzM3aK6ZGgQ/zd71gCRzLtUfsPIEbMz4od
	0yLxGShLt8+owPZYmHa6hvCO7PuK161OUs5+SlsrVeRb8g0pZYVejjkn51A6W7TBAorZ2ng8e/eeC
	jXTjUbMF9D+pDE4Lo1EkmmkC9baK7aOd4mvaK5Dwbia8BzNW48+lEuwra9FTYzxiQKddwdDzO9HDn
	EBxj5xEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEql-0000000Aax7-3VHS;
	Thu, 03 Jul 2025 07:59:19 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEiW-0000000AZ83-0Izq;
	Thu, 03 Jul 2025 07:50:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AU6F3NL9vpssnOMCuPx/J+muyaP9wsvj9Rt9PxzTqq0kDx0AMSvJ9YiUK+i8Lpzrb9SQNP5ELTIwIIhpWhdToNcWJVxJCGow+YTcX/VsiHqXCAaG7+yqW/7syy8DiUI+RGpDIjs0H5d2j7Zlz4bvUkzDrXVTG6QauqQ2yFgGUqDsmVmAMm3/pVp25+Pr14+Id8WI73bKudWUYxM7tM4Ub46xvyWq3EOhA4l6OMCswdgHHhl/hj8KBdfgtreliEge1tmCZTfHqhNiQDBe4xndJICjs5gNw5Kr1RnCoLu5wkK9quITpk2icF1WfI9+WyiqmCApc775593e+zzgqGupQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMB3kdudxv8TrcapxFj5B9OBJzTRJDhaP9dPwNZXGIM=;
 b=lbQ94dKt0fiDYfmkx90vp0R/hsGB2eZtWlPMu36BOqbNr+gn9rS0a08vYZRj1ZTBmphW7T+MWZ1JfZcJF7Z65LpZFMoZeu39tC/TZzj0MNLfGVPH3grpedL4O0nVHadkrEdOKYnzL68QhlxIPEfdk3NscTbdFY1G/sn5vKZcLbf1yhZvxha+/4iA/EhHf5vCOeYPAcb9lzbdV75bGLutnZeek6Yj+mzlsDzeLtwWXfNkoL/FqV9pbg+WPcRENmAu5WMb24NtYHuFs7V/z71jKh3UaCn+G65tz31ljMSIFvpBUnoP/ybWKpQ09uGb4WZ1Rvr8DFuEvOmb4mPkC+ZWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMB3kdudxv8TrcapxFj5B9OBJzTRJDhaP9dPwNZXGIM=;
 b=SD6lFA6X0BSZutK1JVn41q5AinpWOK1afEDjZL1+R6aEyHaCfKjULMqaWQ6FMSg4RW7zY/BJdI36Mrw/0wHGXjhiTT+wQBQXKO2wdCDoApc3Txd9M3JHaKfe75gz1eb5GdFiKu+WjYu7WoaOYZ4KnQMbSqIkW1QCjHQ2UU/O1hs=
Received: from DB7PR05CA0014.eurprd05.prod.outlook.com (2603:10a6:10:36::27)
 by PAXPR06MB7630.eurprd06.prod.outlook.com (2603:10a6:102:159::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 07:50:42 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::1a) by DB7PR05CA0014.outlook.office365.com
 (2603:10a6:10:36::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 07:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 07:50:42 +0000
Received: from AHERNOBLEIH55.lgs-net.com ([10.60.34.120]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 09:50:41 +0200
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH next 3/3] dts: arm64: mediatek: mt8188: fix audio amplifier reset polarity
Date: Thu,  3 Jul 2025 09:50:37 +0200
Message-ID: <20250703075037.2558549-3-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
References: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 07:50:41.0930 (UTC) FILETIME=[2CD306A0:01DBEBEF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|PAXPR06MB7630:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a937b9a1-4793-4cdd-75f5-08ddba064f8c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XyX0V0iOLgDCqFnHPy4Bm660DSjv1CEt7XPd6FtMm8ZFa2nYMsowDZnFwo2A?=
 =?us-ascii?Q?1XviMQkrODxsthqZZbN1WnR585B4JeN2afe1Q5TxMtl2TV/7RxdsM1gYscp4?=
 =?us-ascii?Q?lgSbg52L/Qf351THP0n44nEDSQ5n8XAyRL5Fx2eNOIAFWvvHM1nUXDR6gAgi?=
 =?us-ascii?Q?SDWDu6Of5uKkEkxfi0LzcAUMfvv9zF69EQwRqMmf4e9FpK7YNoEG/hhhe6Fj?=
 =?us-ascii?Q?rHRO1OFNp92f70kLHdYZEYJC5TndvJx58ips1GLWv9cVnJL8TKtE7atNoZ/8?=
 =?us-ascii?Q?9W1fX4LrwTCVBO30UdqwxNg1PcsAOiulQKJ/aCd7EoAbZaQH68sjeljblHAj?=
 =?us-ascii?Q?hlJWI0CUMls2M8zwL6dANmM+e2ubtEa3kOM93o9/xIdtDY1rZdw124QgJ4Bm?=
 =?us-ascii?Q?UOOM0TisdHBC/iw+xf36S8K7sjq/BlaEprSAklNlfcl2kbUnZ3Vp5GPjZ3kY?=
 =?us-ascii?Q?gzw56RUVKRUIinJ0R7jddn00duVzl1lTuWYIkbrcSFjiZc6tceWyECnAaEXw?=
 =?us-ascii?Q?l1vDwACzD+HxV4MyjVp27ny7J9pxrw5M0ZKVzTwcH6JCUB/5AnYS62rimHcr?=
 =?us-ascii?Q?oTuvmXZzbac4gVvz4BjoNxBV5JYTgtQIpvi3GO3zwhbeeekqOkmhjXRGDNMX?=
 =?us-ascii?Q?IbZTMbzqltKJ/Mk9rEHScDNu0S05u9XkqAWVi21NOJFvU4nzCx0Lbkq4yNrZ?=
 =?us-ascii?Q?G2kY+wK5BxgmHWg5ql8p+NSGnLdhbDezfd3UDpNA6iNO0OxaxstMQwDXbQtZ?=
 =?us-ascii?Q?TkRoEdQABH9aSVVrskxZfJWk4ZznMbPoJ1TjBO551IroKhtHANTrpBemOj7n?=
 =?us-ascii?Q?eok6jLCjt+KGQPUohENamwS1yofeT5cOQIA5E8hCH7jqzBf0q/GvGaUS+jBI?=
 =?us-ascii?Q?kWa7Mpen6BlQ7NSRx6e/A9FREj5YhNGIeibJ52eNWzd3XDxGk/TIt3NwF8fY?=
 =?us-ascii?Q?fRyYOvT/iMlMiDFIl41VMEegvl3/L7YirbInhEQcDj1iWlKef5OxKf6k2L3s?=
 =?us-ascii?Q?v1Fwhbd1ylxbAQnf49WdNwaDJz9OMeUWL6nDmDfZ9JwAH5ANf9JwKFqFy+6i?=
 =?us-ascii?Q?gyH8ZEkabyTB0jqAaJNj75aYP/WDdyGvm44II1Fz4ZP2n6mBI2hqzqTJiATL?=
 =?us-ascii?Q?FW3/JIAzXOxW/SKDMIgTTSuAp+ag6krmdIWkvUxfk3KN2uzz1/xq6BzlCgV8?=
 =?us-ascii?Q?d/8rTd3jjOEElVIDAuZRlNofq3yax1pZeh6DwSzGIhTBP/wNyEpO3/NFeabU?=
 =?us-ascii?Q?6PcrFCqQnwhkhLsc6ptELtwJNzDpWDPUiyzWjuX+WnBLzgWu1HuwaQYWoWYZ?=
 =?us-ascii?Q?WlmEMgEEFv2r7Fs6S0IrUKq+4qLsWKSKPGvYeLkRrtJBqoxzpXDVboJKDygN?=
 =?us-ascii?Q?q0NlVJDIgs0BTk/XwqJUcrTpqRgZyEWebT5jX+x7riZ+/c20Q4RYVlg0XIRf?=
 =?us-ascii?Q?3K1eGyr9D5T0PsrBDFbcEzh/nIH4FFo2GOQY73PV79joQ+O8Cf5vuZkwPEe7?=
 =?us-ascii?Q?O6fMeph9hvI1vihxp7ZO4fQQXtCWS82L3VXyHztGet/9oMFgNK22TPFDRQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:50:42.2207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a937b9a1-4793-4cdd-75f5-08ddba064f8c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_005048_120355_6B3247F1 
X-CRM114-Status: GOOD (  11.39  )
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

A few MT8188 boards defines a wrong polarity for the audio amplifier's
(TAS2563/2781) reset gpio. This is due to the driver assuming a wrong
polarity so the devicetrees have to configure a wrong polarity for the
audio amplifier to be working. Now, that the driver has been fixed, we
can configure the correct polarity in the devicetrees.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
index ea953d7e1543..65993d25a3b0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
@@ -21,7 +21,7 @@ &i2c0 {
 	tas2563: amplifier@4f {
 		compatible = "ti,tas2563", "ti,tas2781";
 		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
index bf87201ccf27..303d8cc3af69 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
@@ -33,7 +33,7 @@ es8326: audio-codec@19 {
 	tas2563: amplifier@4f {
 		compatible = "ti,tas2563", "ti,tas2781";
 		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
index 17d7359dfb6a..f54b116eab1a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
@@ -33,7 +33,7 @@ es8326: audio-codec@19 {
 	tas2563: amplifier@4f {
 		compatible = "ti,tas2563", "ti,tas2781";
 		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
index 825015b452d5..36c3b236dcb9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
@@ -21,7 +21,7 @@ &i2c0 {
 	tas2563: amplifier@4f {
 		compatible = "ti,tas2563", "ti,tas2781";
 		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 	};
 };
-- 
2.43.0


