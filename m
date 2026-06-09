Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A7CCD8CBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeflN5T28HahSSS6B50cN92fDni13v9ufrgZcj6h5yI=; b=bbeUuYYP5RtV/w+XzMJD9rbGt3
	3D9Az+ttmFC6EQsUyIgV1F/xxz+4aTbDWllcX8cZjylUyfZ7RHyhzQhnMqCS7Ua4o+J9EtwnhoTi9
	WOtATMdimEa1bs1J0livbTAnCOdJOTVcSFe19gpyE7jfHWDWtRGjyHvU1RuXUGUVb0b2OqkDz5V9w
	nyVhtLp0tMaRAZDeJvwLLiqUu75OfDt8mzmionQuP+EPN5HK5rnWj8u8GuyFw/6/fPn9W8ezId//F
	8GJeVFNVtJbS4LEI6/mOX2sTnoPVpRayvrd2fly8am7/B3s2nThLcQ4CLxmEFVuCaTYadLr1F5P+T
	Uqt6FmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrxf-0000000550k-3Z1A;
	Tue, 09 Jun 2026 08:37:27 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrxc-000000054yr-1ZAC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:37:26 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gZMj80rBzz9tXD;
	Tue,  9 Jun 2026 10:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780994236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeflN5T28HahSSS6B50cN92fDni13v9ufrgZcj6h5yI=;
	b=RPiYH9VXQKDM42/5vsxxIwbqpWCXmAWSGRa5js/gMS3D6qSjYnJ1RphKo0vO7Iyifj32qI
	f9m7KUqHr7kFocN4TPV49/mA+WI9nN2Mtr4WBW0TMkSb6Z18jJGf/nxBGKNaCUY/0kVCpa
	bC1OeNR1BAHN2zrmQrj98yrglCDOcYKzP+qAFY0uqzVBearFclMNMAZ1AvpLovt0NPtLVp
	zyKCLX2SB5jeL/SnhwsPXJPuegPBoLNUPm83mK+ZpaLTDQvHfF6cercjXYM4DxL0un+A+k
	QADS4O4H13SfmIZq/wryfYCVRtHQnsecuO20gRXkGSPSUxQ8CdtOXDIO/1AEAQ==
Date: Tue, 9 Jun 2026 10:37:04 +0200
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, richardcochran@gmail.com, lgirdwood@gmail.com,
 nathan@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 krzk+dt@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, Andrew Lunn 
 <andrew@lunn.ch>
Subject: Re: [net-next v24 3/7] net: mtip: Add buffers management functions
 to the L2 switch driver
Message-ID: <20260609103704.443c0b57@wsk>
In-Reply-To: <20260605021853.3594553-1-kuba@kernel.org>
References: <20260601112437.2216043-4-lukasz.majewski@mailbox.org>
	<20260605021853.3594553-1-kuba@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 44354306cdec518454b
X-MBO-RS-META: bmemnt9kx546q4uk8kkttrrnxxn5ua5h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_013724_556593_B05F50E1 
X-CRM114-Status: GOOD (  29.95  )
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

Hi Jakub,

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: mtip: Add buffers management functions to the L2 switch driver
>=20
> This patch fills in mtip_alloc_buffers() and mtip_free_buffers() for
> the MTIP L2 switch driver, replacing the previously empty stubs with
> real page_pool setup/teardown and tx_bounce buffer allocation/free.
>=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c index
> > 1d1005a42306..5b5229ee411d 100644 ---
> > a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c +++
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c @@ -892,11
> > +892,101 @@ static void mtip_get_drvinfo(struct net_device *dev,=20
> >  static void mtip_free_buffers(struct net_device *dev)
> >  {
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	int i;
> > +
> > +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> > +		if (!fep->page[i])
> > +			continue;
> > +
> > +		page_pool_put_full_page(fep->page_pool,
> > +					fep->page[i], false);
> > +		fep->page[i] =3D NULL;
> > +	}
> > +
> > +	page_pool_destroy(fep->page_pool);
> > +	fep->page_pool =3D NULL;
> > +
> > +	for (i =3D 0; i < TX_RING_SIZE; i++) {
> > +		kfree(fep->tx_bounce[i]);
> > +		fep->tx_bounce[i] =3D NULL;
> > +	}
> > +} =20
>=20
> [High]
> Now that mtip_free_buffers() is no longer an empty stub, can the
> mtip_open() error path tear down buffers that another active port is
> still using?
>=20
> Looking at mtip_open():
>=20
> 	if (fep->usage_count =3D=3D 0) {
> 		...
> 		ret =3D mtip_alloc_buffers(dev);
> 		if (ret)
> 			goto mtip_alloc_buffers_err;
> 	}
> 	...
> 	ret =3D mtip_mii_probe(dev);
> 	if (ret)
> 		goto mtip_mii_probe_err;
> 	...
>  mtip_mii_probe_err:
> 	mtip_free_buffers(dev);
>  mtip_alloc_buffers_err:
> 	if (fep->usage_count =3D=3D 0) {
> 		netif_napi_del(&fep->napi);
> 		clk_disable(fep->clk_ipg);
> 	}
> 	return ret;
>=20
> mtip_alloc_buffers() only runs when fep->usage_count =3D=3D 0, so the
> page_pool, fep->page[] and fep->tx_bounce[] are shared across switch
> ports and only allocated on first open. mtip_close() reflects this and
> only calls mtip_free_buffers() when fep->usage_count =3D=3D 1.
>=20
> When a second port is opened (fep->usage_count > 0) and
> mtip_mii_probe() fails, the mtip_mii_probe_err label still calls
> mtip_free_buffers() unconditionally, which destroys the page_pool and
> frees the tx_bounce buffers that the first, still-active port is
> using.
>=20
> Should the mtip_mii_probe_err teardown also be guarded by
> fep->usage_count =3D=3D 0 (or the labels reordered) so buffers are only
> freed for the last user, similar to mtip_close()?
>=20
> After this change the previously harmless call becomes a real
> teardown, so the surviving port's NAPI path (mtip_switch_rx() and the
> later mtip_update_cbd() refill) would dereference a freed
> fep->page_pool and NULL fep->page[] / fep->tx_bounce[] entries
> whenever the second port's PHY probe fails while the first port is up.
>=20
> > =20
> > +static int mtip_create_page_pool(struct switch_enet_private *fep,
> > int size) +{ =20
> [ ... ]
> > +}
> > =20
> >  static int mtip_alloc_buffers(struct net_device *dev)
> >  { =20
> [ ... ]
> >  	return 0;
> > +
> > + err:
> > +	mtip_free_buffers(dev);
> > +	return -ENOMEM;
> >  }
> > =20

Thank you for sending the AI review.

Please find my comments:

- I've gone through them and yes, there are a few issues found.
  However, those are IMHO not critical ones.

- Some issues are not valid at all - like concern what happens when the
  switch is run on multi processor chip - both imx287 and vf610 are
  single core chips.

- It seems like the AI review is "progressing" - i.e. there were no
  issues found with v23 for this particular patch. I do guess that the
  new Orc Mode from [1] has found it.

- I do guess that different AI agent would generate different review

- The aforementioned issues could be addressed with a fix patches -
  dragging along (and preparing for upstream) patch set with ~3400
  LOC (which is rejected by non-deterministic AI review) takes too much
  resources now.


To sum up:
----------

The MTIP driver for v6.6 kernel (YPRR Scarthgap) with and without
PREEMPT_RT for vf610 and imx287 as well as the v24 for net-next can be
found at [2].


Links:

[1] - https://netdev-ai.bots.linux.dev/ai-local.html
[2] - https://github.com/lmajewski/linux-imx28-l2switch/branches



--=20
Best regards,

=C5=81ukasz Majewski

