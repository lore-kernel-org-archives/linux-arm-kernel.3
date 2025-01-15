Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05177C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iqtJoGXK8NCVQOAgXLn4RuPLDEZWgiNUfGioBEklG4=; b=Tdqw33B5+15giDZ5eHXHNaGVkb
	58Kc39Mk74K4dullAS7FHyZvwCMNXD17VkWntPR5fMHMzhQVfGH+ljdMuce9VboF/J/C869qk3s6r
	uissdyl8toI2TXAdsHfyB+jrI1Qblqi9800Y2Qls1upnfu2zRFfwOajmbCpKcaHtotYoF3mPSrTov
	zQWrQKG8lXkKIwUiZENZ7pPfK5tDo1LOi1A8HS1yOxktghhWgk3UF4jFK5gz67otzC3TM4DD+ZvqP
	9CIABAS3hvjFN+RIe0UQ9+a16kh1ROFRRCgDwOmQ1NpPj01OI4A7bG8cFhqNWmaG8Lvn01mQIYo8y
	K56pgBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2uE-0000000Btdd-0jhY;
	Wed, 15 Jan 2025 12:53:58 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2sy-0000000BtH3-0bS1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 12:52:41 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1141683266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736945557; x=1737550357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iqtJoGXK8NCVQOAgXLn4RuPLDEZWgiNUfGioBEklG4=;
        b=J1Tj15meXSdl0OLaQjXLGBPRa9jNu/eJRhUhs8A6E6zQjVx91T47IWLHYmtTjcvCXC
         RcRB6D+fI5vpdHM7sQfrPQkBAIHSA1b5EhONXJ13SL0ADhLIrcqwprCnt/iDYbjpOoua
         gXHDbMl9dYA5e2p/H2v48Wd6LvqHaVDmAIpLgvyiW+f2frogmvjaVHZx1nER/hPbTfTK
         zdQZUsrOZ8Mbss6pAPtrHz5MAtS/gUWrRWSVl8O1k5OkRfSmB9D9h37ZPpk5LDbSc1QI
         IWfgbXms73IYbSPkdH7ljB5WlaJ12BEZgkoYeWtHJMuk4uYyrE4Zivi7IIpKGQf2y9OJ
         C0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCeLcQXHNgMl19ECkcsnt8T7SRPaRv5oiwqFBgSpzMrGcScvS9z2zmMNp/zc9Ec5PxYa/CiPq5n9ft3a8x80K4@lists.infradead.org
X-Gm-Message-State: AOJu0YzFgeILZZhZxq9o2ikiWh8YvQKZlv1bBVkYVuwCc3hOGmEmE39/
	+EtAH35er2CNRanDekr6+TqW9ktwoci3FPeP+ZyoHCNV+0PQjgcLIj3j6HqbohM=
X-Gm-Gg: ASbGncuOrQHaJzAOwU6W8K+86AUKn+r5uyloVzXzwJVkBrqFDsgO+y/+Nr+J+5ntHXn
	tAEIyxBqLweLQhS7k7m81VkrDx1IsO3XQUH+QusMUbKqyjzifnfSNnYlexT5QxR7kCGQ3D1RbXg
	Te0IwR0t6LiDeZC9QxiIEzRz0vLaB4z7QSPzSEjjYM0N8lYQGg1z+3JxAfILbSJJ3ZIx80f6SkT
	Mp7cxJidd+WoOOGokKox+QXqX6lTf4PqxBuWePS8iPvArJfm3HsRupLR2n/AyCMX9UZRRoSY9IL
	rguue6ymQGgRtBZd7lo=
X-Google-Smtp-Source: AGHT+IGgOcmIRCS3Zja3C+6R6Xu7T3eObtmQ3fLNrBKINiPS2B4OyYKu/XywBpPn7HSKz3KJ7skPQQ==
X-Received: by 2002:a17:907:3fa6:b0:ab2:f74f:3f82 with SMTP id a640c23a62f3a-ab2f74f4afamr1798670566b.57.1736945556462;
        Wed, 15 Jan 2025 04:52:36 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b72ddsm754521966b.163.2025.01.15.04.52.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:52:35 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so13047576a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:52:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwkqpNsc2lKvVhk8pzOKF7Yp0yXAmOm/IeoU+1PyPxGAOCMf058hatKcKrDZod7yJ+MntsZk7u196qmsUdLIAr@lists.infradead.org
X-Received: by 2002:a17:907:d03:b0:aa6:730c:acb with SMTP id
 a640c23a62f3a-ab2ab16a3bamr2734655966b.8.1736945555374; Wed, 15 Jan 2025
 04:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
 <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com> <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
 <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com>
In-Reply-To: <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 13:52:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
X-Gm-Features: AbW1kvauPbgf-uHZ3dw6OrY0NssZcC4ux914rffShhHxqYZVZgOZzgF5uFfUPkc
Message-ID: <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250115_045240_178340_B67C4055 
X-CRM114-Status: GOOD (  32.83  )
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

On Wed, Jan 15, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/01/2025 14:33, Geert Uytterhoeven wrote:
> > On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
> >>> On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
> >>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
> >>>> 32-bit container.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/include/uapi/drm/drm_fourcc.h
> >>>> +++ b/include/uapi/drm/drm_fourcc.h
> >>>> @@ -408,6 +408,7 @@ extern "C" {
> >>>>    /* Greyscale formats */
> >>>>
> >>>>    #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /=
* 8-bit Y-only */
> >>>> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /* =
[31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
> >>>
> >>> R10_LE32? Or R10_PA4?
> >>
> >> Can we discuss the "R" vs "Y" question under the cover letter? There's
> >> some more context about it in there.
> >
> > Sorry, hadn't read the cover letter. I got attracted by "Y8" and "Y10".
> >
> >> I took the "LE32" from Gstreamer's format. Maybe it's a bit pointless.
> >>
> >> I don't know if it makes sense to add the fourcc to the DRM format nam=
e.
> >> The fourcc is very limited. Rather, we could, say, have
> >> DRM_FORMAT_Y10_PACKED_32 (or "R", if you insist =3D).
> >>
> >>> Does LE32 have a meaning?  My first guess just reading the subject
> >>> was wrong ("little endian  32-bit" ;-)
> >>
> >> I'm not sure I follow. It's little-endian. The pixel group/unit is a
> >> 32-bit number, where the leftmost pixel on the screen is in bits 9-0,
> >> and the padding is in bits 31-30, and stored in memory as little-endia=
n.
> >
> > Ah, the "LE" applies to the pixels inside each word.
>
> No, to the 32-bit container.
>
> > DRM formats stored in memory are always little-endian, unless the
> > DRM_FORMAT_BIG_ENDIAN bit is set, which is what I was hinting
> > at...
>
> Indeed you're right. The "LE" is pointless. So back to the bike-shedding
> about the name =3D).

As the order inside the container is Y2:Y1:Y0, it _is_ little endian.
Cfr.

#define DRM_FORMAT_YUYV  fourcc_code('Y', 'U', 'Y', 'V') /* [31:0]
Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */

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

