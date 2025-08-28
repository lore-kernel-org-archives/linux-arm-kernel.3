Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E6ECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 07:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCyWFKVmsqDpuka3mORfqvZ6ED5815cQsuT83UfJ0fY=; b=IdKW03Yml2eIO2KCdNThdRSVZU
	KwHru/cxN19upi17ehz+GPQ9sMmvZ75ZPsad3gMDhGjN2OnaCVIjjsnHOQ79u3loAo+gkl9wVMJ9K
	Q2XhazhzdSb17gkr79iSiP16DwvrOgxAHliKLI+Ye12KvNT7tCFdAqzOEYXMJp4HaVsidtKx96B1U
	hkm4ZpK3kC30AdDvnKRnbYtEpqrNy0IkszCZm89+WmjlVAPaumXw0qAWzkplgQdRvrHhgc1utJ1ar
	sRhmLo58s/rPWC9HkBn23I+UXg9bvDAaNfJqU8w4HKnck+1Uowhvg4+490FOOOtcSpCpsa4SF/ayj
	TC/RI2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXNl-00000000fjT-3cSU;
	Thu, 28 Aug 2025 07:49:17 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXIc-00000000eQl-24QB;
	Thu, 28 Aug 2025 07:43:59 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-afcb78fb04cso92025066b.1;
        Thu, 28 Aug 2025 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756367037; x=1756971837; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCyWFKVmsqDpuka3mORfqvZ6ED5815cQsuT83UfJ0fY=;
        b=bfacKv5i/JrTtbdVNNMQBTnDrw7qOPuppnkcKuXqitmk01mRyN1fCRPAysa9cpZs2Q
         TS6gdUY4KdwcPacYmJfQ6YmuqRoMrXWxIdleTv/gJDf7b2p3Wt3V/DRoHpXjd/shLyMc
         PB3BLOvNuvlJYEPR/lhmauP4VeN7YA+KxE2ObauQymf0VWr/4aP/nbqHUuLz/+9Bpw+a
         7n9+v5mBWDBGcllU3gsoJ2pwZBMN6bWJumiN8gX5bzMe8fPRIsX27lvwI5vmzusKqCwh
         sl+1I6+1mULQACyNjyt7Jc7SqcVg82ygYjlcfsY7HNDbPcGlKQgvOsKWbjWGWrYkz2gy
         EH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756367037; x=1756971837;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uCyWFKVmsqDpuka3mORfqvZ6ED5815cQsuT83UfJ0fY=;
        b=Nhu2IOVFVE9B+89K6l60H8jGGkyxzggD5mduAoWs4sC2bxDOgfOUp1W+i8UHIO8MJp
         IGXBZqYoiHCyX6zoE41I3U7Yp9k1IdlUE8lTAvbN25cQY4QSaEhh8pWkb2Nkd7DZXOEe
         hjGes/3pOJZTAeJgGQkyc/D3mgH7ikKoFvNa4oniyRwuXvUU3CPdfWbydJHlhgLD/Ef/
         UHJqsSRI5JE/gzE2xcZKrA9cSwVwkNM8kqr/Do1L7XmT/bcZNhwSDDAcP46XqzXxPWaV
         g9ZXlXOdBOyf8v+MeX8GUe6B2Vmp2slGgQ0PkjBwH5cuNHCpXaHZ41+dhMb4GwV7vFB8
         U8rw==
X-Forwarded-Encrypted: i=1; AJvYcCUN8SS0vQ1FdjbzTdRXqjFQX6+/2U0VJHQgryB/nbiMPCcKHYrHqquWgEuXS2Iw7iaf1s/JL3oVi6D8mgnX+oII@lists.infradead.org, AJvYcCXtyt74cDjcNzmcJKXq6w4cZuyEyBRjT6LS9KwOek65C70EleZ5m8ba6LwdX87ssQL56EGtgjyX0ItEKPA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVvasUpctdhaxO62Mdt8AOiDuyWvAjl1CflkYo8ILGXQWO3PyR
	1tBxvpTBqe8PNVBNXYV6ay0n3t6sEmBV194Iqrt7fdDRd9CGa+9V+LKy
X-Gm-Gg: ASbGncv61JZ2hlytbt4X5rkuyGNnAWNeplS9r1kO2Z9BAh1rFj+Am4i54YAs+849iP7
	c1TJfRGRsaOLLrCv6ee/Rc+qh2h7GAjSQ+LO0XzCvmpT+cebUdmVdfuFJcRB+8obTA8bwKvXYyn
	CavxRmLsTjeswewOktxLnGTR7kfUra1v0llRDcfw9AWTRB7LhVaPrztHi/GUvWEmyM31M5abUm0
	Hx4yQRCiLz5oi/Le5vyXpsPEKoD+YByICtrgQo7e5IxdQY0Y/X38xbutcDChH8HPFI8yi9x8900
	4uwvgxCIiF6qnubtbAVj3wCCgFdde7JYdiVW8TdTPsHkzRf1QJazqMG0Jfv+lEHVu5lsUTEv/SL
	3ylJtPxzxoYfS3s9bXD5/Qfjt5q5aKgIpwsPA42KnOeb7gf4=
X-Google-Smtp-Source: AGHT+IFCWGCB9w3JZkSqlrk4a0OYpaWYnOsewLh1z3k9Jb7NB4buZSqln74MwC7LX4UWbpbQGZTMJw==
X-Received: by 2002:a17:906:3717:b0:afe:764d:6b31 with SMTP id a640c23a62f3a-afe764d736dmr1280383766b.4.1756367036783;
        Thu, 28 Aug 2025 00:43:56 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe48fae316sm1165798866b.28.2025.08.28.00.43.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Aug 2025 00:43:56 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:43:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 12/36] mm: simplify folio_page() and folio_page_idx()
Message-ID: <20250828074356.3xiuqugokg36yuxw@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-13-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-13-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_004358_534156_AF4D8629 
X-CRM114-Status: GOOD (  20.43  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 28, 2025 at 12:01:16AM +0200, David Hildenbrand wrote:
>Now that a single folio/compound page can no longer span memory sections
>in problematic kernel configurations, we can stop using nth_page().
>
>While at it, turn both macros into static inline functions and add
>kernel doc for folio_page_idx().
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

The code looks good, while one nit below.

>---
> include/linux/mm.h         | 16 ++++++++++++++--
> include/linux/page-flags.h |  5 ++++-
> 2 files changed, 18 insertions(+), 3 deletions(-)
>
>diff --git a/include/linux/mm.h b/include/linux/mm.h
>index 2dee79fa2efcf..f6880e3225c5c 100644
>--- a/include/linux/mm.h
>+++ b/include/linux/mm.h
>@@ -210,10 +210,8 @@ extern unsigned long sysctl_admin_reserve_kbytes;
> 
> #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
> #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
>-#define folio_page_idx(folio, p)	(page_to_pfn(p) - folio_pfn(folio))
> #else
> #define nth_page(page,n) ((page) + (n))
>-#define folio_page_idx(folio, p)	((p) - &(folio)->page)
> #endif
> 
> /* to align the pointer to the (next) page boundary */
>@@ -225,6 +223,20 @@ extern unsigned long sysctl_admin_reserve_kbytes;
> /* test whether an address (unsigned long or pointer) is aligned to PAGE_SIZE */
> #define PAGE_ALIGNED(addr)	IS_ALIGNED((unsigned long)(addr), PAGE_SIZE)
> 
>+/**
>+ * folio_page_idx - Return the number of a page in a folio.
>+ * @folio: The folio.
>+ * @page: The folio page.
>+ *
>+ * This function expects that the page is actually part of the folio.
>+ * The returned number is relative to the start of the folio.
>+ */
>+static inline unsigned long folio_page_idx(const struct folio *folio,
>+		const struct page *page)
>+{
>+	return page - &folio->page;
>+}
>+
> static inline struct folio *lru_to_folio(struct list_head *head)
> {
> 	return list_entry((head)->prev, struct folio, lru);
>diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>index 5ee6ffbdbf831..faf17ca211b4f 100644
>--- a/include/linux/page-flags.h
>+++ b/include/linux/page-flags.h
>@@ -316,7 +316,10 @@ static __always_inline unsigned long _compound_head(const struct page *page)
>  * check that the page number lies within @folio; the caller is presumed
>  * to have a reference to the page.
>  */
>-#define folio_page(folio, n)	nth_page(&(folio)->page, n)
>+static inline struct page *folio_page(struct folio *folio, unsigned long n)
>+{
>+	return &folio->page + n;
>+}
> 

Curious about why it is in page-flags.h. It seems not related to page-flags.

> static __always_inline int PageTail(const struct page *page)
> {
>-- 
>2.50.1
>

-- 
Wei Yang
Help you, Help me

