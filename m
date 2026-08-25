Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B61C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 00:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTp1QihCYEXpe6qsqboacrSH7t7RIuheiExabYlABLw=; b=wrOQRJwKynbIxklxNb37w68R28
	IcOjEmjCp2SzXXlN1jBb8ScWsF2cZpZ6ElU3yUqtIFjpeKy1+r6BpvPM2cmDR6hkMS0wjGJW2q/NF
	623a5gY0J0w1Hn2czjhAl3mlEiuJGIXqTWm8XG53M6Tmv6CF90zLWafjQmXXLcpsreYx/2mZVUTcR
	0vksupYlQa4rkJSmf9UvwYMEwxjQLXwODnITTAljQTJV53V2DRILv/y//bo0eUvN9R9I0ocgspgv1
	E1j6muqNpFiKi5w8EHPjjkeNFy7pKNklkrCllitDv0TlMi+XwmddZGgUblTUoVdlSa8/V5rcTSWCv
	wlq8V2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyesM-0000000HWoP-1Bco;
	Tue, 25 Aug 2026 00:18:50 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyesJ-0000000HWnS-31bH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 00:18:49 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c207cb16cf5so653263066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787617126; cv=none;
        d=google.com; s=arc-20260327;
        b=Gl0B2edEHA2wZefWDvc/tWcUm/qE8yYiN/r1z0wpXDRGV4RQpHs8wP7U+/WfgjLb7R
         911UX7QiE1QdiUGGXZGFvQ3+fbv1puLorE7jPKjKB8FqhRHZoA7g0XEPJm7b9Jitwx6J
         NVAa5uAzHe3A/QIlkeFJmnBRz5cWTfxOOf/1VQsuqjJttAr9VMxyovszKL8QXchsz5G1
         dhqSJmqKtlfXpPlfEatctXBvkwSTb47IppsahGXC3o1ng3NU+igkluAA7kait6QoFnkN
         XsPOIUAGVndHTCbZplE6KZzodIynC7z9SjBjjGObpmhXJNdY0A9jvjq70oBwbWmWygMF
         7gWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTp1QihCYEXpe6qsqboacrSH7t7RIuheiExabYlABLw=;
        fh=DqfQne1HlwZuRuCPbWsLBlwTc5P5VeM/tmDi0PePrTI=;
        b=eV94cZk+q5lMbKjfBSGfXGkr5kHoEITD20f3gKK6ZmYiOtbGTbfrlrHmZROHXH474o
         KJkY40pf/ELMocJ9dbZ0ijEuzxYX/XWjjkSMw2wyH3cIl4u0J14MWiv8QcI4XYJsUzS3
         FxH+oQliERNxUDGF/TzX21bOvghM4JZwuWfJbJxdNYJUDsoEOs4lhwgYC506mb4bk5GU
         TcYZCBRFPyC8qvQsKXjwxfNZM9Jvgg3DVtpdXfIEfK32fhK2GPTSwJexj14tf6sJLfmx
         vVLlT7cWmy9JCZzoQny1OJP8KGdcWlisOZjk2NpCfl+R76wyv/gAzmICt2kbW4GsdV8X
         n7tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787617126; x=1788221926; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTp1QihCYEXpe6qsqboacrSH7t7RIuheiExabYlABLw=;
        b=CD3JCH/eGBo0mryMGAyMxlTur7DhS4ma6ZI8MJOLgPgUTuN2BxILVs45ETe6MNFeDf
         BDBbVVkdK2SM/6fKN98TV9DldAEodgefhyIg6A65XTrBUOFvjNHO/mkuJ/besKPiJWba
         Ckq5o/K7K4xFmyD9rfhkxYIWBZmXk1B1QzwB6fnLCoj8b59TsqQgbaz9LuJOwT7FSPpz
         kU0MGWnb7Er5CEDr1BCYQSJS2Bfm4x5pKwW2UaUGnK71G3eHZol7fkpUF0pFaMgrVDxz
         xkUCCncieuggziV2GGxD17cAW4DVAlvynDIut5aUOHtJDyY/gYtSjUB56q1hBCMIuc3P
         Qusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617126; x=1788221926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTp1QihCYEXpe6qsqboacrSH7t7RIuheiExabYlABLw=;
        b=GOM0lt1JESVvv3utsveFKD8/dX0SpTegmyDCxkeyYLfVVKCcImp8g2fLqrWK1k3YwS
         T3PfI6Y7DMiDDvL38gHWa9+LzMbEbxyibSYCUM1hkHmrbYlKrrgfl7PGojHxAMeWb97Z
         rIZrpth7Nmsk+kxr5f3ckKZSBGd0UilpVpO4PaKW0k/ODMuEiXFLY/PdRvvmxtj4y6jV
         AaK+1kRzZoUOh9HnBG1YLcUk+qVnWQrl/IWhtWkx65sVscnczJzLbV0gJRW1RWi+L2zg
         60NTVryAfaXK0+NtrZjAkNOqNmrOpSrGZY4t4v3kJPqpLJpIsk6SJxrEj4Jrx66sCQyd
         h2MA==
X-Forwarded-Encrypted: i=1; AHgh+RrTEnaT0Wf5jG2hcNGYwagvUtzv8zJxoVNY70jB8vyxq6PnCu46YAzzCtgHbneV/aM3yVrCEnu9/SLnCTljsyk3@lists.infradead.org
X-Gm-Message-State: AFuF++kiWpxcDRf7h8tGRZnVP99cWQp6W6/MTQYiFcX/U/u3IAXcT13B
	4pJQnswa2v8qzPbewUQouztFcwH7zBNI5LiDwvwtCSZZfXx3BxNB4ion+C61w6/TVah1zOO3kfE
	scc1NmG9QZmU1eIGLHe8RWSPfgeFsYQ/pSPTQ6O55
X-Gm-Gg: AR+sD123nbgPYkYC30g3xW1cUBrllYv6u4PyE2fo0vv3U11DO2K1rFCsEyPvEOxQBRy
	XJhDSQcUSMpgRWiqamOhbPtSXNuCJWKh5vLzh15I/2an/8Bi6fDd16/Dz3lIMYzVll8HYS83l56
	mnX1M+xkC5L5p8i+d6vRymoS63YlDYPUQ8O1sgcnFq9qBSoGiTsNFcQqgAAQSN4Cgd4gWM3pv/v
	TV2uymGw3r+hApF9vtxOfKqSCcYKqfnsWq14BZarLA8u63AujyrhbYPX54HZH+/hA3/CUpdZGWa
	1/8wTMInfaXOdRYiqes0FRCNTHHtT5cyXGCJhdgzulhbiv9ldwrbdsG6vxKHFeFYmuC4UmUhSY2
	z3mzV4NFruIILMtToxjhl8hrP89RyVDQMOsdop0wk3B8UC2WJ9I9slnUsu4cGQ6WAhRHHd695n3
	xX/Fri8DFyyfiF
X-Received: by 2002:a17:907:8b8a:b0:c05:b9db:68cc with SMTP id
 a640c23a62f3a-c2469f7b668mr3312806466b.0.1787617125394; Mon, 24 Aug 2026
 17:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-11-jthoughton@google.com> <aoRpJxCMTQ-RvTKX@arm.com>
In-Reply-To: <aoRpJxCMTQ-RvTKX@arm.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 24 Aug 2026 17:18:08 -0700
X-Gm-Features: AcwNN1UFhVuLrUR3HXGvEKpoyqSN4DfWxj3pmibwZcQrKAo3zbJpABjhy7myW-c
Message-ID: <CADrL8HV7_9AyNS7gPmSMD+qrgTFvMNu2-RiDLf8mroZf2rFC9w@mail.gmail.com>
Subject: Re: [PATCH 10/18] arm64: Support hugetlb vmemmap optimization
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_171847_773758_07C18929 
X-CRM114-Status: GOOD (  21.70  )
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

On Tue, Aug 18, 2026 at 7:16=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jul 08, 2026 at 03:11:20AM +0000, James Houghton wrote:
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index b3afe0688919..cf4bd6bd7f11 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -259,6 +259,7 @@ config ARM64
> >       select USER_STACKTRACE_SUPPORT
> >       select VDSO_GETRANDOM
> >       select VMAP_STACK
> > +     select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_WANT_OPTIMIZE_=
HUGETLB_VMEMMAP
>
> Nit: we try to keep this list alphabetically ordered.
>
> >       help
> >         ARM 64-bit (AArch64) Linux support.
> >
> > @@ -1607,6 +1608,17 @@ config ARCH_SPARSEMEM_ENABLE
> >       def_bool y
> >       select SPARSEMEM_VMEMMAP_ENABLE
> >
> > +config ARM64_WANT_OPTIMIZE_HUGETLB_VMEMMAP
> > +     bool "Enable support for HugeTLB Vmemmap Optimization (HVO)"
> > +     default n
>
> Nit: 'n' is the default already.
>
> > +     depends on HUGETLB_PAGE && SPARSEMEM_VMEMMAP && ARM64_HW_AFDBM
> > +     help
> > +       Enable support for HVO. When enabled, late-onlining of CPUs tha=
t do
>
> I'd drop 'of', not sure how it reads better. Maybe just 'late CPUs ...
> will not be onlined'.

Thanks for the feedback; I've incorporated it. But I think this patch
is going away in v2 (with patches 14-18).

> > +       not support features required by HVO will not be onlined if all=
 boot
> > +       CPUs do have such support.
> > +
> > +       If unsure, say N
> > +
> >  config HW_PERF_EVENTS
> >       def_bool y
> >       depends on ARM_PMU
>
> --
> Catalin

