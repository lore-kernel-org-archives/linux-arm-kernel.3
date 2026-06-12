Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DB4CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrjsT2w1j1qo9MwDPHviku0Dqn2a94LfN9cpJdJZDKs=; b=3xWQin3R3WD5NGR+jLhVOtVWn9
	vPVLl0WaOzFOaYo5F7YNIWLmceI+Zcqz4WRvmpPSoAAXks1M/O5HUlFNppbMMOUKpnglpqOCFUTp3
	QiTSEaE8zLc/UDpKJs1Q0t/VAQEN0qGeUmW9sHDSBTXW/Vkr+2nC50u/eOV/JqL2/vig3idf3blcp
	V1+byVSHiUkIuYgQfLzSQeR6Vkx9xB9u9aPWg+Sq5ctw6dftThB9et4b+bWGwPObcVqwVQxImfBQ2
	vv1z+caqb9KAcyV54a8jr4a+cTTBSa1w9cJfyD5Yzsn4XX6KplZK0tzxna54pKyZMehmEZjhwzx3Q
	Nsjuyv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY18d-0000000AsCW-1rVy;
	Fri, 12 Jun 2026 12:37:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY18a-0000000AsBf-0r2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:37:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so9777895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781267846; x=1781872646; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MrjsT2w1j1qo9MwDPHviku0Dqn2a94LfN9cpJdJZDKs=;
        b=IJJU8Giq9qFh/nkkEiDHM0UiHqbDRP6pV9ymGwte8wPk6yYwoigS/87Ps56/DUt3vU
         PcOZXjQNSMVxNbjgQohCEX3Ocqk8TX0gk5o8rH9bDmebmHvP7Rp5yv9CwE0dv6u4wChJ
         eLNZ1uS+iPoe+dfXoXBBVClnFnlRRtFP1oe0CEr5Fe5/wBnh3Gx/heIPi1bhOcIMu9rs
         qpIwzLv2GjX6qaZO5ITMb6R+9s5eJqtFUIhxzHKAIiWBRiXvANaNDcLs8OwChryO6IOh
         njkIussCCYs33qrTxcertESzIv03UdQs55Q/ejkjFVHOLdlsVC8R0oxo8u8tN2KikZ+F
         f87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781267846; x=1781872646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MrjsT2w1j1qo9MwDPHviku0Dqn2a94LfN9cpJdJZDKs=;
        b=DpNcMqgA3pHr0OzouxvV8VwUTquCL8voBnl+YIJEtWsT9gdiZH+B7iM1YJh+VXXyER
         b3goXsvQ8/AfXLq8KDeMo/iYieQq+mF0bDhk7MvWRmnVCsil99q9PajmD0pVC2DCFyU6
         lnPA37ucrKzYETB53GfkkOosgVAusejuDHtmMAiL1hWI/oZC5tnb3mnv83YL5QniPvJe
         aj3/r8mBLDO/4CdQ1yDrVNlYmr6PuDW4zLV3yd2txNhY4LXaHtcW7G45IopYd1HA/IDN
         Gz7ERsqZURXzF4yFKnsFDgPNSTe/R5TcjM+2wNx61fpmuXKMBQ03y/aE6ZUFfK3Tz910
         oh5w==
X-Forwarded-Encrypted: i=1; AFNElJ8IPK9zTZO9DyUMNZpm+MJ8BCpC/LYkinbmJUaELDJmQ1bVge6qHsCuUq5/+mpSZXyOgnUEhv6xUxkNX9PnyJuT@lists.infradead.org
X-Gm-Message-State: AOJu0YzVgHunYblaP6BY9kWweccInXUPaHugoGsPBLOhP2PoakokIPiM
	iNyXVFqrsenUIvKyauH0ncGPzrGdsqPtCJ5h9dcB7htZxMae2HnKPwbbohhJgU9l8K8=
X-Gm-Gg: Acq92OHmj0kRGp8O/JDCVh2NP7etA/Yo4Q+8nmeR2xQeVvnxKuwpUYlq6Sa0ohHq4TC
	VntIzss39ZkuqHVY6bBqJs2kYwHjeMB6joxQRH38wKxBwHQYzHJhAf+5U3sEOIGivKBXrVtVLcU
	CMfH2TUZyblljVGN+ionGSGj4EnRZsLmasdm5uMLqIDqlziAAc2nEk+LviUYx4JcFDVKMDuymKM
	AatfQ17KUo0LnmKozeBWylpHFkF6pJmOQN8Ew6Udm72Pbl5+2TQDDlDNiFdoRpjC872nsVO8dHZ
	XWUUAr8Fp7x6/V993OIU6XdAFd/N1VtWSXDAt8mogoANdsbbDfc4NFCWyXQ98LdYsuoejoh7EwZ
	EAukrW/j4j+eG8RxdhcaUkwBbcPxS8Tf9S19hqNUFgjSjlO8IwCEOoxIL7A+Cpexb1mx2FA43nN
	vFp2eimwr6BTkUFWMCcfsG
X-Received: by 2002:a05:600c:5296:b0:492:1e7f:d426 with SMTP id 5b1f17b1804b1-4921e7fd54bmr110925e9.2.1781267846081;
        Fri, 12 Jun 2026 05:37:26 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea843d63sm64794375e9.12.2026.06.12.05.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:37:25 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 12 Jun 2026 14:40:47 +0200
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Lukasz Raczylo <lukasz@raczylo.com>,
	Steffen Jaeckel <sjaeckel@suse.de>
Subject: Re: [PATCH] net: macb: add TX stall timeout callback to recover from
 lost TSTART write
Message-ID: <aiv-T7thh8wj2d7n@apocalypse>
References: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
 <DJ6Z39C906LE.1F3XKDDM41UJ8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DJ6Z39C906LE.1F3XKDDM41UJ8@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_053728_271346_4BD832BD 
X-CRM114-Status: GOOD (  27.06  )
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

Hi Theo,

On 11:45 Fri 12 Jun     , Théo Lebrun wrote:
> Hello Andrea,
> 
> On Fri Jun 12, 2026 at 11:01 AM CEST, Andrea della Porta wrote:
> > From: Lukasz Raczylo <lukasz@raczylo.com>
> >
> > The MACB found in the Raspberry Pi RP1 suffers from sporadic stalls on
> > the TX queue.
> > While the exact root cause is not yet fully understood, it is likely
> > related to a hardware issue where a TSTART write to the NCR register
> > is missed, preventing the transmission from being kicked off.
> >
> > Implement a timeout callback to handle TX queue stalls, triggering the
> > existing restart mechanism to recover.
> >
> > Link: https://lore.kernel.org/all/20260514215459.36109-1-lukasz@raczylo.com/
> > Fixes: dc110d1b23564 ("net: cadence: macb: Add support for Raspberry Pi RP1 ethernet controller")
> > Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> > Co-developed-by: Steffen Jaeckel <sjaeckel@suse.de>
> > Signed-off-by: Steffen Jaeckel <sjaeckel@suse.de>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/net/ethernet/cadence/macb_main.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> > index a12aa21244e83..615da65d5d68d 100644
> > --- a/drivers/net/ethernet/cadence/macb_main.c
> > +++ b/drivers/net/ethernet/cadence/macb_main.c
> > @@ -4522,6 +4522,16 @@ static int macb_setup_tc(struct net_device *dev, enum tc_setup_type type,
> >  	}
> >  }
> >  
> > +static void macb_tx_timeout(struct net_device *dev, unsigned int q)
> > +{
> > +	struct macb *bp = netdev_priv(dev);
> > +
> > +	if (net_ratelimit())
> > +		netdev_err(dev, "TX stall detected, re-kicking TSTART\n");
> 
> Is this standard? It looks odd.

I've found it used in other drivers, it's the closest I had found that
limit the rate for net related output. As Nicolai suggested, on timeout
a message is already printed by the core, so I will drop those two lines.

> 
> > +	dev->stats.tx_errors++;
> 
> I am surprised by this. `tx_errors` would ideally be one per packet that
> didn't get sent. Here we increment it once per queue that stalled.
> 
> I have a series to address stats issue (and use netdev_stat_ops API).
> It is a follow-up to this:
> https://lore.kernel.org/netdev/20260428-macb-drop-tx-v2-0-647f5199d8df@bootlin.com/
> 
> Also this is per-device shared data and we access it without
> synchronisation.
> 
> Let's drop this increment.

Agreed.

Thanks,
Andrea

> 
> > +	macb_tx_restart(&bp->queues[q]);
> > +}
> 
> Regards,
> 
> --
> Théo Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

