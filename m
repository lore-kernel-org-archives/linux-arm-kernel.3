Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7044BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdISmA3ixIlNjIAB3K7umMj0lq95tzNubXcY7qdlJJ4=; b=GwWzYzDWHZA0XLGj1JTNn3z2Cg
	PIvCEX52giBzcnkDpH0Yhx+A6M/YaJhWobSfg1mglvi4MQ5XYTDUYBJ2FxiMjeRUT/WLso4ElMIKz
	NsrCUNpptlzTJA55YVCh07oy1FtI5hZ4oFPYqkVN2LhyLbd6XXSWzRLTaoJecJD5j7+wwlKWycsTl
	Jey5aRd4UsKZt0ht+JexZe2ShjC9wj8I61+9plqEWKh+R98lBQOfgvzguxwlD0OZDbiOzyHzL+oNi
	mi2UDTPdIUXlsL9n0PPWiPWomTdVLl4F99rTGFAkGSkRlrzT3ZRMpkPH3oIhi2iFUTepsMiK4JzWZ
	Ql16chPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91bB-00000005iK7-0C91;
	Tue, 22 Sep 2026 14:35:57 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91b8-00000005iJ1-1H0q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:35:55 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so12138a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087751; cv=none;
        d=google.com; s=arc-20260327;
        b=bhuWkT72am29e4+61bzoGZnb9zi/ea2JXWoUCOebVN4No0aQ5w2TE1sPpRmGCMS/f9
         wUpaCzvNdFQ6llG1ZYSBe2Dnkr/oUYqA45MAPO436Sd3BUc62kXLJCRwu7q8XCeEH5kG
         y9uA0bExaSaNvWfOGqGK1PWLPfdMcCXYBCbDmKmI7vH85IWppyO48URSjmVNFpkPnDjZ
         DBxvqi1yQBUWnT9HYzTwzzg64KHPpxNjfOD5uP0RCv+htTJgF9hzgGlRkj8gGCK6BvBn
         9oPefQFpFl5tjO7fRpT/icByCr4Rt6swVCbJujretqVwKQU+ejjpOn7rBIgaPXhW5Slz
         zWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KdISmA3ixIlNjIAB3K7umMj0lq95tzNubXcY7qdlJJ4=;
        fh=Tr9ce0LMpfYQfG4t4TFwv4iGn0DEvt1I2qAIvj+F6yw=;
        b=SMYMtK43aiVtnXI48+bzICd0rkwc22E5hKZt/cGnWhlMm1bVgcu8GxuLJnCzfUmge3
         OQvEhyzkiEa1nJ3zL/zv7oTNhrY3CbyxeDt7LB+Ki85FI1ZGwSCk+xjfrYEn5GjB0UGr
         +n1jDwGX8wrPtDjc4zBcANQTqT2qt5bd/dyeyVL2nZ8NagiisLDdZYtUCfgbgaJcvLgb
         T3OSCDgrv/fw6Ay0neRL40eYc9sp5UVtTtxVE+NvsqAT32kQHpaeK9fAWF5OLWlkqbGa
         FDy8Oahq9rbrlRw+iOxqF94YPWaAnU9JVnW78lzx011vlXQSIB0r4WBRscZMY97BJC/v
         55ng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790087751; x=1790692551; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KdISmA3ixIlNjIAB3K7umMj0lq95tzNubXcY7qdlJJ4=;
        b=jxn77giNsQWTipAL9uT9R6Reali9iriyML6jbH0f1/WCYKnohBRJRkhSy4ScnsRGqI
         qyJ+p0n/u5w9fU9SzUS+sjE2vacOKGbXYJUF9R8rMm73fjb/QfKJG1HSQ/YxV0KNA3l0
         k6V3n+gq0WS1uwE1gMowCHiP13XYONeRxaZwhQTUMQ/XsUA3O8cWaF9VjU1GHUIK5Oqg
         hrcUg+lyYdpYckg7R1rGSwui3+NN1khuw4xaSzbJW7MPVmKUARwHk1e9raGmKPNR3bVa
         5MrcjgDck1dgde9MhSbZLQc6uKwiTwOV1FaRWyL1ehnXsla0rA6n+TnBnosvtrL54wrC
         ZnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087751; x=1790692551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdISmA3ixIlNjIAB3K7umMj0lq95tzNubXcY7qdlJJ4=;
        b=hQK/FCDf68yOtYuK/E3zUUHTvTqvD+UpJgrNx3vkdjwiyodomiYu3i+epIeZflrasX
         Z2iTPY3Ie37Ss8mao+RjJ+9jImNTq29m+/lkN31+L5AGWitejR/S9We15Y3OFE1U70Jr
         jRekkuobaO6bMAAU8SdmfGryF/plameBLBXNCD8KARKLvSKrYFyAeIGFik2XhQnep3Ig
         5DvtvENMdJ15nGxNgn8/uMJ5TWTPYy83jeI/nnx8/beLvDbyw3g/cum8NNgj90YxE099
         hJBjQETQc6j/wN416N99FbFm0CLnMeRyumRya6SaXujbeoJByT010W55i1Ikb4AYgIdx
         FzXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBUfNjMJuqiaVZ3oWjMLMc7dvIIywejFoGwk87Yo4BygnmLectSH9X6FK/5wqCPCN5fytSe4LogCz79b2SEByM@lists.infradead.org
X-Gm-Message-State: AFuF++lPoHxkAjDfncU2lFDyPaBx54YjdWk9J2Fgayl1biX3dr6a/Zqf
	G/6KhV2rEyJKJHgobRoBflUbYPb6JAP8AhlF2PjPf9Ndt5IzeL7Lu1e55XFqS7FxP1mHLX8HIwY
	pu6df5MW9i7Bj3bOcipxwiXkVkls7gOlx5rcmRygj
X-Gm-Gg: AYBFou0b65jByUHAqXOtJ0MQ3Uvy/Yg5klrh8f0DzgsVjpnDCHv7ggMYCBStu9pkq+a
	HYE0kL81W8v4CQMHitvMTdxFyV7PjJXSkmEi/n/RtwycHxwSqYNqwK89GTyu3V30Dq7aHJ3YusH
	+GC0+xIcZ0dLLar+HVFrMDCkmO80DnxZ87Hte6EwCJI7r/AMREIi2DT+AAIzmjaw0jBJJQ6xzvF
	qf6h0D/DIh2DjjexPAAcrWB6OOswyGq/oWTgz3hjkW85w/vbCgGAdwHnvEXGt8y6zB2IXodN6qt
	YXGssV8Sxi9MEotUj6llMbmpwkluNivk16ZOAEVyNsXHmSk++s4ff9lqU4N9hFLeUnyqAgWy/TZ
	/yMTeSIxkhf31dA==
X-Received: by 2002:a05:6402:23c8:b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aaac5924eemr8663a12.4.1790087750560; Tue, 22 Sep 2026 07:35:50
 -0700 (PDT)
MIME-Version: 1.0
References: <20260715150125.2798116-1-smostafa@google.com>
In-Reply-To: <20260715150125.2798116-1-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 22 Sep 2026 15:35:38 +0100
X-Gm-Features: AclHuK-rurQJCakbPVql7LeaZWXspdhQDHQ-9g658VqXPpUrYK4ePYQ8b4RsihE
Message-ID: <CAFgf54rT1wvmGqm+8JqrKShhh+5pEWDS0f4FReT9CJBbcjnk1A@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Use consistent type for pool size
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_073554_368309_35265FCB 
X-CRM114-Status: GOOD (  23.13  )
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

On Wed, Jul 15, 2026 at 4:01=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> All the pool sizes in the hypervisor are "unsigned long" but when
> they get passed to hyp_early_alloc_contig() or hyp_pool_init() they get
> truncated to 32-bits.
>
> That is not a big problem at the moment as to overflow this we need
> 4G bytes of carveout (2 TB of host or guest system memory).
>
> However when new users are added (as IOMMU) it is hard to reason
> about the carveout size anymore.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Ping, as Sashiko reminded me about this:
https://lore.kernel.org/all/20260922132359.BB0381F000FF@smtp.kernel.org/

This has already been reviewed.

Thanks,
Mostafa

> ---
> For example in the SMMUv3 to avoid this overflow, I add a cap
> for the pools size to UINT_MAX to work around this:
> https://lore.kernel.org/linux-iommu/20260715115906.2664882-9-smostafa@goo=
gle.com/
> ---
>  arch/arm64/kvm/hyp/include/nvhe/early_alloc.h | 2 +-
>  arch/arm64/kvm/hyp/include/nvhe/gfp.h         | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/early_alloc.c         | 2 +-
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h b/arch/arm64/k=
vm/hyp/include/nvhe/early_alloc.h
> index dc61aaa56f31..462883c4e325 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> @@ -7,7 +7,7 @@
>  void hyp_early_alloc_init(void *virt, unsigned long size);
>  unsigned long hyp_early_alloc_nr_used_pages(void);
>  void *hyp_early_alloc_page(void *arg);
> -void *hyp_early_alloc_contig(unsigned int nr_pages);
> +void *hyp_early_alloc_contig(unsigned long nr_pages);
>
>  extern struct kvm_pgtable_mm_ops hyp_early_alloc_mm_ops;
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/i=
nclude/nvhe/gfp.h
> index 3766333bace9..3a428dc40b14 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> @@ -29,6 +29,6 @@ void hyp_get_page(struct hyp_pool *pool, void *addr);
>  void hyp_put_page(struct hyp_pool *pool, void *addr);
>
>  /* Used pages cannot be freed */
> -int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> -                 unsigned int reserved_pages);
> +int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages=
,
> +                 unsigned long reserved_pages);
>  #endif /* __KVM_HYP_GFP_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/early_alloc.c b/arch/arm64/kvm/hyp/n=
vhe/early_alloc.c
> index 00de04153cc6..9fef0c7d2185 100644
> --- a/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> @@ -21,7 +21,7 @@ unsigned long hyp_early_alloc_nr_used_pages(void)
>         return (cur - base) >> PAGE_SHIFT;
>  }
>
> -void *hyp_early_alloc_contig(unsigned int nr_pages)
> +void *hyp_early_alloc_contig(unsigned long nr_pages)
>  {
>         unsigned long size =3D (nr_pages << PAGE_SHIFT);
>         void *ret =3D (void *)cur;
> diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nv=
he/page_alloc.c
> index 57f86aa0f82f..51460d420c94 100644
> --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> @@ -229,12 +229,12 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 ord=
er)
>         return hyp_page_to_virt(p);
>  }
>
> -int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> -                 unsigned int reserved_pages)
> +int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages=
,
> +                 unsigned long reserved_pages)
>  {
>         phys_addr_t phys =3D hyp_pfn_to_phys(pfn);
>         struct hyp_page *p;
> -       int i;
> +       unsigned long i;
>
>         hyp_spin_lock_init(&pool->lock);
>         pool->max_order =3D min(MAX_PAGE_ORDER,
> --
> 2.55.0.141.g00534a21ce-goog
>

