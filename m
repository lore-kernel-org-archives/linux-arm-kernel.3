Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83774E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 02:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIkn0o6z6elJoXDPpZpC+LnZyYIPIUiq8qr6l6jymJA=; b=V/TJCcQIqSpLqITBHNjEuXW5F9
	wP14z5usKLFWimb/n1UntJBuMOBBa+H86hWRQqmSTgyXpEouz3QtydNKkWAfGMoyK4ZKDk8e5vhrW
	MP8kJNaKBq+/w3DjS3esKAwB0fXyy9SiI2JxAx4tAVb5wGa55X3jq5rXZXXAHl2z6rO70zeMOJVzv
	DEU3nP4kKZg4++GSOfEk6cpJS0Ket0IISdBRi5QiWkl1ytKN9GthxT6T5TlKcxBrgEVQuoNwzakT4
	OYMSpdWW6i65xnz6zjn74sfm2ObRPIT8BBTClK9jKCnXEx2fuAYRTeqrRe4vqozDOWQ95kpfXP7Ln
	bUGjkhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS5e2-00000004MUp-0tHK;
	Mon, 30 Dec 2024 02:36:38 +0000
Received: from mail-db5eur02on20622.outbound.protection.outlook.com ([2a01:111:f403:2608::622] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS5Ic-00000004JEd-39aS;
	Mon, 30 Dec 2024 02:14:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmP3SdpJqQgukzUSE/+0fvHh3neCuspewzPi93OYMBkEta7Uy3NfRAJtd3bcC3tGBLn0rvrKyIKk/Vc5dk2LiR/vaBlKM+5DMArgE+6UCOtvOYyrV22UQfK3u4XN3Sh44PI5HqND4JizTdYqUdbnRNBbLYdQF0FH7y9QaLV5QszblaVdx/bZ8afDMzy1UT1/h8AT30N6yaj571lMiIZ4aOzok3qkWDARgDmc/VrFe4B8QvabDcH+3Do8N0cBMP0F6hCEiMk/da2zvv90DKKY5gpXnj9eto2hXTtVjDbvRg4fEDCT3e0M+4YVj743gpvg+CrHo7EfPXw3AzpVEza9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIkn0o6z6elJoXDPpZpC+LnZyYIPIUiq8qr6l6jymJA=;
 b=XO0YI9hL43H4yJK63TfsSGuNekQeVWBk7z+xCEVhMtUxBqSM0smHNQvrCUPrVZcUYez2ydqjhlCSL1KV+S/HoR3vaKeSwofWMYyNcviWqZj1/k6O6bs6RbPfenx3lXijssJBtBt9kRvk/1BL19qF9S7vwPEKjlvToJF+1QDXOeQpDmZq1heG5F0mInhwZKXgJPMpeUoxvaMXBa0jm/MA7arUgBJU4h8PBBZvnK2pu9rKqXmkOSzr1yG54MozOsDEC1NjeE9ev3QeXk0jV6sBQfDtFgWAHVf7aJii0KjeHb9LEcO0i0ZzC/Ck9+mkFoDhzt2BS9XXATCgNrfhMlo29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIkn0o6z6elJoXDPpZpC+LnZyYIPIUiq8qr6l6jymJA=;
 b=modaCuohB/OH5VQuJnnSBui2Ub74XErG+kbcXsBRwZbXU+3Crm2T9xHTV4XZxs73inqcbZPrdgfqfK0ZNqD2v2kWFruj11OWmxzgBYPo+cQPRnmkbHOd3zP50sUYSkvxnhs7O4339pSTkJXR9ClZLbuIhFG3Th9m4ezVGtS6++KtetrMKqxs/b+E9z5yON/jDdYOvHaRyi5MNJ87nFtZoPPHoXYrhaPLYzFwJk0gur06PYmbbHhIuW6EhXebk4k0pIeGMW2Con2kqKX1lqXm3lluo9cgFV6SJtc6W4Qmq6sOxUdUUXeAbbJqnzDR4U2pfJZb0rwHFO1SSEsEcwrHPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:14:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:14:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	tglx@linutronix.de,
	vkoul@kernel.org,
	kishon@kernel.org,
	aisheng.dong@nxp.com,
	agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com,
	francesco@dolcini.it,
	frank.li@nxp.com,
	dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v8 18/19] arm64: dts: imx8qxp-mek: Enable display controller
Date: Mon, 30 Dec 2024 10:12:06 +0800
Message-Id: <20241230021207.220144-19-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ef6c74-3539-4ee4-0274-08dd2877ad74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tdvyKL8yjTlUvawc8KonBeqijE/aKMJQerzbLCcD+7KbFAcaiBTsUEaXQTat?=
 =?us-ascii?Q?AvayvEsECDPTjVgyIZ+vg+W5LWG9yPOp2GPgp8oTvJ3WDjowizjiN+WxeN3p?=
 =?us-ascii?Q?sY1VH5qCjr3T+miJDf+GAHxyTxKAvTfUbO0nAG11cv8Ud7NcYLaMaO39UMAf?=
 =?us-ascii?Q?alC+I9JsFuYmcBvoDqvXQUuWffroQzGk/FTSa419DI7kPV/HHuOFncA8OyNm?=
 =?us-ascii?Q?SZrlPjvOyrmmcpBReydu4G7ocLOqCwn8LYBOmr/Q8p/rJrnHrNeqLEFGChi3?=
 =?us-ascii?Q?fAfgSugJRa7jVW6klmHcHzCF6vnsdXHI3mlGXZfFOiahOmYoWRu63GfbnCJQ?=
 =?us-ascii?Q?Zl3lsl7HQYnq0oxh5sv/UjpFBxubrof8hvj+DGsNI6DHokNCBRFb4/n4ORBZ?=
 =?us-ascii?Q?wPWO0D0kHapa8GhBcnLvKuULdG50hYnZXEms4BOsT1PI93RDfK0PYZfZPDAc?=
 =?us-ascii?Q?QL7V/skzzn8MMgOrc2L+cLi0SPphrdf5iOk83UZsuIjFUcwEXrm3BDvTzejI?=
 =?us-ascii?Q?JfeKMF9xJT+x9Gr2va3SJNg7+dseFpzPMzqDAlVqUYYPV2/zNr28//KYOOCw?=
 =?us-ascii?Q?18VMpgP3Chi1gvd97vgI0vOZ9OL4YjHWUO30KFGuQL9cHvdq1vy3o3IZhBuZ?=
 =?us-ascii?Q?37836H7BSBf023FxnN1Lfl3mszAlCSk0ILdLQ8C1FZ2IspS5GnSIiZw0bnXo?=
 =?us-ascii?Q?cam90ryLtSt+pXkhE18fA7XZ/e0n0SieXnQpfl4eMjWMt6qwDphuc+j0o2Js?=
 =?us-ascii?Q?gI57M1JiezKnsfJUq7AjrMyeKYMWI+laCdJjIt4p7n179VB/ay8zGmO5O/Dj?=
 =?us-ascii?Q?qvm4K5547BPAj+21KMMZ5AfyXQoPc8fkX04sts/ptgg5xqvAt5dv2I68T/lp?=
 =?us-ascii?Q?F4Cz+JVHfmGqQ/QGvjHsR4kmGb7wxPmEabTHOw4WZ8bd8tIcl6ahMZMPFoLD?=
 =?us-ascii?Q?Gi+q6LPXvxve0TAVpy4qs9H9SYABZOV/XbplNUHeFzpxGfypa1IZ+A3H21ne?=
 =?us-ascii?Q?1ZvzL6aodkzSCh1shK/MW24XPVn9TBZUvYv5eYyLjXKPwd16rjOisx9gsnz1?=
 =?us-ascii?Q?8fZvyCGuJn7JwZHJu8w1X5gfO6y6EERW9s7Phuusd7s9TsjzX8ANJAKtyEGP?=
 =?us-ascii?Q?eUkPuKaVe2c/1rH7t1QHG7dHUL3FCCoDZQxc0UyIzZqzjLfVXHY4WCBTjcqj?=
 =?us-ascii?Q?tmKsLjrNLOLtjCwIoOBUb3CYg0PHW6SLVo4/S+8Ekcux1PCG4Tjzd4a5HNaL?=
 =?us-ascii?Q?y11K2Ww1VyKhFBAjESRvzlWoH5JsEc8YlybftxhuX6fzW+DRBrSH0uGURBvH?=
 =?us-ascii?Q?U1d9Po/fKcGfJ46W/XC7bAJpkkmjhMxwjTy8Sig5Fzv5c+Lv7gulVJ4optEr?=
 =?us-ascii?Q?6gZkBqo3+A7nMPzxxUbe99KEnudKWhZVCCYA+dOs0/HplOWdA0JVEa8w8biH?=
 =?us-ascii?Q?23Mzk2QhEhTWAAkZd4tcWNjacmzUSpfP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R1nOIOkgjcoFfRjryUxRjMO5vlnkFrLI1b/JKJDS+KycdzeDmuvj4kYBtTnh?=
 =?us-ascii?Q?QqKLETzggBGjhlnT78oadmrdIMSMmDN8XeSvstO3LpF3wf8xA/Q5lYpXIqgf?=
 =?us-ascii?Q?xFQjiaY21ViVAXrm2IYdUsiXEv5Ec3dkNp612VNtvz/UKKQRDSDBkNwhB7ML?=
 =?us-ascii?Q?XBqJFfrxvwD3zHTAuMJjHcXXeZO4fXLYRhaVWqkubCvfz9PtO8I6jbcSCJse?=
 =?us-ascii?Q?544Mwr1XbMgdiwAQ1JpSWp4X2q32tYc4NSXjhEwHF2BjMo1tOmFLjVPm//j4?=
 =?us-ascii?Q?Mdo/SSLzT9Sddzkd+aoiZ5cNHt6orgoy7bFPOu8NsG1y0GPQTOaOV5eMHUc1?=
 =?us-ascii?Q?yyPuCbhl8IeBppc7WABnC0PlPDyy+AuxCHffvPtslnLCOGqKhaSzfTwLv8kW?=
 =?us-ascii?Q?IrmmG5j2eJfphJLr/viXuGqWZG6zrLI9ADjpfbLBAN/uXGsKNZuCOjnSxOix?=
 =?us-ascii?Q?QIpCF6iQmeMy3Y49jAynlr+HmxkXOPd9lcB/Ri5dwyKtvCq5U3aKfd6Osp7G?=
 =?us-ascii?Q?TSaYMqpgQQp/EGrzfsaARFJWapsPXXsnjdfjyXK0xEBrGpN0ctHskTz27SVo?=
 =?us-ascii?Q?BzLkGU5UsA3sMm9MqvuZB2e9fct1UOQ3Kazq+1PSvQ6/uYPfgdwaiu2BqXb2?=
 =?us-ascii?Q?5h+vHpqPBGtmsvKVl8dMER1GCX7FuoryRL9pdAHrEJeb5ziSjvesYfqjIA6S?=
 =?us-ascii?Q?FzwBSGxUh4HnwH6BwX7Nh633VYZbydo9YRUL+jUtkF4pCwoxXo24DssCwt7z?=
 =?us-ascii?Q?Z8/UnlsYVDnX3s17Rdz5X9bRg+q4AgCHSNyGIslab20vJcEZj50G7tPlPTTP?=
 =?us-ascii?Q?qUDLczhrGJUFJYcWwR00ihzRso1E8B1hiuc1qE+IMwc+SWSFDJUDCZZTZxwU?=
 =?us-ascii?Q?jzqYspvwiyV3cPkF0YG6EzDr7nWZa3J8UZLrGeYfbBQcdkxPHIdUR6qpbfmk?=
 =?us-ascii?Q?nttIpDIv2VLg+3jMBQJA33ADhuCNpUE/Lcs+olWRwvr10V2fDk4JET9ytuo0?=
 =?us-ascii?Q?nt3UMXJJDtsSByCE/b8li0evrd9cepKUq20CHB3Ido1OGVCu9eK9W+ZyCT7w?=
 =?us-ascii?Q?9krpSc3LGdnMBloBuQpkUoMXcll3s3VVNQ8ashhcsWEAjTLfj3rj6QlNbzU2?=
 =?us-ascii?Q?vYM8dnrkdByblqSj8pC04nWLPr3j2w2yxsh2fvFCrPovl5kWy9BVRIFAXgHS?=
 =?us-ascii?Q?Rqv/mLBGtYUEcFffdT2k8tT71XDcWZ16IykPIpQOEalzwHlFndxvVsG3fwsT?=
 =?us-ascii?Q?IbhUf9kAUXlhiFEmKqPZIK7QcRgR9WDZJ3ZZ2llyOQNw5Bbj15Yuk/gjltaH?=
 =?us-ascii?Q?wuFlAIa2hrpEMOWiG8d/N2IxFv4Rclydr5FmTDGwKNGUntg5s/9pGqfKznyo?=
 =?us-ascii?Q?3cFvHN7l/r4/U1RlZOWtltBwo/JXHX3lgPooU4MSbvL3XOEcalEJuk01EukP?=
 =?us-ascii?Q?LdiCFqEwG7wcc4xEF2dDUa1swrL540hTlihSIg2tVBjo91iyMl3VhWkl1YsP?=
 =?us-ascii?Q?jNv5yPOSmM2wOeskAtNDQXiPGcx04XwEl5yeRS0AYsPdnzOgSb+Uyo47PjF9?=
 =?us-ascii?Q?DF8l74hO5IN8S/K8ACE7D3K8kvOAVjfE6XvlBqN4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ef6c74-3539-4ee4-0274-08dd2877ad74
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:14:23.6132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAgmc26FBvf2YvrfNcKAUQXCLPmpc+d+Opoga0w6CneSjku1WkNQUvVj+jG1z8nvljGFrn+oJfbnyTkk+VMflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_181430_795778_60A16C67 
X-CRM114-Status: UNSURE (   7.88  )
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

Enable display controller for i.MX8qxp MEK.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index be79c793213a..c7b4015c7bf7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -234,6 +234,10 @@ &asrc0 {
 	status = "okay";
 };
 
+&dc0 {
+	status = "okay";
+};
+
 &dsp {
 	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
 			<&dsp_vdev0vring1>, <&dsp_reserved>;
-- 
2.34.1


