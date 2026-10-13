Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA576CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApdHT9jlstoFu3E8M4KUrdFK8TNXHrk50WUdd+Ue74E=; b=mke7rGpCzc5/Sm11ytw9lWlfcu
	R5zLPpeZnrAUquziZkhvs2a2WZ1It7AJ2U9b16Nx259YLq+U3E9Y3aPZPC78WRtjEPzc9u4YDmOiB
	pjWsmDzN+UlhsWZR0D2xDRzvw+ZrRAaAkDJfBSSAgI4XmbGr0Z4Pa0yt0Tl0w6chZ8GGVBmu20y7Y
	X12YgP5hf5nyAoEnH4Y+rbtE55xVGyRoLPv/Ak/92RD8RlOZkm7XQgZWQfTL/SuwEAeWxXnrz+G4F
	KNzOEiq3YpCE/fTRB4HrGFLsB4mLuwQWV1xQJtTGxiwvxSIQrJrbb2qrAUGOHxDp1dOtDSevlldca
	6S6dGQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdTT-0000000D5gy-49mR;
	Tue, 13 Oct 2026 14:27:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdTR-0000000D5fI-1x4Z;
	Tue, 13 Oct 2026 14:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ApdHT9jlstoFu3E8M4KUrdFK8TNXHrk50WUdd+Ue74E=; b=beK6GkdQy1NZ4PQecms08ATFrl
	kSS+/POC5xGJIYGlVy0bc14YW4vezfpxbldFQ8R53Jdw68eBuV3P65FwDtUIlPFhIYV+URkdJ/TiH
	b7Q+wSdDo39FL9/whKJ9aM+FlZKOuosk2xxJVMLnGPh/Lo0BSCkKqsaM6HaAif+cSdTdK7DDrPDHI
	29UoUC4tanqgDKFu1VvSllaLPZqnF1AqIP4UnUWF9O4V9gMVshnZD/NkDLh2gNpIIxKfFcDCTMD5h
	SalpfbaEzOhZzzdHURgpnTUGkUzOa7OwBGHjprvxjZriFs1L29Gy9Xk4B5wK7gWHLuBsrA+jBW3gP
	Mh1J9KHg==;
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGdTL-0000000Fdty-3o5Z;
	Tue, 13 Oct 2026 14:27:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 805422018C1;
	Tue, 13 Oct 2026 16:27:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791901637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ApdHT9jlstoFu3E8M4KUrdFK8TNXHrk50WUdd+Ue74E=;
	b=gmAViN1StYgezRvrnW2kU8LQG8nMplvHkIg+MierkaxjevnZyfzwz2xBT3bQZ/Lx2On66e
	CxZEqSRp7QUJczqg6DXtuwRFjWeUrdY9yxtUsaNcvLXqkBXvfekIH5AXc8P5+EoBIO/cCR
	CLMiMhVkysMTlrD5KKWKWyxlB317sBBB69hXj/EfsbTvMeldaOAc/qFbkT+sB/7gIh1I1s
	IrEgx+oQ8a03xHgo4L/dYoxwcSEGq1gxQ1OSl19BJ3FOAFfVFw6QbGscuqQ2siuorLz8tI
	DOm9vTThYYK8qVtXI/CkZlMfYsvXF1GLy5frs94qdDe3W/zF6nT9VVTfFKRaTQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791901637; a=rsa-sha256;
	cv=none;
	b=BDXTtdWUkb9ZmZKI6YGH0IyAPrPSXhaar59i2sS6xaP2XB3PAz9yy/y+eEYlzp/3kKG3Lb
	/GHldNmy/YDouinmqqgbO5+qvEwMf37IWsHG60/cvIGFunGXArKj+y0zmUtARQbf5oEw2g
	aOX8ok8x+G7ujGhJnTOyBCggpNnMk8fZuruZ74RAwT0rl+mS5CB8OK3PeHgh7dW+Eh928z
	QDB3FdSTFBff8M/pWw2CI8saJnAK0/4OPtea59luZ5UnNvsU3EqP6QU3ikOx82H+Ye2l1E
	sHF29Jj1xEbX51X652LMo81vWn4NZfEw3OfSxPtV63h+lUrjRzGglIkeQGN8Ug==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791901637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ApdHT9jlstoFu3E8M4KUrdFK8TNXHrk50WUdd+Ue74E=;
	b=f1QeBoW0Ze/ClU7CMtKhrNIi3ByiryX7MiewNu1+Sdzb+h3dJ9+7RT7HD1Z4Fu2PLkn8ND
	T8zWl1BCf6IZCvaiIN1vAWqtvpmvHBhx89nvOv1w6SHBNd7UIKKb2Bxxqjut93IJE3w4Oz
	n9uUASxmUnDTHoMIzEoYr9mdPTrVQH8/TrzqNoQx8Xdey7KU+DGe+618tczic++uLL8fQ2
	SuevtlTvbvVPLKsjW0P1Lzd9qaj9jDf68eqI3sqVQvbe2kF/nUGF7dNE6j0pJ4zvjeebRg
	kPr2tp8PUecAK1nDJF5VX2KeahtdWU018s7EAwvdyFDDF0t913j+l1uLgjAFUQ==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xGdTJ-005hqR-1L;
	Tue, 13 Oct 2026 16:27:17 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 191795C31D7;
	Tue, 13 Oct 2026 14:27:17 +0000 (UTC)
Date: Tue, 13 Oct 2026 16:27:16 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-can <linux-can@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, kernel <kernel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip <linux-rockchip@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Subject: Re: [PATCH net] can: rockchip_canfd: stop bus-off restart before
 closing the device
Message-ID: <20261013-tricky-piculet-of-ampleness-cada4c-mkl@pengutronix.de>
References: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
 <20261013-hissing-saiga-of-endeavor-ef5e03-mkl@pengutronix.de>
 <tencent_F9D491A400474428BFE7262F1A1799A88407@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p2fdgwty2yztquzs"
Content-Disposition: inline
In-Reply-To: <tencent_F9D491A400474428BFE7262F1A1799A88407@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_152722_133572_90B18D20 
X-CRM114-Status: GOOD (  33.47  )
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


--p2fdgwty2yztquzs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net] can: rockchip_canfd: stop bus-off restart before
 closing the device
MIME-Version: 1.0

On 13.10.2026 21:06:21, Cunhao Lu wrote:
> Hi Marc,
>
> > AFAICS this is a systematic problem and should IMHO not worked around in
> > one driver only.
>
> Agreed. I initially only noticed the problem in the Rockchip CAN-FD
> driver and did not consider the common CAN code.

Thanks to your analysis, it was easy to reach that conclusion. :)

> > netif_running() tests __LINK_STATE_START, which is removed in
> > __dev_close_many() prior to calling the driver's ndo_stop().
> >
> > Can we make use of netif_running() prior to calling do_set_mode(dev,
> > CAN_MODE_START)? from can_restart()?
>
> If you have no objections, I think it would be better to put the
> netif_running() check after the existing !priv->do_set_mode check and
> before netif_carrier_ok():
>
>         if (!priv->do_set_mode)
>                 return -EOPNOTSUPP;
>
>         if (!netif_running(dev))
>                 return -ENETDOWN;
>
> This would preserve the existing error precedence for devices that do
> not support restart.

ACK

> > can_bus_off() should not schedule_delayed_work() if !netif_running().
>
> Agreed. Although this would change the behavior of some drivers, I think
> it should help improve stability.

ok

> > We still have to call cancel_delayed_work_sync(&priv->can.restart_work)
> > from each driver, though.

Let's wrap that into a function and put this into linux/can/dev.h. It's
name could be something like close_candev_cancel_restart_sync().

> I can make changes to the other drivers. However, I do not have the
> corresponding hardware and would not be able to test the changes on
> real devices, so I am concerned about the risk. I would like to confirm:
> do I need to audit and fix the restart behavior of every CAN device
> driver?

I think it's OK to fix the rockchip driver only.

> > What do you think?
>
> I will address these comments in v2. Thanks for your review.

Please split the changes into several patches:
- fix the existing infrastructure
- add new close_candev_cancel_restart_sync() function
- use this function in the rockchip driver

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--p2fdgwty2yztquzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCas4/wQAKCRDMOmT6rpmt
0sMkAP9SLysRPyc/bN1kfprQlX5GQAMSIsfWuKXrKvknT5XDYQD/fce1XVIeVE/g
Wu3BWgWdmmI0Sq7/V4pT4SEDHKDXXQM=
=J0Bg
-----END PGP SIGNATURE-----

--p2fdgwty2yztquzs--

