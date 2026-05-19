Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE8FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=; b=ye5ydTW5ASHs2gAfU8+rMkLuLK
	TOqccOFDN8wPOJExPEPxaSooZwXwvlDmPSf4mSnRUTo9oQ+3v7dp9Z5q2BOwCt+FUW8BBBQs+BUFU
	mb2Q2D3HDkdJqBzL0qk/bXGKdTFWtdoh20TJTASz3afXrqgXvj7TxhlnLJpTjxry+aDyoeuBwCtOm
	I27zlyfN+JDeogm+sHwA0U3UneEmvRyORS+7rUMnUAKgPLPrRtVX8qqggWab8dSDuJxiebhiXkeBJ
	rdvlCB88B317gWGbEdZH4GD2cIZGuUIInJSVrpF9wOQ9qk6o+WifzUaraFXnR7rnp8jz+Wzku9+VL
	DNe5l13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPNz-00000002Wd9-47UB;
	Tue, 19 May 2026 18:41:47 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPNx-00000002Wbb-28M6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 18:41:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso6583232a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 11:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779216103; cv=none;
        d=google.com; s=arc-20240605;
        b=i9ATsfQVYEm6EDVwQgu2mmaZd76qtvLYf1OiVgR2Tr7xLWFzyMxZRQNfFBe/C8dgXf
         Y2zw5m5kbBzv0fJ3C8j8bic8TK1qQj+RinTXLLWI56eOA4L9coaLlbWxXRTtuYXdsCsM
         gjCxK9hTAjmpXVzhxL6zKxb2yz/mlRMzzNRfdD5hrusj+jz924o+GVH2VAxfxlqufGeu
         IQVvrbFbS56tur3uBbR5xofYocNyQqHv7dNtfQRR32blINwN1a/niRNaNLotsPIdzbCT
         LSyiITmNf4dovQLl3M0hq1TPLiUy/OI2eR1vQrGIMUjuq1WgssZH1pZcFdDylvL32JuP
         vEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        fh=br4iHTlwCItntd99HefCPUUhzqJ/BVHY9PVI5rjjBN0=;
        b=QNVOtuM2jDkwYjMz4pGfDqTfswOMBGyQhxnEh+7giNmiD3RmU+5Qm10bL73U/jknTc
         YfY9kdHpT1zu4mL2cs5NjqDPXEOZWkUggW2TgI5Q8ot1jYnX5cT1Qe9va6vY8545s0E5
         DMrB6p3p8kwIfbL7bB/3Gp/TTx4gOpZkYuQeEK7rU0J3LluXz5GjaYsNLtVymye6JEX4
         EYhtX+SrSTWf+415qvyc62Hf/6+Prstis2MFzSlDNBrj+zH2YcP3ncvq0sOqbPb7eWV0
         CLjzsQ70ovNjAisIiK/hSNKh8ie6T4kzrQcfSWj9P04KNrHUwg/supNnSW1eeNI+A/5u
         LyGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779216103; x=1779820903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        b=CMwLadoItiNjtGsthSArzS+1itMH1ZyKDR4uEQfHfQ7h49n/Fw3Wg8ng7faw1fyoGt
         Pjf4WHU0slSwGjBqV7rdIZyFCxHoUM3EJct4jtai2q0AAYTnNycPdsZC6tHfFXFgPFvd
         zwYoQVbVx5/1lvSp3eMWiMxNl1jMWY+6fatuLPq9kSoxlHJUWqgDZYlU+tASzrU/Id2T
         bQQPcLbFDbZgbiAjw3oyDuNvyQxA/66NPNfYV7qFSREJpYboQ9N4yTZZb/wmWo2XNJhI
         VaEE25n+b4Q2rfqEfoYa55UVi4eMK2yLZmjQZFdS7G6Gw4aa24gGn3q9lAUE1ygA3GLH
         DnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216103; x=1779820903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        b=PGq2SxLEEreuo5MRCIgbeLGAWRkjqXPEBOJviqf0b+73E97vue7DBYMT6u8i50ImgZ
         NeaxcJe5qJEkYWf75SrNLdXa+I2DuyBiGpX6/i+iYYPiogaxQCnhyOU7MYAxZlGt0ppp
         CP48Sd4DHPJwrUVvdbMUuuQc8zuxCUVdFHTjBs1/j5J1niv4xa5cruZWvunU/p+9WCUK
         3fIquP8tcCMjbSgxfvn1/bge0aeU2rfOLxKFM8Udn18sqxLA3+xHkpVN3Zm7SGZn99m6
         H3ePfCSQCz+Dc5MIhpkuiN7K/w2wcSXJK+k/6XWERW37Fhp4CCO2TdGyEBYrvHrx/HG0
         C4lg==
X-Forwarded-Encrypted: i=1; AFNElJ9IiF/fx9J2ecbAqJRt8nsh11EsryrUz/xw9DMVqkr0RVqKVG06k6AGVBmvvggzfbFC1SoqWrECIroKnathCE/s@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6L2mN+2BCHsZIotbm3gcuw/XVPhQ1P80gDAgn34JIPbKVUksZ
	tqbqtQ/LR2oLgVP3+3M0wMqS1dBwyhyzgwCoRosqMfd4zYh63ffFRZiQUIl9Btt2SQZQJJjNLnq
	6CEvCL0Ab6igJ2usUEl7YxiidnLHKr2E=
X-Gm-Gg: Acq92OH9pk9XI+5a+RXCchqEsPD7zzmUVv3rC9K0hs1fCyLBa9037ZrfGUb+aiqxqB0
	6+T81iMv87QzeRsM843awcpzqGuwmVA5hdqFyxT14ycr6FCMUzBd0QjF0kXH8Vuk/VaAp2MnU8c
	cPZkWjaPUSYY3vKQDQuWBYrBkS0fWgQE5srEZmKkH4yqG6IJJEoDufTh8QsPDkjafZ/mR5eZGWf
	iqitHGc3tW4cS2/iJ2KY5np4d4VUTSnPTuhJeFc5AlKHB6L+zIqVq/IhHutNQXIQuwfpbk4FbsG
	lSBwNK8i3w==
X-Received: by 2002:a05:6402:524c:b0:67c:96e7:3427 with SMTP id
 4fb4d7f45d1cf-683bad350f8mr10588073a12.0.1779216103209; Tue, 19 May 2026
 11:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <agxfLNuLCAT3F4cW@lucifer> <agxnJ8R-G3CRjeTR@lucifer>
In-Reply-To: <agxnJ8R-G3CRjeTR@lucifer>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 11:41:30 -0700
X-Gm-Features: AVHnY4KjLtyViRy-FP1MJx-LYZJZfACCXodkXf2RGwVY3_NriDPxFvXtK5Jn_zQ
Message-ID: <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, surenb@google.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_114145_698576_9F7B0864 
X-CRM114-Status: GOOD (  50.15  )
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

On Tue, May 19, 2026 at 6:39=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Tue, May 19, 2026 at 02:12:10PM +0100, Lorenzo Stoakes wrote:
> > On Mon, May 18, 2026 at 02:21:14PM -0700, Yang Shi wrote:
> > > Maybe a little bit off topic. This is an interesting idea. It seems
> > > possible we don't have to take vma write lock unconditionally. IIUC
> > > the write lock is mainly used to serialize against page fault and
> > > madvise, right? I got a crazy idea off the top of my head. We may be
> >
> > Err no, it serialises against literally any modification or read of any
> > characteristic of VMAs.

If I remember correctly, you are not supposed to change VMA
flags/size/mm pointer/vm_file/pgoff/prot, etc, under read vma lock or
read mmap_lock.

> >
> > > able to just take vma write lock iff vma->anon_vma is not NULL.
> >
> > Except if we don't take it and vma->anon_vma is NULL, then somebody can
> > anon_vma_prepare() and change vma->anon_vma midway through a fork and c=
ompletely
> > screw up the anon_vma fork hierarchy.
>
> correction: this won't happen as per Barry (see - I managed to confuse my=
self
> here :), since for vma->anon_vma install we take the mmap read lock.
>
> BUT we also have to consider other cases.
>
> >
> > So no.
> >
> > >
> > > First of all, write mmap_lock is held, so the vma can't go or be
> > > changed under us.
> >
> > vma->anon_vma can be changed.
>
> Correction: no it can't :)

Yes, vma->anon_vma change should require taking read mmap_lock.

>
> >
> > >
> > > Secondly, if vma->anon_vma is NULL, it basically means either no page
> > > fault happened or no cow happened, so there is no page table to copy,
> > > this is also what copy_page_range() does currently. So we can shrink
> > > the critical section to:
> >
> > Firstly, with no VMA write lock, !vma->anon_vma means a fault can race =
and
> > secondly copy_page_range() checks vma_needs_copy(), there are other cas=
es - PFN
> > maps, mixed maps, UFFD W/P (ugh), guard regions.
> >
> > So yeah this isn't sufficient.
>
> However this is true...

Yes, fault can race with fork. Basically this is actually the purpose
of this idea. We can have improved page fault scalability. In my
proposal (take write vma lock if vma->anon_vma is not NULL), the race
just happens on the VMAs which page fault has not happened on before.
vma_needs_copy() also skips the VMAs which don't have vma->anon_vma.
So there is basically no difference in semantics other than more page
fault races IIUC. It should be safe as long as we can guarantee there
is no writable PTE point to a shared page after fork.

For guard regions, it can be serialized by vma write lock if
vma->anon_vma exists. If vma->anon_vma is NULL, it will prepare
anon_vma, which will take read mmap_lock if I read the code correctly.

I have not investigated UFFD yet.

>
> >
> > >
> > > if (vma->anon_vma) {
> > >     vma_start_write_killable(src_vma);
> > >     anon_vma_fork(dst_vma, src_vma);
> > >     copy_page_range(dst_vma, src_vma);
> > > }
> >
> > Yeah that's totally broken fo reasons above as I said :)
> >
> > >
> > > But page fault can happen before write mmap_lock is taken, when we
> > > check vma->anon_vma, it is possible it has not been set up yet. But i=
t
> > > seems to be equivalent to page fault after fork and won't break the
> > > semantic.
> >
> > It will totally break how the anon_vma hierarchy works :) See the links=
 at the
> > top of https://ljs.io/talks for a link to various slides on anon_vma be=
haviour
> > (it's really a pain to think about because it's a super broken abstract=
ion).
> >
> > You could end up with a CoW mapping that's unreachable from rmap and yo=
u could
> > get some nasty issues with page table entries pointing at freed folios =
:)
>
> Correction: actually we should be safe given mmap read lock on anon_vma i=
nstall.
>
> >
> > >
> > > Anyway, just a crazy idea, I may miss some corner cases.
> >
> > Yeah sorry to push back here but this is just not a viable approach.

No worries. Thanks for all the feedback. Just tried to explore whether
such an idea is feasible or not.

> >
> > And this is forgetting that we have relied on page faults being blocked=
 by fork
> > _forever_, who knows what else has baked in assumptions about that
> > serialisation.
> >
> > Forking is one of the nastiest parts of mm and has had multiple, subtle=
, corner
> > case breakages that have been a nightmare to deal with.

Yes, this might be the biggest concern. The page fault can race with
fork. If some applications rely on such subtle behavior, it may break,
but such applications are fragile too.

> >
> > So I'm very much against changing this behaviour to try to fix somethin=
g in the
> > fault path.
> >
> > We should address the fault path issues in the fault path :)

Yeah, this idea was inspired by Barry's "not take vma read lock
unconditionally" idea. Maybe irrelevant to Barry's priority inversion
problem, just an idea for further optimization on page fault
scalability. This probably should be a separate topic.

Thanks,
Yang

>
> Above still all true though.
>
> >
> > >
> > > Thanks,
> > > Yang
> > >
> > > }
> > >
> > > >
> > > > Based on the above, we may want to re-check whether fork()
> > > > can be blocked by page faults. At the same time, if Suren,
> > > > you, or anyone else has any comments, please feel free to
> > > > share them.
> > > >
> > > > Best Regards
> > > > Barry
> > > >
> >
> > Cheers, Lorenzo
>
> So still a nope :)
>
> Cheers, Lorenzo

