Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E79AC71159
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jEpys+gsbTyK2rZaHJhGYhA+Ip4Q7c/0chTk7LNAD/g=; b=HkXdGf+auoguPv3gt+R+MXg3nM
	EUdWQjwbNE/jJ42Pwie5vnadoD9iOJcQQARPOu7G9hnVW8XHujDcsjVDPdEkcIdd/wsaBZU5Dn+7O
	VD/xIC4IZGbZEtkLbd2G3blGSgXnZ+YPHfCRN9b9ek44MThHd9Y/w0sUaGK9itG/A+7q7xkQ5GGFR
	L1qGTshKbbR6CBpLsay5/jH6mZfHfZaoqQ/Hl1r7MoSL/jm/zetSEDWilTYJiI5L6ADk7xr5DdAdP
	6VKdOOBubkkrH1vMttNtza3aFCxm3w8AQT2/J1SWM9eiceZ8xGD84dwM1ACpPn4zzTWfv2UWB4ldR
	ghWTbIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJxg-00000005rwg-23Vb;
	Tue, 17 Jun 2025 00:14:00 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJqg-00000005rVm-0b69
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:06:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiWAX0i8tsiGYctwrm7TPEc3uRzQM2pCsUKoV4u5zsC5YKJTVP62EaZluyqMCnOK/oR3Eg4iHoNj0euQjULfxxYwHBQkK71r6Jbcb5pLFcKeUE9kUg3nfB0IjCDCkqK333oR11OX9enh5uFvgI8MSu+7KhdRpbjYn9F+9qLdkRrSV9a0zjQi8rHiEUcIv1mBk8aWmZqcsa7dpFStPHmek73koUGLMTWOKOnE6hLEwhPP7cUkydIhJ3yDZuKoBJTguGK9Oa7z+c5lpGyKE0U8Bg6+9hK8vMA8eWoyEvdF7uErWiRW6f1UE07sorRts/SlYKkkl52DbpIfIrV9u3kzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEpys+gsbTyK2rZaHJhGYhA+Ip4Q7c/0chTk7LNAD/g=;
 b=hehSmS/Tp0qy41IxUO+G7NvsBvIMhO/0xSzaznEn+/5lfdxf8hMX0Gk1t4TvGKumI/+hHjYYUfeKcmL0NteffDWuRNv86Zt1HLKqMkx3+NE86qqT6lNvBYLTi5cCzsF1DpT6AWhTfVHlfX1IVYgQmQXkcUERMlm5ZDxnKvqU3pmJadhnZmts+wPAtyWDqne5faITKDiSCUsiktgrMRaZKki0WmyAeX7rSnKC6hYFc+Xb8hZ0Eszz+///mFFl+x4PrUe2Mm2S9On1eOnmhAC/Am2BKmzMM/dslgox8Eg6tl+cU2yR9Z3qKeTOfW3SwRNpuAs4BFjULO1rwDo57X8TrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEpys+gsbTyK2rZaHJhGYhA+Ip4Q7c/0chTk7LNAD/g=;
 b=d520Ci2TqMMGkpDH6qodYLe4BV704R9bnDwo3/3zsveJWHIbf2OnClRx0DochHyoOmmR1ABXVfH3NXDZYkAeGzNu1PaF12A520UQ+rISanLJmbNbmqx2Nk338mUDwBzgyL6OKmSJv1eNOFzO4Rgoh+F5e/09XVkKN7Q0NuPVKhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6804.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 00:06:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:06:37 +0000
Message-ID: <87qzzjnsdu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: s3c: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 00:06:37 +0000
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: c623463a-95bd-4644-9a35-08ddad32d42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MqbM1e3MjAsuTsnuUDKS1NUAr+IfgbfOgwMDv2LMYtCm7CTL9751ZpLhxolF?=
 =?us-ascii?Q?LvUqYqFsQJsoiP7SYtuCyw0xZEdEMV1/pu7JD5fuzwUBaWcRPP+b+WAKQpUC?=
 =?us-ascii?Q?dO2iv54rg0X/v6/NvZm1H9VgDILhiDODiskiawzN0mGwSSd4eQcKaVZ7h/y+?=
 =?us-ascii?Q?KQwsibpONddoutzDsEs2vqqtlWp1fb+7uH7kwB38mv+wDjh4lJSXVbbCGU9Z?=
 =?us-ascii?Q?iYyQNSPTdjJw2ISz2QAbZX/ug6XS01ZYP6qTmvNVJi/wp/VO3X2wuJITLHjG?=
 =?us-ascii?Q?Tzh5TGl7SMql6MrkPZpNnV6YPT9qfY5XVB0Y+4DPBd9+6kkPO2mguRS6o2d/?=
 =?us-ascii?Q?R/2DDB0FjATyzTUahK1PLXLjkYshwvndckGml0p6dIyRt6gDYaEQTq15QJif?=
 =?us-ascii?Q?1o0q0uje3QUhDVa0fO7nYsjnOQCNL9C9Tmc+9Ih6PGPk61goUadqRM9Zbcke?=
 =?us-ascii?Q?wC5P1D3043fzkUWAbpe7R6rOT4rnYGTXpS4kCabK5v9WFxttetUFoS0dZlz7?=
 =?us-ascii?Q?Jh3JxQjzmtt+7/AYs2812lYvyOUelCEcCXIcjOKvSOEWP0Woo3+brdMy38/w?=
 =?us-ascii?Q?pwl1rkCUlrZFb4pnDQvsulLgL8wAzgFzGZw6ffay9YNariiEgIYqhg9xnlUX?=
 =?us-ascii?Q?pXE4CH0+ImGNHRuAttJK22KIsk/Jkh4w387wmeox1HHVhb80wE3WTRnwVoVy?=
 =?us-ascii?Q?iUXnlQbGHPReS5uA7OU23x8hUTc8BK9XdyTLzF7FEhx5bjmQkzsD/jcbWMnc?=
 =?us-ascii?Q?58MD+9mFPH0AknUcyX0+5j1chuC+cuIRR/AhG6buEJnFzty8dmLPtJqQ7P1L?=
 =?us-ascii?Q?aBdd+q1uv/esI6DZC7FLfaG04pznMRDu/RuLbBjPXkkyc9rxpfB7p5UjhhQQ?=
 =?us-ascii?Q?YFWIsw5kX/5qdQUI/EF0ro4DX5XjfGfEn7+8Cvk/WiVHaUqF7BNd9bO6f2MO?=
 =?us-ascii?Q?l4zm1mjwKinOhyAGnszSEixqcw6SRo0a5LgCywBFxqgnIAOC+1PYNUxRldH7?=
 =?us-ascii?Q?FYA+29V+pP440tdX8XYNowUlORoZfMbN0Qyxnub0i+SG9nD9lVF1dl98Jv7i?=
 =?us-ascii?Q?ZuzVToDxEQS5wN6T1BQdw2v/gb0ZkX7w3u5NoIdSmGeM47k6bG2PvVwi+zYp?=
 =?us-ascii?Q?2pZKk0dpIB5knq/15vT8puexS1Hqvhg/YPFsr+5SCEotW0PXnks7nsey8VkW?=
 =?us-ascii?Q?dug+6pUR/SlEF47cmCH8iaEcDDMFG4LXveGUsguG+hyIWyNIneaEHRDIRtfs?=
 =?us-ascii?Q?Oi87IBCAoPcQyryyFTM3wUroxIVtSEjoog96dblqC8msQHzbEcFPgQLBEFPf?=
 =?us-ascii?Q?Ce9KNHwR9qRY+x876K67DhqU5+XNCO+heDQsv0e+4jGZbWYmMySMMGVlxzBW?=
 =?us-ascii?Q?ffSKxZboCmCej5Y+QdHQIA3VsfpQHISvS65KZlFMaMQSjVq9Oh5GIUdCJMpo?=
 =?us-ascii?Q?m1Zk8DJJpa9NCIClDTCRR0XIQpXzMAriy2IclLMQ0RZj5NBxpmNBjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJG3AY5Xz2wulK8IbQ5jvLIE4J8KUjZVDwt5ar4Ulu0+lCUNbkH0wYlcMybY?=
 =?us-ascii?Q?YZFyp76W/4UF8BWO0C/SJ/gn/Qko6oPYgR0JJuyBgkdFeJRHiVqBWKKtWKzz?=
 =?us-ascii?Q?0/jue2aNF0CbYjSpi3p3jMbb82kCHZnkh5SZYbeSX0iM+iHSVGgabV+gPNdD?=
 =?us-ascii?Q?lhGRVicomz3aEddr/cXPqGASTT7sKHDA+W1R8DFUlwVyn6jnf9xXG5cvlAih?=
 =?us-ascii?Q?5Z0VLoKeqA3RpQIvaYZgtDR3x9jB9T5TESHyQzbJP2UA8CThHhaXm3pARc8d?=
 =?us-ascii?Q?GmDf2RwgMzY5UHTM0OxjK3YF2bk7a9Plrj1bXm2ubZwMIO7HdO10XtrUYAom?=
 =?us-ascii?Q?U8eY/gql/ObnayuJPJpH72snHb3VaOpfdJvTUqM/HxG7NWccVTGFvQmthcU8?=
 =?us-ascii?Q?7WtXWdAaUHKzxzHZkgou3HJmuyr6VadQ8pPFMKzFdPUV+9FcO1zXvbr1hS72?=
 =?us-ascii?Q?YRKw6M/s5tJEtiD84YLwmYfdWGEI3Ry5ITP2TtLHHALLoelVE/mXfTiwWzFH?=
 =?us-ascii?Q?QKSJnSAIxkXrWYF15Ojc3ykHhWOuG9uqLxR2C6bxTLp1iHz7Vg0XBDRqiJm6?=
 =?us-ascii?Q?f4H4kY2EcfHoB8LsF7iwtTg2vjKxGSi3tf8mNDeB4Ikf/fB4m7HYVL69fQav?=
 =?us-ascii?Q?MDzXH13ON9AuKbImnjp/XlJuVGOqWentNVJKrv+o0IkoPJu25akkQcaojDIV?=
 =?us-ascii?Q?m+dzpuFq3r3lcy2sbQQoUP/0o0yGlD5hWs8vJpSxwLYD7YdJYXSsghAjFREj?=
 =?us-ascii?Q?J3o9k/tzJPcL6ZNk3J76anchbniol+JJxA3h2MaSWB5mTtxIw4A0LtKQ+9I5?=
 =?us-ascii?Q?M2nJ/nIZE6kCqVEi/rllEneRSIcrJ6bB6BsDNHhNKj41WI9w+9/eet8z1gT6?=
 =?us-ascii?Q?mmMtBTBDrUywM2t/FrK8PKHOLApEY2W18VX+sFcYRRdzB1ygfYINA3g7XFXZ?=
 =?us-ascii?Q?owgRtWHA4/nmFWYyqmYVDtP0N4zImI7i6HLcV5RGQCp4/BZ8CRDcDGGz13iX?=
 =?us-ascii?Q?mA+w8VhRUQ2r5diMPtHx4hy7OVNZRRcDxMb7giJou5XFcfo3x5n6iTuOBmxr?=
 =?us-ascii?Q?bGTCXTm7dJXewIFXATEt/ggnpnP1koUZZkqfsJdHyxqM3r3nbbWcoQTGdLoB?=
 =?us-ascii?Q?FUq+D/eTnSccJDYfituW9jR4A2pTiue10ww5gH0UayCvCR9EbHeLv7iSsoTV?=
 =?us-ascii?Q?B7eKnRawhJbBKuOJj6GhMH9+iI+e146jKujc1bE281kDyQ/A+sWXCS9ccqrr?=
 =?us-ascii?Q?n99vPCGi+AvZu5gkkFxWPfSoauqgozbQkWC9IkTvxJqy4UmmlxnkHALiekfD?=
 =?us-ascii?Q?pjZwOxYJZKo7sLJ+fhq8MIaNY+CW5iweYfko94vLXPO3QNm1kWDIE5jmgzFX?=
 =?us-ascii?Q?DEqvYLXQTAiNExLuQ/+5cI4yazIpj1QJiFU4Ae+Yhdc8fndcXzMveyWmEn//?=
 =?us-ascii?Q?ZLnyE1bkMqaO84jOUmJraC4uqSl5TY1boxwe2VLYsSU3WQc9dPOqLFTPjxXR?=
 =?us-ascii?Q?eX/3YooQ45kn1k68NwjUYMHpYwZokW6T/OjAFaqNtSDi3LQ2ZHuHCxD4HDd3?=
 =?us-ascii?Q?D2sm5VY4TFnSylVaE7cGkidIBxhdnfZN+NjEhblVYE9TraO31938zH1g1VKO?=
 =?us-ascii?Q?JFPzrM+9m0Ci046z3a3u/xg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c623463a-95bd-4644-9a35-08ddad32d42c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:06:37.7490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rW71UcgscgBoejWrW4+E/86sIJFoL4+rI251/C9WCpAp8zwdd3zN5JSwGtFQLUEN07DBsTWy67DqkYvUjPOBls2ARuG5SbmvJ1iyDs8OKPW1Goc7JLXUbvHc21GH+5J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_170646_181701_678E2D62 
X-CRM114-Status: UNSURE (   8.53  )
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

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/mach-s3c/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/pm.c b/arch/arm/mach-s3c/pm.c
index 5698cbceaf7a..6ef037dcb641 100644
--- a/arch/arm/mach-s3c/pm.c
+++ b/arch/arm/mach-s3c/pm.c
@@ -47,7 +47,7 @@ int s3c_irqext_wake(struct irq_data *data, unsigned int state)
 		return -ENOENT;
 
 	printk(KERN_INFO "wake %s for irq %d\n",
-	       state ? "enabled" : "disabled", data->irq);
+	       str_enabled_disabled(state), data->irq);
 
 	if (!state)
 		s3c_irqwake_eintmask |= bit;
-- 
2.43.0


