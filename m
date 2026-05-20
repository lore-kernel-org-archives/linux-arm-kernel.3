Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65177CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRJUo4PXuYN1XhJVP15C+J6R1n1WzcWxMs+6lKcGyXw=; b=QtWmVZ3y1NZzsFt2w9gKdQx9k9
	FxK+O0MJCyZbbDULKnrMFRTy93iEV9FK04C8ZpWqqzKCB5PrLgx5OzmpVDOYeWS7+kLGoRfUxFj2V
	mxMRQTPGpN57VMpxbYqvVAsZweiSsTcw1SCUTt9rKZGAilszRguSOhqBV6QLNEztePz3V2uI5f2+b
	yZ+SkKQGHC19bLKT2AV9Mu2jnvsAB7TzMds1VdXck0wTmUiiDr5EkhdH3oilx1ZNbR/yQYq5DP8GJ
	mhHavh5KAPpvvo5fG9DT63kSlA/DURk5yTpWONsS7TbZa0dIjnX66qdQddhmYZqYUIEehFOHcmn/R
	lpwpVTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPero-00000004QDp-3ylV;
	Wed, 20 May 2026 11:13:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPerm-00000004QD1-3uKY;
	Wed, 20 May 2026 11:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JRJUo4PXuYN1XhJVP15C+J6R1n1WzcWxMs+6lKcGyXw=; b=UIMfPi0n+2sixL8bSd9VaSky4K
	RHWEU0+Im4DinWDobN+TIklEhd6YinjY5ra47zGedlGtmCK3VcLA4SdnC/T9Wz+xbv787uc9NCmur
	oE/Pb9YEfcxcHLNfgJgespEqEWtw4n5OmHUUJpLH4OusgknEWNuQPRuBNqljFKhUo5+wDF9F6HKDp
	7be2MVHEYOcgda44vWIrGG8KrxbAhoTugxFAOK6tqo9T6Y/e1aUu/oa9ixbiz6AQcrrmBIpaKFezU
	Ywj+BMGYYbwcxGr5YO+NvKrymVGhCxN9ndMlH+BhpCaopR6UWjmoW1Bez1Zy8MLmFiEb1e5C3LRV6
	xx0+IXow==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v15 7/9] drm/rockchip: cdn-dp: Add multiple bridges to support PHY
 port selection
Date: Wed, 20 May 2026 13:12:49 +0200
Message-ID: <12511061.0AQdONaE2F@phil>
In-Reply-To: <20260304094152.92-8-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-8-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_041334_969807_518A4368 
X-CRM114-Status: GOOD (  23.77  )
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

Am Mittwoch, 4. M=C3=A4rz 2026, 10:41:50 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs. If both ports
> are plugged into DP, DP will select the first port for output.
>=20
> This patch adds support for multiple bridges, enabling users to flexibly
> select the output port. For each PHY port, a separate encoder and bridge
> are registered.
>=20
> The change is based on the DRM AUX HPD bridge, rather than the
> extcon approach. This requires the DT to correctly describe the
> connections between the first bridge in bridge chain and DP
> controller. For example, the bridge chain may be like this:
>=20
> PHY aux birdge -> fsa4480 analog audio switch bridge ->
> onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
>=20
> In this case, the connection relationships among the PHY aux bridge
> and the DP contorller need to be described in DT.
>=20
> In addition, the cdn_dp_parse_next_bridge_dt() will parses it and
> determines whether to register one or two bridges.
>=20
> Since there is only one DP controller, only one of the PHY ports can
> output at a time. The key is how to switch between different PHYs,
> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
>=20
> There are two cases:
>=20
> 1. Neither bridge is enabled. In this case, both bridges can
> independently read the EDID, and the PHY port may switch before
> reading the EDID.
>=20
> 2. One bridge is already enabled. In this case, other bridges are not
> allowed to read the EDID. So we will try to return the cached EDID.
>=20
> Since the scenario of two ports plug in at the same time is rare,
> I don't have a board which support two TypeC connector to test this.
> Therefore, I tested forced switching on a single PHY port, as well as
> output using a fake PHY port alongside a real PHY port.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



