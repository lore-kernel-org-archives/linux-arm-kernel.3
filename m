Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292FAE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbYJrhkQc0nvUHQDz7CHZJDyBA/Z0++rFcxDzUyd6KA=; b=FWdfIOrDpRwvQ0blWD+dpBKtlD
	TUe7pDRq1m0Wsdv+hbLD3Osqlh1KRJCYxhdZVXdlz2La84wJCObb96CUqnxw1vpqwXp4qC+n1Y1cF
	ZcgB0bNJuZBKMvITLEHkTuqljj9LLTTRkgKQRQycLOPmaKbfy7g0TEmJUykI8LcQJTfCg7OQMzuYk
	fuLVtOJdVYLGkOJU3xsGZI+r+6I2GSY6daac0aXweFvyqpT+rPySEFDPWBmRjlDXyf6pwSn5Q9FTe
	LS2rq724WjF7LZeahLbISaEBqugDSxvaMLzZRA/1h+nV7TzV4sMs+ayAO+lW/EOU/FFNh9mwinYhY
	au3R/AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYmo-00000001mxR-307h;
	Fri, 06 Dec 2024 13:54:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYli-00000001mYt-2tkn;
	Fri, 06 Dec 2024 13:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZbYJrhkQc0nvUHQDz7CHZJDyBA/Z0++rFcxDzUyd6KA=; b=wJquaEgZ8eQk7upw2fXmwkzvEb
	ROAcLrOufdlHgtSYsjWmNv5XPCMzML1UhZnRf+c1MBkbFItVt1uLgoF2IxvJOvK1Kk41XASnk/8ry
	2lRgNuW2aEDsIvGQb3kwfoeiZx/e1vSWU7KCwLQrVVrgwv5QqfuvggH18yy7WnbphtpbjdgERexro
	MBUZwdAqML56vLfu/UuWHMP3Bx4cbPTWkt4EgehUj5r6JwI36ud8GcbPdyLjahkAQP4yD3CDdDrhF
	oPQS9Yoi5Me8b6tK0G6FhSPKNkfAcCkMIKNKurGgEvZnGneNBWgBbSAD+pIvyUacvoUM7Qh5rh035
	2x89O6bw==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJYld-0000cM-0l; Fri, 06 Dec 2024 14:53:13 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/2] phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to
 determine phy-id
Date: Fri, 06 Dec 2024 14:53:12 +0100
Message-ID: <11259672.BaYr0rKQ5T@diego>
In-Reply-To: <87273a36-07f9-4224-bfff-63e905be9b0a@collabora.com>
References: <20241206103401.1780416-1-heiko@sntech.de>
 <20241206103401.1780416-3-heiko@sntech.de>
 <87273a36-07f9-4224-bfff-63e905be9b0a@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_055318_773004_1898BE2E 
X-CRM114-Status: GOOD (  27.84  )
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

Hi Cristian,

Am Freitag, 6. Dezember 2024, 12:26:35 CET schrieb Cristian Ciocaltea:
> On 12/6/24 12:34 PM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > The phy needs to know its identity in the system (phy0 or phy1 on rk3588)
> > for some actions and the driver currently contains code abusing of_alias
> > for that.
> > 
> > Devicetree aliases are always optional and should not be used for core
> > device functionality, so instead keep a list of phys on a soc in the
> > of_device_data and find the phy-id by comparing against the mapped
> > register-base.
> > 
> > Fixes: c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock provider support")
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 50 ++++++++++++++++---
> >  1 file changed, 44 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > index c5c64c209e96..b137f8c4d157 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > @@ -385,11 +385,22 @@ enum rk_hdptx_reset {
> >  	RST_MAX
> >  };
> 
> [...]
> 
> > +
> > +	/* find the phy-id from the io address */
> > +	hdptx->phy_id = -ENODEV;
> > +	for (id = 0; id < hdptx->cfgs->num_phys; id++) {
> > +		if (res->start == hdptx->cfgs->phy_ids[id]) {
> > +			hdptx->phy_id = id;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (hdptx->phy_id < 0)
> > +		return dev_err_probe(dev, -ENODEV, "no matching device found\n");
> 
> Maybe we could simply fallback to assume phy1 doesn't exist in this
> case, which avoids the need to provide a match data with a single entry.

Personally I'm a fan of consistent behaviour, not things working
accidentially ;-) . See the usbdp phy for example, also declaring just
one phy using the same mechanism.

Also I really don't trust the hdptxphy-grf being stable over time.
Rockchip engineers always move bts around in those, so there will be a
need for platform-data at some point anyway.


> Regardless,
> 
> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

thanks :-)

Heiko



