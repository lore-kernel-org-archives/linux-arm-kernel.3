Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDB4CFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DQGnQVCU5MzCGy/EMVSQp63NmPezi19zgM1YKQ/aOE=; b=1m+izClXcMr+YMO9ypvcBRaKpu
	siLW0R78EOu0sLHqgGmpSKHqHO8KdE+TwU+slpqQjvZC8IeVelwtXw+rnjQwe88MxBJNU7ijjNKAN
	Y4WuvYnTuO4uk+5ef+/fdGhHNxFul703k6Z+qGJAvRRZnMcK/7bQkzdHHIu9GwTri/MyDiTA9CJxo
	WnusbNjIY2mc8Y9GcKUBvJTV2cL/tLkwHTWYlQ3Mmsy1mWoTFLwNjzsih9Sc3VdHQGG5dVl+qroXA
	CqN3Gd4AO9063j3FpWOiXTriO4KzLnfuqYvKEyw3v27ExKa94XeGtYfKEQg5p1HaV+z1gRipmf9Ki
	YT2/VqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa7X-0000000C5H8-3gxB;
	Mon, 24 Nov 2025 17:12:59 +0000
Received: from mail-francecentralazon11013023.outbound.protection.outlook.com ([40.107.162.23] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa7V-0000000C5Gi-0s0z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:12:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3cNAeMl6d1UMBj+omnI3OZZYlhozUu0G1Hboba4xe2AsRKEz4rXTGJ+zZtjRpcJbWPCLaIV9HkstQNO5Mv81KYhX1d4Tf1VYxt6cwAT94TEOthPtaZof3/jIhKM/kI4ZBF7DsVSQP8gTu1vIc+1BS/SyJQ171ulXXZjkRVSlayd6QnN0zSCkc38LP4iTRKRoGcreTPdM1DyoQFtYkynMKcI41KeOAQLr0OcyyaMQpkDQYrLyoXjG5II3uoGSym9AHH1jszL4+qRDIriF9uykBeQJh0VjS/gs26rqObrDn/tgdevWAQrBcmYGdGOhq2kLpeCo+DiN+kyeZTbt/foSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DQGnQVCU5MzCGy/EMVSQp63NmPezi19zgM1YKQ/aOE=;
 b=i2Tm7wFa6Mft6OcGpvYbIsmbunbTLpj2f2cOPcXJhgHpCWldyF3O71ZY/ebBvC/EmxPd4kRpr6HsFS5wKod5bWNLxviEsIVkhZWKdq16nWF7yg5RTCqOmcWRFn5EB7KaO9FwujJUgY83qaaTJULwRUJxsTCMqnd6ozDpFuUmkgLOw9JODPpU7EVc3hys+xj7+NibXI4QWjgAwPpSPEyypWTn9cGitTS2QJsbqd6n97NUavnQtBdjE9xYfOZLHFoESXMGo1iMIkrcbagxRbUHE/pR/GMIe2KVz6W5s3Un46sLCZPryAR36unLDbRNPFuN+TdNTAw+4Q98sub1Kk05zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DQGnQVCU5MzCGy/EMVSQp63NmPezi19zgM1YKQ/aOE=;
 b=R8kBVaJSBpam38T+9gsnYRdVV5vopLYjpiwBAm0KpXwcbWjUNnqblD9u6lPp2FIbMMfsW7aWIQpy7e3XmMPzgPtHP9xaZmrymVAS8GwbiOFPzZXx1X+kQoqo8rDgFglgM+lp+6NBk92pdrw2W+3N6KNoFmVkcqLqduqE66dqS0xIwI5+Nqjae+KiN4OMXuEKMIBF4R7lPF6mwMWNeJr+0IURiMpV46BY51iqa3rHwoO3ccyv+u+WHcuHlHWxT1/3QIFpPZELvqpQamXR7bK+RXEQpwOjpjomzp1N99EMNvBFMZh7r7ivzTUkrJ5+tXAXQmp4jJxg6A7LLTzBOAhgBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA2PR04MB10087.eurprd04.prod.outlook.com (2603:10a6:102:40b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:12:53 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 17:12:53 +0000
Date: Mon, 24 Nov 2025 12:12:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Oleksandr Suvorov <cryosay@gmail.com>
Cc: linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: imx7ulp_wdt: handle the nowayout option
Message-ID: <aSSSDBKl2vvQCRSw@lizhi-Precision-Tower-5810>
References: <20251123202437.2340955-1-cryosay@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123202437.2340955-1-cryosay@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA2PR04MB10087:EE_
X-MS-Office365-Filtering-Correlation-Id: ef42d089-1c92-41c6-864f-08de2b7cb418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z8NzOSFiA4NyDn2cmdnb7OgpwzKHFMu6BlciY3gaSyfYoN/T4WSb/a9YUeQr?=
 =?us-ascii?Q?EqWy30HmAFlfFLkafUCUz8SwePPnhKH5LjEraV77wJvTAPJHO5O5VtCsADUt?=
 =?us-ascii?Q?5i0uBQa32vOZMfOHDrz15COrMGvs+d5tM/gi+b600j7LO3ve4osUMkRwfkY6?=
 =?us-ascii?Q?9eNBYwi7enkaB5wv1gUqnS6MsOYw5KZTi5jAVikvMhi2YHAyxGSmQrJTCQEe?=
 =?us-ascii?Q?VbVODigPxa1PmEAJ7blaStfWtGvxjAp5t0TZsOgRO0tqswZ+E0aPVb+KtbRE?=
 =?us-ascii?Q?o0kR8isAdk5vkHbkDMQmEEuI3qbzjgEplgVLQSO8rqm6YEs0x5IIOlIEWol+?=
 =?us-ascii?Q?ZqPJHOsPxxlFQLH+JhZuNDXhqtZI1mJPDVcfDUArnK8Nodz429A5NV79r7Zs?=
 =?us-ascii?Q?P5/GPGqFYbBEZOTzzObvDzTelk4G3pboDL03DRs1X9e1W/Zx0m+qT5Dy/aga?=
 =?us-ascii?Q?14CtiB9ADvwgkiSACdh/tx9wi4WAEvsKb1TP7wQNnFmkHheUWfW1QWBQ1ZlR?=
 =?us-ascii?Q?grZhqoBRuc76G8LDGO2YDpSxA64JlIMKQZgBJxWJJSPADcOoBjqhwmGAfltg?=
 =?us-ascii?Q?52kjI6fnVDyJKV1wOpvxQTeisMR6ryWszGCTfBkwRHo4e71KlVG3AAatk+lp?=
 =?us-ascii?Q?q0s/KeyJyDYxXMr5Xgel5zUCnFZBkHwH8DBay7N4S1/ZQz4arbmsXhGYYcUd?=
 =?us-ascii?Q?inAuovxPZ2d5kxw79/bss5TodM4tQyn3mIYIui//ZoY0fg7O+5uz0YX3sMeg?=
 =?us-ascii?Q?MB23GJAuIuKYsyYKFD2NENCULYx5VFM4/JXoZAAGezeKNFBmU83ZTfr3gy6l?=
 =?us-ascii?Q?W5SsJFEbiFwnb5soPZpcUsgDvDTVq1b5T5f5Qfgwq2Nou2ej4zuqgS1Cff9R?=
 =?us-ascii?Q?itE8eVi/dd7vCspEWbBP0zcZyXxYD3VR5cHF+DjikvmkTzsTaDgkQ7gTYoj+?=
 =?us-ascii?Q?dgqQwP5WJzbH4ZoMnZNepwevdFqN00taKCB1/fmcLtEo4E7B/g6AGSybZxEX?=
 =?us-ascii?Q?EmOKrLRagj5WB4NkcuUpZJJa16j2tP89HOhASGtK7CpvuscgkJizZYaX2TYS?=
 =?us-ascii?Q?l63zD8YFuBBNY5WAVLRuVmEn4uKKg4Q5xTNTK9OxhisPf5tsG2ss2YO9leD4?=
 =?us-ascii?Q?FXqQL1s4LunTpWF2NQNiAdC4JxubcfAjANKMWLBe7DeiFsDUhg3A3JzHxep5?=
 =?us-ascii?Q?mvojpLUr/XOPGuEhnJbaGyeevGCdey96kzkRl3GpCbnGmMr3uqqcVgtE/06x?=
 =?us-ascii?Q?xFr8YuTHxv74k/Y2hOMG0gtbtT70veABrkCrlGEy+CexCn5sxg9ZHdGVJdmH?=
 =?us-ascii?Q?Yg0BXmFLLHCnMNkNl5dTzpHqXm+mzQXk1bRoYyIeNFUpOKXZL6Ck+TKEnnjh?=
 =?us-ascii?Q?zzwPUyqdRSZ6fxb3y/B9tyiQRvtKmnFWyyenAtWHXgTU+0j8C4vj9H1ttFum?=
 =?us-ascii?Q?fTjSl7vqznlTtI/p5H/VYuBxREB7sUMp/VrbU1RD/g8bUpb8RLiti4GR86kz?=
 =?us-ascii?Q?pLTen75ylKJZHstorRGVASmBNcytwnikgQpB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FnolFxNJzzVER28y/y8ttZQiCnCyNtT+WQyeUppo/vCTJ5CAh5lrgGVvrAB2?=
 =?us-ascii?Q?27wuszeXrQ3eXsgJEfdr73Jr2gfBnZrLONCV67zZWVRWmxYGs5/rl0liIvPh?=
 =?us-ascii?Q?p9k5dhPH2zuZbd/bl5naioWqBJMzjJhagmQo8lyR8OJAljj6ETIKrSAha3tK?=
 =?us-ascii?Q?pq9sVY71dtpaw4xbwtPYIZvC3u5ZAYdXT8p494uI7CCbpbDL6pwUr4ql0PAR?=
 =?us-ascii?Q?UgGQH6jFOfJr1zhcpiJbXulssPNyD4wB/rsL6hNk99Nssjhr3/vj1SLALXvH?=
 =?us-ascii?Q?Y839INfC41KE8BoQ/p9Khmmt8UYvLamksiuLxtCxUhR1rnaipXHbYgNsgQQj?=
 =?us-ascii?Q?ieXIRhVuLNteTsDM2+WTuIrwUkd+UwcS2uEHOFope3uoMO+kAIiZPt3eIPeD?=
 =?us-ascii?Q?/8JobaRM2xP5E1zSIi0WGcHIVz4pNXwg8Z8jS/wS6VEEQPpp0Hlw9rTnH5Qh?=
 =?us-ascii?Q?qUAF+KH3EsuRzq8ysCgnuhGFqCBAsns9+PdUiX+jbitsrfBS0dNhWm+4Viol?=
 =?us-ascii?Q?4RR5x+rLsjP3f4fua55u0DXhPVI8hWNYNalueBxqG9pypsls/jRXY+xpooXn?=
 =?us-ascii?Q?w1vuoYJl5dsRsEp5zb3v0nNPFAm2I0Iu80KycKt8nIl3lKsWV0Uhi4HShPyl?=
 =?us-ascii?Q?IsbS2svBi+Uu0kCJrE6ESDV+nwAMJmNV3q7E1xI2tBsLuqrhu9Y1t9mdyhqm?=
 =?us-ascii?Q?hcf8uhgXKbeE7CVTZfrKD764gKKX12VKOSJCynr7R87Mt3nujAU/zfmSbMf3?=
 =?us-ascii?Q?/xqSXIcXUduFWpe7dtF1prRmJhukO2CnyEnzfnMjUFlIw9kjNB5VDqmU8EJr?=
 =?us-ascii?Q?VtQozWO6zpiGTjd3DFgU9mFVh4sJMsAitLEn2mqiBMCcQRFcE0RFxcAa/xLL?=
 =?us-ascii?Q?muMopCwvmZRdUgnd61Qo2k5OuP5ueOcZjoYJeaM9Alr0RwPGZNCc5lWBb1xy?=
 =?us-ascii?Q?fmqb84wlfRvF9Ezgf6BntWvETLNYeRhfASMIABZUNfeF6nzRyWB91TDU0XkM?=
 =?us-ascii?Q?VIkk/UMTWDfWn5ssJy1BNvg3KWWzQw+v1Mud9jUaWY3DXRI7ZbhHeCAMaiTS?=
 =?us-ascii?Q?G2BAivblPfo9Vwplw0H0RLNmT6xEhX6+wbiSgHBOciRRp6sXcagPB5cuHZmt?=
 =?us-ascii?Q?sly88v+Mnam3z4M6PM0A0JBMh1mBp+aEiqoDh81gTj0mJn7vRrUr5m/OKDPV?=
 =?us-ascii?Q?VPc1f/yScPSNDVWdEVhIpDjNSwGszJzWAwJqSmfrCHcML2spjaZNpvEF+CXY?=
 =?us-ascii?Q?FaQ3+qAq/J1F/oIdEjqEI3G1UwslAQwRt3WGf4Jw3JcVtw1lOA2P4S6ZV1sK?=
 =?us-ascii?Q?a2REOw1mLRw9WZbN4vqvY7kGq4BliHNqOt8aMc64w6vR2sMm1Fsrk2974Et5?=
 =?us-ascii?Q?lSd8lNaLO0NQZZe6GKlTy12H8/eWtZ/Bu9CuSRDqW0hh9yGRNC2mJMquK5rI?=
 =?us-ascii?Q?8T6rOvQZE5qceM2JbaB/6YfqFn0B4VTEeV1nhQhvEgsKmE0IBMTVcbEDWHn6?=
 =?us-ascii?Q?HltyHks3SvaRDiLACrmuLgwuWXbJvFZX4V0H1Hy6KmAWnxw6FIyyQS48Du6D?=
 =?us-ascii?Q?VqcKdhO5cRf4b32W2NnMYHnGD/N6M3j9wgV+dun2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef42d089-1c92-41c6-864f-08de2b7cb418
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:12:53.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zw6B2jnRDgt+qXmUA+R4+sqUlZt4eG5dUo3PoR/rBiGV71t1h9vckgtUvDm3T+EZGPr9psEvU/07/HeHa80e+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_091257_246836_E2D2DF32 
X-CRM114-Status: GOOD (  16.52  )
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

On Sun, Nov 23, 2025 at 10:24:33PM +0200, Oleksandr Suvorov wrote:
> The module parameter `nowayout` indicates whether the watchdog should ever
> be allowed to stop, but the driver currently ignores this option.
>
> Pass the `nowayout` parameter to the watchdog core by setting the
> WDOG_NO_WAY_OUT flag accordingly.
>
> Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>
>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>  drivers/watchdog/imx7ulp_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 0f13a30533574..03479110453ce 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -346,6 +346,7 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_reboot(wdog);
>  	watchdog_stop_on_unregister(wdog);
>  	watchdog_set_drvdata(wdog, imx7ulp_wdt);
> +	watchdog_set_nowayout(wdog, nowayout);
>
>  	imx7ulp_wdt->hw = of_device_get_match_data(dev);
>  	ret = imx7ulp_wdt_init(imx7ulp_wdt, wdog->timeout * imx7ulp_wdt->hw->wdog_clock_rate);
> --
> 2.43.0
>
> base-commit: 1af5c1d3a90246a15225fc7de0ed7e5f9b2f3f98
> branch: master-imc7ulp_wdt-nowayout

