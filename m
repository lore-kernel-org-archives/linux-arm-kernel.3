Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D46DCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=; b=0HqTLj9WJyWdutQ57WBfadP79+
	SY8r3eAIExl6ZXtjfxlqvqnuToHwme/Q+P0Z3s19Xvua2CPm7hp5GurQxQA04Ru50kdc74jC/cxQX
	pRU/inBM7gMhYxBkwYrDJRQSTwVjTDquVotx1AoQNap6570Q/5UY1udwUJtcwvid2eonxAvzfeTCP
	/3bfBvrNvwWg8k40crZJR8WuQrGQTgujRAqf0UgMGokFx+8BnjzTiPS32GR7yN4k07wbDuL4TK3+U
	tvUkPSkglVcEkYI8JbXuzYhnifpQnZmRmibpy5xoZYLAhoBBDFRdcAwWN4gOE4gF4gaWjn3oQzZU2
	PRQ6dcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4HZ-0000000BA10-2HmH;
	Fri, 26 Jun 2026 10:59:37 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4HW-0000000B9zi-1lm4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 10:59:35 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-66490aba02aso1013518d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 03:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782471573; cv=none;
        d=google.com; s=arc-20260327;
        b=G1+NSsK9msVUxLXeE4bfAmuPRNGEIYpcGGMHCeev1YJUn5GMEOnO5/JsL6oWLBGgzv
         0k0+ropCuyrHunv0vj7AB+kpKX16j28TF+jh8hiYi+hbddzJMSPjsUFq9HyuCrSMb8XQ
         MJA98y8iTfqZoDKsckZT6J0WwGOMvrDSqDCn/qMhocMOXc05/9wQft5rinc44XK2H662
         bp4sJu6yAzJKGlPeEKDeHZNzSqtpDccdWJTzCDPf1WM+fO20U2Pztyh3Mx80JAZAfrxZ
         5DoUILnXSwlvPhphNnVuyd/Za9NO76VlOf2SSR/z/ZJkxMvNW5g5QOx4tkBPjFH/IGta
         pvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        fh=E8i1pCYMpEBbom3LwdeBUpNW+qeizEf+htppV8g1DbI=;
        b=PuABLcOqNy02I2lA8ySIbfYWDJ5gzQgNyfuwqLpTorFPHbC7jvU1x4KWVx9yvs/sB9
         gCsXEDZGgJ7anigbq9c9iOr1EACDDi+z/cj+eqUvyuoruU7L/aHmGn0F0Q3gr2r7WKT3
         tD7DnCW9LZO0Wqb9mf9z1OnShq5kIeKetbSGu/vTtZVMYB+uoWQjdJs0m8V3IsGv+GiS
         ggdiCJtjgTKLmEKycafzcLXvgw5VyEvE7R96l1/HDnv6yD1F8Bk5anIgL1Apbg6SlACt
         hn+rA9M6WYjFBnOoBpXd4usa6ai6QSRRL81h+w8Q5gzQFnPAWgjZmnCcg1yte3FB/VtN
         sZZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782471573; x=1783076373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        b=Mfu0ONAp1+r4q+t+DNyaNF5X1KRPlbpypYYbWNrfjAzhcDOyC8AVr0GONV4SEuYJHh
         NuV3tTWf9/C8BZ9/NBl9CWozx9VR8PyTlW5SA/QDjCq9esmeZi86OVJZN/t3od7b0jYO
         KgCusc4hAL4XjLEDzRcsEdU2zH+ycBnt2GbAD9+P+dHc0PCUTW5P/vgh+gRVpFBr7BIY
         7XV8FkiGE7c2KvHruWX6RWos0ZOsEtfqjGTEhxcptpfoX743dZkcIKgmlF7vD9QqFOH/
         i7dtMgk9uDfp/IGZwpRiKfFbnqmae5uRDO7HPwR5ssudQgh0SOnK6lqU2P1CrbxYV9Tr
         pNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782471573; x=1783076373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        b=pUewLnQk6xI24wV4/fgyuDozrKRzKZcEu7MrFo0PbnY5cyltgJJSzLnoS4b2C6AmCW
         pOygxhvwZbzlEI9Rkv5T61qW2jEyYWs3PwPaGWeL1ygm7ZrYGj6Fce/4Q0JWKmyw8QK1
         0EJMtoT9k4I6dz/S9hNixW+d/p5B43p/xhvb80S2EzQHZOK6K28YcG2SXUYSI1M7/0Oe
         9W6KlMaR4n1WaXzyfUq14ErglY1ngJZDXQiAs5x9KrqFwpbdimm95ZgO7SvTn10j6xWL
         YWABBwFwx1/2E2oFV6kLtp+DfLMiM+uy1LLUuOacTuGL3ES6BdDaOcqsjcXXnye8ex7V
         Soew==
X-Forwarded-Encrypted: i=1; AHgh+Rr1cayx4DMWQV/3ktBcKbIK60xzBHUTsgtchYYenQjMf85PBjsCcnEB6JT8Vdjrkfaj4qO2576iOZeBKY5Cwcxa@lists.infradead.org
X-Gm-Message-State: AOJu0YxWF3XvaBxw/o5xcz3VKu6gLJEHAtFIQwo0QfKuTrtztS86OCne
	QFUdbg8f/DLzwj0qgBhc18Y1weGC087lEUWgiA3bm2k9j9gNrioc9AWRe8mh4WzBrhJhIFo0Mov
	1Am9DAhHNWPokkaVqA+Nycn2lzIYlm54=
X-Gm-Gg: AfdE7clIB+mgN40s6LKjNw70aFb+WLzQrr9GjGKiUT5PD5puteCW0tF/8ARu7qy2Js7
	Ve5nunjgLd5z9tNUdY+rGECxYsLSynEyv9rSguZA90UhrWCw76YcU+LjXKFqdBZdADJ3EFKitpO
	UpKtCX2PdAHPIJKfr1zEkWKG1SwsTVwWH8zpim8f40Th35/lv1ayInotTgISoHUVolafwpoyDQd
	DfU1AkSBkjNlCewmCyFkBi3bjjP2UxdEmpPiau+pe7ZxBoCtqu+Nhy4Sx4J5OQX11KE9w==
X-Received: by 2002:a05:690e:1686:b0:660:48b1:50fc with SMTP id
 956f58d0204a3-66487e2f1b4mr5328375d50.29.1782471573329; Fri, 26 Jun 2026
 03:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260621145919.1453-1-ekffu200098@gmail.com> <aj426bA-YiOKt06m@kernel.org>
In-Reply-To: <aj426bA-YiOKt06m@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 26 Jun 2026 19:59:22 +0900
X-Gm-Features: AVVi8CeTYWPFnSIqmIZ3cUOMnriJoMgLi6dkY_72NuzlW0NxE1cDivKv2fvqfq8
Message-ID: <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
To: Mike Rapoport <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Will Deacon <will@kernel.org>, Alexander Potapenko <glider@google.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrey Konovalov <andreyknvl@gmail.com>, David Hildenbrand <david@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_035934_466689_D994ADCD 
X-CRM114-Status: GOOD (  16.59  )
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

On Fri, Jun 26, 2026 at 5:23=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Sun, Jun 21, 2026 at 11:59:10PM +0900, Sang-Heon Jeon wrote:
> > The memblock API guarantees that for_each_mem_range() and
> > for_each_mem_pfn_range() never return an invalid range, meaning start i=
s
> > always less than end.
> >
> > Several memblock callers still have unnecessary invalid range checks in
> > their loop bodies, so remove them.
> >
> > Sang-Heon Jeon (6):
> >   arm64: mm: remove unreachable invalid range check in
> >     kasan_init_shadow()
> >   LoongArch: remove unreachable invalid range check in kasan_init()
> >   riscv: remove unreachable invalid range check in
> >     create_linear_mapping_page_table()
> >   riscv: remove unreachable invalid range check in kasan_init()
> >   mm: remove unnecessary empty range check in
> >     early_calculate_totalpages()
> >   mm/hugetlb: remove unnecessary empty range check in
> >     hugetlb_bootmem_set_nodes()
>
> I queued this for inclusion into memblock tree.

Thank you, Mike.

Could you please review and queue this patch [1] as well? It does the
same kind of clean up, I just missed it at the time.

[1] https://lore.kernel.org/all/20260626032902.703944-1-ekffu200098@gmail.c=
om/

> >  arch/arm64/mm/kasan_init.c     | 3 ---
> >  arch/loongarch/mm/kasan_init.c | 3 ---
> >  arch/riscv/mm/init.c           | 2 --
> >  arch/riscv/mm/kasan_init.c     | 3 ---
> >  mm/hugetlb.c                   | 3 +--
> >  mm/mm_init.c                   | 3 +--
> >  6 files changed, 2 insertions(+), 15 deletions(-)
> >
> > --
> > 2.43.0
> >
>
> --
> Sincerely yours,
> Mike.

Best Regards,
Sang-Heon Jeon

