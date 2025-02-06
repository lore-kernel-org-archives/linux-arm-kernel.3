Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B8EC02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVIqXYzlOehlZiy0ALlRjz1XQBncBUDd5NT43WUTgZ8=; b=OXK9oM6+6duD1OHdSl5FZ7f721
	yiu9agO1cjhmh2HVXQhc0lYcbROiJPyApie5WVip1MiM2eKQny/uxxKPMxe+wxn/CqC7SgeqKH0uB
	/LcTBmCx4z8zGctwpGEb7RUb1iHpMxCzzlCVa5DeVdT3nKVLy/TuhHPL2whzH2quVOXiCO0HGsqeF
	b5AahWj+Kc/MGKpEMXumpcY+RqZK7vJQCUN+h3x6Eg11e86C6+8V4D3o2JPkwWzKlXWqCBZDn3DhV
	O2hy5I08AhNev2dzj43RPK6rOaW82cpQeFXyVykK2TSZ+4hPFNebipm4TZvFuROc20k6QkGaCCTCN
	df2gJOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Xw-00000006yXF-1QNK;
	Thu, 06 Feb 2025 17:20:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5WY-00000006yNF-3Onh;
	Thu, 06 Feb 2025 17:18:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738862280; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PPCYLM87aFcVCAfMPQQ0yXcTyrsvnyTkKS+eEJWcy9cBCCuvU9Z/z8+pzbkYFtSX/1MtKPTSysfLFbXWsfEn4byj3fWbAOF50Y5tLH18AvdCZkKxLHaumA6PPi+w7cpbrzAW/zHZKRqAzxiN4l2puMicJGcIhAlDALNZ/b9YfU8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738862280; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HVIqXYzlOehlZiy0ALlRjz1XQBncBUDd5NT43WUTgZ8=; 
	b=lPCdyF7Zdv6I6M84wss5fyglm2/LO3RG4Et3v4lfGLGQtmGbCACYz2VhVdDLcJWcdkQycgDbkuk4ZGGxHhKk3iAeh8IIV+awP5nEJB6tY9fg6a7T5kzzIZdXZPuU8y+dOu74c75bQ/v04kDe4qTY+pxoFi38JCRIwNMDaaZrC74=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738862280;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=HVIqXYzlOehlZiy0ALlRjz1XQBncBUDd5NT43WUTgZ8=;
	b=Xnnm+nO0wx4RBQFTK/tSarsm6Bq5OMFkZ+7cIhAlPgfpa8rlnBCfdv+urPIUC2vV
	cVB821xhg1vXmN291QFqArQSM1Jav3BdpYYLbFovhHAs0as6IBcrW3FP/nqYb12ynyh
	Wy1JW0YmE72r82iNQ0hiaJt67LjAQrKfsPFHG18w=
Received: by mx.zohomail.com with SMTPS id 173886227382959.44952550211565;
	Thu, 6 Feb 2025 09:17:53 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: Add HDMI0 audio output for rk3588
 SoC
Date: Thu, 06 Feb 2025 12:17:51 -0500
Message-ID: <2781606.mvXUDI8C0e@earth>
In-Reply-To: <bfe9cb98-12ba-484c-95af-e5842edaab76@cherry.de>
References: <20250203171925.126309-1-detlev.casanova@collabora.com>
 <20250203171925.126309-3-detlev.casanova@collabora.com>
 <bfe9cb98-12ba-484c-95af-e5842edaab76@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_091846_903757_22CA49EC 
X-CRM114-Status: GOOD (  23.38  )
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

On Tuesday, 4 February 2025 05:14:37 EST Quentin Schulz wrote:
> Hi Detlev,
> 
> On 2/3/25 6:16 PM, Detlev Casanova wrote:
> > Use the simple-audio-card driver with the hdmi0 QP node as CODEC and
> > the i2s5 device as CPU.
> > 
> > The simple-audio-card,mclk-fs value is set to 128 as it is done in
> > the downstream driver.
> > 
> > The #sound-dai-cells value is set to 0 in the hdmi0 node so that it can be
> > used as an audio codec node.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi index
> > 8cfa30837ce72..767bdfc06b7ec 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -1369,6 +1369,22 @@ i2s9_8ch: i2s@fddfc000 {
> > 
> >   		status = "disabled";
> >   	
> >   	};
> > 
> > +	hdmi0_sound: hdmi0-sound {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,mclk-fs = <128>;
> > +		simple-audio-card,name = "hdmi0";
> > +		status = "disabled";
> > +
> > +		simple-audio-card,codec {
> > +			sound-dai = <&hdmi0>;
> > +		};
> > +
> > +		simple-audio-card,cpu {
> > +			sound-dai = <&i2s5_8ch>;
> > +		};
> > +	};
> > +
> 
> This is an address/bus-less device, so I believe it needs to be put
> among other address/bus-less devices, which for Rockchip SoCs is at the
> top of the DT? c.f.
> https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.
> html
> 
> **I** would put it between the firmware and the pmu-a55 nodes.

I wasn't sure about this. It makes sense to move it with address-less devices, 
but the rk3399 device tree has it above the hdmi node, so I wanted to stay 
consistent with that.

> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger Haikou
> 
> Thanks!
> Quentin





