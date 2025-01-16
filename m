Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC15E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 07:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgVDZJK/ujB65O5I2vwx4J+q5AFipQItIeJr4iAC6iA=; b=KXGmZPDCVjydM9+JrEcmvqrXiC
	UKsIfJxfLzxlR3tuWKsOjxmRY4snzrsgDycFzi2ckJ8J9hND+iOIZMpzrB1G3BgqRqmnILfLVm46D
	2ti3bUZdxbPQzs7qEfQuyoT9Jz+EuLHppyx6ZOAf3gyZSlfJbmXL/8UQkYSKGzmwc6DRmr+zeqEsu
	2b5HfciSgPaj8RDG9Q3r1ZPJM1Qz1w9auRfeIAb7RTFe2HUha1MQshyFM/6OW+JrDUx1eurd1steK
	5/jw1nNm8Co/2JgJVqHlFbjPA+2jMs/I3ZMoJ9LS54TIbbKE4HqERiT657fJDpZYtUMNF3dfJ8+Im
	uxyPEK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKFy-0000000E1pW-2GGp;
	Thu, 16 Jan 2025 07:25:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKEi-0000000E1jn-2qib
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 07:24:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso10222795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 23:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737012254; x=1737617054; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IgVDZJK/ujB65O5I2vwx4J+q5AFipQItIeJr4iAC6iA=;
        b=Gp+d1zbWXZjs3Y3smorrVC4omD9127unIsI7DlsBptIrVfvQuklq5r9+OE5tNhdvtk
         edPZuet37iuA7FXBaTFLz8laze9RmspcJ5GGjqoOdc1qJ376OfYDRtJODn3CHv8O7Qyp
         BjJVvhnUxwZREqGxVjFAIijdAXJ6hRhG3JlVuaa/6ge7Swe/yENx9LVTAl6FUebOMCXY
         DeSovPiLet/zDPI2hYvkN8/z+WQjMaodS6Aj0INHbc9WdBtdseDFQwU+4803RpMdHts2
         wO9H8RvfzF8AT5lFuiBm+HwzYpWxE2dkaJ9mBrr8Vb1JgrsCXq408YNBsobrsqZZukpC
         EdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012254; x=1737617054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgVDZJK/ujB65O5I2vwx4J+q5AFipQItIeJr4iAC6iA=;
        b=HOlDyrJATGKXBeSBqq9sFHoxySx1TudZ0m//aLOGK9hwalaWzBs7D2I5gTVNcCVLLD
         cZKLtEIg0Bs3zJxvQpikodv/6PTyZTGhGJjy/S8955NgHhdYE58hQj4Xty72064ohZ1y
         lFaJcrz89W8AlY9TKuIMIPbdLNRnlIQ4Ba1ISz06Xd9UdX7QuZjIV/wmFZB4CfFJtL11
         UD3nOymaIn7m2CL2so0KVRWYTfJ6XiuxJFPeALZnGkYUbeIRJJ4oObI+hvcoCLAPngWN
         ggozq8NEPRXxex8rSkLOG9VzFbRbHfURZb8/ncY8QCSHDKdbhiej+o4I2bPTXM569tMV
         QYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ3O8E3nigFxCGwi/wDtFiStPc/m3/f/uGWvHa5cWe3/9PrwLDAS9mVIcz4O8grikGllnmjTOgppcSlZGVZQ81@lists.infradead.org
X-Gm-Message-State: AOJu0YyH93jALSgtIA7K3OhxNagDGfap0xitsa0z34rVoxt8qNaJ61eW
	TYdKLza6narJq1Hm8UBMfurpm4yQgbULrpdyLEHbGieTouHxdxrN
X-Gm-Gg: ASbGncuze1qLJO2zW0yGsPu5LOdplRBXWmi/sbsyrBtWhL/ivR/ukYoXLJJ0gQcZynU
	9gvUGr1Ja9dXG68pyc+JqOQ+mfV+BI9BkK/qlhjwFIA+L6C1Mr9DF6euhP8asj2sjPGyxXIpsTx
	hKIJcL06sUR0m2UktwI/KZ612QZjPGVKVEtEvEm6BNWxnCZJD90P1HScABXXWYkPhuey9D+la0W
	QRYbSEQgATE2TFI6SGHVXhNZC9RvRXGxsKnpAA25F1EnpxpaP6cLPyM
X-Google-Smtp-Source: AGHT+IEoUDQBvRyW1rj5PdvWwHSZrTwh0+MhedH5EL9nzscjOPcqJoxU9CPjQ5ErDBkS7bIkez2gdQ==
X-Received: by 2002:a05:600c:c06:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-437c6b26e74mr45097105e9.12.1737012254194;
        Wed, 15 Jan 2025 23:24:14 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:6c4e:8d77:c1b7:309e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74bf061sm48499725e9.17.2025.01.15.23.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:24:13 -0800 (PST)
Date: Thu, 16 Jan 2025 08:24:11 +0100
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
Message-ID: <Z4i0G5Tw4q0v8DTL@eichest-laptop>
References: <20250113094654.12998-1-eichest@gmail.com>
 <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop>
 <Z4dy3LiEAQ_gkQGG@eichest-laptop>
 <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com>
 <Z4eQX_VnBEVqxT_r@eichest-laptop>
 <CAA+D8APivJWD-AqwmQ-mtcr=ZHot5rfA8FRWF2+p-_mq5BGxHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8APivJWD-AqwmQ-mtcr=ZHot5rfA8FRWF2+p-_mq5BGxHA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_232416_719777_B9A011C8 
X-CRM114-Status: GOOD (  54.03  )
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

Hi Shengjiu Wang,

On Thu, Jan 16, 2025 at 12:01:13PM +0800, Shengjiu Wang wrote:
> On Wed, Jan 15, 2025 at 6:39 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> >
> > On Wed, Jan 15, 2025 at 05:14:09PM +0800, Shengjiu Wang wrote:
> > > On Wed, Jan 15, 2025 at 4:33 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > >
> > > > Hi Shengjiu Wang,
> > > >
> > > > On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wrote:
> > > > > Hi Shengjiu Wang,
> > > > >
> > > > > On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > > > > > On Mon, Jan 13, 2025 at 5:54 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > > > > >
> > > > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > > > >
> > > > > > > Currently, the flags for the ACM clocks are set to 0. This configuration
> > > > > > > causes the fsl-sai audio driver to fail when attempting to set the
> > > > > > > sysclk, returning an EINVAL error. The following error messages
> > > > > > > highlight the issue:
> > > > > > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> > > > > > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > > > > >
> > > > > > The reason for this error is that the current clock parent can't
> > > > > > support the rate
> > > > > > you require (I think you want 11289600).
> > > > > >
> > > > > > We can configure the dts to provide such source, for example:
> > > > > >
> > > > > >  &sai5 {
> > > > > > +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > > > > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > > > > > +                       <&sai5_lpcg 0>;
> > > > > > +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> > > > > > +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> > > > > > +                                <722534400>, <45158400>, <11289600>,
> > > > > > +                               <49152000>;
> > > > > >         status = "okay";
> > > > > >  };
> > > > > >
> > > > > > Then your case should work.
> > > > > >
> > > > > > >
> > > > > > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
> > > > > >
> > > > > > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
> > > > > > the driver don't get an error from clk_set_rate().
> > > > >
> > > > > Thanks for the proposal, I will try it out tomorrow. Isn't this a
> > > > > problem if other SAIs use the same clock source but with different
> > > > > rates?
> > > > >
> > > > > If we have to define fixed rates in the DTS or else the clock driver
> > > > > will return an error, isn't that a problem? Maybe I should change the
> > > > > sai driver so that it ignores the failure and just takes the rate
> > > > > configured? In the end audio works, even if it can't set the requested
> > > > > rate.
> > > >
> > > > The following clock tree change would allow the driver to work
> > > > in our scenario:
> > > > &sai5 {
> > > >         assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > >                           <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>;
> > > >         assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
> > > >         assigned-clock-rates = <0>, <11289600>;
> > > > };
> > >
> > > In which we configure PLL_0 for 48KHz series (8kHz/16kHz/32kHz/48kHz),
> > > PLL_1 for 44kHz series (11kHz/22kHz/44kHz),
> > > which should fit for most audio requirements.
> > >
> > > >
> > > > However, this means we have to switch the parent clock to the audio pll
> > > > 1. For the simple setup with two SAIs, one for analog audio and one for
> > > > HDMI this wouldn't be a problem. But I'm not sure if this is a good
> > > > solution if a customer would add a third SAI which requires again a
> > > > different parent clock rate.
> > >
> > > We won't change the PLL's rate in the driver,  so as PLL_0 for 48kHz,
> > > PLL_1 for 44kHz,  even with a third SAI or more,  they should work.
> > >
> > > >
> > > > One potential solution could be that the SAI driver tries to first
> > > > derive the clock from the current parent and only if this fails it tries
> > > > to modify its parent clock. What do you think about this solution?
> > > >
> >
> > I did some more testing and I'm still not happy with the current
> > solution. The problem is that if we change the SAI5 mclk clock parent it
> > can either support the 44kHz series or the 48kHz series. However, in the
> > case of HDMI we do not know in advance what the user wants.
> >
> > This means when testing either this works:
> > speaker-test -D hw:2,0 -r 48000 -c 2
> > or this works:
> > speaker-test -D hw:2,0 -r 44100 -c 2
> > With:
> > card 2: imxaudiohdmitx [imx-audio-hdmi-tx], device 0: i.MX HDMI i2s-hifi-0 [i.MX HDMI i2s-hifi-0]
> 
> Are you using the setting below?  then should not either,  should both works
>  &sai5 {
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
>         status = "okay";
>  };

Sorry I didn't communicate that properly. Yes I was trying with these
settings but they do not work. The problem does not seem to be that the
driver can not adjust the rate for the audio (so e.g. 44kHz or 48kHz)
but that snd_soc_dai_set_sysclk in imx-hdmi.c fails with EINVAL. This
results in a call to fsl_sai_set_mclk_rate in fsl_sai.c with clk_id 1
(mclk_clk[1]) and a freq of 11289600 which causes the fail.
Interestingly, in fsl_sai_set_bclk we then only use clk_get_rate on
mclk_clk[0] which is set to audio_ipg_clk (rate 175000000) and we do not
use mclk_clk[1] anymore at all. This is why I'm not sure if this call to
snd_soc_dai_set_syclk is really necessary?

Regards,
Stefan

