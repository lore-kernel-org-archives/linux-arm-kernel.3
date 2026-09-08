Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FBEC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GR+PLOaTo7otsU9ebeTCa7DS4PdH9ick+Ld4KYL7p5E=; b=HB/3tptBUbFcwvjqIKHjJiFEUs
	9l5ZYRiODElcKfqxawJdOy2jGKgbfW5AZMml+v+61V9zhEvH+M5Ez3iCff+WYvCxknAp2QRvt9OVX
	jbF0h5sOZNhxqDoeDRcO9jfwu1lbszLslkwhMnVdCuK++qcaRb3yiLPDX3ua0JtGtGBGaYeWs0UjK
	dOScI6zpR2AjcxdAst3RgJuohkRdvoJr2/t80aSPXX44G+K4np4q7v+BVV0MBT8o3HwpSO0l71aa5
	kJo4gyqyJeWMT3TCNyV1CQF5BudxIY4gztq7HjsJg4OwRE54dZxU6UBrp9b+0rIyNeG1IdptUQ/al
	RcsZoh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tqB-00000008roe-0KYs;
	Tue, 08 Sep 2026 11:18:15 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tq8-00000008rng-1bDo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:18:13 +0000
Received: by mail-vs2-x10.google.com with SMTP id 71dfb90a1353d-5c67e518329so192273e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788866289; x=1789471089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GR+PLOaTo7otsU9ebeTCa7DS4PdH9ick+Ld4KYL7p5E=;
        b=EkFKK2Z3nlm9U/0AMkkY8zfVnN4F+QnAItilqGl5hgaTKctycQuP8IJYUi4awuVBlu
         PcYDs9ks4iI9Ylg6+w2Yp+S4UfbaH9v75WOvPAjq1Hez2dg2V82tt7hHtXbHLPpYo4tI
         rCm0T2J5vWmM4fZSu1zp9NvT4+WumRjlB2NRa7J3wOUX07CCm6pmg5Q/lENmUmf6HbPN
         Y38TQA5h9VJAnI1nT2wvQFTQ0I5F85OdD1SKUjmYx8U/VWCosgqQDysis17oTwqUJnsA
         zk5uB1cNWEddZhLEu6wCXL5DD1W3oS/SBaE7UyfRgIYg7CgZUEb9S8/hJI59A7COJ2vg
         Z9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866289; x=1789471089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GR+PLOaTo7otsU9ebeTCa7DS4PdH9ick+Ld4KYL7p5E=;
        b=mHlgYVyEq7ghtKfXtr8N0d8JzaM3lioNnZhAjd8tkorZIpRo5pFGQt7C4hGWqoptj4
         RG/AHupHq5dC7mw3R0bcJlBzq7I7AHMB9rMzzryaRVqo/vnZxFrzsgIV0ngjAUUAFNUZ
         RczaEVyuuHCZBV2zGTeILdib8y0dQk9upqwFE1Nyz3Oui5HcKT9G9GDAyXWAuM79ZEC2
         KH+N1Pdwpr3eSxlIY+saBLgGRaYyLdmfbdhI14Jj9CumtULbCbFXRvWpEWdOao11VN1o
         qF/ogJV8+IbYsKrKQql2O5E9YRrUvUitUwGQ4ZvvqeeZG/Fn64CYZQatEX3rw/PBhWcB
         N5+w==
X-Forwarded-Encrypted: i=1; AKwUvBzMTw4LA8GL8f0G9W7kGrv+81Ol08YIY7VBs/3hJXYgellykI2/hc5Afn+4p+Ge13X5MJayY76pyIc7UIRL5nxR@lists.infradead.org
X-Gm-Message-State: AFuF++l7rYyXemtiFO2ojuUiol3F2YwKMLOhv9F9jA88D5M3EIJ99dFI
	SoIIPrCetuBHF+OKnuKP8EBhi711YmM2DUToM1uYv9u//lsbWJjcmxaI
X-Gm-Gg: AYBFou3gxWgpZThg/25JpZW7jPWX0/g/h//eA/KUgBnG5BA5Ro2hTqXCvvPpZM6OmdS
	VO3Y9KZt2X5Bf5CFxoD3lXtBtbK/0J5WZ8sl23BhqNnLkQudFdzf3U44xef2XFSv47XXi7REUrj
	uzi5gQ6km2CHNj/Pmi/G4GOh7aG5rxLHn3gtdO8Gj1qkD/rLJqW8ndi22M4QqdwOUbC0d9QYldv
	JnrLDwlD88WrNfHf2m5fBovo0O3xQQuv9tDTqxUaVbc8lPuFp+E9kgd7xE6oqZ3K5JreVN2wu2G
	BnVWvNrN8HDCsnV5Kd6DKOd29fCmojNR/YIp7LkgNffOfaH3CAxuHZrRm4+nLBrFeETJGOQV1+T
	gHfDjh2iFNLM6eWp5rd4TYn8XVl94XMtPfKxoLAO/fEAVbH1geDTcUTcGIS57ZBFf+3rM5c25N6
	WHu4n4xRDtFlTc0ZfhRIhlm2gB+VGWaeedHI95rQdAeqNYgZLhH+MHJAOjctonpMoVxIED5u8GF
	jEQCg==
X-Received: by 2002:a05:6102:c8d:b0:789:ec0f:3a03 with SMTP id ada2fe7eead31-78dd1a1cb33mr1540702137.4.1788866288632;
        Tue, 08 Sep 2026 04:18:08 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm8467503137.5.2026.09.08.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:18:08 -0700 (PDT)
Date: Tue, 8 Sep 2026 08:17:57 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <kumbe27i7a632rthuruthpt6z65aszivylj2u7cdkeqecx3zgd@vi27clpphsq3>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_041812_433196_CBAB5832 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Udit,

On Sun, Sep 06, 2026 at 10:49:52AM +0530, Kumar, Udit wrote:
> Hi Leonardo
> 
> On 8/3/2026 11:04 PM, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> > 
> > Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> > Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> > Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> > DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> > LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> > touch controller.
> > 
> > Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm64/boot/dts/ti/Makefile               |   5 +
> >  ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
> >  2 files changed, 158 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > index f4d109ef6798a..8a59fc597aede 100644
> > --- a/arch/arm64/boot/dts/ti/Makefile
> > +++ b/arch/arm64/boot/dts/ti/Makefile
> > @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
> > [..]
> > +
> > +	panel-lvds-bridge {
> > +		compatible = "optologic,scx1001511ggc49", "panel-lvds";
> 
> > +		backlight = <&backlight_pwm3>;
> > +		data-mapping = "vesa-24";
> > +		height-mm = <136>;
> > +		width-mm = <217>;
> > +
> > +		panel-timing {
> > +			clock-frequency = <70000000>;
> 
> Looking at
> https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#mc4ed25e5253da6dc635fd3eddc317dac8f447f3e
> 
> 
> you are using three different clock-freq 69500000, 64500000 and
> 70000000 here.
> Could add some comment here, why freq is adjusted.

It's for the same reason as the 69500000 clock frequency in the Verdin
AM62 patch. In general the DSI to LVDS bridge requires longer horizontal
porch and sync values than the typical values for the display, and we
intend to use the values on this patch in the general case when the
bridge is used. The reason why the frequency here (70000000) is
different from the Verdin AM62 one (69500000) is because we found that
that 70000000, along with the other timing values, work more
consistently with the bridge across our modules, the ones on the Verdin
AM62 ended up being a first iteration.

I'll add a comment explaining the difference from the native LVDS values
in the v2 patch.

Kind regards,
Leonardo

