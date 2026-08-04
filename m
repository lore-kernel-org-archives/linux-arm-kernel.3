Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F00DC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THnQgU6SO/uT0BMVGMQ45Q3CC9IQ9ofP7KwCt2XumqI=; b=xzeqwt70osZOGvG3wJQdP3QVp/
	iGx0Jbc+UvN0Dh4dExw2NJtC2qgbWLNUdc5UL8T2D4DKgVZ5dOMoaWw69OnVdcZDRQMRzAaNBcl0C
	J/NGq6I/ybw5cpmzkNGHqsa94TvpwPK38sCTeIugY2KDsMh3TYlvXHJstRsO4b2zH/w3DBh3jw7hj
	yBzc+BzFn/znEt8tXPEu9kspnb3suvRhdlwkVVS66gRhQJzE8dfE1Gmu5EKnxGClb1w7WN5DPNUo/
	wDntt3eGUucNCkEPXQXlLR5NHYTuPkWUTCBZdTdMApvuELE7F/7WCgcQE+IJo2eIoRRy1qH4q8eBI
	54zOPBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFzH-000000022sf-0zqL;
	Tue, 04 Aug 2026 14:19:23 +0000
Received: from mail-westeuropeazon11011007.outbound.protection.outlook.com ([52.101.70.7] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFzE-000000022n0-0fqu;
	Tue, 04 Aug 2026 14:19:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Me5butsgJ+T76saOCRx1anCS0Dpc0B9l3AfB9b+zQPdiOO10IZKBCeG8Utyq6xfl8CNYSaM5lG/jE+f5QwsSWkyvyBkEB/PucmwidyGsv/WUYb0o2v2WKLHDAFXNR8/0TW2eMXFrMT5eHCAVvTNVGWspceSTSxf0iupsb2mdiA5cG6wY4CnoylInhpHReFdMthSrIBQbnjrnCz4rJtgD7XRr+6+HN6wLzSA/LYpJnwBoSWKJlPGIHEjpfqdWpKmnLowHJsQbI2XbPJn1O2/0KbBaOjFdGdMDIz12v2oG5GJTBx21gs0/0y4ytuq4Ms4KrsLjpH9LQwneMvTZJHeiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THnQgU6SO/uT0BMVGMQ45Q3CC9IQ9ofP7KwCt2XumqI=;
 b=dMe9tVlhsH7OPWE4GT38DlDrUZI1KhZqeQSNALN9fxsbnU0dyMbiXr+m18pyYT+Y12XY5W+WA/IRr/PR5NQuWDAdubUJIF0W1uXP+dKFgFhalVR6Yadk8fgB9AmqZcnUo7ws7qkJzjkcCgh/QsaxF3JJBvmWisF7is+Bur86Vc/O1NnY06nIsEj9OYiG3rUo0iu62uuz3jUL8X+cgf/MoIKaaN8wD68hEuZr+fIARLFT0eL+tpNpzMz9wD1Wm8iyWTH0smUAhykxp8yCR4amnkCA7BFihDbFTmo2aXSMQmlyad0NB2BkX0qDxxo50cttfOKhruy2sao8UfuLp4f92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THnQgU6SO/uT0BMVGMQ45Q3CC9IQ9ofP7KwCt2XumqI=;
 b=ktjdRbILmZ4dqjyLILY2qmmDJDVF9SHmGUPhmQDec6Xk3P2/p3rnZAifrKg6mGFbbNN+e7mii4Ru6X3ga3GrV3Jntotr+TcCsv7uorsU9YVYg0irbYRfhyBdCaMSSKovsiPDYdcb5HduC3NYT2rTQeJIW1qZ9UNg2VUY8IGpmxXANOtRAbtn1f1Le1QIS2K/Ampn35LUxVKI86/LNlqAkLJc/uwBMKYh3wXNAnlb1eEPWlAnrFBwVXA47EcaCL9zrObV4Mq+Z/3hzIqriTCMmyjzA9pNidBq/mzxwYM/kcxMxc7OJJL8Db3r1tOLiGI9cgk0+JhO7E94GU76GkMziQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:19:15 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:19:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:40 +0800
Subject: [PATCH 05/10] dt-bindings: mfd: netronix,ntxec: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-5-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
In-Reply-To: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>, Heiko Stuebner <heiko@sntech.de>, 
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, 
 Zhang Qing <zhangqing@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Julien Panis <jpanis@baylibre.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Alexander Kurz <akurz@blala.de>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: a77634d4-9194-4812-84f9-08def2335cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|19092799006|7416014|376014|1800799024|921020|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: FetQE89x8FLbTrtTwFTh6qLZtI5O73IfAmWE0iClTZp4TdCoAU89EMW8c/A7EWNpNPtCm9R1lEE9fKcLWkpTZfKilFsi+n0WdO2x/SsJT6xrWq7zQXsbWzlLWfiKgQZFmHMJrS1g5SUJaTmj9hMBxZQ739Q30e3SN+wiUAVMWtNGINDIzPL8Mx44aiPSSJta/5ZZZXzaRtWub42EoRDkm+uom5ByfOADXB63jSMhmXBd5wGx6Q2Z9stewCl+3rNztr7hzO36S+TbWEHIFcF8OjcTWEvzi/rWN51n1w82cL0YatTn4CtPbM7KPVaKFBKOXA59XlxyeQ2pl9mH+EaXVzjddbhM/SpBYkyvQhKnnvYVBOAQ8y+LuFJa1M3qwp2BCkjonROpTP5xX/tPOQgBnZjjf6Ed/D+repxiBnW2u24XA2g7PxIckrd8GiEcAgwW0sxVleb9TRJBSk6E7ha5MeIgzCmPdsTRdwG7sLxhp+eSJppXKL1O9cDoI/TC+KSfcoEwAet4y6/YmsovqHfqyAR5Fmm5McE+9qO1r3jt2svuLrzAJZH7LiIQS4SBanbqyp78ohVsko+6b0qfGFyOj3y1foONUEhlh/tycQOP5DXz+mGsB/XUUJ6/Mwyu2NKAzcwKZ8fWVW2k+KCbML1MU22t+rTMLjmuiJDPc8z8tqREv2jowT5PKxVlA8GfneXhQ6ZX4jPF3A7MNynvRkGXKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW9xR3ZNS1ZrZDgxM0luRXNjRFFCbzN3aWdHQjJYWk9SN3l3OUovRFhLRWoz?=
 =?utf-8?B?LzBCUzZCeFRuNDhiS3FNTWl4a3dVTVFkQkFRSDNUcGp0dTF6SCtlS3p4cmdp?=
 =?utf-8?B?Y3RTeEFSUnE3dWh1eUVva0tLRTF1cXczR3BkbDVNTXo1MUJFTWdxQ2ZCdFk1?=
 =?utf-8?B?cEVvcDZ0RFBEM0xxcHd0NjhWSWhNdU40SGM3RjNFWTBYZjF1bE5iQnpPUjNE?=
 =?utf-8?B?cVIwaUlIMUFLODBrTGxieFFEazRLVlJmR0Z3dnpuUjAra3Bjay96dlRzS1pu?=
 =?utf-8?B?MFlnVmRDQk9MNHh5OHpDOHNJeWcxWnpGZTR3djFFZm9PRSt6aGFrZS82MUs2?=
 =?utf-8?B?NGJZb01iTTdGZ05MYzgvditjTkIvenlYMlpXYnRxWWc4cENURVZ4REU1ejNQ?=
 =?utf-8?B?alM0RGpaSHFXNGkwVjkwOGUyd1ExaFRNV0w2SUl5WVNMaVNyVjZJVzNyTlh6?=
 =?utf-8?B?cndOYW5mVzl6RUVwQkpWUHgzZ0VkNmhRaUU5Uk55cDh3QW1kTzAwUnc1SjFt?=
 =?utf-8?B?QzJNSkZKTTdXTTFDeTRLNXUxYjNWQ1NwbWh0Y2VCMzJQNnRlTTd2bWxiOEdr?=
 =?utf-8?B?WWpoVWtOUmZxcXRBV0JrT3psaVcwRUlzWlIvbTJ0Wm40YzVtM2IwcTlJQUNh?=
 =?utf-8?B?SVQweDVOWUhrRGtIOHlWQW41SlExM3B4dWlCM3BrdE10bHZ1bnRQMldGQ1lS?=
 =?utf-8?B?NURNcHg0elBhUGNpN2xJVTN0ODVobnd1elg4QnRIcWIxNUVjUUFZVnN4dlgz?=
 =?utf-8?B?UFlWc3lFK2ozV0YvVTlJdStJSlZWRHY2aG1kL3hOd3BhV00xeWV1bU5pWWUw?=
 =?utf-8?B?cjI0TGJBQ1QybWZ2M2hRNm91SWFaUnhqZW1rWVRKdFBacFNyNzlNeFYxeUJk?=
 =?utf-8?B?Nml0WmZYYnhCYWxUNWR5VlIrNGFpUjNYcW9aM3ZVQlFGR0J6R0p3d2c2RzhO?=
 =?utf-8?B?aXZKbVpFODlPd21sSXNERUZoQThJU1JnOFJSMnZ6Ti9UMmNvUmRLUEU0Sk1J?=
 =?utf-8?B?dXhCa1VaSDZqb2NFcW9Gb3VTcEkvcXQ1SVRnYUh1aEJGN21TbGxYQWc4dlZy?=
 =?utf-8?B?azlxeFJDRXBSS3RhaTRJNUlaV21KYnE0YUF3QkZ2SzZGb3ZzcVpna1NMKzJX?=
 =?utf-8?B?KzgyYjBtNXNOdEdFWmdCWUMrWW9rb3lFT2huNXRzVGc1MEZwc3IzR1N3ZWUy?=
 =?utf-8?B?Tkw3S1BWQzF4YStTMXZPSnBrejQ1eHoyckpFd1BPU0t2d2dOR0Y4QVlMSTZr?=
 =?utf-8?B?SWFsaGNVbnBRMTdnYURZbm5rejB0Z1U2VkVOelFmenhqSkh2RDk0T0kvZFJi?=
 =?utf-8?B?enplTElKelJnY1BZQmZXQ3FRVHJHVkhRcTdPNnY4d2hrQlQ4d0tTeWNscFht?=
 =?utf-8?B?Y3JJSXZtTGVDaGdaVk5hWDlyUlNWNFBGa1F1U1h1UHFZOGNNQmZwbDQ3cDg5?=
 =?utf-8?B?dWhMK1FvWjg0aFJCY3RPN2pCay9MYVR2bWR5L2tDYUQ0SVMvWVJoaStxOWMw?=
 =?utf-8?B?Z2VyZjVFaFBHa2ZNMHI5VjRidEJBOTZNTnRmRXgzUkh2ZnNEaUNaMWsyQy9p?=
 =?utf-8?B?dlR6aWs4QTdaMStnRmUvN1k0bmIzNmhFdTNnR2JkKzNHS1lvM205YkwybzQr?=
 =?utf-8?B?SHlTQm5KdXVMakFlWGNHSWlsZkYxZXZ2Y0NiNHh2bjB0TlVPVlEwVXNWak1D?=
 =?utf-8?B?ZVlVVVJRRC94NEM4SHJ2M2hlek5BQXVQS3J0K0c1ZFFzVk96U0FGZDVJWFdC?=
 =?utf-8?B?eHV3eUM4ME1YbHBNeXFhTEF1KzZjZjhuTXRCa2ZFMUZWWC85dGViaXQxa1NK?=
 =?utf-8?B?c2J0dHBrR2hnVzF5alhFQ0k5ajh0bXhaRkE1UlZOd21MYmZmdE1sckt4cXFu?=
 =?utf-8?B?ZGpjSjRnWGdXd3c1cGx2RjFYamRhQkZ0Rjh3RHdJUE50MWdsb21nMk02VGIx?=
 =?utf-8?B?ZmlDaU5heENsOGlDQ2d1WW0zQ1JSdjVRVXlic0h2eXZpaUNVWmZiaFRraE5E?=
 =?utf-8?B?M3l1clRWU0xLWmJTRVJyNlY4a3ZQTHJjS2VULzZlUHJvdWNZU3lsV3BDbW1w?=
 =?utf-8?B?emNJQmd2b3hIY01LdGJoRVpnbG5rNnpRRTdSK0xMQys0ODFHeklIdmNNQlVS?=
 =?utf-8?B?K29zS3JLbXZVVWl4bXFFUk9NcDZSdXVldklsbVJiQzFNTmxVWHpFclpkeFFS?=
 =?utf-8?B?VVd2Z2twUWdBVjI4VVdnTzdUQWNvRWVjS1JjMVRMQTFVc2FrMWROUWZKdWFv?=
 =?utf-8?B?YlRlajFZSjRaUTBtblFKL3l1MkJkbG9mSytKNkwxcXU1aGpxUitPZURSWmN4?=
 =?utf-8?B?Q0ZsRFEwKzAwaCtEWnJ4dEZxNW5WVmVyaTd1S01YSDU2VWJjbUNtMnlGdmI1?=
 =?utf-8?Q?ZpHz81W8YBQgCjlQmwSxdSs4rbEK7v2MSn4YN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77634d4-9194-4812-84f9-08def2335cfa
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:19:15.1371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8bt7JJ6W6a0rK+8aS+gcdluG0aZr7BKNrFZ4cZIdwxlLeuhhiIDSS5+DEKzY5dkCcNC1D9D/FA/pGI9uGUrlRhZM6vp19XLy4w+Kra9T7yLHmGhztjJL7STKvDNebhP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_071920_212960_CAE4E908 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
index 37fbb953ea12..2fa8b797c0dc 100644
--- a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
+++ b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
@@ -13,6 +13,9 @@ description: |
   This EC is found in e-book readers of multiple brands (e.g. Kobo, Tolino), and
   is typically implemented as a TI MSP430 microcontroller.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: netronix,ntxec
@@ -21,10 +24,6 @@ properties:
     items:
       - description: The I2C address of the EC
 
-  system-power-controller:
-    type: boolean
-    description: See Documentation/devicetree/bindings/power/power-controller.txt
-
   interrupts:
     minItems: 1
     description:
@@ -42,7 +41,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.51.0


