Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA99E66880
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIisu+SInmO8aU5o7J4/R5vnmz4PGenJ0iDGtFRy0GM=; b=a7Tqw5CVoZHXV84h8XVLIDBteK
	Z2KdZZz2Fgbu1qVHHds1rzGPOrBgzQ+6LRk1yxUaEcEPTTcyBudJnkTBYm6Npxm2G+nIhQcWORFxO
	ZzPW0VfFCCk7DGU/i6TnAf7S3UgvEPB0GQJhyKhrfk9ZK2OEr1wFg0TtKhXUmPpdJLB1o727lekwW
	lUDJNsIoNB59L8ekG5IZJP5gY4a/lHmpPxYlcTG44gVIE5PcQnSmX2fsThJ/gNg27njy4I46jP7Pr
	o/kgNfAXeHwz0FvZ49D2iryyAiCReLZ4Eh4qO21wk8ZWp7YKIPsUko9kHaLLbYC3Vqnak3Tjoyfs/
	xbCEYujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw7K-00000004oP2-1i9y;
	Sat, 23 Nov 2024 19:48:30 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw6O-00000004oFn-1Me4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 19:47:33 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7eae96e6624so2625423a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Nov 2024 11:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732391251; x=1732996051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIisu+SInmO8aU5o7J4/R5vnmz4PGenJ0iDGtFRy0GM=;
        b=eUSX47/ErRDPjjFVAcJ/2+OYFFIECgNi894YOrMDcZOAS+68mqNYOUxGwTVPJVT3bE
         ib3w3aLPvMuKgG94jNWJ3LkIcOAZdJnWyMbeLz/pQG4uMZsFTKBZWvo92EXsQeQIK/2A
         VLxnmTDOQPnZxGuyzUZEK4yzjeNCthr/V85qsRal88gK0Yz8UVCizidqY7KTKm82B5MY
         DACgepv765Iz9rjdrzWey/BaAb/REP0K8pzMUgtmN2d9ZeyrHLUB5S4uV6M5jb8xDqgR
         klqycghbpkDanaWaQLEyWJMuyNxw7NgEMHeoN11Wj/JQMv8x6VTOuLt6Hay3UR/n+YIK
         oj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732391251; x=1732996051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIisu+SInmO8aU5o7J4/R5vnmz4PGenJ0iDGtFRy0GM=;
        b=MsGg/52gIkJzMiTMm+dZhamABym9yGu3LHZSyM3vTSXe6yV/SALP2vmQX8/pciAf1h
         P8WILJO03RQdnv2uaBQ0yar62zGC7CoAlWDDxxazq1Zns54Bmk95bIfwwDRCBQRk/J25
         mthbka/XOsuNuFTjo0VKKLbXZORJue25QZYG+2JWlKecPuifTfGE5BhGgr6ow15C6cng
         +g13vBh7QIYlflavRb1/L8DnxS2IrvXuSbG3n9LtQshyY0FjzT9vuHjccIkysF34IVQr
         9ZWKsEpot+nIHO1LkU0Il34ztEYzovqkQkbHFLfLx4z1aQtbKjM5LN8yCrAo4Uqy7SaL
         G6/A==
X-Forwarded-Encrypted: i=1; AJvYcCWPdiIcRpMm7auLK8ecBiAcEQa1NWGcHBfxGgocVaLmGvE06jImlZzKQaQHZf0We8QARS0JmofHc+GNCW5I8IKp@lists.infradead.org
X-Gm-Message-State: AOJu0YxlIwLzCPeaxErBxtONET0z4uAj0SkDE+G+2CxHvBCgQ7aQhpTZ
	+9pRjncNFAZEjBm8sc0BCI7sGin/Si4+JcKLgYBtvyES1e3pkz2vJx40JGGnG/ZA53mxtNyjaN7
	AsBGhAS44W4bSDHchodwxhZV0FTU=
X-Gm-Gg: ASbGncvpW2Sixh/qHg2WQsZ7plSIG5idA1NUtYV8dvTa/BahG6ES3IkwLk9vlZDDSSU
	kNyx66aWsUzVk/WzbfZRO3UUd7XROHrU=
X-Google-Smtp-Source: AGHT+IER882hxWGxdnLbHc4WL+b6BKZBCKwOSHKs1j9B4N3y0JbmongRgfkv5XWs473nMaR5UvS6LxycIeafIw7+oY8=
X-Received: by 2002:a17:902:ea09:b0:20b:b93f:300a with SMTP id
 d9443c01a7336-2129f72fe53mr91133915ad.7.1732391250925; Sat, 23 Nov 2024
 11:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20241114065759.3341908-1-victor.liu@nxp.com> <20241114065759.3341908-3-victor.liu@nxp.com>
 <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de> <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <8a4fd234-4c7b-4a04-990d-3222aaa5172d@denx.de> <AM7PR04MB7046E282FD702ACE5E288F8998202@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <83be0a27-6b6c-4ba6-b9dc-f914a10abace@denx.de> <AM7PR04MB7046587167BF790549B8560F98212@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <c5ab63da-21ec-4c0d-8ecc-3745943d806f@denx.de> <AM7PR04MB7046D404841394382324DE7198232@AM7PR04MB7046.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7046D404841394382324DE7198232@AM7PR04MB7046.eurprd04.prod.outlook.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 23 Nov 2024 13:47:19 -0600
Message-ID: <CAHCN7xJsTo=yRxkqPwvt5hX0UTFvF+gBVOqcjrR2jSq4jKzV3g@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
To: Ying Liu <victor.liu@nxp.com>
Cc: Marek Vasut <marex@denx.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_114732_374527_0C6F8C00 
X-CRM114-Status: GOOD (  48.95  )
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

On Thu, Nov 21, 2024 at 9:39=E2=80=AFPM Ying Liu <victor.liu@nxp.com> wrote=
:
>
> On 11/22/24, Marek Vasut wrote:
> > On 11/20/24 7:38 AM, Ying Liu wrote:
> >
> > [...]
> >
> > >>> If the DP monitors support typical video modes like 1080p60 with
> > >>> 148.5MHz pixel clock rate, I assume these typical video modes work
> > >>> still ok with this patch at least.  Please help confirm this, since=
 if the
> > >>> alternative solution(*) doesn't stand, we would know those video
> > >>> modes still work ok with my solution(fixed PLL rate).
> > >>
> > >> They do not work with the fixed PLL setting.
> > >
> > > Why?  Did you assign a sensible fixed PLL rate in DT?
> >
> > Whatever was in imx8mp.dtsi does not really work for all the panels.
> > Please keep in mind that the use case I have does not include only
> > 1920x1080 "standard" panels, but also other resolutions.
>
> It looks like you are still sticking to the idea of supporting all potent=
ially
> valid video modes by trying to find an "alternative" solution, while
> neglecting that the solution *could be* never working.
>
> >
> > > Can you please compare clk_summary output for the failing cases
> > > before and after this patch is applied? I assume that if you use
> > > the fixed PLL rate same to the rate which works before this patch is
> > > applied, the typical video modes still just work after this patch is
> > > applied.
> >
> > I'm afraid I do not need to support only typical video modes, but also
> > the other "atypical" modes.
>
> If the "alternative" solution doesn't work, we'll end up using the "fixed
> PLL rate" solution.  It that case, some video modes would be filtered
> out as a sacrifice.
>
> >
> > [...]
> >
> > >> One really nasty way I can think of is -- use find_node_by_compatibl=
e(),
> > >> look up all the relevant DT nodes, parse their clock properties, and
> > >> check whether they all point to the Video PLL or not.
> > >
> > > That's nasty.  It looks even more nasty when considering the fact tha=
t
> > > i.MX93 LCDIF is also driven by imx-lcdif DRM while only i.MX8MP LCDIF
> > > needs the nasty check, because i.MX93 SoC embeds only one LCDIF.
> >
> > The check can be skipped based on compatible string.
> >
> > I agree it is nasty, but it is a start. Are there better ideas ?
>
> No good idea from me.
>
> >
> > >> Maybe the clock subsystem has a better way, like list "neighbor"
> > >> consumers of some specific parent clock or something like that.
> > >
> > > What will imx-lcdif DRM look like by using this way? Get the ancestor=
 PLL
> > > clock of pixel clock(media_disp{1,2}_pix_root_clk), list all child cl=
ocks
> > > (media_disp1_pix and/or media_disp2_pix + other possible clocks) of t=
he
> > > PLL clock in a string array and find media_disp1_pix + media_disp2_pi=
x
> > > in it?
> > >
> > > Doesn't look nice, either.
> >
> > One other option came to my mind -- place a virtual clock between the
> > Video PLL and consumers (LCDIF1/2/LDB), and then have the virtual clock
> > driver do the clock rate negotiation in some .round_rate callback. That
> > is also nasty, but it is another idea. If there is a clock specifically
> > implemented to negotiate best upstream clock rate for all of its
> > consumers, and it is aware of the consumer behavior details and
> > requirements, maybe that could work ?
>
> A mighty virtual clock?  I'm not sure if that would work or not.

From a power-consumption perspective, it seems to me like running the
clocks at the lowest value instead of setting a really high rate which
divides down would save power.

adam
>
> >
> > >> [...]
> > >>
> > >>>> Can something like (*) above be implemented instead, so both Share=
d
> > >> and
> > >>>> separate PLLs would be supported ? That should solve both of our u=
se
> > >>>> cases, right ?
> > >>>
> > >>> I don't see any clear way to implement something like(*).
> > >>>
> > >>> Take the 3 i.MX8MP LCDIFs as one graphic card driven by one imx-lcd=
if
> > >>> DRM instance?  Would it be too intrusive?
> > >>
> > >> Yes, and I think unnecessary, one can simply traverse and parse the =
DT
> > >> to determine the clock assignment?
> > >
> > > Yes, people can traverse and parse DT, but it's nasty.
> > >
> > > In addition, one may argue that now that CLK_SET_RATE_PARENT flag
> > > is set for the pixel clocks, all potential video modes read from EDID
> > > should be supported when only either LVDS display pipeline or MIPI DS=
I
> > > display pipeline is active in the shared PLL case.  This requires one
> > > single DRM instance to detect single or dual active display pipelines
> > > dynamically, hence this single DRM instance becomes necessary.
> >
> > Would single virtual clock which do the frequency negotiation between
> > multiple DRM consumers work too ?
>
> Not sure if it would work or not, but I'm sure that one single DRM instan=
ce
> means atomic check/commit for the display pipelines as a whole, hence
> awareness of active display pipeline number in an atomic way.
>
> >
> > I do not have much to add to the points below.
>
> Regards,
> Liu Ying

