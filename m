Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694FBC02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5rKFsU0SvYKs5cu/0lV6coepdrfbvxbzd7PCYDdbKU=; b=Ab9bfImw7RB6yMyWlKWy9FPZ6N
	MxA1o0KT5tCvBrTGCo4Gy4+yBwgmnyd+ruc6/T0spMgTglNkr/Y62XnOpde3tpWfyYWxcv7gc8/km
	rzornZl9G4SCbtKAsDs/HjFszT2CQk5gzx8qQc9V2oqpq+sjcgsYqz09PPzHhcQl/cN2MLC9Lvv9C
	FOHSKBHqT9ixt2EEJ/M4qBwtGPekfwvB3nE9n5qznMrgLX6mekF6x5aADSP4WEiwoKlVZ4pDMGYpp
	hLURIwvh27J7y+PKGDIqiGpWRfenuvrTgbvUSVcqyUcO0bPIkWr15lo6ZpFbZuKp1Xjolz45o7Lkx
	O+7F2ISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2cI-0000000Bqnq-0Uvo;
	Wed, 15 Jan 2025 12:35:26 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2aR-0000000BqXW-03mT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 12:33:32 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4affd0fb6adso2099856137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736944408; x=1737549208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5rKFsU0SvYKs5cu/0lV6coepdrfbvxbzd7PCYDdbKU=;
        b=smhGaz+Ff+IWgcTWIlDdDGYRyuPRNeM4VrzSqdT2YkwKz27qKxwA/kE0gdPeZYWP4P
         6BjMkfiP3RrbByVMF/H1/LP7r3OPY2l+qpj8Yqugn+WD5ut+ZA7D7uiSOaX+4rGJgw5u
         Z5eFQKSw/hnU/QIsKVzx0paesOmVIXhqlmKBuEQldd73sPaiCJfigJK4e3RmRjDCRqiW
         r8RQjOj+uKJtFYVycu7oI9nVlpGdYGQ7YjyDyr472wTrDmYTbmRtjaitwgZDraFnhhgK
         18MSttDC217g2C7EXhwniGB8NApbF7t6vsyCUjjvbZZW2fVgnmCCQtQWGYVvy48ihMNt
         X8kg==
X-Forwarded-Encrypted: i=1; AJvYcCVpQCR6RkUHLFwznAvrkwhytDbsGYmJtqT9WrJK+Rmwa23UXuNygV2S+0NZD8iVs4z6EmV4DaWR3QUn7S1QeNQx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzunes6ix39RxOPpzL1f8liAqj2PMI5TzMWtEP0sIemQfLNE7Z
	DsuBCGhs8dSIvBNc3wVmMjStdqs+tDPmT1YHpF1FGB+xgvS08Cqlq/kw+3ew
X-Gm-Gg: ASbGncuZ8JKwC0jXUjh5Ou455EjwoRIGzs+kOo0nZQX0rBGSKIllCz3YlJJ22WXxljy
	GjVR/+zo2OFtuot8Nq3keR4/M3lqTadtfOfN0bzqmyBh37g3CZ0gL8XTYEHsOwAzFvJ3+6dtVZR
	gDJ96zbapA0PptyPcLGEpKOpUgrn2D30Ay+Ttfz1gXN0bIDMafWbOV5vkyyXG6kqtkoA/2IPFSm
	j2kXRGcFUtEaOa7ruXLUsqQu19+Z505wxcCCasg4kfi4uWGXCSRkZTWgr9hP+xOJDoBjQnvfzJu
	ITpYU7op0FbfpX1UBCE=
X-Google-Smtp-Source: AGHT+IHvCstjEA9OhdXJxvwjbacVJCHdoGv6dLlRRsu49JDfwIDJ0cm2k5V5XB+o7tVYnuRwxPMvtA==
X-Received: by 2002:a05:6122:3c43:b0:51b:89e8:5cf0 with SMTP id 71dfb90a1353d-51c6c430263mr23196622e0c.3.1736944407609;
        Wed, 15 Jan 2025 04:33:27 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cde53aa50sm119008e0c.27.2025.01.15.04.33.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:33:27 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afe70b41a8so2298400137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:33:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfS3uyM5kMGZ/BeRaW02lRN/eLs0dVNi7PoOesmG02lcqoIL9Zr3bCVuVQ8CUurlnM8B+PvvCbBKKvr3U7MYti@lists.infradead.org
X-Received: by 2002:a05:6102:509f:b0:4b2:bc6b:c845 with SMTP id
 ada2fe7eead31-4b3d0d763b1mr22291479137.6.1736944406736; Wed, 15 Jan 2025
 04:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com> <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com>
In-Reply-To: <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 13:33:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
X-Gm-Features: AbW1kvaXtImmdtBVMPEGdxHLwOK_WCSPE2-SMyqu_xlnmeKkjXxXBTI8xgoUL6Q
Message-ID: <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250115_043331_051857_2561075D 
X-CRM114-Status: GOOD (  30.90  )
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

On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
> > On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
> >> 32-bit container.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -408,6 +408,7 @@ extern "C" {
> >>   /* Greyscale formats */
> >>
> >>   #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8=
-bit Y-only */
> >> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /* [3=
1:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
> >
> > R10_LE32? Or R10_PA4?
>
> Can we discuss the "R" vs "Y" question under the cover letter? There's
> some more context about it in there.

Sorry, hadn't read the cover letter. I got attracted by "Y8" and "Y10".

> I took the "LE32" from Gstreamer's format. Maybe it's a bit pointless.
>
> I don't know if it makes sense to add the fourcc to the DRM format name.
> The fourcc is very limited. Rather, we could, say, have
> DRM_FORMAT_Y10_PACKED_32 (or "R", if you insist =3D).
>
> > Does LE32 have a meaning?  My first guess just reading the subject
> > was wrong ("little endian  32-bit" ;-)
>
> I'm not sure I follow. It's little-endian. The pixel group/unit is a
> 32-bit number, where the leftmost pixel on the screen is in bits 9-0,
> and the padding is in bits 31-30, and stored in memory as little-endian.

Ah, the "LE" applies to the pixels inside each word.

DRM formats stored in memory are always little-endian, unless the
DRM_FORMAT_BIG_ENDIAN bit is set, which is what I was hinting
at...

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

