Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021ACC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 02:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AYhF2oDrdHRMp7Pcf4nuxSe8y6sbTg7F7j2blfBAPWY=; b=Go2cJxfpFhCsMDRsIJpvw4cZME
	0wmqf94V391O+cSToVm2f8Quqhc2Vk8Za5f8FwlcvXEO1CnWxVHf2eam7X3EMivoh57p9o5OO2OOU
	3y36zS3KISzCWq+N5ojSvhkCkmPwSW2qfFtl0ZxvS4kVUFDRnduB5VdONJ2a1asCWNdnh+wifsxtD
	AiiCyDBSvhqJypu0e7Xf22LuiexUJGzWeI6b4/eP4qru51ayvkErFviNa/AEjYXQcm9leC/qLEVgJ
	NpmcLx+dz55FTtBqdosUx4lRD3ltFoZGVnSK4+fbY9j7KTgAv4XcWIQZbj3e201s9E4b7uODKLqR3
	/fKUOqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaRQ-0000000BVY6-3Jtr;
	Fri, 18 Jul 2025 02:03:16 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaGQ-0000000BUAD-3d5K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 01:51:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgKzDaaNLiWVoIrFkWymskaWQY5AVen369fIvP9x0gMTzQH7qRgVLMnM0KplcCzyTY5ZrI/nyjo4EYRN3Fugv1f16glNJei7IMiRF+QT2U5SXmhHNkyuK4C95E68C0i7VmZmkz3Gyy7FE1N67hA9deAMfWJpGdu/CPUskct3vtFKv2M+qDbM+Ee3VDTlV9ff6wbUTR46YMYbfJihjBlaAZbW7e34fS5yiKazci0f0nxGvkii8Q7cTnK6d4AQ2o6F7CENzLTaCRAhfYu637rRhMxdI1HHrhTn/QA2iGaJKHCWcUgEeWqSeERN/FIh3OgG08i+n3dzdP41RDD9H0YQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYhF2oDrdHRMp7Pcf4nuxSe8y6sbTg7F7j2blfBAPWY=;
 b=aow5LFw4BTAJHGCDjN/TfbUKOt5AAxF5JVrMly+W04J0XO9IvPOFO5N9s+4TPKnNp4mNZ1G4mY0pRHsAUnfzskDth5Yf0wVWSboFWewwo3SR1eVTD6zRihSNvf3xWOIZdCLWsHHROd15DGMdK7epRX66gxVYGHPJEnGCzy78G2aB4sR+xDvtISLGjOietsTAVOxcpi+M96wj+GCcsO8szMM4QggzVRgttIAyCJqn/ofXeQS9cW5dk0sppmjspnoHVHFK1Cwa/hxdYXs5WMG/maOI8ttE8k0FZ5hLDyeZdtEsufpffmqvoCMYxhE5Upoe9cSPxuqx4lQkr5biVbaDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYhF2oDrdHRMp7Pcf4nuxSe8y6sbTg7F7j2blfBAPWY=;
 b=PCyvSGNZOVorQYL1L6HnXlMfnDhthlL/bdrraaLl6vHunv/9ErLSWOxl3Ami5SInQMc0UV/W20L0lwosHXpdWLWHJyK5auoV92e5o8lFFXQeBUhdpqcfg6QK2W6DIXkdsTs9nbTph920qXi6tPns5CTXcndQdZVxi1rwmdynqos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12514.jpnprd01.prod.outlook.com
 (2603:1096:405:1aa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 01:51:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 01:51:49 +0000
Message-ID: <87jz465kqy.wl-kuninori.morimoto.gx@renesas.com>
To: rmk+kernel@armlinux.org.uk, Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [resend][PATCH v2] arm: omap1: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Jul 2025 01:51:49 +0000
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12514:EE_
X-MS-Office365-Filtering-Correlation-Id: 2722f28d-982c-4f13-c378-08ddc59da921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MqIZxapv7KoY0+qLTv5lwsjlMXvrKgU72C6qmGd6j353X4yNQhxnm7NsvyPv?=
 =?us-ascii?Q?lXQhNS6iDmiKRDLluLNmZ1JPbRznoIb6jQRDfqUn1DJ7vX7DgubwRpDn2sEp?=
 =?us-ascii?Q?NPNcsfSfCugSGcrgIxAvn7HGnYx7GEwZqSLZmbzsJqkJ83URPG7noE6n+5j6?=
 =?us-ascii?Q?j2+RQxhw3Kke8pgOClKiCkC+nD3qXf/WVtZPSpGnGoO+g120GvIMX6B3Fr5H?=
 =?us-ascii?Q?6uuziHHgB9O6pwqo5fFXT5aLR6axrci8ceH1BqCdlN6MU9iZHUSYYOe51lDR?=
 =?us-ascii?Q?0Od/KSXbzvO9TJVPmEgmJ/u5/kXQkY0kiRJD4PSVa2XjWB+eqKoXqiHRpMEY?=
 =?us-ascii?Q?6dcQPiTxjSNF5XjSxYNOMWlbS3MOZMqPuRkoROyBPQIYDPZ5WiB3eo/vQJ7p?=
 =?us-ascii?Q?o/nLBxjEc4QuJJUZXTR9wgT6VdbsDEWHhe4PjE9vOkHVGLtscIqGLsnteCaI?=
 =?us-ascii?Q?ZjpF94RtZYckWupsVuBUGQi5p5MiLFltXEOqtgRpDAa9ReazqZL2JY67D4Bp?=
 =?us-ascii?Q?PAncgAmCoANq49uH58kwJhtBxGWNQAQpQiAI5WirVo+zwJhcI2JbJFWqr0bw?=
 =?us-ascii?Q?PwWzGZl0OUVl5lNQ00/vbaUt8pcQ6gdxpG4x3m1w9OMyG9MUlG2xfxQyJIFn?=
 =?us-ascii?Q?xhwanP8ARU6dkNGkDM86+GtUEslN7NNMjknJduxu0pLKyT6bzdEaW/6eypCS?=
 =?us-ascii?Q?o0t2uZQJv7eazPETmfezZTDkZtcI/IbX30LBMH9PeIqt2l4IUzq0bicyQMuN?=
 =?us-ascii?Q?wl2KgHq8ldS4n1hYATyOcJ07sHbYC8XiHlAYMIz5ZKrae6cM6FE0WFhfF7Sw?=
 =?us-ascii?Q?8fkLNSL3Ymo1AHNc0zP7ujZ6pHqM/NSnbbzpOKxZB2QxQi1k9eflJWBnKIFz?=
 =?us-ascii?Q?sy87dbucpKDu5eZe1LfflTMvEPQIbATpTqR56uNVux21VmKJbVrReWUsDvX4?=
 =?us-ascii?Q?HDsczDYqOYXoideZbvquzTCoJrkZ6CioOSPZRJywGKkPoJ5I8R/QTFVJDypT?=
 =?us-ascii?Q?Pv8L91byITH31URHOt3ODHB5phj6SYLYLuZyK7dGd8Trdc/CSdCA8Ix1Go+3?=
 =?us-ascii?Q?r9ivZEHgkakYDS71atg4+nE8p/YOPolPd95enHBi32n27+bwO8KaqmVV0N/g?=
 =?us-ascii?Q?KvnqJ0X9H3mrrqtK8XH1bXUAnCNxQoGkTPVbQE1qpv2VbC9O76b9pxj4lJXy?=
 =?us-ascii?Q?zQ6/Gj1QiDTpUy7zA7bycWiJngLlfyiBTGhtc6tFsUAmYc/Av4o3t+glPmmy?=
 =?us-ascii?Q?llWL6v/dsmzzO3lQo7UjTjZfEwO9MpaxKsjbr0O00wV93OxMq7uER0TTVsLv?=
 =?us-ascii?Q?cBK47XQU38DZDTIh7KqoeKg8Bh183EevvLuG2/kYn7e84E3nWyUiTE12oDch?=
 =?us-ascii?Q?CKchvSDZtYuMc7L3fGY3qgJnJlKg8VHZPyueUca7NDtgbkT8OJXmK0HV6jZS?=
 =?us-ascii?Q?QAcGsVu9yrDen9z8/qZcPTb71lJ+dSJpJAMm5YzlddIIEjoHcclWqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vYs89E+Ma8zTe9sFuYjkfnN6Z2BoX18ZI7ceClsDVIeGhSthaBFA3CZ6/ryB?=
 =?us-ascii?Q?ao4B+8hvUbJwT+zkpoXAxOZ8Fdh9fzAo/wZk055qxVD2KSgc9jbpk4IQSlcE?=
 =?us-ascii?Q?902uPCQnsosApLKWJVUQADS0z5DMciU1GAyxnvJVrZ2YLYqRk1uHGyxlrnRW?=
 =?us-ascii?Q?TLEqMAsgS29z9v0G2ZW+nl71PwJ8094N6KNDU7InquYmfYJ4RwdG6+Ow/2hp?=
 =?us-ascii?Q?c15ti812DBIWvLeCYsX3rUNR4HykSSj4nCWyO1ebsXF/3o94ueR7IC/vb6zG?=
 =?us-ascii?Q?csqaSOp3cx2wyqs3W5t6066UxYBa9x3o65JfJWuYDHg7sfTWAuAt0P+gtZ4n?=
 =?us-ascii?Q?YjbpMIG96+idKEWpCuuGO2t8RCQfdNBIRgJI5I0fOoKLkXb3bsFGMwAWbGHT?=
 =?us-ascii?Q?D2ujSAjXFXMNfKkXWIU5znqyh6NJDATtgevl9RcSqPg6mcrxxMHCIByhiJVT?=
 =?us-ascii?Q?hHVM6OG+ef8Vq53JdBsBmh/u4HAMuLKd+ixg5nf+J5cBQiisbkfETOqdhfZx?=
 =?us-ascii?Q?/NbUopbaoyEVV87AIlP9IlUUKU/JnvFUz1+oQbhz+cMGTnHJ05jy12wtx4s/?=
 =?us-ascii?Q?OVLaTbnB7wb1pCRngbt+dFypcEe5Hhyb7M5C+WJco66dhs3C8h8lpHAc9g4t?=
 =?us-ascii?Q?VoDrXTnbb3eaX1mAVeOzBPVeUc75V0oEA+7fVFJJhskTTbu+raPIoMnX/XDk?=
 =?us-ascii?Q?l74sJjGVas3OmoT9Pe30y4i0vCtHaa0bmbbV+c2NhevBX8klWqQ43xqX8mnF?=
 =?us-ascii?Q?xjEaCrzt9vMBhwOz7tKsyoBhPYrBks/g8Xa5RHZVHRTkAeYYqs1JX0lm14Dr?=
 =?us-ascii?Q?MA59ZRHYIGdXxWlmyb2GdrPXAYi9ho8pufu5jBjT/2VveiTgd/QLWR/OQjaT?=
 =?us-ascii?Q?akegxsg5RIPX0ZevcD73OqFHx927ql3pSLllaIadXGdm9YvAiymN9VxmYWFR?=
 =?us-ascii?Q?lkEWv+CGQ2terWp3TABq8GL8p9tBZuKZErItGFmEkwfLcYQa5irqtKu69TD2?=
 =?us-ascii?Q?MdzWtm0xbBA+n7GzJ2YK8Ya6e5N+BE4fQIIaS5vktpndmLAzb+DAdF+JVjWz?=
 =?us-ascii?Q?/LHMtnXgjxrX9zcCt8hlH1/E375Z7ef+WGGUPGu03BnQuw13HqAQkrxj/oSi?=
 =?us-ascii?Q?JRUzGDSJlisH0zmf1ypZS6OSds/aCkYtRmWi05U0bbFXkuXcUBw6Ve10yOk8?=
 =?us-ascii?Q?qgOxKYZhRmSdL4lxRqsgSQNAz1eOp8Qx9TuzqfV7C6Nn53kMlEeZD2yFYC3K?=
 =?us-ascii?Q?pJJdMvrKbTkqyyjZWR3K5SSaml3zKql3twjv4ndN0Xl+eXvb+DxSK0nDfPIQ?=
 =?us-ascii?Q?lNoY4v/N0GholSeyD1B1J5v4W4howo4tiaRhPKkzoUMLZnSJPwRVpcRCCvUq?=
 =?us-ascii?Q?dMljq8jlDTK0wLbxVObVwDjJF7evx8Y4maBDjp/bWUpjHIW8dg1B36LCNv0o?=
 =?us-ascii?Q?aLzZzBZrhELzfPydcLVjYA8wyiKTm3gn3RnCaK2hmk9JU8CUh5zEA7lQDaF6?=
 =?us-ascii?Q?0WxqX6XRdnGRu+Za7Zw6DPCbyWDVEZiSRZOKPtm+Mj/Gi9AXSS3c4oZ57dNW?=
 =?us-ascii?Q?CsVTQfc/vU4tTRWH2aR3nXqwLeqTyu9uBgb1bdi2dPTvo8EXnhCnr5mpIezP?=
 =?us-ascii?Q?MfdKg7XN4+DPV6wUetxf3G0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2722f28d-982c-4f13-c378-08ddc59da921
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 01:51:49.5931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGU7fun/KoqLfsOovrfh2Q4Dqwa8WpxpE5KJSSaL6RIcaSg+3DJ0cC72wbiQqEWIZ2ju4b6a9uPNul56a0dL21ubwYDSTXp3A7Admuj9FNvigvkaGFioV9TnfTnbxsIQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_185154_905051_63B70A68 
X-CRM114-Status: UNSURE (   9.89  )
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

We can use string choices helper, let's use it.

It updates format

-	..."%sabled", ...? "dis" : "en",
+	..."%s",      ...  str_disabled_enabled(...)
	      ^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 0daf6c5b5c1c..2e1c235303e5 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -761,8 +761,8 @@ static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
 
 	if (ret)
 		dev_warn(port->dev,
-			 "ams_delta modem_pm: failed to %sable regulator: %d\n",
-			 state ? "dis" : "en", ret);
+			 "ams_delta modem_pm: failed to %s regulator: %d\n",
+			 str_disable_enable(state), ret);
 }
 
 static struct plat_serial8250_port ams_delta_modem_ports[] = {
-- 
2.43.0


