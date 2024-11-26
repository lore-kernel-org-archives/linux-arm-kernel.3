Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCE2D3B981
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qIA4RDGJqq407wcmAgXUIpGA4Wmfra8Ng+61C/q9qs=; b=DZFO3o3iaikYy4og4Kg8TCKJ0M
	l7YxB5gFpznqFLyBffGE4FNr8WfFqFxkjfIcw9nMUSwPmNIkXl+WUXJnOW7iHVDYFeNlialKUqEza
	OYWK8wMMU8hDicreYZMQj2qQseZpwAurh2SLsvfyHazOpkbENK7FfjQgx2Mwvi98nt4vINSWCRRJC
	oKlmLmEAEJnEBb8twfyEkhsoluL8+N3pFnrb6fV3jHYajZbEpLkUaT9aWDZpbqLJJ+qDK2vuvTZYK
	0PORWl6GPHPd/MenvMgOPRB/iLpiDAQ1OxrZvVbVhm2ciUCW9aDiBTKB1T4QmPbmpGFNBSr5ptMwh
	3mfQW83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtN4-0000000ANB2-23Fg;
	Tue, 26 Nov 2024 11:04:42 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtM6-0000000AN3H-1FQX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:03:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2138140004;
	Tue, 26 Nov 2024 11:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732619017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qIA4RDGJqq407wcmAgXUIpGA4Wmfra8Ng+61C/q9qs=;
	b=dGxOjP4ZvCxQVdk1DkvAOxtspwrRNnjALhmi/ccJI/bJi4pEOSyW1c9xyiiF9U648W0kWk
	jnXj12nGCKJz8JXIk047HqrQvNv4XID/J7+tvT5tp0Vdxb+ttSUfSLtBNlHOpnH8TIeJPl
	IVwiw7RvJ8gD1ZEN90Ko4nU4OYvAz+wfz+ONxKBV8WDK/6fVbotTWHZxG/+pqoR6Qz/Kz9
	AWcEGlAWi7Znia0fNB2Oce/Png0sULaIpyCXr/cdO4amdTnyf813ES29D6M4K7/4MXQEmd
	V4ORwkluE/FjB8muTuKZUK3V8Mtp/MgCAvZUwLgN5ZjcLCxrDDd/KH6+LwJu+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Marek Vasut <marex@denx.de>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Abel
 Vesa <abel.vesa@linaro.org>,  Herve Codina <herve.codina@bootlin.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>,
  stable@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
In-Reply-To: <55bb77b4-5172-4b4a-aaea-df6972a417dc@nxp.com> (Liu Ying's
	message of "Tue, 26 Nov 2024 14:49:38 +0800")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<b98fdf46-3d09-4693-86fe-954fc723e3a6@nxp.com>
	<87zflrpp8w.fsf@bootlin.com>
	<55bb77b4-5172-4b4a-aaea-df6972a417dc@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 26 Nov 2024 12:03:35 +0100
Message-ID: <87h67uw92w.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_030342_587567_00D3C2FF 
X-CRM114-Status: GOOD (  31.66  )
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

Hi Liu,

>>> The
>>> pixel clock can be got from LDB's remote input LCDIF DT node by
>>> calling of_clk_get_by_name() in fsl_ldb_probe() like the below patch
>>> does. Similar to setting pixel clock rate, I think a chance is that
>>> pixel clock enablement can be moved from LCDIF driver to
>>> fsl_ldb_atomic_enable() to avoid on-the-fly division ratio change.
>>=20
>> TBH, this sounds like a hack and is no longer required with this series.
>
> Pixel clock is an input signal to LDB, which is reflected in LDB block
> diagram in i.MX8MP TRM(see Figure 13-70) where "CLOCK" goes into LDB
> along with "DATA", "HSYNC", "VSYNC", "DATA_EN" and "CONTROL".  So,
> fsl,ldb.yaml should have documented the pixel clock in clocks and
> clock-names properties, but unfortunately it doesn't and it's too late
> to do so.  The workaround is to get the pixel clock from LCDIF DT node
> in the LDB driver.  I would call it a workaround rather than a hack,
> since fsl,ldb.yaml should have documented the pixel clock in the first
> place.
>
>>=20
>> You are just trying to circumvent the fact that until now, applying a
>> rate in an upper clock would unconfigure the downstream rates, and I
>> think this is our first real problem.
>
> I'm still not a fan of setting CLK_SET_RATE_PARENT flag to the LDB clock
> and pixel clocks.  If we look at the bigger picture, the first real
> problem is probably how to support both separated video PLLs and shared
> video PLL.
>
>>=20
>>> https://patchwork.kernel.org/project/linux-clk/patch/20241114065759.334=
1908-6-victor.liu@nxp.com/
>>>
>>> Actually, one sibling patch of the above patch reverts ff06ea04e4cf
>>> because I thought "fixed PLL rate" is the only solution, though I'm
>>> discussing any alternative solution of "dynamically changeable PLL
>>> rate" with Marek in the thread of the sibling patch.
>>=20
>> I don't think we want fixed PLL rates. Especially if you start using
>
> I don't want fixed PLL rates, either...
>
>> external (hot-pluggable) displays with different needs: it just does not
>
> ... but, considering the problem of how to support separated/shared video
> PLLs, I think we have to accept the fixed PLL rates.  So, unfortunately
> some video modes read from EDID cannot fly.  If there is an feasible
> alternative solution, it will be good to implement it, but till now I
> don't see any.

Can you please remind me what your exact display setup (and their
required pixel clocks) is?

AFAIU, you don't want to use dynamic calculations for the PLL because it
breaks your use case with HDMI. Of course this is a very limited use
case, because using a static rate means almost a single type of display
can be plugged.

The clock subsystem will not recalculate the video_pll1 if you can
achieve a perfect rate change using the LDB/PIX divisors. So let me
propose the below addition to this series. With the below diff, your
setup should still work with assigned clock rates, while letting us
handle our calculations dynamically.

The addition I am now proposing is to remove CLK_SET_RATE_PARENT to both
media_disp[12]_pix clocks. This should actually fix your situation while
keeping pixel clocks accurate as far it is possible as the LDB clock
will change video_pll1 only if the PLL rate is not suitable for it in
the first place. And then, there will be no other clock messing with
this PLL. This is probably a safer approach, which should still allow
accurate dynamic rate calculations for "simple" setups *and* let the
static assignations work otherwise:

-       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] =3D imx8m_clk_hw_composite_bus_flag=
s("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET=
_RATE_PARENT | CLK_NO_RATE_CHANGE_DURING_PROPAGATION);
+       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] =3D imx8m_clk_hw_composite_bus_flag=
s("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_NO_=
RATE_CHANGE_DURING_PROPAGATION);
[...]
-       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite_bus_flag=
s("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET=
_RATE_PARENT | CLK_NO_RATE_CHANGE_DURING_PROPAGATION);
+       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite_bus_flag=
s("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_NO_=
RATE_CHANGE_DURING_PROPAGATION);

Can you please give this proposal a try?

[...]

>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -177,6 +177,17 @@ static void fsl_ldb_atomic_enable(struct drm_bridge=
 *bridge,
>>         mode =3D &crtc_state->adjusted_mode;
>>=20=20
>>         requested_link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->cl=
ock);
>> +       /*
>> +        * Dual cases require a 3.5 rate division on the pixel clocks, w=
hich
>> +        * cannot be achieved with regular single divisors. Instead, dou=
ble the
>> +        * parent PLL rate in the first place. In order to do that, we f=
irst
>> +        * require twice the target clock rate, which will program the u=
pper
>> +        * PLL. Then, we ask for the actual targeted rate, which can be =
achieved
>> +        * by dividing by 2 the already configured upper PLL rate, witho=
ut
>> +        * making further changes to it.
>> +        */
>> +       if (fsl_ldb_is_dual(fsl_ldb))
>> +               clk_set_rate(fsl_ldb->clk, requested_link_freq * 2);
>
> I don't think i.MX6SX LDB needs this, because the "ldb" clock's parent
> is a mux clock with "ldb_di0_div_3_5" or "ldb_di0_div_7" parents.

Ah, you mean we should only do this in the imx8 case, right?

Thanks,
Miqu=C3=A8l

