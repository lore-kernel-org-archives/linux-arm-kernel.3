Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FA8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adznCSzt6/ObIR64DLpghowThib8K3mkItVvxppG+i4=; b=bPWvpVco2mAXz5JxnAupWBZz50
	QS2lglU9l94ybuTK6xI5DxVO1bOZZWk9eQxKQt3utb2YtAyLpszFvETeFprzM8CgcZPIc++eamJOb
	ZVzhTztE0ZsgyAHotIeJzXoRSWgnXX/uDM78vNP6a+VT1mXRG1Nkv6o1+sG1xWevnM026yQc97qyJ
	8/DzuHxDwbEjVuqH2W0nhQ9pjTxnRs/XjPT2cFhnFSs97RY3tI2evnEQ7MzQhEYTF37k0LAlxrNLc
	4atq7l75RDDP3b3R72HWK05TuCZm9MiS1qLLxNthzUKHUXgJZIWW5AAtOD9hXmVM8IUGiWw8xP3Hu
	XMF9Tecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CFN-000000071ql-0X5i;
	Tue, 22 Apr 2025 11:57:05 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BN7-00000006rfR-3TXC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:01:03 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so4621005e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745319660; x=1745924460; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=adznCSzt6/ObIR64DLpghowThib8K3mkItVvxppG+i4=;
        b=KJ1GnqvLe6OpbbsfI0p3xhNYwn3ow3YnC1jS/akOObefXkmlP+hdMzfH9Zq60ARqUO
         T8yooTA8BQC08BJffrIzokFH8Sx8BJZXFZfzVWkyXVCvk1jaieu/AW3uT6Gjhv6hdF9I
         X/4cHvowh/OK2gQ3Qs+HGAczSxW2qpw5VdiVS+Kq3x2doeVZukxAkL+uyMyVkVKMBonT
         1kI92gZ8hOBW9Swmg6ecZYM2UzQGb3jJLLt7IWLiYabnsFT5fqhmcvZrgJ7P6u2SqK9l
         vjgdhoagI32sUFvzCjKKLR/NYlp7YzYGqyJ77VS2/6rfmglg+CySLt7JeHhvqk95SV6C
         GqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319660; x=1745924460;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adznCSzt6/ObIR64DLpghowThib8K3mkItVvxppG+i4=;
        b=egewlD7YQ4k6IQKWDNA3+Zu5pLkSx7A/uBHEPUsyxI2TFf8F5zI6nyk+vMpBUq07Ex
         wtuAyMNWlKCe6wL++WmYXW2oQ9lFpnGSMc/W5oN3vMCCvHmr3aiu7fpNJAsW1XH+GX3a
         tbJ7bwyFXXv9UlYkBGTT+2x78UxGFQ9PYD2LkU8dQ2igNjj7aW/6Q4Fi2IaF3fZLZjbu
         4860r7BR4XLPXPRVn1etYU6kfOq5+gTbG0njy0jMIwLbZHJ0chohwDIrFJhEPNokrAhd
         tJYzVtnfrPG0loZpcGxMTnhyGBeA/0QJ9mtL9LwAX4pJjz/ZdfE9MqGUY7vKRGowexSb
         v6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwcZJp9+TS0Rxx1ASgSM+dzN/0WQDQUI2iU4x5Ow9GAl326fAlheaReb9a5gzM9wx8WYFYvN2GrDxUGuvvnNTJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9doFU7cOekbLMA+LwlhYnsv2t90ReI2iwOOwWIfUPNMy515qW
	puiPs1IW7kt9fLfsDoNIDoTPmo8hbdgM0PFBmylh76+wjeqpbNRH
X-Gm-Gg: ASbGncvbVi19qMIDPOLhPwrlUb+WNke4GeIM9j6U4MDjcSCnY+vS5PsImggGVyXy8Sy
	8K6NxAzLeKjFGKVwS7NHTlEVOvSkTg8Mqz3en6SYFuJVFUEl4oF0VYGLnJZqIugop3MfDMNgkwv
	qmZugKecsqnf/2Xu6gkm95GXIjEq1CJD7khnMSOM4yjK0A2sp9f3fcAfIUzz2crHJbkXRCGN4ij
	fNRuRd0KdpYqbfm0EDfOlD0q0XC/vlQut/NOtvKHYBj15EbS0nq3/oMqOuQGyCUiu5ojJC9gym2
	RYTl2tLlZ7sh5fZrCvYU1Cm71mmA8yHbuVs=
X-Google-Smtp-Source: AGHT+IFH64vXs9Z5X8ld0XCbJzZBtq7/amrOMDyGpsZmNyKsL64xji9OCrx+VWMHCuN/8oW9/SI1qQ==
X-Received: by 2002:a05:6512:a87:b0:549:6451:7e76 with SMTP id 2adb3069b0e04-54d6e636f1amr4372571e87.33.1745319659226;
        Tue, 22 Apr 2025 04:00:59 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e51a8sm1166450e87.178.2025.04.22.04.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:00:58 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:00:55 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250422140055.64b98cc1@eldfell>
In-Reply-To: <CAMuHMdUcG_K=5RHMaq9vTpQo8dPpLAvXfxP8XuzGnx4Nte7++A@mail.gmail.com>
References: <20250327112009.6b4dc430@eldfell>
	<b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
	<20250327175842.130c0386@eldfell>
	<CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
	<20250331105446.098f0fbe@eldfell>
	<20250331082135.GB13690@pendragon.ideasonboard.com>
	<20250331135337.61934003@eldfell>
	<20250401162732.731ef774@eldfell>
	<73bd6628-374d-417f-a30f-88a4b1d157bb@ideasonboard.com>
	<20250417111315.62a749e5@eldfell>
	<20250421145039.GA19213@pendragon.ideasonboard.com>
	<20250422121107.572cb7ad@eldfell>
	<CAMuHMdX+yaw_PYsM_N8Gzrt2hbn_5cRN375jLKpwE13ygTvwHA@mail.gmail.com>
	<20250422130137.2658c646@eldfell>
	<CAMuHMdUcG_K=5RHMaq9vTpQo8dPpLAvXfxP8XuzGnx4Nte7++A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kwn83vJATXbqj.Xg.12U9HC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_040101_875404_40CDF08D 
X-CRM114-Status: GOOD (  65.11  )
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

--Sig_/Kwn83vJATXbqj.Xg.12U9HC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Apr 2025 12:12:21 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Pekka,
>=20
> On Tue, 22 Apr 2025 at 12:01, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > On Tue, 22 Apr 2025 11:41:29 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote: =20
> > > On Tue, 22 Apr 2025 at 11:11, Pekka Paalanen
> > > <pekka.paalanen@haloniitty.fi> wrote: =20
> > > > On Mon, 21 Apr 2025 17:50:39 +0300
> > > > Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote: =20
> > > > > On Thu, Apr 17, 2025 at 11:13:15AM +0300, Pekka Paalanen wrote: =
=20
> > > > > > On Wed, 16 Apr 2025 11:59:43 +0300 Tomi Valkeinen wrote: =20
> > > > > > > On 01/04/2025 16:27, Pekka Paalanen wrote: =20
> > > > > > > > On Mon, 31 Mar 2025 13:53:37 +0300 Pekka Paalanen wrote: =20
> > > > > > > >> On Mon, 31 Mar 2025 11:21:35 +0300 Laurent Pinchart wrote:=
 =20
> > > > > > > >>> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen =
wrote: =20
> > > > > > > >>>> On Thu, 27 Mar 2025 17:35:39 +0100 Geert Uytterhoeven wr=
ote: =20
> > > > > > > >>>>> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen wrote: =20
> > > > > > > >>>>>> On Thu, 27 Mar 2025 16:21:16 +0200 Tomi Valkeinen wrot=
e: =20
> > > > > > > >>>>>>> On 27/03/2025 11:20, Pekka Paalanen wrote: =20
> > > > > > > >>>>>>>> On Wed, 26 Mar 2025 15:55:18 +0200 Tomi Valkeinen wr=
ote: =20
> > > > > > > >>>>>>>>> On 26/03/2025 15:52, Geert Uytterhoeven wrote: =20
> > > > > > > >>>>>>>>>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen wrote=
: =20
> > > > > > > >>>>>>>>>>> Add greyscale Y8 format.
> > > > > > > >>>>>>>>>>>
> > > > > > > >>>>>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@lina=
ro.org>
> > > > > > > >>>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ide=
asonboard.com> =20
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> Thanks for your patch!
> > > > > > > >>>>>>>>>> =20
> > > > > > > >>>>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > > > > >>>>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > > >>>>>>>>>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > > > > >>>>>>>>>>>     #define DRM_FORMAT_YUV444      fourcc_code('Y=
', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > > > > >>>>>>>>>>>     #define DRM_FORMAT_YVU444      fourcc_code('Y=
', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > > > > >>>>>>>>>>>
> > > > > > > >>>>>>>>>>> +/* Greyscale formats */
> > > > > > > >>>>>>>>>>> +
> > > > > > > >>>>>>>>>>> +#define DRM_FORMAT_Y8          fourcc_code('G', =
'R', 'E', 'Y')  /* 8-bit Y-only */ =20
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> This format differs from e.g. DRM_FORMAT_R8, which=
 encodes
> > > > > > > >>>>>>>>>> the number of bits in the FOURCC format. What do y=
ou envision
> > > > > > > >>>>>>>>>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1'=
, '6')? =20
> > > > > > > >>>>>>>>>
> > > > > > > >>>>>>>>> I wanted to use the same fourcc as on V4L2 side. St=
rictly speaking it's
> > > > > > > >>>>>>>>> not required, but different fourccs for the same fo=
rmats do confuse.
> > > > > > > >>>>>>>>>
> > > > > > > >>>>>>>>> So, generally speaking, I'd pick an existing fourcc=
 from v4l2 side if
> > > > > > > >>>>>>>>> possible, and if not, invent a new one. =20
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> what's the actual difference between DRM_FORMAT_R8 a=
nd DRM_FORMAT_Y8?
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> Is the difference that when R8 gets expanded to RGB,=
 it becomes (R, 0,
> > > > > > > >>>>>>>> 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y)=
 where c1..c3 are
> > > > > > > >>>>>>>> defined by MatrixCoefficients (H.273 terminology)?
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> That would be my intuitive assumption following how =
YCbCr is handled.
> > > > > > > >>>>>>>> Is it obvious enough, or should there be a comment t=
o that effect? =20
> > > > > > > >>>>>>>
> > > > > > > >>>>>>> You raise an interesting point. Is it defined how a d=
isplay driver, that
> > > > > > > >>>>>>> supports R8 as a format, shows R8 on screen? I came i=
nto this in the
> > > > > > > >>>>>>> context of grayscale formats, so I thought R8 would b=
e handled as (R, R,
> > > > > > > >>>>>>> R) in RGB. But you say (R, 0, 0), which... also makes=
 sense. =20
> > > > > > > >>>>>>
> > > > > > > >>>>>> That is a good question too. I based my assumption on =
OpenGL behavior
> > > > > > > >>>>>> of R8.
> > > > > > > >>>>>>
> > > > > > > >>>>>> Single channel displays do exist I believe, but being =
single-channel,
> > > > > > > >>>>>> expansion on the other channels is likely meaningless.=
 Hm, but for the
> > > > > > > >>>>>> KMS color pipeline, it would be meaningful, like with =
a CTM.
> > > > > > > >>>>>> Interesting.
> > > > > > > >>>>>>
> > > > > > > >>>>>> I don't know. Maybe Geert does? =20
> > > > > > > >>>>>
> > > > > > > >>>>> I did some digging, and was a bit surprised that it was=
 you who told
> > > > > > > >>>>> me to use R8 instead of Y8?
> > > > > > > >>>>> https://lore.kernel.org/all/20220202111954.6ee9a10c@eld=
fell =20
> > > > > > > >>>>
> > > > > > > >>>> Hi Geert,
> > > > > > > >>>>
> > > > > > > >>>> indeed I did. I never thought of the question of expansi=
on to R,G,B
> > > > > > > >>>> before. Maybe that expansion is what spells R8 and Y8 ap=
art?
> > > > > > > >>>>
> > > > > > > >>>> I do think that expansion needs to be specified, so that=
 the KMS color
> > > > > > > >>>> pipeline computations are defined. There is a big differ=
ence between
> > > > > > > >>>> multiplying these with an arbitrary 3x3 matrix (e.g. CTM=
):
> > > > > > > >>>>
> > > > > > > >>>> - (R, 0, 0)
> > > > > > > >>>> - (R, R, R)
> > > > > > > >>>> - (c1 * Y, c2 * Y, c3 * Y) =20
> > > > > > > >>>
> > > > > > > >>> I'd be very surprised by an YUV to RGB conversion matrix =
where the first
> > > > > > > >>> column would contain different values. What we need to ta=
ke into account
> > > > > > > >>> though is quantization (full vs. limited range). =20
> > > > > > > >
> > > > > > > > Quantization range is indeed good to note. R8 would be alwa=
ys full
> > > > > > > > range, but Y8 would follow COLOR_RANGE property.
> > > > > > > > =20
> > > > > > > >> That makes Y8 produce (Y, Y, Y), and we have our answer: R=
8 should be
> > > > > > > >> (R, 0, 0), so we have both variants.
> > > > > > > >>
> > > > > > > >> Can we specify Y, R, G and B be nominal values in the rang=
e 0.0 - 1.0
> > > > > > > >> in the KMS color processing? =20
> > > > > > > >
> > > > > > > > I think this 0.0 - 1.0 nominal range definition for the abs=
tract KMS
> > > > > > > > color processing is necessary.
> > > > > > > >
> > > > > > > > It also means that limited range Y8 data, when containing v=
alues 0-15
> > > > > > > > or 240-255, would produce negative and greater than 1.0 val=
ues,
> > > > > > > > respectively. They might get immediately clamped to 0.0 - 1=
.0 with the
> > > > > > > > first color operation they face, though, but the concept se=
ems
> > > > > > > > important and carrying over to the new color pipelines UAPI=
 which might
> > > > > > > > choose not to clamp. =20
> > > > > > >
> > > > > > > Is the behavior of values outside the limited range something=
 that needs
> > > > > > > to be defined? We can't know how each piece of HW behaves with
> > > > > > > "undefined" input, so should we not just define the behavior =
as platform
> > > > > > > specific? =20
> > > > > >
> > > > > > Hi Tomi,
> > > > > >
> > > > > > it's not undefined nor illegal input in general. The so-called
> > > > > > sub-black and super-white ranges exist for a reason, and they a=
re
> > > > > > intended to be used in video processing to avoid clipping in
> > > > > > intermediate processing steps when a filter overshoots a bit. T=
here are
> > > > > > also practices that depend on them, like PLUGE calibration with
> > > > > > traditional signals on a display: https://www.itu.int/rec/R-REC=
-BT.814
> > > > > >
> > > > > > I think it would be really good to have defined behaviour if at=
 all
> > > > > > possible.
> > > > > > =20
> > > > > > > In any case: I can't say I fully understood all the discussio=
ns wrt.
> > > > > > > color spaces. But my immediate interest is, of course, this s=
eries =3D).
> > > > > > > So is there something that you think should be improved here?=
 =20
> > > > > >
> > > > > > Right, the range discussion is a tangent and applies to all YUV
> > > > > > formats, so it's not a new question.
> > > > > > =20
> > > > > > > My understanding is that the Y-only pixel formats behave in a=
 well
> > > > > > > defined way (or, as well defined as the YUV formats), and the=
re's
> > > > > > > nothing more to add here. Is that right? =20
> > > > > >
> > > > > > There are two things:
> > > > > >
> > > > > > - Y8 follows COLOR_RANGE property, just like all other YUV form=
ats.
> > > > > > - Y8 implies that Cb and Cr are both neutral (0.0 in nominal va=
lues).
> > > > > >
> > > > > > I'd like these explicitly written down, so that they become obv=
ious to
> > > > > > everyone. I suspect either one might be easy to forget when wri=
ting
> > > > > > code and taking shortcuts without thinking.
> > > > > >
> > > > > >
> > > > > > Laurent,
> > > > > >
> > > > > > I did find a case where (Y', neutral, neutral) does *not* seem =
to expand
> > > > > > to RGB=3D(Y, Y, Y): ICtCp. The conversion from ICtCp to L'M'S' =
does
> > > > > > produce (Y', Y', Y'), but the LMS-to-RGB matrix scrambles it.
> > > > > >
> > > > > > I didn't dig through BT.2020 constant-luminance Y'C'bcC'rc, but=
 I
> > > > > > wouldn't be surprised if it scrambled too.
> > > > > >
> > > > > > Of course, both of the above are not just one matrix. They requ=
ire two
> > > > > > matrices and the transfer characteristic each to compute. KMS c=
olor
> > > > > > operations cannot implement those today, but with the colorop p=
ipelines
> > > > > > they will if the hardware does it.
> > > > > >
> > > > > > That's why I think it's important to document the assumption of=
 Cb and
> > > > > > Cr when not part of the pixel format, and not write down a spec=
ific
> > > > > > expansion to RGB like (Y, Y, Y). =20
> > > > >
> > > > > Every time I discuss color spaces, the scopes of "RGB" and "YUV" =
seem to
> > > > > expand more and more. This makes me wonder how we define those two
> > > > > concepts. Taking the conversion from RGB to ICtCp as an example, =
would
> > > > > you consider LMS and L'M'S' as "RGB" formats, and ICtCp as a "YUV"
> > > > > format ? =20
> > > >
> > > > sorry for the confusion. In this specific context, my use of RGB and
> > > > YUV refers to the channels in DRM pixel formats. It might have been
> > > > better if all channels in all pixel formats were "anonymous" and me=
rely
> > > > numbered because all formats can be used for any color model, but t=
his
> > > > is what we have.
> > > >
> > > > There is some disambiguation in
> > > > https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/pix=
els_color.md
> > > > The doc is some years old, so nowadays I might phrase things
> > > > differently, but maybe it's easier to read for those new to things =
as I
> > > > wrote it when I was just learning things.
> > > >
> > > > I would classify ICtCp in the YUV pixel format category, because the
> > > > CtCp plane can be sub-sampled (right?). I would classify LMS and L'=
M'S'
> > > > in the RGB pixel format category because they are not sub-sampled A=
FAIK
> > > > although they also do not actually appear as buffer contents, so the
> > > > relation to pixel formats is... theoretical.
> > > >
> > > > IOW, we have a completely artificial split of DRM pixel formats to =
RGB
> > > > and YUV where the only essential difference is that YUV formats can=
 have
> > > > sub-sampled variants and RGB formats do not. =20
> > >
> > > RGB can be subsampled, too...
> > > https://en.wikipedia.org/wiki/Bayer_filter =20
> >
> > That's true. What difference are we left with, then? =20
>=20
> RGB contains three monochromatic color channels (which may differ from
> Red, Green, and Blue, cfr. truncated RGn and Rn formats).
> YUV contains one luminance and two chrominance channels.

I think I get what you mean. RGB are directly related to the power of
each of the primary emitters in a display. YUV OTOH carries the overall
luma and the difference from neutral (chroma) signals. This difference
is the difference between color models.

Monochromatic is not the right word here, unless you explicitly refer
to the primaries of BT.2020 which are laser-like. Most display
primaries are far from monochromatic. The closer to monochromatic
display primaries get, the more pronounced the differences between
color vision in people become, even if the people were all classified
as having normal color vision.


Thanks,
pq

> > We have DRM pixel formats which imply some color model, but do not
> > define the variant of each color model (e.g. the Y'CbCr-to-RGB matrix).
> >
> > I guess the implied color model then implies which API, e.g. KMS plane
> > property, is responsible for defining the variant. =20
>=20
> Probably (IANADX --- I Am Not A Drm eXpert ;-)
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20


--Sig_/Kwn83vJATXbqj.Xg.12U9HC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgHducACgkQI1/ltBGq
qqdsVw/+I1+c1XyKLq5zWTTprkIbh1pWtF3P+AXhaNHju8KEA5fQeIRTDfVryjxE
wFXZpjE3UN2ubfYl2DTlcIiSlxfg81HsklTouM0v11gkqCMCtYzCKKQYI6Ntr51p
CF0TnlC5oJzzWZmc5Yk641UhygE+ZeY6SiiLZqqVChcXndYz/Ga0q7pGsPXeIANV
S+Kgz0m+o/kGKUgFIh+QCNsvhhCxA6kWKOKPsdjZVSfzD+IQ1S3hpcGYvSr7Jye6
TPzMwsC43PZp7jmdhHLeDZVSKSQeva3eYvoO86hPOQ6vUegAcUjOGsABpgYtiBul
cfL2ZDKDneJUsh51icIIAcUyWvb/8fyy85kXjKThm2ojGSwrq4QlRZXZ3xOTnTBE
3tpouf0rrVv4Wi+kKzUVPmfbMCrNgjEO5/+RoCpCueLwbWhu/LqQzsdPZjkWrO1X
tfdnDqhMRQnIJfHl5eg838HuVjNxn4gLp1YXBV5iku4IOA4v4UZXL1LDqubx+5fv
3Eivrc1VvjjETuWuq4ZwKQjmlW3Ttsrnwtf0tQRmsl0gXSGaHLY3G/898pdbFif9
lREZC9NPyV0/VYfPuToiwwZR8A/jd2XEt0DmA+tXN/+oie7fOM4PmIHA7Og037RD
J9Bi/xgIFvmVxqleKn+u+tJftKPmJAoLyJnNHJ78lKiu1LVm4xE=
=Ls/K
-----END PGP SIGNATURE-----

--Sig_/Kwn83vJATXbqj.Xg.12U9HC--

