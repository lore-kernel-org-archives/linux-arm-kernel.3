Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B213CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Whe8uv8CKsZj8T0W5pwH/7TC7E6/XowI54Hf3fwTq70=; b=wFo8z3GWMh5KpM/qcCWb9+ahyW
	clHQJTxWIRwhLV97dw9CUFSpnHfNXXaeQ4iS38rk3wzj1mR2n8dGPn6vnijggX56j6OmX2EzHxMp0
	/CaC+T6Jk5g/Qvgg/u4SJwUkN0Kh3jd9+uvM6BCXKBDbqC6nMCGuXOdgaD5q4bJUz/3LeH2w/GnJ+
	dC5Vj4a1gUqlcx2JmV9OQnsugtHUwM1whU51XFlUEZr00EXZJMMaev945spbkl5JVdW9N5ZD5a5sj
	VHLFE2HJqkbfKNqfd5Jh7baHpbbPb9M9CkLJOL4K5pVj03okngCdDxXGZo1VmlvBmFrINvNUYbcKu
	U1Q4EnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgVr-00000003sOl-0reQ;
	Fri, 19 Sep 2025 19:11:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgVo-00000003sN9-3DwN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:11:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgVg-0003TW-4W; Fri, 19 Sep 2025 21:11:08 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgVe-0029df-3A;
	Fri, 19 Sep 2025 21:11:07 +0200
Received: from pengutronix.de (ip-185-104-138-125.ptr.icomera.net [185.104.138.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BF5294751F9;
	Fri, 19 Sep 2025 19:11:02 +0000 (UTC)
Date: Fri, 19 Sep 2025 21:11:00 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 3/9] phy: phy-can-transceiver: Add dual channel
 support for TJA1048
Message-ID: <20250919-placid-mauve-crayfish-4bac17-mkl@pengutronix.de>
References: <20250909-can-v6-0-1cc30715224c@nxp.com>
 <20250909-can-v6-3-1cc30715224c@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ddcs7xwxfzkwj3u5"
Content-Disposition: inline
In-Reply-To: <20250909-can-v6-3-1cc30715224c@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_121116_806032_B8EDC2B6 
X-CRM114-Status: GOOD (  20.09  )
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


--ddcs7xwxfzkwj3u5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 3/9] phy: phy-can-transceiver: Add dual channel
 support for TJA1048
MIME-Version: 1.0

On 09.09.2025 13:40:13, Peng Fan wrote:
> - Introduce new flag CAN_TRANSCEIVER_DUAL_CH to indicate the phy has two
>   channels.
> - Alloc a phy for each channel
> - Support TJA1048 which is a dual high-speed CAN transceiver with sleep
>   mode supported.
> - Add can_transceiver_phy_xlate for parsing phy
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/phy/phy-can-transceiver.c | 91 ++++++++++++++++++++++++++++-----=
------
>  1 file changed, 65 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-tran=
sceiver.c
> index 6415c6af0e8414a6cc8d15958a17ee749a3f28e9..f06b1df76ada023f432dce892=
c3346f45397ab54 100644
> --- a/drivers/phy/phy-can-transceiver.c
> +++ b/drivers/phy/phy-can-transceiver.c
> @@ -17,6 +17,7 @@ struct can_transceiver_data {
>  	u32 flags;
>  #define CAN_TRANSCEIVER_STB_PRESENT	BIT(0)
>  #define CAN_TRANSCEIVER_EN_PRESENT	BIT(1)
> +#define CAN_TRANSCEIVER_DUAL_CH		BIT(2)
>  };
> =20
>  struct can_transceiver_phy {
> @@ -29,6 +30,7 @@ struct can_transceiver_phy {
>  struct can_transceiver_priv {
>  	struct can_transceiver_phy *can_transceiver_phy;
>  	struct mux_state *mux_state;
> +	int num_ch;

As a flexible array this looks like:

struct can_transceiver_priv {
        struct can_transceiver_phy *can_transceiver_phy;
        int num_ch;
        struct mux_state mux_state[] __counted_by(num_ch);
}

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ddcs7xwxfzkwj3u5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjNqsEACgkQDHRl3/mQ
kZxw3Af+PBvxMN1nt5aRZStLzP5rPgSQdXAJRyW4P7nGZlb7LEBiFIiAeFkNhNOz
xUXylSex50EhW2f23ZQar/WxcJ77N70yVV0DWbGHllNfK36ZVBPcjQ2qio0qk3rW
WTlyQYrMjS0WCKpIlWHw9qBCR+Ph7+rzz9+TTQiYEsxW6vG/AAhyK7+0jI+bePdh
0tDpTPadOfy+fO+sK8Sc8zS+/YDo8VlAJGBlPokJN52ikH8deUo5m1PgB66hM+pS
JF8fzV9FLUxgD5pNQ6jGryJBwz3VclLmXdx4uR8cF9c1X+OOrgEbKz60t+1qqaZx
/iXcb09yK9e/3fk7SWEzyT/KniCEuw==
=XG5h
-----END PGP SIGNATURE-----

--ddcs7xwxfzkwj3u5--

