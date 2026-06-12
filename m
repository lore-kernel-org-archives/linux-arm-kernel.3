Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BA7CD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAP1NcwYrXBK5Nx3wa/X8hgk6oZXZVKocwwn82WV4NA=; b=OhFRwY1LGRpEnntXwO/xxDj8dU
	W1gKEFKH5O+m34uPibNHEKk6wBoMXLwe2VMgwOazHQsGfA0nbNhjv/5029VnJFNczYG6Rjcb7b8Nl
	ZUQbcbBPUfk3mOxTu8L5aNozasIt/nqOR+wcLkA6qfxU1eniz9QJAd2+C8zcz3hK5V/bjNEiJuPgV
	O73h5MQI7omcXG/l4d+KqRKofmmeczeL7OkwKHprMAeZQ8RcD7UQiF1t1OLcCAB9wD0T9YuUD0ttW
	i5PC/oijNxhS5xXs3mnsRXAUnLhWIqAGSDa9JuGoq8LM6Ade+GotipKyOxa7D9MaTnyER3aKyiwwZ
	C37KDBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyS9-0000000Ah2Y-3z20;
	Fri, 12 Jun 2026 09:45:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyS6-0000000Ah28-1XXf;
	Fri, 12 Jun 2026 09:45:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C58C01A38DC;
	Fri, 12 Jun 2026 09:45:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 901FE60012;
	Fri, 12 Jun 2026 09:45:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E170106C8567;
	Fri, 12 Jun 2026 11:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781257520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pAP1NcwYrXBK5Nx3wa/X8hgk6oZXZVKocwwn82WV4NA=;
	b=N3HmtAk35VsP1qgGAXQ1tHQqUkfLGYVvab9kzm6RjePDLDHVWsR+DE0xdfJ+P+QeAGdJHN
	ONqTwA50Fo3O5vGfbO3TA/mxy4eEqokbwcDTF+bWoXcsDXs8GNOemORaydA0cNY8zbtpoc
	6fazjWEcphMfwdq/KPYrvqSQ0lZTR3FO+UA+yJZfMSx19foIoEKI0ygjYzOpZJSfiurDTr
	Kr9GYnlaWFtNx+Grr6pxCNGetbXPdaEPJx5y3rfhZijw+4kGHygU+vLl08ALjhwfJNHGRX
	g0kb5TR0/LGkb1h6AS7rwKKX2vrDBmBmySVZh0AM2qKKPMOKGMkTlRuk8OjXcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 11:45:14 +0200
Message-Id: <DJ6Z39C906LE.1F3XKDDM41UJ8@bootlin.com>
Subject: Re: [PATCH] net: macb: add TX stall timeout callback to recover
 from lost TSTART write
Cc: "Lukasz Raczylo" <lukasz@raczylo.com>, "Steffen Jaeckel"
 <sjaeckel@suse.de>
To: "Andrea della Porta" <andrea.porta@suse.com>, <netdev@vger.kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rpi-kernel@lists.infradead.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
In-Reply-To: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_024526_572145_156F0295 
X-CRM114-Status: GOOD (  16.24  )
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

Hello Andrea,

On Fri Jun 12, 2026 at 11:01 AM CEST, Andrea della Porta wrote:
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
> Link: https://lore.kernel.org/all/20260514215459.36109-1-lukasz@raczylo.c=
om/
> Fixes: dc110d1b23564 ("net: cadence: macb: Add support for Raspberry Pi R=
P1 ethernet controller")
> Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> Co-developed-by: Steffen Jaeckel <sjaeckel@suse.de>
> Signed-off-by: Steffen Jaeckel <sjaeckel@suse.de>
> Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ether=
net/cadence/macb_main.c
> index a12aa21244e83..615da65d5d68d 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4522,6 +4522,16 @@ static int macb_setup_tc(struct net_device *dev, e=
num tc_setup_type type,
>  	}
>  }
> =20
> +static void macb_tx_timeout(struct net_device *dev, unsigned int q)
> +{
> +	struct macb *bp =3D netdev_priv(dev);
> +
> +	if (net_ratelimit())
> +		netdev_err(dev, "TX stall detected, re-kicking TSTART\n");

Is this standard? It looks odd.

> +	dev->stats.tx_errors++;

I am surprised by this. `tx_errors` would ideally be one per packet that
didn't get sent. Here we increment it once per queue that stalled.

I have a series to address stats issue (and use netdev_stat_ops API).
It is a follow-up to this:
https://lore.kernel.org/netdev/20260428-macb-drop-tx-v2-0-647f5199d8df@boot=
lin.com/

Also this is per-device shared data and we access it without
synchronisation.

Let's drop this increment.

> +	macb_tx_restart(&bp->queues[q]);
> +}

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


