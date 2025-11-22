Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4840BCFD2E8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTVc8y60sxAjdlXcbccamwQHc4i8JgYcJIJuaJhhFKw=; b=RAGs5GUjGrI9TJ+c8psfgCG8Ep
	N0n3B9iJq3zomN/EEanoBj/YoFIdDlUWYaUQjhbzpHKGGBlPYhyyLndVGIEo/JWYHolqJ76lPHqlE
	FagRLlm+8SH0asCr6UvDVi56O5pj6GErKgnVYmT6uiyfxAtYq/06MYg/UDi/3kaUtMCeP0CnKAlUI
	MWb1J5y0+Ms1CAVZ74N3s1ExfyahMVD+U2qB6ovjwhdlBGSiX3deIGcTyuUf5ZW3Jlz8VtCBFvz4o
	kgR+KloB93QqKByoTrtFonkXK/EI/kVA8HzLiOWy+Z8Y2NwzTqQ4Tx2nUpo+4dVsJkB0GkiJTQ7rJ
	6J3oxdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMtNN-00000009pkM-3Hef;
	Sat, 22 Nov 2025 19:34:29 +0000
Received: from mail-northeuropeazon11010041.outbound.protection.outlook.com ([52.101.84.41] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMtNB-00000009pHB-1p8n;
	Sat, 22 Nov 2025 19:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5LwcKShZsnorsrEYafmoj4FhiXYaGbAVNMhXxBrcAXfbmbarSY3QTLKrRAFdq5z8kC7v02KojuKn6zjkC/iQbfuhZK258UWBSIIe+A8CSuxhuq89j381O7lm/xrbRcraJ6v6LI8WJZwAtgHfkJ1ikxJiO/bYPOApcdu3badbsNKL1Krgxjnz8vOWpqh1B2/R8A0iKrOuLrLkAt6lXfvabfzsvT0eEz4VhxDejE8ve2WA4ASvEvpPx1qQWX11/ChnjzdgmdMK9WBBG2Wk24s1dMN6YJ+yit+EavJbVj8G+xDhEB+CG6L22FXOy6+MvfiF9OnyO39scxMR4xgIvsEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTVc8y60sxAjdlXcbccamwQHc4i8JgYcJIJuaJhhFKw=;
 b=kW7OjhygDKsB3VOIRfYSx7XECe9gi9C1ZVBe+eJOkYaiIOWWqwSpNOUWbTINuvqhDCBn64NkqR/IE7+yAxbEq2fBXfCi+9AQ8rCtW7PpCSTRothRsOZIaoi6EF1m/Lyai4A1rUZBNyCZYbwRAWPiiIFC7UB5QS+5f9ZwiHCSUnppXippmIAjg7hC5vKEezBShAyG8eyHQf2Ia60rAahvpgp620Y5q2N331X6gyI1FNOU7AMw1u2YJiiIdXM4bIT2Xh9Q1AntPzy/s/ALCOM+3g8JoZBuqWCpLwuooXabd2gxdtLt50Xquk/DGraoo9VWCdMF5A28YEt1uDcho4mFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTVc8y60sxAjdlXcbccamwQHc4i8JgYcJIJuaJhhFKw=;
 b=ZRgmazowdtC5toxRIopTiRPM+znbOirHY5axBpkvDcth+xqJV+OYAqUirjRGWwWMi6QwzXOM+6THUWYBGL/fvzmoR54a5Rq6bROX6CD/C/p/PVdyoM/NbA7x2oNUFA+HF+PkMXehfTuZbCUSB1Ggxqa+LhXzf+Z1G6P0hhrnfUMymdNTKiVD8s9TeBH+PkhZTs1WlRyrcdQ1cPWT5PXZFYZ7rDtqYMQrniSYoTdR4q9ky/RxOrXPOXpMTEUWyHnSStR8LK0hfUwG3jXupMu1lzprzkqRQDmAj+J7hSBOz4STbOM7aHPpOfMyze+D5JT8R5eOSinYFNkqZcF0KgNU+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 19:34:12 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 19:34:12 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH net-next 9/9] dt-bindings: net: airoha,en8811h: deprecate "airoha,pnswap-rx" and "airoha,pnswap-tx"
Date: Sat, 22 Nov 2025 21:33:41 +0200
Message-Id: <20251122193341.332324-10-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122193341.332324-1-vladimir.oltean@nxp.com>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0010.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::20) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 80372d79-817b-4a37-71a0-08de29fe1d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|10070799003|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Vbph9ld/86hozbVvxJyahHea6xTBB4uryNB5JPvZztaPtzbFAofABZXngOn?=
 =?us-ascii?Q?LgO4Gj5fVUCZpy2VIJXaRPqYZCndZG8xCVQ3Z8rBrvhm7/pHBWLo4GelNjq6?=
 =?us-ascii?Q?DSkkoDF+r3+B1Dv3oY4o0hpAO7lqHnohkpjJKOXsRQlEq9E3Kfy6vvQq2Xj1?=
 =?us-ascii?Q?RgzucJYzrJXScP+8G7wRcEdnZ5vn8vTK9CMJbsYDsau2Qr72YMZH90XsLxFO?=
 =?us-ascii?Q?lpM0DhpXBTJeF4gK6BWteWkK9ZNSVuHBj1trIQ2q54NFxxBG4Uf2lrUma6z0?=
 =?us-ascii?Q?s0x0ayttXVWPn9PfY8ObJVXfsMjPBHVtv2/oulsO4CNNVsfYMBQ3dWvFmj3H?=
 =?us-ascii?Q?iRz+/xEconuJsmUJvkA4pyzsMv9u6jpUXNh+WDp6Y1sKTcKmvb2zazNArA3A?=
 =?us-ascii?Q?nx/yb+OpoquGvIcq220cTnFI4Fz+U7XSAbBHaC2sBoLjgiQSq7nCHCsU45d9?=
 =?us-ascii?Q?cZ+plEcArEhkj4UxJgD8+QEHh+YmyQYiXA6PJvVbcEhHj6+K11eSnfKS72eu?=
 =?us-ascii?Q?Dp4Fu7k7Wo1F7+PjgKCJhHtxF2+494eTZAV7JHJzN0XtmvR892Ju+y/TUzJQ?=
 =?us-ascii?Q?9OWA9JwJSR+euv01Yw/F58+k6s0fAgIpsuGP5pMQkqyESr3LoHHR35Wqble+?=
 =?us-ascii?Q?hKEaqNnFbzBgNT/pJAYKOR0ELpZ+uLIn3gd/7pfLan5E/2ygDyt/QJQTU9iG?=
 =?us-ascii?Q?lX3uLaKhsZrCkiiHu/zyU1LEod0/ppfoUK594UU60FR1nyCbcwVmjvCeZwqE?=
 =?us-ascii?Q?meS2ZEOuFe8kXvlwCvzvKByuNRilZ7vDzntErjihZYUYKV1F19ORRauz+J2S?=
 =?us-ascii?Q?89+RMCQlSJps7fPqrOxjMa6A0I5wOVaC0Mjht1hBmla6iEr6nONER0rFsIM5?=
 =?us-ascii?Q?hWjiKNXCJfGwLKYj5wZw4LT4LWX8g3VF4MYcO2Hi6LhFtuxlIMBQmRmVprgY?=
 =?us-ascii?Q?+wFQF5uqRO1RqOHuM5O7c4iRmzEJzF9EPrJOdtwdOYCcr3Ej3jPCQhNcYItz?=
 =?us-ascii?Q?yh/KBKWW1JQF/1siaq1iunmzne8ze1GSmC5+FHPEp+EqMBT0cwmY3KXK3g31?=
 =?us-ascii?Q?Y7JAEeshhDnAWJaY6zb4uE3WsLBWWJxMojVk4/4ypFK7cJTAxGiZ3CcS4qmN?=
 =?us-ascii?Q?Yy1B4oWwOYi/JkffXKLZzl1Xy6wxjQoo3i9/eeb7ap+gtx1npDc/kP3VVVrj?=
 =?us-ascii?Q?i6eZRTF/bzABVnStBXcPTaRuBusX2OXhzvyrz1Kta+7Y6LxR3hWVnlWPvmM2?=
 =?us-ascii?Q?6EL/Ru/zTerdiu4MjfZnk+bv0NwrJ3uRfzl6MCLNkUJ8xYu/NSxlziffvUTP?=
 =?us-ascii?Q?R9TUK3CaZlmYdMGIHlRsUUCPAMGv7fQELWA769Z/c+C1U1QQiextt5897FG4?=
 =?us-ascii?Q?I5HZbZrLTlBluCcLiu3/zVRrr9L5KkYFx2RCj1Hb3kdq+M4Yu3exnT4rAO/o?=
 =?us-ascii?Q?bugkKnwmz9uHvFL5JuWOGNCnvWp/CPrp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(10070799003)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lqwNOeh4qT1tgLTHrSd+OnjirAfvyqjN1bwhIprjPKeUmBtOfwiwDpcUVkNw?=
 =?us-ascii?Q?ACu9WVZQLW8nhmDLMaSdn7sh0Y1GPKLT1bJc4pYYXQ7DWzoae/44WlgEjMHb?=
 =?us-ascii?Q?p2PgPwvnpcTXt7Nf3GTP4pAdam8HRNRvLpas/lMqQxgBDdJ8gcWvq1VKp34q?=
 =?us-ascii?Q?ZnGTQZqqiifRDVnmJ8z7GOpvxEspwirfkYIpuJrK39LmdUgqfjij+iDjFQr3?=
 =?us-ascii?Q?VJNetyG1ITKdJ2SQuq8NLsL+rbrFpM3R9kc96rwBkG6YMwCYqlmgrlb/anLw?=
 =?us-ascii?Q?01iHdZrN3yqtF42aElXeWyEVxEopqDXAslxLvhQg2uyeOaLNEk5T/swYYXG5?=
 =?us-ascii?Q?w5xdgg0EOA6OJddGNz16iO5IVANHcmlMo9NLrJ2P9Obp9bbWqgKFsOhUvHRR?=
 =?us-ascii?Q?+eVcx6f4Evv4RSMPfsqt7Xz3HwmtVvbz4NK5Hv6XqjW2klSpgX/74scXxkGp?=
 =?us-ascii?Q?JojKXfMiLMfhaaTMsixoRtq6WjasjOYPmxFV9p7fnoz/8RIU4ephh3rY8q/t?=
 =?us-ascii?Q?YUJCiq//rJXMPk/WBSZOdLU2sLIZ+qoI23aEx1GcujhETgF1CsdTsAtQlHXz?=
 =?us-ascii?Q?Bz1gvFBj2kRfm35zSDhsjkO/GBPfXeq71RmMKYSL2bakxpyfMs+JDSIn2Z/n?=
 =?us-ascii?Q?vXlHgBRvpmWkbewogiIQ877G6qD2Fc80HAioOz2cZ8ddqH3oMvBi2iv7cKeB?=
 =?us-ascii?Q?17S/bpmHeKPdZXHynnG86bt8TdGXJbxJ829a3+bApyhO/eRvp3zWaNYMLMvN?=
 =?us-ascii?Q?efc/r+mMaeupsAjv/jGgrzzsGPD+rvkwZt4zYUx/OShWkjTsCSg2Fo0Vnkas?=
 =?us-ascii?Q?5md9dIVCvS4yMJ9hiG4krAiBJRPKUW+sgB3zkctqw1lE4q0GEifU23X2lhh3?=
 =?us-ascii?Q?iPAXWZRf6PPxYYmdj+TNZIMVeoR0SEHhHaRsFo1u36eewZ8njKx2mlPzs+9i?=
 =?us-ascii?Q?UMni/fd4FfLZEG2tKFKPJD18hm6YtaRj7fP91NgG9KrkbIYVAGdCJIEbeji5?=
 =?us-ascii?Q?k7FlONjkgwMjIon2ixwdT6pMBlb7KvGFkOwkWZPK1BX8U0a2niEviBBVE+rK?=
 =?us-ascii?Q?xPGLK/1V5WxScbTrB3MqE0RAXLoZiddb8YYsA62LD1YWp+5cjLZ1+wUEj2Fw?=
 =?us-ascii?Q?fiAPy6yLUnpQPT5OYn46BrYnxLCUAaErZ9yP2Xa1m1KZ4lRZoy0mUU9GXc+l?=
 =?us-ascii?Q?u8abjNVtf1v6unaFdiCqDv+lBwV+R6vZZn8eYJ9EoOWEs5P9W6eUzzbF6pYp?=
 =?us-ascii?Q?yDbZxVUQdw/8O7QoBoQ1vej377e9XcQkhkXs5KBejRaTtR2UssqAnKCE727M?=
 =?us-ascii?Q?uoTJEMMLJsLGMs1IDRCLe0AvCCg8QxGZ+qLgWR1b9OFThhECtEj1wn7O3Ev4?=
 =?us-ascii?Q?jrNkIUjsw5RaL/aQPGGLjEVZxcFOWHZ+CXW/JygvjX3E13DPcRVJJQxHJx1Y?=
 =?us-ascii?Q?voVWjzthtyi9XVeGpVt+YW6Ni1iUWRjf4pA6gR6Jt0n6yZVjP8xwWBg6B5ry?=
 =?us-ascii?Q?+Xbru4lug1B/YAEdlU23adp5OnSmiPW1tDVs51tX5Eef8bNtOchxc25Nuobr?=
 =?us-ascii?Q?sPZWBJpFtqWNmUTbouMefL1tk0EU76K3tuK9QpNcRRYP77dJIvgxvq7RcEWP?=
 =?us-ascii?Q?adllDOWhT3IXWVYumyq71K8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80372d79-817b-4a37-71a0-08de29fe1d0b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 19:34:12.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KA5TBnfC97f+tGon8n9anu0/s8751/1jz9bEI26+/5zVvmgftiEZxYKuIOWdRXQdbd2gjleWLUDHMaBUDVDiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_113417_573174_E98DAA2E 
X-CRM114-Status: GOOD (  12.21  )
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

Reference the common PHY properties, and update the example to use them.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 .../devicetree/bindings/net/airoha,en8811h.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en8811h.yaml b/Documentation/devicetree/bindings/net/airoha,en8811h.yaml
index ecb5149ec6b0..0de6e9284fbc 100644
--- a/Documentation/devicetree/bindings/net/airoha,en8811h.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en8811h.yaml
@@ -16,6 +16,7 @@ description:
 
 allOf:
   - $ref: ethernet-phy.yaml#
+  - $ref: /schemas/phy/phy-common-props.yaml#
 
 properties:
   compatible:
@@ -30,12 +31,18 @@ properties:
     description:
       Reverse rx polarity of the SERDES. This is the receiving
       side of the lines from the MAC towards the EN881H.
+      This property is deprecated, for details please refer to
+      Documentation/devicetree/bindings/phy/phy-common-props.yaml
+    deprecated: true
 
   airoha,pnswap-tx:
     type: boolean
     description:
       Reverse tx polarity of SERDES. This is the transmitting
       side of the lines from EN8811H towards the MAC.
+      This property is deprecated, for details please refer to
+      Documentation/devicetree/bindings/phy/phy-common-props.yaml
+    deprecated: true
 
 required:
   - reg
@@ -44,6 +51,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/phy/phy.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -51,6 +60,6 @@ examples:
         ethernet-phy@1 {
             compatible = "ethernet-phy-id03a2.a411";
             reg = <1>;
-            airoha,pnswap-rx;
+            rx-polarity = <PHY_POL_INVERT>;
         };
     };
-- 
2.34.1


