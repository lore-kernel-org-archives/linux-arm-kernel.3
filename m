Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E75FCC9D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2W8R6JKoSWBQ/NVWe1VH8DTpdfOcfJODkzczD104anE=; b=AGudlqFIyYDKSPHVo10qrY3LnE
	c3Chcutej1UGLIvjiaYEGUpE7BlSou1/NWviquTlV2QZjL9vhuuftGkmb+uOPZsUzrwy89d4PIonN
	HyuKjF5PKYvZHoS4SdpibAn+wnq7zKjO9Dc+iilxeKbvM5Ij1MWYew5Ad2tUFFbBlEzvfzQeCMQxC
	9cVYX7/K2lUcOqfinOhaqMzUC2gLEX0M434CnShHKDF+1oXS2SPBEVbnQRuh94Yhb6c1t+vQjcnjN
	+RvWeTpy2hlIGXnUEugs0nHSUVELjDsA4Dlny375eqqx/HIAWj5aqBGJ52Wv6LwAokfRAlkk1thIs
	bhQXLHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsOg-00000008wEu-0fBY;
	Tue, 10 Mar 2026 08:24:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsOe-00000008wD9-0ULN;
	Tue, 10 Mar 2026 08:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2W8R6JKoSWBQ/NVWe1VH8DTpdfOcfJODkzczD104anE=; b=JuC/yhxDoPy5BzKCllx+4lcx/F
	aT/7U8Uk8l3EzePnMXUbbxXawsxzRHryg8fghP2VOHv5kHVBckllNBimOOiJ0d8LfnHjtGmniMUoP
	q+tI4zY5GQIiNsEUe+qxnask3JoIfvvZdpBRFnoZGdldxQgpw2opTa6+/x5nJBA//K40leHf2j3eZ
	QL1kjydLamseRW0i8hF8yC9BA+ISD2o9MPNpUsGC0DfntkB9k4h7pa/Fd+8ADCPiSf0DDEzQCBI5M
	9HJQrDTSAcTC9UmZ18rrV1bkPrtisS78iMGtNExAIokgAvG70PlOoOoPpo/Lna+ZPaU1pgFFTLn9P
	iDkZROYQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-phy@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct dereference
 of phy->dev.of_node
Date: Tue, 10 Mar 2026 09:24:43 +0100
Message-ID: <2218670.OBFZWjSADL@phil>
In-Reply-To: <20260309190842.927634-11-vladimir.oltean@nxp.com>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
 <20260309190842.927634-11-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_012456_159317_F0DF1613 
X-CRM114-Status: GOOD (  13.16  )
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

Am Montag, 9. M=C3=A4rz 2026, 20:08:28 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Vladimir Oltean:
> The dw_hdmi-rockchip driver validates pixel clock rates against the
> HDMI PHY's internal clock provider on certain SoCs like RK3328.
> This is currently achieved by dereferencing hdmi->phy->dev.of_node
> to obtain the provider node, which violates the Generic PHY API's
> encapsulation (the goal is for struct phy to be an opaque pointer).
>=20
> Refactor dw_hdmi_rockchip_bind() to perform a manual phandle lookup
> on the "hdmi" PHY index within the controller's DT node. This provides
> a parallel path to the clock provider's OF node without relying on the
> internal structure of the struct phy handle.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
>=20
> v1->v3: none
> ---

[...]

> @@ -588,13 +589,17 @@ static int dw_hdmi_rockchip_bind(struct device *dev=
, struct device *master,
>  		return dev_err_probe(hdmi->dev, ret, "failed to get phy\n");
>  	}
> =20
> -	if (hdmi->phy) {

nit: a comment would be nice here. I.e. hdmi->phy being an opaque pointer
so checking hdmi->phy !=3D NULL is not possible.

With that being a "goal", I assume that information is not widely spread
so this would prevent the next developer trying to change it back to
"if (hdmi->phy)" while that handling change trickles down.


apart from that:

Reviewed-by: Heiko Stueber <heiko@sntech.de>




