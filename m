Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28080CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzVOTKhM0F+gfjJRqo5IKBO5G1hN2EWFPvj2zuTueVE=; b=wQh2O/PfUveLCXPA8oDwN5xvV8
	oBIhZVcDyqR+r1pP+1zygBSJhIyRcJokSwGi09v7e8judO1EdF+z7GiEQqBK0crOTtgRip1CLwde7
	7YVmlStpit+V56oIAuOJjYc815w6ycyvHj9Pj19mRT04EFeu26oSemvk2N8i61l+nkQT3q2mhNFpa
	RL1Aur/wChyRZhnkE1gJ0GxYRDTjxq3LZavUcqjlHiRwhd2Igs2BUflN3kWZ9foO97DircckQtHuR
	aDRGAwSRMc0sl+6Z0wSpIf5/5I/M0EgFUVwrhyd/i8YRL7MQu0iLCfo/lEqLhycpLsdFxcsi1gopD
	EAiX25LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUUv-0000000Bf2w-33JA;
	Fri, 22 May 2026 18:21:25 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUUt-0000000Bf28-0f2M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 18:21:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Abt8yWESjlf3U6AmXAKtt8Yl+ICrUGZcwKZXN5A8x2dbo4hTGH9bdPRhzYKPGWXhHpYqXykAiQnlmibeV1D6FQG3/qDJwgjYy8UWHDcfQ5lGqa+pj8DVyrVIShplOtnFb336X5QfQi/QgrMlIrdTYrLnFyaTQr6is0AG+5hB9/60OFWVkoVVa0VSsicjuOlODdUQ/UhnYs+OAZHMSNJykAItIizA1yZ2Y4mfrAYSt4WkYA2iTmJQRFrug79TZbJFUsH61Fjmia8EooCTt3a3NelDWEEHvKRDgpeqxG4DTd7yQmSuf3vxRKofeBTpi55HGHbkE1L1lL3lC7fUOEMfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzVOTKhM0F+gfjJRqo5IKBO5G1hN2EWFPvj2zuTueVE=;
 b=PUoorZqNJKkLkiK0tOxwnXW+n1K7csWb3L/c8EwBRhiVN4lmhLGyYnFZo2Us2L+okEZmnwOowOZVzwDaeY+kmf6veeOqZgptayqmh/gmTC8RPczZyPBeXhbIbUoMpkSem+n8d8ceYOsTThaJ8IkK/E3P6/chom8vXsRcjAgEEm7tOoZT541IsdWycIPfdBiUB10WsFsyHtBHBohYMhHnndt4J/OGq+8Wu3KkA1elfHmh9m4J4BUz8B1XdhuKsJZyxrwPFU/KLbQEOj6puSMEf1hpXDuyfpiw0DW5iaPLTSrm7DqkAGwofXrAW47kVDh+LwR3pbPWe76+FrvmXVKeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzVOTKhM0F+gfjJRqo5IKBO5G1hN2EWFPvj2zuTueVE=;
 b=BOtTErkXjH4H1NCCX4aAv8MLcK2CvcRQAfp76tAeXnHq1gaHVyszkK5qextQ6QFO/MymdvhYnPgGQUHzyRv/PkHjuHT0WFqLvNnKUShNhvZZAyCz7i7LBl8WSI2ZIwwEmLLQvoUbSjmVp63mRtGXB+wlqWMqXfMxKYIwCknZ4jb9rAl4tLOdiCxzdeDIGsADr+7iR1/H/W3dGpkZUlWdlHW6eThMP6o9yYQXE+SJ7Lith5MdPTYkw21wAWXnC2aGIiVcoXnFNPOCfNIDLyWh/gHzkyB1FxgXfIpMEKMqYD+8xNW/LAuiLTqzM8LhlkRMMS9J2IKDEGJYLqVpv2yfKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11546.eurprd04.prod.outlook.com (2603:10a6:800:301::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 18:21:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 18:21:17 +0000
Date: Fri, 22 May 2026 14:21:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: mxc: fix irq_high handling
Message-ID: <ahCelrB6NWBy9Chc@lizhi-Precision-Tower-5810>
References: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA0PR12CA0017.namprd12.prod.outlook.com
 (2603:10b6:806:6f::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11546:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f1b10c-df23-47e4-a0eb-08deb82eea1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: yR+cEr0DH2XMOQF0YX/qpWdC6gizE3iCTapNaD/jAjS8HFwqQ9TNFOPsZr3Fcq9+gDdmDgqG+mpFNXvfK2UhaujdE2odweTKp9e5yKWoOFmhyNn3g0yk+KfKDiV9Fr9WgKVpD2U/nd/YeM3VL7zV2BxtkJqosBew8heRIT0IamnMXHpSTHkpgHCHcTfR/Ldeeku3zGNf0MM98gKerPdde24qrKIVV0VSCgSCK8vzG0VdUTLEXu+g9aa2Fy3DU5SSfBY+SJwz0uxmM8Fhb5DuIxZgpEUIE/EL0LtewD9u6LAceA+IoIsspwLqvK2sKae4M8JZbcQG7eMivufSWpTKMg8EA/S8zVS7aEkqISZI2e8bRaHQA7RRhretY7dRmdPZrj2p1RUQyDPASqttOrUzDSr5KBrMcNQN3G1nfA4jBUh+QWu6sgEzMy0h6hN/wJhC75vpSxQe7YfYZ2IC2kmfIbUZ8xwBrO1cTX4cvbhR3Cnc+mch+1kOF+eXxaqEja5/YlM0S3ldYOWs+/yBt2eXV6yX774n3DC09djkZawNb1wRlXyJD59xwr6C24Sc5TpDgNzL08ursWylb3WDa+SkANrQSTrsOJBsxjtZrkaZQjMdRTvCH39RuDeJIKAwRfGanGqBFXoxMSNgPLSS/Kq7eJSJMs4lkGKIiN1s19uqzSQ3u0AuQHsPR1AwNuhCghMitgCZnd4PfiWNwNonouuSQ0XeAvqW3AZJyNgNQ+maiJieh6+Ylap0x8yn0C6gl0RX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nANqjGMRIqmvF8JiprvF2EaO4RRpXyb2rTBq4x8SeJ3fQuofbDdCfEEegjc9?=
 =?us-ascii?Q?Dwfq8EL8N8dqCkf/XFjUgqA594o7R2CXkWNiB9vlkZQE9z94+2BQ6TyZ9M92?=
 =?us-ascii?Q?1cN1B9cASrcee10XRZ3sxVoXP6xqo7aDTcXZjG01MwvXMNzQ8H2CToo64JgC?=
 =?us-ascii?Q?CE5Ugo9PaXkkPxvOmtsBbpQVQqK+NJHmWo2if2zI+qaOPGCCBEniak2Ji6fw?=
 =?us-ascii?Q?AguXNW9jikHQ7bcenDMdP0E07Oluro9e6vWPknw8NA2CWSS1pJRNoCV/UPgd?=
 =?us-ascii?Q?bB41qRyU9paBFq4q/1nca6mIh2hS3oqgTQs1b/0qCM39CyJsTYWH5HBgsDAt?=
 =?us-ascii?Q?FZd/Ft5px5L/iHjoKyQ9WkPCvg5jBgl+ISO8VOUGTPrOZnJ0YEPRuhGaKH0Z?=
 =?us-ascii?Q?QFXgguGKRLpCr21Mrbli19R5Kdf6I6gBoMO1NsgsQ5WFGijuK6lLme2KdtC/?=
 =?us-ascii?Q?1YX3pV+zkH8DqpIbnHnR5Y7ed31NQnDP08GybkrvQlM4/6NABQk4lpVVzlu4?=
 =?us-ascii?Q?KGfbGgc+RaItChk+ov0sOhANC0rIa0IbM8Iy7p4dM8cMc9zT3gLZzlZZ/fIN?=
 =?us-ascii?Q?gdCZZv1lw1PfgWQxZSRZJZUTmlWaussPl5UaBR/gV8QzdVr0M89OUA7odzYO?=
 =?us-ascii?Q?kfIzocYyj861RYXOVJg1vW8q0ZB2fKYjXPgz6Jux6NNrhLb17V98PpVAeYZ9?=
 =?us-ascii?Q?IbMjWN0hiayYjjPDi3fIrklhZ3F3QgV9Mit/zsVYBI1tuge64p1SB6ggRIVX?=
 =?us-ascii?Q?kJWuTeYOKHby0TwkvftR1XgPoTmq+xH/bHmQZlM7f0eC6zv7xkgOsMffvJNG?=
 =?us-ascii?Q?T/4j7y9BzyUxcJLQgBMFldo2m1I3ZkPAilEI1LeDUoydMgjnflX1OrOmN6ZF?=
 =?us-ascii?Q?RXdkp93vf7MAud/2jMrDOrQzQyBZc5RvkiWCG5djdE4sFG4QUkDAKRuWh7G8?=
 =?us-ascii?Q?mnIv69vWhHyd6VCIgJX+dk352uJmft6p5KR99SJWaGtqy2dLyCMmkttrHdBP?=
 =?us-ascii?Q?2MP3f1pO5PCcOJ1hQMRFQgXgh6HokB7cE1HmyVpVBIR4UiONuoSBGz6qyI0U?=
 =?us-ascii?Q?xI1+hZ0Nw7+vbDzjgyFqqfNlf+B01UtGmQkfY4B+pbJrNByp0Pb48xpqZZ1T?=
 =?us-ascii?Q?xkYtPLLENjPgYXSn3wjE01fZ2If4cV9j0DYfY3FYiwMYKbyd20QbYOWrlzKd?=
 =?us-ascii?Q?obKrF/Y1FVCoygsPy1oNRb5URbBUJifypfzCNvYj3Xrn7o/kafhr2qBm8MuU?=
 =?us-ascii?Q?M8U6nXir/5VDIBAn9NAmsi+gCmBTM9fRvsmAUeplfV7UEO4x0yR3M5lm4Mvn?=
 =?us-ascii?Q?eDQXvVLn9A6c041ovStabID32O2n5Dg52ClK79X5XZIC8gPVps3rsiPq1q6L?=
 =?us-ascii?Q?zhNef9T586V2p+IetAFTLEUkYXYJCLzlb5oSMLn84f8ZupfODh8CdT7jjRwQ?=
 =?us-ascii?Q?uMQKdJli+v9aHG8maY9pQUH+D/IyzL61Ct5GqE+qhTHxFrPQZ+zllr+2M3co?=
 =?us-ascii?Q?xxaW5sw/AIgL9gNjqOnybu0l7lOIjhZ66fneKw6eVjQGvCdE8rdjbT/cjV28?=
 =?us-ascii?Q?8gs5cQCy6u3O89oXuCj+FSGKiRTv0ZQEq1tgQNoNEscUrxA/M4zI9xGTnlP9?=
 =?us-ascii?Q?33vQ4THnGWl6qd6jkNrQezeEfVE4TXa5nm1FTGxGA7zJxca22qFvd3dxT6aJ?=
 =?us-ascii?Q?SnJwV0b3ib/PcNat3sJKbTlwRgPvN4PSnz8Z8z+P0uYjPJi3aDZUVcisPPcQ?=
 =?us-ascii?Q?linRnCUe4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f1b10c-df23-47e4-a0eb-08deb82eea1b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 18:21:17.1312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLrbDZPohuoLteDN0n+Bse62e6GlMLOBWvRBPmOuLzRN2B+6Bld3eURs9Ekfr/sjOL/AzGaihMEmEkkgPSce0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11546
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_112123_201827_3EEB2467 
X-CRM114-Status: GOOD (  21.40  )
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

On Fri, May 22, 2026 at 09:01:15AM +0200, Alexander Stein wrote:
> If port->irq_high is -1 (fsl,imx21-gpio compatible) and gpio_idx is >= 16
> enable_irq_wake() is called with -1 which is wrong.
>
> Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> I don't have hardware to test. I just noticed this by code review.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/gpio/gpio-mxc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 647b6f4861b74..12f11a6c96653 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -469,7 +469,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  		 * the handler is needed only once, but doing it for every port
>  		 * is more robust and easier.
>  		 */
> -		port->irq_high = -1;
> +		port->irq_high = 0;
>  		port->mx_irq_handler = mx2_gpio_irq_handler;
>  	} else
>  		port->mx_irq_handler = mx3_gpio_irq_handler;
> --
> 2.43.0
>

