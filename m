Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32098D3C52B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Vds/MnZEbft5fXkvc91e7/XEVhS7rNlDKfebxzTZQE=; b=sx2ruxITpGU22EeDdCfFD1me10
	+99vq1eTQgw1jjv9a2KU0AfGZc7wK/FeI3pPBKX9GDmT1Ve1/9H2YHvLcgOqI3IqW3FHYQlKHx+2x
	T8mPSZ5X6Irbcmjoqc6fX4DnT6QwM+1W4nTdJz3QPTgz+rjZfipCxCjnDczSZDQ1M0fyJy9JZRjt8
	zkNCAiMy/upEcXP9BLvpZmviAfnmykr4oMRZ9bCpW9UuXVb3t9uKkncrvr2JbVp9Xbn24BjA9Mi44
	9Z23OTBqzVIrUdnN0t9O2oW9fwzoqFL/RRmhIqzN3W1YPXH1mC28JgaF0B+WlLSiacNTE2UvqD1x7
	Sv6p02Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHFC-0000000FJSe-08Wv;
	Wed, 10 Dec 2025 10:16:26 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTHF8-0000000FJOX-3olm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 10:16:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjyk9OhEv+m/pEeykegoep//jL5KEjl/G1hdQMK4FFPBxeoiT/o6Lv8kJmmod/jqJbRY0be7DKdpApvWPAQMHTl40xPggJVbiGSEcZbsdizNuket+5dpcDC/I17KzFGqhVyKiLOf2mpDLsnq/4Qr+eRpWhSSS7guylCYo5hyLUZ/+6O03Eo295RT0CDGFxsfvEgofu/IMbqm0L6f0maNhX1KcmaKsjfZkhwhjcd6rQgSKOFiYqgPVfUBF61kFm9lAbPWwFF7DZFIJr/mlFP4hT2MR1b0BxZ7zphsn9bhGbIZylxCxNYG4iXurzt4pITjYwtDAap/4h1itN6sIcRiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Vds/MnZEbft5fXkvc91e7/XEVhS7rNlDKfebxzTZQE=;
 b=nJWGU6sFVuT1SpXCanmWL0lHOAcRHmXvoYMZHcDLLxoQ9wEvuGxWpNdZVEmrAMq7t0YHHByo1VkaCo7XhFJOWpgdCWRUgO8/GUmLXZ3izYZzea7MgH9QT4mcscTghfapV7FPhCSVR543NGfW6TnkAtO8KySae4xhxZ/sU5aNrWJVZwUgX4DSaaJbMZsGV6cD+Ege4vNurshIg6eaK87mTt+mX1dqWMUalVnKpU/3bMze4i0KxAiqAA3daxFjHxzRjnAiC6fwv0UwI8SWByjEwj2whmZylK/ZG73l55lh5w2OfbNFbaZ1BGJj7QqkU5VlG2xQZyfLH3rN06zA3sGQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Vds/MnZEbft5fXkvc91e7/XEVhS7rNlDKfebxzTZQE=;
 b=h5Lq8K4TA/8bLCYuRm5ZelkPENgmI1LwI/E4jXHmpe3av3nZSlbKJ8hBGwgeFdfKoNGUQfGeAzHDJ/lbgZkyrceLpSujMwFAbAPgNjuxgKjLNh+QaDleiGkVRV59iVpihrAmfpTEtJEs1ILfqkSX4pwr0xt1N9V3ADbcKj7oSt4=
Received: from DB9PR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::11) by GVXP195MB2028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:3f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:16:14 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::f8) by DB9PR01CA0006.outlook.office365.com
 (2603:10a6:10:1d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 10:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:14 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:13 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:13 +0100
Received: from pc.home ([172.25.39.2])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2025121011161306-312 ;
          Wed, 10 Dec 2025 11:16:13 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<upstream@lists.phytec.de>
Subject: [PATCH RESEND v2 03/11] dt-bindings: arm: stm32: Modify STM32MP15x Phytec board items types
Date: Wed, 10 Dec 2025 11:16:03 +0100
Message-ID: <20251210101611.27008-4-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:13,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:13
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|GVXP195MB2028:EE_
X-MS-Office365-Filtering-Correlation-Id: 5244c380-90ad-4ef0-4b81-08de37d52698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vPYOagR9F4fsOmKk1TAy4vPMQo+3P2JlQ+IazgFgyeFI0RGfPnVyTim24vQO?=
 =?us-ascii?Q?PQubknp6AEDMDLIu4o181yfxP1yPD+WxeD940K2ZlQJrT2FxTs/Wup0fO6vd?=
 =?us-ascii?Q?t07jom/Fkz6231ft7psbwyE71ZGF55jk56tDneBBOunI0+LxadfeurlGxouC?=
 =?us-ascii?Q?ryMyzpH0Vi/Wsy1/7Z0I+SK1FS3opidCZ5ngw0+2r52Zf+uSy3KQGJvjOlsN?=
 =?us-ascii?Q?8EBTWwmn5mbpkZun4Cbz5Sb7q8ldTyzQ+kLAk6GlHTgTaQhrMXvPRajR8qPb?=
 =?us-ascii?Q?KJXznV/ByGvyDTSIw+d4wRtfi00kHpin5dQsih2i2qDv9M7fFUuf7wyt7aTN?=
 =?us-ascii?Q?CDGk8cwaR/7bN3sbKuEIASNAA7CvnMkQawloMvNzdPtRiuBPZkbkoFIXXq+L?=
 =?us-ascii?Q?1vgshSjEo7ryVScW1yBqguAiEJKzmtR5D8d4p+O8lbf74Rfe8lu9adjzoJZn?=
 =?us-ascii?Q?GbWKtr+1ENaBPoE5SixuB0aqSbmYSX2ezTczxbUxReORYATCC3Yev0ciMlz+?=
 =?us-ascii?Q?LHrnWenHbEPOGQzNKt+G3vWUkEsgSdMe4aPxp+J7YUaDJTQD1tb4OpvHk5X0?=
 =?us-ascii?Q?yMWabSdyWPCOq2n2olM8ZRNqPG5zqPYSQ6CUpntBKHwRQ/HaRBbOWAXvOL6S?=
 =?us-ascii?Q?jf+KFKIzdn4Xg9ha2RaqrAK3QrpNMBqmCw2pJQWhqrogbDefNgedkqTKuQ+F?=
 =?us-ascii?Q?ZBIqMDuK/Kc9QzHuwn2jeXN5o9mAiBPqazEok6eZMwl1Eugx97gqdbzfWMDG?=
 =?us-ascii?Q?UpspBNdsIkfGAFv29TPA3bj5tS+V3RLdKwlGoKeFpMXxCABlIF83kfII5vYS?=
 =?us-ascii?Q?jXWe33QAtaCRVZLMeyBVnbQZFMdfGMYcwAQVu8ZkhgPfLL+4E/fKg1emOLul?=
 =?us-ascii?Q?akSddZYVqv3vdth4OMWHfEeylas9eKU2rd4Mn51DoxFXCDo6eavZjg6UA1k6?=
 =?us-ascii?Q?3ybrWE2oLOGxgH2KlK7LfxUcStzkfzZJn7R8OLo8TLSP98NWM/UwH5koThmD?=
 =?us-ascii?Q?K0Kyiai3uK03TA/bOYadgMQQUvQJDJMIwyT0YRUEKO4mCqykHDJczq+KyTuq?=
 =?us-ascii?Q?qmxHJot+KOtUuG853P7J9DE5JwUyBjeUoyKYJXttwIx/hKa9y5nworsh+fU/?=
 =?us-ascii?Q?VOwK9HACEFSSH4IGqxZdvtbxpWjGArS2uWUGgwuZHRmS9/kKK0BFJ0EQwdbc?=
 =?us-ascii?Q?B74UlUVu9aQYKDYCotrMOPi88mdyN4D8evkg58TUy9aLWXXL60YMtcOphCOr?=
 =?us-ascii?Q?9lkq+yz60u5zapxbjPJqdFLC4ZpxStEzbwFgwscPXvX0pW5CW0nptIjkM4vV?=
 =?us-ascii?Q?AjODHsbQjSqVIAoE6BlPLPrJoamMPedlN2Hs/usgTgQ0cqCSJ5cLX+aFUPb9?=
 =?us-ascii?Q?CxxfTsdXBootnl+IihtkkaBRAOt4j+ofnvreU77lezIVnP5sXAuJCIuuMbBH?=
 =?us-ascii?Q?dlWab1F8HBwj7g3+1GYxrm//8RE6+S7a5rxn9JufGl7S5wWqJt94XRzj39lx?=
 =?us-ascii?Q?PPbuQqFnzPH+fjdIq9vafrZUKM7yRtDOx326UqVZaIQnHZgKkdgt7mJVpaxp?=
 =?us-ascii?Q?LpxFmCrTf7EtKQGTUJs=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:14.7542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5244c380-90ad-4ef0-4b81-08de37d52698
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB2028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_021622_951388_6E2A77AB 
X-CRM114-Status: UNSURE (   8.26  )
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

As Phytec manages different SoM configurations with different STM32MP15
SoC versions, modify the phyBOARD and SoM compatible items to "enum"
instead of "const".
The description concerns PHYTEC SoM equipped with STM32MP157
("st,stm32mp157" is "const").
Also add comments in front of the enum items to be able to identify the
compatible string with the phyBOARD/phyCORE names.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Docum=
entation/devicetree/bindings/arm/stm32/stm32.yaml
index 408532504a24..fbd3d364c1f7 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -182,10 +182,12 @@ properties:
           - const: seeed,stm32mp157c-odyssey-som
           - const: st,stm32mp157
=20
-      - description: Phytec STM32MP1 SoM based Boards
+      - description: Phytec STM32MP157 SoM based Boards
         items:
-          - const: phytec,phycore-stm32mp1-3
-          - const: phytec,phycore-stm32mp157c-som
+          - enum:
+              - phytec,phycore-stm32mp1-3 # phyBOARD-Sargas with phyCORE-S=
TM32MP157C SoM
+          - enum:
+              - phytec,phycore-stm32mp157c-som # phyCORE-STM32MP157C SoM
           - const: st,stm32mp157
=20
       - description: Ultratronik STM32MP1 SBC based Boards
--=20
2.34.1


