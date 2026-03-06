Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4EEF0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BwOlgh6ZUE7+ip/EGV9A/3opBVCZWrRyXJLI+YqAKL0=; b=2G+614cqLgS4Oid7irVCuUjet6
	V+vaCF+av6BnXeaMU6xLBPZXKZCQKVOFqwdx4ocAW3sOm66Ie5zoj5XoylayXDd1H3w1RayUoObdw
	Oyh+nkldvJ/wuLi6tWaLfWm4pGiQgUCF5rUoXN8Qn4qNTC0KK5NrYGG7RUhpNZC8x+Qg3BNegBoXW
	6fM0P1eMhMIGYNNSm9EdkguGgfuwijSybAcaO9M5Fc3uBDDcw2HE89eXBceGaJhPEMAHURB4YKHgl
	1MDo7iE3anFBfN6WEwf68+maR2yUKvut2qjVWn+qJvU2tgCGBLVy4QO3t0cg1520aKxL6usvLki0f
	3L0L3KZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlI-00000003q5C-2nD0;
	Fri, 06 Mar 2026 14:02:40 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlE-00000003q3b-0vPS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:38 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-661aae3a881so1285921a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805754; x=1773410554; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BwOlgh6ZUE7+ip/EGV9A/3opBVCZWrRyXJLI+YqAKL0=;
        b=2Q0JR0AN/amlOE6aqWMZRP12aNLecNi7DvHvsJvsYPQkBD465kqdTJSbhV083odfyx
         CinXZedJETWipwZgmx+5tpoPEcDAZE/KVtuvpRcJsQhwV6tGO3HDdXLQSlxrF8oHmo8B
         TC7gjxk59zdN+wohLUR9DDIEgvz3uODRHXjLObBYkixoZAxH80L+e7WncWTMgHFlYSdd
         Yhx7F/QXOOLyBRX1X7ycmn4FptbH27Xi7afRbESudmWPwR8kG9xPIz0u+rSqaRjy7Ql6
         IoYnNY3YtTKqTn3cYKE/BcJaMBQDqQlYyb9EsJI9fh54qVrZdXQZVXq3U1Wc6krpUcaD
         rmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805754; x=1773410554;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwOlgh6ZUE7+ip/EGV9A/3opBVCZWrRyXJLI+YqAKL0=;
        b=oF9yNnyfBZggCA5Ddaxk9bh5OwSxNWxvM97dYAq3Bh0g91Otyz/EyGwZw4fO1U08aS
         iYtyFfCVBUHrLeMwFo10Dzgr4hGPjGsMKQmxaqumL5U3KQZCBnuFdy0mwTv5rpbVjGGA
         FX9AulMWFOr+TV/CAor6zrjuWXseQ/e7LTWe44SzbdNcB3VmGJrCsgjJASxGfXj6LdVZ
         JOJDomQ1hL6GC9pRS1pVFu5WtEX7Cwgt006c6TIHWTm4GRC2nmGgkOReYB9Uj0S/Qr1D
         v5ru2TN4mFrct4x6MNCY4MZPsSLaLRASVTn3MCIRJq0PvSlC5n5rik1ec1U5s4u6r6O9
         2jTg==
X-Forwarded-Encrypted: i=1; AJvYcCUtztdgz07S9l3jZtO2f3Eywlk79zkSjBNuBbSdlwZ/EHndmADkfWivHjYL4WZAzbsWQju1phdzuYC/CsrBKlnG@lists.infradead.org
X-Gm-Message-State: AOJu0YzA4/dEwL4B0uGr235hZxuBwbyuwm777sf6ftVUQ+yXGyBV8mEx
	Sg7rxrKEr4DIx8NrTRvctBmYmsDjWW1H84KWYhhTfYPT5S+Xcuw/v4r2ZJsdaRpFwAVI7eXNRSw
	ahg==
X-Received: from edb22.prod.google.com ([2002:a05:6402:2396:b0:661:257c:8537])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:354a:b0:65b:f3d5:ae79
 with SMTP id 4fb4d7f45d1cf-6619d4650damr1116541a12.10.1772805753773; Fri, 06
 Mar 2026 06:02:33 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-1-tabba@google.com>
Subject: [PATCH v1 00/13] KVM: arm64: Refactor user_mem_abort() into a
 state-object model
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060236_277438_A348F67D 
X-CRM114-Status: GOOD (  14.78  )
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

As promised in my recent patch series fixing a couple of urgent bugs in
user_mem_abort() [1], here is the actual refactoring to finally clean up this
monolith.

If you look through the Fixes: history of user_mem_abort(), you will start to
see a very clear pattern of whack-a-mole caused by the sheer size and
complexity of the function. For example:
- We keep leaking struct page references on early error returns because the
  cleanup logic is hard to track (e.g., 5f9466b50c1b and the atomic fault leak
  I just fixed in the previous series).
- We have had uninitialized memcache pointers (157dbc4a321f) because the
  initialization flow jumps around unpredictably.
- We have had subtle TOCTOU and locking boundary bugs (like 13ec9308a857 and
  f587661f21eb) because we drop the mmap_read_lock midway through the function
  but leave the vma pointer and mmu_seq floating around in the same lexical
  scope, tempting people to use them.

The bulk of the work is in the first 6 patches, which perform a strict,
no-logic-change structural refactoring of user_mem_abort() into a clean,
sequential dispatcher.

We introduce a state object, struct kvm_s2_fault, which encapsulates
both the input parameters and the intermediate state. Then,
user_mem_abort() is broken down into focused, standalone helpers:
- kvm_s2_resolve_vma_size(): Determines the VMA shift and page size.
- kvm_s2_fault_pin_pfn(): Handles faulting in the physical page.
  - kvm_s2_fault_get_vma_info(): A tightly-scoped sub-helper that isolates the
    mmap_read_lock, VMA lookup, and metadata snapshotting.
- kvm_s2_fault_compute_prot(): Computes stage-2 protections and evaluates
  permission/execution constraints.
- kvm_s2_fault_map(): Manages the KVM MMU lock, mmu_seq retry loops, MTE, and
  the final stage-2 mapping.

This structural change makes the "danger zone" foolproof. By isolating
the mmap_read_lock region inside a tightly-scoped sub-helper
(kvm_s2_fault_get_vma_info), the vma pointer is confined. It snapshots
the required metadata into the kvm_s2_fault structure before dropping
the lock. Because the pointers scope ends when the sub-helper returns,
accessing a stale VMA in the mapping phase is not possible by design.

The remaining patches in are localized cleanup patches. With the logic
finally extracted into digestible helpers, these patches take the
opportunity to streamline struct initialization, drop redundant struct
variables, simplify nested math, and hoist validation checks (like MTE)
out of the lock-heavy mapping phase.

I think that there are still more opportunities to tidy things up some
more, but I'll stop here to see what you think.

Based on Linux 7.0-rc2 and my previous fixes series [1].

[1] https://lore.kernel.org/all/20260304162222.836152-1-tabba@google.com/

Cheers,
/fuad

Fuad Tabba (13):
  KVM: arm64: Extract VMA size resolution in user_mem_abort()
  KVM: arm64: Introduce struct kvm_s2_fault to user_mem_abort()
  KVM: arm64: Extract PFN resolution in user_mem_abort()
  KVM: arm64: Isolate mmap_read_lock inside new
    kvm_s2_fault_get_vma_info() helper
  KVM: arm64: Extract stage-2 permission logic in user_mem_abort()
  KVM: arm64: Extract page table mapping in user_mem_abort()
  KVM: arm64: Simplify nested VMA shift calculation
  KVM: arm64: Remove redundant state variables from struct kvm_s2_fault
  KVM: arm64: Simplify return logic in user_mem_abort()
  KVM: arm64: Initialize struct kvm_s2_fault completely at declaration
  KVM: arm64: Optimize early exit checks in kvm_s2_fault_pin_pfn()
  KVM: arm64: Hoist MTE validation check out of MMU lock path
  KVM: arm64: Clean up control flow in kvm_s2_fault_map()

 arch/arm64/kvm/mmu.c | 379 +++++++++++++++++++++++++------------------
 1 file changed, 224 insertions(+), 155 deletions(-)


base-commit: f9985be5e1985930c2d2cf2752e36bb145b3ff7c
-- 
2.53.0.473.g4a7958ca14-goog


