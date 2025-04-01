Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4A6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwhXc+3Mv33awoyK00ZHq4pdn0DYvpiatBKGbcRAOA4=; b=LVngvnzfjKtgD/b6Z++gSOQ1zO
	GgRO+VytnK4aDG5DEfX1lJKBaul8nzAJmWKgml2B2oSexJ4+pP79egRD3+pOYtt1v+y6wpMMF8YSt
	obJ2upcQ0BK9dICjsXQhYJ7WsOsq4khzr0+Umm+LMpEZJROIqF8WgtVaboKY4mNXot2HYJ9y0R7kV
	fWIf7i99fxHxR3Fq/Qssv7ftny2AbzCzwqn5o/rgJ7m7z7EsCr8YUvik+b54GHyzT+aIIJrB8LSSK
	Y0S6TuCBuorsTqmOoYGLm43hAFP7yC8vsfJ/UTUd7pUng8ad2u3W3D7uQMJ8IVZA+jvfh0QsrKeYS
	wxUZOROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfrr-000000043j7-3Suv;
	Tue, 01 Apr 2025 17:57:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfq3-000000043CP-2Zd9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 17:55:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2240aad70f2so26235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 10:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743530151; x=1744134951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwhXc+3Mv33awoyK00ZHq4pdn0DYvpiatBKGbcRAOA4=;
        b=1T2Srm44mVDk3NhdXl3E2b3W9fESEmWpIspdlOMTJl7bqsfUhfaSMK6l5qPs7ENAto
         pTC8eLPNRJgy4q6t2T9NhzI1r9Os220HfSqALA7drl/T+mshrdaMeHGKTjbNCmUw0FbB
         7gsETybtbE2V4t6Q2Yqpv3/uhw6hW6VGx/1NkTwr8n8M8v2WRnh4ZDIxe4OAMuqXeFhA
         lpfEyGaCcPbSAydZA4y68SNN7KWgaERVa5G9AnQsIQl8TANCayQWuC2/MY6lWkl5dJah
         0FsksbzyV5zqLCprT9V8P6Gseaxwy/rx1ADInIeVsrcRe6nvjBWLaAy6T/bMAhPbixpv
         PWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530151; x=1744134951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwhXc+3Mv33awoyK00ZHq4pdn0DYvpiatBKGbcRAOA4=;
        b=XOaPLz4MS/pFAI6cDY5k5L24VQicJ10kvPTK3RyiPBeo2DrQukLUbs8ouCiYi7eV5h
         /vfkAEAhapRokPPsMUAUhFjF9rE5bC7n7KsCOkffkdlrHmfGFH9a2vQHxIDcgME7u16u
         XaeEZBV/T8A63CRwnHt00u5DeUXuHhC9+j8rXNsizpFTa4c/YTNvt2bTzlp0rkJMlRs5
         gBifbw4qcxqNRDmGYMLbU83M+4p0tViQ3gFOOEk+2laXqAUCQCu+5lSdOMzUmchQyuOl
         Koyg1flaCxOEFiOF+b3twZK76PuHJ/erxHZaGJvX3p7XjBemw4vUC3RiL6ZRmPz3ml86
         1nEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpca/MtM4EpwKYGmqX3XUgmo+JvVOCcJpfxj4w3x3A48yclKyHs+wXvIHyAY2YvGvNzufeBFZFN0A1e9esxyTl@lists.infradead.org
X-Gm-Message-State: AOJu0YyweZKGOvwmw6gok/xMfgqHymMUuTL67INPuwbDRbdSecsvo/R3
	JhC+yt98nbmD+QH165hNz0IXo9o1/8+MxipK1anGf1+LImfXS0iPbXjDvAEKo4rNZ28Cx/woWx4
	dDhBh5QBHSATPKBNcqbs5+fldLlXFAwWPnl6+
X-Gm-Gg: ASbGncsVJG5rU2vrMtRixwiRx1rDcuztvk0ygNYw6xg4SO85vDPyKoL271V9R8VHMCx
	m32dCweYzxKiJXf4EL+QTvnUEt93eTbhlg3PgmoQBAVYLmHaOGazRv/6Hm/2F8ePkdfTOrOAQkN
	A3yGjvchMHTb8Ol+LJlwHKxcV4QIPg9u132SE1fLQ2db1b/xi6ceSGiI9P
X-Google-Smtp-Source: AGHT+IE7+lugkQoCFTK/A+4GPe77QGElu8c0EADC3mRhCAQpzpeh+IouIII0n0V1WBWVNUBlMFPnDVuVctKpkGKQbWQ=
X-Received: by 2002:a17:902:dace:b0:215:65f3:27ef with SMTP id
 d9443c01a7336-22969ddb1e2mr140565ad.12.1743530150219; Tue, 01 Apr 2025
 10:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250327160700.1147155-1-ryan.roberts@arm.com>
 <Z-WAbWfZzG1GA-4n@casper.infradead.org> <5131c7ad-cc37-44fc-8672-5866ecbef65b@arm.com>
 <Z-b1FmZ5nHzh5huL@casper.infradead.org> <ee11907a-5bd7-44ec-844c-8f10ff406b46@arm.com>
 <CAC_TJveU2v+EcokLKJVVZ8Xje2nYmmUg8bvCD8KO1oC5MgmWCA@mail.gmail.com> <76f5ba9b-1a8c-4973-89ce-14f504819da1@arm.com>
In-Reply-To: <76f5ba9b-1a8c-4973-89ce-14f504819da1@arm.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 1 Apr 2025 10:55:38 -0700
X-Gm-Features: AQ5f1Jr2CcyeaoQIJQrpxG5gMN7Sj5YaqmW2gOSH6C-Z8_Xxr2eNEVByBPGBvFo
Message-ID: <CAC_TJvemG2XDky1HtA8g=SG0nv-sONOS-ssEchdymh-_xjBecw@mail.gmail.com>
Subject: Re: [PATCH v3] mm/filemap: Allow arch to request folio size for exec memory
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_105551_662357_8AE914E4 
X-CRM114-Status: GOOD (  73.31  )
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

On Tue, Apr 1, 2025 at 3:35=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
>
> On 01/04/2025 03:19, Kalesh Singh wrote:
> > On Sat, Mar 29, 2025 at 3:08=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.=
com> wrote:
> >>
> >> On 28/03/2025 15:14, Matthew Wilcox wrote:
> >>> On Thu, Mar 27, 2025 at 04:23:14PM -0400, Ryan Roberts wrote:
> >>>> + Kalesh
> >>>>
> >>>> On 27/03/2025 12:44, Matthew Wilcox wrote:
> >>>>> On Thu, Mar 27, 2025 at 04:06:58PM +0000, Ryan Roberts wrote:
> >>>>>> So let's special-case the read(ahead) logic for executable mapping=
s. The
> >>>>>> trade-off is performance improvement (due to more efficient storag=
e of
> >>>>>> the translations in iTLB) vs potential read amplification (due to
> >>>>>> reading too much data around the fault which won't be used), and t=
he
> >>>>>> latter is independent of base page size. I've chosen 64K folio siz=
e for
> >>>>>> arm64 which benefits both the 4K and 16K base page size configs an=
d
> >>>>>> shouldn't lead to any read amplification in practice since the old
> >>>>>> read-around path was (usually) reading blocks of 128K. I don't
> >>>>>> anticipate any write amplification because text is always RO.
> >>>>>
> >>>>> Is there not also the potential for wasted memory due to ELF alignm=
ent?
> >>>>
> >>>> I think this is an orthogonal issue? My change isn't making that any=
 worse.
> >>>
> >>> To a certain extent, it is.  If readahead was doing order-2 allocatio=
ns
> >>> before and is now doing order-4, you're tying up 0-12 extra pages whi=
ch
> >>> happen to be filled with zeroes due to being used to cache the conten=
ts
> >>> of a hole.
> >>
> >> Well we would still have read them in before, nothing has changed ther=
e. But I
> >> guess your point is more about reclaim? Because those pages are now co=
ntained in
> >> a larger folio, if part of the folio is in use then all of it remains =
active.
> >> Whereas before, if the folio was fully contained in the pad area and n=
ever
> >> accessed, it would fall down the LRU quickly and get reclaimed.
> >>
> >
> >
> > Hi Ryan,
> >
> > I agree this was happening before and we don't need to completely
> > address it here. Though with the patch it's more likely that the holes
> > will be cached. I'd like to minimize it if possible. Since this is for
> > EXEC mappings, a simple check we could use is to limit this to the
> > VM_EXEC vma.
> >
> > + if (vm_flags & VM_EXEC) {
> > + int order =3D arch_exec_folio_order();
> > +
> > + if (order >=3D 0 && ((end-address)*2) >=3D 1<<order) { /* Fault aroun=
d case */
>
> I think the intent of this extra check is to ensure the folio will be ful=
ly
> contained within the exec vma? Assuming end is the VA of the end of the v=
ma and
> address is the VA of the fault, I don't think the maths are quite right? =
What's
> the "*2" for? And you probably mean PAGE_SIZE<<order ? But this also does=
n't
> account for alignment; the folio will be aligned down to a natural bounda=
ry in
> the file.

Hi Ryan,

Sorry for the pseudocode. You are right it should be PAGE_SIZE. *2 is
because I missed that this isn't centered around the faulting address
as the usual fault around logic.

>
> But more fundamentally, I thought I suggested reducing the VMA bounds to =
exclude
> padding pages the other day at LSF/MM and you said you didn't want to do =
that
> because you didn't want to end up with something else mapped in the gap? =
So
> doesn't that mean the padding pages are part of the VMA and this check wo=
n't help?

The intention was to check that we aren't reading past (more than we
do today) into other subsequent segments (and holes) if the exec
segment is small relative to 64K, in which case we fall back to the
conventional readahead heuristics.

>
> >
> > For reference I found below (coincidentally? similar) distributions on
> > my devices
> >
> > =3D=3D x86 Workstation =3D=3D
> >
> > Total unique exec segments:   906
> >
> > Exec segments >=3D 16 KB:   663 ( 73.18%)
> > Exec segments >=3D 64 KB:   414 ( 45.70%)
>
> What are those percentages? They don't add up to more than 100...

The percent of segments with size >=3D16KB/64KB of the total number of
exec mappings. "Exec segments >=3D 64 KB" is also a subset of "Exec
segments >=3D 16 KB" it's why they don't add up to 100.

>
> The numbers I included with the patch are caclulated based on actual mapp=
ings so
> if we end up with a partially mapped 64K folio (because it runs off the e=
nd of
> the VMA) it wouldn't have been counted as a 64K contiguous mapping. So I =
don't
> think this type of change would change my numbers at all.

I don't think it should affect the results much (probably only a small
benefit from the extra preread of other segments if we aren't under
much memory pressure).

Anyways I don't have a strong opinion, given that this shouldn't be an
issue once we work out Matthew and Ted's idea for the holes. So we can
keep it simple for now.

Thanks,
Kalesh

>
> >
> > =3D=3D arm64 Android Device =3D=3D
> >
> > Total unique exec segments:   2171
> >
> > Exec segments >=3D 16 KB:  1602 ( 73.79%)
> > Exec segments >=3D 64 KB:   988 ( 45.51%)
> >
> > Result were using the below script:
> >
> > cat /proc/*/maps | grep 'r-xp' | \
> > awk '
> > BEGIN { OFS =3D "\t" }
> > $NF ~ /^\// {
> > path =3D $NF;
> > split($1, addr, "-");
> > size =3D strtonum("0x" addr[2]) - strtonum("0x" addr[1]);
> > print size, path;
> > }' | \
> > sort -u | \
> > awk '
> > BEGIN {
> > FS =3D "\t";
> > total_segments =3D 0;
> > segs_ge_16k =3D 0;
> > segs_ge_64k =3D 0;
> > }
> > {
> > total_segments++;
> > size =3D $1;
> > if (size >=3D 16384) segs_ge_16k++;
> > if (size >=3D 65536) segs_ge_64k++;
> > }
> > END {
> > if (total_segments > 0) {
> > percent_gt_16k =3D (segs_ge_16k / total_segments) * 100;
> > percent_gt_64k =3D (segs_ge_64k / total_segments) * 100;
> >
> > printf "Total unique exec segments: %d\n", total_segments;
> > printf "\n";
> > printf "Exec segments >=3D 16 KB: %5d (%6.2f%%)\n", segs_ge_16k, percen=
t_gt_16k;
> > printf "Exec segments >=3D 64 KB: %5d (%6.2f%%)\n", segs_ge_64k, percen=
t_gt_64k;
> > } else {
> > print "No executable segments found.";
> > }
> > }'
> >
> >>>
> >>>>> Kalesh talked about it in the MM BOF at the same time that Ted and =
I
> >>>>> were discussing it in the FS BOF.  Some coordination required (like
> >>>>> maybe Kalesh could have mentioned it to me rathere than assuming I'=
d be
> >>>>> there?)
> >>>>
> >>>> I was at Kalesh's talk. David H suggested that a potential solution =
might be for
> >>>> readahead to ask the fs where the next hole is and then truncate rea=
dahead to
> >>>> avoid reading the hole. Given it's padding, nothing should directly =
fault it in
> >>>> so it never ends up in the page cache. Not sure if you discussed any=
thing like
> >>>> that if you were talking in parallel?
> >>>
> >>> Ted said that he and Kalesh had talked about that solution.  I have a
> >>> more bold solution in mind which lifts the ext4 extent cache to the
> >>> VFS inode so that the readahead code can interrogate it.
> >>>
> >
> > Sorry about the hiccup in coordination, Matthew. It was my bad for not
> > letting you know I planned to discuss it in the MM BoF. I'd like to
> > hear Ted and your ideas on this when possible.
> >
> > Thanks,
> > Kalesh
> >
> >>>> Anyway, I'm not sure if you're suggesting these changes need to be c=
onsidered as
> >>>> one somehow or if you're just mentioning it given it is loosely rela=
ted? My view
> >>>> is that this change is an improvement indepently and could go in muc=
h sooner.
> >>>
> >>> This is not a reason to delay this patch.  It's just a downside which
> >>> should be mentioned in the commit message.
> >>
> >> Fair point; I'll add a paragraph about the potential reclaim issue.
> >>
> >>>
> >>>>>> +static inline int arch_exec_folio_order(void)
> >>>>>> +{
> >>>>>> +  return -1;
> >>>>>> +}
> >>>>>
> >>>>> This feels a bit fragile.  I often expect to be able to store an or=
der
> >>>>> in an unsigned int.  Why not return 0 instead?
> >>>>
> >>>> Well 0 is a valid order, no? I think we have had the "is order signe=
d or
> >>>> unsigned" argument before. get_order() returns a signed int :)
> >>>
> >>> But why not always return a valid order?  I don't think we need a
> >>> sentinel.  The default value can be 0 to do what we do today.
> >>>
> >>
> >> But a single order-0 folio is not what we do today. Note that my chang=
e as
> >> currently implemented requests to read a *single* folio of the specifi=
ed order.
> >> And note that we only get the order we request to page_cache_ra_order(=
) because
> >> the size is limited to a single folio. If the size were bigger, that f=
unction
> >> would actually expand the requested order by 2. (although the paramete=
r is
> >> called "new_order", it's actually interpretted as "old_order").
> >>
> >> The current behavior is effectively to read 128K in order-2 folios (wi=
th smaller
> >> folios for boundary alignment).
> >>
> >> So I see a few options:
>
> Matthew,
>
> Did you have any thoughts on these options?
>
> Thanks,
> Ryan
>
> >>
> >>   - Continue to allow non-opted in arches to use the existing behaviou=
r; in this
> >> case we need a sentinel. This could be -1, UINT_MAX or 0. But in the l=
atter case
> >> you are preventing an opted-in arch from specifying that they want ord=
er-0 -
> >> it's meaning is overridden.
> >>
> >>   - Force all arches to use the new approach with a default folio orde=
r (and
> >> readahead size) of order-0. (The default can be overridden per-arch). =
Personally
> >> I'd be nervous about making this change.
> >>
> >>   - Decouple the read size from the folio order size; continue to use =
the 128K
> >> read size and only allow opting-in to a specific folio order. The defa=
ult order
> >> would be 2 (or 0). We would need to fix page_cache_async_ra() to call
> >> page_cache_ra_order() with "order + 2" (the new order) and fix
> >> page_cache_ra_order() to treat its order parameter as the *new* order.
> >>
> >> Perhaps we should do those fixes anyway (and then actually start with =
a folio
> >> order of 0 - which I think you said in the past was your original inte=
ntion?).
> >>
> >> Thanks,
> >> Ryan
> >>
>

