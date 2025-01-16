Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B2BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 04:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9M4SyKYooW3q4Dei0iCf9xE9Hjb2tN9dOmHlNyoAFI=; b=RkG/OKyDeNbR34r2xYhqkZ4iW6
	uS8Wd4nlLuLnBdk4rPdLRABZmSi/SYsudmSHAua/Ki+JAvcWzUUdYlo7fXiTfhnkpkayNiegyBWkA
	8W8TdxPw7pFjtsKTc3+4DgR6DNEUsJOuaeR0yHncST/iZ90uyBuL8lRs0c/lzGabGvuCmr68dSJel
	k6+nKYoxWt7IAHzBeKEicg+a4movuECCfr02pFDbNfVBTEzpw6V3Fk8HMvw+MJwOb/JpqxpzPRUWy
	usyhfbKbNht8nhnJHqIvoM9R6VgC2qKe0tmfl5L0HeLQseZXz1h3RnyoYFoZTQYPnzK0ioxO8kgGx
	QjictpsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYH5i-0000000DlmZ-2GiE;
	Thu, 16 Jan 2025 04:02:46 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYH4R-0000000DldL-3c3l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 04:01:29 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a813899384so1470545ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 20:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737000086; x=1737604886; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9M4SyKYooW3q4Dei0iCf9xE9Hjb2tN9dOmHlNyoAFI=;
        b=IyFBgQBcK1knR/8p3oUY5WjHvwZdRjwQyG/LRJcZi7VLy9iop8ceJLFy2Wl6F/EN87
         0Ghq1I6JP7tGtGZX4gHchRf/9LLn4sa/YUZ+df3hEHOd4OxqcAl80Zvh3pX/e8lof5zM
         UXCTqeSUo/ngOrQVLWxYeOPtC2NZCK+yyHxeCE028fLQdqdryJYldS817UiqZlY0miPc
         hhq3J+/wREfuNbiQYz9fee+H81d0K+5ITPIfR8kEJi90rZLLAuRwnh6lF1QyQjZmFpc5
         2oVCTciziws7RTZgCmjhGvN+2YBRvgxnqUnonbBVucLyiO6NZXlJERU1DTh/lvMq1K+n
         slEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737000086; x=1737604886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9M4SyKYooW3q4Dei0iCf9xE9Hjb2tN9dOmHlNyoAFI=;
        b=t/zmhpiOJ3Hk09tEjAqX7t3v8Op7J2s9kuc0CbZ8U456XdnXZeUX3cB/i0mTW8xtjT
         CcDuEyvLYx5yVdMn/aWX3OW9N069qyyfMe75hHzPgUWi12sOtYwM1DbLIRp63o6FbKUy
         73CxQ/ZY3GUvcAaVRhXGGV4GhFH3bzEDado0FxW9wWNVQex8DYJULlRN1BEHm2xIbqwp
         Vfxghc0bJtzuj0MAukENaMW6yae8xaOQ2oA84VXNYZAAyLp4pFu9A9M7dF1Xg35+gOVW
         3/RZeJZ//Ed/AnsOONu0VRCkyWoCdvNgB03ocUjYdx4LC/gVzoBLpWv+gZi9JaMwD+od
         V92g==
X-Forwarded-Encrypted: i=1; AJvYcCUk/7PSRQCMhjAvLPFP33fJ6Wk0+Xa1pdS051V3G4Wrl1qTD97duVE2BNy6254ftaqb3/vaFNlHG1HcDOKATixP@lists.infradead.org
X-Gm-Message-State: AOJu0YwKYfkrkOKM8lYD7Cwu8qnTugBXa6raCz85sLWKjPUTUuK6EryJ
	dP/BL6xVTrEP8nqoa0tHkDravkmpeMBJWIwAO0YEhy+F3+2AUNlur421k5A85vJH+kek99KAZuO
	vXu2AhsBpiBKiDwFk3I/b7bmT/Og=
X-Gm-Gg: ASbGncuTiMHufUI0FgsHLUmuQ1hRNVKMszNNykgmysQDztbj6KGqXBg5W07WF+gxb/p
	1k+24utdxA+7uuY65CrTb70+GduhmwxHiCbhyPA==
X-Google-Smtp-Source: AGHT+IHQyfRw5kKg9ivPpFGOXhquLee3vQrmRPw5XCpd5KhNgurc5hPjzNgvG44Ia/WHmiwvSs0BEBCDTkY0jsl8GJw=
X-Received: by 2002:a05:6e02:198a:b0:3ce:8cd1:f671 with SMTP id
 e9e14a558f8ab-3ce8cd1f9b5mr42766315ab.21.1737000086327; Wed, 15 Jan 2025
 20:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20250113094654.12998-1-eichest@gmail.com> <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop> <Z4dy3LiEAQ_gkQGG@eichest-laptop>
 <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com> <Z4eQX_VnBEVqxT_r@eichest-laptop>
In-Reply-To: <Z4eQX_VnBEVqxT_r@eichest-laptop>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 16 Jan 2025 12:01:13 +0800
X-Gm-Features: AbW1kvbQkp5AqMkITUkxczD4Jz0nXSdjZCCO560XBpLCP-4-Hn1eL6UeOWJMsWo
Message-ID: <CAA+D8APivJWD-AqwmQ-mtcr=ZHot5rfA8FRWF2+p-_mq5BGxHA@mail.gmail.com>
Subject: Re: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
To: Stefan Eichenberger <eichest@gmail.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com, 
	francesco.dolcini@toradex.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_200127_929441_2D995528 
X-CRM114-Status: GOOD (  52.86  )
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

On Wed, Jan 15, 2025 at 6:39=E2=80=AFPM Stefan Eichenberger <eichest@gmail.=
com> wrote:
>
> On Wed, Jan 15, 2025 at 05:14:09PM +0800, Shengjiu Wang wrote:
> > On Wed, Jan 15, 2025 at 4:33=E2=80=AFPM Stefan Eichenberger <eichest@gm=
ail.com> wrote:
> > >
> > > Hi Shengjiu Wang,
> > >
> > > On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wrote:
> > > > Hi Shengjiu Wang,
> > > >
> > > > On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > > > > On Mon, Jan 13, 2025 at 5:54=E2=80=AFPM Stefan Eichenberger <eich=
est@gmail.com> wrote:
> > > > > >
> > > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > > >
> > > > > > Currently, the flags for the ACM clocks are set to 0. This conf=
iguration
> > > > > > causes the fsl-sai audio driver to fail when attempting to set =
the
> > > > > > sysclk, returning an EINVAL error. The following error messages
> > > > > > highlight the issue:
> > > > > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on =
59090000.sai: -22
> > > > > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > > > >
> > > > > The reason for this error is that the current clock parent can't
> > > > > support the rate
> > > > > you require (I think you want 11289600).
> > > > >
> > > > > We can configure the dts to provide such source, for example:
> > > > >
> > > > >  &sai5 {
> > > > > +       assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > > > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_=
PLL>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_=
SLV_BUS>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_=
MST_BUS>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_=
PLL>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_=
SLV_BUS>,
> > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_=
MST_BUS>,
> > > > > +                       <&sai5_lpcg 0>;
> > > > > +       assigned-clock-parents =3D <&aud_pll_div0_lpcg 0>, <&aud_=
rec1_lpcg 0>;
> > > > > +       assigned-clock-rates =3D <0>, <0>, <786432000>, <49152000=
>, <12288000>,
> > > > > +                                <722534400>, <45158400>, <112896=
00>,
> > > > > +                               <49152000>;
> > > > >         status =3D "okay";
> > > > >  };
> > > > >
> > > > > Then your case should work.
> > > > >
> > > > > >
> > > > > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that th=
e ACM
> > > > >
> > > > > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which wi=
ll cause
> > > > > the driver don't get an error from clk_set_rate().
> > > >
> > > > Thanks for the proposal, I will try it out tomorrow. Isn't this a
> > > > problem if other SAIs use the same clock source but with different
> > > > rates?
> > > >
> > > > If we have to define fixed rates in the DTS or else the clock drive=
r
> > > > will return an error, isn't that a problem? Maybe I should change t=
he
> > > > sai driver so that it ignores the failure and just takes the rate
> > > > configured? In the end audio works, even if it can't set the reques=
ted
> > > > rate.
> > >
> > > The following clock tree change would allow the driver to work
> > > in our scenario:
> > > &sai5 {
> > >         assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > >                           <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PL=
L>;
> > >         assigned-clock-parents =3D <&aud_pll_div1_lpcg 0>;
> > >         assigned-clock-rates =3D <0>, <11289600>;
> > > };
> >
> > In which we configure PLL_0 for 48KHz series (8kHz/16kHz/32kHz/48kHz),
> > PLL_1 for 44kHz series (11kHz/22kHz/44kHz),
> > which should fit for most audio requirements.
> >
> > >
> > > However, this means we have to switch the parent clock to the audio p=
ll
> > > 1. For the simple setup with two SAIs, one for analog audio and one f=
or
> > > HDMI this wouldn't be a problem. But I'm not sure if this is a good
> > > solution if a customer would add a third SAI which requires again a
> > > different parent clock rate.
> >
> > We won't change the PLL's rate in the driver,  so as PLL_0 for 48kHz,
> > PLL_1 for 44kHz,  even with a third SAI or more,  they should work.
> >
> > >
> > > One potential solution could be that the SAI driver tries to first
> > > derive the clock from the current parent and only if this fails it tr=
ies
> > > to modify its parent clock. What do you think about this solution?
> > >
>
> I did some more testing and I'm still not happy with the current
> solution. The problem is that if we change the SAI5 mclk clock parent it
> can either support the 44kHz series or the 48kHz series. However, in the
> case of HDMI we do not know in advance what the user wants.
>
> This means when testing either this works:
> speaker-test -D hw:2,0 -r 48000 -c 2
> or this works:
> speaker-test -D hw:2,0 -r 44100 -c 2
> With:
> card 2: imxaudiohdmitx [imx-audio-hdmi-tx], device 0: i.MX HDMI i2s-hifi-=
0 [i.MX HDMI i2s-hifi-0]

Are you using the setting below?  then should not either,  should both work=
s
 &sai5 {
+       assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
+                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
+                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+                       <&sai5_lpcg 0>;
+       assigned-clock-parents =3D <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg =
0>;
+       assigned-clock-rates =3D <0>, <0>, <786432000>, <49152000>, <122880=
00>,
+                                <722534400>, <45158400>, <11289600>,
+                               <49152000>;
        status =3D "okay";
 };

best regards
Shengjiu Wang
>
> If I on the other hand avoid that fsl_sai_set_mclk_rate is called by
> patching imx-hdmi.c. I can make both rates work with the standard clock
> settings. So I wonder if calling snd_soc_dai_set_sysclk is really
> necessary for the i.MX8?
> diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
> index f9cec6f0aecd..7d8aa58645b7 100644
> --- a/sound/soc/fsl/imx-hdmi.c
> +++ b/sound/soc/fsl/imx-hdmi.c
> @@ -92,15 +92,6 @@ static int imx_hdmi_hw_params(struct snd_pcm_substream=
 *substream,
>         u32 slot_width =3D data->cpu_priv.slot_width;
>         int ret;
>
> -       /* MCLK always is (256 or 192) * rate. */
> -       ret =3D snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[=
tx],
> -                                    8 * slot_width * params_rate(params)=
,
> -                                    tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLO=
CK_IN);
> -       if (ret && ret !=3D -ENOTSUPP) {
> -               dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
> -               return ret;
> -       }
> -
>         ret =3D snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0, 2, slot_width);
>         if (ret && ret !=3D -ENOTSUPP) {
>                 dev_err(dev, "failed to set cpu dai tdm slot: %d\n", ret)=
;
>
> Regards,
> Stefan
>
>

