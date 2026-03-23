Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2AAEC01CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwKwdmz3DiodDwcQspH1+YtRD6AODqFsgJh5QLvn4RQ=; b=jvpp1XdfaCFPEQkMHI6HSTk9/E
	m/fDdqOlMs+LbKBCalOaUCo0S9UkuLD2JsRfli3SDY1d3bTbzgnBdL17ikaG5txaGboCnYLcxVqt2
	SUA1/dIUXGYoEhHUFlMklT9nfrIpWn+bNQxWRLDYaJb13B9AA63sZ34qBpvkBziUgdgmUsv7t3Oyi
	X+fE+cGjFe4SV6dV3XKQnWywMObD9SjIxEhkPxKjm9ZrUBtpqU1KdID0dG6Ua8HWWgyZLhk2mMvLC
	HvV6IyKZOLoWLcHNjeRMTLpsuvA147OBFqFARF2SB8DFXtnJjZ6Dy+mqYv7mbTdoyU1Z9/Brjy6oB
	gxd0339Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d8C-0000000GZXH-2WW4;
	Mon, 23 Mar 2026 11:07:36 +0000
Received: from mail-westeuropeazon11010070.outbound.protection.outlook.com ([52.101.69.70] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d86-0000000GZVG-1xTB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:07:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6lbBqnMIp4W08LfkNIFFSxGtieSrhl5xYUyMS5T25sz0wMPYf9t+X1yqNfLbd2sEnX+GnZPOFVEO01s5+xevUwt05esYIRTZ1D6oohPdYJSJ69Q46av55EnDLCZqJI3m7CxMyHzpEH/m5Uo6nkf2VewvkLmI6AouB+sOHFp6PPN21Vz6LWBHPjl8G0zcLyQL+yJLddJ17c5q/Ug0iYh/JD6R1iVcqHqWD4IUzF1KN8aihANjMU+YHdPIESmkivfnofPbn0E9ENLk2ese/ujLf/N1IMQxlP27joN25sxKc6VKlolRTP+iFyRMceqavP4aaSGDTdD3SIccf9ey/02BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwKwdmz3DiodDwcQspH1+YtRD6AODqFsgJh5QLvn4RQ=;
 b=YRMiApHwNbtWlU/Mdg6GNsL8a+08uDfU7v8KUVv9R0v/axU2ndPk+Lk4vLxH09HA1Wdjd2lg41oQk3D7+I2gUOYz8buJ71gkL4DcsSIocVAIrx8G6yam4EWEJ5nVavlTPjhOfvgKLHlBcBqmeKyykimmIfrk1aiJ+gDvA6VB0AlLePdLrFdjHWdIUPL2oOTXp4T7dENyR2LWc2sOFYZPuzpCFFlJci0fjvFWGEmNh5s2rV89nRORstLO6VS1t8ET8tCUFbfDt19rQyWuZSTh9g6fBWdvbYSveFaP4qjd/BVmjGgE3U7+EOajwVi5UzNG0lmBymDWajnDBht/3bcvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwKwdmz3DiodDwcQspH1+YtRD6AODqFsgJh5QLvn4RQ=;
 b=KGSJyWggKlJDuIdolO9DBqLEVy6OrwIIC1sfxtQEW+iFMDVD7JL8Fbe0W7XH/nzngLMvF63cT5cX9hGOLrVKagNqhVzfIEtQKCmUYv6CmWev39iTI4olv8D0Xk75TOeu1U053RzAyr0a/pCaLWVSqOgwdsqzHdmjyW9YEArA+IzQp4fvYi/Bk+a2LB55QTSM7jYIfXppIWJV5IyfD35I7v3zvAVOpxJRXr0WlqtbxZdyWqMVr8C4IMUb78gXjmKTZGskbpMLSw5pYlW3oe2IJKs7Ud5jt8hK8/5g5v4uLiJs7tUzJINPDc4h5nhOE6CxaoDsiB1/oz89ZPAzFcAR5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10519.eurprd04.prod.outlook.com (2603:10a6:150:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 11:07:08 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 11:07:25 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 2/2] arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual
Date: Mon, 23 Mar 2026 19:09:23 +0800
Message-Id: <20260323110923.2567366-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323110923.2567366-1-xu.yang_2@nxp.com>
References: <20260323110923.2567366-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0136.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: 55da7125-fd68-4217-4606-08de88cc5d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: iZgFCQBkOFzbf//DYD4ooe75sxhVTao9GqHCRV8eD9Saox7s8ymclhE8jo04MajOtYObH/dbJAfkVvg6XW/csP051p16HUu3UXOUfX7RKONJjaFWuJfE+ta4WBNhN7X6KsVVxGxi8fIiPsOhCMGXFS19D7iniJvgccZCDc7pwzW1goLL2MqyIS8Rx6bkSYIzuOpr08/V8vyQ5Wt9j1ZMP0bOMWXbqok3KoaUV4wcpBqhZV391hwMPb9SxA9BIQJmrAZZuseOPUEfnpFCjwg5Uyrma45cpZ+uvaWFblygr+8Ys8WYv/8znlUm4KRg0E6cAywPHJ3k60cx1Gk2oFAguZZup59f2N+UVHRNZilqgq/+uIuEAzCjRlX7LwDfJwlYjjwmPG4AOeiTvlKsfD81ebFgVYfHOkLC93+x5ovpWGNW+S0LFN4fdLMP8G/M8byK/Dkzb67NMh0NYDv2UEoLMNvWG9wtiu2dWnLjVYXuQLUEKL2w1WqNOqARYDM1oc4nYsaWDu4F8QMoY66sweWScBpEPDQHdOq3EWgwojT4cuyx21M/I3ewibXDnUNRKXx/VcLz5AMzm//WQKp2d8yyxtxp4YdN5pViAJ0H/jRCxoGp0GSE2rUXWv68Gnq2GSzpAFLSy7XMeAxq8PjxWNhbepDEXj7KrLEVeBJ7jt9CjOIgJPts2iO5UoH3X0fs89aTQZXN26tFc7hHGs6mSzZPYqRiBo0If42i4kzZClkXZgLp2BMqYUv+EbK1rC9MwqBnyQW7yMvm/SyYLlK/c4jkoSGh/wwbRHIl27diaYflkIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UZ6MD5cZFdJ3QV96AubX1C4kLQv4Gl5udGgyTENZ9wStDQ/LDoJ22B09/q0U?=
 =?us-ascii?Q?hjeeqGNOXGW6X+4m61k76grWicz4tDxOXOYXyo/KO27x9Kk+sq88PNIwYJUr?=
 =?us-ascii?Q?fKgH3NFgkAERL6KNth9/rly1cp8Ktzz6CedeMe3a5/Q0fdIaubPv9iaiI+3f?=
 =?us-ascii?Q?ixG3sUHLEMGRLN7syyxiB1GfDWQQ9U2FVnBUmJb4mAy87iMjT+M2FVjCtPjw?=
 =?us-ascii?Q?KG1Nhcbs2EF5zxuW3VyUZniFVVdrv5k0JNNKX8BPh8AoUT+DSL4XNFa7eksX?=
 =?us-ascii?Q?eZWbXZAgh5TxYXADCOinecNELNuWqIi21nWagGcnQd5K2hYsy5Ey+a5ERqCb?=
 =?us-ascii?Q?ucpvCB8WDLr9n164jkHH122LgWBZLxn5TSAE+k3xDdJxfFFcgj8bj+6Fp0CR?=
 =?us-ascii?Q?keV4OsAg1txJ4/Uf9Uw75040aK7vCPmUVoKjngNQ4bDO5rdqwF7n7bzA6+80?=
 =?us-ascii?Q?Kvpb/sisylhz3lw+VMkXzChxz/pb7g0R0afxprDlYpYfbje2cjHGp5t4dm6p?=
 =?us-ascii?Q?ZWpIMaAdOb0mt3vOD0PPtQrEc0IXDN9GO4e6UiVcfQlRllD/x7yZVMzy99of?=
 =?us-ascii?Q?2A2mWPDY7f5qzNIXsxax8lcz326+QJ92EVSyWyXL1ct476WYTnmFb9vO7bxi?=
 =?us-ascii?Q?ajBGq8w582MRg5Mw/dkmgxevayjpfGNmi/fTnKgat8ybYzNnurPVTXHaR0HR?=
 =?us-ascii?Q?tp6Or5lMFahVdWqdv2zn321BnJjXOXTN5IXFInS+TS5y7PWIwNBEo6MWIglf?=
 =?us-ascii?Q?WLFA7qGabxYq+AFJ8c2bvg+j7YVnEs/TfuuvF9Qfm1YN86lAvv26R6Kjol+1?=
 =?us-ascii?Q?3v6zGqqrXWiUJRCpzlkIEt/rpn39bhWwMaidH7vnsJmB1WsWxMQj9Xp74kqB?=
 =?us-ascii?Q?0k+ULSPPtOyiDy4vxYXPPT7yrDYBrJCYjEn4v1ROiQ8HTy6VO/SLswOXKTgi?=
 =?us-ascii?Q?/moIokTmgdbW50alFBwh+os8XoFQRjJ0352viw4HwinPSqPTnTIsWXoNawCj?=
 =?us-ascii?Q?wO57FfzlB9WCsPwTSOrH2QckbXkire5mp891+oyYNTBnOLOU3KquCBnxflW3?=
 =?us-ascii?Q?YzguYPdarIx8WXv9D1Tm4EhnuEYH8LnZwB9PtLmkXVNSVguOfh8oKGbzlfaY?=
 =?us-ascii?Q?1iV67c6S7oa3rrJSRk/fnS7H2em6cRTRYl9Q1PFwaGKvASBYaF2EAOT928ME?=
 =?us-ascii?Q?RW3bUEXtbmyP2/+u2svhniyrYI6lguUvYMOPNhDB7ZrKg72lbLj10I94jAxY?=
 =?us-ascii?Q?HHppxLAr80KnuXocgywdeFpCBWZjIJEbwV0P0tUB4G7KMVDBepSeO/i54yAM?=
 =?us-ascii?Q?LXCHWC44w9xsiqBLFzsSjfLwLhToM013TTQeja9OsnPVDVR7buCcqzWcBgT3?=
 =?us-ascii?Q?svcPe7tH0O5B44zSLHZptLtA2XBQy7zb4WqwxHg5IdtauyKVMakytpj8KJFx?=
 =?us-ascii?Q?Wqrha4FMc3GTfeaMy8uFSlbDWnAFXm4v0keji5SlqYJCJRJWv+MgoipY1IWZ?=
 =?us-ascii?Q?iok3qupBqYzsfkeXaQcPkPfb7Y8VeH1uWdHgLwj4OMMnZqylWhY/uS3Eatu/?=
 =?us-ascii?Q?WcTk/OUnuf45kJkupntNwJ/Q+qoBxYQ1CKDRBuWDXydeXgA0Uk52jJz2utXn?=
 =?us-ascii?Q?fGjKPN6dvYdDDBuO+Zt/2KOlmzwvBS+6JjvdOBmCJT+A0AFTCLMaINtEwOhY?=
 =?us-ascii?Q?uFiQSSlVlswcywBYR85DmAsE+4c/m3EtmVEGbBJQh/2Fvxo0Kp2JQyINPUwN?=
 =?us-ascii?Q?uozZIIxzUg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55da7125-fd68-4217-4606-08de88cc5d0c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:07:25.1181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oIZCphRxgyxd2hF8iz1a6cmpfY/OZs+2BGHj+jO+F5+WxP2mEVkdf53lBeHOvtortR9R3aKGvQrNzOl040f6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_040730_512364_CC796B5A 
X-CRM114-Status: GOOD (  13.64  )
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

When attach to PC Type-A port, the USB device controller does not function
at all. Because it is configured as source-only and a Type-A port doesn't
support PD capability, a data role swap is impossible.

Actually, PTN5110THQ is configured for DFP/Source role only at POR, but
after POR it can operate as a DRP. By switching the power-role to dual,
the port can operate as a sink and enter device mode when attached to
Type-A port.

Since the board design uses EN_SRC to control the 5V VBUS path and EN_SNK
to control the 12V VBUS output, to avoid outputting a higher VBUS when in
sink role, we set the operation current limit to 0mA so that SW will not
control EN_SNK at all.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 40a0bc9f4e84..a16a3e0dd7ac 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -566,9 +566,13 @@ ptn5110: tcpc@50 {
 		usb_con1: connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
+			power-role = "dual";
 			data-role = "dual";
+			try-power-role = "sink";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
 
 			ports {
 				#address-cells = <1>;
-- 
2.34.1


