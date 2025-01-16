Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80138E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMJuqVP9xZ6e824fp9u5ndERb9mrfeYm7csKDRij//w=; b=HyAOgRUlHbNvaY6v9RdtnDN7eX
	k3xMDBzTy35SfSpbpwbo7ycWDLJYGJicQmu75Cc1UolZdxf+5g0ehAfT3Yvs+t/hmAHO0qh24ySs0
	fhWqhZLJrx+3BxBWpeW8Eq02AWjca7L+VLfJUlDMTv1zRH/sWTSzefYPZGI/qXKGq0cZBIMi5CkZ2
	77F4JyQpPOaRcw6eA9EUk+mCTltaXsT2o0E/gkfgBYTb8z/sQn7G+cfA5lwhDGz+6iyy4pbtwNX8x
	IzgdvjERVWFHZUy3RiBf8E5Fgf6gBGT2/2DT6RyQbse4WphZoyBkt+UW4WTCr9zUtJjZC5vRwRamW
	1iDdQhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKMf-0000000E3aj-2c8h;
	Thu, 16 Jan 2025 07:32:29 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKLN-0000000E3Gz-3ByD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 07:31:10 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3ce6b289e43so5142395ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 23:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737012669; x=1737617469; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMJuqVP9xZ6e824fp9u5ndERb9mrfeYm7csKDRij//w=;
        b=ApbxBYLMFl/Fg2wkWbsYPkd1vh7wkRj2608Ml7SpX3jJdZeg/gimZWyfv+9hXwS/44
         vBgYgN+NJ0zKFjRNbm6HhQadkPzzxwlKPbu39l3yhENF+IpRewz8e3NPSw/bjW+7xvRV
         j4EB7ymJLwoyjtE4+5Fmn4sHAkKbuw8n5XJd2XiQ2+7aAJ0pzxyuOyXDHO1V/mdNtqwq
         /Tdf1/Nsp7if3Qnn3Anyo5AbEeW9fo8PdCOxMWqvulx/+EPj0mme1zzf9wa1XITeYRkV
         fllcXYvA09AbBTmrQJAGy6OYxxlyDSky1myQBwsXrQRb010rH165+8ARjdGy5gJP6sA6
         s/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012669; x=1737617469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMJuqVP9xZ6e824fp9u5ndERb9mrfeYm7csKDRij//w=;
        b=WF6AyMut9ZYXAijGgks/aExsaZQDRhy/Pk/0sZP1tXzLQNmnmlc0ld6BXvvCPzrQZH
         Iyn8oQaZCXBQ3RJrC8HJESp6kyQHrD9FvcKqqx8AWod9fXDB6DcX90+7Gf49EdR+x3vb
         SjyTZXi9nnuU9F9RJre71ul2hBFTqmXga33TpQbCKCOyLjOYEJlCmhMeKA1LC0TicC5P
         WJT301poJJUMHI8oDbbeYYNZBL3v+tBFmtjE0rAK+QPZoZ1Kzei7ay/O7t1IGYlh6HKp
         73RMprfj7wOtDGA54pKC4QnPt7erZLKVBD42iNyJBvSjuAYDLdOq3HM2Z49IB+IiQsJx
         9LrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU01cEtnR6OrwiHJIRo4YFcR2T+ll1ILbapWV+ssicIH9md88yPLMnYgRwaTheciGwMDtZyBcauzSksbnO+4AbH@lists.infradead.org
X-Gm-Message-State: AOJu0YwB3RmKYr0O4b3S3d1xrg5FaLDf6F7trdQAe1z3Ml4T6xgAZDbr
	v1gPVNkNPkdJv7IHB2LKZkrgq8QR/1KsUyLUDEihBBPDw1SbwMQctXTOwVqqXcgROCY1epkzee5
	69W9YJliu7nWieo9vLnHGBUnOeWA=
X-Gm-Gg: ASbGncuECHimz2Mlf/GGOyz7fiRXaVcYo557e6nZrZHFSicU0DEBimrVUREJKgnhNPb
	E0NsUNHh3NzgUN1bSepzFmSYgHK7B+ma/p73kzw==
X-Google-Smtp-Source: AGHT+IF1ff9iGSm6xVezEjJOvE+/T2WhT+6/CMhCEb6PEQNtT4EoujG5Cy/nW1Q6k5jX4nnbRMzMBCjMXcEqUJNCrm4=
X-Received: by 2002:a05:6e02:1d11:b0:3ce:7f88:1f50 with SMTP id
 e9e14a558f8ab-3ce7f88218bmr82643225ab.2.1737012668468; Wed, 15 Jan 2025
 23:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20250113094654.12998-1-eichest@gmail.com> <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop> <Z4dy3LiEAQ_gkQGG@eichest-laptop>
 <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com>
 <Z4eQX_VnBEVqxT_r@eichest-laptop> <CAA+D8APivJWD-AqwmQ-mtcr=ZHot5rfA8FRWF2+p-_mq5BGxHA@mail.gmail.com>
 <Z4i0G5Tw4q0v8DTL@eichest-laptop>
In-Reply-To: <Z4i0G5Tw4q0v8DTL@eichest-laptop>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 16 Jan 2025 15:30:55 +0800
X-Gm-Features: AbW1kvaGTG5piw6TJpqkEDtHRmvjOo9HK905H8DjWClafLXjlYSC7QR9I0a9tm8
Message-ID: <CAA+D8AOakQdnEe9ZrfTCrWcjHJRRU0kqFVsiu8+FMiHeMAVV_g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250115_233109_802223_1B285D5E 
X-CRM114-Status: GOOD (  52.54  )
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

On Thu, Jan 16, 2025 at 3:24=E2=80=AFPM Stefan Eichenberger <eichest@gmail.=
com> wrote:
>
> Hi Shengjiu Wang,
>
> On Thu, Jan 16, 2025 at 12:01:13PM +0800, Shengjiu Wang wrote:
> > On Wed, Jan 15, 2025 at 6:39=E2=80=AFPM Stefan Eichenberger <eichest@gm=
ail.com> wrote:
> > >
> > > On Wed, Jan 15, 2025 at 05:14:09PM +0800, Shengjiu Wang wrote:
> > > > On Wed, Jan 15, 2025 at 4:33=E2=80=AFPM Stefan Eichenberger <eiches=
t@gmail.com> wrote:
> > > > >
> > > > > Hi Shengjiu Wang,
> > > > >
> > > > > On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wro=
te:
> > > > > > Hi Shengjiu Wang,
> > > > > >
> > > > > > On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > > > > > > On Mon, Jan 13, 2025 at 5:54=E2=80=AFPM Stefan Eichenberger <=
eichest@gmail.com> wrote:
> > > > > > > >
> > > > > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > > > > >
> > > > > > > > Currently, the flags for the ACM clocks are set to 0. This =
configuration
> > > > > > > > causes the fsl-sai audio driver to fail when attempting to =
set the
> > > > > > > > sysclk, returning an EINVAL error. The following error mess=
ages
> > > > > > > > highlight the issue:
> > > > > > > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk=
 on 59090000.sai: -22
> > > > > > > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > > > > > >
> > > > > > > The reason for this error is that the current clock parent ca=
n't
> > > > > > > support the rate
> > > > > > > you require (I think you want 11289600).
> > > > > > >
> > > > > > > We can configure the dts to provide such source, for example:
> > > > > > >
> > > > > > >  &sai5 {
> > > > > > > +       assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>=
,
> > > > > > > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_=
CLK_PLL>,
> > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_=
CLK_SLV_BUS>,
> > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_=
CLK_MST_BUS>,
> > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_=
CLK_PLL>,
> > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_=
CLK_SLV_BUS>,
> > > > > > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_=
CLK_MST_BUS>,
> > > > > > > +                       <&sai5_lpcg 0>;
> > > > > > > +       assigned-clock-parents =3D <&aud_pll_div0_lpcg 0>, <&=
aud_rec1_lpcg 0>;
> > > > > > > +       assigned-clock-rates =3D <0>, <0>, <786432000>, <4915=
2000>, <12288000>,
> > > > > > > +                                <722534400>, <45158400>, <11=
289600>,
> > > > > > > +                               <49152000>;
> > > > > > >         status =3D "okay";
> > > > > > >  };
> > > > > > >
> > > > > > > Then your case should work.
> > > > > > >
> > > > > > > >
> > > > > > > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal tha=
t the ACM
> > > > > > >
> > > > > > > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. whic=
h will cause
> > > > > > > the driver don't get an error from clk_set_rate().
> > > > > >
> > > > > > Thanks for the proposal, I will try it out tomorrow. Isn't this=
 a
> > > > > > problem if other SAIs use the same clock source but with differ=
ent
> > > > > > rates?
> > > > > >
> > > > > > If we have to define fixed rates in the DTS or else the clock d=
river
> > > > > > will return an error, isn't that a problem? Maybe I should chan=
ge the
> > > > > > sai driver so that it ignores the failure and just takes the ra=
te
> > > > > > configured? In the end audio works, even if it can't set the re=
quested
> > > > > > rate.
> > > > >
> > > > > The following clock tree change would allow the driver to work
> > > > > in our scenario:
> > > > > &sai5 {
> > > > >         assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > > >                           <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CL=
K_PLL>;
> > > > >         assigned-clock-parents =3D <&aud_pll_div1_lpcg 0>;
> > > > >         assigned-clock-rates =3D <0>, <11289600>;
> > > > > };
> > > >
> > > > In which we configure PLL_0 for 48KHz series (8kHz/16kHz/32kHz/48kH=
z),
> > > > PLL_1 for 44kHz series (11kHz/22kHz/44kHz),
> > > > which should fit for most audio requirements.
> > > >
> > > > >
> > > > > However, this means we have to switch the parent clock to the aud=
io pll
> > > > > 1. For the simple setup with two SAIs, one for analog audio and o=
ne for
> > > > > HDMI this wouldn't be a problem. But I'm not sure if this is a go=
od
> > > > > solution if a customer would add a third SAI which requires again=
 a
> > > > > different parent clock rate.
> > > >
> > > > We won't change the PLL's rate in the driver,  so as PLL_0 for 48kH=
z,
> > > > PLL_1 for 44kHz,  even with a third SAI or more,  they should work.
> > > >
> > > > >
> > > > > One potential solution could be that the SAI driver tries to firs=
t
> > > > > derive the clock from the current parent and only if this fails i=
t tries
> > > > > to modify its parent clock. What do you think about this solution=
?
> > > > >
> > >
> > > I did some more testing and I'm still not happy with the current
> > > solution. The problem is that if we change the SAI5 mclk clock parent=
 it
> > > can either support the 44kHz series or the 48kHz series. However, in =
the
> > > case of HDMI we do not know in advance what the user wants.
> > >
> > > This means when testing either this works:
> > > speaker-test -D hw:2,0 -r 48000 -c 2
> > > or this works:
> > > speaker-test -D hw:2,0 -r 44100 -c 2
> > > With:
> > > card 2: imxaudiohdmitx [imx-audio-hdmi-tx], device 0: i.MX HDMI i2s-h=
ifi-0 [i.MX HDMI i2s-hifi-0]
> >
> > Are you using the setting below?  then should not either,  should both =
works
> >  &sai5 {
> > +       assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BU=
S>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BU=
S>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BU=
S>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BU=
S>,
> > +                       <&sai5_lpcg 0>;
> > +       assigned-clock-parents =3D <&aud_pll_div0_lpcg 0>, <&aud_rec1_l=
pcg 0>;
> > +       assigned-clock-rates =3D <0>, <0>, <786432000>, <49152000>, <12=
288000>,
> > +                                <722534400>, <45158400>, <11289600>,
> > +                               <49152000>;
> >         status =3D "okay";
> >  };
>
> Sorry I didn't communicate that properly. Yes I was trying with these
> settings but they do not work. The problem does not seem to be that the
> driver can not adjust the rate for the audio (so e.g. 44kHz or 48kHz)
> but that snd_soc_dai_set_sysclk in imx-hdmi.c fails with EINVAL. This
> results in a call to fsl_sai_set_mclk_rate in fsl_sai.c with clk_id 1
> (mclk_clk[1]) and a freq of 11289600 which causes the fail.
> Interestingly, in fsl_sai_set_bclk we then only use clk_get_rate on
> mclk_clk[0] which is set to audio_ipg_clk (rate 175000000) and we do not
> use mclk_clk[1] anymore at all. This is why I'm not sure if this call to
> snd_soc_dai_set_syclk is really necessary?
>

Could you please check if you have the below commit in your test tree?
35121e9def07 clk: imx: imx8: Use clk_hw pointer for self registered
clock in clk_parent_data

if not, please cherry-pick it.

The audio_ipg_clk can be selected if there is no other choice.
but the rate 175000000 is not accurate for 44kHz. what we got
is 44102Hz. This is the reason I don't like to use this source.

best regards
Shengjiu Wang

