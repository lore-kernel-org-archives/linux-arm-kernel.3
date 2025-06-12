Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DF9C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHyHeKSFmeGChzEgnyhjfuWXXlgy/EN/udP8iYeBM9Y=; b=0Q0NsKViqVphqlt6RSAvPZHcdM
	gCPumSdHYVOqrUHuYg97T9yHgTzgzWeBo5KaBVRnNRFdu7qSs/Fj75t9cN30RoAfjVimyih0dPBGz
	K5AE7NoI7dD2SMsbhWqWy0dZNPaYjpFfIYRAj50KTOLM7PctZ6F6CbqoVvhOPtaArsvjYD6YUXbor
	Ie+RekX0ta0ChnFNUZ2cLDzIFcK9+OXd132K3tu5lYT6DDmZ4Msy/pxJXXPqoklZFmxRRFojpqeUB
	whu9sf/WrEkKawsLMNIFNvaKeMkwTuGJR9XbcpZAc+ibaMJP6jZQYm+PT6fMK/Lhy37/mS3rM12do
	jjvgn4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhr4-0000000DPEF-2sVa;
	Thu, 12 Jun 2025 13:20:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgoI-0000000DDfb-2vva;
	Thu, 12 Jun 2025 12:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749730388; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JmJQM+jRvKt3sfgWkyOX4HaeWFVmPbVAO8KKw41WsufLNG+hkfi3klar7FzBKqa0rb+LNIFbWFaE/9rwZE+W7v1Grghsny1FiPBo8dhL0YYtuBgOKYn7PojELsZdUPV8SeUsJhRonIaMm6EpPFZjyhQI9cEn3U0UtqxZhgtXQTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749730388; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xHyHeKSFmeGChzEgnyhjfuWXXlgy/EN/udP8iYeBM9Y=; 
	b=Ib9ekT7AwMRUYhGvgD9uKKP6GelvUKk6hJUYqrrJ6CRYajukgppFIPL0voa2jIlyrM90yRs02e71g334VJGyTiT4sOp+9d15BoOjXB4WPx6gOIKEO9sIp8l/KeAt2GUT/6cyZP0MsYHZ28SMss613cMocZObIwa/2LKTP+cGTrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749730388;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=xHyHeKSFmeGChzEgnyhjfuWXXlgy/EN/udP8iYeBM9Y=;
	b=d+RkCAVL7ZCghwxV5Eux+3bXYGhO6sl4hXL7ifOJnCTCeQn2zHcqD5oCqiGsg2z4
	wY20o06EDmfS5LlTr/thtEU5z02fLNUC06JV0yXduO/kai1CtJB7ziqGHNeofc9ov2u
	xQGtnTc+H1+LtJ9QDY6+Br9AGt45A8vIQDGO5a8A=
Received: by mx.zohomail.com with SMTPS id 1749730386061466.0088473265579;
	Thu, 12 Jun 2025 05:13:06 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Fix HDMI output on RK3576
Date: Thu, 12 Jun 2025 14:13:00 +0200
Message-ID: <3011644.e9J7NaK4W3@workhorse>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_051334_800621_CA8DD630 
X-CRM114-Status: GOOD (  18.75  )
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

On Wednesday, 11 June 2025 23:47:46 Central European Summer Time Cristian Ciocaltea wrote:
> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
> char rate via phy_configure_opts_hdmi"), the workaround of passing the
> PHY rate from DW HDMI QP bridge driver via phy_set_bus_width() became
> partially broken, unless the rate adjustment is done as with RK3588,
> i.e. by CCF from VOP2.
> 
> Attempting to fix this up at PHY level would not only introduce
> additional hacks, but it would also fail to adequately resolve the
> display issues that are a consequence of the system CRU limitations.
> 
> Therefore, let's proceed with the solution already implemented for
> RK3588, that is to make use of the HDMI PHY PLL as a more accurate DCLK
> source in VOP2.
> 
> It's worth noting a follow-up patch is going to drop the hack from the
> bridge driver altogether, while switching to HDMI PHY configuration API
> for setting up the TMDS character rate.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (3):
>       dt-bindings: display: vop2: Add optional PLL clock property for rk3576
>       arm64: dts: rockchip: Enable HDMI PHY clk provider on rk3576
>       arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2 on rk3576
> 
>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 56 +++++++++++++++++-----
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  7 ++-
>  2 files changed, 49 insertions(+), 14 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250611-rk3576-hdmitx-fix-e030fbdb0d17
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 

For the whole series:

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

This fixes HDMI output for 4K resolutions on my RK3576 ArmSoM Sige5.
The DTB checks and bindings checks pass as well.

Kind regards,
Nicolas Frattaroli



