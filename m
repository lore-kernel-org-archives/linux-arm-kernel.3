Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E67FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 00:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwUdhzUcT/+g0Yt1m9YM5C5e54+Sg1OVGx+QoUxel7Y=; b=pl2g6HcsfBBC131Vg9oAtXqzwe
	bcDDZbPzSyWe2oVwQv81hl2emmaHxhj0JcnN/nv8vkswVIzHhRr8MHIprdD5Cw/drHqMH5MG4Qf40
	5dJR1nNjWt3amJE/HLAej4WQU41P50TKNXrAgQow/36m0xKHL7OmXvhs5+ypxiJbDf3YVYTPEVIbQ
	E8qBgDX+ahgfEbLVHhptpEmSGZuNsdYRQGTMFi7ml1uMGbaJqmBw/a0EXsTjy7EqwM0sZ17t/moB+
	tj9O1EWjwqhjRKWCfb6Cb0CKVsKGmthTOP9b8nAZqoypQBQnzNfSOShoj1GicVvCkdxRnzrcEYJ+1
	DOEyJlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb7c7-0000000DbUK-1fk7;
	Fri, 24 Jan 2025 00:31:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb7ap-0000000DbJE-3Ey1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 00:30:40 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53f757134cdso1753653e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 16:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737678632; x=1738283432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwUdhzUcT/+g0Yt1m9YM5C5e54+Sg1OVGx+QoUxel7Y=;
        b=aIcyQogkpIcFgemLmADF5sqWv3i9D8p59FX3tNaaN6kovATfgjGXSmzGPszqqapxjY
         61+uU695EzI26lEDmT0X9Jh6b+lvGJu/+Nzgmv6WqHtN0jCC2xUjslBBz0IUos6W3/sa
         wPyxNAdLO48E4pDeINxtGjnu5e6CM94GTktmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737678632; x=1738283432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwUdhzUcT/+g0Yt1m9YM5C5e54+Sg1OVGx+QoUxel7Y=;
        b=PwFkppghWN1aXp3yPvRVlpD+Eh1jbhTjNocMFh7xLfXF7nQcIy0qCPxk4jNVl7Wwge
         dQGlBV1uJLNEH5p4/+3IE1PQhMHpWoExRMz71oJ6dqXW1vkMMPusn28TenNLXtjdMqa5
         cFeH4YgIMXPw/0VeKd447Wz9y2GytbG+ieAxYpvjS+AAS/lnbzEZwdnWrg/1W/+wzx13
         hPG3iVe6htdB0sPopFEGuGwLWMCosJRHcq7yjmBuOvwey0kT+1+q9O3+8eqMrULmrJF9
         Alf4eIbTW2UfkyErucRLgKHElGEsDuiUuy8RwmtWnNcqiR/zmSAFhAb6FdQUZ+k5szyP
         jwBg==
X-Forwarded-Encrypted: i=1; AJvYcCURnB+3aJiH3T41kF2RybTI1jqkT/by/2pYMoMz97f6nLuDFbnEIXKGifaVyXIe1gI2DUXj22PPODjuaghyavbx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz69Ul1gJbwrZV/C6mOAByyJLmroYvORLwGUFjGrytbF5qyKR4m
	RiuZtOZJOrf6megXJaqeTQg28HYZ6kvgsQv709+JMfbTgOcxPCfKs+/i48Mea+UoOUMPJXILhTq
	TfQld
X-Gm-Gg: ASbGncsv71sh3Rx+MX1clSj0ahtOZrjfXtvAfYhj5PFh3aDntw6RzJh52UfnJebslcD
	Dt/MEfQn6JtXKtc7VfsksGupuSZlGo0f3HDjKtqXYSkc0VFRkKi6JVl91ZA/aV6Wxzqj+Q86SBY
	CjYkERyKSqz1h+GCyIqDPA/sC7BvC4lS1C7piL+dKbNX1nrsrluunLRYeDMhr9Hfj8+QlVg1NF0
	gab5VaLswn3VyS4vKDd4Vnk+uiYaL+c+o+peqM6HQlXr1/o+3QNbMnjRhdVS0hjSHPPSnqf6+X4
	RPWKTBNIY7W2VdvPtrRb4xJSz3BKdII4L54qeVO+WArf1R9CerAQCU2y9G8=
X-Google-Smtp-Source: AGHT+IEMvrpPL4YPsXb2oYKcC8c6UfVpEmyxI8vNjQWZg5akxCEyGn/ZSAwireu8NfOm4u/rw8BFDA==
X-Received: by 2002:ac2:490a:0:b0:540:3550:b1dd with SMTP id 2adb3069b0e04-5439c216bf9mr8928647e87.3.1737678631347;
        Thu, 23 Jan 2025 16:30:31 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8379984sm98311e87.183.2025.01.23.16.30.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 16:30:30 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30227c56b11so13683261fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 16:30:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXliJMwx74zrWgPtXTurENp8u8V7UHLEqOlgno9Gba2emPs12Afmw/UDxEG2tE/YnHWGVEaY3wEkYEUiTlueA0w@lists.infradead.org
X-Received: by 2002:a05:651c:1309:b0:300:3a15:8f0d with SMTP id
 38308e7fff4ca-3072cb284e5mr99531441fa.34.1737678628894; Thu, 23 Jan 2025
 16:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-13-damon.ding@rock-chips.com> <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
In-Reply-To: <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jan 2025 16:30:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKsA9fcq-LzGcYmgbMuMLUp5SMggpzBzZnvd3sxGf9BQ@mail.gmail.com>
X-Gm-Features: AWEUYZmXU1D9ya-D7zW5B92vNI1k79fpY-WVkms-sf4EzP7id3527uV9rKgvOPs
Message-ID: <CAD=FV=WKsA9fcq-LzGcYmgbMuMLUp5SMggpzBzZnvd3sxGf9BQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/14] drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
	l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	algea.cao@rock-chips.com, kever.yang@rock-chips.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_163039_803408_AAD069B3 
X-CRM114-Status: GOOD (  22.43  )
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

Hi,

On Thu, Jan 23, 2025 at 3:31=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Jan 23, 2025 at 06:07:45PM +0800, Damon Ding wrote:
> > The raw edid for LP079QX1-SP0V panel model is:
> >
> > 00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
> > 04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
> > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
> > 84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
> > 50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
> > 00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f
> >
> > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> Please use get_maintainers.pl when compiling To/Cc lists. Added Douglas
> to CC manually.
>
> Or, better, split irrelevant patches to separate series.
>
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index f8511fe5fb0d..77e3fd3ed160 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1808,6 +1808,12 @@ static const struct panel_delay delay_200_150_e5=
0 =3D {
> >       .enable =3D 50,
> >  };
> >
> > +static const struct panel_delay delay_50_500_e200 =3D {
> > +     .hpd_absent =3D 50,
> > +     .unprepare =3D 500,
> > +     .enable =3D 200,
> > +};

Wow, hpd_absent is 50ms. That's excellent!

I was curious if this was really correct since it's the lowest I've
seen, but I searched the internet and found a datasheet that confirms
it. Crazy. Although my datasheet has that whole section grayed out and
says "Measurement not available". How worried should be about that? I
guess if "hpd_absent" of 50 eventually doesn't work it can always be
increased.

Looking at that datasheet (assuming you can find the same one), I
wonder how you handle the T4 120ms requirement. It looks like that's
the time from tcon reset (which is nearly power on) until you're
allowed to put valid data on the panel. I _think_ you could meet the
requirement via setting `powered_on_to_enable` to 320 though, right?
...or maybe 335 to handle the maximum value of "tcon_reset" (no idea
how you control this signal). If I remember correctly (it's been a
while), things will already be clocking but outputting black when the
panel's "enable" function is called. After the function is called then
we'll turn on the backlight (and still outputting black) and
eventually we'll put valid data. So as long as you consider the
continued output of black as "valid data" then the timing diagram is
satisfied.

BTW: don't you also need a 200 ms "disable"?


> >  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id=
, _delay, _name) \
> >  { \
> >       .ident =3D { \
> > @@ -1955,6 +1961,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "M=
NB601LS1-1"),
> >       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB60=
1LS1-4"),
> >
> > +     EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP079=
QX1-SP0V"),

I don't love that the ID is 0x0000. That makes me nervous that the
panel vendor isn't setting the ID properly. ...but at least the string
matches in the EDID so hopefully that will be enough to uniquely
identify things.

