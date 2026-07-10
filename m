Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFE0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 15:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etCwlerCr4E1zw5ylSpHDurIcyg7FosBNiZ9ksRnU/o=; b=rhOBLYbOkWO9rD2epkeOpe6kvD
	a/FjApFcG7+3ox9BZO8hKZVO2iyP3No5AtUWVXrNOqa3L1rWx/xlI6CNh4MMI26nC0f744aCpZ/TN
	zzrS/plkF6RVyTzVAQZ2YjJ9JXIOEcAf2isO5FufbtPyUJmXYlAMBXOGCrJQHCoWQjAm29MkiHu8y
	tF0XpZ6lf8iremqMrjf7yP9vycwy6CtC/fmplpLLfW5ici1P4Rpmq23sAu/w+97qq3BpAm1UrS1oC
	MEfMZC2D3sXi/X8SmBvXWVHNqr3V9G4YtkfTreRQO3SMcW8mM5klesvOIAey5MDvDBHBesDqr3+5J
	HT7HEXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCv7-00000005APH-45xD;
	Fri, 10 Jul 2026 15:13:42 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCv5-00000005AOq-2NNy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 15:13:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYpkDLxLRvHmAi82Yxn3ZLl4an//bg5gpsyrCLI1yEefwO4DCNfOMelPhnfc2JayF+isFXvCrqkYXRdmVqMjI0mwjygQxGJAZl5qHHj4HSTb+J6f4G/NFoNy6EBwPhbTB8MBCQkNIMujblOJPsKUm2wuOWxlJxhk/f2IFDtzkAz0UBlVBe1syOCeSa1rK3Ahu1VwwOar+t3kT7ETJXEmarnLiwI6AXmRIKBlaBLTQFAA5mqb7zXtPWsCYxnsfLZZk3rIBAguVGLuDg6suJ+/1nhXpeRZPVh2vye9cYtlHCST8g6ZzCujmVjVgYyPP1+mzXlg1SuDNse31fDJkhJtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etCwlerCr4E1zw5ylSpHDurIcyg7FosBNiZ9ksRnU/o=;
 b=oDw9QGyqFdFBFaKr0F6Duf7bxuvh+PferUsBnakY4bs8W2DNVFK0MkNmwi/I6qpkaFvcpvRJYyk9mz8sWAxZxsIxonhRZQx5mphHIWcQtZaONOnXlZcb9Ehp5905G8NIVqS475dSjA3QrGAGQuSp9OFDQ5tASNeda4f5/Ul0YvZWS2MgT2PNrUA6EL9FAMy/aud9csfTBVNn02g82zG98dQQpbMaB0U4qrYL+mwnL1mbd/knU2/c2g+NB/povjUTIWkxwCGGohdpWndrRuIeiL0whL9Hmzouj/oE8m0QmCJtZ8uud1nf2J6E7V7pZ2owq73gIAnBwOgT24YMj9AV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etCwlerCr4E1zw5ylSpHDurIcyg7FosBNiZ9ksRnU/o=;
 b=AnjtzhAd46Vj2k97Frhr0/9g6Pwklt2mL6wHBkgh3qNgsMoFEJYQupF/4Enp1PSO+MyHzg6BJlN0sQ4KPbCWPy9X6l8bmmVyaPmdEBStneVlFoyiZ+xdrqShwqLImdCa1V3CHOELaxC6QiLBdRMaMqER28tPc27i/Kr9s3k/Wm27+jBld5YIKybUM3m62g4LXIWkJFaydw2vkUKP1S6L5cg/y9YQG/3TSUQgvebjVPiqIicfDVmygwroUZgD7KfXxQXadbZRYlckjXBbRWrv/1E55ZvMc+sQjdxRsLsSwjYIEGmJL/SXmF5aAD54h3sVGmpwMGS1jwbelxBFiziRHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 15:13:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 10 Jul 2026
 15:13:35 +0000
Date: Fri, 10 Jul 2026 10:13:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv3 5/6] serial: mxs-auart: clamp RX DMA count to buffer
 size
Message-ID: <alEMFiXjOtWufu2V@SMW015318>
References: <20260611033856.6476-1-rosenp@gmail.com>
 <20260611033856.6476-6-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611033856.6476-6-rosenp@gmail.com>
X-ClientProxiedBy: SA1P222CA0152.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d44de3-7c76-4adb-1496-08dede95cf91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IcICCr2w8qzCVTsB4HAglnujMpjZ0+GylPMvd7HyzPAWbD4WZ/HZl9m651Au2IX3KV5h3sIPFVap0W6oyL+8KqOGbg4uIyj9uRvFu/SwSZaRoXHbaoddOXS2vtQjra+V+OzTUdFbS7izc5GOKOw1J77F709BGS+NHurG7+JCRPgQoyGXeaBcX+e1IfnlIqep78hx8b8MhKOctDTvRIlMe8lpvffz5AK8bxb1YM7XFg8fK9nBHgWFZ0G9CnTydtbj/Iew79OMWbXV3g9cl4SZwXL86hPyDphIZ6ISxf4Gfxg/esrB/Ytv7o0Ku9f60UdgJPIsEgzcj7n5hb5b60t9tytIjMBwl7dL4YM9cwPBAC4b7LAey/aHfyKn584aLqBjzNpM8dP5+Rb9EhcPYPq62KHI9Kg1f7u68kX/wC/2ygvG+2I9AKdY5H5fo6kKZMt50Qxs/r8AbLKj+G5EFCH39eowa/6odPUe0l5AIdICy2e4ZbSnSeyCUdiYWqvj5ISwuuzXV4Ogxi0AwcViTmZl0fDgpcLsd/s5DS5fnVTxh1uGyuCZ9M5FU0A/k0v6tXcJh57pwcd3k+1UHfNAt8/dj44WfFvOncfbzZ7j9CBTyO4k2BhAJg+EB68AT5MmJBt6FRd35oxOMw3tdr6cnvAsJoKLxzJX+ZIRn5bMkKlaLu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uObcNk2BxtP0SFA3OS5EjQ/FXLUHVMK5Y7v5Cz7CAGayYudZblbobHnqel3x?=
 =?us-ascii?Q?g4VF4lXtRHeZa03BQI7KjsnTAxdc+ZxD/7d6eFURACytI7JV6f9nRHwcB0CP?=
 =?us-ascii?Q?TKG7n45mtCoia+ZtwxyLZGnVWfpeLx5/IswV6DOQXznmD//zvJOrYmujycX8?=
 =?us-ascii?Q?xnb6GMLyF+ygMCojRuplNPcZuPuoiQqjAbmnGBTDJVpID2ieydeg6lJbTBhG?=
 =?us-ascii?Q?qJ9hB8GOpgz7lqGJcidiC7V+8JpAbjyz5qpuKMzTh5hgz+plOtWdNUR5lUBL?=
 =?us-ascii?Q?HMzzWRES5+SSylrzTNrJcidsPwQ6b6p0NPFPQsl8+1klb3eIP8NofPClAl6v?=
 =?us-ascii?Q?7FnTU5/q8SOUiOCCBx/VS0VIEpjamalcg6XkFDc3F4WgfcVE3Jx5ZGz6eX9y?=
 =?us-ascii?Q?0fF6T89PgKVxGKmEdPALft3fQ9xzEFQHwMD/fpJpTvkena8k6wU/JmNW5V9x?=
 =?us-ascii?Q?GN+VC/3Q3Y3SWQRKC9D5SOY7t78nh3QtYh/YUYoKJLFHiZpW7aDWbqHeTCct?=
 =?us-ascii?Q?pdsnpqhia9Oech1XbazFly8oO/1p2xmCfirabH1spP0XijS/c521oYMORoPZ?=
 =?us-ascii?Q?Wc2Wpdtq15dMXBWB4u/Eh1XgXJdowrWTjccOMpXSXsCh3VyCgc7+DekqDjFJ?=
 =?us-ascii?Q?oy58CiEojF80Ik6q2nFasSsHrhFXhBi3zTFv1IN6ugVDMu4F6zDbGm8oIGHf?=
 =?us-ascii?Q?Qt14glejF4/GVEQrBqx06DhGBNlks8AJ63FHFk9VI8b1iI5fxYF51+Nf3tZN?=
 =?us-ascii?Q?rHDo5s/dQ+Ak5DZwPzpq3RvEXNk57/DCJLDDihfcaH7KKpzVa2FjHTol1bRt?=
 =?us-ascii?Q?gtyfHl0MBpOIAdVFiUg7cVwmx2GWBuai6mWKmMI6VIIKU0mNF05+eW44smFD?=
 =?us-ascii?Q?++RJkHcFLXKJfFAdInJexpDfllmPuOTTzSb8C8qewyBCH6e/Z/xut1OfkN24?=
 =?us-ascii?Q?Q0pmiCSfnirrpBoh4h1tn+f1R6s/FqB6AmNABjmbiibnytw3UixV5iUDGpRL?=
 =?us-ascii?Q?S2YLZqv0/iRi1p6NsiTRwIK6wCxXUWY8mctkbAEQPxuse7iW6aFZetmWdw+C?=
 =?us-ascii?Q?eSTfd1QHOj6Od3Dc/gLm3a+0PwYi8BppftjQFVii2UZivlxEywaE5wGr/8xK?=
 =?us-ascii?Q?ho7me6f+kQ+i0cBvLHH2p5oTh/ifDWrhx6vY0VU4ctNtIB7a3aRVmTgW1EGK?=
 =?us-ascii?Q?IONzMRLArp3OEz4ZBnSbNEf2YEuVKEqq6DSDGI0bWH2UbAs69/KysH161142?=
 =?us-ascii?Q?L1h9SO4xMnIrEF8TPldPcv2yvmIUZUCryXjSqIWxZCBnWAzWiWgFJrTw/Ryt?=
 =?us-ascii?Q?fBXUGJ8waYg1h3wsZs915SPrmoAKNCdExUuGfV+Vth/W9nXqVDE32ledfeg9?=
 =?us-ascii?Q?3uacN9KruCfnKZdrDCxGll3V6F6ihz4qDGa8PN8ni4fRouzZZfRTn2VgxvuU?=
 =?us-ascii?Q?7mru7rwQRkEO4MR60X8ZL/jrx71OUCH6rgeI5lK4U40gu0VVDtBg7HmsRkNQ?=
 =?us-ascii?Q?1aGTAMT9YQqbz4qwc2thTMC5oQf9Tc63ZmJXamcN1XhcDpldEEY/Cyo34HZ2?=
 =?us-ascii?Q?/StJgXarjAmn3dTG6mxQAVGuhTD5V54sPx+Z3/3ZLNh8EPZ9vfCSo7nUmUeQ?=
 =?us-ascii?Q?rWZgywWneJAu/Hj9b88kWU3UovfEZtWPSpkG/IkRxsrD9c0jZdIQHeEcH59t?=
 =?us-ascii?Q?4gWLakgstHw9I45MUyQzOZLvYkQuyEZVU+MM3fwjqzZbitLGXvZfUsZ0igua?=
 =?us-ascii?Q?Kf+hoJz666+InQY9IeH3WyzH929zjBzsj6gQGl47u7ay+EBmbHHs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d44de3-7c76-4adb-1496-08dede95cf91
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:13:35.0199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVzT3hwxQoqpHLsTyKj2dj4lLUuEVFGxuUzViJrwUK0NOnF4mjWdJ5sfTFG7MR9II3W3ztirqymQ2LBIPEzBuRbTLh4VS8kak5fni9xzmHerR+4sRWSBqJR2gEzOtU+r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_081339_605935_8AFD32FC 
X-CRM114-Status: GOOD (  15.66  )
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

On Wed, Jun 10, 2026 at 08:38:55PM -0700, Rosen Penev wrote:
> In dma_rx_callback(), the RX count from the hardware status register
> (AUART_STAT_RXCOUNT_MASK = 0xffff) is passed directly to
> tty_insert_flip_string() without any bounds check. Since rx_dma_buf
> is allocated with UART_XMIT_SIZE (4096 bytes), a hardware fault or
> compromised peripheral reporting a count larger than 4096 would cause
> an out-of-bounds read, potentially leaking kernel memory.
>
> Clamp the count to UART_XMIT_SIZE before use.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/tty/serial/mxs-auart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
> index e2b656638ab3..fe48a372d022 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
> @@ -823,7 +823,7 @@ static void dma_rx_callback(void *arg)
>  	stat &= ~(AUART_STAT_OERR | AUART_STAT_BERR |
>  			AUART_STAT_PERR | AUART_STAT_FERR);
>
> -	count = stat & AUART_STAT_RXCOUNT_MASK;
> +	count = min_t(u32, stat & AUART_STAT_RXCOUNT_MASK, UART_XMIT_SIZE);

Now, needn't min_t(), min() should work

Frank

>  	tty_insert_flip_string(port, s->rx_dma_buf, count);
>
>  	mxs_write(stat, s, REG_STAT);
> --
> 2.54.0
>
>

