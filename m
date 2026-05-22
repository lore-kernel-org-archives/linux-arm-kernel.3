Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FCCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQhHJfh4HJHIRKBbZ8MGHnuBEnB4lEtnjbMx9SjY/+8=; b=SDQzccPOnyx4ahd7APDyBwA0+p
	2fiwONmj4zVlQxFH1639MWIxT539WgMgtibh4eXCBrMHoDWgVMuIWbBtU2tVBus5MU0/25XxGB0u6
	lBQAjh1mUBC8RE01aFy5CUZeoCAGH5s6497vSM2drRdISAEw82hRCOpUbLjNdJndCnMocEGTzT0gK
	jeED2cZoLoVuSy/8EhYnIqCyt8h54XL7VCCW4jB+rblHBDbMBWPxWwAeqRzbXL9fDEzA6YY1Y2MlB
	DjO9pQkePNliopabJ+fqFJZnyKjOTel6klx7tq20px+xXNBZWLFg60n4B4etmobzG/dEGYzcx2jye
	K+wakCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJlZ-0000000A0x2-2Ffc;
	Fri, 22 May 2026 06:53:53 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJlX-0000000A0wN-20W0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 06:53:52 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-516d6009380so7791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 23:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779432830; cv=none;
        d=google.com; s=arc-20240605;
        b=TCjV8mgaP87IEVIK8zQIg2Ybx0RwoqQr06t98///ioRWoGSNYFMlLvoMncn+w3+vs4
         HKdXzRiI83t2W7gqS31Ir3e17zUs/r7GEAAsA1haz/uKznjaZkk9W0Wu7fC3gQsA3AFh
         8OPcM4a8lH8wQ1ubrxt16fDmax2/w3RRb0NvEwEtiZ16OqBNIwfcW20tMVovJGERShIf
         U9Tgh9SGGHW9zmHr/n8gu/4J1iQlAOVPHL2Vl763k71qnv93jjtPp3svJiRV8sEHga5C
         6tdBMZI7Zt9OAeUhuE29h1Ds6KnNygDuf2IMSGQurNpBnUSFmyuvMtZHUY0yOIySKdIz
         gyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IQhHJfh4HJHIRKBbZ8MGHnuBEnB4lEtnjbMx9SjY/+8=;
        fh=UOCK9FQYughiy4b/LF8pdfzjYl3YY38BHJVCbRWjf2o=;
        b=B88vv5lAj/f57c7KToWa7167NK7GZpBhFefAeY0VGOcZgsECuZBC2hVBSfzSW9hrOn
         PE0EQxPxH1WtuPotwwSUKpi+UKtqMQtcjor8JQx2oVeeqNuFWrlWXGoA9xZk3sQp1iJY
         /zbYCNW2PnEw595DnAPDIW67T5CjKQGJNFMAg/IC+G7kem/ZpET6rbFXAoCjtJz3bbk0
         FWJQaQbk4Xr+X2fRbPLwohychzQyAmIK+vCmQTjnCcmT8hCU6iTevQ9qX9j0JsD0tNOt
         n7uGJUKS9qhaoS6KFvXZNLL7VnTGmazatK4LOb9rzQLX56XS12W4g1OaomuGpv8Fmd2E
         M37w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779432830; x=1780037630; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IQhHJfh4HJHIRKBbZ8MGHnuBEnB4lEtnjbMx9SjY/+8=;
        b=UxSxLeOJWq2MvEYrvmHQVfLjquyn7Md7SY8iDcv2rZxIeR6QnONfrB9asei/PCLVXO
         dsgb4EgExUnhwOsDZ4aYxLSlRtWtKVBn0S+LSyjRPDz3aDXUSJupYIBWHlm991UhjBhq
         VhglsT8qB8K0rgpLV68aiPIwD2qDtfX4n4xcyjaqEChs8xalSr1qOBqpSbQWJwbYyA/i
         Yuh2dWTWbjccbHqdZiEdH16zwTl5iAVXF4hfDnjXaTO0t0HSvBXTKeAJJK4ripFZ/Dbq
         CIowgVj3/tsnALlkn9RUYLdJlYYXWxVAesXsU6KJ1U2v/UmgpebKUnzP6gAvNenKHCf4
         3l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779432830; x=1780037630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQhHJfh4HJHIRKBbZ8MGHnuBEnB4lEtnjbMx9SjY/+8=;
        b=laZJ3ZJQdkD50HmY5XD0kABsVTQEjWZSB61/b9uV0Z8Bwf+IQ/hE1e7KKnCwVCSHiW
         fIXTBZ3/ZgmcPKIIVhf4xBe69/xoxys+EJImwURHGB4vGCQR7pkynRU2bj46YnmmG8M+
         EL3u/xxfZPu1dslZxwM5VuvdKRDPmch2Am0Jtkpcu2DIiKMz5lUJTHP3rgCXaztAbtaV
         VtZiUWvKLaTW1RQN+dM+XZ63MFbEJAuxci4CmvDtZmH1FwzRRNotk1MMGe62QtCl1LCU
         Nz9kCtYyhiDXsOShQ/h08i8L+/vKYakD4YxWznS8+0cQe5SfCHtIlH1WkF9eY8xYI/r/
         PDag==
X-Forwarded-Encrypted: i=1; AFNElJ9O5gAPpKWPhQ+mJbUkE6+7OuNI/9WpMUy+Or6Ry26jPO+diCzmWpMFZPzSBcpLrhvPpoWKF0wn1uR0V1H2b/c8@lists.infradead.org
X-Gm-Message-State: AOJu0YyET0N+a08cT9crH1401xQHueLoacH/JP+hzI+peeOO8kQu7/Wq
	yv4VwwjurJt2TJEfBUbiRQ+VGeiqAzEBlAU0Fqve7PSnb5nuJoWnYWCEpvzu7WfrD7xYYFaPKGV
	PHf83BKSNqmamNSg6kLJafDhSYxTtp/XoYLTpA5bI
X-Gm-Gg: Acq92OFeLc6gxUJe0mB2s1cGaehNVAps0MqSKZVBbxaUspBGiMGhPO7oZHvcBUkEDD6
	4uuxSeGX+zC3Dym5wG/6RGptaoeKtowIXg8iTat7cOWpqyJozNadqAZJY/clvnWMUo1rlG4mpn5
	9XR1uZeMFufEZBRGfIktWBBp6YUcKxFJcGQNBAPR6alGPXfM0vEjl6ZdAuNaqtjmdzL8qUlVv1h
	zbsOao4WsI4dm+6VZU5wQbEMAztRnfQZhLDKZ92koeCNO71eznolyT7Ritxilq+4P5FyHe4fxtw
	ono8NYyVuVqy18R0BSs=
X-Received: by 2002:ac8:6653:0:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-516d659cc80mr4717571cf.6.1779432829433; Thu, 21 May 2026
 23:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260521143626.1005660-1-vdonnefort@google.com> <20260521143626.1005660-2-vdonnefort@google.com>
In-Reply-To: <20260521143626.1005660-2-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 22 May 2026 07:53:12 +0100
X-Gm-Features: AVHnY4Jv0EaljAyykPK_pB_vGkQ6vnQXEaJLoJjK1X2jGl3KFbAvDrfSZMVFdPk
Message-ID: <CA+EHjTykWtsRtHhz5epMU_qrG85nc2CJWGX=nv-X6kH3VGXe6A@mail.gmail.com>
Subject: Re: [RESEND v3 1/3] KVM: arm64: Reset page order in pKVM hyp_pool
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_235351_535892_7EC73BAC 
X-CRM114-Status: GOOD (  23.76  )
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

On Thu, 21 May 2026 at 15:36, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> When a VM fails to initialise after its stage-2 hyp_pool has been
> initialised, that stage-2 must be torn down entirely. This requires
> resetting both the refcount and the order of its pages back to 0.
>
> Currently, reclaim_pgtable_pages() implicitly resets the page order by
> allocating the entire pool with order-0 granularity. However, in the VM
> initialisation error path, the addresses of the donated memory (the PGD)
> are already known, making it unnecessary to iterate over all pages in
> the pool.
>
> Since the vmemmap page order is a hyp_pool-specific field, leaving a
> non-zero order on hyp_pool destruction is harmless until another pool
> attempts to admit the page. Instead of resetting this field during
> destruction, reset it during pool initialization in hyp_pool_init().
>
> For 'external' pages, we can't trust the order either as they bypass
> hyp_pool_init(). Since we never coalesce them, enforce order-0 to ensure
> safe insertion into the pool.
>
> This leaves no vmemmap order users outside of hyp_pool.
>
> Fixes: 256b4668cd89 ("KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 25f04629014e..fa447d400b71 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -217,7 +217,6 @@ static void *guest_s2_zalloc_page(void *mc)
>         memset(addr, 0, PAGE_SIZE);
>         p = hyp_virt_to_page(addr);
>         p->refcount = 1;
> -       p->order = 0;
>
>         return addr;
>  }
> @@ -322,7 +321,6 @@ void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
>         while (addr) {
>                 page = hyp_virt_to_page(addr);
>                 page->refcount = 0;
> -               page->order = 0;
>                 push_hyp_memcache(mc, addr, hyp_virt_to_phys);
>                 WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(addr), 1));
>                 addr = hyp_alloc_pages(&vm->pool, 0);
> diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> index a1eb27a1a747..57f86aa0f82f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> @@ -94,13 +94,22 @@ static void __hyp_attach_page(struct hyp_pool *pool,
>                               struct hyp_page *p)
>  {
>         phys_addr_t phys = hyp_page_to_phys(p);
> -       u8 order = p->order;
>         struct hyp_page *buddy;
> +       bool coalesce = true;
> +       u8 order = p->order;
>
> -       memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
> +       /*
> +        * 'external' pages are never coalesced and their ->order field
> +        * untrusted as they bypass hyp_pool_init(). Enforce order-0.
> +        */
> +       if (phys < pool->range_start || phys >= pool->range_end) {
> +               order = 0;
> +               coalesce = false;
> +       }
> +
> +       memset(hyp_page_to_virt(p), 0, PAGE_SIZE << order);
>
> -       /* Skip coalescing for 'external' pages being freed into the pool. */
> -       if (phys < pool->range_start || phys >= pool->range_end)
> +       if (!coalesce)
>                 goto insert;
>
>         /*
> @@ -237,8 +246,10 @@ int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
>
>         /* Init the vmemmap portion */
>         p = hyp_phys_to_page(phys);
> -       for (i = 0; i < nr_pages; i++)
> +       for (i = 0; i < nr_pages; i++) {
>                 hyp_set_page_refcounted(&p[i]);
> +               p[i].order = 0;
> +       }
>
>         /* Attach the unused pages to the buddy tree */
>         for (i = reserved_pages; i < nr_pages; i++)
> --
> 2.54.0.746.g67dd491aae-goog
>

