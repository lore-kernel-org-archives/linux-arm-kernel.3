Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAF6C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zI08/Pq8IYiYHARKiGwzqOQw4uoqAVEC7og/atFPetY=; b=Va4uIB45KG/9a55bubfx+uH3dO
	Bl6GhQhxReiQdDWJqcMGkNowgI7jXA4VRG30N/Y6f28wlyB49tPKhW3nrhDJjV9z9Rww2LN2SIELq
	t0WLO1fAWyE+YgRninstAX8ZKF3d3yMhITY6lzaVF6sfCVfSE6ZCM68jXxoVU1yqCa0wmc6OyOdAB
	msYGSQMwjKF72If8gAHNaCze9x+FuNoIJQyw2pVWr+zpEih/ro74qb+BGxNNAQj7yMyqUSDAEP6Og
	+EqKxphDAaGCmTg0F0td/RTESRiZpX8k/4gFAaP1yP8jr5hNPI0H+DQyPmA7sIe4U/gaalCFaIddp
	2pMPKV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyet9-0000000HX0h-3mwZ;
	Tue, 25 Aug 2026 00:19:39 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyet6-0000000HWzQ-0Rqz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 00:19:38 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso638356866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787617173; cv=none;
        d=google.com; s=arc-20260327;
        b=YDYO89BFq9gmNogmABWPXkULOq/JvMLV69u0IsGFVGQNIFnkNSKlYCICmXkFdJhxYn
         vQCPW7xeeFalZAMe61Gy1kfX5TlCshXtUbEaGwzdilKG3bZo4rfm4FVuPMFZLCRaxuLz
         F4lSHC9TbIYk36gF6NoCfyz5coL3FwDkxj1ydTMN5x1mHJISmva4pSRgtwtK5/FCUfXv
         jNV+TjkRiDj83+TAaSwzzn+N2UC4s7vLsD5cpFqO1iWyxUnqeGK4UkWnZWe6ydF/j7Ag
         VWUn4D/5XaipnFOwaefWCoDosX5fizkovrib9wRnMw2L4+tYQCT0yzNV1ewdXHlST5KY
         eXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zI08/Pq8IYiYHARKiGwzqOQw4uoqAVEC7og/atFPetY=;
        fh=fsPQTp9ai/MG+yi6XpccCagILZOffYYWN7+oOP6r5bE=;
        b=mjN9YsBdJiLnQ2fNHVwN27rpij1r637qjA84mqOgUX0ZdYOuucoweWpk3KlG3/0bh8
         DEv/6tNFPJVuESrdw9NRYZ4VVG0PoHha7AWBC7gZELcQ67sBPeiLiN/bW/LVXLAckBGU
         hMMLz62VjzTHYHpDMSxM4GRcR+CiUq8rIBdcUcG7zBCpdJqbU0AOHPP21+NO3vCzOGzI
         O7zN32R645kMDZXCziZG2NWQpr3d1X+0I5ptq8JEtUsLq6/uCC58ZosZSOp/hY7eksbo
         gJX3CkdWF0YxgJyZunMdwuO1o3tZFPVSPk3T89RxbL/pgCrOjls4hOHxFtnI7CaImBOc
         BViQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787617173; x=1788221973; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zI08/Pq8IYiYHARKiGwzqOQw4uoqAVEC7og/atFPetY=;
        b=BYOVHk0BA/2ZkzbNJew4wN+8nuk56aOrb52WUIffLOOR3CvV72PHazykWOo3eKmgkl
         RYrg7JQrhDztWBS9AlBbLX08rTAOwUp4No7dssWisVdSinVayrrqqljDbobTko2sQhh7
         805WEUbS4hjsWnC3kwES+ahxKHdUY+RZUAJSQTtCDOUs3YKwhBPaklne4/0AlmfCYGOW
         ViieAMh9nXFstr8akUOVZpSLUl8ypdfDxIdVWdalh56WLWzbiJZSN0mMT01SlWXL39q2
         4lI2dSVOzmSvjECIU333VEQJP2GmBETOR97zeLllyCY/KQEYpuNJG8+tC4cUFj2V9swt
         BmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617173; x=1788221973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI08/Pq8IYiYHARKiGwzqOQw4uoqAVEC7og/atFPetY=;
        b=JQMk2pgoDCJkCA5fcrSdV3B9ndAYIlF67u63pBuL76TIQqmjDgNlWuMxfrbPayecXd
         i+4JjOqZNXl2OyWJC+nqLOU9b8MIofwdSDEo21imcL79+qhpVdDR+FfTOqTb5Nk6hUw7
         nkoLr3dLrTKFjDnf3i1BP7lGDSqTDb0DqFnmAgAXEwXkBSYhcCkIkg/KqpnNnGsep7tr
         Gfpla55Yj/ws4dPT88ZAmgEicExHkTJIw5ZxTotfZiXNVDGZHCw7yX2LpAMHgwmVe6S8
         V+GpymAOWUxtjiHDqz9iTOcKkDwJfwek7KYvQay0xoTaEf3iMRdewLMhMEQHA5kf8F3o
         DoTA==
X-Forwarded-Encrypted: i=1; AHgh+RpZQPa6js+Z1xwRTVJcuh8adXKlllKiLuF/z7J/DbZB/w0orOMNQE74ozW5/tzmFI+XpiGkyjjZJUKWRN7ZqIGH@lists.infradead.org
X-Gm-Message-State: AFuF++kVGRkpKQQ+qhJ+YDhi2f+2ltoorTrrCNhVvyjqilblPIwPurtk
	Wj5aohiS9nHdy4Iww4W4tbRLXa0N7Bfa7jVZmC0j2atC/uvsvnToJN4TRUa1Ot5hn9xHbj/2qz6
	vT4b+EGebeMkPp/q6P7YJKb5JBKHorRVT2xmE34Ap
X-Gm-Gg: AR+sD11WWxECqBCuppcDjxaUvmv93eKzns77N7WjFgDqYwqmMvIi7gQ/33NHMzWpIiz
	/hPX2oqk7GDWSYthCGkFl3Xjuae8ao+PiCtlEJmvEtU9ZdcxEDslgvigfbzPjplMKAb53Qm+agT
	ARiCnyFS5+yaD8q3xdEWazq0NCRmO80+C3RS00tdokobyLX8yMr8EpHTSUPwAuuFgDOC+L67ecL
	bzm/65bMe1DfkIZ068t5CVli3SDXGkeXIFaLwsg6/mXCHpmeA6ghC+AyMgBKE61Y0DM+xd61Z22
	S19U71Za2oED9ly8VCm0rk0dCK0FkAsZZBP6AyQy2WYRNYJWayh87OfiHv5URQ0/2sra22rU3uV
	pa1rzBveqs4VAvDxB/76X/Hr7n5GyGnXiaBnlxW56JCu8+A8drUoSjXdfeXA/qTlQppq9OrFLnS
	2XwMzBj5GB4T+Q
X-Received: by 2002:a17:907:3e9a:b0:c15:e118:9b99 with SMTP id
 a640c23a62f3a-c246a6a3e6cmr3322345466b.23.1787617172901; Mon, 24 Aug 2026
 17:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-18-jthoughton@google.com> <aoWBPU9XKmKjfLnb@arm.com>
In-Reply-To: <aoWBPU9XKmKjfLnb@arm.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 24 Aug 2026 17:18:56 -0700
X-Gm-Features: AcwNN1UvsCHgbvBzolQYlq-95gNp0yB_1rsCr8sUqEoaXoE7K7ke-wjKJ-gZEVA
Message-ID: <CADrL8HVLsiuBGj1X+m89WWLUn+nwBEqGQfwixDnqCYm3cjpiTg@mail.gmail.com>
Subject: Re: [PATCH 17/18] arm64: Permit onlining of HVO-incompatible late
 CPUs if HVO is not in use
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
X-CRM114-CacheID: sfid-20260824_171937_220829_9757B24F 
X-CRM114-Status: GOOD (  27.01  )
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

On Wed, Aug 19, 2026 at 3:11=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jul 08, 2026 at 03:11:27AM +0000, James Houghton wrote:
> > First, HVO must have ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU so that
> > incompatible CPUs can be onlined if HVO is not in use. The
> > late_cpu_enable() callback is used to check if HVO is truly in use.
> >
> > If the late CPU is incompatible with HVO and HVO is *not* in use, HVO
> > becomes permanently disabled.
> >
> > If the late CPU is incompatible with HVO and HVO *is* in use, the CPU
> > is not onlined.
>
> I haven't looked in detail at the logic here but do we actually care
> about this? We still need to solve the BBML2 requirement around patches
> 12 and 13. BBML2 won't be an optionally late feature for other reasons,
> so such CPUs won't be allowed. This leaves us with HW AF. In mainline,
> the check is done on the sanitised regs but IIRC these can still be
> overridden on late CPU onlining with a warning. We only use this check
> as an optimisation, so not an issue in mainline but can be come
> problematic with HVO.

I just tried reading through cpufeature.c again, and I think, because
`ID_AA64MMFR1_EL1_HAFDBS` is marked as `FTR_STRICT`, we will indeed
get a taint if there is a mismatch for HAFDBS. When this happens, the
sanitized register value should be set to the lowest value. This value
should indeed be safe to use.

ARM64_HW_DBM implies that it's expected for CPUs to have mismatched
support for HAFDBS (indeed, this was the impression I was under as
well), so it seems like a bug that HAFDBS is labeled `FTR_STRICT`.
What do you think?

I still need to work out exactly how cpufeature.c is going to learn
about whether or not HVO has been enabled on the command line
(hugetlb_free_vmemmap=3D1) for the purposes of preventing incompatible
CPUs getting onlined; I'll figure something out.

> If we don't have a strong use-case for mismatched HAFDBS support, I'd
> drop these last patches for now.

I'll drop these last few patches (14-18).

The only caveat is that by doing this, I don't see a way to keep HVO
runtime-enableable. In other words, if the user booted without
specifying `hugetlb_free_vmemmap=3D1` (assuming
HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dn), they cannot dynamically
turn it on after the fact. This is not a problem for me.

