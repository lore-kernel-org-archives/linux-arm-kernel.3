Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40747CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 05:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=; b=yD1yiZdxZz/HFx1HaJIft7jxRN
	raB/mu2zmUO1+eneOwqSql/mEwBkrPOnAHUhQyc+4GfnW1opE4xGmgTEwnLuLjKt3zJuuOmjVk6qf
	tpDSkhm8X6L7GHFBXaaKczCne/EdfpA4dmAKl2XsnNqMikMVT3blK9ie/uZVDBDS6/lC95DpcD3xZ
	LiGUClFT3AWsy8VCh0Q8rGwWrM8e2Jy1Uw7bI+k++9SUgb+Z8/+jlKxlUkD4n5AX3KGy7YY6Aw5DJ
	2RPf/wu+k4yJGWsRoSEHmHnBCVuRSzElXVfYn5KV8VVm6rs2gu8hC5Tt77CavOAxTs0Q+f24w61MX
	nHLUEbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZqH-00000003bFz-3Q47;
	Wed, 20 May 2026 05:51:41 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZqE-00000003bEv-0FVE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 05:51:39 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50d864c23bdso15411cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 22:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779256296; cv=none;
        d=google.com; s=arc-20240605;
        b=CQ6m1b/0DwZKYBsHHJ9mjCKAwdNMYYT1KSpWz4MyEbfE0UDmWZGWljr1hJYYSQ2+O+
         sdLNjUhuYsKs3OMHv4R329xXXzQStogeF8hoQq4iH4gEe99hwvceNP10cdwJKv9D0U3c
         NCXWcQbKSurwQgGZhlIK20fAmV6BPNU3pnZFEv7qRVVzSlIGkaJplivo3ad8fyLHFAn9
         eWp3/Tpwjcfau8aV+9lK75Kr2eJOXxudkoXQHxv3+9FZ/5OpmicPJbOJGiGO7ur7Fojy
         vD8vFgeyJniRGRJ7IRguWsl96bjgI0JSNX4Kl0+QQQ8Z4FL6ZSZuefz16KlAkNFydRDl
         JBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        fh=SwPg+mtrOAfcJuP3H+ndz6+BqXAJknxiGAvWhRnzjqE=;
        b=Uf/DfodtvZ9Z1RnoHiKk4AMWWyMFJqGklFFdgv5Q264DxHkGKyYVGfapEaiXPhW8iz
         EpjW2hGTEPzYd5pjMC5MTDaT4NFHabT8gWEQf/Fuq4DjjgspJeHSEPFVbvEmVqGQgQ2i
         2umV43AzTFhN4V0cV9KQFMVOqy8zHw9YhMWhMXmQ0sP5zH4+7xb4n3dY/JIk3046mR4q
         zpsHIb50id1QFNEBi+B1oRSoYXRST/DayBvIBOR5IhUD9h0edq1okzXPlEUVTjYo9gIG
         xxFV/DmV8bCvLYMtxbiHQNOZ3y3JKn4kciw/1nZtyrNQx6CWacEVQPRbJRud9gDitgrf
         Yp7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779256296; x=1779861096; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        b=mTuXwjhPHWIKm/JeMIASGiz9m95DmTVJbOvkMm2A4MQDpBb4+KfRGXkXbVt0lHVNjw
         fITpUJVYnlgAlKNRa/ZISmhxtGWBDBkkk+iFDCayBkPBU6pJx9GYazEq/CiSLCd2im3u
         FOyKmlVl1kaOIZGE9muqz2Xh1tQV1lyv6rCrCfXm9/mLDfMlIfEn4f58aDUQzNvy1NHD
         RpDOIKZEqa3Jb5BL8FduTyiGePHamwi+0D9vIl5bfBGqZ51ESdSpiM98OcGglzt4YGcr
         Weg7xvxRKvyvV29GNrYjEsJEbiS50MTuL6/SNNfs2YC9f9sx6PWTb0UIlvGg7xhNL9iW
         bVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256296; x=1779861096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        b=sjl3nlizQ1mCxtfGHdnP+CqZpwFJzxpeVFEPBYAOtQSU1LXeze3i1Iy4G3F51dW3ap
         oaC9qK2KO5RJMWT0yProHZ5qb/1o1KRGeHS3pVIrxp01pCLGr4bIvu1iUVooz+o5IM+N
         CHNt4fWkdtdhUP8scAKcH4nTteoyI10RJb4qVrl8OUvILGVWyHn7CY8LUi4MKIh0T3nO
         phNe6CfyhchyIjPP+ucNWZ8DqEuc2faVF1X0y/lpzxjFJHrOfIITbamiWkDhjM6WMIop
         ckvs+ja/nmpT0AHcaGJibgAD8jpE/o+PjhnbpcgQVzEb5PWHjR9DXXEGFgvkzj3HxVVU
         h+pw==
X-Forwarded-Encrypted: i=1; AFNElJ+YigqAn4eEV6PtbQbz8VzEqdx9IVBnK1uUUYE+Dy08FyfPIZ8VHdu7f/WgWFfjlJpRXNeDYWZOSc/Jz/QktSh5@lists.infradead.org
X-Gm-Message-State: AOJu0YwvVHM2hn4+C2J7a84gvBlHEFRAULbMHEoE8gLXkbtjwvKFQAt3
	TVUKkVTlSQA/tL/r519nDWMZTEQlpD6SbV52TmQAyb+QCe9ITYPxa4o074QLvNdAjoUfWOBZuo9
	RiS4RglXooaRQboD6rOBbel6RMY1nOggqqVzJTwXv
X-Gm-Gg: Acq92OGFKQd9J7JGD/FuZZ+7cIp2WTWdccaI5IhozvqeN2Cc9k5fHieEIuOySX1Ka7w
	SCKuVSpf911lxMdaIflu/V7jkWDHJbMZ3yd0vLkCMWxjcYfXBTIJDNegSSn7vFrx2lj2TLvon2g
	tsMsZlD9gjyIlq3dQa80zWwRQZppGw8Po8EykGxA3QrN20/EdxRaatBlts+cx/2tq94cV6oa8Vu
	X/a/U8SIcBh+vKZE7rN1C62r49CmqX/JUh5t5E0oOrhZMVOq/J1zvA+N00KqstOrYYpVl7fvwJW
	DT/5GTYMTGNiTgdOcl/38WvdgzsNip5QIGVkcuVHDUE+FA==
X-Received: by 2002:a05:622a:1920:b0:514:b17e:86f3 with SMTP id
 d75a77b69052e-51679461795mr15633081cf.12.1779256295164; Tue, 19 May 2026
 22:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com> <agxbq1TxJdniMQT3@lucifer>
In-Reply-To: <agxbq1TxJdniMQT3@lucifer>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 20 May 2026 05:51:23 +0000
X-Gm-Features: AVHnY4KMccW5pUeVLxDyTF9Gnh50gzRE3EOZpgiKFqqXipSU5KPE9rQdYzJrFBQ
Message-ID: <CAJuCfpG2Zmpf5N_ejB6ZDv8LDjpVtTfA_tYQ6sW+Noc9Y+XhdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_225138_230196_9C9A3288 
X-CRM114-Status: GOOD (  31.12  )
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

On Tue, May 19, 2026 at 12:53=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> w=
rote:
>
> On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:
>
> > >
> > > I think we either need to fix `fork()`, or keep the current
> > > behavior of dropping the VMA lock before performing I/O.
> >
> > I see. So, this problem arises from the fact that we are changing the
> > pagefaults requiring I/O operation to hold VMA lock...
> > And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> > is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> > anonymous and COW VMAs only while holding mmap_write_lock, preventing
> > any VMA modification. On the surface, that looks ok to me but I might
> > be missing some corner cases. If nobody sees any obvious issues, I
> > think it's worth a try.
>
> Not sure if you noticed but I did raise concerns ;)

Sorry, I didn't realize your first comment was a conceptual objection
to this approach of allowing page faults to race with the fork.


>
> I wonder if you've confused the fault path and fork here, as I think Barr=
y has
> been a little unclear on that.
>
> What's being suggested in this thread is to fundamentally change fork beh=
aviour
> so it's different from the entire history of the kernel (or - presumably =
- at
> least recent history :) and permit concurrent page faults to occur on a f=
orking
> process.
>
> I absolutely object to this for being pretty crazy. I mean I'm not sure w=
e
> really want to be simultaneously modifying page tables while invoking
> copy_page_range()? No?
>
> OK you cover anon and MAP_PRIVATE file-backed but hang on there's
> VM_COPY_ON_FORK too.. so PFN mapped, mixed map and (the accursed) UFFD W/=
P as
> well as possibly-guard region containing VMAs now can have page tables ra=
ced.

Ugh, yeah, I realize now this is a minefield. Resolving all possible
races there would not be trivial and might introduce other performance
issues.

>
> That's not to mention anything else that relies on serialisation here (th=
is
> would be changing how forking has been done in general) that we may or ma=
y not
> know about.
>
> The risk level is high, for what amounts to a hack to work around the fau=
lt
> issue.
>
> I suggest that if we have a problem with the fault path, let's look at th=
e fault
> path :)
>
> So yeah I'm very opposed to this unless I'm somehow horribly mistaken her=
e or a
> very convincing argument is made.

So, current approach of dropping locks during I/O sounds like still
the best solution.

>
>
> >
> >
> >
> >
> > >
> > > >
> > > > I'd also like to get Suren's input, however.
> > >
> > > Yes. of course.
> > >
> > > >
> > > > Thanks, Lorenzo
> > >
> > > Best Regards
> > > Barry
>
> Cheers, Lorenzo

