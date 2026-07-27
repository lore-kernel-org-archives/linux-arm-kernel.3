Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86D0C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdV/tdQspG4IJMEgA5ul46Qg1OBakRGkf1HYdrRgQRg=; b=X1zWsZhDgNSK8idRpznUPU4XpU
	WYjMnER13kxHu6QSA9z4xTsrqG73JvuJt82fhkHyFYAh6XduXDKzbxAbYlozPxpoViM7HbP4Zho3x
	3Xz/qKr/v70thq89591UCF2NzwuHPJ5xuyc0ylNCsETbXjWD/wfIjAx3vo+dqmdJwNdGJcq8faF89
	sXR2tOinATuZE6FwqteuokJMTFjhmXGynRZTGWZpdK+rUIvDpLvWgHbyoJallbotI4A1QH8Nq2nJY
	qUHXfCzYOIP5B95YvACbjUOTgJdJ7hqj0tnh5BIyr5YC/UNG3gv1quzO2V+nZXSXUIQ1OxB/3LzV6
	LsNMBViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMmo-000000036YZ-0RTy;
	Mon, 27 Jul 2026 14:58:34 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMml-000000036XS-3oBa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:58:33 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51c15a5b265so474321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 07:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785164311; cv=none;
        d=google.com; s=arc-20260327;
        b=HKAnUpvZZoRw0WUuRSU/LFADvY5qiZwokeyDT1DHnV3F6y9EaaxGqtsLaN6zyNU9fY
         ENxCozPKdR0AU702sUnLrHRFher/AV5xYm+ZCkMen1dWhisz5q3f2y3OQqfu9/YiuuR7
         ejB41yCTCODsTVIPVHqfd76M0lKOcLjTISu7n5zID7Cjt6DHSWt09t54XCxM4JfVUAot
         FUWwv/rO6Gl6N5coeB5iaXr+Sq5WCH5pNUjwP5cW5HDJHM+vSNH8ES48knzU+5/s9ZyR
         WKzEflUR2mwH8z9nR9r213BGllYik/XVXAF4F/1Ekd/do9Kj4V8m7+8D/E0C/UC5D8Uo
         fn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdV/tdQspG4IJMEgA5ul46Qg1OBakRGkf1HYdrRgQRg=;
        fh=/ArHGZRyCO3tOXsiQTBcsW9C8fdOhHR7lhT7JFLPSnk=;
        b=Pqu7ecIFTtS82sKhpMgz7Ud13Z+MXY/ZzIk+GappN7GH2xEf1fLRx8pIh2kTDTJW4u
         Ti4w2VRWaM+IAJbmRPKkzskPw1N6sXqL8PErP5OQmRF2SCV68uZ5TIFZvVEP2EpQQv2Z
         zEzmmR+Kh4o5WXqYZpVpGHJnEoZexk5R1Jd9tamADh/BcHofORwj2OZhZlaygR189v7r
         HkStHSqtdXIZlq8cGx+MyXUBcO8zju6IDsD1O+bSg8sWadfyD8vaJguylzhr+yQvtrIl
         6vJn+u0Y4e++zjZOl0XMz+Gdc3axnUyQt79wWFRnjnVJnXgDD4lJBH0azdbQjrgDjhCR
         nuPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785164311; x=1785769111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdV/tdQspG4IJMEgA5ul46Qg1OBakRGkf1HYdrRgQRg=;
        b=aZWkjc3Fj6KAEzt9bbUhKEL34gz9oC7QX7EhyJwoTIEzyyLf88HbCQ9PlgqS7HjmWV
         7IOlF9VoWvCVTFcnso24oj+NaUEPlMler+4q3YRd8Sw/bwmQ8NUVbdFLjbosH0yMFRQ6
         gKnUDt3oFtcu/rsCPtHqqG3ut8xlQNAm9HMhZatDBSndSQjjOvblRYs/ctKe2ssVLcbm
         8cDiNbL+7zUr14qZf5Ie+adWbXwnFaP21kHZzlLz4X3kRZqu5irHqsp0byKhHefJHaZq
         YQIgijZSRAjs9VS9tfUZkDsqQMXV0SdY1grdJxopviRn7X0njIkSP8MX61eh0mwju72J
         3B9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164311; x=1785769111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdV/tdQspG4IJMEgA5ul46Qg1OBakRGkf1HYdrRgQRg=;
        b=be3ZgOHx7fcb62In2X+wTpNbQcB84FhXyuHnI57dy8SconcDYUwC2kscjZTKhnqc5h
         dy7XDNDgBTUrimo8ceyKnQJqU8Kis98dn0/OHPQ9COpkHhfQyNN4iLaEJ+HqydMy1NCM
         Dekz42/p88RXjX7Kj9r93xii8FrINIgwOcQ7GH+j/wXBhJOv//DFySIkXBAQKDDhrjDc
         fTVPKsZWtPEsshL7HqRbEx8kDtymYdquuiw4oTbdrJjsY0k5Ad2RUo6uPOQtT1uZKoZw
         jSsz/zXIcRUTaulUwvZld8KeSMD2KFKoPDRrLT37m3Z4hkF/9hKhWk733J1M835G1jyJ
         b8/A==
X-Forwarded-Encrypted: i=1; AHgh+RoLE4IUMlYsAJ28W1+zgyIceNidE1PIsID6Iu54rvSPdR/RSqRRBfJcLA5hVBSihw81J6VL8gYux2m4PVLz1bpZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9HKNUu2IUQ3LvQ+YFYX7c0MnwnHXAT4I1YxdG2CAbi+Ikpt84
	Q0HdLznBFZvR6febxe+iwgK3jioCYKZ0uqaf12IRwUBFvJ03DU2tjV4hZGv0gOIOT47EN+rDzEF
	wG9s02YQ3VpR6F34zL4iBDhICfZ9A2PaQLRQitb35
X-Gm-Gg: AR+sD10Oju1EYbfNG7LGlM4KocjVsF2iS2iWuDzTJvj4JIXxzlIpdC8mXAf9CpAY8tV
	8nrrM60ktthmmOe7MYZb4nMbiImMTTHy9V9ZxnPaEbap2KABnoc0o/W4xVxaRZKyMdtnIGnJwxS
	8FpvVg4u0C0MuKX7/+DYxGPH9TU/ikY/JNm4iD8kDz5GszVPuSMC8FCYRpg++1/WB9qxbUSL42T
	6VPjDJnYAJwZ44eKJuD9HDWOfD/SG9TQXjdMPAh0Pamo6W4ZDPwuJtW7ShERqok1Vj6NwOoTqdM
	cxgU4A==
X-Received: by 2002:ac8:7dcf:0:b0:528:3186:5781 with SMTP id
 d75a77b69052e-529a5f158a7mr36339991cf.6.1785164309856; Mon, 27 Jul 2026
 07:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260724222934.1463812-1-riel@surriel.com> <20260724222934.1463812-4-riel@surriel.com>
In-Reply-To: <20260724222934.1463812-4-riel@surriel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 27 Jul 2026 07:58:18 -0700
X-Gm-Features: AUfX_mzxNfG3avju6LxEy4p22U_xIz6TPcKe25YvyW5akGfhtZSIh5B3OYp7U2E
Message-ID: <CAJuCfpF8S1=S7TkAuQ58OWiUhnf481YvwsamwvVfa7tfVNH3JA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 03/12] mm: rename get_user_page_vma_remote() to get_user_page_lookup_vma()
To: Rik van Riel <riel@surriel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, 
	Lance Yang <lance.yang@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_075831_965944_F507705A 
X-CRM114-Status: GOOD (  22.43  )
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

On Fri, Jul 24, 2026 at 3:31=E2=80=AFPM Rik van Riel <riel@surriel.com> wro=
te:
>
> get_user_page_vma_remote() faults in the page at @addr in a remote mm and
> also looks up the VMA that covers it, handing both back to the caller.
>
> This cleans up the namespace for adding a get_user_page_vma() variant whe=
re
> the caller already has the vma.

nit: Before explaining the results we usually state what this patch is
doing. I know the title alread says "rename get_user_page_vma_remote()
to get_user_page_lookup_vma()" but it seems appropriate to say that
here too.

>
> No functional change intended.
>
> Assisted-by: Claude:claude-opus-4.8
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Rik van Riel <riel@surriel.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  arch/arm64/kernel/mte.c   | 2 +-
>  arch/x86/kernel/uprobes.c | 2 +-
>  include/linux/mm.h        | 2 +-
>  mm/memory.c               | 4 ++--
>  mm/rmap.c                 | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 1a9aad6ef22a..7a6ecc3d9294 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -459,7 +459,7 @@ static int __access_remote_tags(struct mm_struct *mm,=
 unsigned long addr,
>                 struct vm_area_struct *vma;
>                 unsigned long tags, offset;
>                 void *maddr;
> -               struct page *page =3D get_user_page_vma_remote(mm, addr,
> +               struct page *page =3D get_user_page_lookup_vma(mm, addr,
>                                                              gup_flags, &=
vma);
>                 struct folio *folio;
>
> diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> index 3af979fb41d3..329efac0cfb3 100644
> --- a/arch/x86/kernel/uprobes.c
> +++ b/arch/x86/kernel/uprobes.c
> @@ -1036,7 +1036,7 @@ static int copy_from_vaddr(struct mm_struct *mm, un=
signed long vaddr, void *dst,
>         struct vm_area_struct *vma;
>         struct page *page;
>
> -       page =3D get_user_page_vma_remote(mm, vaddr, gup_flags, &vma);
> +       page =3D get_user_page_lookup_vma(mm, vaddr, gup_flags, &vma);
>         if (IS_ERR(page))
>                 return PTR_ERR(page);
>         uprobe_copy_from_page(page, vaddr, dst, len);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 485df9c2dbdd..24ead14b4790 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3238,7 +3238,7 @@ long pin_user_pages_remote(struct mm_struct *mm,
>  /*
>   * Retrieves a single page alongside its VMA. Does not support FOLL_NOWA=
IT.
>   */
> -static inline struct page *get_user_page_vma_remote(struct mm_struct *mm=
,
> +static inline struct page *get_user_page_lookup_vma(struct mm_struct *mm=
,
>                                                     unsigned long addr,
>                                                     int gup_flags,
>                                                     struct vm_area_struct=
 **vmap)
> diff --git a/mm/memory.c b/mm/memory.c
> index ff338c2abe92..3b86eeaf084f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -7039,7 +7039,7 @@ static int __access_remote_vm(struct mm_struct *mm,=
 unsigned long addr,
>                 void *maddr;
>                 struct folio *folio;
>                 struct vm_area_struct *vma =3D NULL;
> -               struct page *page =3D get_user_page_vma_remote(mm, addr,
> +               struct page *page =3D get_user_page_lookup_vma(mm, addr,
>                                                              gup_flags, &=
vma);
>
>                 if (IS_ERR(page)) {
> @@ -7167,7 +7167,7 @@ static int __copy_remote_vm_str(struct mm_struct *m=
m, unsigned long addr,
>                 struct page *page;
>                 struct vm_area_struct *vma =3D NULL;
>
> -               page =3D get_user_page_vma_remote(mm, addr, gup_flags, &v=
ma);
> +               page =3D get_user_page_lookup_vma(mm, addr, gup_flags, &v=
ma);
>                 if (IS_ERR(page)) {
>                         /*
>                          * Treat as a total failure for now until we deci=
de how
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 1c77d5dc06e9..b36f2e219b8f 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2838,7 +2838,7 @@ struct page *make_device_exclusive(struct mm_struct=
 *mm, unsigned long addr,
>          * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
>          */
>  retry:
> -       page =3D get_user_page_vma_remote(mm, addr,
> +       page =3D get_user_page_lookup_vma(mm, addr,
>                                         FOLL_GET | FOLL_WRITE | FOLL_SPLI=
T_PMD,
>                                         &vma);
>         if (IS_ERR(page))
> --
> 2.53.0-Meta
>

