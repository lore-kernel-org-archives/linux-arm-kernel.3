Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13617606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uybX1rlp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ij/ZTfSV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5PuInUz/jG/sVc55vzwpQmtUc4DneWfMKEBS2B1HkA=; b=uybX1rlpnyTrujJ9MD/gPT9xDw
	+8+nTZ6yK0TeeYxsB0j+c1snrx8yPG8R6YdRkj6lDguStNptupMZYozTXhxG3Z8YGPuWr6YT74S3a
	U2YVHdrqE7FQ3hwP+r5yYedZv/u6J4/rXkjSPdSz34EMZRBnPub3NXnrjjutRg8EaR1mCKtgAsEU2
	bneOQVv48+LbuHYAIbhqKvghwnA45yTzrIu7VVn009CBFhwRi5eSBaQQyI2Eqc4SUNdOnleUvg/y5
	l3sG9/wW1Bvg5i7pZSNqhPXAU/M4nsVgzYliFWf/6ByGnvM+IyM6oN/EJrtE7vFR8bzBiGNSiFVse
	jetwZR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyYI-00000008bse-0KOE;
	Tue, 20 Oct 2026 01:22:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyYG-00000008bsV-2Xkm;
	Tue, 20 Oct 2026 01:22:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0229842391;
	Tue, 20 Oct 2026 01:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EE11F000C4;
	Tue, 20 Oct 2026 01:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792459323;
	bh=Y5PuInUz/jG/sVc55vzwpQmtUc4DneWfMKEBS2B1HkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ij/ZTfSVf2swDQKjpQY+M1H2I5MkLeX5CF4dH4/9XKE165jBsDdvEwhW81eUmMMjb
	 Qa7Npvl6yBb17a13UvFrx+F558g8qtjW3Jx8HQ2wmPfgDecd4FVrr176Pvye0m7huB
	 b8gB3PVWN+ieA2OWvMaqKqc1pFccggf6hGdppcfcNIIzPb4SLFLMiOICvTaBe8MAMo
	 ccYqYzmJWOF0vh9T+5mTGwhv1K8ArNjqo22DC2bm6gpAiLDfN6Zb7V8wILCD7w7hbg
	 OGRinhBbeU5+ZdzL+gEGhTHiNXTwxiIjthvTzVDhkDx0SgvL4YvUPNJZZ9WRLDx3D2
	 G3K1Ev46o1B/g==
Date: Tue, 20 Oct 2026 09:01:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/20] i3c: dw: switch to array-based exclusive reset
 control
Message-ID: <ata9fqjAm09xnBQM@xhacker>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-6-jszhang@kernel.org>
 <62860351b9ae360c174d36dd54d4110417f395ad.camel@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <62860351b9ae360c174d36dd54d4110417f395ad.camel@pengutronix.de>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 02:55:21PM +0200, Philipp Zabel wrote:
> On Di, 2026-09-29 at 14:14 +0800, Jisheng Zhang wrote:
> > The Synopsys DesignWare I3C master controller can have multiple reset
> > lines, such as a core reset and APB reset.
> > 
> > Refactor the driver to use devm_reset_control_array_get_exclusive()
> > instead of a single named reset handle. This automatically manages all
> > resets allocated to the device node sequentially.
> 
> Note that this does not guarantee any particular order. Are you sure
> that this is good enough for all implementations of the DW I3C core?

Per my understanding of the doc, it only requires the resets are
asserted and de-asserted, didn't mention the order. And per my tests
on syna SL2610 platforms, the DW I3C works perfectly no matter I
reset apb reset or core reset firstly.
> 
> Otherwise it may be wise to at least specify the names in binding, to
> be able to switch to the bulk API or individual control later, if
> needed.
> 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 24 ++++++++++++++++++------
> >  drivers/i3c/master/dw-i3c-master.h |  2 +-
> >  2 files changed, 19 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 4563d8761ba0..1c6c870f5bb3 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -1657,6 +1657,11 @@ static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
> >  	.set_dat_ibi = dw_i3c_platform_set_dat_ibi_nop,
> >  };
> >  
> > +static void dw_i3c_resets_assert(void *data)
> > +{
> > +	reset_control_assert(data);
> > +}
> > +
> >  int dw_i3c_common_probe(struct dw_i3c_master *master,
> >  			struct platform_device *pdev)
> >  {
> > @@ -1696,10 +1701,17 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> >  	if (IS_ERR(master->pclk))
> >  		return PTR_ERR(master->pclk);
> >  
> > -	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> > -										NULL);
> > -	if (IS_ERR(master->core_rst))
> > -		return PTR_ERR(master->core_rst);
> > +	master->resets = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
> > +	if (IS_ERR(master->resets))
> > +		return PTR_ERR(master->resets);
> > +
> > +	ret = reset_control_deassert(master->resets);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = devm_add_action_or_reset(&pdev->dev, dw_i3c_resets_assert, master->resets);
> > +	if (ret)
> > +		return ret;
> 
> This looks like we are missing
> devm_reset_control_array_get_optional_exclusive_deasserted().
> 
> regards
> Philipp

