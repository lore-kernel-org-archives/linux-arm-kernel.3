Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB93C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 10:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIPn1JdmQUBAudYGWKwQBBR2ZjhtmhuYOGeF5hB/XP8=; b=sHxEHnARfnJMD1rKyjSy6Ocp7T
	mXLWE484cqvaOsjp9bIM/4CC08WhBlwbECLlD6QkXD5e7jXtkEh2DtR8BcnF6ph4XOuYSMG6WJVZG
	yH/60MKz4Ha3xcgmOX3On4PbzJPUWN64iEuDDDKK/q6Ch5V14k6IYLMFEN2Iv2dWsrI15q/fjLJIF
	V8AXkQZU9xaJKRWll3VspwUHv8wW5FA0KJZELV+nSDDST9ubLGfGEvH+R1HlHkxGkIusCgrom6zjN
	MdP5jm19Grd7ah2PTQQ+lE9RT9YfFBjf7O4+x8Vo4iK8Tsay+0RSId4ljhAV1Is2zNCZbAKLafe55
	+AQ0Yvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubd3V-00000004rFt-2X07;
	Tue, 15 Jul 2025 10:38:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubd0y-00000004qsj-0YUs;
	Tue, 15 Jul 2025 10:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cIPn1JdmQUBAudYGWKwQBBR2ZjhtmhuYOGeF5hB/XP8=; b=14TGwTJ8i2Mh5u5WG7VtC3VE23
	YFqP6TUaqtH3GFuLFFL7UrSspk3fVBByN4gsW70nMbjqCUovWeMbDyltzB83dS1IFVG0m5945ngjZ
	BuVB1Rp76b99J3JpEGR0olUIaAY5UQ30wjwa/ZzUKuYS1mVSnc+Iq3NRN8l5YhXceZxAC8UjvwM0v
	TTy+p+lGttVM88UHbqHNGYjTSjirYsOWteKkcFBBVVMcy3Vq1hqz8zd+5bwb87Dw8Id9bHxyOwHkI
	7xdQg6RmqEDmq93oMFMXrbUZBMUNl1n/Iv9Dcpbc9o39WGUCsEXeE12Tw588LxpqE5vN0oqN7tQLs
	2L81kG0A==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubd0o-00009u-Be; Tue, 15 Jul 2025 12:35:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC/PATCH 2/2] phy: rockchip: usbdp: implement .set_mode
Date: Tue, 15 Jul 2025 12:35:47 +0200
Message-ID: <3981131.iZASKD2KPV@phil>
In-Reply-To: <20250710152252.2532020-3-jkeeping@inmusicbrands.com>
References: <20250710152252.2532020-1-jkeeping@inmusicbrands.com>
 <20250710152252.2532020-3-jkeeping@inmusicbrands.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_033600_377078_BD99B157 
X-CRM114-Status: GOOD (  21.30  )
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

Hi John,

Am Donnerstag, 10. Juli 2025, 17:22:50 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb John Keeping:
> When the orientation of a type C cable changes, usbdp set the new
> configuration in its internal state but does not write this to the
> hardware.
>=20
> Make use of phy_ops::set_mode to write this new state.  This should be
> called by the USB controller when it is notified of a role change
> (assuming it is acting as the role switch) and will be called at a point
> when the controller does not expect the phy to be operating normally.
>=20
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

with the comments from Ondrej in [0] the whole thing seems to be
slightly more complex


[0] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250225184=
519.3586926-3-heiko@sntech.de/

> ---
>  drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index c066cc0a7b4f1..00368fb09307a 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1335,9 +1335,23 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
>  	return 0;
>  }
> =20
> +static int rk_udphy_usb3_phy_set_mode(struct phy *phy, enum phy_mode mod=
e, int submode)
> +{
> +	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> +	int ret =3D 0;
> +
> +	mutex_lock(&udphy->mutex);
> +	if (udphy->mode !=3D UDPHY_MODE_NONE)
> +		ret =3D rk_udphy_init(udphy);
> +	mutex_unlock(&udphy->mutex);
> +
> +	return ret;
> +}
> +
>  static const struct phy_ops rk_udphy_usb3_phy_ops =3D {
>  	.init		=3D rk_udphy_usb3_phy_init,
>  	.exit		=3D rk_udphy_usb3_phy_exit,
> +	.set_mode	=3D rk_udphy_usb3_phy_set_mode,
>  	.owner		=3D THIS_MODULE,
>  };
> =20
>=20





