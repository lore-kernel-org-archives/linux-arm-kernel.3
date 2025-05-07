Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD42C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btn3LhqGUmuW2q5LXm3m4DGAhqR2o0uzT2Xd87u051w=; b=zAzQntVwRfbZ4iG1lam4JzED1C
	2ckpDCu/nYN6JQPEEEWWea+87b2hefZjYeHM/cxV/KtZY2W9qHoQ5DkNVW7vwrKOYcZjRAXU17J3D
	wZa7gSkTuBmTAT9dxwPPTg1auOjygW6mhLvkUHWK1neNG0HyZ9jRStCD81JvhFEdZ7AtAmWiD2T/U
	JOimwl4t1suZsA/XL4xquuh+qmJD1lkz8ipyG5tGvuPuzMms9kbbi9/71grHhb4UcEWCVDVd/HJ8S
	TObSjXEvvmFxR7Ks6laby08iIX9jLz1MPReWlUtUhPSAzdev162rzd4fjyDxcr1QKxKA0PX7hKmxH
	3OKdDtqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVk4-0000000E7Mw-0hyH;
	Wed, 07 May 2025 03:46:44 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCSJP-0000000DlO0-0jEJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 00:07:05 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b115383fcecso3577005a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 17:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746576418; x=1747181218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=btn3LhqGUmuW2q5LXm3m4DGAhqR2o0uzT2Xd87u051w=;
        b=LRx5KoXoCul92X2DrkBogffi5GedY8Tkt5nItiNcqO9LsuN0Yg1QVmmMkt69UynPwV
         WT1xhJ9xZota40XKGWTYGKHfX9cV4YwC+rlufeXFMt92IL1KIpJm3cBJlRJ2QKU/uy7l
         FwahoDDiICG6m2lqKD88/kerIfWknypCeYM3M6HX4EfpaWaHXumW7Kw8dz+TJHbIP/B0
         O2YZzznCQdRIZ6CW+4x3ov+4Hc1duwjj9xqzPsSEV4s1hK9Ooak58KgBZ5yKxTJMGlaB
         HvOzxHzONKsm/9IxckwVopYLuS0ZlrwNAVuhgDkRGr8DZ6anMWl8O0CK7UvdEvvIFvb2
         pA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576418; x=1747181218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btn3LhqGUmuW2q5LXm3m4DGAhqR2o0uzT2Xd87u051w=;
        b=cEumpc4W22idK4334DYGNABlHu/1qaMKddLId1O+GQ43+oLP4H60+0TpoX8A+PbKxc
         iNTC+UBjv3QTxcXi7Tiq/MGvnubncyW3lWkQbena/x39Dt1almYdYEXKWHaVWRcY5Rv6
         wh5QSetZzLwdiAdpnh+QpCT5vOHNw0mQXVFza7E44sgafpQYJ2cC3afawD6LnrqFGyVO
         3OxLUVAPxsttC1LMUyNN9MMWisB0g1a0p6ViIBQO9dWSpCktp7ZuJ9kjDW+646Ubq9Xk
         v7hd97Ne5TXs0x23ycjmwFTBwoRsz+qFZjl8Bbd4Aju2XJUB+7vMJBh4QJLKUEMqFmDP
         ro3g==
X-Forwarded-Encrypted: i=1; AJvYcCV03Ok0bM0iXKM5G/IPUH5Y8KdJ7cz8WO5VCdekpFEwI0BGLP79fE5uCITRKl8jriZuMjRA8VgzZ3H+MJtLuFTU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2+ZNzHrH6e5mxEgqFP3bPcrEeGfY3ge9RIYZbJ5evhk8CdR+t
	hIH+4MM9GEN3awNKEQJYTdXM1ZKafVUkFAOwDsBfwuHpvhWSDD7kaF61rMSEA72UI2YD5ZWiIGN
	XTw==
X-Google-Smtp-Source: AGHT+IE5kiyt3mLLPMmlAjvZ9sp27wxLvnJ1rcyvQV12u4OmcEbBS1ad1jPVl9wL0g7JEjpFk80jEUXWV/s=
X-Received: from pjyf14.prod.google.com ([2002:a17:90a:ec8e:b0:301:4260:4d23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc5:b0:2fe:99cf:f579
 with SMTP id 98e67ed59e1d1-30aac15ed4amr2041810a91.4.1746576417804; Tue, 06
 May 2025 17:06:57 -0700 (PDT)
Date: Tue, 6 May 2025 17:06:56 -0700
In-Reply-To: <20250109204929.1106563-7-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com> <20250109204929.1106563-7-jthoughton@google.com>
Message-ID: <aBqkINKO9PUAzZeS@google.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_170659_213906_956DA30D 
X-CRM114-Status: GOOD (  13.86  )
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

On Thu, Jan 09, 2025, James Houghton wrote:
> @@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>  				   enum kvm_mr_change change)
>  {
>  	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
> +	u32 new_flags = new ? new->flags : 0;
> +	u32 changed_flags = (new_flags) ^ (old ? old->flags : 0);

This is a bit hard to read, and there's only one use of log_dirty_pages.  With
zapping handled in common KVM, just do:

@@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
                                   const struct kvm_memory_slot *new,
                                   enum kvm_mr_change change)
 {
-       bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+       u32 old_flags = old ? old->flags : 0;
+       u32 new_flags = new ? new->flags : 0;
+
+       /* Nothing to do if not toggling dirty logging. */
+       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
+               return;
 
        /*
         * At this point memslot has been committed and there is an
         * allocated dirty_bitmap[], dirty pages will be tracked while the
         * memory slot is write protected.
         */
-       if (log_dirty_pages) {
+       if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
 
                if (change == KVM_MR_DELETE)
                        return;

