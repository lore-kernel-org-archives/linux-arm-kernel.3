Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33302CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7q2XrxfHI2F4jC37A/2Ev7F1/EsKe9OT+qstuGZnrow=; b=NequVfzbNMMT+DkpkB7qmj72TG
	q0cgLu8DQAdjZKLDUmrkoMHzv4OMAN1ZaU9vNeV5wo7KorI17Er/f5ncbY1B61l5n+92TU8gFZtfm
	DRkhd4iBUj4qlo8ApdCTFGDcE12dsMGjxpem8H896bPFUCNN+U7IvkxBnR2ba/dTMCfZZh2eQn9Tw
	np8jZxp93tB1FcDffbf5rLLPmqRB9vdLE97HaPjn/Wu6QlyaZ54KsTHmiN3g2YrpsHJ7MdqiJ/fT6
	fCdpP9eHkfZCzY97T8cOR7w3JxzOSYvssdWC/Vw3lFqEJVN4kfer+liSY+A6opLJKyyDHh2C4Ro1o
	YLbUuTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0v7-0000000Arh5-3R4v;
	Fri, 12 Jun 2026 12:23:33 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0v4-0000000ArgG-0E6c;
	Fri, 12 Jun 2026 12:23:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB711A1D1C;
	Fri, 12 Jun 2026 14:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1781266999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7q2XrxfHI2F4jC37A/2Ev7F1/EsKe9OT+qstuGZnrow=;
	b=4whu0HbtqP7CAZkbptcPO+iuHD6llV2oz5jiUJPMJGp3yLDVWB3SFMfvRWkesTLCuuzMNG
	/CVciNVYLYBlcA4IsEJHwo3TAYqZyC2jwc8NWQjn/TrJZLrj460vpyaodY7yyKJjXGWb1Y
	wx18lJkaNft7PAJM/X8hAlBc/mq5KG0YSSAzuKfYYCShUIDzeO/izD/ZX5dtnHkQU6mELm
	LijkAr2M+J9og+CAZRhFC0tf9Gt2fMyvlUbqIISqpnQIJawQLfORnKXKT+sYPAQfJpQkLL
	cxJkoyxrz0/9fabgm3gpCDtix3jhMNF08SRYGr71e+aVt5DCvEMAFRK95/Kc5Q==
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 14:23:14 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: netdev@vger.kernel.org, Theo Lebrun <theo.lebrun@bootlin.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Lukasz Raczylo <lukasz@raczylo.com>,
 Steffen Jaeckel <sjaeckel@suse.de>
Subject: Re: [PATCH] net: macb: add TX stall timeout callback to recover from
 lost TSTART write
In-Reply-To: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
References: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
Message-ID: <dbc25b24865a1ad92555bc826bef4267@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_052330_883928_B7BA8063 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Andrea

On 12.6.2026 11:01, Andrea della Porta wrote:
> From: Lukasz Raczylo <lukasz@raczylo.com>
> 
> The MACB found in the Raspberry Pi RP1 suffers from sporadic stalls on
> the TX queue.
> While the exact root cause is not yet fully understood, it is likely
> related to a hardware issue where a TSTART write to the NCR register
> is missed, preventing the transmission from being kicked off.
> 
> Implement a timeout callback to handle TX queue stalls, triggering the
> existing restart mechanism to recover.
> 
> Link: 
> https://lore.kernel.org/all/20260514215459.36109-1-lukasz@raczylo.com/
> Fixes: dc110d1b23564 ("net: cadence: macb: Add support for Raspberry Pi 
> RP1 ethernet controller")
> Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> Co-developed-by: Steffen Jaeckel <sjaeckel@suse.de>
> Signed-off-by: Steffen Jaeckel <sjaeckel@suse.de>
> Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c 
> b/drivers/net/ethernet/cadence/macb_main.c
> index a12aa21244e83..615da65d5d68d 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4522,6 +4522,16 @@ static int macb_setup_tc(struct net_device *dev, 
> enum tc_setup_type type,
>  	}
>  }
> 
> +static void macb_tx_timeout(struct net_device *dev, unsigned int q)
> +{
> +	struct macb *bp = netdev_priv(dev);
> +
> +	if (net_ratelimit())

Do we need the net_ratelimit() check (and message) here? AFAIU the 
watchdog core already prints a message for every timeout.

> +		netdev_err(dev, "TX stall detected, re-kicking TSTART\n");
> +	dev->stats.tx_errors++;
> +	macb_tx_restart(&bp->queues[q]);
> +}
> +
>  static const struct net_device_ops macb_netdev_ops = {
>  	.ndo_open		= macb_open,
>  	.ndo_stop		= macb_close,
> @@ -4540,6 +4550,7 @@ static const struct net_device_ops 
> macb_netdev_ops = {
>  	.ndo_hwtstamp_set	= macb_hwtstamp_set,
>  	.ndo_hwtstamp_get	= macb_hwtstamp_get,
>  	.ndo_setup_tc		= macb_setup_tc,
> +	.ndo_tx_timeout		= macb_tx_timeout,

The commit message describes it as RP1 specific, but it gets applied to 
all other variants?

>  };
> 
>  /* Configure peripheral capabilities according to device tree

Thanks
Nicolai

