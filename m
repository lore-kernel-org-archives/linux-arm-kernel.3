Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F15CFD315
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 07:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eP2e4OiQhKFjF8jIAfWUJ81hm27Yf/v4hmfnRrA+7u4=; b=gy6uCsYZZ6+VJLwOd9BMaM0OZP
	bL/O6HP3L0pUYtmPqqAknRBrk9MQGcC1keyEhwO4xRnIJqYC55hvAb8pF7UzojpoCEZ/5ncohtF4Z
	ymy1BWETEeP3/Zhi6C66YbM49yuIb8Gm9t1akOTt7HddPX78AkbL5pZZa4bV/QvgoNEB+m0FSaVla
	aSDc+dzw1ZrRW2YhBEGFNq/cE690WRq6L7dI5d65vOo0m9c0/r+KSREhD86+/QXXR+qpCPvSLEJyF
	/9cJdtIrK2UOkTy/pb2FTQyEY8MXMkWkWIA9Ad2tsgphxS6no/KVP/2tlpIjucUXjMmiubpw7Bfcv
	3GIDNb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnLh-0000000CstX-00Bl;
	Tue, 25 Nov 2025 07:20:29 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnLd-0000000Css4-0hFv;
	Tue, 25 Nov 2025 07:20:27 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 567FE22239;
	Tue, 25 Nov 2025 08:20:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1764055217;
	bh=eP2e4OiQhKFjF8jIAfWUJ81hm27Yf/v4hmfnRrA+7u4=; h=From:To:Subject;
	b=plcXhOYfkNszbCYxnXmFqaWOpn7jc3Rlx9S9egzSDXifLp+Bb333iJsRbBBPPv8yq
	 CbBakUPdb9dSRtKzwZXj6MixsWT03hX/W2bXAjjarsZy+JHCuPZMhMHqK3Zlc+ENtQ
	 DgYKxtsD7KiRMEuyO3FXQUjuO9wANtxjUkr0tHkB9311I7rVG3bxid1ZqWKf1JzZkC
	 0CQtFnm6NbfCzmELIFAAxm4Ty59VCC/n8Q52D7eY23zsiRU7mpd/GcRebcivax0usU
	 Mls6U4hAsqKVkrUKo2p2S8wRJK4pwYISYDSPSJG4OSA8QGj87euyQRFKQSL427X2Vb
	 BIafJR4XqnsLw==
Date: Tue, 25 Nov 2025 08:20:11 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] phy: fsl-imx8mq-usb: fix typec orientation switch
 when built as module
Message-ID: <20251125072011.GA5375@francesco-nb>
References: <20251124095006.588735-1-fra.schnyder@gmail.com>
 <w2dpsbfspr4od2j5seidi3tcpo3r2revhahhxiuacqehkqy3nn@2zjb3xvso45d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w2dpsbfspr4od2j5seidi3tcpo3r2revhahhxiuacqehkqy3nn@2zjb3xvso45d>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_232026_246394_65C54ACA 
X-CRM114-Status: GOOD (  21.64  )
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

On Tue, Nov 25, 2025 at 03:04:43PM +0800, Xu Yang wrote:
> On Mon, Nov 24, 2025 at 10:50:04AM +0100, Franz Schnyder wrote:
> > From: Franz Schnyder <franz.schnyder@toradex.com>
> > 
> > Currently, the PHY only registers the typec orientation switch when it
> > is built in. If the typec driver is built as a module, the switch
> > registration is skipped due to the preprocessor condition, causing
> > orientation detection to fail.
> > 
> > This patch replaces the preprocessor condition so that the orientation
> > switch is correctly registered for both built-in and module builds.
> > 
> > Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index b94f242420fc..d498a6b7234b 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -124,7 +124,7 @@ struct imx8mq_usb_phy {
> >  static void tca_blk_orientation_set(struct tca_blk *tca,
> >  				enum typec_orientation orientation);
> >  
> > -#ifdef CONFIG_TYPEC
> > +#if IS_ENABLED(CONFIG_TYPEC)
> 
> With below commit:
> 
> 45fe729be9a6 usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n
> 
> I think this #if/else/endif condition can be removed.

This patch should go to stable, and that commit is not present in any
such previous kernel.

Should we have 2 patches or "force" 45fe729be9a6 to be also backported?

What's the general advise in these situations?

Francesco


