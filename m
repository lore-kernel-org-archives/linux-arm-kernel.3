Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58851C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxrVvNWFsLdjUGWz01VmAu7gb3IK9lnKuIig2vYIG3M=; b=FHryPZ2+Oa1AcFv66nBZcvemaI
	TxUlBTUr+uVc152PaLDwiujZ9jIFSTe6/gXFqjZrItJITLjavnk8GIeaHgzMvkthcWKN9sjbeoQvw
	rwgRQxR32y1i9MZo9qEOGYAFkQq8JHWA4NhVetNLtB6S1gSIqK3YZ34cHrKfIUx3o0f19IfHZVcvN
	OZxTiHHWHHN1qz3qMSYNiWSR6FD3Mv2vZH0WcDxWZNRPnwKr5bGnzpxeamsXEoJeje2VrEErQ/OE4
	OBybszogrx9GcEm1OPy1It/FrFK0U05CthUfkUlXTBPivTpdXZzskFOxE7JaJaH2ajTO2LmD3hTAu
	UzWLa1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdui7-0000000B6lt-2Q9A;
	Fri, 31 Jan 2025 17:21:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdufz-0000000B6R4-03tI;
	Fri, 31 Jan 2025 17:19:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738343913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f/iY1x4utYyIJED6fcvaaas089qhpFaxupg+RoEoMQeB+BTvtDqhYcOFQGdubiFfRuu84pFe08958yXNfTH9uHNIac2N8eBs1B+5fCbX7Hb1NXt+XHPPkAt/CXCw6PwVwzZkx0EHHi2oYdKbecHIpmdrujZBSFG3/S1jdlIawrc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738343913; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KxrVvNWFsLdjUGWz01VmAu7gb3IK9lnKuIig2vYIG3M=; 
	b=aJZJy3fNsdSZ/j+Zi+T3eeHc0pOZqnKJPjdWRZKsWg6BnUXfeRrdr9h+BC0T+EZOBGLJ+CqYojzHJhepG9AZ9iy3YlFzTP+IhDZv/8PLxieD+p6HM3/4PLNlASm+7X16N0tpInXWdfHgxiAAl3pV4TXOfWNJyVzhEIHnjjRFHCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738343913;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=KxrVvNWFsLdjUGWz01VmAu7gb3IK9lnKuIig2vYIG3M=;
	b=eF7K20VpljQSTO45wK2hF3MA4A4e8+K7HQHEdei9dYVEu/VvFe36L9NjbJN5mSQ2
	bN0MzTRmOaLuDdvsAVNf0ZljnKCKNn0WRyQfdh1d1zPpSyl78ht8ukpizB64YLhKyTK
	bob/pDfCQQekFArnBL0P3dMu+HAX9UmZRxW+9h7A=
Received: by mx.zohomail.com with SMTPS id 1738343906427960.6186911597109;
	Fri, 31 Jan 2025 09:18:26 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add HDMI0 audio output on rock-5b
Date: Fri, 31 Jan 2025 12:18:23 -0500
Message-ID: <3668702.iIbC2pHGDl@trenzalore>
In-Reply-To: <8ad30e14-e785-4e3a-ba92-644e7fb07759@cherry.de>
References: <20250130165126.2292107-1-detlev.casanova@collabora.com>
 <20250130165126.2292107-3-detlev.casanova@collabora.com>
 <8ad30e14-e785-4e3a-ba92-644e7fb07759@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_091931_107360_099B1362 
X-CRM114-Status: GOOD (  33.42  )
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

Hi Quentin,

On Friday, 31 January 2025 11:38:34 EST Quentin Schulz wrote:
> Hi Detlev,
> 
> On 1/30/25 5:45 PM, Detlev Casanova wrote:
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
> >   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  1 +
> >   .../boot/dts/rockchip/rk3588-rock-5b.dts      | 19 +++++++++++++++++++
> >   2 files changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi index
> > 8cfa30837ce72..790c1c25a3e41 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -1394,6 +1394,7 @@ hdmi0: hdmi@fde80000 {
> > 
> >   		reset-names = "ref", "hdp";
> >   		rockchip,grf = <&sys_grf>;
> >   		rockchip,vo-grf = <&vo1_grf>;
> > 
> > +		#sound-dai-cells = <0>;
> > 
> >   		status = "disabled";
> >   		
> >   		ports {
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts index
> > d597112f1d5b8..1909078538367 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > @@ -49,6 +49,21 @@ hdmi0_con_in: endpoint {
> > 
> >   		};
> >   	
> >   	};
> > 
> > +	hdmi0-sound {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,mclk-fs = <128>;
> > +		simple-audio-card,name = "hdmi0";
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
> This is SoC specific and not board specific I believe. I2S5 is not
> usable anywhere else but with HDMI0 controller if I've read the TRM
> properly.
> 
> Therefore, I would suggest to move this to rk3588-base.dtsi (with
> status=disabled; and when hdmi1-sound comes up, to rk3588-extra.dtsi),
> the same way we've done for RK3399 for example.

Indeed, I only could test on a Rock 5B, but I think it can be moved to the SoC 
DTS.

> The only hesitation I have is that HDMI0 can use either I2S or SPDIF for
> audio, both audio controllers internal exclusive to HDMI0/1 controller.
> But the user could anyway define their own simple audio card for spdif
> or modify this one if they wanted to.

So some boards will use I2S and some SPDIF ? Or any board can be used with one 
or the other ?
The disabled status makes sense as hdmi is disabled in the SoC tree as well. 
So if a user wants to use SPDIF instead, they could keep hdmi0-sound disabled 
and add their own simple-audio-card compatible node.

> I've tested with my suggested change and same changes than for Rock 5B
> DTS on RK3588 Tiger Haikou with speaker-test -c 2 -t wav, left is left,
> right is right :)
> 
> I'm not giving my Tb here as the commit title is specifically about Rock
> 5B and I haven't tested this series on it. If you had a separate patch
> for the hdmi sound node and enabling it on Rock 5b, I would have given
> my Tb on the former and not the latter.

Thank you for testing anyway ! I will move the node and enable it in all board 
dts that already enable hdmi0.


Detlev.




