Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EDFC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCM44TQaX5AtvJ6swXT0C0Y1eVxY0peXONRRcHF27UU=; b=y6PQ7gZPCo2iLPRh3ze1CDCNvz
	IO6+JDuBhFpSPQCLSSvciDIE4O9SmpR981PFky/eWTAmwsD0lcYSIq3VilnFt+3JCJ39iIIs5zeGv
	3zEO+1roQk/hkItGoL/TvO01Ugtc4BRiH67n7DeXYoRYgUYWoAxu74Fw/NMX4sSAHcTm4VSoPUlXQ
	aEZ8XChTZ0Y3QNEhl5agJpcYleBPE7Dg/+YVZH7z7StX8AwP262mgdzDlebmIY/72jySqHclwUeY9
	M5vauorflJ7q69OPcPNri4TnWoO8GJC+P8pNvlyE3sQaixLKA9QqkU2P3f8qnokpBF/LW4ZELyfRn
	0Xp3z2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Of-0000000AQpY-3bPh;
	Mon, 31 Aug 2026 20:14:25 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Oc-0000000AQpA-3OFF;
	Mon, 31 Aug 2026 20:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788207249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UxFmVSGWfWwX4095cU3RapSW6xFYKOcZ6Ff11y2iOlU91FXsHEbs6Dh27Ayn6qN72tl410dqcFMoNM7mc9RGSQoC1NV3+fSqkNBlaJu6mhN2bcTkssClXZUoZYBDDrXB/yg3oD4Xh2H/3JYliv2ppNaXPa+j9/MJLRqP7EFP0Sk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788207249; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eCM44TQaX5AtvJ6swXT0C0Y1eVxY0peXONRRcHF27UU=; 
	b=m9BgYf5oyXmQyWebryNAkwditKF1O4d8ttKWZMt+MniQYr4VwUPYSmVwzK6FozEuFr5wi5snSTzUMaqBiWn4JQ5+BIpLHoxe77PlyUIoXsPPHzW4uq5kTORCH7VFNBuVqOTHsvZII3gbS9ovrwPtEBu74hHRnYs7zQIKJxxbNt8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788207249;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=eCM44TQaX5AtvJ6swXT0C0Y1eVxY0peXONRRcHF27UU=;
	b=K8RurycD9hAysIDsFWTHo/4Pl2qLEzi9gOnw+XAZjyZ3QA5KumbOijHo7EV0zAr0
	r8wzfs26gWB+8vtq3txIkZAEItegtYHT977q3GBvNtIWR041bxejh9X6jIGUjjydG+G
	IlIDOhl6wKCiEAwlvznM0y7F8OGe/kK9sYQ/Kst0=
Received: by mx.zohomail.com with SMTPS id 1788207246171550.1263319158736;
	Mon, 31 Aug 2026 13:14:06 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: rockchip: Rename rk356x HDMI audio card
Date: Mon, 31 Aug 2026 16:07:37 -0400
Message-ID: <1l5cQ5HdTvCBGiUCVh40og@collabora.com>
In-Reply-To: <DL3B1XH7K4WC.1ZXA6ANI8Q1A0@cknow-tech.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
 <20260831-fix-rockchip-hdmi-audio-names-v1-5-5b155ae05293@collabora.com>
 <DL3B1XH7K4WC.1ZXA6ANI8Q1A0@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_131422_937608_2EFBF537 
X-CRM114-Status: GOOD (  18.43  )
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

On Monday, 31 August 2026 13:29:00 EDT Diederik de Haas wrote:
> On Mon Aug 31, 2026 at 4:20 PM CEST, Detlev Casanova wrote:
> > Rename the card from "HDMI" to "RK356x HDMI" so it identifies the SoC
> > in user-visible ALSA fields and no longer collides with the identical
> > "HDMI" string used by other Rockchip SoCs.
> > 
> > Fixes: 697ee8546e241 ("arm64: dts: rockchip: Add HDMI audio nodes to
> > rk356x") Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi index
> > a5832895bd39..98785c812fc4 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > @@ -150,7 +150,7 @@ scmi_clk: protocol@14 {
> > 
> >  	hdmi_sound: hdmi-sound {
> >  	
> >  		compatible = "simple-audio-card";
> > 
> > -		simple-audio-card,name = "HDMI";
> > +		simple-audio-card,name = "RK356x HDMI";
> 
> Move the name property to rk3566.dtsi and rk3568.dtsi and use their actual
> SoC name, thus RK3566 and RK3568?

I hesitated on this one but I agree with you, it's better to have more 
granularity. Will update in v2.

Detlev.

> Cheers,
>   Diederik
> 
> >  		simple-audio-card,format = "i2s";
> >  		simple-audio-card,mclk-fs = <256>;
> >  		status = "disabled";





