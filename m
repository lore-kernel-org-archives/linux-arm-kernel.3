Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7E8CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdZgp8rFwisH6sL9hW06vie32Q/MJPgK1VmXTcKs3fA=; b=stL8p1vFsPersRT8sam5GrjiSL
	+yb/6pTr1E2V6wgQOGuwu67qds9asbti0tM+GcSZKkOSn4pUNlMW7M8WAFoAnNjkjLVVsnNoq3tHA
	+k9x+BpAg0AY6SlMsPPDyaDErrkO1KtnpkFB5uIaqGvR8ZuRreLl5f0bxP7XUdcRUhSXzOsEzTiNA
	iCKN4ANdsg1KLPIqybfa1EoXaoUA/PbV/KR2ad2IEaAl34jGWK72R2vLL2ePtwnPLCHEBn/v0bRdF
	bvJLIbUeRVQcyC+0FBS0SnRWt2Hg1TYZiPI5KhZTuDYWLk0RmpTgpksyy1RVPQyTIMqT2kAuGXtNd
	4n+05iEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKEV-0000000CDdQ-1n1U;
	Tue, 04 Nov 2025 16:50:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKES-0000000CDcs-43Pt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:50:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-429bccca1e8so2785771f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 08:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762275007; x=1762879807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdZgp8rFwisH6sL9hW06vie32Q/MJPgK1VmXTcKs3fA=;
        b=LiyX62gJVkr6GBJnL0OV2IpeMYRqsgHLW4tVWWFDZF4gbKJ/4CUSRCCP4drVr7dhPR
         h2QDLD0nT/K1EhXnRXvPDMQPw/mITJNIRu7qPvtuH0Q1FvJFZ5/BvOqusiY0JOLlX51+
         8zjrlT7lBOBYZWNwDgThBS1AQHi9mWUjRYCEHHcQZk1XAPRQNnMa/00/4sCKQp5dbGgn
         s/EPGSItVuDJmob+DQ2OefYhPz7cZ5lZIG8BS71OmFBQJ7k0Uz944OF8Q0n8Y0gL9HVy
         jI+06R7cFtZNBJIGFVzBIOuYvRba8WFbFYWFFFYlJ3/6nhESTmM13DxOyYhNNTTE7Inv
         SuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762275007; x=1762879807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdZgp8rFwisH6sL9hW06vie32Q/MJPgK1VmXTcKs3fA=;
        b=jGcjViV6FuRtw9fzVXnKHGgS5a7Jpb8hOZi18h06yoNZ50OVRtYFiJZFEcKMkpgVdR
         PSfVvXuqG9fCuZvhIpUqEdfd9RvcHypInwK8K5fqGJi9Od4KbZyyl+19dTZ4GCyjv5wZ
         pKjGZ8QPLkMk+bSH9HWvyr2I/ElxgaqNotI96Mseo4hRJHwGd7dvl9nCHXlTrNTLBFu3
         OWvWpvWLydpmZAcGOmSMcw1enOLBjk3+zjp0ouMulB/F22Qcfdr9x4C5GC7TVNG02B99
         J7iuE9d+Vnl4zl40p2060P+m/d/dLHx/16TUxPpFNx0ZUmyszRnGJLq4OIHU16JJYU8a
         ubgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVVPO974oUpXvy/xGu2JHPM1J/gG1xQIIfdEASsp4XaooCH5F7QWLMfShaXxfR4/P4T3Zg9U5rP2ottuLzdFsQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDbFwK4TZqi82SENVrs8Hnk+UQp1NOn5WTgPUvS3hWrKXYHtlF
	nQ5PsyoYpgZHWZfkO4+92AL0794Kcw5LAm1HlscjqKohjYhFKp8yYJji
X-Gm-Gg: ASbGnct6jSMafypoZDYG3o28TAF6Gwki6nGlCiDTB3PdwdufvBK/Ugg0rHib6R9+QZ+
	5vTwXT96QybiIpFVfv9or/ljXjDY5caxiQ0vRFZF8Ci3c9t2HHGZybGfdbkxMTMvrcoao7PUkyb
	RWZcqPc0N8iDwwt/n81lYYb8qkL5nvLRXRvu7RlvCoLANe2gAiVsjxZtVary33axdX8lOb9V+Gn
	PyHBxmPaxok+wStP8xVpgDKqtX541jirOYRJNidFum/hJu2vvchJ2eVYDDXvEeL9dwtZfIZ8C2a
	vW5iCg/rs8FcI0Q0cnyy/tqnHumMWxtZ13YEeLtug9MmqP5bLNrAhND7f8n4gphiVQglIMTht9s
	tZJ70Zv7hRbkya/qgzn33+drQCG9oGeWpTxzcZaD+n7qLQPpcaK/gqL1BMhZKtUDhaevn4vmX70
	82/p+dSao4DyGDEpdqO9CNA6YrDRK8MupXFdPNUW8rXpb9kSDqDJV4qZaPKTAmfrRPLEg=
X-Google-Smtp-Source: AGHT+IHsOmcFgrKN0VFuIMGhIpJEUqqSZDIXndB9GVdXwqoNi1GsBka2e33KfnMwqvPBDWre8Hxpqw==
X-Received: by 2002:a05:6000:186b:b0:429:ce81:fe2b with SMTP id ffacd0b85a97d-429ce82013amr7678935f8f.23.1762275006529;
        Tue, 04 Nov 2025 08:50:06 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f5be4sm5345170f8f.31.2025.11.04.08.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:50:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Tue, 04 Nov 2025 17:50:04 +0100
Message-ID: <5959058.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-27-jernej.skrabec@gmail.com>
 <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_085009_067705_80E16FA9 
X-CRM114-Status: GOOD (  25.45  )
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

Hi Chen-Yu,

Dne ponedeljek, 3. november 2025 ob 18:11:07 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > On DE2 and DE3, UI scalers are located right after VI scalers. So in
> > order to calculate proper UI scaler base address, number of VI scalers
> > must be known. In practice, it is same as number of VI channels, but it
> > doesn't need to be.
> >
> > Let's make a quirk for this number. Code for configuring channels and
> > associated functions won't have access to vi_num quirk anymore after
> > rework for independent planes.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
> >  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
> >  3 files changed, 18 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index 78bbfbe62833..f9131396f22f 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -708,6 +708,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixe=
r0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -718,6 +719,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixe=
r1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -729,6 +731,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0=
_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -740,6 +743,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer=
0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -751,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer=
1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -761,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer=
_cfg =3D {
> >         .ui_num =3D 1,
> >         .scaler_mask =3D 0x3,
> >         .scanline_yuv =3D 2048,
> > +       .vi_scaler_num  =3D 2,
> >         .ccsc =3D CCSC_MIXER0_LAYOUT,
> >         .mod_rate =3D 150000000,
> >  };
> > @@ -772,6 +778,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer=
0_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -783,6 +790,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer=
1_cfg =3D {
> >         .scaler_mask    =3D 0x1,
> >         .scanline_yuv   =3D 1024,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 0,
> >         .vi_num         =3D 1,
> >  };
> > @@ -794,6 +802,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixe=
r0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 4096,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -805,6 +814,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixe=
r1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -814,6 +824,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer=
0_cfg =3D {
> >         .mod_rate       =3D 600000000,
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 4096,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4=
i/sun8i_mixer.h
> > index def07afd37e1..40b800022237 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > @@ -178,6 +178,7 @@ enum sun8i_mixer_type {
> >   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
> >   * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
> >   *     Most DE2 cores has FCC. If number of VI planes is one, enable t=
his.
> > + * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
> >   * @map: channel map for DE variants processing YUV separately (DE33)
> >   */
> >  struct sun8i_mixer_cfg {
> > @@ -189,6 +190,7 @@ struct sun8i_mixer_cfg {
> >         unsigned int    de_type;
> >         unsigned int    scanline_yuv;
> >         unsigned int    de2_fcc_alpha : 1;
> > +       unsigned int    vi_scaler_num;
>=20
> This could be a smaller type. Please do a sweep of the struct after the
> refactoring is done and see if any of the types could be shrunk.

A lot of things can be stored in smaller type. However, making things small=
er
may be contraproductive. Structs are usually aligned for performance reason=
s,
so it won't save any memory and accessing them will use extra asm instructi=
ons
for zeroing out parts of CPU registers since registers are larger than used
data type.

>=20
> And just a nitpick, but I would probably insert it above scaler_mask.
>=20

Will do.

>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Thanks.

Best regards,
Jernej



