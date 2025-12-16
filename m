Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE69CD5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpcrV6Gs9Rs7AKrPPGb241PUAXg5TKgrbxOHH777fE8=; b=4/VLwKNl53IOfaSI3wubaJlHEQ
	B++tQKQtenbgQgeM6dr7odUhOwGAXZTiBQd+bFf0t02e2FGLBVXNbQ5AA9QLygujdU+0/VaB/25bm
	c1MHQk9tTFD4kS27yNxPasSTuzq0Q8obd64e/b+6PLdwvSNfNO5UxROIAPquuuWmWpEf45GY91wnm
	/fwdKTPfAcyrXBbCwfcEgiyD/jzDx6t/mbulX5uuaQ1Q/7320eV68udTtzeJNfPBpNP1KYpFify+W
	fyCLY/tr3K7+nU15KTMKv1kBojBi+OYtvJzlS7CRfg0VfQbsjQB9UjciPImyGQqfz5HJ5cxpV1mVx
	unIDCkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOJL-00000004lbV-2xZm;
	Tue, 16 Dec 2025 06:13:27 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOJJ-00000004law-2PoW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:13:26 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-88888c41a13so49360646d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 22:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865604; x=1766470404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpcrV6Gs9Rs7AKrPPGb241PUAXg5TKgrbxOHH777fE8=;
        b=lCEwxhgOoocFaEfCeNhWCiVrM8CvPxPtbBY4e5/azgOfOeURYYm0nfTSaQUTlTLu46
         1gWbpVEoH8v0tWa5HCQ7pbzU7mhdkqcW0slM1Qgj6/bpq5b+UkOx6Gim9OsQJjn1g/wX
         ER84fSPSaqveFluNv/hutm//LIDlFD6UbPNMlUBK+SLAMZ9r/atLEjSx91AdiLWFQ9Li
         QZ0QcbMP5k0cfGypycQ+ieKd66CSXoDsEvtQdXIYieRDUuVPeMDsw0vt8O8uP49MzZPq
         0lPWOOy+j30h6fsq1lYju/ZcmMgFomPKlLVsXZjaGO5wkzTyMxtmzj7CsNR2P7j0d6Hr
         bboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865604; x=1766470404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fpcrV6Gs9Rs7AKrPPGb241PUAXg5TKgrbxOHH777fE8=;
        b=P/hEkkBKl0fWbzC7DgkrPff9IQIzUW/PWy39jpEgQUDeePDtVkfVsWeflGkzbRYjmQ
         9S9WM26C4tO/A0RO0fuvj0T4ea1JqHs7BqHlf7IaJmfxAtatVOJ/tXWOlGozDqujYTOo
         B8rqJY/S7GN4Kx1YC3mjgO5lSc124bE4sWEGNv7Aj9fFq11WYzuARCqE+WOJzJQYbTbU
         1buPl3IAx0e8gKS02+R+mVFCxBcoJnShlTUXpwz/r2bykRdIPzLWtuSWdikCeKUCEvnQ
         7n5ffjvZ3zLGyv3gydq/ya53r2VQvUndKodbteFDmBQFgqX6zCrdqe7yLyTYk2/jFSHp
         j9MA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Eki3k1De2s0PZv+21j5ACdt28ltiHR7Mpy+qLokwpFqkwYpt1D5YRsib+0GHafyuJ7g0Ys+41Fsk9DTujMa1@lists.infradead.org
X-Gm-Message-State: AOJu0YxKeU/m7Tj/00CKqVRHUg38+8UJ88fmd6igo3dr86+JOASKsGXF
	wAmOKnni5pVdCxfeNJRazzGSI4a+eOgOnL72YkKnnlxPAN3+tgaGQkmGYG7SbwPPLzW6xhfzgYL
	pv6DVvYsYod/lFazOAP/R1QJKSA5eaKw=
X-Gm-Gg: AY/fxX43FeWTF3R0RNmxxqx1j6b2mALAUxACeS8zXd7EF/EnQ1WfqWiWlg0+oNg3vzg
	XG/vZ4kTHNsBT1urLnkeaR29uJOoEas4kTOUwed9aVt9dbmxoeJ4aWc+LH7SMarU81UgxjcsBBi
	Ry5F0YGDrAwKrsbmbh9/6fv7HILArDv02hgDnFnYFLKEBgBmKRkRzqyYa7MTy7YLQ48patYahMX
	Z9LytDsg3z+RdR++ulqrWkPU/lRv1wjWrYK9Izp9uDA/caG6xTQJXR3pv/dL4+tb4TiGoRYpwZR
	XjJC
X-Google-Smtp-Source: AGHT+IE5g32thmfLBtxuBdsqZjsQzrm7jv/zeJKiwwmRNuWeM8EbP6APHwfatCpfOllkkm7FHIFIRBpSbf2VQHq1mV0=
X-Received: by 2002:ad4:5c48:0:b0:87f:fb1b:ef95 with SMTP id
 6a1803df08f44-8887e019d43mr193697176d6.8.1765865603718; Mon, 15 Dec 2025
 22:13:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <af330c9ea188bd0f28189b1e6e5803f6de9d2abe.1765439381.git.baolin.wang@linux.alibaba.com>
 <70d1dedc-b4fc-4eb6-baf6-9e54b6a62249@lucifer.local> <eb871ca2-47c8-4b10-a61d-321716f6c147@linux.alibaba.com>
In-Reply-To: <eb871ca2-47c8-4b10-a61d-321716f6c147@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 16 Dec 2025 14:13:12 +0800
X-Gm-Features: AQt7F2p3Kae-ArD6KnQi3aoTVGR5L0LuPLXxXyTnlSckAq7q46ac-khv4fOXPxg
Message-ID: <CAGsJ_4xp40A3u=N5_mw00Eo6bPmFvctD3j=1Qmy3vOo2EmX3hA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm: rmap: support batched unmapping for file large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, david@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_221325_621870_F007B09B 
X-CRM114-Status: GOOD (  17.86  )
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

> >>
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index ec232165c47d..4c9d5777c8da 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -1855,9 +1855,10 @@ static inline unsigned int folio_unmap_pte_batc=
h(struct folio *folio,
> >>      end_addr =3D pmd_addr_end(addr, vma->vm_end);
> >>      max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
> >>
> >> -    /* We only support lazyfree batching for now ... */
> >> -    if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> >> +    /* We only support lazyfree or file folios batching for now ... *=
/
> >> +    if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> >
> > Why is it now ok to support file-backed batched unmapping when it wasn'=
t in
> > Barry's series (see [0])? You don't seem to be justifying this?
>
> Barry's series[0] is merely aimed at optimizing lazyfree anonymous large
> folios and does not continue to optimize anonymous large folios or
> file-backed large folios at that point.

Yep. At that time, I didn=E2=80=99t have an Android machine with a filesyst=
em
that supported large folios, so I focused on lazyfree. But I
agree that lazyfree anon folios and file folios are quite
similar.

>
> Subsequently, Barry sent out a new patch (see [1]) to optimize anonymous
> large folios. As for file-backed large folios, the batched unmapping
> support is relatively simple, since we only need to clear the PTE
> entries for file-backed large folios.

Yep. It is actually quite straightforward to go from lazyfree
anon folios to file folios. Swap-backed anon folios are much
more tricky, though.

>
> > [0]:https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.co=
m/T/#u
>
> [1] https://lore.kernel.org/all/20250513084620.58231-1-21cnbao@gmail.com/

Thanks
Barry

