Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905FCCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QRu9EPlqPIRbrAwuhln90egPhix9C1W7TbuFz42eH5A=; b=rWJV9wpHE4RJEKK2qTWZri4XWm
	LMwbQlukiNDx5qEHoXEaIsDHo6+q/E+nyQME2yXvVY2d6ImBR2+3yB0rywG0VuyGOAc+mx00Ef3HZ
	7qjwqVWj2vA6gFBlYUcm5EI7gzRkMlWEdN8jOGTWl/CsO/fYni70rfnTJcePBbOhEp5HLHJELncCS
	grTaV2lw8hx3mjD1y2KRZGJMn+I8QLlUPLo82Q/Vb/oZk0UqBc2ngMbBJ+i8M8qW3bB1hEUPzSX0u
	vUipVV38przyrlF0PRfsCSrJJBl9Q8P9ij52U/sbmkOGcA19WFRTnB4TlK3oujU1U/XXtPfunV5ZM
	iS3GNOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHXi-00000001HVK-0DLi;
	Fri, 22 Aug 2025 02:30:14 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCOt-00000000bQt-112N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:00:48 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-24458274406so33783515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810046; x=1756414846; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRu9EPlqPIRbrAwuhln90egPhix9C1W7TbuFz42eH5A=;
        b=wIBqIyaZEgm8jFQ6rnaqNTmXNe5sMLce+AXR/PfHBIXzgLHi1S8S697GYn8Eb0sTjb
         K5FxHm8KWWGp1lQiCjNJ91mV7MYtjSL6BXD2+ayb4HXqPgXMcJHRYOuTReUCOaJyGXUp
         84UWS6i2SrGfY9dK3L74m61RdP0A/INkzi/rAT7Bn2t4q32KsjhAVbYkLVGE8nbuWzNd
         c0pxpK9Jq3kGIhtNy73/afxHRJJ1PkGLDCrc5CmOGyjgduzyT27NMXfAwkOqCrGocIqw
         G5fmL/FPnfrhYVRemPdz9nGD6SMSx2rAT52Wy6DCP2mFt40AJQUdKGWrFgV7htpXk+l4
         VhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810046; x=1756414846;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRu9EPlqPIRbrAwuhln90egPhix9C1W7TbuFz42eH5A=;
        b=BMHehqDkbWcOYRQXUIm7HizUgAUnOFc9zm/kbXBtQI5oQsNMN1ZHPDVaRWMgoSpylp
         Y4gAaGGGcv0+uwOeA6yCt6sclWPSrD0QywQaLE3xTnb3nFP68Ye2rlvd1NtGUqhVyXcZ
         vQGvzzKqOHR02NL+CqvlOCfJ1epYqCZ/g1p8CsWiVgXYtv8V4qPnFbkPYnizRu+vzF1s
         an0zRArs18/ubznd2SU5Lx/r5JmnAFMO13XSYMGnMs6r1+T6JNYQTfSjDsk6blJwhWHD
         B7rQsAiqBS6lE4ZUfViFvai5TzlI1g+49cVicjYaVfp/o0seYfR9UddR+C7TLlb77zLl
         TlEg==
X-Gm-Message-State: AOJu0YwIXPrRzO598etY1vPW9x7eHtsJs4asv0lsyMjzEIIiMAmLgNgY
	iwEdmoWbHiTi7q/cXGuemXMQQ7jiaSKc0D5lPQJ/ExiL1jZpLf8JIPayFKsVQ5/L9zr+apEBRRh
	qkYctVQ==
X-Google-Smtp-Source: AGHT+IHZUS2rRBwXbx5vsu0uArLnBj6wHgoX5fZrabl/HszonPOiLFCujnncNL374CLOxHiZbqaT370jPEA=
X-Received: from pjm15.prod.google.com ([2002:a17:90b:2fcf:b0:31f:61fc:b283])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f552:b0:240:b075:577f
 with SMTP id d9443c01a7336-2462ef1d579mr9364185ad.37.1755810045874; Thu, 21
 Aug 2025 14:00:45 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:26 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-1-seanjc@google.com>
Subject: [RFC PATCH 00/16] KVM: arm64: Add "struct kvm_page_fault"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140047_288435_B289CB1B 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add an arm64 version of "struct kvm_page_fault" to (hopefully) tidy up
the abort path, and to pave the way for things like KVM Userfault[*] that
want to consume kvm_page_fault in arch-neutral code.

This is essentially one giant nop of code shuffling.

RFC as this is only compile-tested.  I didn't want to spend time testing
until I got feedback on whether or not y'all are amenable to the general idea.

[*] https://lore.kernel.org/all/20250618042424.330664-1-jthoughton@google.com

Sean Christopherson (16):
  KVM: arm64: Drop nested "esr" to eliminate variable shadowing
  KVM: arm64: Get iabt status on-demand
  KVM: arm64: Move SRCU-protected region of kvm_handle_guest_abort() to
    helper
  KVM: arm64: Use guard(srcu) in kvm_handle_guest_abort()
  KVM: arm64: Introduce "struct kvm_page_fault" for tracking abort state
  KVM: arm64: Pass kvm_page_fault pointer to
    transparent_hugepage_adjust()
  KVM: arm64: Pass @fault to fault_supports_stage2_huge_mapping()
  KVM: arm64: Add helper to get permission fault granule from ESR
  KVM: arm64: Track perm fault granule in "struct kvm_page_fault"
  KVM: arm64: Drop local vfio_allow_any_uc, use vm_flags snapshot
  KVM: arm64: Drop local mte_allowed, use vm_flags snapshot
  KVM: arm64: Move VMA-related information into "struct kvm_page_fault"
  KVM: arm64: Stash "mmu_seq" in "struct kvm_page_fault"
  KVM: arm64: Track "forced" information in "struct kvm_page_fault"
  KVM: arm64: Extract mmap_lock-protected code to helper for user mem
    aborts
  KVM: arm64: Don't bother nullifying "vma" in mem abort path

 arch/arm64/include/asm/esr.h         |   6 +
 arch/arm64/include/asm/kvm_emulate.h |   9 -
 arch/arm64/include/asm/kvm_host.h    |  32 ++
 arch/arm64/kvm/mmu.c                 | 514 +++++++++++++--------------
 4 files changed, 282 insertions(+), 279 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.51.0.261.g7ce5a0a67e-goog


