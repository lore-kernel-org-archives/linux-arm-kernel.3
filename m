Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22240CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUA3S4XjZXhVH6gE2pL/yGU4bbUKuLEop3XjD8KMHgQ=; b=iUTE5gA2jyUwvPjxwqwjMIki3A
	4xodsplH2BM4NFgJQ4WWArgjRtCFeNOyLZ+7sUzK6Yc4DE7zoHDupVP5AyG1Cc0w6beKA7tQMyW/n
	42X72ZatzFUyOkSTX+ilEfYbW8ppZZwAraEJQavD8lQ7YPh7jNONEeNH6Sj8X8dyduEazmkmsj9Wf
	zTTFsM//wMoK4dJWDwpWxjAh69DWqO2oPNN0Y8xXb5PodR/MytcpWOoc1+RPfEYBs7/BNgKukUsdZ
	zu9FnQTVXvv0ardDeiLQkPkkBRMxfK6IVd716E9KXKtGo8qmNFYX7STLYrkOhouugwJYQLqCEaqd9
	eLLFBfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6TO-00000008NJn-15KV;
	Wed, 12 Nov 2025 08:45:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6TL-00000008NIB-2H4b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:45:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vJ6T8-0001qQ-9X; Wed, 12 Nov 2025 09:44:46 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vJ6T6-0003Hx-34;
	Wed, 12 Nov 2025 09:44:44 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8D2B349D91F;
	Wed, 12 Nov 2025 08:44:44 +0000 (UTC)
Date: Wed, 12 Nov 2025 09:44:44 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aswath Govindraju <a-govindraju@ti.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/8] phy: phy-can-transceiver: Support TJA1048/TJA1051
Message-ID: <20251112-vivid-mysterious-guppy-3bc98a-mkl@pengutronix.de>
References: <20251001-can-v7-0-fad29efc3884@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybnlldmwtejuzxbv"
Content-Disposition: inline
In-Reply-To: <20251001-can-v7-0-fad29efc3884@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004459_602144_36C879F5 
X-CRM114-Status: GOOD (  13.92  )
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


--ybnlldmwtejuzxbv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/8] phy: phy-can-transceiver: Support TJA1048/TJA1051
MIME-Version: 1.0

On 01.10.2025 21:22:31, Peng Fan wrote:
> TJA1048 is a Dual channel can transceiver with Sleep mode supported.
> TJA105{1,7} is a Single Channel can transceiver with Sleep mode supported.
>
> To support them:
> patch 1: add binding doc
> patch 2/3: To support dual channel,
>    - Introduce new flag CAN_TRANSCEIVER_DUAL_CH to indicate the phy
>      has two channels.
>    - Introduce can_transceiver_priv as a higher level encapsulation for
>      phy, mux_state, num_ch.
>    - Alloc a phy for each channel
> patch 4: Simplify code
> patch 5: Add TJA1051,7 support
> Others: Update dts to use phys.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ybnlldmwtejuzxbv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkUSPkACgkQDHRl3/mQ
kZySvAf+OFcIv9Q1NDa53XdFIdOJfnQshUo1IZMggqNsuPNzMQKJ6R564JfdKSe+
SDr8+3X7K7je0ZNjGNwBlqG67+AUU/WGW2v4ZOEkabVxnNEVbPHz7qJwLmYUs9b3
vOSIMe0uxsXGVN3aFHsbC6kOB3wahwNp/1IDYdmZa/z6YOwA3bQ3eJAiqnbEuQWW
leNCXauhnCw+WTtCdSLzQN7vLWnWKnRFWmuGfFTAK4S8/vEqOc6Y1p/ThTv8wOIh
4UfcCqqRvH6zUWh5SbhQyANm9bO/qbbs4P4qRGEH+0X3/7oCKWc2VAI0lGQ1ndtf
5G51bBe28y6IHAGpb2c1rGNXLw8Cgg==
=tFN5
-----END PGP SIGNATURE-----

--ybnlldmwtejuzxbv--

