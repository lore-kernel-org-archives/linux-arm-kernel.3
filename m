Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0257DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=336SA/GYT1P2VucG2saRmHJSICv9pfFSfhTN5OgEmxw=; b=SkC/xBApPE4LeSxsUgAHXkteqR
	xrPPc6hMQesYhGYLfR/c9vyvCFScUn6/ovWwEdqixjIZmIA0ChOL1BTtFlHXdeD6T69jCxGUcmJ7W
	Pw04XBfzipmSVmrTvO4z26F1k8aKWN30FtrJyruxRZcBeRowVC8GBH3WqTrtnUEq26FD93Wzrq1fl
	+KFj4JuIEM48PMM/BURNSkXmQdLv/XxgGUhdI+zHPWLjPO8h6ScAG4S0QhTxRsEMVnj6ASbWodXTg
	ZSKhRjJxPxcwuNs6tfs2L9vxsENy/pP+4J8eUEhq65H9CtXc6GkjXqKX3boJIyzfymnYiYwU4d2Jh
	G+H/p+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjej-000000059GJ-3P43;
	Wed, 20 May 2026 16:20:25 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjeh-000000059En-10p2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 16:20:24 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50d864c23bdso14141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 09:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779294022; cv=none;
        d=google.com; s=arc-20240605;
        b=J9xOAl2gnSO67SV6x5Z6YKLs5G+/oA8mkprUU3haC6hpPSddPV/D+wXUsKERUqpUFq
         wzdgkyHtspMGJTDDZrBBGJC929R9i+RF432WTBOcznaqUSWIyDXOdr8WmhcjvxLpeEYi
         CPwQ5NEndsH03htIjXmsh+ZAbGdDg8W+77Sro3og+uYqjclJWZ3FKnPz1m0Fue0aJdQF
         J5j7B6/9ypu0A/isFhkg0c8h7v3E/IUmCyB5Qsvodn9Vv+HyKpdWX6nhgs0ijsmt7nnc
         MYhc8C3geiQjnUVWpievn4gSeI5Kw+1OkU4pyXG+9Rc2OyjN1jVYca9ZL0hCXY/0m+xt
         /8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=336SA/GYT1P2VucG2saRmHJSICv9pfFSfhTN5OgEmxw=;
        fh=//gwT8DGixVR1j5ic7u8zWMCrCU3x+cZ3J8nD9oLgw0=;
        b=Va4xObSAm/FPZ96eoLzvXMJ9yxD0fx+lV1lnzi+g0ucLap0WGyD3j9fDQ8p1sGGPAD
         FHhMkEWrDnp0JaG81kAxjCXK8m2ZZOLuVwHgvfyCKdC25SzFY6Ocn7UU91z10PTaewXR
         0UpeLlRA1FQ08i3fP0atkN6K7gKVHUC9ZgEoJTGBgyEAj+WNNwExUKqgz+B7B5c9uQst
         LOFFf+nEnLO3F5J6IfWBkGnZYRVhanWKGbBw1JySOhbNhNAGxJsgBp4JaUHrvwh7s8F6
         WL+iF2EYKniltQQ0QzUVg/uHVGc9/Q5LXUD2qXlzEdBipM+4yQoberNM5t25KpvBAqCn
         vKIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779294022; x=1779898822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=336SA/GYT1P2VucG2saRmHJSICv9pfFSfhTN5OgEmxw=;
        b=drVULLYmLuxOJ6pBD+XCT++XAc07vyx7n8eA2chr/8z0UpOV22NLNB7IpeFYIrXf+6
         1/4cqVXWfocaaWswPxELaiWJtAPlHhKFg7nph7eIh/noNUqZ1Aay8z6jRGRvViP3IsJr
         4rpcbgaGsXZzZ+HHOGqXEoNrotlHphC6lVN3MFYJVu1Vda3PJ+WJPN518bzLky288WrJ
         Vor8ZalDCQEBs+uhL+ZNkjizKkk49amgtYIdJB5B+yn33VYWX4gCCqndCGTxdH50d96d
         cNYfTb89uNPcvfYF53OH8m1jW97TYHy+D1ELYXAqDqHf56W50qKjiCOW7J2tDPF5lAs5
         MoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294022; x=1779898822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=336SA/GYT1P2VucG2saRmHJSICv9pfFSfhTN5OgEmxw=;
        b=oNJPZ+mmUhkacW4RfvpYsKGbpPg1TiMFIJIDUnVO/HuEpm8/RQqTbelf+kqc9lYkcl
         LqzE3kCa8293WIWaT4ERKgTM0QqLxiWU2myhs0ZlWh+RtKOXmjzliaTq8d417/9zanRN
         fGj0mY+8K4GykEP7IoM1IoFgjZZ9wMhiGMHhSETKKGjth7aX7BTtdrjn00tghxs2gTa3
         q0eb4tRE7c3ZZyWe6LLUeXiH7E2FLzXvGW9Ux4ZjaihIJoMN60qMJaQLOe/VBZTvORtx
         dQ7iERHe6mrGWrCvC81zPj04aS6tytEJ2qAd0s+nS90qu71Mw2GIiShJ7W83E/zVSxq6
         Iwgg==
X-Forwarded-Encrypted: i=1; AFNElJ8s1X+7X4QkBYKQ5ygcmAQ0Q9+WBb3BMvuTLuzT82B1fXp6NStWchagDjUd1cao/pCcNQ/+4Ut4HGX8DqKpQnq3@lists.infradead.org
X-Gm-Message-State: AOJu0YyzKZh6FxbG0ZAN8BCzDfzhOC43U/Ijc7Jmdg+E9ETxxBMq0l7i
	eqIql7tjv/PIgcjT4/Sy1LxYwjiDtcVBvlW8zSNy4hcENAd9QsJ4BVvtijGjmH9klJ1CQ+w9QCA
	/Ki59JNO5qz6cUB0IxcnTc6rQEKeMUNPQesNkxYy5
X-Gm-Gg: Acq92OFSnPvpjYQqSjy1pDe8gU4JfsdN5ufqAwieBWx7qbq1opeI0fROUl18yWg3my0
	mxzWTEhGac53wJLrt+vcJQNTLYpfBiSc0SZ0TrJtBQM8X1BBmmUQgb/+67LimzLWnlKP491S8sK
	iRDnXgi/vezrP3Ztv64ZHjR5OBdGlrEiY+IINLd5GVshJo4Ru/fnPp4ZNRyH486Gy/aNYtbA9en
	uLaOMn0+DcbXbT5G5DfIVmFzui9SI5AhTxUXS9d/4ZEppe6dJlOqfV7lhdkQJ0B3VlXI5DlkrQ7
	gTjAnSDsUcfq2P7vMStqjhTVq4E=
X-Received: by 2002:a05:622a:1ba1:b0:514:c25e:c164 with SMTP id
 d75a77b69052e-5167937f1bemr20762781cf.10.1779294021124; Wed, 20 May 2026
 09:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer> <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
 <ag1mk2DSJsiORaxK@lucifer> <CAGsJ_4zN5ezh9vvvQDQdMF2KuuDGvkhNjTZWc0y0Lsa-P4Aahw@mail.gmail.com>
In-Reply-To: <CAGsJ_4zN5ezh9vvvQDQdMF2KuuDGvkhNjTZWc0y0Lsa-P4Aahw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 20 May 2026 09:20:09 -0700
X-Gm-Features: AVHnY4LoOxiQoJQwfyBuM7QQXQEEIIq-qCobTd7La33Msde42KTqBRrMiQ1PsG0
Message-ID: <CAJuCfpHbKHjktnucBNAuRDSasHiZfFDP6xgz2dX86dX1VaJYzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
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
X-CRM114-CacheID: sfid-20260520_092023_484107_A05805D2 
X-CRM114-Status: GOOD (  45.34  )
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

On Wed, May 20, 2026 at 2:07=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Wed, May 20, 2026 at 3:50=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> =
wrote:
> >
> > On Wed, May 20, 2026 at 05:18:52AM +0800, Barry Song wrote:
> > > On Tue, May 19, 2026 at 8:53=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.o=
rg> wrote:
> > > >
> > > > On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:
> > > >
> > > > > >
> > > > > > I think we either need to fix `fork()`, or keep the current
> > > > > > behavior of dropping the VMA lock before performing I/O.
> > > > >
> > > > > I see. So, this problem arises from the fact that we are changing=
 the
> > > > > pagefaults requiring I/O operation to hold VMA lock...
> > > > > And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> > > > > is_cow_mapping(vma->vm_flags). So, we will be blocking page fault=
s for
> > > > > anonymous and COW VMAs only while holding mmap_write_lock, preven=
ting
> > > > > any VMA modification. On the surface, that looks ok to me but I m=
ight
> > > > > be missing some corner cases. If nobody sees any obvious issues, =
I
> > > > > think it's worth a try.
> > > >
> > > > Not sure if you noticed but I did raise concerns ;)
> > > >
> > > > I wonder if you've confused the fault path and fork here, as I thin=
k Barry has
> > > > been a little unclear on that.
> > >
> > > I think I=E2=80=99ve been absolutely clear :-)
> >
> > On this point sure, I would argue less so around the fork stuff but I r=
esponded
> > on that specifically elsewhere so let's keep things moving :>)
> >
> > > We should either stick to the current behavior - drop
> > > the VMA lock before doing I/O, or change fork() so that it
> > > does not wait on vma_start_write().
> >
> > Again, as I said elsewhere, I think there might be a 3rd way possibly. =
It's a
> > big mistake to assume that there are only specific solutions to problem=
s in the
> > kernel then to present a false dichotomy.
>
> I recalled that when we discussed this part in my slides:
>
> =E2=80=98For simplicity, rather than using a whitelist mechanism for
> per-VMA retry, we could use a blacklist instead: default to
> always retry via the VMA lock, and only allow mmap_lock-based
> page-fault retry for specific cases such as
> __vmf_anon_prepare().=E2=80=99
>
> Suren mentioned introducing a FALLBACK flag. With the
> FALLBACK flag, we would retry via mmap_lock; with the RETRY
> flag, we would retry via the VMA lock.
>
> Not sure whether this could really be called a =E2=80=98third way,=E2=80=
=99
> but it seems more like a shift from a whitelist model to a
> blacklist model, without changing the fundamental design, but
> it does change where we would need to touch the source code.

I thought the conclusion of the LSFMM discussion was that this is the
direction we would take. Maybe there were followup discussions which I
missed?
This approach still drops the lock before I/O but after I/O completion
it reacquires the same per-VMA lock instead of falling back to
mmap_lock. IMO it's the simplest fix for the issue you brought up.

>
> >
> > We absolutely hear you on this being a problem and it WILL be addressed=
 one way
> > or another.
>
> Thanks. This is a bit of light in what has felt like a fairly
> dark situation. I really appreciate your thoughtful and
> responsible approach.
>
> >
> > Of the two approaches, as I said elsewhere, I prefer what you've done i=
n this
> > series to anything touching fork.
> >
> > But give me time to look through the series please (I'd also suggest RF=
C'ing
> > when it's something kinda fundamental that might generate converastion,=
 makes
> > life a bit easier on the review side :)
>
> Thanks! Sure, I=E2=80=99m happy to wait and there=E2=80=99s no urgency.
>
> Last year you made quite a significant contribution to the work
> when I tried to remove mmap_lock in madvise. I really
> appreciated it. Now we=E2=80=99re back to the same lock again, just in
> different places.
>
> Best Regards
> Barry

