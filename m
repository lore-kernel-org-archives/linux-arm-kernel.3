Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D7FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WU9RnG3prte+XfxV/XkwbzM4ROyF/nnLjJ6rboFsA7o=; b=Yolp7HFBE8kO0eTZSXQvMlVf1x
	AbY+o/N5PYRezE9XkHapz7EalBihQX2j/0Qz4IYwCIMY8K0F8mKtZtzxX9EkXBGwN4AMgxcV+EdcB
	BwIpFzItL8+kYaXKh2oxNQx4Jb4MgXk7hWprlUQG3BMrxhwFjEN9lQlxt7UdXZhjhTMmZvh4CCN2l
	2lqZWse/VjJm5caaG5FAh1ks5EYUwZOgK40JCYQamJZ4woCa7ei4etKD4Hp3DKKDAWSG/SEMnlKfV
	+tEVNoM3SJLAYt5IXoBSXDFXlIjpRRFsTobKKIegLkxkPCRD3xERJI+aaidKKHC2Dq23e6+L44cXn
	/5iTcwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfSw-0000000G7Qh-2h0c;
	Thu, 29 May 2025 15:46:46 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfBF-0000000G4VP-1KjA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 15:28:30 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b26e38174e5so1091928a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748532508; x=1749137308; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WU9RnG3prte+XfxV/XkwbzM4ROyF/nnLjJ6rboFsA7o=;
        b=V64TRzr2IKDz4qdsvazKlRbX+tn599BSaa0YGMQNBlEZv2/JeATx9whuLneJcWu/QQ
         yDfAhQOZhSehnmiS9GXOlosN3+47FV9xHgYFImxPOH4h+1pvjX0iJ4FtkxmmijztT3AI
         fqDmpoQNdQySGmfzhHkPebDqZFrVEA/IZWgWA/nWWxXqBiGCAnyaeFD4yK5dzNgcKSIL
         kDf6KSQ7TJIDdtW/K/eVwfmgNocj2n0iemS2i6CT3+lEJZ2iDBUqrTA5DVgmAP6eP+aF
         EugCvapqcKwoPWnysD4Bd/oAr0nR8GRLVgHmhMjyCbcat8VgJ7M6ZXNyIRUuu1MjrXac
         kg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748532508; x=1749137308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WU9RnG3prte+XfxV/XkwbzM4ROyF/nnLjJ6rboFsA7o=;
        b=USt+26EmqK4L+uJzV8OPJ1gds4ZvBS7nN1aSZNXWboTc+nt46m0NJirDlWLFtT0DO0
         vtlWgiON5xSk1Xn/UhgujWh8/Ylhk4xLSqCXRl+cdEFdKCZI61MWw9P+PMgfGvvEY0Hh
         ak3MdcuV2wqJ7X2UkU55Oi2vk4j6u2kTr6NaoH73nbNEnXyS/Xg+Hmg0hDOy0HcEF6lc
         nR8Br3xG+rAua4E0iaKTAMvY2XviIcYzfvZiyS9hmDGdiEpsfv8WCsmDnYOp15UnsT7q
         n8PV55++9u0jLqnfvK7kH+py1zl+5vMgZDsvaDVe5Y77QM1N3cV6tsuZkICMPLwWtxTg
         1HhA==
X-Forwarded-Encrypted: i=1; AJvYcCUuU/6kaLCoUafBk94b11749cDS9EDCnxYBhq0Q/gG3bPtVOFOl11xgERiep5p9es1D+G5MspS+c/vk6X4PBpYt@lists.infradead.org
X-Gm-Message-State: AOJu0YwbPzosse1Gr6dV0b3AtdT9VXnmPGsGzwRUI319nl1OrryAuEPR
	YtylspSxkKJjHdXJXzxjwUebp86KoWVG1hsPCrUyGM0ll/X36CeRYVu8IdJoro9eEy8I1bPM11P
	zAtDcCQ==
X-Google-Smtp-Source: AGHT+IHbtuprtUf3WXvE9In2+LJbs9yJtttrgnsqC0Q6ZRBKRVcjg83ZBIKBGMMJVz/hhN7+gaivfNuenbM=
X-Received: from pjbpx18.prod.google.com ([2002:a17:90b:2712:b0:311:8076:14f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dce:b0:312:26d9:d5a0
 with SMTP id 98e67ed59e1d1-312413f60famr66406a91.3.1748532508047; Thu, 29 May
 2025 08:28:28 -0700 (PDT)
Date: Thu, 29 May 2025 08:28:26 -0700
In-Reply-To: <CADrL8HXjLjVyFiFee9Q58TQ9zBfXiO+VG=25Rw4UD+fbDmxQFg@mail.gmail.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <aBqlkz1bqhu-9toV@google.com> <CADrL8HXjLjVyFiFee9Q58TQ9zBfXiO+VG=25Rw4UD+fbDmxQFg@mail.gmail.com>
Message-ID: <aDh9GtncjlVvvVJ1@google.com>
Subject: Re: [PATCH v2 00/13] KVM: Introduce KVM Userfault
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_082829_356689_6697D226 
X-CRM114-Status: GOOD (  24.59  )
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

On Wed, May 28, 2025, James Houghton wrote:
> The only thing that I want to call out again is that this UAPI works
> great for when we are going from userfault --> !userfault. That is, it
> works well for postcopy (both for guest_memfd and for standard
> memslots where userfaultfd scalability is a concern).
> 
> But there is another use case worth bringing up: unmapping pages that
> the VMM is emulating as poisoned.
> 
> Normally this can be handled by mm (e.g. with UFFDIO_POISON), but for
> 4K poison within a HugeTLB-backed memslot (if the HugeTLB page remains
> mapped in userspace), KVM Userfault is the only option (if we don't
> want to punch holes in memslots). This leaves us with three problems:
> 
> 1. If using KVM Userfault to emulate poison, we are stuck with small
> pages in stage 2 for the entire memslot.
> 2. We must unmap everything when toggling on KVM Userfault just to
> unmap a single page.
> 3. If KVM Userfault is already enabled, we have no choice but to
> toggle KVM Userfault off and on again to unmap the newly poisoned
> pages (i.e., there is no ioctl to scan the bitmap and unmap
> newly-userfault pages).
> 
> All of these are non-issues if we emulate poison by removing memslots,
> and I think that's possible. But if that proves too slow, we'd need to
> be a little bit more clever with hugepage recovery and with unmapping
> newly-userfault pages, both of which I think can be solved by adding
> some kind of bitmap re-scan ioctl. We can do that later if the need
> arises.

Hmm.

On the one hand, punching a hole in a memslot is generally gross, e.g. requires
deleting the entire memslot and thus unmapping large swaths of guest memory (or
all of guest memory for most x86 VMs).

On the other hand, unless userspace sets KVM_MEM_USERFAULT from time zero, KVM
will need to unmap guest memory (or demote the mapping size a la eager page
splitting?) when KVM_MEM_USERFAULT is toggled from 0=>1.

One thought would be to change the behavior of KVM's processing of the userfault
bitmap, such that KVM doesn't infer *anything* about the mapping sizes, and instead
give userspace more explicit control over the mapping size.  However, on non-x86
architectures, implementing such a control would require a non-trivial amount of
code and complexity, and would incur overhead that doesn't exist today (i.e. we'd
need to implement equivalent infrastructure to x86's disallow_lpage tracking).

And IIUC, another problem with KVM Userfault is that it wouldn't Just Work for
KVM accesses to guest memory.  E.g. if the HugeTLB page is still mapped into
userspace, then depending on the flow that gets hit, I'm pretty sure that emulating
an access to the poisoned memory would result in KVM_EXIT_INTERNAL_ERROR, whereas
punching a hole in a memslot would result in a much more friendly KVM_EXIT_MMIO.

All in all, given that KVM needs to correctly handle hugepage vs. memslot
alignment/size issues no matter what, and that KVM has well-established behavior
for handling no-memslot accesses, I'm leaning towards saying userspace should
punch a hole in the memslot in order to emulate a poisoned page.  The only reason
I can think of for preferring a different approach is if userspace can't provide
the desired latency/performance characteristics when punching a hole in a memslot.
Hopefully reacting to a poisoned page is a fairly slow path?

