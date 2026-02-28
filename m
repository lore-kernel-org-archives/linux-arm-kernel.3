Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FC81039882
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 02:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXlFB+xqqZjuQ8kXDrW8zCQwx3qCIGS2tQ7QMaHrdPU=; b=3F7nyl4CKydnBkMwpbAFXnHqok
	/tpWUPBpzq4v33KryD+7IHlSWWmJTQbrlUfCQCE2Vr5HLaa3P1atMYhFi974O/ThmzMoNcV12NQMr
	GwGLdQ1tHf07vieLLwKlqhcdZCbaA4bBu07WeIy6gHjJWiEtaukMifrIhlInQOYRYBxAthLyT5vNs
	NeiGNdC3u5DIkgTWpVoETZQVr5zIzccjlO8BmaYE0NZunyg7vRuYaxzhIZqMmacII+yYMg/TKzf/d
	UtAqdDm59J2npay6EZf5I5+p5BlNz2N7LDnWItXLSZVuHdrkxI1DFkFxwpWB30xt2xkYohlZS4QMU
	eytZuVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw9nf-00000009Pqk-0ykI;
	Sat, 28 Feb 2026 02:11:23 +0000
Received: from mail-northeuropeazon11011040.outbound.protection.outlook.com ([52.101.65.40] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw9na-00000009PqR-2Nrw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 02:11:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=er+uYb873eGO6VwFNMJ5e3fpIXn7V/S197dn/h4s6uDJo6X8QE80E1LG0G+8V6AnWA/HmqJqXH1dNu65BFOgztlrYKoGflxDeLjiDIt5GbHk69uz7DT428HSauaSgaTLW1QPxSvY0MQhDQbhTaNVMa6X4PS0kObb0SXDuRjSn3PH+SYxaH9wof23cT5jcSQnnSjls0bDQzmPQZxCqUUZFiI6zB5Czt13vnaxkZKbnBf/o+JLmI8sRIYyiZDnCS13nPhBcWJ7uqWEmXcqgZTxTwZZPXR5Qk0POhE+4f097IszVAefS25X/6rhxaybyDotpEhRSjyzErXgrpo+C/5O6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXlFB+xqqZjuQ8kXDrW8zCQwx3qCIGS2tQ7QMaHrdPU=;
 b=O+KJUlgYt1KVaxErpv+XS+I0tMTxwHSBQwc6N4sPcMLGqywYJbQotAG9hnue9qbXzO8o2tJp7QXpA13qUsl83Y6WsBytA0j3IDAzhLWgJemVMetESmQJ+dAIr3UkupfdN+2Pi1PqDNM8kBaY1wTWMyiiJIT5mfRjSN1Q/zPjtNjWh2OxMKjToZY91sofUQ8ghYer9e4E6T9neAxgJK6QvwKqoPaD1o3vhn9NITHzuS33pGXtyPRDuO2SYRnbUIIJvLyqda3VxaKqJEfRh7J2GvY+s2DdtGtqfQtC15GsEA6rzQPVwzqYkBANe0Q0HyZ0NQCVxQaVt/HQmvIY3Sd2UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXlFB+xqqZjuQ8kXDrW8zCQwx3qCIGS2tQ7QMaHrdPU=;
 b=WELXOdxEXWj3qJdeqSEoMWslmNGXSZAlbBfNZEXXQUGEiQUcjjt9w/VfKmGIHG1haUn3nGPEtuC6F9NMWNSYcBRkp2Oa8JkgH+C0xT3KR+rgAeBYtnVgQfEvC/AoiLi03qhw+gc7J+3Tsgz5gfsFKeVblp4gi+vidWnAHVRhkhPFn/LKtUh2XvtwsYLi1iZJpBE5/vReOZMoETTDbld7hQlFu/MsjeO9p2vhxLrdr364R5vtZf7CoCZx3/X6Gjg0zlEEwNHmVNleawpsBuhfgKUxFIeNKpFBH8Yle4D26IXhN5nOqQ+ihq1BKDOHnRTHGK+HR8AJ7Vgnw/NElYDNMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Sat, 28 Feb
 2026 02:11:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:11:13 +0000
Date: Sat, 28 Feb 2026 10:13:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 05/11] firmware: arm_scmi: Drop unused clock rate
 interfaces
Message-ID: <aaJPNH9o3EvUGLV3@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-6-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-6-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 268233d8-2340-4e7f-7b08-08de766ea5da
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: dWRmPVWGNZ2IZ+JRPSCUYDdcbDG3jfoACXO2dCruGv5IRHk80oK/z1NKij2sWoonLKWER+KYAWh6+7AKTfeZ6U7aLncPW/64HR+KTZrxYRq4tvPrw7alLL5eTmKG2C40H8oVQYnJjEAx4c8u2glyTTJyleNaGsHWqmPVYcjbQ2iShke+2cds573YszLe5a7A5OUqMZOL7kn52fajU/saEWL4/+IZAr8MeTjWc2Fq3T1/9wHRUqF7t3hGc1KYqqubAeTN3fkgIdn1K+zw6kv3+V8pru6CXxxwUPAq6fjVtM3d1mKbuUOR3qRTBO1SNoT9sxFNUsvdUQJlbhAGNVY0HFsK3q2wz/wsXSQfT8T+j3HV7plT3Nd3tLYAhcYppe9tkVlTXgqsqDtRfLqzOZ1uYvduI/8GpbimWYKKTdeV7QkH7f0pIcpXjERa8pMK7J+N+5UQYoegSU7kgGAAUDgtxblcCRedT/6cEIMboc1EA8hkF1V+a2RTWm26f9OTAvx1cIOO1TaOj4ryj99B9/jVvp4CnA/ds1Dl3q7TsYpeZttwkQBaXL2JVhVZJDpp+iLAbV6zEzSOYhQxp2DI0maOVAl17Og5wZpt/qH8A/ldL25k9mQsNQcIVHyRWz6xaav/L6R+2pv68kCMH3jVXgp6JKdG5HyTYIEzYc0XZAkcld0lUDDxd0MHJTfmr7b9i67F//l/8bqo09OPSEXr5kFz/dxtIUi7AHoGWHbC196uGrl3iaAtGwoVwTGIfu+Jc2H2YpkOUr5qXx0vk5/jXtSU7YluzF5cvPEwusqAC16x0SA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CjEAT1U2/RaJ7u6yYuDw6LxgRjjLxCWS/fFKBmkLfwxbcUCThEhRaODcNR9d?=
 =?us-ascii?Q?dLhu3Ysek0m2k10M1pXGEi2mNN+SxKKz3BQSJR5mobdfOms1sta0fXDXU0hL?=
 =?us-ascii?Q?4ZI4Kzsijn8S28v9TGs6RUEOJ307wF+ZnpAgFOwP8zsllh6TFa7JbjB0jNOW?=
 =?us-ascii?Q?cuHcAhp5nFVFVo8X8LAvroxx89Fq3mlfmvBXW3y0WUvZb39rs0tkKfBaNQbn?=
 =?us-ascii?Q?hTSxsMykyxTnvHmEUwx/5V73newUfgxWO870F/02QM+a0sOHfoiXB8Jd2GEi?=
 =?us-ascii?Q?mFL5SkqkbHZnlTVOPbsmPZZQaZ13lF+Q7thONid02ZAP8Jc91UeIIxSWibwt?=
 =?us-ascii?Q?6y1OeT6w6VP7GkQcrvih9ObRP/eKHoANJTyYZd3/0llBsbySh3XGsNyKRl+q?=
 =?us-ascii?Q?5weGHE7oL+relBpQQvSqigV5kuZ4F1AU7enQ6xLhay5S4geEa2JsK3vJ5PFN?=
 =?us-ascii?Q?3aMpdK7d3f5KoSgyrcIrJVdrt7wS8LXXZAKLw9+W9dYQhwSnHdpd4iMd3/BL?=
 =?us-ascii?Q?ZLhr/xN3mT4EQBUSCs93CEOVy9zZSn9cLarIrLNhhkmaL3OQ4Ix2j6hrLG3P?=
 =?us-ascii?Q?xnzGCxg5Ws+5p+UQQsRkEQxiU08GHUp+TmLGRe6cH1ylai3CsZUTQi+5wu4W?=
 =?us-ascii?Q?xKBTxX9WVoYFpCEOGEs1xu0fmS3X/ZC0xCBWEQ1lAtaY25wlQeu4ZkYSYkSI?=
 =?us-ascii?Q?qgBLHN1ytzIxJbyRDanC+qykD5dJf0WZd2yUWYlK1n+Z9fdQw6iq44MLPkXS?=
 =?us-ascii?Q?XCtEB38a26u6S2BeaQTHUG6uEYfevDf2BAzJKSubWZn8ywIwkZpkTamcJBBK?=
 =?us-ascii?Q?tYx1FtkPV4NkMj3tBMTEhZbgHzJbmfBBkbIo7kCAvdTHfEJml1Vb9qiEbqwo?=
 =?us-ascii?Q?DDMiD3LPXsddpVS5H9PwuQFBbsMJhR03cOZWqTtQ+gnfr1sd3jEGYY3hFC+3?=
 =?us-ascii?Q?aWFE0HY6mowFfLzODN7HteCg61BcwK+mR5O3FVK6m0cLldrn9uONYl42eYBn?=
 =?us-ascii?Q?+/07NyP2S2GMrZ6qFQ3QkW8aFAshSngmi41oCmqbCTHZsUxCeaiio4hAagpf?=
 =?us-ascii?Q?tdaF+MgGl/Qn5KwvzL6BCK140SraV+Iq7oWA+RtY9a65isGNAoLQy6RfOxpT?=
 =?us-ascii?Q?JrquFnS2PcSFkbgmTDDhVmOqFWk1GEm3GT2YipA4C6s6+OT3Rhe4koWOLuG/?=
 =?us-ascii?Q?Xjb6jrWD2WIOjjtJv0s1d0oMUZhBW8rUcHp3gYnB3r0WaF7r9z9aalqj7Wl1?=
 =?us-ascii?Q?BChX4bgKnGz9KEkOKtV5Lo1Tggt4lPgXTTtXMa8J74bdweGTkUF47AD/fqON?=
 =?us-ascii?Q?rCrEX0dG3ppQKSSVF1yq0oDHvP4QQ4YwNciCgpdEKUWCtYl4Y3beEZMk2rs0?=
 =?us-ascii?Q?qcqbhx1BqqshBvmA6GwJRTj0HD5+D3VjNVGLhHbg2QZe0cnkQFS2b5Z/5x5N?=
 =?us-ascii?Q?+wTPwudID8lIWkheEOUasnBmb0IGWHtxibZIDoU8jF0m1Oq4fkSjD8tecwbL?=
 =?us-ascii?Q?Uh1K+LV7c0OhqbiUHDrabvKFybU6HKOkAUT8PBhOwDv/2hZGcBQYHTCmBIoB?=
 =?us-ascii?Q?NetWoogJSx9ddtsR7SK2BqL+V+JLBhP/JlvN2MQvddBTjwx4JaxCXlkSBCW5?=
 =?us-ascii?Q?jCmWHLoxk9BiOGt8k//hWCawOGNqadLqtgE7gVRL/wQgucSy4fMk86wJpOlW?=
 =?us-ascii?Q?p9BnbTSuo+bjrx6WydyE5hGykRZ0dvb4hEIb1mvVY/v/i8Mtp0xCe31xG6j8?=
 =?us-ascii?Q?fvM8rLbXvg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268233d8-2340-4e7f-7b08-08de766ea5da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:11:13.6913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXnoj4ohqakLmmCh6zXIkkveMt7SjrQOMR16inJ8z6xFA+YDcF4PgYZZrqtJWfc2Bm7yWJXzxC76+VuBQa2v+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_181120_835666_E62C97B6 
X-CRM114-Status: UNSURE (   5.07  )
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

On Fri, Feb 27, 2026 at 03:32:19PM +0000, Cristian Marussi wrote:
>Only the unified interface exposing min_rate/max_rate is now used.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

