Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68364C35FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 03:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1eGmQWoQGN9Dkax1HXc1+f2DIdudnDU/1Bx3UVDXHM=; b=yOLnpEShqNit2P+BtpfhJSVkKp
	Ix+2nYHU4gl+SOSz1zzAFZRvwyIB0ys2I350yj3MQ8OIasw0kKhP0VzZ/qSNo6ASmN/xQFZDD8iUV
	+G9A4rU9JmWTNoN90Kg+jrPguT3HGKMC+lW6C5xZLKyYOWRpwRBv3UMsMCIIv3khlVaI03gKz0T1f
	nX+n4A6sBdWm8Z5n/MN6oTqvOodnEaJ+actEFQJioo+jT04rPrEGRV2SpW68aO6Wt0oiVNRvNCrua
	BHGorsjzmJ7huuA/rhwMhNg8PMT/ACHVesP5hUgPMYvVrLCwdIImFzMajh78X+yzy4e+eXn6VuMTe
	BEZGPDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukFW-00000007um5-1gVt;
	Wed, 19 Mar 2025 03:37:46 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tukDM-00000007uQh-3ZKH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 03:35:34 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso5980a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 20:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742355331; x=1742960131; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1eGmQWoQGN9Dkax1HXc1+f2DIdudnDU/1Bx3UVDXHM=;
        b=MsIgFV4b/nQsHwDvT/f+WhWMMZHNlfnyQacx7MjjBQAPfHTD1o+OMkPDL/UcKlXU0Z
         QjjBnAeLPLb0cA37NCPnodtX4YtlcA7mKi0865PRWYf7y+PE4cef+rGkgJdbA3ydOnJP
         yYCv197VvsMbiqvF0ToXFCJ3bVNt4fvs5vLAaHTehy22xXemMVcngiFW1aTsVluvsLZZ
         RKcxh+gq0q3fBPSOmqdsFWGfHca7Gqszu4MIDNQas1ZPwFqnxJbpMSN9ey9A+7os9yDD
         qIvbmhxU2CbvV7uDEfSPVN1l2QQI3nvrSXshPb7Iij2Y6Z28iPfGK712F9k97LGUhjH8
         Tf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742355331; x=1742960131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1eGmQWoQGN9Dkax1HXc1+f2DIdudnDU/1Bx3UVDXHM=;
        b=ssOGPOhxHHG7d3didhJLy+SlcMoYui3YHWhqi3ESmYuP4AP08fW7/oWnKbIJpzTo0x
         VrRIh4fX9CQ36p6SpuPQQsZeT+xujQTpw/L8GMh8gYoKzL5qlCPh45LAohwWkEZkArgF
         BKGVjC/ioRzSkyamm3Nl5cHODSMvYHz8ej5zCUyzoQy2B0BsslfxBbpoENNX5SPfFfBC
         FAHmK4MlLd4saNHnNiCSGUxACZKpE2V2wfZ3KAsd6dvN5EIzjDG9Se0qwiy0rZUwo+fZ
         gJDLlG67hyicPqPc6pK4vQvfGr6Ffnll6Zfo2HJrZPyo1zCSKys4j5vEQLv0yR8fTuKe
         vpCg==
X-Forwarded-Encrypted: i=1; AJvYcCXOX50FqFqxz8QB5zuJ41ndieAiLazCX7TQTW6rmTZjJAppdqrqY32DkrmDzCK1n2xXKvXZ2beA0UjktaeoBqSS@lists.infradead.org
X-Gm-Message-State: AOJu0YzcIvDvao0Yf1k7P/q6tkkZFViWxfMdnQTMu0DAIV1Z5mp3tM21
	MxAFowImi64kOjnkfo+dLaOizrxTSkFIYOFn8qlRrugwQqJtFqVwXFkOe3KMDCfVUZ0AqwFi6cG
	Yag8pDVsd87JwI1LIo/0nk4bT7lEfqOClHsB7
X-Gm-Gg: ASbGncs7N8jYoXiDumQWoEKlKFoIfRNxSGX45Qc71tX9wx9ueumbYeHnOpX7d8bSZw6
	qDeG7gZWNYcpZsYGJeeUagt/ez2TYSMA/DDzyjf0ghI7hlW1MdRE0oHiQfWYtxakdWxtY+EAn2M
	nefK9Ku602XcMI3Fd84CAWzb9PuifaTKqzZ+EpfghjThAKgsJbT3v3od00ZnOy/cm1Uw==
X-Google-Smtp-Source: AGHT+IEt+19WG9IHzZ81Mv9euoAb/rztC5JqY4WZb1WW6DcgrlMezNBnKgRxYmL642WrrToMiGpcBZS+CqAISTXPMYI=
X-Received: by 2002:aa7:c1da:0:b0:5e5:c024:ec29 with SMTP id
 4fb4d7f45d1cf-5eb7e96330cmr62254a12.0.1742355330636; Tue, 18 Mar 2025
 20:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250318214035.481950-1-pcc@google.com> <20250318214035.481950-2-pcc@google.com>
 <202503181957.55A0E0A@keescook>
In-Reply-To: <202503181957.55A0E0A@keescook>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 18 Mar 2025 20:35:19 -0700
X-Gm-Features: AQ5f1Jq3z05plokQ9oy7A8yZz95pSsT-oxsin3iEVaTMKIK56JFI_UIbnlyp_vI
Message-ID: <CAMn1gO7TG0xXMFNFXTm9W8n4hdit9Yr40m4jvFCjdv9fGiU5iw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
To: Kees Cook <kees@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_203532_912947_CC781D46 
X-CRM114-Status: GOOD (  34.23  )
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

On Tue, Mar 18, 2025 at 8:06=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Mar 18, 2025 at 02:40:32PM -0700, Peter Collingbourne wrote:
> > The call to read_word_at_a_time() in sized_strscpy() is problematic
> > with MTE because it may trigger a tag check fault when reading
> > across a tag granule (16 bytes) boundary. To make this code
> > MTE compatible, let's start using load_unaligned_zeropad()
> > on architectures where it is available (i.e. architectures that
> > define CONFIG_DCACHE_WORD_ACCESS). Because load_unaligned_zeropad()
> > takes care of page boundaries as well as tag granule boundaries,
> > also disable the code preventing crossing page boundaries when using
> > load_unaligned_zeropad().
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf=
98ada827fdf755548
> > Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
> > Cc: stable@vger.kernel.org
> > ---
> > v2:
> > - new approach
> >
> >  lib/string.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/string.c b/lib/string.c
> > index eb4486ed40d25..b632c71df1a50 100644
> > --- a/lib/string.c
> > +++ b/lib/string.c
> > @@ -119,6 +119,7 @@ ssize_t sized_strscpy(char *dest, const char *src, =
size_t count)
> >       if (count =3D=3D 0 || WARN_ON_ONCE(count > INT_MAX))
> >               return -E2BIG;
> >
> > +#ifndef CONFIG_DCACHE_WORD_ACCESS
> >  #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>
> I would prefer this were written as:
>
> #if !defined(CONFIG_DCACHE_WORD_ACCESS) && \
>     defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
>
> Having 2 #ifs makes me think there is some reason for having them
> separable. But the logic here is for a single check.

There is indeed a reason for having two: there's an #else in the
middle (which pertains to CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
only).

>
> >       /*
> >        * If src is unaligned, don't cross a page boundary,
> > @@ -133,12 +134,14 @@ ssize_t sized_strscpy(char *dest, const char *src=
, size_t count)
> >       /* If src or dest is unaligned, don't do word-at-a-time. */
> >       if (((long) dest | (long) src) & (sizeof(long) - 1))
> >               max =3D 0;
> > +#endif
> >  #endif
>
> (Then no second #endif needed)
>
> >
> >       /*
> > -      * read_word_at_a_time() below may read uninitialized bytes after=
 the
> > -      * trailing zero and use them in comparisons. Disable this optimi=
zation
> > -      * under KMSAN to prevent false positive reports.
> > +      * load_unaligned_zeropad() or read_word_at_a_time() below may re=
ad
> > +      * uninitialized bytes after the trailing zero and use them in
> > +      * comparisons. Disable this optimization under KMSAN to prevent
> > +      * false positive reports.
> >        */
> >       if (IS_ENABLED(CONFIG_KMSAN))
> >               max =3D 0;
> > @@ -146,7 +149,11 @@ ssize_t sized_strscpy(char *dest, const char *src,=
 size_t count)
> >       while (max >=3D sizeof(unsigned long)) {
> >               unsigned long c, data;
> >
> > +#ifdef CONFIG_DCACHE_WORD_ACCESS
> > +             c =3D load_unaligned_zeropad(src+res);
> > +#else
> >               c =3D read_word_at_a_time(src+res);
> > +#endif
> >               if (has_zero(c, &data, &constants)) {
> >                       data =3D prep_zero_mask(c, data, &constants);
> >                       data =3D create_zero_mask(data);
>
> The rest seems good. Though I do wonder: what happens on a page boundary
> for read_word_at_a_time(), then? We get back zero-filled remainder? Will
> that hide a missing NUL terminator? As in, it's not actually there
> because of the end of the page/granule, but a zero was put in, so now
> it looks like it's been terminated and the exception got eaten? And
> doesn't this hide MTE faults since we can't differentiate "overran MTE
> tag" from "overran granule while over-reading"?

Correct. The behavior I implemented seems good enough for now IMO (and
at least good enough for backports). If we did want to detect this
case, we would need an alternative to "load_unaligned_zeropad" that
would do something other than fill the unreadable bytes with zeros in
the fault handler. For example, it could fill them with all-ones. That
would prevent the loop from being terminated by the tag check fault,
and we would proceed to the next granule, take another tag check fault
which would recur in the fault handler and cause the bug to be
detected.

Peter

