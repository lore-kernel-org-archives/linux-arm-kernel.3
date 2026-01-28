Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA7ED46C06
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruAirXc8ptlR96ve5/9BugE40WCJ6xsmkWJx5Uj7rfU=; b=Br/cdd1W+9bxodS9dW+2cjSReh
	aoe6wBQNgO8f2Ee8ZcTxnMK7UzxzeRFkx95idmVTAEQ7YwrwdXdYjTNVUruNCN/c70TdCp9leqPQB
	TT0qSfAqgeqbvcfkssuQ3UA0+LImAcGHBGofam+XZZXctE4TO29AwbLl+y2gbltM4OAgOJ5rHgTRI
	22OXNpHWxXi11zzUthWSu5LYNo/eK1VqOQvYaVO2mMT5y54xWjOElcwLSMt5Xb+F4QWnc7F4H3N5X
	jjwutR8TIRVvN17nU0ty3YdsucfD/3htmUEXXR1eNbNYJqn3J+k2To81uU9QBzyFQ8Fl3XMBMbzt5
	59y45XYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDPQ-0000000GrFa-2B2E;
	Wed, 28 Jan 2026 21:49:08 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDPO-0000000GrFF-1vvv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 21:49:07 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f1bWc4D8zz9v9k;
	Wed, 28 Jan 2026 22:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769636940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruAirXc8ptlR96ve5/9BugE40WCJ6xsmkWJx5Uj7rfU=;
	b=aIGJEdcPUTNpCRPoxieT4ns0YAjlCS1SCWknUwnMSvmg9qMSU20pliO7EHJ/YKehTef8X4
	OfTEP83Ov9GJqRBfQnmvxyTZcUkhN3Isu8Z69m16GysXboDZgypVf6Kj9EW9o5rDTKZsMY
	NIcdir18IPW6rSkamg/khyUXsG3gehroa1KRAizet4EDWTmH8218TSM2mJHy+ejCWT3X0R
	RlbV1knLwiHUkLPAQpjKDcSOf9gjVgsxYEH1P6cGBrYcHW7AVeKncHeNW5OdTfn2+5JM62
	sRj7wXkwpjWQSCUAdP5w3MdePLt7m5N1DeC244DsjJqF2Be7TWLIy2uh2IH44A==
Date: Wed, 28 Jan 2026 22:48:52 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, horms@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, wahrenst@gmx.net,
 pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
 richardcochran@gmail.com, edumazet@google.com, andrew+netdev@lunn.ch,
 robh@kernel.org, krzk+dt@kernel.org, andrew@lunn.ch
Subject: Re: [net-next,v20,3/7] net: mtip: Add buffers management functions
 to the L2 switch driver
Message-ID: <20260128224852.62b16788@wsk>
In-Reply-To: <20260128022554.4151421-1-kuba@kernel.org>
References: <20260126103400.1683125-4-lukasz.majewski@mailbox.org>
	<20260128022554.4151421-1-kuba@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 0a70d41f27b7b89e913
X-MBO-RS-META: p4u7ozw7pi4bkkx54cikgzroe65njg1g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_134906_649479_A5156DFB 
X-CRM114-Status: GOOD (  21.78  )
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
>=20
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-local.html ---
> net: mtip: Add buffers management functions to the L2 switch driver
>=20
> This patch adds buffer management functions for the MTIP L2 switch
> driver, implementing mtip_free_buffers(), mtip_create_page_pool(), and
> mtip_alloc_buffers() for RX page pool and TX bounce buffer handling.
>=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c index
> > 03c5163d6508..9c21a3d29c1c 100644 ---
> > a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c +++
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c @@ -888,11
> > +888,96 @@ static void mtip_get_drvinfo(struct net_device *dev,
> >
> >  static void mtip_free_buffers(struct net_device *dev)
> >  {
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	int i;
> > +
> > +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> > +		page_pool_put_full_page(fep->page_pool,
> > +					fep->page[i], false); =20
>=20
> Can fep->page[i] be NULL here?  When mtip_alloc_buffers() fails
> partway through the RX allocation loop, it calls mtip_free_buffers()
> via the error path.  At that point, only some fep->page[] entries
> have been allocated - the rest remain NULL from the kzalloc
> initialization.
>=20
> The call chain page_pool_put_full_page()->page_pool_put_netmem()->
> page_pool_unref_and_test()->page_pool_unref_netmem()->
> netmem_get_pp_ref_count_ref() will attempt to access
> &NULL->pp_ref_count when passed a NULL page, causing a NULL pointer
> dereference.
>=20
> Should there be a NULL check before calling page_pool_put_full_page()?
>=20

Yes, such check shall be added.

> > +		fep->page[i] =3D NULL;
> > +	}
> > +
> > +	page_pool_destroy(fep->page_pool);
> > +	fep->page_pool =3D NULL;
> > +
> > +	for (i =3D 0; i < TX_RING_SIZE; i++)
> > +		kfree(fep->tx_bounce[i]);
> >  } =20
>=20
> [ ... ]
>=20
> > +static int mtip_alloc_buffers(struct net_device *dev)
> > +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	struct cbd_t *bdp;
> > +	struct page *page;
> > +	int i, ret;
> > +
> > +	ret =3D mtip_create_page_pool(fep, RX_RING_SIZE);
> > +	if (ret < 0) {
> > +		dev_err(&fep->pdev->dev, "Failed to create page
> > pool\n");
> > +		return ret;
> > +	}
> > +
> > +	bdp =3D fep->rx_bd_base;
> > +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> > +		page =3D page_pool_dev_alloc_pages(fep->page_pool);
> > +		if (!page) {
> > +			dev_err(&fep->pdev->dev,
> > +				"Failed to allocate page for rx
> > buffer\n");
> > +			goto err;
> > +		} =20
>=20
> [ ... ]
>=20
> > + err:
> > +	mtip_free_buffers(dev); =20
>=20
> When this error path is taken, fep->page[] may contain NULL entries
> for pages that were never allocated.
>=20
> > +	return -ENOMEM;
> >  } =20

I will add proper fix for v21.

--=20
Best regards,

=C5=81ukasz Majewski

