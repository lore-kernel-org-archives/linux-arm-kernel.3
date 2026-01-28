Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAF1D46C01
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 22:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfPWU/6INqaXgHJYGH9TyZanu63iz0zh/qr7Kle/x4Q=; b=ZwBwmItGsDDmJCnrDaGC78I2Vo
	i9DdZDS0C8u5IbHdBpvBcFL1XGpRjIK8qWhc9FNUU0v0+Mr/CkhzHgDiRkjUNW/hvkJxaObm9A8oE
	paQEMRBowmJQFzE1xokIrTD+TWxgV2YVKtfdOi1/ByHSgIe6wLG8s6SBsIb2lCN4gwZAleTjZrooa
	I1NzvsEUHpKSe0/38gphs2GXFaDOPX96S45HVgSpeVEMst+oAJz0Pw62cY/f81PPMINAnMkBDJsK5
	eLZBsHySqw5dXzcsW/nXEUWmZaIFbXW/vilEgk+qEgoSKJB+kxZrRS+kpB7igiAbppWdeO5S0Q1Hg
	qvoAgFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEVJ-0000000Gufz-27c1;
	Wed, 28 Jan 2026 22:59:17 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEVH-0000000GueX-1lQQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 22:59:17 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f1d4Z4hc2z9tJr;
	Wed, 28 Jan 2026 23:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769641150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EfPWU/6INqaXgHJYGH9TyZanu63iz0zh/qr7Kle/x4Q=;
	b=pGGMZR3Gu5EX08zu8GKw7j5PhRMFZlz1vhdUDXvKGBLi5Q9mBICXeeGUZhkCZg6fKlg6NJ
	ENt8PjjDL4EbtvyChWm/qWknBGkZtM1UoyNXTYXOyTAmLEPDTfvo2KtlSHzugAt1SqgZaH
	2DwBSzn5KkSncnm70q0VAKRGI9b0U/auWqa/gStNvhwRh9WAW+5K4Kc2PRqOEzQX/XX4NW
	G4NQy5PZQppvMfI5rorQmp5QF3DNOeHnxLGQo5e4d2eqzMsXek/Uxgi1Y3A9RBz7iDOS1K
	kf/2py0mHabS8U8diWWV/hQy3/xc2rPxGvcCHFhm+wcp2LLXvGcazKB/OR3IEA==
Date: Wed, 28 Jan 2026 23:58:59 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, horms@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, wahrenst@gmx.net,
 pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
 richardcochran@gmail.com, edumazet@google.com, andrew+netdev@lunn.ch,
 robh@kernel.org, krzk+dt@kernel.org, andrew@lunn.ch
Subject: Re: [net-next,v20,7/7] net: mtip: Extend the L2 switch driver for
 imx287 with bridge operations
Message-ID: <20260128235859.634422f1@wsk>
In-Reply-To: <20260128022600.4151612-1-kuba@kernel.org>
References: <20260126103400.1683125-8-lukasz.majewski@mailbox.org>
	<20260128022600.4151612-1-kuba@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 2682124a76cf458dce0
X-MBO-RS-META: u9mik3pdfwu9wda13sbs1rycteokqfio
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_145915_602368_3A479A20 
X-CRM114-Status: GOOD (  23.90  )
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
> net: mtip: Extend the L2 switch driver for imx287 with bridge
> operations
>=20
> This patch adds bridge operations support to the MTIP L2 switch
> driver, enabling hardware offloading for packet switching when a
> bridge is created on the switch interfaces.
>=20
> > diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
> > b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c new file mode
> > 100644 index 000000000000..f961b9cc4e6a
> > --- /dev/null
> > +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c =20
>=20
> [ ... ]
>=20
> > +static int mtip_ndev_port_link(struct net_device *ndev,
> > +			       struct net_device *br_ndev,
> > +			       struct netlink_ext_ack *extack)
> > +{
> > +	struct mtip_ndev_priv *priv =3D netdev_priv(ndev),
> > *other_priv;
> > +	struct switch_enet_private *fep =3D priv->fep;
> > +	struct net_device *other_ndev;
> > +	int err;
> > +
> > +	/* Check if one port of MTIP switch is already bridged */
> > +	if (fep->br_members && !fep->br_offload) {
> > +		/* Get the second bridge ndev */
> > +		other_ndev =3D fep->ndev[fep->br_members - 1];
> > +		other_priv =3D netdev_priv(other_ndev);
> > +		if (other_priv->master_dev !=3D br_ndev) {
> > +			NL_SET_ERR_MSG_MOD(extack,
> > +					   "L2 offloading only
> > possible for the same bridge!");
> > +			return notifier_from_errno(-EOPNOTSUPP); =20
>                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> Should this return -EOPNOTSUPP instead of
> notifier_from_errno(-EOPNOTSUPP)? The caller mtip_netdevice_event()
> already wraps the return value with notifier_from_errno(ret), so
> double-wrapping corrupts the return value.
>=20
> Looking at similar drivers like cpsw_new.c (cpsw_netdevice_port_link),
> the pattern is to return raw errno values here and let the event
> handler do the conversion.
>=20

Yes, the call to notifier_from_errno() can be removed.

I will fix it with v21.

> > +		}
> > +
> > +		fep->br_offload =3D 1;
> > +		mtip_switch_dis_port_separation(fep);
> > +		mtip_clear_atable(fep);
> > +	}
> > +
> > +	if (!priv->master_dev)
> > +		priv->master_dev =3D br_ndev;
> > +
> > +	fep->br_members |=3D BIT(priv->portnum - 1);
> > +
> > +	err =3D switchdev_bridge_port_offload(ndev, ndev, NULL,
> > NULL, NULL,
> > +					    false, extack);
> > +	if (err) {
> > +		dev_err(&ndev->dev, "can't offload bridge port %s
> > [err: %d]\n",
> > +			ndev->name, err);
> > +		return err;
> > +	} =20
>=20
> If switchdev_bridge_port_offload() fails, the state changes made
> earlier in the function (br_offload, br_members, master_dev, and the
> hardware configuration via mtip_switch_dis_port_separation and
> mtip_clear_atable) are not rolled back.
>=20
> Looking at cpsw_new.c for reference, it modifies br_members after the
> switchdev call succeeds, avoiding the need for rollback. Could the
> state updates here be reordered to happen after
> switchdev_bridge_port_offload() returns successfully?
>=20

I will add to v21:

fep->br_members &=3D ~BIT(priv->portnum - 1);
priv->master_dev =3D NULL;

before I return err.

(This "rollback" code was missing).

> [ ... ]
>=20
> > +static int mtip_netdevice_event(struct notifier_block *unused,
> > +				unsigned long event, void *ptr)
> > +{ =20
>=20
> [ ... ]
>=20
> > +	return notifier_from_errno(ret);
> > +} =20
>=20
> [ ... ]



--=20
Best regards,

=C5=81ukasz Majewski

