Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF22CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISjZXEgmv27RFkS8r2XqxozAUDEv0fYySMy3KWEs29w=; b=OyjFc96J6UPVc3ajn36784G3St
	SVLGM4Q1/wByvKm17NJpasc4mr3du9v+R/DXZ959s5zUABZG7AJLBnV2AXNIrqaBcuT7ofW17rc3i
	9gTZcW6gUN07Ofeco0LMl7OAgOu8Any9KamLg14QDJy2ZuonTnIvS2A+vJ+2m/c7Qw+CbQ33hXday
	09r06qyExrhw7FfK6BF5Re2bTlUz3IGZ6Uh/DIrX5+SFzEMoiXyOxZoRx5hR6MqMUtOr5MYgJbCvd
	znGxMxVkpY4bmC38KHDnH94pqfZZ1YwuYJcTmQnV7tJq52ihdvKQEYtvH7FhjNaDxYHDH/A5YIOeY
	LHtiRzZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTz4-0000000FqrH-3OrV;
	Tue, 16 Jun 2026 13:37:42 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTz1-0000000Fqpo-061u;
	Tue, 16 Jun 2026 13:37:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89462A1D1C;
	Tue, 16 Jun 2026 15:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1781617049; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ISjZXEgmv27RFkS8r2XqxozAUDEv0fYySMy3KWEs29w=;
	b=eQT4332tf/zYqpBlwY8OJ6Qk1xp4dS9v4JFmUT+4jlqT0TO2NBKmVmuieT3pScmXjjzjSr
	7y6l2no0BtxnfT/Etm0kw8LZcVeg3NoVQ7BamOKzG3ozpCkY6eYC7XwJlWCS2LS/WgLY4g
	2zt46906UC95xM5/6oOZxmqWM/FTZ8BQDTOpNJCSb4fEdevueYL+n4H6Rep9vSzqgVYshs
	JwLUgH3B7fehHMw3CHMChDHN4ysfKhfpvpJIX2RUIwXdqSVWTntj4medkEOjRhmsJPzLmK
	6NZAT/uO1hgkLmHfNItVFeZgnFxuqLQ8penUMKY56F3UebaBp6BGLDPTpBsVzg==
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 15:37:25 +0200
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
Subject: Re: [PATCH v2] net: macb: add TX stall timeout callback to recover
 from lost TSTART write
In-Reply-To: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
References: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
Message-ID: <37227460d97a7bcf2257f72bc8b827bb@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_063739_839632_7D810A9B 
X-CRM114-Status: GOOD (  15.62  )
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

On 16.6.2026 15:23, Andrea della Porta wrote:
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
> 
> CHANGES IN v2:
> 
> - dropped the rate-limited log message
> - avoid incrementing tx_error as this is per packet
> 
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c 
> b/drivers/net/ethernet/cadence/macb_main.c
> index a12aa21244e83..fd282a1700fb9 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4522,6 +4522,13 @@ static int macb_setup_tc(struct net_device *dev, 
> enum tc_setup_type type,
>  	}
>  }
> 
> +static void macb_tx_timeout(struct net_device *dev, unsigned int q)
> +{
> +	struct macb *bp = netdev_priv(dev);
> +
> +	macb_tx_restart(&bp->queues[q]);
> +}
> +
>  static const struct net_device_ops macb_netdev_ops = {
>  	.ndo_open		= macb_open,
>  	.ndo_stop		= macb_close,
> @@ -4540,6 +4547,7 @@ static const struct net_device_ops 
> macb_netdev_ops = {
>  	.ndo_hwtstamp_set	= macb_hwtstamp_set,
>  	.ndo_hwtstamp_get	= macb_hwtstamp_get,
>  	.ndo_setup_tc		= macb_setup_tc,
> +	.ndo_tx_timeout		= macb_tx_timeout,
>  };
> 
>  /* Configure peripheral capabilities according to device tree

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

