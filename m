Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37654C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkK3YraUhv52e6kmGNd3i6W1acEs14yvrmEO/fbWB6U=; b=c1Ms406eh0A0teOGitnJ7RzW45
	xF5RULpzQkvT3+kJNh+W/9dIFgqgbhlkmLR0SPJhsVBoMpvxXjqHweNUCHnzEdulHFu5gd5rXsOqW
	4oNcpVlP0WR4JHJxj8txMiw5I73tTD7JMR4lF4IdqKMBnMUzRK+1MwTy/wKAKD1Kj97HyFO2m2cdB
	DZmwTjjBNA2hFF8AKhBZn2F/5Mu4z1fR/Uqx49255GC5a5+4C5PzCtaI4IH7/hPsSNFyQzkysn4M1
	FTWCJUNoKSDqnKlLYHmpN2YEp0T2/GhdGHCqUnBPJAOgB52CVQMhAo4b/r4oOUCSvRPJJ5SL3oSUH
	UcXjc/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYp38-00000000lT5-0Yua;
	Fri, 17 Jan 2025 16:18:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYp1r-00000000lBl-3YnF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:17:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43618283d48so15868735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 08:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737130621; x=1737735421; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RkK3YraUhv52e6kmGNd3i6W1acEs14yvrmEO/fbWB6U=;
        b=VVLSVIdqe8Oajadm4+4QHr2om4iU6rkXiWa7eJ37uw3YCnT1OYHfZ5J4Tft1ompJsF
         kvwRnPnPvcqYLlfJe49qohkZxby7HUJiLB27Yw44dLSDfqYyLvDWlokh2K9HkwJSI62n
         de9FyHKN0Du1SXBVGV6juffSEa97VT3zJGF1Dh+FjuhnRCCoc3osDu0R12v/OjirESpW
         pbYZufGWKflSSJYbp2rpyArBhlK80kP1nJj/Iu96D+ta4cKQ+kkrKx/7NWo+MNwYVUuh
         IQCve53nbx78J4GjaeKjK0nsD/Ext1PDi4VwSVlwz5iyxAA4XTABSYq7Ip5nKF8uF49M
         AFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737130621; x=1737735421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkK3YraUhv52e6kmGNd3i6W1acEs14yvrmEO/fbWB6U=;
        b=KE2XBAYKtg2m94neZXSwNcLobPWe9fUCC2222puxXFkYHdlrt0hYGXRtAfzRuZbg+f
         AvqfUPBBqmD/kIyDjXLq97p52clngt0LXX+XSD9sKHzkw2p7BzdgQRc+/56TL97SmRSK
         OXdHI8fc0BwASkeAxulxFeVI5cORrzcKtNXXZTsNfqZIeUV5FLqmb4h0QiAiOsPT0+Ja
         +9jmo6wE4+OgE6iMNovWD3o81uk39oaaRuA3Hsv1tFYw0SF6P4r/+fyW3jFgIM9q+Fp5
         ulUMGjE2dIwpLI6Azmxu4/LNyyetf7Rver1KLbfb+ya3X/aLFYU/Z29VqkLEDn1NU4eO
         HRYg==
X-Forwarded-Encrypted: i=1; AJvYcCVltKf1RZVQsPf/i8bKwwnL5dMdgW7Zj06HL4CJ52KkvTlYrKv8Y/Z5KSvCDGlzZ9Ak+FR+ReY4dTfOEuulchu7@lists.infradead.org
X-Gm-Message-State: AOJu0YzOmbuGq+839FuWZlhKxTDBS2ICaziroV57HblaOWc4Q7QhPRlJ
	fgeXSUrAQWdAVhAsNR2gA60rX/1m6i0yrZUxVLq8aeSeOhku//q6
X-Gm-Gg: ASbGncuCur4HzVAS3SKUYd0Ozc0bUWnXcuSVBHoaLn4CM6upxFIbFz3YiK6Koz6Gu8A
	kGpOlSlMHyNjOrxYi9Nbu2xSzxuUTnQNCHiS7rGC4J1TCy16wDiBm9hG+X0CREI7cF6WnC61iBk
	VcMEikWpoSvUo+YnM5Xm/WpjeHVcY5a/UD8FB1FjRswF5V50Qmg0IaDVklLR22o9drRMoFwJ6w5
	tYogJUwxUvpz4gccyhg0u7puZKIliaMDtSJ6kiiS/XmaILwHbLMDOXo
X-Google-Smtp-Source: AGHT+IGAWQaM6yNh33X77UBZupdUNHFVnCSSzWPAqwT1T2yvjJ/mCaKmTHNr57vHQHkL4BIH2iTTdg==
X-Received: by 2002:a05:600c:4ed4:b0:434:fdbc:5cf7 with SMTP id 5b1f17b1804b1-438914373e4mr32114405e9.27.1737130621190;
        Fri, 17 Jan 2025 08:17:01 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:a17a:6a28:e744:9a06])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac5f9sm96021605e9.11.2025.01.17.08.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:17:00 -0800 (PST)
Date: Fri, 17 Jan 2025 17:16:58 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com,
	francesco.dolcini@toradex.com, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
Message-ID: <Z4qCeo0H1kZxAuFE@eichest-laptop>
References: <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop>
 <Z4dy3LiEAQ_gkQGG@eichest-laptop>
 <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com>
 <Z4eQX_VnBEVqxT_r@eichest-laptop>
 <CAA+D8APivJWD-AqwmQ-mtcr=ZHot5rfA8FRWF2+p-_mq5BGxHA@mail.gmail.com>
 <Z4i0G5Tw4q0v8DTL@eichest-laptop>
 <CAA+D8AOakQdnEe9ZrfTCrWcjHJRRU0kqFVsiu8+FMiHeMAVV_g@mail.gmail.com>
 <Z4lDbMqCYW2W7iyX@eichest-laptop>
 <CAA+D8AM9xwvyvU_0ODFwaq=YzzbP_R7hqMvHqx-Y1kHPpX_x_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AM9xwvyvU_0ODFwaq=YzzbP_R7hqMvHqx-Y1kHPpX_x_Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_081703_895685_ADA64B46 
X-CRM114-Status: GOOD (  68.80  )
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

On Fri, Jan 17, 2025 at 02:56:15PM +0800, Shengjiu Wang wrote:
> On Fri, Jan 17, 2025 at 1:35 AM Stefan Eichenberger <eichest@gmail.com> wrote:
> >
> > Hi Shengjiu Wang,
> >
> > On Thu, Jan 16, 2025 at 03:30:55PM +0800, Shengjiu Wang wrote:
> > > On Thu, Jan 16, 2025 at 3:24 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > >
> > > > Hi Shengjiu Wang,
> > > >
> > > > On Thu, Jan 16, 2025 at 12:01:13PM +0800, Shengjiu Wang wrote:
> > > > > On Wed, Jan 15, 2025 at 6:39 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Jan 15, 2025 at 05:14:09PM +0800, Shengjiu Wang wrote:
> > > > > > > On Wed, Jan 15, 2025 at 4:33 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Hi Shengjiu Wang,
> > > > > > > >
> > > > > > > > On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wrote:
> > > > > > > > > Hi Shengjiu Wang,
> > > > > > > > >
> > > > > > > > > On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > > > > > > > > > On Mon, Jan 13, 2025 at 5:54 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > > > > > > > >
> > > > > > > > > > > Currently, the flags for the ACM clocks are set to 0. This configuration
> > > > > > > > > > > causes the fsl-sai audio driver to fail when attempting to set the
> > > > > > > > > > > sysclk, returning an EINVAL error. The following error messages
> > > > > > > > > > > highlight the issue:
> > > > > > > > > > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> > > > > > > > > > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > > > > > > > > >
> > > > > > > > > > The reason for this error is that the current clock parent can't
> > > > > > > > > > support the rate
> > > > > > > > > > you require (I think you want 11289600).
> > > > > > > > > >
> > > > > > > > > > We can configure the dts to provide such source, for example:
> > > > > > > > > >
> > > > > > > > > >  &sai5 {
> > > > > > > > > > +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > > > > > > > > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > > > > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > > > > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > > > > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > > > > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > > > > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > > > > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > > > > > > > > > +                       <&sai5_lpcg 0>;
> > > > > > > > > > +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> > > > > > > > > > +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> > > > > > > > > > +                                <722534400>, <45158400>, <11289600>,
> > > > > > > > > > +                               <49152000>;
> > > > > > > > > >         status = "okay";
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > > Then your case should work.
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
> > > > > > > > > >
> > > > > > > > > > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
> > > > > > > > > > the driver don't get an error from clk_set_rate().
> > > > > > > > >
> > > > > > > > > Thanks for the proposal, I will try it out tomorrow. Isn't this a
> > > > > > > > > problem if other SAIs use the same clock source but with different
> > > > > > > > > rates?
> > > > > > > > >
> > > > > > > > > If we have to define fixed rates in the DTS or else the clock driver
> > > > > > > > > will return an error, isn't that a problem? Maybe I should change the
> > > > > > > > > sai driver so that it ignores the failure and just takes the rate
> > > > > > > > > configured? In the end audio works, even if it can't set the requested
> > > > > > > > > rate.
> > > > > > > >
> > > > > > > > The following clock tree change would allow the driver to work
> > > > > > > > in our scenario:
> > > > > > > > &sai5 {
> > > > > > > >         assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > > > > > >                           <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>;
> > > > > > > >         assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
> > > > > > > >         assigned-clock-rates = <0>, <11289600>;
> > > > > > > > };
> > > > > > >
> > > > > > > In which we configure PLL_0 for 48KHz series (8kHz/16kHz/32kHz/48kHz),
> > > > > > > PLL_1 for 44kHz series (11kHz/22kHz/44kHz),
> > > > > > > which should fit for most audio requirements.
> > > > > > >
> > > > > > > >
> > > > > > > > However, this means we have to switch the parent clock to the audio pll
> > > > > > > > 1. For the simple setup with two SAIs, one for analog audio and one for
> > > > > > > > HDMI this wouldn't be a problem. But I'm not sure if this is a good
> > > > > > > > solution if a customer would add a third SAI which requires again a
> > > > > > > > different parent clock rate.
> > > > > > >
> > > > > > > We won't change the PLL's rate in the driver,  so as PLL_0 for 48kHz,
> > > > > > > PLL_1 for 44kHz,  even with a third SAI or more,  they should work.
> > > > > > >
> > > > > > > >
> > > > > > > > One potential solution could be that the SAI driver tries to first
> > > > > > > > derive the clock from the current parent and only if this fails it tries
> > > > > > > > to modify its parent clock. What do you think about this solution?
> > > > > > > >
> > > > > >
> > > > > > I did some more testing and I'm still not happy with the current
> > > > > > solution. The problem is that if we change the SAI5 mclk clock parent it
> > > > > > can either support the 44kHz series or the 48kHz series. However, in the
> > > > > > case of HDMI we do not know in advance what the user wants.
> > > > > >
> > > > > > This means when testing either this works:
> > > > > > speaker-test -D hw:2,0 -r 48000 -c 2
> > > > > > or this works:
> > > > > > speaker-test -D hw:2,0 -r 44100 -c 2
> > > > > > With:
> > > > > > card 2: imxaudiohdmitx [imx-audio-hdmi-tx], device 0: i.MX HDMI i2s-hifi-0 [i.MX HDMI i2s-hifi-0]
> > > > >
> > > > > Are you using the setting below?  then should not either,  should both works
> > > > >  &sai5 {
> > > > > +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > > > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > > > > +                       <&sai5_lpcg 0>;
> > > > > +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> > > > > +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> > > > > +                                <722534400>, <45158400>, <11289600>,
> > > > > +                               <49152000>;
> > > > >         status = "okay";
> > > > >  };
> > > >
> > > > Sorry I didn't communicate that properly. Yes I was trying with these
> > > > settings but they do not work. The problem does not seem to be that the
> > > > driver can not adjust the rate for the audio (so e.g. 44kHz or 48kHz)
> > > > but that snd_soc_dai_set_sysclk in imx-hdmi.c fails with EINVAL. This
> > > > results in a call to fsl_sai_set_mclk_rate in fsl_sai.c with clk_id 1
> > > > (mclk_clk[1]) and a freq of 11289600 which causes the fail.
> > > > Interestingly, in fsl_sai_set_bclk we then only use clk_get_rate on
> > > > mclk_clk[0] which is set to audio_ipg_clk (rate 175000000) and we do not
> > > > use mclk_clk[1] anymore at all. This is why I'm not sure if this call to
> > > > snd_soc_dai_set_syclk is really necessary?
> > > >
> > >
> > > Could you please check if you have the below commit in your test tree?
> > > 35121e9def07 clk: imx: imx8: Use clk_hw pointer for self registered
> > > clock in clk_parent_data
> > >
> > > if not, please cherry-pick it.
> > >
> > > The audio_ipg_clk can be selected if there is no other choice.
> > > but the rate 175000000 is not accurate for 44kHz. what we got
> > > is 44102Hz. This is the reason I don't like to use this source.
> >
> > Thanks a lot for the hint, in my test setup I indeed have not applied
> > this commit. I tested it now with cherry-picking the commit and with
> > applying the change to the dts. This made it work. I will do some more
> > testing tomrrow and if I can't find any addtional issue I will use this
> > as a solution.
> >
> I am thinking that your change may still be needed.
> 
> Your change plus the below change. then we can support more rate,
> not only 48k/44kHz.  SAI driver will select the parent by itself before
> the clk_set_rate().

When testing the only two frequency that are not working and seem to be
supported by HDMI is first 88.2 kHz.
fsl-sai 59090000.sai: failed to derive required Tx rate: 5644800
fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_hw_params on 59090000.sai: -22

and second 32kHz:
fsl-sai 59090000.sai: failed to set clock rate (8192000): -22
fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
 i.MX HDMI: ASoC: error at snd_soc_link_hw_params on i.MX HDMI: -22

For our use case this doesn't seem to be relevant at the moment. I will
clarify this internally.
> 
> +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> +                       <&sai5_lpcg 0>;
> +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> +                                <722534400>, <45158400>, <11289600>,
> +                               <49152000>;
> +       clocks = <&sai5_lpcg 1>,
> +               <&clk_dummy>,
> +               <&sai5_lpcg 0>,
> +               <&clk_dummy>,
> +               <&clk_dummy>,
> +               <&aud_pll_div0_lpcg 0>,
> +               <&aud_pll_div1_lpcg 0>;
> +       clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3",
> "pll8k", "pll11k";
> 
> > Should I add the change to our Apalis board dtsi file or directly to
> > imx8qm-ss-audio.dtsi? I think it fixes kind of a general issue or not?
> 
> It is still board related, so I think it is better to add to the board dts file.

Okay, then I will add this change to the board dts and prepare a v2.

Regards,
Stefan

