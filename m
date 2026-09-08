Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA60FC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YSbpx2/giMWiDN23LuZeurQee/vaO9NMucSm/vs5YM=; b=xFH8yYy4dVikKrIrrPycJyG2pC
	oXJ4Izmw3Ibdy5Ecpr7ZXyH9o/U/WaQnIQ9PTdSuFy8fICCmSHJlKtk0RpRINqq2HcT7LOxe+ulMW
	cKE/i2Q9907LjNDyGa96vcjXrnjkJs3hOX9ibL9S22XabXhT16pVzen4JfqUPLaNdnYTrTP429RO8
	8aiHcZd9kyl5LHNyKkUUt+yroZoA+uyMG+5pjvvHfwijUg8tEoYejxRyPARYZyajWXhtflwoWpt15
	khEmlqHZi/ccIVn3z+qzvhv0jCuigVin4TgYbjcIkKPxBzalkU861b7XwwXIkm94VudymLxIZGDsu
	VGIz30pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uTU-00000008xYO-13an;
	Tue, 08 Sep 2026 11:58:52 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uTR-00000008xXx-0fXn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:58:50 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-66fc7196ca0so2812611d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 04:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788868728; x=1789473528; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YSbpx2/giMWiDN23LuZeurQee/vaO9NMucSm/vs5YM=;
        b=DuD8nMrCZqPf4cRthZxN/s7lwCYjCaBCmOSLRjHTESe9BFVlbUKaCdd5iV7YcDl047
         3P9WY4Vx+VPcwMAUgKNsz5pjgWWiUx6ku4QUctdvX7k5fjFVvz6GfziN4dpAR429RwYf
         DIgxUI85pPhhyr9+w9c6moJJp8IDxalMcx1uyq6bOmnqu3a6IPiA9LiVBLQnDa/SoMWy
         pUsBJg3SA0MBWxy3CF2uDDmdsgAUym6rqtKJbfAxYKtTuKwHZqbsVsSIXv4IFQsfhsRk
         5/AcW2rgox5Ai454sFFXEiFhZWPiK8qMxLbLvHE0OAz3odXQ0Xpm/hblJtZyRx9JiBsu
         ebxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868728; x=1789473528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YSbpx2/giMWiDN23LuZeurQee/vaO9NMucSm/vs5YM=;
        b=ZDpkp+oa1BMM3nQz8i0f1uP67IlYLxsEQzBHFme1UblF88LM/K4P0mQZ2bDUunTNtq
         ANfPBa0+oF3OsTExx64slNLb47CoVJMuoFsi6Gwh5FxlP0yrMVW60ee8Lo+jZPjXUq5v
         jNZJ0jJNoTUAo2Cd3ltbD0S9ld9RJbVmjLp16meZsYfHX4jDZEkU92KEFmB+40gnRehW
         wdt2w8+Sd8GEDSW+i98JUy4NCMx7TaExESltqJukpzgqMRk81F2T453ZwNwpOdt+IaEq
         qbjac3ZBsyCfnNpT4GYqulLxBwzn4sLkCjEtKYloV/zc3dXvLlHuma2JaxZFtlthnGCW
         GRQg==
X-Forwarded-Encrypted: i=1; AKwUvBwxzCNkLJ94cvrHPz8LPZ6Mxf+B9xjqFExGJQB9QDra2usBgChvF0S5zkY9QQoB08JudOPtBnmeKRYm9nsO5CaQ@lists.infradead.org
X-Gm-Message-State: AFuF++nE+ohgpCheI/aFroJuqDWxDiMQwKzoaUbRYzjZGUDAaL3J4aqV
	scpPvz63yxois0QZI8rhjCBn1CARYr0GGvkdXPDIN/GfNqYt/I57tVgK
X-Gm-Gg: AYBFou3hYzHckFMSEa7duDpjNH/5VSkhOvuGIezXiFKarLMYmboRBXgeP7AxolMTrEi
	5VTn8OTVGegZLFGZptE+7fEHkMjiZQ3Qa8py7VqcAv35ORqVYIqCekkJs+QVsdheo6zm+AApFed
	RzNwbpgP0/7qJvpLuaARI+koAjOTr20Gd2K6t3JUT4HuNNb8Bsd3fo4HPoJQe/3sgkruiio8LKh
	g52yICKMc/qLlylVshNxNhqEdeTKJLgnFC5nbQ15QzF0IY+eggUExBjXz/zGWNgoRUzz/cg8fxS
	LYdaZecRfDGuzVJ/3005n139Pz37RdWxDaZuGLfqGiXFVYRMCbLdfv4U//qapV4WL/Cnquc/MkA
	S0YSTXGDqTEHwMEXot767Ww80CkogG6Tl5sAJ3jlTZoAuM81hsY8vL0OLmMphQONtr0u2MY4pYK
	ZxczsnioXuuxTAB7cGDSm9dyipHsPaH+03yDSUu1gunyYRw9rUPDWBzN6OenBH8hSlTAUG18n51
	w3TkQ==
X-Received: by 2002:a05:690e:13cd:b0:66f:c284:47ff with SMTP id 956f58d0204a3-66fc2845290mr5848557d50.62.1788868727460;
        Tue, 08 Sep 2026 04:58:47 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb495eccesm9958264d50.18.2026.09.08.04.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:58:47 -0700 (PDT)
Date: Tue, 8 Sep 2026 08:58:40 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <ugxocb3gmyhjefptdvsqtv2ebsngcr2ol4rfuwv4exukqd6lxs@yuema6b7ikgv>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
 <kumbe27i7a632rthuruthpt6z65aszivylj2u7cdkeqecx3zgd@vi27clpphsq3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kumbe27i7a632rthuruthpt6z65aszivylj2u7cdkeqecx3zgd@vi27clpphsq3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_045849_206123_673B2FB2 
X-CRM114-Status: GOOD (  29.08  )
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

On Tue, Sep 08, 2026 at 08:17:57AM -0300, Leonardo Costa wrote:
> Hi Udit,
> 
> On Sun, Sep 06, 2026 at 10:49:52AM +0530, Kumar, Udit wrote:
> > Hi Leonardo
> > 
> > On 8/3/2026 11:04 PM, Leonardo Costa wrote:
> > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > 
> > > Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> > > Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> > > Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> > > DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> > > LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> > > touch controller.
> > > 
> > > Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > ---
> > >  arch/arm64/boot/dts/ti/Makefile               |   5 +
> > >  ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
> > >  2 files changed, 158 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > > index f4d109ef6798a..8a59fc597aede 100644
> > > --- a/arch/arm64/boot/dts/ti/Makefile
> > > +++ b/arch/arm64/boot/dts/ti/Makefile
> > > @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
> > > [..]
> > > +
> > > +	panel-lvds-bridge {
> > > +		compatible = "optologic,scx1001511ggc49", "panel-lvds";
> > 
> > > +		backlight = <&backlight_pwm3>;
> > > +		data-mapping = "vesa-24";
> > > +		height-mm = <136>;
> > > +		width-mm = <217>;
> > > +
> > > +		panel-timing {
> > > +			clock-frequency = <70000000>;
> > 
> > Looking at
> > https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#mc4ed25e5253da6dc635fd3eddc317dac8f447f3e
> > 
> > 
> > you are using three different clock-freq 69500000, 64500000 and
> > 70000000 here.
> > Could add some comment here, why freq is adjusted.
> 
> It's for the same reason as the 69500000 clock frequency in the Verdin
> AM62 patch. In general the DSI to LVDS bridge requires longer horizontal
> porch and sync values than the typical values for the display, and we
> intend to use the values on this patch in the general case when the
> bridge is used. The reason why the frequency here (70000000) is
> different from the Verdin AM62 one (69500000) is because we found that
> that 70000000, along with the other timing values, work more
> consistently with the bridge across our modules, the ones on the Verdin
> AM62 ended up being a first iteration.
> 
> I'll add a comment explaining the difference from the native LVDS values
> in the v2 patch.

Correcting my last reply:

The 69500000 frequency and other timings were used on Verdin AM62 were
due to the DPI->DSI bridge used on the module, not only due to the DSI
to LVDS bridge that can be attached to the carrier boards. Ever since
that, we found that the DSI to LVDS bridge itself generally also needs
higher values to work consistently across our modules, compared to the
ones typical for the display.

