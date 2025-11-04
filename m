Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207ACCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6Skzn8swGqaG/aXBbbQkq45BrvqeZEpMrAgh2eGIBg=; b=gNffPjawHUzUeC4OD1KzV3bl6a
	yvFWx16VCV+p6ByUUzIUBfdYsacF4dmzZxxtGSEkyF1AK1NfS1rC06HXUVW80dDPyK4ghO7qh1ZqB
	f8mhZa9RvzWkPydrCKwGxC63HVmbL51tqJ2QWNTibAcK1/aXe8DGc9fF6tZFYXCQUjvVr1nPI/Gi7
	QXBgyBDwPCJt26/PmcKQbRyp0SW+CkINcUFmx14ydF9jHmXSCt0nyckYzJFlNT/d45Q+r0YCv1Sjp
	akHZLr3+tXrc4t9cbWJwsAS2IX0Kb1xn+J82cOfER7o2T0oK4/bGPiwD5xyUlkKO0uBeSiTx7W/7x
	alOLZVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG60c-0000000Aw8P-12li;
	Tue, 04 Nov 2025 01:38:54 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG60a-0000000Aw7T-14Kp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 01:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+x7RZmo2+c9Qon+AF9nzf/Pxq/vWMhM7LfDZBCMimDRLYbk1RO0UehID0cS2bkcihiMyA4LnLT02UsbQX+liZB//6jdj3HQ8NbP6dDVQkxVPVa7wwh0fIP9jOUmeQtljI21t5m3QoSpcEI4/QiJMfFoJ/SARrC6C87kh5lFgqv3u7X87SFsBrmP0/b5AqtWAJBL6ffBOcjPvGjE6HBQvAfmdEPyANnNhh9n5zw7jePCV8PySOJ+tW9qDVGOe0JnIgXNeXTv5OUgg1whRGiNtTHcBvlRX7w81RhwHI+c4FPGn9KpRisnr9Rz+dUkM46KKrt5YhE62o1phZl8J8a23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6Skzn8swGqaG/aXBbbQkq45BrvqeZEpMrAgh2eGIBg=;
 b=Mt1CAo6Bd5QQy2tuvJiLnKog9ufImdHLPamkizIk+hTzQ5l0lmVWTye9hMcMRkqUe6CE7GB4jROK0PPNY/jzv4d9pPz08oPgu6zEh8+hB/YgpSC4tl5FbJpl+/7DyoEMEPLROceazMEROfC02yF/IYIMdgokwofZ3hbzMvqDUDSb2caQWH4zK6CLRqqtja7uiGmFPnffprfwyHT7v1e9wlPmxynLoNQelstLkrKWLXhYSFeIsla+tkAKtlnkvAO+q9yYhCpTl+ZNis5QUjfshrxBepgxrutgQSR7PJMm5HTMt5Hl0U7WcGzn6ZKdxTOvte3isEYxTVWUA1MGTatCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6Skzn8swGqaG/aXBbbQkq45BrvqeZEpMrAgh2eGIBg=;
 b=whN9TSeEn19weihqKyda0WkF+nJHWduIdBq/greHx1SlUnTZlCGdNOkSUg1Yu2QdAM0o3BFlfILKLfVdU3MfbdiJiBUWgZzzkYl0LmXxQgFNUvSuLn1xzZPzfG3l861RjWJYZa7sd7Y+mgHGfnZdPubHnnLT5Aii20ZOh9sfNzbLvaFT9fS3An36BObJr7hkKsOVXP2vRjotCDRnrtvlmZmHZuL+pjVuYcxQYSJOyH1seusNn8biCvB/jys8V1sI0R56s2IprzUGRGLRTLulzsxjC88n/QXh8KMcId2WNZ0Of6pDPvJ5PhPOboka6n9ZoAoDWyo12ILu9Rk95j7GRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 01:38:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 01:38:46 +0000
Date: Tue, 4 Nov 2025 10:51:10 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <20251104024527.GA8752@nxa18884-linux.ap.freescale.net>
References: <aQYKR75r2VMFJutT@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQYKR75r2VMFJutT@stanley.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 8882cb4a-058d-4214-94d2-08de1b42e575
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kLB+Gl81tkolRLsWiPWVoei8qi/1FxWtjPtws4mBfkvIm70fSDBfr59u5MWh?=
 =?us-ascii?Q?W/PAZ9wUdfftDTXNiuTHMBloKABThj4UkLcj/smMgmT+hPW+HUd9NoCjGGDt?=
 =?us-ascii?Q?Zy4/gDz4C6va04yXuC44r9K+UW9yylEvbv18aGMX6aLvStoqFpsYHeoFCyQr?=
 =?us-ascii?Q?3OlRtsTl6/P9ITXiMriZHOnNRBqtACFDCZk4c+yvbGnU+yRICv+PTS4YJ8te?=
 =?us-ascii?Q?DsJ0EyWc4wmqJB9L0jNkIw2dgmPu227bIYHZoYQ4p96Mu47dAHQ6TAaCJfpg?=
 =?us-ascii?Q?/17vWY8zi4IMIq4cwIb0poQMQ9TNmTOxtH1tbDB9saeOsKke6vYHtVU48y9w?=
 =?us-ascii?Q?lSQl0zw0BJUjpXFHS5VGl4crzzTK+GEHMQtpzhFE9wnki/GZZpqvdgucaB0g?=
 =?us-ascii?Q?LLVsMd8T43eQ3N/W+2LlnBWY4LA+fQ9gTY3Tm9w2X938ponwvlet5+jkqx4M?=
 =?us-ascii?Q?cUOqm600/6np82fiKRBrLjy+kQaTUq1qN72dHFPSk2lHba+gK2tbtFKFSGDL?=
 =?us-ascii?Q?Wg70ncG9Ff6SWXIEuIIiEfztXOuauOpnQlvzEjukzRwGmDE5uAfyuYy36b07?=
 =?us-ascii?Q?3PY65+TDwUhg+/OUCrjiciKUGGKqYV+P0Uu8ELiXamjREv6tsYsRUqn1u6YI?=
 =?us-ascii?Q?C7arKkvAONdpjTbo2mOQPX02yCJpzJ/DQtVvDBGkSGWgtCmPwCOlINPC5V4F?=
 =?us-ascii?Q?U8eiAIjB+18CuZd6LbwTrtQFGZjfgZ7J/4zksXOeo7JAHyzti0pTKOq0J7JH?=
 =?us-ascii?Q?HlTcLK8otZ3d84Juw3XGwfoXQRBE+c+N9V/+MOKksUdO7jHkBu9pYqGXtr+F?=
 =?us-ascii?Q?68ZGF3Z6sCe+E99DEjOAOYSzpKPU1nAH/b84tY0yArbnA3XeUCzf94mvlTYK?=
 =?us-ascii?Q?xVDzNOhP86vu729IWb+UH4WhIocK730N7XzihBw8nY9D4MzHwULEOXVzoKn8?=
 =?us-ascii?Q?GwRm1Ws0394+nw1YGPD5raFhSMI3hAU5lsotDorGntABmQMgie1HlF4QXy3g?=
 =?us-ascii?Q?xo7on2YpoMwTIt3JtxcBGlCxC+Fj3Lm5YzNNZj36xLboh0o7RKK3PzJTJX84?=
 =?us-ascii?Q?wr04AIRjQP1ya7Y71jnZp7IG+N9B2wfdZCOYUNmU+Z9ntI73pK07hZ2t/gG4?=
 =?us-ascii?Q?F6fLCfaQZgl/JI1nGfH2tjW7tV2NgGVc8X+KSzxMxAAw6SlyLo+yIL/s1THY?=
 =?us-ascii?Q?R1SgUOVGyyNjRy4sk/Y+2k6VuYSEOvRpweUag+EF4WOfFkSW9qRyqwPsPg25?=
 =?us-ascii?Q?EQ+qCmK/jO3hZ1zbKZ9ajzPg4o088xpGscV48HVrD5fJNMe8TSfSe+FV0WYH?=
 =?us-ascii?Q?eYzADUtR4Sfp5YT0LXBXjv8WF1b5r0rV+Q56JohQqV5VWyf/KA01S3rJsH/j?=
 =?us-ascii?Q?vdk6nemZ7B7mnzFKExY0ubxSZKEW5yoxIa9Qo2nfkOkj5zNmoK3Tqkx7sMJS?=
 =?us-ascii?Q?qXL1A52Qo//s8iVEOYYMraJa3Eg81V9HVPajBP8FEisRc14n/xR2apXiVCxq?=
 =?us-ascii?Q?eNnTywKknS+XhvyY7TGLyYZdZQAbJG+k8+eO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y9ysDJQaEwO5hetl7JBUuHk2U+ZvIDaCqbodRga2la2hX6+gatxexdFue7Cv?=
 =?us-ascii?Q?6IUbQ7Ay4aFtVeu8JpwaWkiz4KUyh85LCW+uZkDTpxVGbP3w4SPvZcJCzXmT?=
 =?us-ascii?Q?2Fb/jEHUtu8rN02dv/ygHF5RQgdvF31Uwk+LJClHsSMNLlo6GX+c28AFuxJl?=
 =?us-ascii?Q?A3faN71DAmUKHywBT686qajBK1Jmnhz9D2AdoUjvnBh1lFWngEVeQSBT6uWs?=
 =?us-ascii?Q?998gTpM6LffiIks7jHpvmMYfIGZHnrO7k64IkHD7eYcJn13eM554t4XtUFGP?=
 =?us-ascii?Q?kobAZT8ymSxdKwYC8qzbTtdGAi4gOTQUTTEZy0zkyllroePdmNQtc7GyVvee?=
 =?us-ascii?Q?DDL9F2kari5Q7AbGVfsut0aGuPn7FhfiyhgbDx6nrURfXF+6iSnxoMpje6ST?=
 =?us-ascii?Q?q7Tn7PQkuOQAaywpU4u9tKsE7UpMASPSNuhGtrGCw69h8xc1pjBLZD4864Sq?=
 =?us-ascii?Q?JT/2dVqkEqRm1B5OEdWPJT9RzcPxRrUJw+8u1mY/F5S/tJIOOEkRcpoB+N6l?=
 =?us-ascii?Q?zodm2RMyZk9wSxhuvcSScFtxOssXLI6a0FSKadXsqfD78dUcHJMQRQW56QJd?=
 =?us-ascii?Q?FJ5kDCyuIh3AMniipapShD0cOBcdQ0O/aSOBj5bCuTu5xlOS4iT4DHgvmzj8?=
 =?us-ascii?Q?6nu6IVb1Hpy6U25Zem0C8UrNEqVlbXhFjYDvKgC+6qBCsdqpXQ8eSm7AQk76?=
 =?us-ascii?Q?HePmCyG7+56+2uJmrhNZbvoIdXhkkRbLzEnApaQBKavPZ8MEKXoR5gCOttfi?=
 =?us-ascii?Q?RH/0QdMAIRdueG90Wo+4RoyhFjCEi7PWty2wGbVS1T4qvSZFxS2Pc3ezM+8F?=
 =?us-ascii?Q?6gJj0AYgEg6M69p9vyOw5Wa18AWf7mYGzBQlXjQKWcgf+D2eqLCM5WF0bZcK?=
 =?us-ascii?Q?ci78BhjrgW8vcEm4W943OcyaQY+h51GyMwdsyX0YGoijHvXoiwJkQb9wcG10?=
 =?us-ascii?Q?hb79SVPdLH3pZu18b7Kse4juN+YFUcwZHCaELNIzYrMokJs7APMzzrXss4zs?=
 =?us-ascii?Q?40mXfUJ1DR4zq2JWU6y4+p2Mc8b+iLKBdi2lX+UgYmwof+2J1vLAP693kuax?=
 =?us-ascii?Q?CFbWnmJEPL5Pd6z6xkGpktan9qCcT+Pq56i6bbdafoglYe3Xfd9NSGjAT2F4?=
 =?us-ascii?Q?8Nm/LjW2BKrISOqPJuW1hz2CpVqTI7SatEMnLoxNvLSTeY3gEiic2Kqi3tKB?=
 =?us-ascii?Q?fDhuwROIrs6OFPpL+JcMxpjGUV4blIdqwRfaVjlGfpQqFaS0Sl4cwprAbuMV?=
 =?us-ascii?Q?nX6dBiqhkHkRVBtgg9h7nSHl36qItG1DRhhJhlQJ2AHFQOnfKJeuAau7UKdJ?=
 =?us-ascii?Q?+8LMzDhkqH2aRV7OILBNhxPvlXLEOl+fa20utGtO2YFTAoygkJMTlnLEBZ6M?=
 =?us-ascii?Q?Cb1rBFtVgUNmw9Ges65mT4QclLp9QdEdzTXbRVTBafiz5M35pj/PvyxfTSks?=
 =?us-ascii?Q?yKmCES9et82ubuIE/VNikRcMSk8eTBiwriVzc87ANyW6g+lTNjASsYAT0V29?=
 =?us-ascii?Q?Jw7IHK32J8kegLveZVr18+CKDO5BruNg65LboaPGLgnUulmpTxsJCSSh1VMH?=
 =?us-ascii?Q?kCbBkQGtMxNcU7B/nKHBRk9VpV7dPGhcon+D4acH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8882cb4a-058d-4214-94d2-08de1b42e575
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 01:38:46.8245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I21kV0kjjhpvbUWshvhpO21z4MVxdDLmCq+NtTUr3fKE3PzpDCklpV5QyzCum5TxuIGfOmmnCJR2KyNMRb52SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_173852_301580_B06821CC 
X-CRM114-Status: UNSURE (   9.13  )
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

On Sat, Nov 01, 2025 at 04:25:27PM +0300, Dan Carpenter wrote:
>This is supposed to be "priv" but we accidentally pass "&priv" which is
>an address in the stack and so it will lead to memory corruption when
>the imx_sc_key_action() function is called.  Remove the &.
>
>Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the fix.

Reviewed-by: Peng Fan <peng.fan@nxp.com>

