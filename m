Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F047C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 07:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X24t4osH+dEeMhOfnmwZ9P5zSUo/8nicJQuTiNuriIY=; b=hw1zjYhkHfTmUeNluJzneZFu3n
	jOmA+R1GdNjKm/hRdzMt0dNUVKuHvLlhuoChySq7EbylBdoEcTHrDjU9RyXfRP5my9EM7S4HEI174
	PbeA6BC4berluiDtCEh4JKcZ2GDFELweb4nF+l8vNVojDnGIZiUmpBHu173FxlZdrevdXU5fW+xQn
	lcjDJ5OehKfPPBf5KHtamuVvf+KNUhsJ6sIJainnrfqCMbk6zYsrUu20ZOVCzpdx0tOjlriM0COkP
	nE+ydTEf6LZziFqMp83DSPl97gxn4BiF6DJA9Qns68VmfTMZNuz2+2yj3c+RCxpyp5wno4h0ElYsz
	N6XyD6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEoS-0000000AaLv-0Z4u;
	Thu, 03 Jul 2025 07:56:56 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEiV-0000000AZ7r-07nW;
	Thu, 03 Jul 2025 07:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVSwIGQrAap1FuUD6e9vZ2aAvZmFO1WJeYpPbSHlfCxTZxThLM1uQIRpXE2/Sm3vKZJ7HDfJKr9AQSCoN2xa2JksjkGtLgl4BhEcgFzzn1pHyz+4PDj16/r/rDSN+DcRd3yJ+wLFDX/BZ5L9niBlfNCO8vCv5kW78nQJm7TSWewe1mQqMBsSlhItvZrviNZZZes1M3JyEVK1BOkxCYqnYd3u6/f9HazxKZES9D/jWktAuxDKQDvoDjsjUwW/Ckas7MfPz9fviyFbARs7Yk2byECP334ulGOJKrZU7u6FzpLSHMIG934zRNOw1Mgy6yYB0TwtVws0wmN9ZxO0TxUlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X24t4osH+dEeMhOfnmwZ9P5zSUo/8nicJQuTiNuriIY=;
 b=two8H55W/c2I/cWfuuzHd735jsLlNBDUnZnVGqAbSZfheM4dRnvb45g9KU9ylKVDMeirewtrZ8QoeU6q//fAIVs3uNlDZFns+IrzNgBlhOhzBHLu/z3f8G0p4ZgIlF6bXdbWcPo7xxl+Jk2CfSOu8d5LvCongJq/GjnhKu+bwB2wCx3sJX48unEZcrJ47Ehx/ONY+5SmH3fMWwU48WN/mu9UZORXkctuUfdTUIQnK+Ei1HHyIoL+S9CzsaAkepAs5gF1t/jXEVL+wVc/SukYVscpITVG2ZcNhJ1qgISkE4KSBm3YmWeGt00cgh1J5toOKyCK4/0kpHgzosWM3qCpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X24t4osH+dEeMhOfnmwZ9P5zSUo/8nicJQuTiNuriIY=;
 b=rbBmtH0cSCZrBbW1GdKlstGdWzUTlrFnIZ//MHy8FLAe/WFZMT30GydFR4ImvYEzAq5g5vDeeohrgG6QWZwU6IGtB+dyedtR1qJB0V7wFSoAMlxV/nj9YzPT9aF02rZjaV9gkxt+/o7omvcagwEv4bUNKfaWIMyP0cSkb0O8yEg=
Received: from DB7PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:10:36::40)
 by GVXPR06MB8825.eurprd06.prod.outlook.com (2603:10a6:150:121::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 07:50:41 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::85) by DB7PR05CA0027.outlook.office365.com
 (2603:10a6:10:36::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
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
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 07:50:40 +0000
Received: from AHERNOBLEIH55.lgs-net.com ([10.60.34.120]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 09:50:40 +0200
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
Subject: [PATCH next 1/3] ASoC: dt-bindings: tas2781: fix reset polarity
Date: Thu,  3 Jul 2025 09:50:35 +0200
Message-ID: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 07:50:40.0680 (UTC) FILETIME=[2C144A80:01DBEBEF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|GVXPR06MB8825:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4fe132f6-52ff-4bf7-b6c2-08ddba064ecd
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0adnAZTndfRCtE2bTdkqq5R4bY6GE4Diwtw7yiomWwM299TcWROO18cPqtwN?=
 =?us-ascii?Q?WNpn2ihLcFWGMYuY21PstEtlbHGpyVlpVkdJCCXHHnNHbb8J0Tdfe0g1xL/h?=
 =?us-ascii?Q?w8Lu8EVoBUCXxwMM9GEWps8tJJ3MEhmNc3Mou3uAu89V15ytdGk4Oc4pvH9/?=
 =?us-ascii?Q?FRzL0L64TEmX3IjUUGN/cl9EPglwbL/xRqGmy8VO7ZewL5lT1VLiLSzf5amj?=
 =?us-ascii?Q?RWm5116wdjEQswMYaR0R+jom3qhpKdcDxY1lgm2LZ8TFaCK4bHV4q0I/QynE?=
 =?us-ascii?Q?c7Kg9aW/p3Z1yksFkuJdhD9+m5emM+6hapQyd9VbfVJGom48pRDtwk0sb2zS?=
 =?us-ascii?Q?xZ09YUvvx+X01UoTyod6Z8uBtKpxXOPNHi1TzWJfIdn7X5Iw9SE78oB1e4Gl?=
 =?us-ascii?Q?tvfCVDHSmyzy721wm8VvZ4AUGp0DTQ2JoSr3kV1m6Q+TyaukXkrv4PRJnHCU?=
 =?us-ascii?Q?W+NuA0I0PoWHgFILxJEEJNkjaPKJ8traeWVLGfikO/iWT/PDVBeRSbx//dMo?=
 =?us-ascii?Q?IKBm108bzfQzYMsCFBZlCyAND3q3N0IK2uwKwrXWtFVOaxnn2d1LLRPAqpQ2?=
 =?us-ascii?Q?qQ0a6jIhSxKB3NSmHV4NOIFrvpIi2BDDOFh5G8vGKP0u8ho6hWrRzu3Vauu+?=
 =?us-ascii?Q?tLb/lCtMycSjrFV9WaanhjJrr5hXQvJM84/ObkDYvbbSq+CGQEbRT4qR87sR?=
 =?us-ascii?Q?CmSoO0VVfG+MRLu9aQ9RY7e/T4T0Jz/pe+NvGvSjWRYu2yVPBYnkvgtC8pKu?=
 =?us-ascii?Q?cDOrH7aoJ2m4fnP324gFd/sZtcUvrU8xM4HpC/uCA18Raa+/PgNGOh/5DAXO?=
 =?us-ascii?Q?a4buJaHhzeBW2DErXMiKu3O26kGXQl+RAeVE5oWLugJ52ma2zVy2tb4JQ63d?=
 =?us-ascii?Q?3n/QYq6VXg/KnrQ1/N+WT539Q6HPd19n5ne4YNCLZFJeAvc9Kmm/mSfqM9l0?=
 =?us-ascii?Q?QovIwfjZ397IRUjQ02AmBruBqnxbQ2VsAqroTT2QLfQ8RefwudfokTkl0cHb?=
 =?us-ascii?Q?WfhU5/we42errfWgeqAMoO5McFyvMcW8+HSYLQ74IjgNHBHMYta3+6Ahac2M?=
 =?us-ascii?Q?n8nycBdBTgyzRaCXzjGgIi/uw8S6p0gMyDUsJxUIpTMgSlytG2VCOsHXOudl?=
 =?us-ascii?Q?DdmaLk+KIecxX01KFnB+yr/IbvxmKNQFMLMgEI6KnikrT/hDjy6Xie60hoIS?=
 =?us-ascii?Q?trwhDvqTCoMzZdTvxSsUlORLtgG4a0JeNgObzQzblYDIUsmK0ktPeStFEu1F?=
 =?us-ascii?Q?/sROcvklCXGDkacJsuMj22WhkqPm5SkD7neXIzWqYEN6H7EM85jU2B6lCQgV?=
 =?us-ascii?Q?cflfQwZ1eJRzmLdhjJHBr0UIjkQdK6MSzaADNCaF3YXHkuMTG1ekOyIcpZJ+?=
 =?us-ascii?Q?j78HKKyePVg6tBRUc5twarkcYflZQa6uz6mKLgslFE5dPkTC719i6dRlb2kA?=
 =?us-ascii?Q?PBYcmV7+S7pO6DnOINsAsD+ongLt7UNeFw+ZP4KHQKiP3lqVVSlKGOUQrmGe?=
 =?us-ascii?Q?XKySsLGlkVb+MYhsELPDqjf53yPYnLiW/yCoYx9411x7g6fnmdgLQ/qR0Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:50:40.9687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe132f6-52ff-4bf7-b6c2-08ddba064ecd
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_005047_067101_AAD588DF 
X-CRM114-Status: UNSURE (   8.61  )
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

Both TAS2563 & TAS2781 have a reset active low. Yet, the binding wrongly
indicates an active high reset.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 Documentation/devicetree/bindings/sound/ti,tas2781.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index 5ea1cdc593b5..47f5d3c6339e 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -116,7 +116,7 @@ examples:
                   <0x3b>; /* Audio slot 3 */
 
             #sound-dai-cells = <0>;
-            reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
             interrupt-parent = <&gpio1>;
             interrupts = <15>;
         };

base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.43.0


