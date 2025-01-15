Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A36C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMGwxkrNU4EuX7kCK3KWCsT3+R0q8TNNOAL9QCORoDs=; b=A3ToFvhzfbxVP669l8zv48zMwI
	BnkuSM8L6svLKRKkzXJmtQK0uo7mzTUMqlddTz1x63t2LRZbACLgy3cX63FthsH51jsTib2NNas7l
	a0HZvmiRKzgEHB5QqXqpQEUkOeVWnjuxUvOUqefhvkNd/OuEmromt2vwtG0H+/pZim104yjn3AutL
	vVpavur9Ye7R1p9br44Rka7lyMNZqufAIO3EIGp9syex9aUJi/6/5mTAkGtNnudJ2uhbSNRjuwOcE
	6gNx7B0x7sAZIm7VcsAgBQnlF49cMBY5KV4khyxWqATMOepSIzTaJ4zhIvKseALbaVgPaPlLKu7NF
	tO2K212Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0s7-0000000BYDd-0eb5;
	Wed, 15 Jan 2025 10:43:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0o8-0000000BXXb-0QYt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:39:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38be3bfb045so412741f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 02:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736937570; x=1737542370; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dMGwxkrNU4EuX7kCK3KWCsT3+R0q8TNNOAL9QCORoDs=;
        b=RSi4ozivdjA7m8p6hMwpMToLeGebMqaHE94j4ncngniBLS9GyJ5vT+AvtiRxSLBEZT
         YNuoCRZ63mcC2xhoWHJwLVaLiwCDbpSPZ4HFr+Nsoocalnh5+8TgrMdb4FrZrJr1YFFD
         QJ3NqokjUf8cSoxt2OhH9VYrVW+vtsRbja6lfQrE5uAv1/GgUXb3G2YLVr003m975nxD
         XWAom6Dy+Dr+LzXnx3DQ/h6ima1mzFXovXPKsoSmpOHhxChgmsk/mLLJy4ztFg1lBdoJ
         o6Yi9yCKAPM+KL00w6mwzItUQQ/1oKPj41P9viS2tVqtL6JrPkvpVYHmV1EJYzpKaAuR
         z8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937570; x=1737542370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMGwxkrNU4EuX7kCK3KWCsT3+R0q8TNNOAL9QCORoDs=;
        b=IBvlIefkOlajS+IaLRHQ2/TBd7xB8JLKfwMbd16c23ylTXM9Wc/XUtY2yY1dfuibH1
         pRSrXgwjqTka5nHQMkgoR5XkRrRf8oLtDVcoQQfS1+i2kE9EAUXt3hdmEh9DRnc/o4DH
         44HR4vPFFGfD8EIpuM3IbTIwvBl6RIRgthdNcVuSxe/1Rce/nS1i9bYB/5RMlxwF+jJb
         8nUY5/4L6p4OYWX9BaK/HOt/natOGtEqyLRjTbEcFLQRKA1yNjs0EcOaw0mpU7RFiybq
         zTi/FD0L8vgZ9e1n4HrtkLY8P60ASPiKzp2KupHhKA+JLAugNfqQYZq9OoVWXpNlMEcn
         F2iw==
X-Forwarded-Encrypted: i=1; AJvYcCXCaF4cQSRnqvPk0UMrCLbgXUScCMDXPiFKIyGQuWrGo9eh7mFqYszz3RDAtLUONX19NZL40LIHfoHHVfoa5xwF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy41lNBXP08Bm7sDBC4hzcsdBCbvPGGNImdl1OX0W9a/UQiRkZ9
	OENrfhCdHcEUqKej+17z+jE0h2Y2auigd9LBPvUMVhMPci7HiH6O96lr2QFm
X-Gm-Gg: ASbGncupopbhbmObSQ6U/PaqYU7dqEieZgAc0os1W4S8MMmbbndjZjgraFV3iR5Tkdj
	MLJxw8wjTJjxWKj3ZYX7zB0M41MQTj45fEk/xZSq0n/SDZjx/qsGAWXL746pGRJ+NFER01wMbQv
	W19TtcxS++AQhR0utXRmrFGawZmH4Vn2CWpvyz5W/RsuxZKnYB1PrSjnZaGKivX2ZhUOV6ed/uM
	XxaHf1ciCcRX3qaFMoMk3zMR4a8eKuZ0ljVjqO+bc0oqxarZ8PtbF+GThoMr+5+mYOODx5P+DOa
	GpwAiRxW
X-Google-Smtp-Source: AGHT+IHOFTU9f4+9ieGESD+g8VrC92IkwfrseF/N43WFilUY2QDiHeaeuJlBZap4xY1mATLjrY8KLg==
X-Received: by 2002:a05:6000:2c1:b0:386:374b:e8bc with SMTP id ffacd0b85a97d-38a8b0d3425mr21291410f8f.15.1736937570162;
        Wed, 15 Jan 2025 02:39:30 -0800 (PST)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e5e69sm18287335e9.37.2025.01.15.02.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:39:29 -0800 (PST)
Date: Wed, 15 Jan 2025 11:39:27 +0100
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
Message-ID: <Z4eQX_VnBEVqxT_r@eichest-laptop>
References: <20250113094654.12998-1-eichest@gmail.com>
 <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop>
 <Z4dy3LiEAQ_gkQGG@eichest-laptop>
 <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_023932_159481_638B9FBD 
X-CRM114-Status: GOOD (  51.09  )
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

On Wed, Jan 15, 2025 at 05:14:09PM +0800, Shengjiu Wang wrote:
> On Wed, Jan 15, 2025 at 4:33 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> >
> > Hi Shengjiu Wang,
> >
> > On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wrote:
> > > Hi Shengjiu Wang,
> > >
> > > On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > > > On Mon, Jan 13, 2025 at 5:54 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > > > >
> > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > >
> > > > > Currently, the flags for the ACM clocks are set to 0. This configuration
> > > > > causes the fsl-sai audio driver to fail when attempting to set the
> > > > > sysclk, returning an EINVAL error. The following error messages
> > > > > highlight the issue:
> > > > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> > > > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > > >
> > > > The reason for this error is that the current clock parent can't
> > > > support the rate
> > > > you require (I think you want 11289600).
> > > >
> > > > We can configure the dts to provide such source, for example:
> > > >
> > > >  &sai5 {
> > > > +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > > > +                       <&sai5_lpcg 0>;
> > > > +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> > > > +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> > > > +                                <722534400>, <45158400>, <11289600>,
> > > > +                               <49152000>;
> > > >         status = "okay";
> > > >  };
> > > >
> > > > Then your case should work.
> > > >
> > > > >
> > > > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
> > > >
> > > > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
> > > > the driver don't get an error from clk_set_rate().
> > >
> > > Thanks for the proposal, I will try it out tomorrow. Isn't this a
> > > problem if other SAIs use the same clock source but with different
> > > rates?
> > >
> > > If we have to define fixed rates in the DTS or else the clock driver
> > > will return an error, isn't that a problem? Maybe I should change the
> > > sai driver so that it ignores the failure and just takes the rate
> > > configured? In the end audio works, even if it can't set the requested
> > > rate.
> >
> > The following clock tree change would allow the driver to work
> > in our scenario:
> > &sai5 {
> >         assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> >                           <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>;
> >         assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
> >         assigned-clock-rates = <0>, <11289600>;
> > };
> 
> In which we configure PLL_0 for 48KHz series (8kHz/16kHz/32kHz/48kHz),
> PLL_1 for 44kHz series (11kHz/22kHz/44kHz),
> which should fit for most audio requirements.
> 
> >
> > However, this means we have to switch the parent clock to the audio pll
> > 1. For the simple setup with two SAIs, one for analog audio and one for
> > HDMI this wouldn't be a problem. But I'm not sure if this is a good
> > solution if a customer would add a third SAI which requires again a
> > different parent clock rate.
> 
> We won't change the PLL's rate in the driver,  so as PLL_0 for 48kHz,
> PLL_1 for 44kHz,  even with a third SAI or more,  they should work.
> 
> >
> > One potential solution could be that the SAI driver tries to first
> > derive the clock from the current parent and only if this fails it tries
> > to modify its parent clock. What do you think about this solution?
> >

I did some more testing and I'm still not happy with the current
solution. The problem is that if we change the SAI5 mclk clock parent it
can either support the 44kHz series or the 48kHz series. However, in the
case of HDMI we do not know in advance what the user wants.

This means when testing either this works:
speaker-test -D hw:2,0 -r 48000 -c 2
or this works:
speaker-test -D hw:2,0 -r 44100 -c 2
With:
card 2: imxaudiohdmitx [imx-audio-hdmi-tx], device 0: i.MX HDMI i2s-hifi-0 [i.MX HDMI i2s-hifi-0]

If I on the other hand avoid that fsl_sai_set_mclk_rate is called by
patching imx-hdmi.c. I can make both rates work with the standard clock
settings. So I wonder if calling snd_soc_dai_set_sysclk is really
necessary for the i.MX8?
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index f9cec6f0aecd..7d8aa58645b7 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -92,15 +92,6 @@ static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
        u32 slot_width = data->cpu_priv.slot_width;
        int ret;

-       /* MCLK always is (256 or 192) * rate. */
-       ret = snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[tx],
-                                    8 * slot_width * params_rate(params),
-                                    tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN);
-       if (ret && ret != -ENOTSUPP) {
-               dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
-               return ret;
-       }
-
        ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0, 2, slot_width);
        if (ret && ret != -ENOTSUPP) {
                dev_err(dev, "failed to set cpu dai tdm slot: %d\n", ret);

Regards,
Stefan



