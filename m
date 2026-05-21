Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BFCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPIPD1BGr2Dw7vziqVwt5eCDNK/gCvwcla72fV+D2yg=; b=Oq/akc6ejbvRs3GHQ05Xg+A35E
	Xx50w7VVJYVJ/Nl+Sv+gbhmf/TrgZF2ja+jwhzeJozr4KcNuVmhlRejvbqGP4kN5lByKav1w+dQ+w
	vqc++/37OCBSXGdqXud+WEVD6VbOOrw8Oy2GBhwO0iCQ3VmBkSC/VLcgNXQ2ygFRJ2SPohWqXrUjW
	taqePIQBGVCr0fGfhXw+m3yTQEJjzQ4pxFdoFg/dwU26OOsRd8Rpy8kB+vDBSxrfYiiJ89zYrtjRV
	FKYrYVvl5HpEenA1Lda1sERSWWvbEpUZgvgM3pzZuvjNnISqf54t73xj+S0MHU3cbV/UE2ICtmd3s
	15x4eSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzQY-00000007GHQ-2zTp;
	Thu, 21 May 2026 09:10:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzQW-00000007GGO-0nNO;
	Thu, 21 May 2026 09:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WPIPD1BGr2Dw7vziqVwt5eCDNK/gCvwcla72fV+D2yg=; b=n4AGgQv/3ZavNsA63rM333XACz
	fHeXMoXEM4eBFG1LP0Ys0BRitcArnY8IAgN2epsQB4cNX3/yCN97sX9MlCGTZOGqFcNSdibj3YZ5h
	6WViB5qjiers9mTvUqHimV+B86SbXZ9kOakAAg7ENnauDqFcmiGGW5Toh+XVJWJAwD+KkNkpP8nlQ
	E5CAWpVRuTPHJQp61w1J6AdHuXauVYWK4xtlPnnOjyFSzBcX0AubmQ/BWMJdiWO7+JF5GfWOKKS3l
	QZwplLMC9HPhmAE68RKTYe48TwJfceAqc+JkS708NXveJ1jSQOt5P+R/TF1h1xFATp5iG2iNpwHEE
	U4vNICHA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v4 1/2] phy: rockchip: inno-hdmi: Add configure() and validate()
 ops
Date: Thu, 21 May 2026 11:10:45 +0200
Message-ID: <4136874.Dhsi8hcfAM@phil>
In-Reply-To: <20260518180722.2480799-2-jonas@kwiboo.se>
References: <20260518180722.2480799-1-jonas@kwiboo.se>
 <20260518180722.2480799-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_021048_230328_951A2C2A 
X-CRM114-Status: GOOD (  10.04  )
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

Am Montag, 18. Mai 2026, 20:07:20 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jonas Karlman:
> The commit 10ed34d6eaaf ("phy: Add HDMI configuration options")
> introduced a way for HDMI PHYs to be configured through the generic
> phy_configure() function.
>=20
> This driver derives the TMDS character rate from the pixel clock and the
> PHY bus width setting. However, no in-tree consumer of this PHY has ever
> called phy_set_bus_width() to change the TMDS character rate as only
> 8-bit RGB output is supported by the HDMI display driver.
>=20
> Add configure() and validate() ops to allow consumers to configure the
> TMDS character rate using phy_configure(). Fallback to the deprecated
> way of using the PHY bus width to configure the TMDS character rate.
>=20
> A typical call chain during DRM modeset on a RK3328 device:
>=20
>   dw_hdmi_rockchip_encoder_atomic_check():
>   - inno_hdmi_phy_validate(): pixclock 148500000 tmdsclock 594000000
>=20
>   dw_hdmi_rockchip_encoder_atomic_mode_set():
>   - inno_hdmi_phy_configure(): pixclock 148500000
>     - inno_hdmi_phy_validate(): pixclock 148500000 tmdsclock 594000000
>=20
>   vop_crtc_atomic_enable():
>   - inno_hdmi_phy_rk3328_clk_set_rate(): rate 594000000 tmdsclk 594000000
>     inno_hdmi_phy_rk3328_clk_set_rate(): pixclock 594000000 tmdsclock 594=
000000
>   - inno_hdmi_phy_rk3328_clk_recalc_rate(): pixclock 594000000 vco 594000=
000
>=20
>   dw_hdmi_rockchip_encoder_enable():
>   - inno_hdmi_phy_power_on(): Inno HDMI PHY Power On
>     - inno_hdmi_phy_rk3328_clk_set_rate(): rate 594000000 tmdsclk 5940000=
00
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de> #rk3328




