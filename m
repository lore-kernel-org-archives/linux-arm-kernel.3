Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCCACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28LnQu9DgXZgvU1GMzcq/UXTVBsRgO74cOrzBgew/nE=; b=Hi1Ych9cpJ8Zka424i7FA9GuFg
	znYb4DfbuVPRo2J0c5nPtRy/QQ79GSt39uiz6HzM8wW1W8/Z1coxVtNjIV7/zw3z2P+SYqTFUYP8z
	4az7Eypl2qAgoxB1hVZwV458F9oKOb4mWrA2mmt1wXXX9vC4+Y7zZjetBDJCHhG37zbIdiapOZc/Q
	Eps4gic+T5DV4Oc2nntHKE+4tV4RGF3RW98up+kv6H1Mfi1Jo/0V5TguB6UnQzEOK3JvwBqeuWU6X
	h93d+Amx5+kmj/quIKCq4kovt+zi0qljH8jHZQCrWxSZfEspxfssiwEtBWb4q7Z7UsKJeG9VxTbyF
	ffxeR4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY982-0000000BaGB-49zJ;
	Fri, 12 Jun 2026 21:09:26 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY97y-0000000Ba48-12dd;
	Fri, 12 Jun 2026 21:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOjAXOkAIGXJl12S+cMhRApM9Qtrf7t16c9zyygz3sSGBJj/7I9Hj30kIM75hQQ0+pN/e/9ySwyKnwCmUetaeiN09fP4jSaBR4vMLY4DKKCs6bDDy3f6EtylIGdSNL1bA5msh61yDv5/AGru8m48J3nib8bDJG4E8NYAssrRpxiiternFZTJH9/WZz1/Td1WyuSvK6QmJwylYj5sB97jArV8ZoESZe/8vRuy1b9p7s0fsdlrqoA4+6ehP97Nhkjga78wocQSF49nhFpVleZUTD+eVo3EdxVDhyonOsvmzKICJwnjqxQI0L+ceByWaAwX0/n2VuOzyjUb/zvyiNN4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28LnQu9DgXZgvU1GMzcq/UXTVBsRgO74cOrzBgew/nE=;
 b=ox1c2NrEm0iiAaqL91mD2RL2U81d3aLA+jTQ89xwvJ5MaExld+J/Tsf/wKnOiEa3ceC7qjcH1Aht/23yeUOYqhjFJiyCpCBLyXl60emaenB2Yau+yCXTYEKtSRnkE//R/2Mn7pU/YkduAgVjirqhw/yi519b0M5/WsicfUdPP3Xcv2JvN4PkDmR1yP8cez1i4KcfwXvwp+Bn/2siQf/pwOoFadhYit8Okf53ohmnlS4M8zrMTAk9mc3M//Hge8l3uDONMADMuyeKN2mKf8ewTvQ3lj496iTm/DRe4zNdOrXJZOsuSYw8CzCpoIh0TPScWUaQGXGWpWh8Hn/GMjAEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28LnQu9DgXZgvU1GMzcq/UXTVBsRgO74cOrzBgew/nE=;
 b=i7FwZLCeBzo3v09ESwf7Vpr/qpgXThUmuey8eNxlfdquR//KYbZFTuFihdvDxtjZZCFP6d0Fv9zHifJhZ2/I6lGw1Aj/xD2MBsyBO97n0gaNc1a9bVZSbi5yaZo9+/oiTmrrM/XCtOWk19pKMTiCpOeWhyDVUJFefAGLNrnTmxyJ44RdD+AX50KtSOxgu308b4Fv0y0OD4vCIO9UiY2kGPqO/RtF8ajhjI7EWsyvHOz887LHmXvV+FW7tAxDTbdm67fyBiUn190gSncS7keWzs4b1CKuNIw7ifnpsm5hXBD/OxmdUVGFviVRM4IX7bSeBU6lwilOCJ8n2m1hZRZCmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 21:09:13 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:09:13 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 phy-next 6/8] dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region
Date: Sat, 13 Jun 2026 00:08:57 +0300
Message-Id: <20260612210859.266759-7-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612210859.266759-1-vladimir.oltean@nxp.com>
References: <20260612210859.266759-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::18) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|GVXPR04MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9987620f-8537-4491-281c-08dec8c6da7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|10070799003|1800799024|366016|7416014|376014|56012099006|3023799007|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: s1LbQQQSgJgzcdyRyLV9DLbnIMqA12pAe+r0hKyCrHJRrBp3DEGbaGmrTqFG7U042eUzlxm6piBzHRzWFMbi0cRsWhFRSMK1NWzSepldCPTGeBri/IlToxU+fZLX7108nvsrEgVEkxGP2R0Fzv4iPPNyZ+SoP6RzUHDsdWt08fFY0wC870s+v2V7cFoGGpMSn+ttM7p2rRginBS1xSyZ68kxNo1FuX+2i2bM9H0P0Quin6uH9uCytF0fS3t3PVkfeaaJPWO/9U0ifktwBClsdOm4Xv94yGU1E76Q5QxCaRJJnzFavvbH2fYh/EmUwq3eT5F1jFdr4SZKYE/9GroOl4rgoLbmffCpqMOo91Kkc/TLtSkWXeOCZ/kXS5Z8qfO05rzIQIWFZpVoq3WZK9+5Zw/puJsSPMoRd0R00db4dIVsFU1AjirfdmbYFP9w4BjlO39xO3p0NyZHSBAUNzMFCpP+X5WMuMIZ6NDF+jWydCvFrDCAsoaOH48yOr1TSXR2klG6X//1biIudR70doQintFa9F33HnaYIVewYwTd0lyWtLuAB/tonKk318cAPG4J9VmpzFeaq+Q2Sw2W6WqMKJaEzNWVLsQkB9N7UyfYSTopuLYP9LaheejOGjykoSGkjDce4ymtKuRJezbdEHSSN1iEEW0XxFcgkytb2dG70eME40TrzCWF2isfeJjlE6Dv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099006)(3023799007)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I33XfgESPygHtD1S0iaBC7XM6rAFu0E3JBfs+iOW/Z2PuOFCX9MrF23haVGv?=
 =?us-ascii?Q?ybFlv5qP8YVRAGKGDhE78ynM3RWkQxvyBNhRBkv2KbgPqN0n91XLooIH7khR?=
 =?us-ascii?Q?bd+VDasVCIGRzm4ZEhK6JUJV/tTro9dH/S3xHe2iCiAqZJyWqheyIXPxHPJG?=
 =?us-ascii?Q?isIYX4WzFV3R0cl3D46ECP6ZjQ8m/oNPWaEmWGkfyXQR/860TYHoi2SjlBmN?=
 =?us-ascii?Q?VKMQvRR2DerzZuJhtGuDHK7/eXEezEFg+ejb5ivl4KXRn8lHL9BCASYuPA3A?=
 =?us-ascii?Q?De67ft/gw9445BJI8aUMFO7IDiibQCmaL/u2IXBS+U4qfyKeP2f7+MVCZjUL?=
 =?us-ascii?Q?kfRWcv6WakjOH6jI/maIdfT642ai/Zcmp0W/lMZdD15W9y4q+e4iJk3u9Xq2?=
 =?us-ascii?Q?wI/Q3BiRtEDP6NRBhG/dKv8JsWmOckGycU/d05LML1/BmKWUMQxda+TYIJfA?=
 =?us-ascii?Q?pQS5k4KbJkupXROhi1bLAi9mf5U67kjzfcsV5S7oGw1DUo25fP5g/zLftKgJ?=
 =?us-ascii?Q?nq2YoaovTzl74nrYVIkQtGREBCXIGuj53MBUuTjJMGS81mMbB5+7C8WP+7hN?=
 =?us-ascii?Q?M7ZSp0baYavvxhVjlcMGmOwJYgI5jRX+fJrm4iVrQZV//A6FQ/2bnWp3oxXI?=
 =?us-ascii?Q?MmgxfpWkNEZ2zmEUEuO5StiazY7e/gvjRPB18AeqbRGzZU7UnCVsCVptNLdQ?=
 =?us-ascii?Q?oFEKBqsXplRh7ExYQGKhSfLJyHKN65mOKCiqYvp+GyhKb0NqiGloqhlEzvEB?=
 =?us-ascii?Q?fXNl/M12MoX6VxnwlV0QuRe9xxB/5vfJ5zOm8BigD/Ysrwfv+0V+DfMJzavo?=
 =?us-ascii?Q?aLcsSgTWqWDHHsEnUvVrG3poEN/aBsQx6/UCVAe2Cly8uQw8gKRAp1chyA/M?=
 =?us-ascii?Q?naAekXmGJL2sTCuT4A9TY3o5FrtEl+dFy10EUH5XynsneIyypgRsSt/Gu+P8?=
 =?us-ascii?Q?HqL7Zp7b/IYOYBh6mRKw3lswrITSPd2KyI1aCOedUTvCfGb8XcSpIdJLHoX3?=
 =?us-ascii?Q?hhKf3T6/csDH0ELLLeh79Vd5W+wRoFq3JhVIgsG0l+rWkc80izwxw3oqSXoe?=
 =?us-ascii?Q?XDg2ik+1nK3TBlB1c7MrSbE2XMRLEA/YgXqkLwIqIC++nQcggjmt+Tz37rdi?=
 =?us-ascii?Q?926rTy2v53YuHYV+8gHysDu1M6xUHyeyMhutCjHs7Gy/l6uJrSVWZx6G+33p?=
 =?us-ascii?Q?SvtFUBS6sIwk7H6h1jBIWF3EqFgqO2Sbgq2KfDpMqH7XYIkN32F2C/hKgpI7?=
 =?us-ascii?Q?2/WU6IUHAK03BNNM3wU3E3J9VQWyfuFa9TcX/xcJA015IYWj00W7IIj0mFBC?=
 =?us-ascii?Q?SyUeG97K4lkl2r+bYccm51Ktw7Vj0ELte4E3pOC1k5KhwFGVKKOQIHEAL7Oz?=
 =?us-ascii?Q?E3ls/172kdMxHUfIgow6Bw1gi4BuwBa4bqoiGe+2s0pTG0K6K3JpfN2lOcPV?=
 =?us-ascii?Q?kWQsUUrdPvpqLRoaSuqxXmBejylYw3SVasM3NWg0NSa/FwgnQUC0K0wLoevS?=
 =?us-ascii?Q?k4tyMoOPGG34tgB2UXrvcs0Yr/wc8eorNsKwHOCROLJWI2q9R275vNsMFJtg?=
 =?us-ascii?Q?lGVtqn5DXJTlvb7WVDRJoN/BCCpBTvdK+5HohL3jZ5QzNgbaAwcq1IQzf7Zp?=
 =?us-ascii?Q?Pl3xJivSvk7u6+155mccT1QtdWjj0ByzHSt8vjPtiuCPNHBTE9RPWcXw2Etr?=
 =?us-ascii?Q?C2165M/xvgu5u/DifxfOoAuZ3K5T/43bJmTZIzCvoL7dampQ6ZXwds5TjvBf?=
 =?us-ascii?Q?9NpVuZTz4EHqVAXvCQW+y5jvdKlL2nAo3u/i2/FOwhbrWVDBVYzu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9987620f-8537-4491-281c-08dec8c6da7e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:09:12.9472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJpGRYqTT91iGeDEg+YYXRTFn2VZe5AqG9QVKLIKV1xqvRI6AwdNOTGdtd7JoB0rxsoX3SUGFqDF3SJEps4fWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_140922_291347_0498D18B 
X-CRM114-Status: GOOD (  14.87  )
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

In Layerscape (Arm) and QorIQ (PowerPC) devices, hardware peripherals
are accessed by the CPU through a portion of the SoC address space
called CCSR ("Configuration, Control, and Status Registers"). All
hardware IP blocks have their registers mapped here, and the Device
Configuration block makes no exception.

However, there exists a secondary range of the address space named DCSR
("Debug Control and Status Registers") which, like CCSR, also holds
registers of hardware IP blocks, except the DCSR contents is hidden in
all public reference manuals.

The intention of the CCSR/DCSR split, to the best of my knowledge, was
to place the functionality that is too low level for normal use, and
which is necessary only for debug, in a completely separate address
space which can be hidden.

A use case has appeared where networking SerDes lanes need to be
reconfigured at runtime for a different protocol (example: 10GBase-R to
SGMII), and the architecture of the SoCs does not normally permit that.
The Reset Configuration Word (RCW) is a data structure read by the SoC
preboot loader (PBL) which contains stuff like pinmuxing and SerDes
protocol mapping for each lane.

The RCW that the PBL has loaded is visible in the DCFG block's normal
status registers (from CCSR), as read only. Turns out, the RCW is also
mapped in the DCFG's shadow register map (in DCSR), in a write-only
form. Writing to the RCW registers from the DCFG's DCSR space to change
what the PBL has loaded is called "RCW override".

It has been validated that the RCW override procedure is necessary to
reconfigure the networking data path when a SerDes lane performs a major
protocol change. It changes some internal muxes which connect the PCS to
either the 10G MAC or to the 1G MAC.

Defining the DCSR area of the DCFG as a secondary 'reg' array element
allows operating systems to perform RCW overrides. Since it is
introduced late in the binding's lifetime, it is optional. It can be
identified by name, but also by index (first 'reg' is CCSR).

Note that while all SoCs should have a DCFG register block in DCSR, we
only need to expose it for the SoCs where the RCW override procedure is
known to be needed and has been validated.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>

v1->v2:
- add Conor's review tag
- update email addresses of DT maintainers
---
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
index 3fb0534ea597..fc14fd0bf84b 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
@@ -36,7 +36,20 @@ properties:
           - const: simple-mfd
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description:
+          Customer-visible DCFG register map from CCSR address space
+          (Configuration, Control and Status Registers)
+      - description:
+          Customer-hidden DCFG register map from DCSR address space
+          (Debug Control and Status Registers)
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: dcfg_ccsr
+      - const: dcfg_dcsr
 
   little-endian: true
   big-endian: true
-- 
2.34.1


