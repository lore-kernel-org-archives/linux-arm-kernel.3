Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79CEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 02:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Cc:To:Subject:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuu7HdPL7urpx0VGXDa9tiqXVY5wLlDcsJpbpPRBtRM=; b=QGUglD10J5tiD17BLNB8MvN5Xh
	PCbNBRB5oMp7hZFMmqDC+7qMyJIRRvV9qvnY8qqguTsqcYofa9LWE7qIIfir0jDYkhXMw/NVoNRLt
	JelouuWvnjSe7qYYeFxiOVjqEuR2ysgMPJNnGo69YHad4ZB8OvMSNHD3iz28Si6+tt2iqpo1Dga9c
	b6rrNRh/kWupjKalXivZU2IvDPOIIoC+im6wk1CfS7806yv1DNm1BfeiXk2TeoLrKcmJLYCTynOS1
	4VAzP+0OGcXe3f00kss3X3+hNlNPvy31bu+rGa/uf5hLCI7C2rQXg6Y73EIsqEuuhJ9d1Cyv59iIy
	9C4Uazzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRM06-000000061pR-0AA4;
	Tue, 17 Jun 2025 02:24:38 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLxi-000000061LI-1z94
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 02:22:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amuI4V0ogKz6kdH8JDbB2RcnW4JNoZSCtxQF+HekfR+SAijUAqpdZ2UJHvhzsqL3LxG6ypBksW0Oy6nckJoFcGF7p8BjudU3kooJKS2OaW9+N3e3VXYgpZrRhTUJ6sNCB5k97tWytDhm6JxzxOMS0OcV5hSbBcMXa/JXHxRzqQcuTrZBkUziyB8gYo4IC7FoM4fGqIHPQwiqOg/5aUS9IgS8XtYyx5iTfaP766lpfnpXYV0ZMpVyU57OrTe+OD6qrWH1IqPRAWM29eb1WnCKv+g0Dx/a0cNEnIqjPMQZBpNniv0sqRWI8EyYgrppfRQuzezhcrSA1KsiuozsJS5fJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuu7HdPL7urpx0VGXDa9tiqXVY5wLlDcsJpbpPRBtRM=;
 b=o6HlgHv2T76vIxQm7h976yVmMkJpWiaSKv9/xWUKQiTUlzJxEkQjx9HW25aVbqrPlTj2Pj7/15+uy0dFZaDi4Yw/QmvMCVf0aH+IRw34cTAn1f21edkNei0CFIB7vWLUacFy1CvY0/NvYg0JKmcPbf+nWCQ2EkCDjjf8JtPBjzcRsh3SjdTbwhXnermH37XE/AtPB+S5Xxt8aXEqJBk0p3Jz7O7U+dXwLioquz5Qjgk++SiJTvWu4KGb8Qi+RPJgMcwn54o8ErhB9bCiyFSUzFMaPx/xwTJlYbq85Th1Pcm3UML/BjitwY1N2sOjTnaLXanoIGYGM/LjhXyO4gTX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuu7HdPL7urpx0VGXDa9tiqXVY5wLlDcsJpbpPRBtRM=;
 b=KIqqHcZEVXUyuRxGDc5BE8JBI1n9i179T41zINfabmdpgG92nzxCh9+YFS4n/l8/lCIiFuDhcLwVptIFIoUTLVEoWl9H0fjTAk5Vy0f3jSaA8MyxOVnj1BWLMHbu/af/lO9cfjLRfClqeiSJtFxcedc8gqgfG6O0Pjc8xmOYjyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9689.jpnprd01.prod.outlook.com
 (2603:1096:604:1f1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 02:22:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:22:02 +0000
Message-ID: <87cyb3nm45.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm: orion5x: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Alexander Clouter <alex@digriz.org.uk>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 02:22:02 +0000
X-ClientProxiedBy: TYCP286CA0322.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d14390-b3d8-423b-612e-08ddad45bee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EcuaVBS/ba6Nl5Awfpoj0ZH9bo6jPFYD01Ag09AC9BefXcMgOETNQWbOpThd?=
 =?us-ascii?Q?2XCjThoUpQQDSayDb+gGf79Rt+KKy7VxKOfb+Y0xZT1TLKRgHVnVQa7bz0aw?=
 =?us-ascii?Q?9q5QkLTbb/wZeb7TEiqdQfZvdXC8oFuzSNsPCb/DJ4r6gE7EsXFolVdF6rMi?=
 =?us-ascii?Q?gJA+/FcmwhxkEVxTv5W2PIlZsw6uBh+FgTbPSZLN9mGnTPNzCtqrCMmhaaA/?=
 =?us-ascii?Q?jHtEL5wh/mrm44na0c9j3HA4AW1ybI9uY9Ww6od3jKh9Wgw6dP914E2mrzV8?=
 =?us-ascii?Q?VxCwu4QW7qoJqX6J5bfOCVG1kbTGT8d0HKfCdqLi3aQIMbqO5eiLhbwHzpcd?=
 =?us-ascii?Q?Gme3NcUGFBtqIsLRSsVjy2/jGv9cyQSlqZ9TeiPo3Nqfxoihnaf5DWe2lsiH?=
 =?us-ascii?Q?9tbi/d3LoAbn4N1Cy03RrAw3mCtKSikFwaplY/VnGkCzPKdX0LRbLeRkWTxF?=
 =?us-ascii?Q?gNhEnsuhUZPSvYoHFloTNvcBPqQh69PvfZIf7YWUFtXTueUQ2Sb1l0M1DXVQ?=
 =?us-ascii?Q?xS28L7ZJLfgY6Iec5oBJwoNnnbbOVDzfFVZsAmNgPj6y+QxcyvqDOD6PIsaz?=
 =?us-ascii?Q?/U4eeozyp8eSbvOaN1cqJh7Eo2Pp9nhTvjZHf1L4aSASjfYVEttyDN36u2ZN?=
 =?us-ascii?Q?b5X9QgLMgh31fhAuHIEW4XQ8u/6uD3uuYSCeO7YCREshWlsbUa11NJf7otua?=
 =?us-ascii?Q?rEwY4huyE4JfMSIuxIQu0K1Vrc84yiRSs4anvYc8gscwSGi0uA97CixzXczz?=
 =?us-ascii?Q?7t4Vq4nvBmcx7FlfMv8UghoFkl/e3YNTJL0JzANrLj9DQNLsPIirj19S4scu?=
 =?us-ascii?Q?ac4uJOR6+T8rklzZpFwvxZZNC8+/OB+9jO9uANmJnlJk0QfHp9aRV/ZKt8fI?=
 =?us-ascii?Q?CMBeR8m/wELbrPjKzTA1RW2tHY+Rv+itB7w3KBnEDxDlytSdg2C2njLwkEMd?=
 =?us-ascii?Q?zevUuyYaeRIvOfRxhtpXrm03l+rfZYBMoxfrm3F7Zt8YS2hEvR09IMAAav3O?=
 =?us-ascii?Q?1lP7L2Sr5hfppWWFdyvUXRAh4cPQc7VdBVvNtBM/RJHaFaKh+Lf/QjVSwyzs?=
 =?us-ascii?Q?7kPc+Wm9cSixRh649XzG9T7TDl7ocsV1x/w+0SYgjXEyycsl/4/iybn9EP9b?=
 =?us-ascii?Q?eWQBuDXwHXODpTbIxKuch4dmXAmIo3Tw/ObIlAjFi1Q2t6dJ3TZcFrRsw/zl?=
 =?us-ascii?Q?+5vBsqiNC76v7pZ4tfabXo0IlZL5dUd4gcw3Ai9tudFfOXVFoZa72zYDQtkY?=
 =?us-ascii?Q?rWldqdc9v5KP9Lb/L0CGdi6ufuU+csj7/FLAwksueGVjzErq8L/SAHNYeP/+?=
 =?us-ascii?Q?M2qicw8trooNBC5iol/yTi2i82R6r/mpm59eUgHWPYmpI5oKEPFVszQS+0SN?=
 =?us-ascii?Q?xRPzAel0JKcak5LprUgiIfbqVDaTYnYiKtyMtLrgKXkSRqhvjz6FOvPVJVET?=
 =?us-ascii?Q?b3yphVkZSsI5137YMSiYdLkdjlwJ5zmtH6ijnBjofyv42nTKf7OZuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0odmEaJd0suJL2aRubYgRvCOJBhAKUMpzDY1JZdfv7P+rTpT9U9KkSeGbQWG?=
 =?us-ascii?Q?sNj1htOPUeBASCIMwO9aEYu+3QoNdMO2zVchPHobffbcucm4BrgzRJgZORFs?=
 =?us-ascii?Q?p7+wdgqqOQgZRUa3wmY8mApHCOujiInfMm6K7lk0utZ+WObIbccn95ZpKkY4?=
 =?us-ascii?Q?UJUsrKrJYv1A5L9vvCc6/0Iw3z4b8IJeqoXzOCpa8TzLGQKxcEzyRMwZmpaa?=
 =?us-ascii?Q?YYz0lM0NrTRbxd0BZCQiMSOQpAlEcEMpDZWnviws6V57r4zx+icb40cMDomc?=
 =?us-ascii?Q?RBEh5sfNmY6L9X+OuTBFo9mzQ/yonnXfqcvE1NnY5xBooTDkAnfbz+4g1OFh?=
 =?us-ascii?Q?YgX3GSmsUI77L/zEYupl3b8ktkCTlloX8sSaGZGnfOxAQr8gg1Xcedh2JmP9?=
 =?us-ascii?Q?horlv75+ozE+evtye5zw7sdjIJKN9fPhKDb9Gbfe28P5o5XLFyOmIwM4/z/1?=
 =?us-ascii?Q?Zlg1Wk/gxsQVuF/m3FCpyq/UEMjuqEUCMSUtbw/1gzwcvbsv7B5LY1UmLVdT?=
 =?us-ascii?Q?mf1sAoqW0OT5sd6v4Hks5hTQ5OoqYj9LyTWbZeFa6ZFyJmK964idjhvSOiG5?=
 =?us-ascii?Q?WmTgo+5a4Dibg3rAphzlHy/Aq3M/RglqHNZ6Dl4Ln651FRMhHhPMAmC4Ldi/?=
 =?us-ascii?Q?2Cb1BrAWK9UC1lwa01M7t0er3WSCZcRuPhUygHSrIXZVdgs4BvTe+1NpBi1Y?=
 =?us-ascii?Q?a63QNPK5UVtETPQAGlBjUuZkR+neD1AiDV2TAK7Cw9v0un/PyntN85cRUhSF?=
 =?us-ascii?Q?PnkAVV3DVJJWz0LJfT0Cg1KtNHQr2So48lqIciyIW01gbpr1jVPvjy08h/H3?=
 =?us-ascii?Q?1WUaqO42u4h0cuUZEXHVLotSrcSiCVaTHz1u3NLD+RNacU6TGHeZ2Ph0jvFI?=
 =?us-ascii?Q?1J64/cnVC8NEDrGBXuJqx1uWS413Wjl5YPWPGgVgKhoeQHRrMxKHMQ0DfCma?=
 =?us-ascii?Q?YFXzSTrxmofPk0XFz40ZfutsKUItBn5fnWgRkQH0vp4YTaPbNmMsWt58EJ83?=
 =?us-ascii?Q?2QHasOiuwAmDgw+fo3HXdKCWlSoRaEDhyWk53L2syPZjgJ9AHjJpjay7dWzt?=
 =?us-ascii?Q?59hID6t4+o7ImoRTbiyWcoWvcxU/cTSb2D5I2dXdRinKFBfG3e+yudFbvi0A?=
 =?us-ascii?Q?q+iNYs3sCfqIt0oobyp25uwO2bpJCm1PPmQ2wuXAZ06vVJFqxH8FAXkf16Z3?=
 =?us-ascii?Q?1Rvpuj/wd9lM9pWigTlEv3XS3diqrhAKuYuB8hK/nV7ibhrGas3BgxZcYbUz?=
 =?us-ascii?Q?VL8SttUPYAcyym5PQRlGcW3eD/qZQkKBY6P0Xs6LWyPCnomIMvFrg1rCDQP4?=
 =?us-ascii?Q?rIu77FJ+unI1JZMU25jp6rBGWqwdNcVQb0AfPee1/F/uahpnDIk7z4XwTGk8?=
 =?us-ascii?Q?EPfAfdygkykjw+suldkCcK0FDGQapP97SbArTWHUow9oecaL8C9ZBUJiRL25?=
 =?us-ascii?Q?3Afa2iGH1TbY+GmGhNaTRP0+eOGccLHln/EnJvuBcXm/KQG3QVmSrwCoqjaY?=
 =?us-ascii?Q?y6kaBKxyT3cx/hEzstOnxbbIVRCjrQwXoy+ua5LDbJiwt1ZiC5Ux4fhEfVxi?=
 =?us-ascii?Q?WHrhEhD4n6gZ7Ci44DFOyC/0fYeix3ZRTcV9P70v4opnJGzxeV5dsnn241eD?=
 =?us-ascii?Q?2TH7erGNyHepUs32MJBigfg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d14390-b3d8-423b-612e-08ddad45bee1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:22:02.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5rAfCjrZfD7H8tYJm4yMqYAzjRMV/g9Fd7IIX05tqz9CjDIsHo08IrpFf3anOIfdnJFDHsZWLy9/HhuyNkHIu/Saa7XhGsPi5MfFT8xAFfLoM0YIomjKFtUjrpxjnws
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9689
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_192210_625712_15C02A7C 
X-CRM114-Status: UNSURE (   9.56  )
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

It updates format to keep "online/offline".

-	sprintf(buf, "%s\n",     ...? "online" : "offline");
+	sprintf(buf, "%sline\n", ..., str_on_off(...));
	                ^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v1 -> v2
	- add git-comment
	- add Reviewed-by

 arch/arm/mach-orion5x/ts78xx-setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index af810e7ccd79..c250703e696d 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -460,7 +460,7 @@ static ssize_t ts78xx_fpga_show(struct kobject *kobj,
 	if (ts78xx_fpga.state < 0)
 		return sprintf(buf, "borked\n");
 
-	return sprintf(buf, "%s\n", (ts78xx_fpga.state) ? "online" : "offline");
+	return sprintf(buf, "%sline\n", str_on_off(ts78xx_fpga.state));
 }
 
 static ssize_t ts78xx_fpga_store(struct kobject *kobj,
-- 
2.43.0


