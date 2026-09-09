Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51724C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrcCiK7RtNBCwAredkKzf4aDW0PIdvjt37y7QGKpm58=; b=bTv/XttkfhYVxz1YYbihua5tig
	blv3YbaMacjGhTg3xcVhm867/zXMGRkMrgQ+zGfiSYl1PaOH86x8lk5iXHLKfXWw+2IH5sGS2XTFJ
	wNT3o1g7t5bOZOAQtcrceYxN06Xau9qp+5lN5w5aOK8QbzthYaH/2K1DIFs0sGLDCkirY3P4tCoj5
	78XLVHBv0P5yjKW1R6wSjRU8Ok9JcQItC2EvxuR7me/ipHt++cbREdelue08hbSXGqnA5/n103BTr
	o9/gxmhKRXm2vGSqlo4/HPs/ci1qWp6JAHmBPK3mUWcs2lkgt8xfNBEOyQfgfwlO0D2XOxErSCDfh
	267CtKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IA1-0000000BleG-3ktd;
	Wed, 09 Sep 2026 13:16:21 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4I9y-0000000Bldb-2fcs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:16:20 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f7so1561245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959777; x=1789564577; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrcCiK7RtNBCwAredkKzf4aDW0PIdvjt37y7QGKpm58=;
        b=QsYeD1CHZBYVvfKfYq3wzBFf+eXVPnpYs/ZVkmAZoWnVEKH1b8ZXdtGTvBGzpBbR8g
         9MWoUXomx/kR0uBfyrboPfRpQrqbxd2PO7aMEKqPpxQn/17FDTMQpw/8WSmGPUHmUHGu
         GL1YO1KUGbd34van7lkLNpD3gGlXAFcPniLmxasJMFkmmQtgFPtVUgtn5uvEO0yYYJvN
         yqpi3ldnbz+a04vxa/CRRbpPuj6yfyBdChGnau6kJHZ2B71zP6Kpii6yzmXdxQwK1vgM
         CShH61zsrGG0CSkbdWvgLx1Vy2pmcVEEeBDG39ZdnlYgJ5bMfQRClOWbRz+uJVW7S/Xa
         W8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959777; x=1789564577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrcCiK7RtNBCwAredkKzf4aDW0PIdvjt37y7QGKpm58=;
        b=pUAfUzPtZfGlQ24WGdsn8/94s/OuQUuSRSpz5oBt89kf3VxQRAxByTBqQY1zzFdpZ8
         js78ZTbqW+pN7EiDjNVVYTMostOjObgooUTF2vjX8VCVhF2aFbm3PkLbKNU60z+REQgq
         TcMyEYNLviNzAfZQzj9RCXMSVwT+JOoD0vg7R0PGYaJlSwgaazMgHIKoNQoJNo0OIsSo
         pD633zwyHCJjcb2bkFvBuAoco8LcsXs2XBhGtUFcqJ7c8fU20v8g+mONt8hziUfZfGfv
         tQMU7AKHQ9NUTyvC6u9OQIYFkhW3K7f4FCvdz7hYyacJ6bJ6wIF4h0YUKw/Eg3i5sNs5
         J1rg==
X-Forwarded-Encrypted: i=1; AKwUvBwss7RvX0kvrmcGG3VMoiuGmKlu+sNrOMPCB75sKY+xtXrrimztGIEzku1o/pCOu2cGCXoPlkzaWdiJn3fuO7wn@lists.infradead.org
X-Gm-Message-State: AFuF++kNJiVy96tGHXUcAr3xJjvQj85+33drNomTYsf94VvzGFXC+pE5
	A/f6tczn1ewelC2fdl6SagvMU12RF6Z/T0AVoHyUaEA98q2ta75VegWH
X-Gm-Gg: AYBFou12z7QggnmWtWpPYS+6o5sMTzGHKTqTZ+9gsqpwrImrXrH7s5SWZ+adm19CWCw
	b89aiCUKWuLZgzSiDb1dC2lzMCwczoGdv9P93MtASGKERxmstBwYYzMPKv6D7Ona0HE0nEC5rp5
	CFN2nHmRGkAwP4Qcvbpd3+wUzMM1KIqz4xenPJPrlqH07XvkbXbXJ/M+UXtn6V3Z6GfFhlQrRY4
	FpO3ywrdUP8C1KkSlhrZ+s9d8IvkkmbeaqFjQO6/Js4lMmO15uB33SiOcVZfYhrBf3FLSJjpbI8
	ZwuamivXtnPM9P2gFPEhWWU707KascqOM2AsOKqQVhFK4EkVNW6e3I5ree4g0MnqW6Nqyl/0lFY
	rwzNdbYeFd3yOL/+rz0Cgy2aGFJZiP/XERmraApydNu6TWVLMbDcTVLATSvE5BKv6MoLdPz4ZKe
	AGMNsuGulm+dKumdzHgu3ed25b14YkfwsFxUGeXMSO5m5LHOEa8amIYfxDQP39cttI5fdK71Mgn
	kjNzQ==
X-Received: by 2002:a17:903:3c24:b0:2d9:33d4:a910 with SMTP id d9443c01a7336-2dd0780d87cmr17875895ad.4.1788959776857;
        Wed, 09 Sep 2026 06:16:16 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm74730735ad.3.2026.09.09.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:16:16 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:16:10 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <btthxxtvgma657mrvcu5ledxu3fedlf3satbeu6ppn6jb3o6cr@wfffny6ucxck>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_061618_854908_4F2F7C11 
X-CRM114-Status: GOOD (  21.69  )
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

Just to confirm it, considering my last reply, do I understand correctly
that you want a v2 of this patch that adds this comment? In the end, these
are just values that we found to work consistently with the bridge, and
we're not sure if this comment would add much value.

Kind regards,
Leonardo

