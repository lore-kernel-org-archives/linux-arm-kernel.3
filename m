Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB9FC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljcbpuZJwXDAqPnol/jqn4PauxJjKGDyJjaPa56FKYI=; b=Qkj6HITxjzjKo8GbBTy+yFppqB
	G+aaQoW9MZ8R2Vxn7oWTPjs54d/aMK+Bbx9M58v9CPAmAN0iJEA+oPV3NVo5bjxPlHOycqfj6JaaU
	vZmsjxKcL2gGgfuxTUVdxXylaRKROBY7/AeqLlpNufgRbx0iRiM1NCwDt8rz78i50AETF8QKdq3/M
	CUY4PB8z73GvB8dKt6qhzH80kI8AxuLogGh+q9calLgLbQCCQWxnTZJIgoq7fy8ufCK/O5Z50+7u3
	O3W6qxOKXW4tYDXkTfqWy0G6w28RDbL3wVBHIh9FbLDPBRg/vZ9YgH3O/xwR9o8Ahd9SUzp4ZyCry
	lu5iZR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08KH-00000007UbQ-0A8f;
	Thu, 03 Apr 2025 00:20:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u088n-00000007TQh-0ab4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 00:09:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2242ac37caeso245445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 17:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743638943; x=1744243743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljcbpuZJwXDAqPnol/jqn4PauxJjKGDyJjaPa56FKYI=;
        b=EOJhpPDTIgzriZnle+PeObtq7OLC7QsoNVO5HGxJCPcpRV0Tu3NdWbTA8Ihpx5SKqj
         YeXdnpON2YLvFE7xRhvuhODS5BF5lmZpdeGQwZBlYwf2bjVBVZtF6m+qE7/G3Fdnd28h
         OqOVcTUsADO8S+QC7yMRubPRB512cGM0MYVs0lmHiCmrSq1nYn4v28o8QRMnTgLQ3qlP
         1NkMW/t2/Q+PRlK7fAzGzqzA9c4crvwpSGABXQKGsq1VAnDyDYi+ofiX/LmOrcr+oSe6
         nU4eNDV9Glb892/w/7eiEP83y7nzHivnf7pkzD5Caq/XPNjdDQ7B7DF/AUWmHkVRM2Uv
         LRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743638943; x=1744243743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljcbpuZJwXDAqPnol/jqn4PauxJjKGDyJjaPa56FKYI=;
        b=IeGrOgFPZIzAiSOuf4doG3ivn0iSZVwzcfMCKTzMIX6F1rPYwqkae5srKcP8VJUinS
         SiSm8E1U7HmA0lh691msz+mqLAt4bkAFlGC6v0OxesnT0bv1NcIH8Efaw5oIPOIPRhu/
         dErKJ+9tkjqm+f7k1yX7x1Lp39wHukLmPbKZ217wGIJ3fXl51Te+tPFEQzrLl7Vp0WCy
         HQsqdZN5+8kgBPpdomQeNddB5aY9jhB74sm0FANXdFmSvTFgIvkDpYlCEO+rhM74kNFr
         dFwMYvkEnL0gOCb4EqskUqWatv3mpb+fUPN82gOcHIsei9Kjy2/c+/NbmDVvwEoaa82N
         N8yg==
X-Forwarded-Encrypted: i=1; AJvYcCW+1+T9iQ/EQH5fFe2s8olRA1Iaou+bVex+Y/SkBFiWySlqnpwiHcevn/EZfr5zn9fU2aqpx4V/HSZqNQZZ7RdM@lists.infradead.org
X-Gm-Message-State: AOJu0YwH8TG5wdvAjkFAX4u2pxSn/PMDI3JYfqofcrfYHxV28myc+hSf
	J29F8onr+aOSUiJyCQSG1Y7UrKQbKG115J8nEmV/aWWbdrpBvX1PP4dH3KUNdr+WS4G9N32xo+l
	wA7erIrFdVsUdqmD7vAqprBpVKLmgRX2SedWJ
X-Gm-Gg: ASbGncuuM04JGbiIxZ7FUgfYc0xrVemCtEHwX7XGRa4LFX2ASuvJPeKEPfo8fjZvfwL
	YQS0rcdn168BFAoS6eZvdot43FAbzZ9HM48X5fYs1/W/U6T2s3MyjkN/RRv1V/bAjphGilms5Gt
	tHKlgi/9jrDBMwTuTAhFxOxoNEGWTm/VPbpBVMHwik/VBVAEcjHV8mffaF
X-Google-Smtp-Source: AGHT+IHutOHO69SHU0XC60NdDFG2HVTZqKjKhFOA2HECg4WHds9ohBB1sYtL21Jdh2GqT2tdCyHjyFFTpGz4e0i31ds=
X-Received: by 2002:a17:903:440b:b0:216:21cb:2e06 with SMTP id
 d9443c01a7336-22978359fcemr754035ad.19.1743638943220; Wed, 02 Apr 2025
 17:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250329000338.1031289-1-pcc@google.com> <20250329000338.1031289-2-pcc@google.com>
 <Z-2ZwThH-7rkQW86@arm.com>
In-Reply-To: <Z-2ZwThH-7rkQW86@arm.com>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 2 Apr 2025 17:08:51 -0700
X-Gm-Features: AQ5f1Jrfy-UpUdfn1d71XnyyKzDPZn2N3LIuWaGJ42FoAiNjcFlKYw9ZKliguAY
Message-ID: <CAMn1gO55tC78BpD+KuFgygg1Of57pr16O4BvKsUsrpo830-jEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_170905_182299_25BAE334 
X-CRM114-Status: GOOD (  34.68  )
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

On Wed, Apr 2, 2025 at 1:10=E2=80=AFPM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Fri, Mar 28, 2025 at 05:03:36PM -0700, Peter Collingbourne wrote:
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
> >       /*
> >        * If src is unaligned, don't cross a page boundary,
> > @@ -133,12 +134,14 @@ ssize_t sized_strscpy(char *dest, const char *src=
, size_t count)
> >       /* If src or dest is unaligned, don't do word-at-a-time. */
> >       if (((long) dest | (long) src) & (sizeof(long) - 1))
> >               max =3D 0;
> > +#endif
> >  #endif
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
> Kees mentioned the scenario where this crosses the page boundary and we
> pad the source with zeros. It's probably fine but there are 70+ cases
> where the strscpy() return value is checked, I only looked at a couple.

The return value is the same with/without the patch, it's the number
of bytes copied before the null terminator (i.e. not including the
extra nulls now written).

> Could we at least preserve the behaviour with regards to page boundaries
> and keep the existing 'max' limiting logic? If I read the code
> correctly, a fall back to reading one byte at a time from an unmapped
> page would panic. We also get this behaviour if src[0] is reading from
> an invalid address, though for arm64 the panic would be in
> ex_handler_load_unaligned_zeropad() when count >=3D 8.

So do you think that the code should continue to panic if the source
string is unterminated because of a page boundary? I don't have a
strong opinion but maybe that's something that we should only do if
some error checking option is turned on?

> Reading across tag granule (but not across page boundary) and causing a
> tag check fault would result in padding but we can live with this and
> only architectures that do MTE-style tag checking would get the new
> behaviour.

By "padding" do you mean the extra (up to sizeof(unsigned long)) nulls
now written to the destination? It seems unlikely that code would
deliberately depend on the nulls not being written, the number of
nulls written is not part of the documented interface contract and
will vary right now depending on how close the source string is to a
page boundary. If code is accidentally depending on nulls not being
written, that's almost certainly a bug anyway (because of the page
boundary thing) and we should fix it if discovered by this change.

> What I haven't checked is whether a tag check fault in
> ex_handler_load_unaligned_zeropad() would confuse the KASAN logic for
> MTE (it would be a second tag check fault while processing the first).
> At a quick look, it seems ok but it might be worth checking.

Yes, that works, and I added a test case for that in v5. The stack
trace looks like this:

[   21.969736] Call trace:
[   21.969739]  show_stack+0x18/0x24 (C)
[   21.969756]  __dump_stack+0x28/0x38
[   21.969764]  dump_stack_lvl+0x54/0x6c
[   21.969770]  print_address_description+0x7c/0x274
[   21.969780]  print_report+0x90/0xe8
[   21.969789]  kasan_report+0xf0/0x150
[   21.969799]  __do_kernel_fault+0x5c/0x1cc
[   21.969808]  do_bad_area+0x30/0xec
[   21.969816]  do_tag_check_fault+0x20/0x30
[   21.969824]  do_mem_abort+0x3c/0x8c
[   21.969832]  el1_abort+0x3c/0x5c
[   21.969840]  el1h_64_sync_handler+0x50/0xcc
[   21.969847]  el1h_64_sync+0x6c/0x70
[   21.969854]  fixup_exception+0xb0/0xe4 (P)
[   21.969865]  __do_kernel_fault+0x80/0x1cc
[   21.969873]  do_bad_area+0x30/0xec
[   21.969881]  do_tag_check_fault+0x20/0x30
[   21.969889]  do_mem_abort+0x3c/0x8c
[   21.969896]  el1_abort+0x3c/0x5c
[   21.969905]  el1h_64_sync_handler+0x50/0xcc
[   21.969912]  el1h_64_sync+0x6c/0x70
[   21.969917]  sized_strscpy+0x30/0x114 (P)
[   21.969929]  kunit_try_run_case+0x64/0x160
[   21.969939]  kunit_generic_run_threadfn_adapter+0x28/0x4c
[   21.969950]  kthread+0x1c4/0x208
[   21.969956]  ret_from_fork+0x10/0x20

Peter

