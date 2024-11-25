Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2300CD58D5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+p9OJMNzuQ79BrGl3B38Q3B472y4pynXAfVAMB2HMU=; b=Kc/LjVCgB/edwfIVbo4Cp/rNmT
	Fnei91F6UUtG+O03r678Pm20EpCYoZre3ZjcnP78CrIJFd+9u/UzTMnJyUfAWKEK9BytGu3B5+5PH
	CX1nxoTD+A2I7QDzdp08A8/+LfgDvql7AjMMA6aKH8w2wqjS6f/+aZjmrEUTGzhg4OdlSk0bSNHt3
	jJrmAWeTgJ9I8zP6uMjLaeodsSncAS6ICZFoCLR+zusv7SHnA/Jxn89EDxoo1Muvvhdeqc4lD/CYN
	5VkIikd1+8eMR472bTSSsy+MGKcWrUUGoHmy3X35Db22kVAy7uLTdl/QFDxhTR0A0PqnmroyQf4vp
	W5oDDw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaww-00000008TGE-0YEU;
	Mon, 25 Nov 2024 15:24:30 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFavx-00000008Sx6-1bvl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6FMV7hRsSGO+v1WCOFTnXXuzL37LbD91pIVM+DVIgNsdUgdiy7/dc43ZpXpfiKsyqMyWo+pHcr/G5aARHEtnzmR3hOsGKGUJJbAvXZkdrO2HKkugKjkwuU557nJAoSattjG6R0L+SD/SV55KBYMxt1sMFon8foPXr8/HjdiRMDbGdobuYy5c6XWEAaY/1DJNUerY60DBF0oKPUTITc+UiK0rvVas+qSmyFPVR7aT6fZFsoaXEky0UZiFbiLRLhMQuwAXanlsyJ0GSZbvhkjqy/LGjlQqr8+2xjNPyBy5GH3toS6uhFVNl91OneLF2gdoA4MQ/rOVPljxB942GR/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+p9OJMNzuQ79BrGl3B38Q3B472y4pynXAfVAMB2HMU=;
 b=IPUUEhCzcLEWwjfuZeiRqqCxQa3tB04uJcQ3Xad1Ul01kqRNHjfYimhFrig9f+3k7JC77s7W1Wlr4qz6zsJCzB3tZrIa1g2V3zQ8L0Hwk03o5MnIH+v/bBRuQ3x0ORMZvNqoEAjHNtyaptREY93hp0Gyd8QxZ63rx8QqLAwcv8XMhlz1pyIKorAhL0C62GpaQM1rX4wWkXeZ2aIq+dlzqw+nwnjJD7qHMx/IntZ7YAi1uvLgadDhC4daSRr6UBkNKxwIssEIv1MSGfMaMdtxrGVs4gfJ6mFWLIlQ93gxcbKO9uLu7fzqiOz+3QfjKsJiGUZbn5JrDxGx2AvPo0USKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+p9OJMNzuQ79BrGl3B38Q3B472y4pynXAfVAMB2HMU=;
 b=FbYSwUrJyiUC0+o/nh3q+k1mVuMvPzRS2fwrFEZ/LtfH9hB035704pWoci9OI57xJH6AI7gSnfC/WCTOGVVokx78JJvpB5MZGTmedJ7Jwh89llpb62yNXwZ8XaPYLZuxT6KyMcn5S2sw2hBVzTPw7o9zENnSGUubP8l1LlnenL9Okrh/YRlAbqmgji8s39qljwzrxmBDjE5EXhrnP3Lk9gC/pIE2FQ/n/ujAgJCwtoFNb+FvyG7O+E43L4KBypbJ6zrxqXXfhqq5fY08CxYiy3Vi2jBOtb4KNEjy32hqNt3oLQJ3ayzD+NRQb1WtQnE5HHhHCQNUgMgQcvnzaHSPTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DB9PR04MB8075.eurprd04.prod.outlook.com (2603:10a6:10:25d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 15:23:22 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 15:23:21 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 2/6] arm64: dts: imx8mp: Configure dsp node for rproc usage
Date: Mon, 25 Nov 2024 17:24:22 +0200
Message-ID: <20241125152427.136883-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125152427.136883-1-daniel.baluta@nxp.com>
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DB9PR04MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e33db3-59a6-4ec4-95c4-08dd0d6518bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VpgHJxndmdevOLg6w75zZxjmQ1Y9PhawBlBkHH1g32DjB+w3KMAhAoyRKsKC?=
 =?us-ascii?Q?pahHbQAXixcLyVUwfdq1waD44SR2GKJU2tut92drfOXrfFpNbt/rYqvZ1okT?=
 =?us-ascii?Q?Hm46sIncQ8afFPyVizoxNa0G9gK+TgFfwUvcinj7p5okrNa2WLnRqzv//BYM?=
 =?us-ascii?Q?Zbdf0vQLKD+wdffagpFfIvJ9KaFFzXXTRByOK502ymAu/k4rumDkl6Eyl0pH?=
 =?us-ascii?Q?irKpyu9LmVp51hjnFryc87gbS+K4gaepny6HCOn6IN3FQtaWU2Y3/PcIePjt?=
 =?us-ascii?Q?wJmVfySZDs0VVkcp4gWo+e08odmqIUbDDRGGpXZ8b1Uk63Z9MCCwWgAc7XoI?=
 =?us-ascii?Q?/oo01oPFxKXKB7MvN7w81pSkhgmRBeuI6u0mwC70VxvGtTIbZACV7pq6Az2L?=
 =?us-ascii?Q?gSge560W6L4toIPAeGLAO8KK7hxwxQ2wcamtI2JathhuvRl07HiVIFyzU7nO?=
 =?us-ascii?Q?mgq2MvH/Juysn1Szsvr7f0XlWbp55f97WYtqQDrIPC61v4IMt8Hfb1/CljOd?=
 =?us-ascii?Q?2DJw+f1zO35rPKmIX9nTQVbZHg8afjgc+k5o9IAkqaUCVLquCqABWwnQQvlD?=
 =?us-ascii?Q?SEzgXjS1WtRAbAvIKyGmYgeD/GK7DEycZxEKtjFT5R3cton5Sk4gaUWkZLjW?=
 =?us-ascii?Q?npXcrQs9iKHY5dL6JQu/OY+SUVflruHS6NztlndsCR7o5AtAba5Un79EEVCE?=
 =?us-ascii?Q?JNW0+sj9tnE9J6gQe/ra2WaETY00T4kzxKBocFUSIE2CQEUA56Q+9jorK2Q7?=
 =?us-ascii?Q?cB2YdmUWdJnP+SDIm2T/KOpEECcuofokt1fi5On0nljvB9AQvtjz+7kQiGzB?=
 =?us-ascii?Q?lAI/PF+A5i17sOTSU1FevhTs1OlQQTujeO9tIouuG5zq7ICdZwxmyFMvJTi0?=
 =?us-ascii?Q?GsBPpbK91bXYEMCClj+t3gh6EvTdBeSGS9K6u3emwjnPRoE1TmtOpSbYwzOu?=
 =?us-ascii?Q?f1ZhlAzZ6+UTVXOEjF7TgSkFVw4fWZdYfEdbNgv8yS+Ar2wOBtG/CI80A7QL?=
 =?us-ascii?Q?U+FZepmwnCpiHwMgecU64FdkxNWy8hXqogL1zRj4Jh7B3a5XVd5ygVhSLWJf?=
 =?us-ascii?Q?ANZ/IIt+mcQexNwpsr0gj9s4sgGYYWnQHqFnYt91vtPEh46swL+NvWLAb9Ic?=
 =?us-ascii?Q?WZxV6XTAKq6UM8YyBqMoG4/lvkW+fFY2wYvhotpGLuT3UAyiP9eLwo2KMlU5?=
 =?us-ascii?Q?pMF+KN7r/ImB9LI3sL3mPVqFUv7hkyAfyMeKJfSThG32emXq2sKsYfK51aqV?=
 =?us-ascii?Q?JZtGSCvl/xwnTJSAl/vyPzHnLtbYv9NfzH/daT6RTPndvA+ZgKeeCf/lFzhX?=
 =?us-ascii?Q?2BCKnieDcYtfW5G8gkA2cHJAMWb71x7hXgFXNJqx3q5kw3ln0hWAX7gWO1o7?=
 =?us-ascii?Q?wk4VPIy/d428x6UULvJTuXM7QKWsoxWNCOFKzigxirIRMkiweA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QbNYGDJy4FJPFgmLmpNNfjgFx+nxJrjIb1DDpTUDtB0Ik8cM/PJxyz4vyuDQ?=
 =?us-ascii?Q?1/wWBFjoQbTwvTIfbHi/RuWja7zgkuwZONZDl3Yxj2WTMXoqWmQyPFWFJj0K?=
 =?us-ascii?Q?C3Kfp1aHNyXvNElIFLnYgDjiJ0+gy0cpcoXHBP7hLtec+nlgzEOvTHbQexpi?=
 =?us-ascii?Q?XvoHwHFzzTdp5Tvlam4OyLudJ5qpEEtAVxh3t/CKG51wUhDp6fp6aLjCkObs?=
 =?us-ascii?Q?Es06veuODsxSegLsXJYigxttnCbXoHAjS6P3Om29LHReU7Hn1t+tP5B7DzHO?=
 =?us-ascii?Q?Pp2t9NYBnAQiXZBFoTjkvYddd+Zx5IXjTh0Z/+MFBcQEXeGD3IvYEO/M4pnj?=
 =?us-ascii?Q?b0xgZ/7arASNN2/gCCJsyLeLu1DTcMCPn63VTlX4kzUWSpY6TgiUjV9UIT3r?=
 =?us-ascii?Q?fOw2ChNQqBnkmlMb2aavC/BdSwi+fuioVxwUyyXU/CrfExYifBtAmzXTqSzQ?=
 =?us-ascii?Q?VQ9ot7Obe7UXEkMW3hrjz8AXSgY4H5USNU7yye9yxLs80a3eK+yvZubCig/f?=
 =?us-ascii?Q?s3/FVug5LpnU3rV3hHC89aNbrbU2WzLwEW9lRlLG9fEgmernUrjtBIC73yei?=
 =?us-ascii?Q?9k6nuDyOHL+4wdGKp/1RQY4BOllq4tFrOxIqnj4dvg3E6kgNm6FObga0AI7Y?=
 =?us-ascii?Q?tclHzsZvfLCt7RvTfmG5mb3D40oGl6tdDH0dc8hJ/M1m5jttPgL9wRUe0u/6?=
 =?us-ascii?Q?Et2dntjagY1DoqKr8DVutzTgC6kBy/D0pJ56/AgdOYlbVs3SxIVYGhcYuGW8?=
 =?us-ascii?Q?Lm1C2o0AL+y1DIPye8B2k6EQPZpkI6wAQWDdBTkT7TLhrNhGf2GgCVBkIK3K?=
 =?us-ascii?Q?/yteljrWU39SPF0ZGjQomR7IMEWl0WLoldmACw55j4pgMbk7Vae1aqMmmaHy?=
 =?us-ascii?Q?/Gf8VqjOvBiv55/d6QQh0mKU53htR+NQO5q/eU4B4Xziu+ZsaRvmnZd/itPP?=
 =?us-ascii?Q?y88xCEv3JzguaTV5OBpyN1rsAJN+lre03VMFxwCw9jpzUjg2xioh3aFubpmp?=
 =?us-ascii?Q?t6xXp9y63QDh6BP7bVegYQJE9YOV4PW4+B5qkBBUnUA2jbtWOR8KUx+oSwAP?=
 =?us-ascii?Q?vMhaJ5gWqhoMQKSsc1el9JMoMCjUkGNMmV5Gw9iEAS0i5i47ZbBhlPVwp8sx?=
 =?us-ascii?Q?9vv7zleQf9bfSgknJ2ymDw+HQ87+bQeatHj7lQoHYpcKpwVlbih8P/ZoWH5f?=
 =?us-ascii?Q?/7OYjNOClGLzv8g//1XpqAE9G/2Ic1A4redWOIJ+taea4XHXj31mMHBVygEK?=
 =?us-ascii?Q?FsF9h0TXbQDe3l39mBWLPLEgc0EsdW1AlVpxYI4rbXXuK6SvmoW3Jn9i8FZn?=
 =?us-ascii?Q?p0VgHIAgZzDHvqz5Asn20nsSnxSR9TwSYVrdPRggwF7xw3WXQKuwqdhk/MPL?=
 =?us-ascii?Q?Y+1/wcUbI4UvHlct3gWBsgaUN+7yhmjWJXBktT+dAZXCqWAwHKRWTshfaOoo?=
 =?us-ascii?Q?HkQrJ1+q2VEzIiNHUEuNarReNEu+hdKx/OPOrgaZllYmBs0If7Po+rlSD1/3?=
 =?us-ascii?Q?ADH/XFLhvorS/MOQ0eVSIxXKIk9LlYau2zWtkJY9Z/FxLTIOivJQanP5ebe1?=
 =?us-ascii?Q?w3lqDOm75ROg4FUYaGtQRKQKjpO8oPg9TTg7+XX9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e33db3-59a6-4ec4-95c4-08dd0d6518bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:23:21.5933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQlOpTqc69wGUGNgVFb3uvytdjlnX85Ru8og0m4KqsY+CV3rs80x4gKv4l/Iw5Avkw98/lMD3Q0U8zOTzi+R6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_072329_424310_7125C164 
X-CRM114-Status: GOOD (  14.73  )
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

DSP can be used with various frameworks (e.g audio firmware, rproc).
Currently 'dsp' configuration is intended for audio firmware but it
doesn't work well with board level DTs (e.g imx8mp-evk) because
board level DT enables audio related IPs (e.g SAI) while audio firmware
needs this IPs disabled (because firmware will configure them).

So, configure 'dsp' node to be used with rproc. This way users will be
able to use board DT to use the DSP as long as they don't clash with
Audio IP configurations.

More comples usage of 'dsp' node (e.g by audio firmware) will need to
create a separate dts file (or an overlay).

This change follows the approach taken for other i.MX8 boards
in commit 391a319c81f6d7 ("arm64: dts: imx8-ss-audio: configure dsp node
for rproc usage")

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 00924e0836db..2f94c55e4999 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -280,7 +280,7 @@ reserved-memory {
 		ranges;
 
 		dsp_reserved: dsp@92400000 {
-			reg = <0 0x92400000 0 0x2000000>;
+			reg = <0 0x92400000 0 0x1000000>;
 			no-map;
 			status = "disabled";
 		};
@@ -2414,12 +2414,12 @@ usb_dwc3_1: usb@38200000 {
 		};
 
 		dsp: dsp@3b6e8000 {
-			compatible = "fsl,imx8mp-dsp";
+			compatible = "fsl,imx8mp-hifi4";
 			reg = <0x3b6e8000 0x88000>;
-			mbox-names = "txdb0", "txdb1",
-				"rxdb0", "rxdb1";
-			mboxes = <&mu2 2 0>, <&mu2 2 1>,
-				<&mu2 3 0>, <&mu2 3 1>;
+			power-domains = <&pgc_audio>;
+			mbox-names = "tx", "rx", "rxdb";
+			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
+			firmware-name = "imx/dsp/hifi4.bin";
 			memory-region = <&dsp_reserved>;
 			status = "disabled";
 		};
-- 
2.43.0


