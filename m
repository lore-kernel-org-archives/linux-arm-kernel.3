Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84720C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QaujN/D6C+tunYJxlA7VzXphjCjAyi5TT+/UFtqce/U=; b=09SOUw4pSRNehtWDSVOQUmkfxD
	Ss9cg0GzKvx4LCAPT94gHi5yCP+bvZpcvOIpM+ixwGe3eToXDrYAkuZgp5YexbJ12mmruzqnYhfCm
	HNgUr8Y+LRy1fPNDgrprCi3Ia+ZNZGDltJpseERZ2v7wH5pmzF/910nHr9gwbJ94XFunvYrFN9yL2
	dlCIqF1XiYrGmq+0KypOkBeS+1zWULBfopyg6yzC8+D90NdgcZO78sjrflHFzkeurTa7Ami7ApbL7
	0oWZqBdk6zpFgyuruXuGiJku1IjqJ9BmY8A7vvSQVEcNIjoQQynYr4I1RaQ33sAtZ4lfVfexwC726
	/oM4i+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRg2t-00000008eGd-2Us3;
	Tue, 17 Jun 2025 23:48:51 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfvp-00000008dVM-1fHU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:41:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9piRqEA9Mpipk1fWdJB03WvGsDVaL5Ce+REBhvV9nufntN0Z4m7WkRXlGFidt9KEdL3WRS2cf3+xPIDIFD9S5Md1/M8IVbv06Pvh2CjQ5vjxe3ne2WwFISr0ifYaQVUkJB8SzGN2nRWYK/louPR41R2pXk7sUVXvVqHqaIPfD6yZHfGTWUCV3wnQXh0oGstoFCoavpyGbafPuLpuStxAOMVsoaXQZD5E1ewP3wWbcfvtPNB6W8OQjp0n4JsRfdOPPbuhqEYEQ4JPKRgZAVEiHCAGq/Bpq2x3XEBZfi9Qpl6clBbI0qzNpT//Vm5CUyBcCup0teTmClGIhT2b9CnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaujN/D6C+tunYJxlA7VzXphjCjAyi5TT+/UFtqce/U=;
 b=DFMEQlv7qCdcMp0fUNT0QAy/Qf3IKEh1T9CbnDrqdzdBR6DrsnJPHNO5FDl1iR+Tk8g4f7HiOIR0fv4ujY6Ywi9WPXHi58MjTnUsamveO2EjCrj/JgmNlB3Hf5kBBJptgYoRqvDWR3dwH8sDxmKxoP1ZfbFVWMvU0MrY9e0Qg1mKBGYxzask/BC89b+5zr22tiGHMkL2OVCmYMtt7kn/UW5G5MipRIS/L0277aRnj/jM47SxY6GCKoq6LHZNFcaM+iFU2umZmmNKDiXY1SeiD6y2fKLe3ERvOLoHfUIN1YudSLokiY1q486c8sorNDt5XrVy1w1foLLABe+Y4DPf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaujN/D6C+tunYJxlA7VzXphjCjAyi5TT+/UFtqce/U=;
 b=hc7rDCpjE+AfgdhQ6W+YqZrD3AS9Mz9p4DDTMYG9QWBuXjoXv9HNaG/UH5hChsgHP4c0Er5GQAT5JOxqvQ6lutLo8sWk4NSvPWMQTSpbLzMnHRsSThuh86PibzXt604rOBCW18z1eA/SDXGR0S/SJRi/Q/if7NmxTYuX7SluAFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13401.jpnprd01.prod.outlook.com
 (2603:1096:405:1c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 23:41:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:41:31 +0000
Message-ID: <871prindg5.wl-kuninori.morimoto.gx@renesas.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm: omap1: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 23:41:30 +0000
X-ClientProxiedBy: TY2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:404:56::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13401:EE_
X-MS-Office365-Filtering-Correlation-Id: deb34f7c-11cf-4abb-3070-08ddadf87c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ymeZ9ywymflwJIjOdLMDZ6uWmyVj6JDv0siRQ7GuUz/N8QVhJLqqmCyUqtWs?=
 =?us-ascii?Q?tMSJusSpJgSMhntRoB60gRLcUFbT3XDO4VWzzm2BS5dYL08eoTD651G4IIFY?=
 =?us-ascii?Q?VHebALvFHTGfqjwCDDEpuB/mBZF86zJdb+eYLCdyeY0noRGN/BW+MpGrRhtP?=
 =?us-ascii?Q?Zm41mcJlPuuuNWN8OtsMcu0rhWp7s2k9FPS9TcjVXoh/oaaMHZquAjcagEyj?=
 =?us-ascii?Q?6ITeKdXWuLz/cM0NOQXh4FY7zH/La5Pe3d9Tzdm0kl6f7iTybrXY9T0UqA1n?=
 =?us-ascii?Q?J0pwLj3PBBPA7UgkMtHMsHlYvCI0c3l/CRvBsfREY3ieAHFLlEmO4UE/OxrU?=
 =?us-ascii?Q?3HAbkx3wM5OO0wugXeoDECRejb60j3QivIAMXGNvwGrWcwEKFc6xk4gDgZaO?=
 =?us-ascii?Q?B8QtXuJQiqywuupn0E8p39sMLuwziiUXooxIhSzKNTNOYL91YAsaFF/iFskm?=
 =?us-ascii?Q?8hcrUgrZYuPblhCisF3JqiF+HhzlS2Lk6ptlFhfOJXjCIEMVB+HkIyJsS+uQ?=
 =?us-ascii?Q?2k2V2ouQhr8fB7WwFoybHgrBxvFGHFw1ce43R6ele4z7lRlPNkQryHvx4/nt?=
 =?us-ascii?Q?jSj4C6Ywy7fm3IIri9WqjqT9c+/tbKuj8JnxDjl684WA9pMjrtW5tGONYC1c?=
 =?us-ascii?Q?pe7jwBCkK66h6PocjWIKaNARTUbu+mKrtQ8rKKnXFxqnWJ86cMzwvOYmQbZO?=
 =?us-ascii?Q?sPuxY1vX7ASMDEZUiAuqXrXXcVL85vJJHdkHLd9ZwyzL16rFCDgKUUoZOGUy?=
 =?us-ascii?Q?N399dVMOsOtNNKoudu3y0tr7IJW9gBRiXV1NY0hhIFcMGfC+s/E+Mq7d04zf?=
 =?us-ascii?Q?uqnzba39iz3c9PgXalXuyLz19HSb3sF53V2aA5hLv/mxrMHHt4pvBOb4hRec?=
 =?us-ascii?Q?iN5uV8Tmv6OQ8UBrjryZKX6640Zd5tPc9LVa2TCb11eYZUDhhtEeMSAdVqas?=
 =?us-ascii?Q?hBNSKXK/9dzoW4euqAaOnmPXLMvebbJvQX7xIIvgZhRCxg5SBR3uE237er5M?=
 =?us-ascii?Q?HILK6YqhFDigPZgpTcYMm67SwPET9QJ5LAw6TCM70PMo7tjJYJdiZX4CV5TW?=
 =?us-ascii?Q?4sV+HfUb3GWMGk0YiifkTA5KuWP4+hsYVCYvqgzUgkSeQi67Z4zyPnKoJm8h?=
 =?us-ascii?Q?22l2xkKnklbKU2s6Nu7TvC/pIpOXX9Qtdhop7dYALMazxvtaGVTL4JD3K8Vf?=
 =?us-ascii?Q?PLvn1pzfQ4dSogVeqTe/pt8vq+7KRGirTT8I/QRd1GA6p6Tm75aKs8WbBrYK?=
 =?us-ascii?Q?GvOjDhHxiHfWX1QUQYg5kSUVCBosj7UrW7mfV+ubQ1vZp0ekQdE6iyZRJyC4?=
 =?us-ascii?Q?GnD56r/tKIWEWue9o9cPuFKr+QTyqMvhuGCWOAJqlr7D2BFN+mAjWjEkfvYh?=
 =?us-ascii?Q?TUlBq3p3Zyq3zaJ+5E1TzYmU3XWRrWAbvVwudwDeiYHHJukRyC+1N/8ubopx?=
 =?us-ascii?Q?m1XwQ17/T2i/lwNDuqWrygk9WgYQaQG0jvx801brDmE1CfhtHzUzjg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tF8TGyaf/Eful/bwGuIobO8VGCYk3CoYpKjYys3T9rcShw0YrYUYr4K09/5J?=
 =?us-ascii?Q?91yt/Er+5iqKC8N2XF+/eWQrlLuGJQTixUvpd/V1xSOBFHMjQKYM4oS/KWlZ?=
 =?us-ascii?Q?GinRFPkoomDbu5KLWRbwkj+ht1e3VyMikDRgKVlF+QQNYrcdwkIXRtWu3Vgd?=
 =?us-ascii?Q?aee9OkY5ii7FwseO/q6xgHfSY1YHXUZu2/C8B2nNsl1Gc/c4KeoZBoN/uIez?=
 =?us-ascii?Q?MQy5WSePrpsJErId+4pcQQT3DgO2/lYeiX3Nf4gzlXeg1Dy/ph+jr656DCbb?=
 =?us-ascii?Q?Fn3XvC0JA3155f0o/OsB6vayf1j9GzsTS0oG/4JUg8hjc7/oRQr0ktaLCKA0?=
 =?us-ascii?Q?Aq/okVRjGYxHCx71qjCzL5/Hu1ZXyZimdq6+6f1mOdienp+Whc/k/xp4Spyo?=
 =?us-ascii?Q?OGpp5Wi/j99vjz/r5yenQGNvAisSsK17bPayihqdA9qvr/EGfLzTz0MINH4/?=
 =?us-ascii?Q?Bx4o/7YJRRPJlDR3/I9RfFxAzDvgnAskynriIooevbhP77kCRcMt+TGkMQAs?=
 =?us-ascii?Q?yQWVDtC/y9rR2fp9AZMR7MzUFUCNh1JhVFmZGvjU8D03jIxhxfZhTbXZDn3F?=
 =?us-ascii?Q?po1Wd5LYhoZ32JiKR/hYHijlejgJHQ8fxHjpagYkanyQX/esKpRjzJwoS2vp?=
 =?us-ascii?Q?dXunz2dEm1/tiisC7eYzM1dYBeOeLHceLPGK1FFBpgy0iz08RrRE+SjSoTsl?=
 =?us-ascii?Q?tcKJQnrTE93bNwvrJmxKJgVdpCBVb3YY2sOMoysvl1hM33G1k/mUPBtwp8av?=
 =?us-ascii?Q?hIQz2PWmXpLRQ9E68ugSD1jbcuZrvN52J227x4cSfD1S4Mtotb0bEZaAANY2?=
 =?us-ascii?Q?9MDR0+XOoCK2CiJBM6E/MPr7xZKU4ku5yqt1YNgV25yyf7iEzwR6Q+dNXG0B?=
 =?us-ascii?Q?sYJwF0jXEmLRYhasxKqGiQCFObd1Pwayotfi83fagDBZHsVM8NLYvOIKoHlc?=
 =?us-ascii?Q?VWHpktWToqcsyoQopgjz9KldKpAky+9LLGv/wz4iMM5XyG9hxoyMxGwF8Gwm?=
 =?us-ascii?Q?8Bc8NRoFzVaqL9EZYU1iKrxw7qlSAjOeSaDnm9i9X7Ywr2JgXNEgSa5ta/yi?=
 =?us-ascii?Q?c3B+8u3gQ4TeyKOlyzytaYG6tmFIZnR9Hzz6ApC6DWiFOzMLZlyiScPOIuAd?=
 =?us-ascii?Q?+XLba1yxLMADth0XLwuGhKrkLHGNTLp3B4NTdzblyHj0l4OP8vjN6V1JLoSD?=
 =?us-ascii?Q?jKJDGPdu3tCSmjDRXlsdTPP+g55gsoTyFK8WODxl1VWpgq+jq/zUNNnxthPx?=
 =?us-ascii?Q?uqT5NmQyVZLcTVif2WdUIFWAXsWnI5Li+hqE6wLjvEYL7YMm3GosEzkN1vdA?=
 =?us-ascii?Q?ORxyeGF61fuENawDFeZrpMlJpnuBN8FMjUar/CR2KMSNIQJFs0lP2sjY+5xz?=
 =?us-ascii?Q?2nWSLpR5NiHzV4VElMSFXB6U13g5wb/9M1yYpPa4W3s67vXu9If/ScnQW98A?=
 =?us-ascii?Q?wIdRnmVHEeXBsfJwpYZi3/VYFk3XRI0DR9TpS0IslVPg1qVX5kHVJRXbhESr?=
 =?us-ascii?Q?wEh/JGhWa5Eha+lBT0wtd2U0AIQWs9DCPMclt/4UM1222uz0QB9dNsExy9B8?=
 =?us-ascii?Q?2L6nKsvdvdNsAXk5PjnZn9C8Hwcym4Vy+qzqGIQP4UDR401dKTj7od4JLu9F?=
 =?us-ascii?Q?2geGPQnJQi/bR4Y4Mg4j6Fg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb34f7c-11cf-4abb-3070-08ddadf87c97
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:41:31.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khRxEyjmYABtTXbm2rVSwTA5UTcihNlKksLoGR8GxuaTJWtCUUZsjykXJLSGGXKxR+BP63G4jxMGh/XELvNrCeaCUxGCvWS/tzDR3843ISrvVMZQbeUunOaLjtayexL/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_164133_437615_8D9C32E5 
X-CRM114-Status: UNSURE (   9.94  )
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
v1 -> v2
	- add commit message
	- add Reviewed-by

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


