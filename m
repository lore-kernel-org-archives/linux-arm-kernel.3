Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDD4C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSIJAx4EpNXrVsBR/rpvqubaa9T4PDr1XsPwpgCesCw=; b=VuGUxYnox6CdW24P68h+zFLqsz
	1npxCYggqnWdnmKUcvtia4XZxP8oAJoQIrE9ZbqrcvIG0+Zp8sVNOCgcygI/55D+kBgmSNjvzy7b7
	Y8wugUyGfPKVtJWGOS7Y9jLItK/VsQXxGRmqXaGpWOZYfSMbaxGOaFwBROh/YVnMzVibW8r9rkhxX
	a3GMTWHcRdAuMWwVe2dBiT+UkqGiXobDiLSGfYm9K/z2A6vHnUGF0x4Ue5wh7aDrraZ1mVPUYmC2x
	4mHOutHyeBfqW+fD6TlhUr+rRAkLysD4xZJ4X+op+GOG2r3Y0SgHaf6f32kSziX0Boq8avOyVQm91
	4ieE55Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZiI-0000000BDmM-1gM4;
	Thu, 13 Feb 2025 13:57:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZgk-0000000BDOM-0KPz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iSIJAx4EpNXrVsBR/rpvqubaa9T4PDr1XsPwpgCesCw=; b=gkZtbL8jtyFaX5I7SQPe1yOCe9
	UWSxm5Ie8L9UyWPhu5BlROG5LnnlOBATL2gTmW8b7+NvDxFwlfulajbuPd/ZwZxWER6fDYhZIDIjB
	64NFBb8/q7lqP1EXLk/fZAh5drzeQeTVYUA3BSGfq3Q8KnIUUrJv6qv5MPc1zdWHkZSw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tiZgZ-00DklN-Ck; Thu, 13 Feb 2025 14:55:23 +0100
Date: Thu, 13 Feb 2025 14:55:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, joel@jms.id.au,
	richardcochran@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] soc: aspeed: Add NULL pointer check in
 aspeed_lpc_enable_snoop()
Message-ID: <2d5c9d87-abbc-4118-9031-f2c7b5c96085@lunn.ch>
References: <20250212212556.2667-1-chenyuan0y@gmail.com>
 <f649fc0f8491ab666b3c10f74e3dc18da6c20f0a.camel@codeconstruct.com.au>
 <CALGdzuoeYesmdRBG_QPW_rkFcX7v=0hsDr0iX3u5extEL5qYag@mail.gmail.com>
 <8e6c7913fda39baa50309886f9f945864301660f.camel@codeconstruct.com.au>
 <CALGdzurifZaqatjGRZGxA4FyNBHOYJdVXpKHSM4hQdA3qZtYvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALGdzurifZaqatjGRZGxA4FyNBHOYJdVXpKHSM4hQdA3qZtYvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_055534_115046_3D4BB838 
X-CRM114-Status: GOOD (  18.67  )
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

On Wed, Feb 12, 2025 at 07:50:49PM -0600, Chenyuan Yang wrote:
> Hi Andrew,
> 
> I've drafted the following patch to address the resource cleanup issue:

Please just follow the normal procedure of submitting a patch.

	Andrew

> 
> ```
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 9ab5ba9cf1d6..4988144aba88 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -200,11 +200,15 @@ static int aspeed_lpc_enable_snoop(struct
> aspeed_lpc_snoop *lpc_snoop,
>   lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
>   lpc_snoop->chan[channel].miscdev.name =
>   devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
> + if (!lpc_snoop->chan[channel].miscdev.name) {
> + rc = -ENOMEM;
> + goto free_fifo;
> + }

You were asked to first add cleanup, then fix this possible NULL
pointer dereference.

> I have a couple of questions regarding the cleanup order:
> 
> 1. Do we need to call misc_deregister() in this case, considering that
> the registration happens before return -EINVAL?
> 2. If misc_deregister() is required, is there a specific order we
> should follow when calling misc_deregister() and
> kfree(lpc_snoop->chan[channel].miscdev.name);?

As a general rule, cleanup is the opposite order to setup.

Also, you want to do some research about that devm_ means.

	Andrew

