Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06767C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CowhusBJtkVgTxM1sMewOhXaozR9ys1uAKwcRp0eiRc=; b=cSqJ0Sp5Rabfy+HAvWr6qc063q
	+hp44qlyzQW0fBmx2g9wVMYX318DlBoogYgcOr7e/7KYnMGhiI1F+9nZpRznNNZNtfYZNq5H+iec4
	pCTsnXREyWoP2pNXEJaGGluIv1j1Sqwgm5VMZDwpO1jwcw3rhCcDqE1LON892gxT9UQKNMNIjWyzc
	EoCXuA6v31g5pvDpZLZxuJeXQQESO+xXhiP5zLaIChmMUHFTL7qXcbwRYeeMV65mAdTeNSKnR5Z/f
	T8KzP3CoFVGDkzANDqPGS32ncg6E5UaJLXJHYo40OuWvZDf9J9QfXxRm1VF6pbqJrUky8FqPcCjQg
	vgSYTmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Pl-00000004lM9-2r6b;
	Sun, 06 Sep 2026 06:31:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Pj-00000004lLJ-0sv8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:31:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c2569aa5116so537466766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 23:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788676294; cv=none;
        d=google.com; s=arc-20260327;
        b=ILdptns1XidlTls8ImMvd6xKtd+CA+U0xpTpc11kmO9h7TvNnB+m4S5lCS0AoK2GGJ
         oTE3swDG8K94ra5m74KloLVrJ3f/f92mRsqSKWNcFAmPJgPMm5o9bqJ8o8rPoZ+G6H2T
         l6gmmejLdXyip5vn0Nzzz2P3YKDTGUstOez5yGGsP/4YgoGLX07Fv70IoSb/rK/GAT2+
         UMQTA70jDQoe9a8L8r+lhHRwkExNgr1AyR18aSwUgfwk2oN1OgoVPz7d5hXh5o9e+9CO
         b3+fRX4RZJlIxvnWzZdR9WPXFIX9svGA3R3nwtjtqfsdycL2mw4zOGu7Ev/pncCf8VrC
         jDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CowhusBJtkVgTxM1sMewOhXaozR9ys1uAKwcRp0eiRc=;
        fh=oDOSq9KYXZUjBetEmEsvVhxXqK8MvHQp59THQXJdPrs=;
        b=JmgDfQ6wPk+z17PE93JHUdA8o1wTtRPx7LECPIPo+GXFyv2Xc6BajTsVDUJjcVi14n
         hVIV5O4xHsU1YPEXLVsqdjPDWLasW31KfmzWUDDR5hbyno+yOY2mDGUx6/W+Tc1AmxBg
         YBI86t+T1ieu8am8I3viUXilvCdJ37BYMQPIQUGo4+uBojXod4AaJ7m3zdnkLGODQsAM
         JV02DNRKHgOxYUeWZF+cRKZ918TVkfJIz854WrljKkI2QoVhPedM6HngWgFy77fdOJux
         dld1Ar/HBHBSnCr3RwaWedA3UOXlXFomTGtA3IH1EaH+r1pfq5monnjvlH0NtABqJyXo
         br2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788676294; x=1789281094; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CowhusBJtkVgTxM1sMewOhXaozR9ys1uAKwcRp0eiRc=;
        b=wgBF0PuEyVq6rPFWoCse8w9Lp4rDPDLGkS7WsI2XcJN+5ydg3Ax0IZZ6Kwug2nJGQA
         06qN5wVgrJTAFeZvQivYKCLrNHxsy5vzk7LquYbdpTYHy17n5Y6R4/Kz9j34frCUNlJn
         uUNtXNbV7nOIdMGMqwxkmQQqGPsNX3JiKqn/cHVWJd5RUlWl+/Y16nwYMrxtAySE9+t/
         peHPY7rG1H16OFG0hEVss1wVJwg4QSPPAB4dN37UCy3Ee0rIUIUhIOAVyx4znzrU4yKr
         TfXN7pfbTv4XLqETrOHfW26Clp98LfoBTtUrMYU7rUdkmWKdVGGhHGQXkpPZYt4B8cTZ
         JB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788676294; x=1789281094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CowhusBJtkVgTxM1sMewOhXaozR9ys1uAKwcRp0eiRc=;
        b=lTy6leX5g/gEbgbOFuWWPip1nV3MGKz57WGXZXGTyrPG/RQBktRULjF+DhElfe6x+7
         pzkapfL1GX96uio/Kj3g6Ct/Gjug8elfg04x7Tle97CP6Cwx1ngKeBotmaZUwKRGw/qS
         Gt+4KA8ajNjZS88hFb+RN6K/MkQ6EcnGHDixzQU9iLUH4ezoYVE0uevk5NJKMxN837Zf
         R8lrZC1HO3h0/mNN5AFHGMB3ctH8SP7kNftHIzOiHz4KMYfm/xGzs5x8O3L0CN3cCUs8
         Lgi8RQdyv51WpHnIVUGG7zFmy6YxhKdbcru5+xCajRmSM8kvpvM7+kkRDTh/TRP+iS0x
         oa7w==
X-Forwarded-Encrypted: i=1; AKwUvBwlKC+JdWVkkZDY/tCasSTfPYt3EklTOwEEMfxzVCxz02fbaWsK8WySHtZMzkrf03kVjBmB/Bo+daRu8aHFbZY4@lists.infradead.org
X-Gm-Message-State: AFuF++mhMDnLg9/BtmfilXXWkWSPGyf61ZyneyaaOXL511+XoC+atSeI
	IqfeEfPRLy4gGdttX8gl5b1i/CI691hTuUfDTkaJXGBItRXHkoBCCviXi6wGOhrhogdTDKbMes5
	nRF8wKq2986ulfV/R4E/vd0dE9chAbbO6CNMowln54g==
X-Gm-Gg: AYBFou15FewPl5YMf9/Nyn2PQo+5b/0DC8KWJWrVm9qPjW+JRBZUufVAAZVQDXsp02w
	26EcYW53J++oGbMmbZHL82s+Q9c9zHxtvzoSjvvzi7Pcr1CdtKPcdjySEL+gD2wKT0Oybz8Qw2l
	EpmoRr0bM9W9G1mQaltzk5Ne05bpFCcBYuoUgqNEZtb1x//3mL0ZGVe63MC39xzUGy3/HRdrZw/
	ymSSZbPnzfVNy1GUaXGeCHk2vs4Zy3eQA+R/pJ7lcRwOKH1Q9OiEzs5PAy/9qrfaAjK//nn+Wff
	TXA3EgjhJ+fAPM9JoWLXJ8DREzJabJdAJG53xgtkJ7oVZekQ4GXn2QBsHYDgS9qLi+2xHmW+u0V
	/MM8=
X-Received: by 2002:a17:907:c80d:b0:c25:f7dc:2d5 with SMTP id
 a640c23a62f3a-c25f7dc0956mr720225966b.22.1788676294144; Sat, 05 Sep 2026
 23:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
 <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com> <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com>
In-Reply-To: <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Sun, 6 Sep 2026 10:31:23 +0400
X-Gm-Features: AcwNN1WMMbAQ2CuZOa8tZDe3nBXerl1P7S6WAcKAg4su3ebkGU8XnfBv_73Boic
Message-ID: <CAKTNdwGTacFvn5BEN+iu0OBG2BUas7Vfj=YYF8OhAhNq-9kmyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_233139_292975_B0E5605A 
X-CRM114-Status: GOOD (  27.83  )
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

On Sun, Sep 6, 2026 at 10:09=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.c=
om> wrote:
>
> On Fri, Sep 4, 2026 at 2:36=E2=80=AFAM Alexey Charkov <alchark@flipper.ne=
t> wrote:
>
> > > See arch/arm64/boot/dts/rockchip/rk3399-base.dtsi, hdmi ref clock is
> > > wired directly to VPLL, and dw_hdmi-rockchip calls clk_set_rate() wit=
h
> > > pixel clock for ref clock, see
> > > dw_hdmi_rockchip_encoder_atomic_mode_set(). So at least in the rk3399
> > > case VPLL is supposed to support the required pixel clock. Without th=
e
> > > first patch 1366x768 mode with 85.5MHz pixel clock is just rejected.
> >
> > I strongly suspect that the dtsi doesn't describe the real clock usage
> > here. The TRM for RK3399 doesn't show any "ref" clock for HDMI, and no
> > TRM-documented VPLL users look like anything that could connect
> > directly to the HDMI controller.
>
> See "1.1.11 HDMI Interface", it explicitly mentions 13.5=E2=80=93600MHz i=
nput
> reference clock

Which matches the pixel clock (dclk) range for HDMI 2.0, so nothing is
disproven yet

> > I believe something is hardcoding the divisor (or leaving it at the
> > power-on default) in the actual DCLK of a VOP which the HDMI
> > controller uses, instead of modelling it properly as a mux (frac/div)
> > feeding off VPLL via another mux - both perfectly representable in the
> > clock framework and already envisaged in the clock driver, making the
> > PLL table patching unnecessary.
> >
> > Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
> > depending on which one your HDMI controller uses)? Your clock summary
> > already shows that something is assigning its parent to DCLK_VOPx_DIV
> > and the latter's parent to PLL_VPLL, so rate changes the current
> > driver code does on VPLL propagate to the muxed and divided downstream
> > consumer as a side-effect rather than as an actual rate request.
>
> I don't think it is a reasonable ask. Wrong clock for the HDMI encoder
> would just result in non-working HDMI output and no feasible way for
> me to debug what is wrong.

Hope you have a serial console or ssh connection to the board. If it
doesn't work you'll know soon enough.

What I'm pointing out is that the clock setup implied by the current
dtsi doesn't make much sense: VOP's dclk is driven off VPLL via a mux
and divisor. If the encoder's pixel clock is truly driven directly off
VPLL then Rockchip designed the muxes and dividers for nothing, as
they will always be no-ops. This doesn't square, so something must be
wrong, and I believe it's the dtsi.

I'll be happy to be proven wrong here.

Best regards,
Alexey

