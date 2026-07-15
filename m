Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EF9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlCdiDCuNOg+oM0l5549TpY42RHO84zDtXRUOJei+fw=; b=JQODUX4XofkK/EeaW44zj/4dup
	vD/CgTxIsgjnenxMqr33J6kUdZIXKdc6Z78fkzroguoaKzS8M12xuokUQdgR5Am5nP2THfujyyWym
	eh+Vlxl4LiGn1tg7VNx+t0alpxBtod7JTLFIPQXjY9ddpAcsOo4s6MIhTVAlsmDGHfsXLer4/Xdp2
	VrN33TqM4bmLXC1q6xLwiPTcP78DePH1TVj7kOZBvKxRdVuPnbl0IOxwI3mJv91TWzUivmOoZV1Ud
	y3Ca3bnUII6XaltocKiLliQ0fsWaHZEKSGHOCCRkYPnRLGQXJLOAMHtr32bqSPUpjT6FmwJ1BRFZ8
	HZFYHftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjw4t-0000000ELNQ-176b;
	Wed, 15 Jul 2026 09:38:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjw4r-0000000ELMr-0330
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:38:54 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c15d47266baso240472866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784108330; cv=none;
        d=google.com; s=arc-20260327;
        b=lyj0dN/y4JyQkdl4cG+r7obQb1Yg5F2+Ut9R6bZvcrOV+ao64NsgXjOC1RfeH4H/lF
         epNktOV2Shrwo7Xy5BKM3tr49AXl+9jzzLhiOVbmNHztcF+cZYncAytj6Kw5gOGTzVaN
         S9f9ersrT+V28ZIY/6PNHmjX0lKjttu/lQeiPSNp7GcjpM6wYkEo7+Ujt4j88UCGFr1O
         TcSyvhNgnnm0MaTuxK8m7vUfppU76XGpHX5tDHmnuhpS9Ae2cvBs92tTNPaE+blA6JAp
         b2st/wGloP8vXJBbHrZHFVRjFkscg6Z9nOu9CaJYt8KA1LMjfudYm6fNsZ/M57DMFpHt
         /nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hlCdiDCuNOg+oM0l5549TpY42RHO84zDtXRUOJei+fw=;
        fh=DSOqltwBeGY2iZj4VN6SY0j1uG5Jcm+KsKZvvui6HD4=;
        b=mSpfFTM6JERegCFYj7yzC5cFp/jzF9rnAAJjii6iytbXIcmL+FxiQh5StCzJDwFKam
         iOUcgOWSTA52hrGP2b9ef0GnQ7mABwFynfZ/HZPFrH025hK5kpAvtfjtBjNlkC6CyWTp
         8atxr62HRUgAq6fSicM1HU8sZ44EMn64AswhHnyJ+DXp5v3CI2xDAUVH3d1nibCyCEqM
         wMPOk2S9QATaUzvHkn4s/gh+pNrLlUVExtfL95NjT+KPiDuVX1GtFIvdllcOy9+X1nXX
         Bu8GlnjiBDRynpEpcu/oiWjyOYA2uhBV0TEMzxR33VQbnyuwpb19JpInxcR6fxnYuue6
         c9OQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784108330; x=1784713130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlCdiDCuNOg+oM0l5549TpY42RHO84zDtXRUOJei+fw=;
        b=bydVZNl8TTBgA54Io8snuQkHJFEbt//JiikB9XaPYaVkX5PzAd+4rJ31o6ylkMV3VC
         XrfvZtWfEq0pX6ilidKJDh454BgHV+5C/H6es33/C7YZl2A4R+z+xdRm5Q34thivr4U4
         pnDqQD10qbU0jeJ0vvh3teEr68NQJhfXEiMt/1vdzbQiiWAOILul9SdHJane2K4h34Um
         l1ehG+sqz75mfb0uWJyLt2IxtItRehoytHrcY/n+36izDPWZF3HApXlz3nwyJbSCWL4Z
         PXQwV9jezVtcMtu6+ioYeMy1S58JUHJSN77tlVrukTLl+xbCodV3oG3gD6HUclZrWsB4
         3NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108330; x=1784713130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlCdiDCuNOg+oM0l5549TpY42RHO84zDtXRUOJei+fw=;
        b=HNrbIl9iyYEVVC5iEzWuQz3r9vQODtFyx9aGyGtsT1dUMYccy3cRzoE/Y1dprKdxLM
         2ltdyXGawVSCTiuG8RX0ObQTyRoas/AB+SYynSxocVRgSxlROkxb7DFdNYCOpyWlEC//
         qeyNQi2faaPvddw2zM4tT6U5SsUUeDH8hzSrcgRDJ/WoL7OfjatleYcIDIvGEeGyaBuc
         M8scyoccuOBb68wzyLEV6ze3mzWyPQ97OaPsvs97dnLnqaeG/JsXg4GNNpZeoFdowP4j
         jcEqRiEgg80cmCKMyxQWOLYSamMmn0WyQ3p855wnvwVWaApW6k79oOML5JKtNnM8QUCA
         jHtA==
X-Forwarded-Encrypted: i=1; AHgh+RrcReInnvSiNVrcdQJMDEYNIYtGvyD0uh8j+roIFj0TuWl4eUl9WJlBiUjCzMmlwM7MXM5ZSiM5qnCxA1wKSXxS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3j28kpaacpb1l3NZucdVAmSdZedDhJbg0e+jrx8okmSLyQnXh
	RIi/mIcIT41Xs9265OtLLENwQfkLypU98RI27Hy3gJzkNmMLjOD0JJGyoWNh9ctOGOgmfHqBHMA
	JZPTVJz0xRYfQp/c+1SHORTq9FC89cZG8pQDLWKQt
X-Gm-Gg: AfdE7cnL97jbP2RqPZix9YFe/xtZvBsBZddE0Pf45ezeYADrCPHOFfjwwCTcDrqAxVr
	jX6g3gz0LDQJQa1aIaGiBjvx3YXkqazoZFq0RVSCKwr1mDcQftpbDNlSypsxp2l/yKlJ135dWgI
	tQGLpxhFDVyPMl3RWq22sXV3G0fypsrykDjM8GiVj4fTnX8Tcin/yhI4K7KDIq1JnjuCT61p/75
	DZdZHu4Su39760uCoBva5R6utdpclSQzlcPSM9xivWsMaK+/kqciLb8RAZot39s+0nI8S8Rt23j
	WKcZza8I/5vp7bdJ2ftAlL7ruejPBPNgQcMTmA==
X-Received: by 2002:a17:907:d649:b0:c16:5cdb:9f89 with SMTP id
 a640c23a62f3a-c165cdba195mr407892766b.64.1784108329574; Wed, 15 Jul 2026
 02:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com> <alXtiUdmabf1TZgj@pedro-suse>
In-Reply-To: <alXtiUdmabf1TZgj@pedro-suse>
From: James Houghton <jthoughton@google.com>
Date: Wed, 15 Jul 2026 02:38:12 -0700
X-Gm-Features: AUfX_myIs6bbA044i3f04eq_NmxBtb4BfJcsT1MwLx8M4bfJdbMEg5ucyCfK4FI
Message-ID: <CADrL8HWv1y93+ds+B3Kc9a61NJkj6DmOkkibwDp+4rpocEb-CQ@mail.gmail.com>
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
To: Pedro Falcato <pfalcato@suse.de>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_023853_086393_F0A48CBA 
X-CRM114-Status: GOOD (  30.81  )
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

On Tue, Jul 14, 2026 at 1:46=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> Hello,
>
> On Wed, Jul 08, 2026 at 03:11:10AM +0000, James Houghton wrote:
> > -- The AF trick --
> >
> > The trick is that translations with the AF unset cannot be cached in th=
e
> > TLB (see Rule R_DWZCQ in the Arm ARM), so they can be atomically update=
d
> > without needing a full break-before-make sequence.
> >
> > So the PTE update sequence becomes:
> >   1. Atomically clear the AF on the existing PTE.
> >   2. Invalidate the TLB.
> >   3. cmpxchg the AF=3D0 PTE with the new PTE. If this fails, goto 1.
> >
>
> So, this sounds really cool but I'm not sure if its correct. Looking at
> D8.17.1 Using break-before-make when updating translation table entries:
> Per IGXGZY:
> For a translation stage with AF hardware management enabled, if a transla=
tion
> table entry is modified and the break-before-make sequence is not followe=
d,
> then all of the following failures associated with AF hardware updates ca=
n
> occur:
>
> - When a memory location associated with that translation table entry is
> accessed, the AF is not set.

I think this clause is referring to the case where a CPU updates a PTE
using something like STR (as opposed to SWP or CAS). If CPU 0 STRs a
new PTE while CPU 1 accesses memory through the old AF=3D0 PTE, the AF=3D1
update will be overwritten by the STR of the new PTE.

This clause might be suggesting that implementations are free to
implement something like: "if the cacheline for the PTE cannot be
grabbed exclusively, drop the AF update but proceed with the access".
To me, this interpretation is incompatible with the rules in D8.5.1,
summarized in I_GXGPN: "When the translation of an architecturally
executed memory access occurs, the architecture requires that AF is
set to 1."

But IMO dropping the AF update isn't actually important. It's okay for
the kernel to use the vmemmap while we are updating it, we just need
the translation not to be cached. AF=3D0 does that for us (I claim).

> - When hardware updates to that translation table entry are followed by
> stores appearing later in program order, the ordering required is not fol=
lowed.

I assume the "ordering required" is that the AF=3D1 update is
ordered-before the later stores. I interpret this as a natural
consequence of the earlier statement. If the AF=3D0 update is "dropped"
(overwritten by a STR), then seeing the later stores (using the old
translation) does not necessarily mean the new translation will have
AF=3D1. Maybe I'm interpreting this wrong (I am up late tonight...).

> So apparently per the ARM ARM you can possibly never observe AF=3D0 even =
if it's
> cached.
>
> And then other semantics concerns may arise e.g I'm not sure if AF=3D0 im=
plies
> that the walk cache has nothing for that address, or if it's just that
> particular translation that's not in the TLB. Though this might not
> particularly matter since we're not collapsing the PTEs back to a PMD blo=
ck
> mapping.

I assume that when the Arm ARM says "cannot be cached", it means "no
TLBI is needed (to avoid TLB conflict aborts)". In other words,
partial walk caches need not be invalidated.

D8.5.1, I_HQBRF: "When software sets the AF to 1, there is no
requirement to perform TLB invalidation after setting the flag because
entries
with an AF set to 0 are never held in a TLB."

If an implementation caches a partial walk that includes a AF=3D0
translation such that a newer translation can conflict with the cached
partial walk, then a TLBI would be needed and the implementation
wouldn't be compliant.

> Right? Tell me I'm wrong :)

Thanks for looking at this Pedro. It is really late for me (I had a
long day, but I wanted to get back to you), so sorry if what I've
written is a little incoherent.

