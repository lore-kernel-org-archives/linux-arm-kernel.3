Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F84C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=; b=JA1cwke9SGC1jD9+kdm60MLmng
	lTyyrMY6jRQmc8x6GMbcd5aCN5d7g0dkd/Jbce9xmOgtBkNzznruxdDNr4obamy191UZTVfDml4Vk
	fe6wkHy3W3a+nQlcEPjRPnc+xKuWEGYI5piP0X7FjzjlVoWfCmxZIeuKqZSlpHX6SlJ9eQZRdO2xI
	LsiG0pndLMy6WHlppnzVkA4c28w3wDfStsyKdgraZBm+hWhyc3FwoNtHBo3MhxCaT7e/5dx065F/n
	LF+wibF0u4MBWltKw8R/gl5l0YQM6YhgL0FvjBjDxKV3TP08NVTF4BmGbzj+PQanmKFFH+ObkBpPW
	zvjk3HsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tps-0000000Dn8x-3wmz;
	Fri, 18 Sep 2026 08:20:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tpr-0000000Dn8c-2ADO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=; b=cb/IPtmki1k1VbFG22CnOPoXrB
	y8oFwywJIhR3lU+uk2zaqg5QtK9ZcmuuxzBsVonQC2eZcO2oP2APcff0lwluC2QCpF8yGtzhFII1Q
	jm496ueYaXo0IN4ksXVb7QYjMuHyawQ20wYikuEjwKFmfNcWL4N3QYHS6j/cIujdeJT25B/vJ8X1y
	7EXumCOyI7K+oqaqEM3fSNi1uj7ZO2LHwEG3BSZwADHNrE/xp8SrlR5ihjT3hMSPaZ7g/XNV26/bg
	JHWSCo4LmXczPfmmF/dkHMQG22uVsdQ6kEOnGdVIDo6bw1scPCbuh9nLhe+mCXrpHovXCUAy8EJGm
	lHM6AhWA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Tpo-00000009mQx-3ThB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:20:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso3227865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789719639; cv=none;
        d=google.com; s=arc-20260327;
        b=XIv4598VGKpPeeMQwJO+IalgrpKjDbpyjmHGzDltJQ45WXnG3mzCspE2EhQlaFs0B7
         tg8tgJeInPKpS2ZvdE1xlNkbXlwwptXjecTi3EdtZF+w+xvvMZ8BuhI8EOwq4HxPc8x5
         8LVqlYJweRDP3imLiisq2MIfr+iPZdni/RJ5zbt65qpqnx29m08qfGCAR1NlcmxD0eje
         xrRTaW7pEsneicI0Cm3zwP1D/3ajvxP8zPAh4YWRphKl5KCe+qeIF0Su01lXe+NRisc8
         BzitFRDv69Brh2KTObWhQbQKT8183gbUI2s36u5RVonf6EGNzir0VlRaEG55i1CHoZjV
         x7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=;
        fh=982okspPmNSjIqS9tTsPPIbaskSi3hXo3w0IGdWuX1E=;
        b=fer39uABtSsjzhT2bYwGfaLK5TmavCUdYiVCOawm2qpkFn8HkAqMDzWZROwvg2gZNE
         U5w3RdXAOScJQvw5fjZ9g6xZYPz9CDZfZHBANuM6p1FlE2AkNLB6Sr+NW2mpPFpW0CNW
         NBzxzJm331X3D3KEu/y11nFKDNPm80S/Hfu2e+oxzHtL1KoM6b/egWF7aJemEZO1wLUY
         EAqt2mdXiINGeZeho5g4Qa5Xs+ZIEztBn71F6njZOmfvksaGcWm7HVd2faJPcHLj2+Md
         EnF9dz6GWphJEoBxEvcDUzU6CnLzLpAlykps+97VepOX99lBUH8H+HWJjHv7KlMW4cn9
         9fpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789719639; x=1790324439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=;
        b=hh8/ZjNy2b5XP/n1dTRrGFZCDF9/oVPTSUrsJdAuxmb6oaRqs/eSYJm5EX+hsqnSQ3
         mPAAejxhg2ACNztLvrNhrLOlBtM24uS0fU3oZQJg3MOgN3qbXVZ+N6ylPVswMamDg99k
         Nm/p2xMbDOPjyezRzcBRmdcgOqPUWoLWlD1xsZHG9OIa/usNyU3XBvyMvRwHNolhcp62
         nSN5rpk/UGpznx70Sn/0FY/EGLRZTl8mUdDqPjY4Bp4th7ExLSjlhvs1yci7nAfi9GpB
         wdPqMH/3MffjIeW7Ofreb1lj8+LG+45pxCBNYnhBfmdu+lM+/0Wp3RV+PAn42JKtZ1BB
         NZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719639; x=1790324439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=;
        b=fVhrJInetbA7q80uVfygY9uwgn4+ZZRwG5HR4GI3XoM/lcHNnx6ezHhnN9REvBpHy0
         vLc46jmgUSkq1EbqbNl8HxbPpD7uHMqJHslrvZqha/hXQPL83bZpN993WpVkTEjSx+vF
         ClWDET2lQkFvKWDkmz8/KCn8CzKG2Q5UZ3dB8ql2BqGOPtXJ+GLgE2N7j5P5GbJgg+4V
         wNbrxDF99t91zqR2t3G8GClNXudqwPd17V4U53QFK2FnN80QmqYkjrJZGGvx90vr3iD9
         qXyy+DI0C/T41e3oGimqNZOAJZewF7rLJT1EhLrQA67OcmXdd8c/kBAzdA6EkIq+S9dp
         btVA==
X-Forwarded-Encrypted: i=1; AKwUvBxhcd6/qzl4bSnRF9sfB5NtaMRR682UtPCT5rnysWXGTDqXSgKmrUeEkfYgZVoC4cDB5THgSNc6N+OeZhgizVXw@lists.infradead.org
X-Gm-Message-State: AFuF++kZxv+oHQ1wQkh8nWVnKULU57N6ttEp5hpMIQifVrGJ/kqnqtqT
	VM2fRqD3yGiJwuXyp88kIhziv7vXXLwzyioCh+gx2MfWlPgyM6R9yYFM9h8t43x6VJoHa8mLCSF
	ifQBpJ5znmeK3u4fvI6Berbx/Rruszd8=
X-Gm-Gg: AYBFou2buXBo20TkUGtBInZI+6z/OCfYnr9TGvl3gjZ3nI/ZDcF+NNVPUa/937S4rqA
	JmGa3VKqPL4cfcoU5a5ZybKYo/I+tI1hCsQyV2jIUJeEv7rpUEPYKRkilPyFQsK88VeLGgs16As
	UyAkPDS+H0Ka8Wgl+ZxET796TZeWRmKMiqHDgvxYRrwh+RM7/gJBkwWjQvuKGWg+qNRdTD5xkd0
	W8W3QJ0858MCBuDVFYCm+ohbKzHkJf7JfeOD/LXxb6GFCeyT6w3H1uAvSGYcCSZ1lBR4E2PECNW
	zb5MebglkAYZftCinE3B4WaQWfBaIU4qe0uRIciBczfPSIlXHvvYiBab
X-Received: by 2002:a05:600c:3493:b0:49f:bd3c:bc21 with SMTP id
 5b1f17b1804b1-49fc573b55emr19996295e9.28.1789719638568; Fri, 18 Sep 2026
 01:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-3-jiangwenxiaomi@gmail.com> <CAGsJ_4wDbDLv5mxfNiyraOS6tKCSV+g8xL5+SsRCyqLnN2ON7A@mail.gmail.com>
In-Reply-To: <CAGsJ_4wDbDLv5mxfNiyraOS6tKCSV+g8xL5+SsRCyqLnN2ON7A@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Fri, 18 Sep 2026 16:20:26 +0800
X-Gm-Features: AcwNN1UdGEZgXXaGyHc-WLWsn9JkWUJTL9ur_osaBhDBGn4esHyfsGM8b6arOrw
Message-ID: <CAHKocdFCuFR-gYCrY-c0iRKZ2GRZJCnTJjHGe_TvMoYkjnb7aw@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] powerpc/8xx: add pte_set_huge()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_092040_944893_C9AE5383 
X-CRM114-Status: GOOD (  20.48  )
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

On Fri, 18 Sept 2026 at 07:28, Barry Song <baohua@kernel.org> wrote:
>
> On Thu, Sep 17, 2026 at 1:30=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.c=
om> wrote:
> >
> > From: Wen Jiang <jiangwen6@xiaomi.com>
> >
> > vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
> > by reusing set_huge_pte_at(), a HugeTLB helper gated by
> > CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
> > CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c to HugeTLB
> > internals it does not otherwise need.
> >
> > Add pte_set_huge() to powerpc/8xx, next to the existing
> > pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the hug=
e
> > PTE and writes it into the backing cells directly, without going throug=
h
> > set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.
> >
> > No pte_clear_huge() is needed: 8xx does not implement
> > arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes th=
e
> > block-mapping branch.
>
> I assume you mean the block-unmapping (or PTE-clearing) branch.
> Please make this clear in the changelog.
>

Sure. Will fix it.

Thanks,
Wen

> >
> > In practice PPC_8xx selects HUGETLBFS unconditionally, so
> > CONFIG_HUGETLB_PAGE=3Dn does not occur there today; this is a decouplin=
g
> > cleanup rather than a new configuration.
> >
> > There is no caller yet: mm/vmalloc.c is converted later in this series,
> > once the generic fallbacks are in place.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > ---
>
> BTW, this patch applies cleanly to the mm-new branch.
>
> Best Regards
> Barry

