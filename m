Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B3AC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAdAYAObjlI2OlXyFTHPPp+bDQ+yzkEEVLhx/up3FzI=; b=QKV78X6x6S6DH0FEWeqEq8HbXM
	rlvlUEeCZH+p+cvVosL7aLAIvILFxqiDU7OQTMafN7XpG2mBM0nA8BRqJqxPzsgptHHC3p3SafUnZ
	ZfcuvDl2ip9nmnPw8FraC/hgR1f2O76K+e6igqyCJPuaEAHLwQkieUHFP4sG/3hcImW0fY5wcYe0N
	+wLexC/yW/eBGx2K99oc6CRnVnyn3pxXljaygH655AjJtH393Uy1Vc5Xg+uoUTZxf07zT6YSueIN4
	KZR8iZ/9XwpQIExd8UJxaj6+GRK3yyXa6nYRMJJiJAm5217D03NB12nS/e8ojNwU+E/ilQ2w6SOoq
	7I4NaFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3R-00000006GMs-3WsM;
	Tue, 28 Jul 2026 21:09:37 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3P-00000006GMU-0Z6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:36 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-84e3d575d6eso430913b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272974; x=1785877774; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CAdAYAObjlI2OlXyFTHPPp+bDQ+yzkEEVLhx/up3FzI=;
        b=Yo6As/RLoMFq/iguw8HbRCUbztkBF6vJycoQYtX10wDAUvXzTb38D2hxbaZSKDmDPB
         SGCsKGUCme+czEn5MUyBgGUBlAyHLoUQyastfR5PLgCH1kvSnvHh/4e3/JYiMTFsBVjs
         h+E9wvr2Pj+spDqMhV3xRO9HNnuMYF97yKkDIiT3aDJzLw2iq2p3Gcvtp3oMeXvbIgaA
         xp8SyQ4LYpp+XrZyyeYgKj4Zb9lF6pusvkrqjfabni2YhJqVI3cz3kVqbwX8wotJgWHW
         xN5o58MS5JNZghVNGBBPiDgUEBh6L1LyQsOjTwSdH6NlgBJXS7GBHDZTiLUNC86mFuJO
         unTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272974; x=1785877774;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAdAYAObjlI2OlXyFTHPPp+bDQ+yzkEEVLhx/up3FzI=;
        b=YZSvXHMLc2xmD9eYqoI1B2CNLae9LADHXKE5qqRk82Y8XvkGXsg3JuzT6RsZzQAJkD
         /RAXjtEelbibjpxRmWKJj0x/xvSI++9J6VyNngq54OM35LrpkP8UdB37apIWAc/P/n8V
         aKyuU8dVqdUFiVyF8T4NREOwu/cxDgKhI4dtxPefdhKthUdoWxAqgBKj+O8pZ6bNrUSN
         cZYb9QbfjU8ttvOWqbm+7M9mkKjyFyYXJWFUJurNJd3rf162F2XumFCZSSFL1Ab9EKtR
         rWnZXoGz+vKNvKcZhAtWqiYnK3tly8GFkavmymhCDREJ17QIWm+qCLNOgfWmGl3ccJqf
         Z6tQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/JjLjsqUlJk+Twqar2YnS50h3pwOdGE0LURAsIQPJpSHmCREs0k8RuHjpH5oEHlX7SLXs3OMf3HoGbLgvO23Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yws+uehgTLER3lFTNO5B4Q679OXvV6GrOY9tyoE8Ev6H1bjYCet
	Ggo7yEyvGLbBwX28dmQ/yBMbL+nkGpqcbADdnZy35v5NIvDnJYkxGmiXNr4LDcBCPzCQ1Nz429c
	Veg==
X-Received: from pgmr31.prod.google.com ([2002:a63:205f:0:b0:c92:460e:4f73])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1396:b0:845:d284:9e11
 with SMTP id d2e1a72fcca58-84e93356ec3mr4281760b3a.56.1785272973393; Tue, 28
 Jul 2026 14:09:33 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-1-praan@google.com>
Subject: [PATCH v9 00/12] iommu/arm-smmu-v3: Implement Runtime/System Sleep ops
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140935_192086_9AA190BE 
X-CRM114-Status: GOOD (  21.91  )
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

As arm-smmu-v3 rapidly finds its way into SoCs designed for hand-held
devices, power management capabilities, similar to its predecessors, are
crucial for these applications. This series introduces power management
support for the arm-smmu-v3 driver.

Design
======
The arm-smmu-v3 primarily operates with in-memory data structures
through HW registers pointing to these data structures. The proposed design
makes use of this fact for implementing suspend and resume ops, centered
around a software gate embedded in the command queue.

1. CMDQ Gate (CMDQ_PROD_STOP_FLAG)
To safely manage runtime PM without regressing performance on high core
count servers or systems not opting for runtime power management, 
this series introduces a CMDQ_PROD_STOP_FLAG (bit 30) in the command 
queue's producer index. The flag acts as a Point of Commitment in the
cmpxchg loop of arm_smmu_cmdq_issue_cmdlist(), ensuring no new indices 
are reserved once suspension begins.

2. Suspend / Resume Flow
The suspend operation follows a multi-stage quiesce sequence:
  a. Stop Traffic: Sets SMMUEN=0 and GBPA=Abort to halt new transactions.
  b. Gate CMDQ: Sets the CMDQ_PROD_STOP_FLAG to block new submissions.
  c. Command Flush: Waits for any in-flight "owner" threads to commit 
     their reserved indices to hardware.
  d. SW Quiesce: Waits for all concurrent threads to release the shared
     cmdq->lock, ensuring no CPUs are left polling CONS register.
  e. HW Drain: Polls the CMDQ until all committed commands are consumed.
  f. IRQ Quiesce: Disables hardware IRQs and waits for racing handlers to
     complete via synchronize_irq()

Entering the suspend sequence implies that the device has no active clients.
In v8, a surgical state-correction is added to runtime_suspend: if draining
fails, the software trackers (cons and owner_prod) are forced to align with
the masked producer index. This voids any stale commands for the next session
and prevents deadlocks or spurious executions upon resumption.

The resume operation clears the STOP_FLAG & performs a full device 
reset via arm_smmu_device_reset(), which re-initializes the HW using the
SW-copies maintained by the driver and clears all cached configurations.

3. Guarding Hardware Access and Elision
The driver ensures the SMMU is active before hardware access via 
arm_smmu_rpm_get() and arm_smmu_rpm_put() helpers. To maintain code
clarity, invalidation call-sites no longer perform manual elision checks;
instead, elision is authoritative within the CMDQ submission path.

The renamed helper, arm_smmu_is_active(), is preserved only for 
critical diagnostic (ATC), early-drop (Page Response), and gerror
short-circuits. For ATC invalidations, devlinks must guarantee the SMMU
is active if the endpoint is active, a WARN_ON_ONCE() catches inconsistencies.

4. Implementation-Specific Quiescing (Tegra VCMDQ)
Implementation-specific gating and draining are consolidated into
a unified quiesce_and_drain_queues callback. The tegra241-cmdqv driver
is updated to gate all active local virtual queues (VINTF0) before
draining.

5. Interrupt Re-config
a. Wired irqs: The series refactors arm_smmu_setup_irqs to allow 
separate installation of handlers, aiding in correct re-initialization.

b. MSIs: The series caches the msi_msg and restores it during resume 
via a new arm_smmu_resume_msis() helper.

c. GERROR: Late-breaking global errors are captured and handled 
immediately after SMMU disablement during suspend to ensure no diagnostic 
information is lost.

Scalability and Performance
===========================
A key design goal of this series is to ensure that high-performance systems 
(typically servers) that do not enable runtime PM are not penalized. By 
embedding a stop flag in the command queue's producer index and designing 
RPM helpers to perform only read-only checks when RPM is disabled, command
submission on these systems incurs negligible overhead. Power-managed 
systems only utilize runtime PM atomics as necessary, ensuring that 
scalability is maintained across all hardware classes.

[v9]
 - Replaced atomic_fetch_or_relaxed() with atomic_fetch_or() for
   correct ordering while asserting the STOP_FLAG
 - Moved arm_smmu_drain_queues() after the cmdq->lock wait loop in
   runtime_suspend() as per feedback in v8.
 - Refactored suspend sequence to use arm_smmu_disable_irqs() and
   synchronize_irq() for safe GERROR handling.
 - Fixed an off-by-one error in suspend polling timeouts.
 - Dropped arm_smmu_cmdq_can_elide() check from inv_range
 - Renamed arm_smmu_cmdq_can_elide() to arm_smmu_is_active().
 - Removed redundant bitwise masking from owner_prod reads.
 - Added comments to explain locking, gating and elision better.
 - Added comments to explain secondary cmdq draining and gating.
 - Rebased on arm/smmu/updates

[v8]
 - https://lore.kernel.org/all/20260601215909.3958732-1-praan@google.com/
 - Centralized elision logic: dropped redundant checks from invalidation
   call-sites; elision is now authoritative within the CMDQ layer.
 - Renamed elision helper to arm_smmu_cmdq_can_elide() and preserved it
   only for diagnostic/safety paths (ATC, GERROR, Page Response).
 - Consolidated implementation-specific gating and draining into a 
   unified quiesce_and_drain_queues callback.
 - Updated tegra241-cmdqv to gate virtual queues before draining,
   addressing non-deterministic timeouts from guest-side submissions.
 - Re-ordered probe sequence to enable pm_runtime only at the end, 
   aligning with SMMUv2 and simplifying error paths.
 - Refactored KUnit tests for better, addressed Nicolin's comments & added
   a multi-threaded kthread race test.
 - Refactored RPM helpers to use early-return patterns for improved clarity.
 - Collected R-bs from Nicolin.

[v7]
 - https://lore.kernel.org/all/20260527221407.1756491-1-praan@google.com/
 - Rebased on the latest arm/smmu/updates branch (which has the removal of
   struct arm_smmu_cmdq_ent merged)
 - Converted manual cmpxchg loops in suspend/resume to use atomics
 - Re-worked to elide invalidations solely based on the CMDQ_PROD_STOP_FLAG
   via arm_smmu_can_elide(), dropping any need for pm_runtime_get_if_active
 - Added an smp_mb() fence in the reset sequence to ensure that the SMMU 
   acquires all RAM updates made by newly un-gated threads before SMMUEN=1
 - Implemented bitwise masking for the PROD register to prevent software 
   metadata (STOP_FLAG) bits from being written to physical hardware.
 - Introduced a KUnit test suite to verify the CMDQ gating algorithm

[v6]
 - https://lore.kernel.org/all/20260414194702.1229094-1-praan@google.com/
 - Replaced the atomic nr_cmdq_users counter with CMDQ_PROD_STOP_FLAG
   to eliminate atomic overhead on high-core count servers.
 - Implemented a 5-step quiesce sequence in runtime_suspend including
   pipeline flushes and software completion barriers.
 - Introduced arm_smmu_rpm_get_if_active() to elide TLB/CFG/ATC 
   invalidations when the SMMU is suspended.
 - Added WARN_ON_ONCE() in invalidation paths to detect inconsistent
   power states for active endpoints.
 - Refined batch submission in __arm_smmu_domain_inv_range() to ensure
   clean state when dropping batches.
 - Refactored GERROR handling for better integration with suspend.
 - Added Suggested-by tags for Daniel Mentz.

[v5]
 - https://lore.kernel.org/all/20260126151157.3418145-1-praan@google.com/
 - Refactored GERROR handling into a helper function and invoked it during
   runtime suspend after disabling the SMMU to capture any late-breaking
   gerrors as suggested by Jason.
 - Updated `arm_smmu_page_response` to be power-state aware and drop
   page faults received while suspended.
 - Included a patch from Ashish to correctly restore PROD and CONS
   indices for tegra241-cmdqv after a hardware reset.
 - Collected Reviewed-bys from Mostafa and Nicolin.

[v4]
 - https://lore.kernel.org/all/20251117191433.3360130-1-praan@google.com/
 - Dropped the `pm_runtime_get_if_not_suspended()` API in favor of a
   simpler, driver-specific biased counter (`nr_cmdq_users`) to manage
   runtime PM state.
 - Reworked the suspend callback to poll on the biased counter before
   disabling the SMMU.
 - Addressed comments for the MSI refactor.

[v3]
 - https://lore.kernel.org/all/20250616203149.2649118-1-praan@google.com/
 - Introduced `pm_runtime_get_if_not_suspended` API to avoid races due
   to bouncing RPM states while eliding TLBIs as pointed out by Daniel.
 - Addressed Nicolin's comments regarding msi_resume and CMDQV flush
 - Addressed Daniel's comments about CMDQ locking and draining
 - Addressed issues related to draining the evtq and priq
 - Dropped the code to identify and track user-space attachments

[v2]
 - https://lore.kernel.org/all/20250418233409.3926715-1-praan@google.com/
 - Introduced `arm_smmu_rpm_get_if_active` for eliding TLBIs & CFGIs
 - Updated the rpm helper invocation strategy.
 - Drained all queues in suspend callback (including tegra241-cmdv)
 - Cache and restore msi_msg instead of free-ing realloc-ing on resume
 - Added support to identify and track user-space attachments
 - Fixed the setup_irqs as per Nicolin & Mostafa's suggestions
 - Used force_runtime_suspend/resume instead as per Mostafa's suggestion.
 - Added "Reviewed-by" line from Mostafa on an unchanged patch

[v1]
 - https://lore.kernel.org/all/20250319004254.2547950-1-praan@google.com/

Ashish Mhetre (1):
  iommu/tegra241-cmdqv: Restore PROD and CONS after resume

Pranjal Shrivastava (11):
  iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
  iommu/arm-smmu-v3: Add a helper to drain cmd queues
  iommu/tegra241-cmdqv: Add a helper to drain VCMDQs
  iommu/arm-smmu-v3: Cache and restore MSI config
  iommu/arm-smmu-v3: Handle gerror during suspend
  iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to gate CMDQ submissions
  iommu/tegra241-cmdqv: Add a helper to quiesce VCMDQs
  iommu/arm-smmu-v3: Implement pm_runtime & system sleep ops
  iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
  iommu/arm-smmu-v3: Invoke pm_runtime before hw access
  iommu/arm-smmu-v3: Add KUnit unit tests for Runtime PM

 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  20 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 171 ++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 518 +++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  27 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  73 +++
 5 files changed, 780 insertions(+), 29 deletions(-)


base-commit: a86c36163c9722545d27e92bdad8418fdcaa8b1d
-- 
2.55.0.487.gaf234c4eb3-goog


