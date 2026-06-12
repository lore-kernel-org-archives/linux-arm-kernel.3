Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7C9CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X07QRTXhx7twtU7TUj4+VDEon2lHZrzRNetg8L7gZYk=; b=geq1mIKdJHUL7XG8vkQbzA2LQl
	sGyEQ2yLCAzGavYjTxpvHOgDaUfWjUaX7p4gHd8+jNthG3OcJjQNy2bNpv771OADQNEM6xAnO3jlF
	2OVUNotCFAicsb0+RRI6vn9i7zTPCh19V73xf0A6COt8jopJNTh8MUpUlBVT+c+YDRmcAXAXNMJbu
	AKgGn+NbN4vyeLmfFZ+8ix8R9BSsJVzWn9cQbMxxaIf6ZMg4QyAEySfijndXUyrNJQuNWAZN2YiHM
	kvs6VlZ5QlCjKx55ca/MGh2E6nnOzBRbLzlQBBJEXvMA7CuxOmC+x0hkFWJCdLvfzlbE1FzJD1l1e
	UdFO73vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1J4-0000000Atry-0dhf;
	Fri, 12 Jun 2026 12:48:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1J0-0000000Atqt-10F6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:48:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so9857885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781268492; x=1781873292; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X07QRTXhx7twtU7TUj4+VDEon2lHZrzRNetg8L7gZYk=;
        b=JlYhCU+DYpppzujJK5miSNjwfQd3zNL/F4t5Pc4UlmgcUglXFyTwTcwIJJCJsIZjfo
         izG9idD4JAVJFvN5HSyS/eZyCl5E3ZWiqm/najMdh1UkEyy9YL+TCri5ooBPhoMo5foq
         ZEw3Xt5nEUlVwCo4bRLyv2Xu3X9QjFNU8LxTxnzlljQrbpFrQ99cG/+VgCEc7pcQbwJX
         ROcQev6VkYCSItP+9rtwKxNzeI0T316eHDRPhXKHsxsGZ3eFxYT8oeqITgHeutMHTCZS
         FCxbVJ2TLDbQyOyC7zSRzVywVpsrygS8n04c16fzdWFydZGnB+nJfDrH5M3s4EsYkRMb
         yh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268492; x=1781873292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X07QRTXhx7twtU7TUj4+VDEon2lHZrzRNetg8L7gZYk=;
        b=Y2DdL7iid+Yh/AqbeORAZQwfAtMD6qPojdytNKplQq2MbuyHFddugupjrCo3uxOirm
         Mvpu0soSY+Mfv66p4SzH5USzVlQeqFk/tw0osmXX9FFKA8zF7uvnpLBCuldNC0rLiOBQ
         J4/MdOw677SFl1ASdo14KnitARoq6rJaVjldNP5QfxgJtPZ0ivgV9wVZlGgTo6GbzynV
         dfjHRtPOU4s75TyEWEMLFSIrWiZE6MuH2y+3e/BNLjlobMjI9emJ2CL5isKTBw8x5cDN
         7Yx9uqGgl3nYZ3MkhIQ5N6dWzOIEq3z8A0tcJ7X7tv9EJfBCvAfKVQfvQfD7M/llT7si
         Zb/A==
X-Forwarded-Encrypted: i=1; AFNElJ8eGDVgU5kbEllSVyHp0I3CN97o0sMtRGG/xHmf10+MjYmU9Oaw4nlJPUuLXDaxgJC2bZqPENbSONx1tMAkWkG4@lists.infradead.org
X-Gm-Message-State: AOJu0YwZZ0pMoayJPo/SolmmmdVKmrWChJTSUL3KYhm1iyKDam08cYue
	3uW6Yw8XCr8BJmM2xO4gRG6hioh9lLDP3bwwGOITpQan4j2IgbllnVZoaFJr3Sw1z10=
X-Gm-Gg: Acq92OE4qw0OBYL42q2+Zl88qwzdZ4vTcKrHDhunMOnkF7x66nRORoL4vMAetJqCbK+
	iuWoeZCB8rTh4w8dpULkLaKIEwLWAIG2YCzGMehyig8ZjIWS7zJ6Dqe6kBH5HJYgv7rgCen6FQa
	qtDbGIcQWmaZB7LVQmqLKV1lwuekuuWrEHOSMDHZWAoLRPLKsRFlgrJCat80tJ6kKIa6zzoEtRz
	6cLH2xtIurpzz7mksbVdSYbf9EKoSujDfXJ8/9lt7oPfMZ/+woHJWrhJ8MP5USz8oX5rRe+w3ya
	DHvsLaHLgXXi70HoFmxuFDkpVPDHR4sP060TcWt8+P0mC+gORKnfpS5nJ42k7jhtEpSNPJ/7QSC
	nAJUozVqdIAHdRp0jX7XsU3jUpbgHm+5LcWht5viYiERLBLNpTHtYPfLlQq/i+rhNMt9Bl8pFLc
	d/SY/ExGVqJTgEcRPe1ymV
X-Received: by 2002:a05:600c:e547:20b0:490:b58b:a8ca with SMTP id 5b1f17b1804b1-490ec50c366mr24147355e9.27.1781268492311;
        Fri, 12 Jun 2026 05:48:12 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c4240sm5705651f8f.27.2026.06.12.05.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:48:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 12 Jun 2026 14:51:33 +0200
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Andrea della Porta <andrea.porta@suse.com>, netdev@vger.kernel.org,
	Theo Lebrun <theo.lebrun@bootlin.com>,
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
Message-ID: <aiwA1dD-qXcT3hds@apocalypse>
References: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
 <dbc25b24865a1ad92555bc826bef4267@tipi-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbc25b24865a1ad92555bc826bef4267@tipi-net.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_054814_320725_E31DA049 
X-CRM114-Status: GOOD (  29.41  )
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

Hi Nicolai,

On 14:23 Fri 12 Jun     , Nicolai Buchwitz wrote:
> Hi Andrea
> 
> On 12.6.2026 11:01, Andrea della Porta wrote:
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
> > Link:
> > https://lore.kernel.org/all/20260514215459.36109-1-lukasz@raczylo.com/
> > Fixes: dc110d1b23564 ("net: cadence: macb: Add support for Raspberry Pi
> > RP1 ethernet controller")
> > Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> > Co-developed-by: Steffen Jaeckel <sjaeckel@suse.de>
> > Signed-off-by: Steffen Jaeckel <sjaeckel@suse.de>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/net/ethernet/cadence/macb_main.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/cadence/macb_main.c
> > b/drivers/net/ethernet/cadence/macb_main.c
> > index a12aa21244e83..615da65d5d68d 100644
> > --- a/drivers/net/ethernet/cadence/macb_main.c
> > +++ b/drivers/net/ethernet/cadence/macb_main.c
> > @@ -4522,6 +4522,16 @@ static int macb_setup_tc(struct net_device *dev,
> > enum tc_setup_type type,
> >  	}
> >  }
> > 
> > +static void macb_tx_timeout(struct net_device *dev, unsigned int q)
> > +{
> > +	struct macb *bp = netdev_priv(dev);
> > +
> > +	if (net_ratelimit())
> 
> Do we need the net_ratelimit() check (and message) here? AFAIU the watchdog
> core already prints a message for every timeout.

Correct. I'll drop those two lines.

> 
> > +		netdev_err(dev, "TX stall detected, re-kicking TSTART\n");
> > +	dev->stats.tx_errors++;
> > +	macb_tx_restart(&bp->queues[q]);
> > +}
> > +
> >  static const struct net_device_ops macb_netdev_ops = {
> >  	.ndo_open		= macb_open,
> >  	.ndo_stop		= macb_close,
> > @@ -4540,6 +4550,7 @@ static const struct net_device_ops macb_netdev_ops
> > = {
> >  	.ndo_hwtstamp_set	= macb_hwtstamp_set,
> >  	.ndo_hwtstamp_get	= macb_hwtstamp_get,
> >  	.ndo_setup_tc		= macb_setup_tc,
> > +	.ndo_tx_timeout		= macb_tx_timeout,
> 
> The commit message describes it as RP1 specific, but it gets applied to all
> other variants?

I've seen this issue happening only on RaspberryPi 5, but AFAIK it
could affect also other MACB blocks connected through PCIe, so it
may be widespread (even though it should have probably already been
noticed in the past). In the orginal driver there's no timeout callback
defined and this is much like pretgending the issue causing the timeout
to happen to go away without doing anything (whatever the cause ot the
specific hw are). So in my opinion we can just extend that to all MACB.
Or maybe we should execute the restart conditionally on 
.compatible = "raspberrypi,rp1-gem"?

Thanks,
Andrea

> 
> >  };
> > 
> >  /* Configure peripheral capabilities according to device tree
> 
> Thanks
> Nicolai

