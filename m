Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6621DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58Hs7ujjh5IWuk6tWQ5BGXRroK3g4h67KngS4jQYbOk=; b=sF3vhu+NlPYssrRbD9ohYVE1th
	fbpo5psqSAXluse0F5sf7GWyDq5yfkqhB8iUQkwc8I8c/4YUJCi6SkFfJMFBCWNEvDp1TQu26kCtD
	kkEf+YTOCpPJtYvRLo0na7X0bk3BoaQAUNET0PBqqCnR48NToHzH0etWbzVUAU+YHJqYG+p2lSFwt
	g9zpmiGS1hLV2us5tcwYyBB6hjHIgl7EYq/K2fiaFEsStSWS4hU3UfBff5xviexoTV1moYmQKdq4A
	Yf2N2j/yyW+oDEzzPFU7MIxlr1Wltzy8O3q6x/51K0AJxtdAgWTfvRP+Rf95D23NvLG1iaU/u0Ka8
	7P/+S44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY46D-0000000C4xw-0lLD;
	Wed, 15 Jan 2025 14:10:25 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY44Q-0000000C4gA-2KMH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:08:35 +0000
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467a1ee7ff2so62548021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950112; x=1737554912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58Hs7ujjh5IWuk6tWQ5BGXRroK3g4h67KngS4jQYbOk=;
        b=A6DdiabrX274jwbrR93QkpGGF2lloUB/dvlIJEBLl+lQk5eSxOgLxIF+9VkYsS31Ei
         0s+6tqQFbr2XoW2quaw+9ia5tvtHye1DRzUud3ZcVq4Yv1bmiOZNfwUSjEqoHkyj3qk8
         OBZvGKBA3tUVDd6QXRqj1aHcJ6YiLHS8KCMl5kmFBdWqa7Tf1GoMB0YWU8ltwfjbOIQZ
         haT2uYhQQ/yGiWISbE4G3gjyL+fWgDieBQnuC/exT3gtHsTBHJyUihg5lg+51Nbv3Y0X
         op1NtQesyFGqA7zOEmlmJJM6uSnd7F35PAoc81KJ+FPeJYHluR41Hs7PVuD2C8qYH9ph
         cI1g==
X-Forwarded-Encrypted: i=1; AJvYcCXglzgMvUCMHprv/FOOwhqhgcYbtTQfLWjwWtDCOKNBTDo/HghOE1ouFSAojUI04PWNaaB/6/WYhNOb4hHKZP6v@lists.infradead.org
X-Gm-Message-State: AOJu0YwHlAEP+bGfO9izeKmSPRqttRwKQJQqy4yuN38sMA6m0qqpXQqU
	HKGiiWLH+oKJhNyAhwH+ZLd3RnvUcTVkORlYEuUx08ZHK4O0Wy/uC03Ki4oinb0=
X-Gm-Gg: ASbGnctKo6ag6MhQ8nTbsMshWHokZCt7sR2YdzFpMkr9ptppj+P9Qwdq6GUSXmNIHV6
	HgDeDK1iiy5VtjOHq0D0hJJotq4nTwzsmLlhG9veb61jdtKFIfNw1MsUPi38YeuJqt5sDJw2u+t
	FEX2cQ03jJz96j8Ky/w8L3zLIhNdwgwZPUn9K3tKobcXEBU9IAQNbj8BC7t+4x7if2DEK/vr4dN
	TtBfOTcOinWlxG86uc2hdBUQkDNS1f0ozpIBfhaA1ZqNuFqk/rLYIKd6kW1utG69tevrcNM8BA5
	pTo5cko9T0ximXAQanU=
X-Google-Smtp-Source: AGHT+IE20Poi5yS+wJpEPYgEXYn52St28fBAJvlPy5q4l6oofVoQ3vj7nwM05ViW9CrF0BDehyJ4MQ==
X-Received: by 2002:ac8:5fd1:0:b0:466:9f89:3d6b with SMTP id d75a77b69052e-46c7101d9e4mr382030781cf.24.1736950111955;
        Wed, 15 Jan 2025 06:08:31 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8623154b104sm5739414241.28.2025.01.15.06.08.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:08:31 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so1978892137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:08:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVleZXbcWQ/VfxqrSPGGewnjOc++EthudO5nVrgxa1X1SsEmJf8cdcMwSp/CGaDkL8lDDdjF7NcVqle8GXZoma2@lists.infradead.org
X-Received: by 2002:a05:6102:2b81:b0:4b2:48ef:3cf2 with SMTP id
 ada2fe7eead31-4b3d0fe7048mr26300112137.25.1736950111112; Wed, 15 Jan 2025
 06:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
 <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com> <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
 <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com> <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
 <0b0decd1-6f19-424a-84e5-fc71dceb983c@ideasonboard.com>
In-Reply-To: <0b0decd1-6f19-424a-84e5-fc71dceb983c@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 15:08:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrdV4YRo1nMCVMTga=M+16GT8GkWe+Rk1DkgDZ=abGag@mail.gmail.com>
X-Gm-Features: AbW1kvbfHY4o6YUlFdSWBdaxCXiUM6a4Ff7ECBd3ODRgMUDlTT_h_eEcP0lG6gE
Message-ID: <CAMuHMdXrdV4YRo1nMCVMTga=M+16GT8GkWe+Rk1DkgDZ=abGag@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/fourcc: Add DRM_FORMAT_Y10_LE32
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_060834_593822_00BD921F 
X-CRM114-Status: GOOD (  36.61  )
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

Hi Tomi,

On Wed, Jan 15, 2025 at 2:46=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/01/2025 14:52, Geert Uytterhoeven wrote:
> > On Wed, Jan 15, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/01/2025 14:33, Geert Uytterhoeven wrote:
> >>> On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Tomi Valkeinen
> >>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
> >>>>> On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
> >>>>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>>>> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
> >>>>>> 32-bit container.
> >>>>>>
> >>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>>>
> >>>>> Thanks for your patch!
> >>>>>
> >>>>>> --- a/include/uapi/drm/drm_fourcc.h
> >>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> >>>>>> @@ -408,6 +408,7 @@ extern "C" {
> >>>>>>     /* Greyscale formats */
> >>>>>>
> >>>>>>     #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')=
  /* 8-bit Y-only */
> >>>>>> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /=
* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
> >>>>>
> >>>>> R10_LE32? Or R10_PA4?
> >>>>
> >>>> Can we discuss the "R" vs "Y" question under the cover letter? There=
's
> >>>> some more context about it in there.
> >>>
> >>> Sorry, hadn't read the cover letter. I got attracted by "Y8" and "Y10=
".
> >>>
> >>>> I took the "LE32" from Gstreamer's format. Maybe it's a bit pointles=
s.
> >>>>
> >>>> I don't know if it makes sense to add the fourcc to the DRM format n=
ame.
> >>>> The fourcc is very limited. Rather, we could, say, have
> >>>> DRM_FORMAT_Y10_PACKED_32 (or "R", if you insist =3D).
> >>>>
> >>>>> Does LE32 have a meaning?  My first guess just reading the subject
> >>>>> was wrong ("little endian  32-bit" ;-)
> >>>>
> >>>> I'm not sure I follow. It's little-endian. The pixel group/unit is a
> >>>> 32-bit number, where the leftmost pixel on the screen is in bits 9-0=
,
> >>>> and the padding is in bits 31-30, and stored in memory as little-end=
ian.
> >>>
> >>> Ah, the "LE" applies to the pixels inside each word.
> >>
> >> No, to the 32-bit container.
> >>
> >>> DRM formats stored in memory are always little-endian, unless the
> >>> DRM_FORMAT_BIG_ENDIAN bit is set, which is what I was hinting
> >>> at...
> >>
> >> Indeed you're right. The "LE" is pointless. So back to the bike-sheddi=
ng
> >> about the name =3D).
> >
> > As the order inside the container is Y2:Y1:Y0, it _is_ little endian.
> > Cfr.
> >
> > #define DRM_FORMAT_YUYV  fourcc_code('Y', 'U', 'Y', 'V') /* [31:0]
> > Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
>
> Hmm, I see. I hadn't thought LE in that context, but I think it makes
> sense when there are multiple pixels in one container. So the "little
> endian" above would refer to the order of Y1 and Y0. So is Y1 the
> least-significant-pixel? =3D)

No, Y0 is the least-significant member of the container, which
corresponds to the first pixel ("little end first").

> But, say, in
>
> #define DRM_FORMAT_RG88         fourcc_code('R', 'G', '8', '8') /* [15:0]=
 R:G
> 8:8 little endian */
>
> the "little endian" refers to the 16-bit value itself? Which is not
> necessary, as the default assumption is little endian.

I think so.

> In any case, when considering your latest point... "LE" in the name
> makes sense? But with a quick look I didn't find any formats that would
> have "big endian pixel order", so maybe we can just assume little endian
> pixel order too.

[CDR][124] have. See the descriptions of the commits that introduced
them for the rationale behind this:

b92db7e4fe740daa drm/fourcc: Add DRM_FORMAT_D[1248]
d093100b425df6fe drm/fourcc: Add DRM_FORMAT_R[124]
e5bd7e3e4a68f0be drm/fourcc: Add DRM_FORMAT_C[124]

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

