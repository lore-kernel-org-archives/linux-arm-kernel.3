Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B359C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 07:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REDZOq5F+1bmqH3IXzBHu3LL6du7WZMuPArozR2ENfc=; b=xxja9bsCz6JuE3djCe6tLoHzPf
	H/w/hsBjFQLKXOsSV/wDiVB5S2Fq3EoSuf3Qmq9rdTf74sHn4rp+vAZoITo66fc13tTAtYLYzPAMm
	KGfuaC+EAuE9RRzKUFx3KPNNN7TUOQMRwg1TdXEG9zY1FDUQ9liaGlHW/Hx391AiNkeuX8w9+0CF5
	mpqpNd2w+FsSxhode5rEaEnH1COk0QG90nszRO9bUFtQ/2yVFAD8djdV2z53U5rk/9g3aqKOxc0WG
	gmcGDYYHDgwWJdyqP0Ht01W6cuUWsc81i+Cgv19ORvBnrhKQH1SVVC+mlLrLUgo8AC2+PEsJ8SxWW
	dGEz8U+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEm8-0000000AZoQ-1Ogy;
	Thu, 03 Jul 2025 07:54:32 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEiU-0000000AZ7p-2dTW;
	Thu, 03 Jul 2025 07:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcuWD9J9HldRFv0sGSCoQRLsZmwZTZ7uZpzweSm7Ohb6hIOYaXwVhhz9Hkv7IGXFQWQswksftw9ECNeISe5Bu3ftYefuLu9ZTxwVwcINdnAsBuJbU0jfZzIKeMtHozK+BZ73ZoUIY0ODE2FJEGE2kFsvxDZ955gddQbE+pBOfQ3rmlmGy+qwVYY/sf1QabtPfF+k05rMl8udNPb7yLUca0oHbcw0tNttkw/kN8p1lBlX3KK+lq0PLvORyyw/PctEZO9TF9OEDzITp1+SgDT/vxpdv9HeuKudwqK+FFlG7pevnKq8bclaCqCNfjsPa+DPasp0CRrXx9EetaI186w2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REDZOq5F+1bmqH3IXzBHu3LL6du7WZMuPArozR2ENfc=;
 b=IKU+dd57OZKppXWs7seb4l+kDpcBZxVzxOu/oqYnqsELjcMJllFN/WSsJljsEiKLNdTQPRUmoG3am+tYUPTnBBlpOmcR8wOH5J1ma9lXtTWchfdqn0EjgG65uiRzVu5hZZ0feRNEbswmXkk9i7ZoW7024fGDTYpWG8wu8E3cND5wc59ko2/+2b37aBwPdoHCEM7BRPgbYFTUSeQggrMMcAg458t9NmwCXBdML/y8x21QCAgSiifSrwsBZioAEFiKB6LfYRbaHIayslOVxohH5lSSTD504DtAXtNmMsCzAH3MpmbLkXwBKYfcV6BNwy9hd/nJFQECh2AfO07DhIUU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REDZOq5F+1bmqH3IXzBHu3LL6du7WZMuPArozR2ENfc=;
 b=UUormHln8tfe34r0NRv1Lh9ur/hUOcqVxZtPV64GgKmgR8y6RzscUWlbyzuyOnVH8MIo//GhxzITj3lV0iASk7hTzZJYz4kVKnOEDf02Ob6tBpdc1jCoXgzCAFfaJxlY0NqTU+G9b0BGHmpoerZdNMKLHjvbiGZ9cfOqYy+161I=
Received: from DB7PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:10:36::21)
 by AM9PR06MB7346.eurprd06.prod.outlook.com (2603:10a6:20b:2ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 07:50:42 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::8e) by DB7PR05CA0008.outlook.office365.com
 (2603:10a6:10:36::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 07:50:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 07:50:41 +0000
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
Subject: [PATCH next 2/3] ASoC: tas2781: fix reset-gpio polarity
Date: Thu,  3 Jul 2025 09:50:36 +0200
Message-ID: <20250703075037.2558549-2-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
References: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 07:50:41.0368 (UTC) FILETIME=[2C7D4580:01DBEBEF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|AM9PR06MB7346:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3024e7c-61d1-4071-c4a7-08ddba064f3d
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IVlLnnk9DSjt7SGM0UuK2FYW4mJgDcAZjVAfyH5y2t5vKt2cUNdw8clSFLx9?=
 =?us-ascii?Q?7xbjawG/WVWvvO9UdBEL/YuntT3ET0cbB6IUAmkqzcbbsMc3kuN+5KIcatpb?=
 =?us-ascii?Q?6qWw4KKEA2+L8ueyC3b+Nj2+gB5EsKX/6gfb5rBM3ZYCAxr5SxgM2MpnjPxc?=
 =?us-ascii?Q?p5lzfs2RPRBZdd6rfb1rJv/b83iGBsuLo0K0avJXD6XPPMC078hLEjdr5f4J?=
 =?us-ascii?Q?J0zaCAa6PEWZv6sBjsnNpMQVNWdDpKG4T6f+AqZGfoGAII0j3KZMpAMqx0sH?=
 =?us-ascii?Q?JM6en6OBLvr/LUDFZ7drey2v2nlhyUw5zYnLnVI+AZwMGjGc4Q6XZHvHV6KS?=
 =?us-ascii?Q?iZaFor7pM07lJ1jdWzdl3b77X1SGFjqjtkHuBVhH9+HfcKK2vL0SdPGvf1If?=
 =?us-ascii?Q?ayOkdcUL3w3IeY9/rDvMWEYSNhz4IyuCM2Qwfoa/z64XIZlymVo6htdyFHn7?=
 =?us-ascii?Q?VPAfTxmSiN3CqBy4ketH7bU8IGvM0LdX2ulNf8GofboebA4akDHhALinZ8Zz?=
 =?us-ascii?Q?c2JwX+ZCsF/G+Q/eLpGVPWpXHIs9ZZQl05oGO8kaYt7CCuwDgHDpTR1CeIKL?=
 =?us-ascii?Q?aXXMi0vlnS+VnXVTG0fNIMhekYUiWXQKHXaBW4DIPbYTdmHhwidSMU120dM+?=
 =?us-ascii?Q?dehkLAvShi3D3ibUSY3LjHs+cTElZUpcDZ2uVSPsCAZQ7S8HigfK89/MpsZX?=
 =?us-ascii?Q?gkeax0JENC5dknGMsdc2p5PV1bhPzO+5aoAmVM2p1FjpqPq4DFCmG8FPBg3C?=
 =?us-ascii?Q?8nL4nlrNDCQ1+6+5Q9FnFV7a3FNtiJtM6ciLtnvz3PXew7TjNSGc7gRVTngs?=
 =?us-ascii?Q?OU4dLKNTRsT05BmKzAwyHhmGtEcyrbiBepUwivATSKvfoY4Wnv1AtsCwZGGE?=
 =?us-ascii?Q?4jwAehKQGpWilKFuMQqo43QsrD2Aq6xY5jdi1yqeJdOAfNZVi1bUy0o3HFd0?=
 =?us-ascii?Q?glVUKyCumvnat3//9hzbPkxfrEvfMsQ3aUYZW84gMgJZ85DrVjCot+nsPzOG?=
 =?us-ascii?Q?xPhUoqpvCnD2PXRSYEiVRbayTc6lk9irhdlROJrsODGEegLUU2IVH9ee7uNm?=
 =?us-ascii?Q?UF/VfqssalgjnILt2MAnu6SjiRB+fHBWHt/BcoRLMn9NaSB40FLGefgwubJ8?=
 =?us-ascii?Q?5KmnqOR2JUVSfLB+7iI6MkI6mzXmbqXhsT0/6Sx1b/+dAg9z1W0m3AIil6GL?=
 =?us-ascii?Q?cOAJRsOTFpjIiN5z9PDAXkCo9rAAnyAaj7AlvHCLzJWm7g9mV27Vd7es3TdT?=
 =?us-ascii?Q?3RNn5roDd5noBKiXj0TA7bAdILaQqTd/u1fdb4gy8ggn9wuo6W3HpCy2Ckso?=
 =?us-ascii?Q?hTNzPJid1+j6Mz6W9X9IK9s8EBpyvhH+NbjbpwLra3wnIL3eecxORNyC8GUn?=
 =?us-ascii?Q?brkLI4v21y2teLiU5D1bTIWZas78e5kiK93zGCUqTFh7UTbtOCsT3ZIyxQX1?=
 =?us-ascii?Q?Hlp8oq7tKL1kqxeyZKU8H4gcyEWEs2gYKPp0ykffegHj30AOhQO0WWw3dGVn?=
 =?us-ascii?Q?XKhApWifZQzrAtnaL5ag3bYoPm67DdDpH7sOoI8Nb3LqqNFqHRnKKkeqyQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:50:41.7097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3024e7c-61d1-4071-c4a7-08ddba064f3d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_005046_868238_7E001D3F 
X-CRM114-Status: GOOD (  13.04  )
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

Both TAS2563 & TAS2781 have an active low reset, yet the driver assumes
an active high reset. Hence, in order to get the chip out of reset we
need to lie to the devicetree about the reset polarity. The patch fixes
the driver so it could work no matter the polarity and leaves it to the
devicetree to define the correct polarity.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 sound/soc/codecs/tas2781-comlib-i2c.c | 4 ++--
 sound/soc/codecs/tas2781-i2c.c        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index c078bb0a8437..2553af086637 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -313,9 +313,9 @@ void tasdevice_reset(struct tasdevice_priv *tas_dev)
 	int ret, i;
 
 	if (tas_dev->reset) {
-		gpiod_set_value_cansleep(tas_dev->reset, 0);
-		usleep_range(500, 1000);
 		gpiod_set_value_cansleep(tas_dev->reset, 1);
+		usleep_range(500, 1000);
+		gpiod_set_value_cansleep(tas_dev->reset, 0);
 	} else {
 		for (i = 0; i < tas_dev->ndev; i++) {
 			ret = tasdevice_dev_write(tas_dev, i,
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9f4d965a1335..b7202b000247 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1895,7 +1895,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 		tas_priv->tasdevice[i].dev_addr = dev_addrs[i];
 
 	tas_priv->reset = devm_gpiod_get_optional(&client->dev,
-			"reset", GPIOD_OUT_HIGH);
+			"reset", GPIOD_OUT_LOW);
 	if (IS_ERR(tas_priv->reset))
 		dev_err(tas_priv->dev, "%s Can't get reset GPIO\n",
 			__func__);
-- 
2.43.0


