Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6320BF5A8BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=So9pkkY9x6V0ERELFPbEZ72wKSkk3hQ8uRn6Wt7GMuE=; b=kvbJzU8Lo+NB9UPHKpu/yv9ox+
	9MCmeF/q7SEw7NeBJkPvhP7yr3z1SVDY88copcNUoc5EMsokdiWaVawRb82DaIBK3rn39NkjKeLQ7
	MawFPV+rkCuJ3QH5Aj28CkbYWt85d144c9eo+wofyVZ7+7g5l0jLTHh0oBbFru+286tUP3V5g5J9s
	peQIWdCPQcdl3JKLZg2VSfL2S0eKNwUJ4Px3MZgpXywLic93DkABX2xT3h20ZkO/7SBely0auIA07
	g5U5cb90rXGnL10ml0YCY53sRjEp0ixVIe4g4HzhH9R39xl6LgrTkfKBM9r1BajvcQxfuEwUcsYPH
	tGrDshxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF0vq-00000007wId-02kn;
	Tue, 21 Apr 2026 02:33:46 +0000
Received: from mail-westeuropeazon11013020.outbound.protection.outlook.com ([52.101.72.20] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF0vn-00000007wIF-33kH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 02:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhgH1pQt7Qu5HuaZLFphZO099zR2WXxUD/KI0kPSSt1R5uJuVWuZJB03M6hmOIAxb3syqwrM/b6gF55LKBvG8KQ69pUa9rj+ACSGeRAvwxmUXCLjzpnTgDHOXXsWHuuMxK2H1VES3NoKHt+qdGtA8o/r8Rk7JZ2hZz/YXBqmTJWigd8SrjucJCexo9jhGGJt86GvjrU92t0Gb6Xuei0On4F2Mi3PDJCgYNtAWbZX/F+6QtUM5ECfHtI6DozyKYoqV/XNGA9Lsri0yAs4km634bzel09PYEuMVU5xBg4tN3+LJcSlrKMyp4kKnbisGQYVddvhf72zyxu4Kx/wqMQWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So9pkkY9x6V0ERELFPbEZ72wKSkk3hQ8uRn6Wt7GMuE=;
 b=pGiLjXtpakCCQ8GnVVFo3wHN8iCO1Y69PB5utCmyw2vNEIE5XpacPctYsWzq7OioicK5LpwE122b5bnAm/LLFboZf4vO3w5IBtRRbtAJFBgYffX+QNENUVvYD/dRnt7hYkZGfnR4QUEGWzcRK+oC6U7nWWJpvSoRtpusIXPwKRfEO9cZMmMAw+8DOVkx5/xAloIFtS7S2LPkl+lF377a2w9j9LfdDve//Rn6Xp2AzXs79ckKCRJZWmiRF/cQjYjc+Pt8C3PxVpw8/VfYZhk6IeVFMPnvFySYMy+qDuUQd7y9dCmiH2slv+wk7e5njQ0fNhYUNxQgiq7qNeRuMNLCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So9pkkY9x6V0ERELFPbEZ72wKSkk3hQ8uRn6Wt7GMuE=;
 b=Dz+Sz0GYU3PCddg8YTsUoFYWr9rF9BzAe3mlS1UmI981DsH2f0tczw2EIs0NTYfBpLn5VY9AclGdd+AQRjXzSqkRxph9uGTu5UpQoCX3xVf5pHJKYV55O7yoIaDVpZ0vxu3qCYqcFZ+ZNo5zrr2IYSBsRsMc10y4q/oRqf+SDWQXbC6G8J90J7mrvexE7nQ+D7Cv00bDx7nuDPwGzRxpQT6QFfgSckFXzsoGQc2b8iM84G5mI8jeKFJ5ZZocu4/UcbXhRZMXxg52bllBOsKHwFZHw3+/M/0khXAg8SR5TjUMY0rxz/P3GX7Bfb5CjDhYbFYjiaPAWSShUvAtw1220Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMCPR04MB12622.eurprd04.prod.outlook.com (2603:10a6:20b:76f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 02:33:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 02:33:37 +0000
Date: Mon, 20 Apr 2026 22:33:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
	bhuvanchandra.dv@toradex.com, peng.fan@nxp.com, sherry.sun@nxp.com,
	linux-serial@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH] serial: fsl_lpuart: fix rx buffer and DMA map leaks in
 start_rx_dma
Message-ID: <aebh75Od_EfYhbal@lizhi-Precision-Tower-5810>
References: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
X-ClientProxiedBy: SA9PR11CA0016.namprd11.prod.outlook.com
 (2603:10b6:806:6e::21) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMCPR04MB12622:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cafcda-5f88-495f-35e7-08de9f4e6108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TDltTECW8xyLUtDG4W4i2hoabD/wsA1drVZp+E2xAuBkCpSqGaRnG3EfwmtJmKRmGUd4knyJ/7pd+CHnEI8nCIMG6YWmdffWLTcrOF7QeczYGA4A5IvwFGQPjdUxHEXxmNCG/RpFXQg2UHhHOp+dv+KVc6nHO6GuK++0RcyDmAzLnMXxR1ZevFl96QSqPTKTOKsms8a4KZ2I66AOhRY9AMqouEsMmFsLZsXjfmPuhyFqBxicRQh3QqqcNMvvkdiU17iz8Fi8eg6dj+xFFs6KA27QvCUUg6DyhagD870ymPyXJZByt5/YMxNUcVK15dNSo4h3m57lrSgKeynj8QgoM9orc1H9bG9gXImSQzM1XWJXXbGfVNOixiSfEUtXzF2haN0HiLzfufLl7fcE5rhm4Rqb65kCJKQNKdaEyPTabgiCLaC+jPvhCctSagUGhhxh3PJXe+e0calbXe+R+yUpxBNM8jMiqo+DaV2meQV3TCtV+cUWJ5Zmuq2kLusq1OgLLIWGxEycLs9hVyopfz8SMR0++5WEBs4x14GtXfD7pj4qwe5qWaSuJqfkVPVhZZPlqmIQ80rrgheWUgSKQur1qpSBS3gG78BqUdA8MK8NHZVNYi2r0pjeyVFFyJ7gQefd9wSf+Ow+xFWV/aCP3OLxJoBcwdPzZ0WMtAtm4UCQ8xQb09SDWjL52o6ldJx55WqQqgbOPm05MRQZVpTyiVSfTI8qVd0zZXnAWh4/HauEFXNbtYJh8trAtPnj4VBpL3vHo+4CxhaXdiQuDNA5kAZw7FGX4QY+1fSEOhMZAb+oZXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?npKhwNh0VxeZ/VMiR5MUfMzROB8ZEOJd1S4JBiRroNsSPW/cUxhvOUbsIrc3?=
 =?us-ascii?Q?6ggDSQiKsWXYz6gPJOpA4qtVgslCDPqxmKIPobq+EIWkuqiBUVKmfYzUC0+B?=
 =?us-ascii?Q?KJTAaMFMzE6912OEL5/pU5B6cA81tmmRrY2Me58HjuvPPEjRJOGQrzoqFSi/?=
 =?us-ascii?Q?pvy6oqUwLkai7Fcj8B+8PKWdfc59DBwrYFgWV4z/m7vehl2+KIx0cVFputQv?=
 =?us-ascii?Q?zoXIP62TMe1V2qPs/7XAyh/04OELUlSwokG09JMQ1oE3VUugN3xGco7dUhAa?=
 =?us-ascii?Q?XuchnHci2rgKWayougsRZ62BiNsFy5E4ixnPwJMvcuU6qKta2jLS5KW0qQtK?=
 =?us-ascii?Q?AV+8FKHm9bl13AzEiDh0DEG1ZqHC128wI4azMOiUhjSdYlPnkTJF61KN5i9n?=
 =?us-ascii?Q?ZegJuEO02L/hYrkDba3AqAHICEwMOlHEuy9OSKekJ31D5JAhHjFwHEWsM4JI?=
 =?us-ascii?Q?Lehnpla62Ke6vCvANQpSzdUWwr0Wp3aAsyACgylWlgOiXWv56OgHHrBG7Ege?=
 =?us-ascii?Q?g3UW81a+rjfQS5tnjASUVo/Hy+FtGHs8C1qHLcbuzU1akis2LSNhsKueACVr?=
 =?us-ascii?Q?LpzAkZpgqgPtR+g0rHtlbBEz3QbG88v7S/TaTLSP6Mw6qXWsbnakA9s2EZXq?=
 =?us-ascii?Q?s5V4pyvT1OFxe9/y1KURiIXGbOQY44uhGgC7px0DtbVGPWjDEXLWSyp7XCLS?=
 =?us-ascii?Q?UTD7s5hoOdEwZt1d1ZDVKERnrfMPqKigjKHlVSXLc+kmafb3keLeU/DJQ+wb?=
 =?us-ascii?Q?j2Ug96DLaBYHVfPIjKhD49qBLRkccuqLhJDlQ/UI9qfwScSZtXeMUL9CKovh?=
 =?us-ascii?Q?T2xqOKicbW2tfiTK0GbsuMLJ/BZ4KXibWRPxrLP9pwQpqg15Hfvc2UZEyPkF?=
 =?us-ascii?Q?OeDyU3aBVk3sIr5K3x5vp5ByXfawor1q4w2fxULlombyxtOCB0K0k33ftFdf?=
 =?us-ascii?Q?F9Y8fjE9q7aqjuu/TvqbEhCDj4wCkBf+CjoNhBRXzYW+fsx3n2axB9JM+R6x?=
 =?us-ascii?Q?Jf9KqcZIOlAwAPfjtkQxKB4ndG6YLcDxi3vMZNZkbL/kKmRKyhZfssK1Uksy?=
 =?us-ascii?Q?B0b1ndFIfthQ+JHb8XHCjy7eIWMCA0V+Scds+70zT08rsoY/eDmy/Klh51YA?=
 =?us-ascii?Q?UtWjaAw5HVeiq3ab+A6g8SO7hwxEN/1nybBZ0PxPycYpxnKrqPgI6l5/I/cm?=
 =?us-ascii?Q?Qt9GklCeZ/+7pIHuvGWqHoo8BSnt+TRbM+CNniyuFHkR29kVlIQDs4CngIA4?=
 =?us-ascii?Q?E0rIMstbyLSQYWYLDiNd8Theejrn5OLKUZ/jP9WETNhTUEIkhgmPLcwPTa1h?=
 =?us-ascii?Q?DsWyswQHzelansv/Al4PGnQ/z/1GjyjlteXIiW2mRPO6mQkt9FJ3EB3/1kdR?=
 =?us-ascii?Q?PzzmDwSRI4ZPoRw+UIrku96Hh5PT9KO1K6SKD9C+IQflNwIlosQVcwtQ+LHL?=
 =?us-ascii?Q?pp9l9E3qzDaVt1gvPhhZWaU62oE/43Goxr80HInUu+oBck1sX6vdK8xJfira?=
 =?us-ascii?Q?L4Y9MswrolEOYTFAeG33alGbgARPjRlMufzWuapdkZ4dOLqWneh2Q6vf8zKz?=
 =?us-ascii?Q?CLU/fqnkpNTck0RlIqkDXzu5D9l/rvKhw1Pb1uiSXdHzd6huNFvd/Q7LP4S2?=
 =?us-ascii?Q?dT+7vCkD2Qo6aAnY/CFfMyU/oD9kbE7dlVQ3JvIGu40KpKMULeC7kjuPL2AV?=
 =?us-ascii?Q?wcMjYPt4rzB0sBI9hp7rlxa7ynwKLW1ePPa89j1ClJQvVTUx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cafcda-5f88-495f-35e7-08de9f4e6108
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 02:33:37.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/i+fShVQrKrLKlLaNwXzIrwiGjEPzwpAl94xxYBeIvuhc5Qnw1D/egETGqh6v68f6Z7Rq9vl5b8cvaCSKup9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_193343_808893_4D260C0A 
X-CRM114-Status: GOOD (  23.34  )
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

On Mon, Apr 20, 2026 at 07:29:03PM +0530, Shitalkumar Gandhi wrote:
> lpuart_start_rx_dma() allocates sport->rx_ring.buf with kzalloc() and
> then maps a scatterlist via dma_map_sg().  On three subsequent error
> paths the function returns directly without releasing those resources:
>
>   - when dma_map_sg() returns 0 (-EINVAL):
>       ring->buf is leaked.
>   - when dmaengine_slave_config() fails:
>       ring->buf and the DMA mapping are leaked.
>   - when dmaengine_prep_dma_cyclic() returns NULL:
>       ring->buf and the DMA mapping are leaked.
>
> The sole cleanup path, lpuart_dma_rx_free(), is only reached when
> lpuart_dma_rx_use is set, and the caller lpuart_rx_dma_startup() clears
> that flag on failure of lpuart_start_rx_dma().  So these resources are
> permanently leaked on every failure in this function.  Repeated port
> open/close or termios changes under error conditions will slowly consume
> memory and leave stale streaming DMA mappings behind.
>
> Fix it by introducing two error labels that unmap the scatterlist and
> free the ring buffer as appropriate.  While here, replace the misleading
> -EFAULT (bad userspace pointer) returned when dmaengine_prep_dma_cyclic()
> fails with the more accurate -ENOMEM, matching how other dmaengine users
> in the tree treat this failure.
>
> No functional change on the success path.
>
> Fixes: 5887ad43ee02 ("tty: serial: fsl_lpuart: Use cyclic DMA for Rx")
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/tty/serial/fsl_lpuart.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
> index f36d50fe056f..296a096be351 100644
> --- a/drivers/tty/serial/fsl_lpuart.c
> +++ b/drivers/tty/serial/fsl_lpuart.c
> @@ -1376,7 +1376,8 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
>
>  	if (!nent) {
>  		dev_err(sport->port.dev, "DMA Rx mapping error\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_free_buf;
>  	}
>
>  	dma_rx_sconfig.src_addr = lpuart_dma_datareg_addr(sport);
> @@ -1388,7 +1389,7 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
>  	if (ret < 0) {
>  		dev_err(sport->port.dev,
>  				"DMA Rx slave config failed, err = %d\n", ret);
> -		return ret;
> +		goto err_unmap_sg;
>  	}
>
>  	sport->dma_rx_desc = dmaengine_prep_dma_cyclic(chan,
> @@ -1399,7 +1400,8 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
>  				 DMA_PREP_INTERRUPT);
>  	if (!sport->dma_rx_desc) {
>  		dev_err(sport->port.dev, "Cannot prepare cyclic DMA\n");
> -		return -EFAULT;
> +		ret = -ENOMEM;
> +		goto err_unmap_sg;
>  	}
>
>  	sport->dma_rx_desc->callback = lpuart_dma_rx_complete;
> @@ -1423,6 +1425,13 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
>  	}
>
>  	return 0;
> +
> +err_unmap_sg:
> +	dma_unmap_sg(chan->device->dev, &sport->rx_sgl, 1, DMA_FROM_DEVICE);
> +err_free_buf:
> +	kfree(ring->buf);
> +	ring->buf = NULL;
> +	return ret;
>  }
>
>  static void lpuart_dma_rx_free(struct uart_port *port)
> --
> 2.25.1
>

