Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417A8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70oUrtBybT9pvgsdRucJAcKaeUTQt17KWLpCLJnAsc0=; b=IOwVcL4vrrJDj+gLRR91vMm9eY
	Jq5A4bqL/HBXmr6QXphBzE3MWDrrWSsVACNb83sXykI690nIFvwURjWpuxIoCG3yWxL3MTJ3k7+1/
	C+SrUOfc4wHgqrVjVqGnwO/sxIUoSreScrmEjG1m8jHcVfJWaMDKAFwV80wCi++JNqW0UbicJhfMz
	5y9+HkyVR1Qwrt0smmuIC/Wb18MA/lrjzFq/7WLBP+/zX9X9MoSEuRwV+k0voCr5AQt3Vl1bKDjkT
	vPCBSEHwXQg8beZJ2ymAFcpA0teDXgQWNAr7wPNIr/BcjQgUW6jXerwXsnxDJ9qe4QawwLe6BosrP
	VuQI9PSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gRZ-0000000ATpZ-0sxo;
	Mon, 22 Sep 2025 13:19:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gRX-0000000ATob-2w9F
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=70oUrtBybT9pvgsdRucJAcKaeUTQt17KWLpCLJnAsc0=; b=MgrAvkoZieTRfYf4uZB7v/tvmu
	rcuWLN1tmgYTrb15RLPATU+zs2dkiPM50pE1EAdKwThA+7BugK/szNhvOAt2hxOpDXC7CbfbjQwtT
	hqGcyeniT0GKrtG0WNLYWnqN06mTAjA8K3bSq+zkCV3eBIoFbCtmOaQ18H5Ijnv8FXqT4X+YFbtCY
	OcvS0T9iUnwLgwojdv8Txtpq22GKc7pI+KWpwAeoH6cJng++LDAla27k+Jo01iGWJyGotEL/gwLzb
	ILoHOKcBKMYWBWEyZHTGwPOpXYc6xAoqT6cLqLLb5MCRYyUqnDWbWhisGRrmQbdvNJ+/QsD8M2jKp
	9oCFiIuw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gRU-00000008ITU-1F68
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:18:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1v0gRQ-0005EN-QE; Mon, 22 Sep 2025 15:18:52 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1v0gRQ-002bNX-1U;
	Mon, 22 Sep 2025 15:18:52 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 12606477046;
	Mon, 22 Sep 2025 13:18:52 +0000 (UTC)
Date: Mon, 22 Sep 2025 15:18:51 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/4] net: can: rockchip: Refactor the
 rkcanfd_devtype_data structure
Message-ID: <20250922-hopeful-mysterious-mole-bccfa3-mkl@pengutronix.de>
References: <20250922071543.73923-1-zhangqing@rock-chips.com>
 <20250922071543.73923-3-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxk6t45566eu5aco"
Content-Disposition: inline
In-Reply-To: <20250922071543.73923-3-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_141856_508137_40F5ADB7 
X-CRM114-Status: GOOD (  16.53  )
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


--pxk6t45566eu5aco
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/4] net: can: rockchip: Refactor the
 rkcanfd_devtype_data structure
MIME-Version: 1.0

On 22.09.2025 15:15:41, Elaine Zhang wrote:
> Add new function pointer:
> Encapsulate some hardware operation functions into
> rkcanfd_devtype_data to provide differentiated implementations for
> different models (such as RK3568v2/v3).
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

[...]

> diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/=
rockchip/rockchip_canfd.h
> index 93131c7d7f54..bcd26d23062b 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd.h
> +++ b/drivers/net/can/rockchip/rockchip_canfd.h
> @@ -436,9 +436,20 @@ enum rkcanfd_model {
>  	RKCANFD_MODEL_RK3568V3 =3D 0x35683,
>  };
> =20
> +struct rkcanfd_priv;
> +
>  struct rkcanfd_devtype_data {
>  	enum rkcanfd_model model;
>  	u32 quirks;
> +	void (*get_berr_counter)(struct rkcanfd_priv *priv, struct can_berr_cou=
nter *bec);
> +	void (*interrupts_enable)(const struct rkcanfd_priv *priv);
> +	void (*interrupts_disable)(const struct rkcanfd_priv *priv);
> +	void (*fifo_setup)(struct rkcanfd_priv *priv);

Why do you make fifo setup a function pointer if it's only called from
chip_start, which you make a function pointer, too?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pxk6t45566eu5aco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjRTLgACgkQDHRl3/mQ
kZzvyQgApVlHcsn6vij4HUY70eO04wqsBAOXG0klOf3yy/PakkXYgqsz7mKlryRg
HX+dlpOa6RESuRjCLA/REQo4whMrVTysanahmydgd8CqEvV+id+/0qKB6PvWKEhm
3JejSO5O16PGRXKDA/GBpFaDzDdav77p/3TgVtNKUioOL5/18ca4dNgM9o+/NUZH
+Ak/UKtR6VnV2DvyR3hWR+eznMl0my/zXmf0X1hrm8bUnikJtQqEGaGrWfJqHXiw
tr9sijYa+akL4b2+x4R61dcfmKFo9hNzizx+Vhf8L8Ip8FiF2y7wj9kdgQlBMhFd
6Gh9dnZ0gTk8Rbb2PJb5oCZQ7jLyOA==
=sxoi
-----END PGP SIGNATURE-----

--pxk6t45566eu5aco--

