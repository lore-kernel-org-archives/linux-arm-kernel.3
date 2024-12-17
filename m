Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4C4E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XC2ZwAn0E++YNctCTdRNukhVgGGxBVyakf6CmRi2f4=; b=LuL3WUwR8rYvJgnmnwPeNHKJN5
	8Je0STChFooQMzfP7xWDpo833mGTEhF9LaxxFlssqvuHanx15jGVUTbh41V9bW0x9vHErz3UFcEjn
	fIhBgmq/err2hy2DYqiVPvkEySO5nzokgXxFst7CYUAqZ9oLsVHQOR/5ycNF/JG4AX3btAdPW3XOK
	0s8P4+MVbSOM/Iifo4hZx8jIeNH6VaECaUatx+6MilLXfI+5Rw1tmGfGzxF1u7OcmaqB4qV0bDMKz
	fqGjI1KeHK6SYW/4onxQWJf9GJOviQ7ZxeCo5VAGZDuWByEjgwluaSOcitlWfa03jIwAcb5vNpMmI
	gvn1l5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTJ5-0000000CmH7-385u;
	Tue, 17 Dec 2024 08:51:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTBn-0000000CkOr-2ZJl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:44:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43622893c3cso26425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425062; x=1735029862; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0XC2ZwAn0E++YNctCTdRNukhVgGGxBVyakf6CmRi2f4=;
        b=gtwx4YDmz1g6DZ1yI5ZBIZErZ+JleHy6in+amQDyekrJiWfFM1s1wrBPO8+iCZ6WWH
         rDOhpBBR+KyW+ZKTj6E+zt+0FQHynuGvpfRwuTfvoUSsn3hokSt3i9zuY5huPuUl7LSI
         Vr6e+Eg5cWsXZrc9eBAIf8ifD3RbJEvXxOSY0kvhm2oGvUoBupZkcw9VFm33mSxUYwB3
         HudZ5Qg+4MwX6GF8RoZfdhJnsQy+86pdzLcgetD48kP7AOixJw2PagyZH8K/GgSkr/TU
         Xazvu50BsYNIZG9n5qlWeKM+T3oEbaFjbsxmB1TJxe9eQPsXxYzjV9nibFWP84nA3FIS
         FLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425062; x=1735029862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XC2ZwAn0E++YNctCTdRNukhVgGGxBVyakf6CmRi2f4=;
        b=Nyuhdba0424kqll94kMjn0i9+YU/rekLpUXEKt0SWbAF9IJy3JYYipZ/Bn+fGMgjvZ
         gMW2k+dQ/7UWH0wl1JdwK65Qi2bhtgCxmt0JnvGG1QvMmaIUlTZVlmlUYj74Y8Ot0A1f
         TxDSpbZ72GPXKKSwuhSstAU2Hu9iQw0D54TFQ4wASBT4z6bpDu7nehA4cAKpmb+DZ+6g
         hB8a8GZ9lWmhdHaY3MHVlgmWLDUrkI5NgD+bmE3EyvYjibmwKGwwkhnvAOKo/uSMvxdJ
         w4T2DHWNMFv5TvdNY44Ifv6u7sT2dsLztZKueHeDtxKh7YoOLFdBqGB8l6tXisEvhtwu
         uxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5DZRhCCXC0nCB/DUcx+QvJWNvpS1rRjco3/sR5G8aTpcIgT7BlzOTSYe+PZ+J/rgw7V+hB+n4JqNOBlVDEnTq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0KA1lcE9D3TC994amxdHrYDrIC1VgDPaiM68yjKlZvhgk4iYz
	txY0udn34dc889F/Mjp/Ucv7loL6WplPm5yd9to6ZMBFLBmH4C5MZwBbw6YhDIsp8G71Bx/XgoK
	q1L+rpqUWB6NgYmt4/PJx23nnVDw7as+yX6UB
X-Gm-Gg: ASbGnctjfWHoCk8UPCKDejASbSgoUkV88yuL+h4D39MSR1Z9aSlb+IoIHcGSwy73nzt
	mcSPhw/ebH/zwyL0cn960umDyNmVHiLa4UMqXyKdNljgCu3AJLM6+v7VUeTsJVp4prCE=
X-Google-Smtp-Source: AGHT+IGM0bpr7//XD6OxuzJzrQz8DmDuxUXL0rgx8RL7HNA2kZE/P+I6liY2VW7R5nSj/mMRt13Okt8o4WT6PlKUZeY=
X-Received: by 2002:a05:600c:2317:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-4364901b009mr920745e9.2.1734425061742; Tue, 17 Dec 2024
 00:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-4-qperret@google.com>
In-Reply-To: <20241216175803.2716565-4-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:43:45 +0000
Message-ID: <CA+EHjTznFMF77kfUTkMeRpHnz9HAD1gSw6Do6tQvYSJ_jXG3gg@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] KVM: arm64: Make hyp_page::order a u8
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004423_650938_2B5842BB 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> We don't need 16 bits to store the hyp page order, and we'll need some
> bits to store page ownership data soon, so let's reduce the order
> member.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/include/nvhe/gfp.h    |  6 +++---
>  arch/arm64/kvm/hyp/include/nvhe/memory.h |  5 +++--
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c     | 14 +++++++-------
>  3 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> index 97c527ef53c2..f1725bad6331 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> @@ -7,7 +7,7 @@
>  #include <nvhe/memory.h>
>  #include <nvhe/spinlock.h>
>
> -#define HYP_NO_ORDER   USHRT_MAX
> +#define HYP_NO_ORDER   0xff
>
>  struct hyp_pool {
>         /*
> @@ -19,11 +19,11 @@ struct hyp_pool {
>         struct list_head free_area[NR_PAGE_ORDERS];
>         phys_addr_t range_start;
>         phys_addr_t range_end;
> -       unsigned short max_order;
> +       u8 max_order;
>  };
>
>  /* Allocation */
> -void *hyp_alloc_pages(struct hyp_pool *pool, unsigned short order);
> +void *hyp_alloc_pages(struct hyp_pool *pool, u8 order);
>  void hyp_split_page(struct hyp_page *page);
>  void hyp_get_page(struct hyp_pool *pool, void *addr);
>  void hyp_put_page(struct hyp_pool *pool, void *addr);
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> index c84b24234ac7..45b8d1840aa4 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> @@ -41,8 +41,9 @@ static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
>  }
>
>  struct hyp_page {
> -       unsigned short refcount;
> -       unsigned short order;
> +       u16 refcount;
> +       u8 order;
> +       u8 reserved;
>  };
>
>  extern u64 __hyp_vmemmap;
> diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> index e691290d3765..a1eb27a1a747 100644
> --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> @@ -32,7 +32,7 @@ u64 __hyp_vmemmap;
>   */
>  static struct hyp_page *__find_buddy_nocheck(struct hyp_pool *pool,
>                                              struct hyp_page *p,
> -                                            unsigned short order)
> +                                            u8 order)
>  {
>         phys_addr_t addr = hyp_page_to_phys(p);
>
> @@ -51,7 +51,7 @@ static struct hyp_page *__find_buddy_nocheck(struct hyp_pool *pool,
>  /* Find a buddy page currently available for allocation */
>  static struct hyp_page *__find_buddy_avail(struct hyp_pool *pool,
>                                            struct hyp_page *p,
> -                                          unsigned short order)
> +                                          u8 order)
>  {
>         struct hyp_page *buddy = __find_buddy_nocheck(pool, p, order);
>
> @@ -94,7 +94,7 @@ static void __hyp_attach_page(struct hyp_pool *pool,
>                               struct hyp_page *p)
>  {
>         phys_addr_t phys = hyp_page_to_phys(p);
> -       unsigned short order = p->order;
> +       u8 order = p->order;
>         struct hyp_page *buddy;
>
>         memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
> @@ -129,7 +129,7 @@ static void __hyp_attach_page(struct hyp_pool *pool,
>
>  static struct hyp_page *__hyp_extract_page(struct hyp_pool *pool,
>                                            struct hyp_page *p,
> -                                          unsigned short order)
> +                                          u8 order)
>  {
>         struct hyp_page *buddy;
>
> @@ -183,7 +183,7 @@ void hyp_get_page(struct hyp_pool *pool, void *addr)
>
>  void hyp_split_page(struct hyp_page *p)
>  {
> -       unsigned short order = p->order;
> +       u8 order = p->order;
>         unsigned int i;
>
>         p->order = 0;
> @@ -195,10 +195,10 @@ void hyp_split_page(struct hyp_page *p)
>         }
>  }
>
> -void *hyp_alloc_pages(struct hyp_pool *pool, unsigned short order)
> +void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
>  {
> -       unsigned short i = order;
>         struct hyp_page *p;
> +       u8 i = order;
>
>         hyp_spin_lock(&pool->lock);
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

