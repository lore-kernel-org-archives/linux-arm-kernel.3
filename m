Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C60ACD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V19fwt3YsG4bFoecIfuC0pYkusNGWcQTO//+HSSI3ng=; b=HtBzfnZMjCqHz9mJbjlbxWfE0w
	HTQOwNeYk3b4JCg1+51yRao6utKQJCcftGchAx9I8gzCfjpgtDWfXl5dzrr+GeG5m4kMxrO1JHn8p
	anDQ6pxJxh7EWVJRwZ9jItxoVbcQzGilcogNo6ya0PBu59d0nG2gGjR4eHoTUxI77PY7LC7ZzWwVU
	CKsNNbXL7dOGMtrFRNyBR9N++vsPl0HXHlPZPlCDInMbCDqhuyxPNI7SGoi0PLOyGmuSuEJjOcheo
	lVmPmpb/9W3GWz3JiJJ6tFBx/BiXnAIzL5dbxlOoLzgSzLegW+HaP04Apq4qd/sdwlH12npQVyeJf
	6URCmqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMW1-00000004mLO-3KQw;
	Wed, 27 May 2026 22:14:17 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMVx-00000004mKC-3hTn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:15 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bf0607b5f5so1574835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920052; x=1780524852; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V19fwt3YsG4bFoecIfuC0pYkusNGWcQTO//+HSSI3ng=;
        b=WBS/xGv4uVpnHhY9D2fmqIH5QH4TigOiKZ9UcZBjHubO5XT11NKFgSfnU41b/HVcKv
         endTyifceFomCMKayoKGRQYRjvYsEKkuO4ntDUAkSQ/n5N3sVrIw2vj4tPDJD4dMkhhG
         IJvyLJXdpHH7MU5Ub+XTgF1VM1OgRBz2ThfFEUO1FwTyjWih0P2ydXr4MJWOLupmG9tY
         BpLYhH0bmVTB9f9wvgljSWtHDwXYpBCvOqFDweJu+NESRqPzO3dzeooQucPe9Qgtn9+t
         QWNdM/cypqUUILgn8raT39h2NFxOlaxtQOtYHdGG4Iz6q7abiyuVz2iUeLlpo22H5V5J
         JFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920052; x=1780524852;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V19fwt3YsG4bFoecIfuC0pYkusNGWcQTO//+HSSI3ng=;
        b=l6/7BWvOUhVW0J24fcSqxOhXTFp09fGQ2VWAdFAXWiphPZ1TR5MJfew97TazkLCd6I
         zqIV5wdTgz21DKw0sbjUQmgBw11xsyxjI/Wc2Fkb8AEo67W1UtimQyDHxJGN+hE4GPbt
         KHTf6MC85H5RrPQ4it4YrTqjfsvCrVXf2xiVOF9dPGNkiyc76oH7SepRRanyUyv5t98W
         pFyWW4r6eIGSE0Twh0FCRSxWu5F/Ey+jJZEOBEvmigfdiuJbIAPioqiwQAES5VaVYuUd
         CJOeJN5xW6ABYF9adSweM2yNqLRpSMWOeYFT7xNHhuo222lBpOgvZrT5xmRU9mT2vxAH
         wEZw==
X-Forwarded-Encrypted: i=1; AFNElJ/GHF05Yo9wtz2FFmTBQVlKen7/XooTBTxhhimdnCEPG9DUft284AcsYJROVP3UuLdx2pBLwTzVPDRwqLrg+Flw@lists.infradead.org
X-Gm-Message-State: AOJu0YwWIVaTGyP9GOEiqS8SkPtvB2VSf8LKpyDeL8H2/TWJUJAEokeX
	3XPywGJGRCWv8wWi3pWqSWTxirSbecSCUkY5Xl1o1GLyvab7A+AUyVkErJnn9jf5TdkVMO1bG3S
	m2w==
X-Received: from plhe2.prod.google.com ([2002:a17:903:1c2:b0:2ae:5d79:a153])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b2c:b0:2b0:60db:7927
 with SMTP id d9443c01a7336-2beb06bc19cmr275487085ad.28.1779920051683; Wed, 27
 May 2026 15:14:11 -0700 (PDT)
Date: Wed, 27 May 2026 22:13:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-1-praan@google.com>
Subject: [PATCH v7 00/11] iommu/arm-smmu-v3: Implement Runtime/System Sleep ops
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151413_930676_697A12D4 
X-CRM114-Status: GOOD (  19.23  )
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
The "suspend" operation follows a multi-stage quiesce sequence:
  a. Stop Traffic: Sets SMMUEN=0 and GBPA=Abort to halt new transactions.
  b. Gate CMDQ: Sets the CMDQ_PROD_STOP_FLAG to block new submissions.
  c. Command Flush: Waits for any in-flight "owner" threads to commit 
     their reserved indices to hardware.
  d. HW Drain: Polls the CMDQ until all committed commands are consumed.
  e. SW Quiesce: Waits for all concurrent threads to release the shared
     cmdq->lock, ensuring no CPUs are left polling CONS register.

Entering the suspend sequence implies that the device has no active clients
Any racing command submissions or failure to quiesce at this stage indicate
a bug in the Runtime PM or device link dependencies. Such races should not
happen in practice, which justifies the non-failing nature of the suspend
sequence in favor of memory safety.

The "resume" operation clears the STOP_FLAG & performs a full device 
reset via arm_smmu_device_reset(), which re-initializes the HW using the
SW-copies maintained by the driver and clears all cached configurations.

3. Guarding Hardware Access and Elision
The driver ensures the SMMU is active before hardware access via 
arm_smmu_rpm_get() and arm_smmu_rpm_put() helpers. Commands are elided
if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG 
(via arm_smmu_can_elide()). For ATC invalidations, devlinks must 
guarantee the SMMU is active if the endpoint is active, a 
WARN_ON_ONCE() catches inconsistencies. Elision is safe because
hardware reset on resume invalidates caches, and PCIe device links handle
power dependencies for ATC.

4. Interrupt Re-config
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

Call for review
===============
Any insights/comments on the proposed changes are appreciated,
especially regarding the synchronization & elision logic.

[v7]
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

Pranjal Shrivastava (10):
  iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
  iommu/arm-smmu-v3: Add a helper to drain cmd queues
  iommu/tegra241-cmdqv: Add a helper to drain VCMDQs
  iommu/arm-smmu-v3: Cache and restore MSI config
  iommu/arm-smmu-v3: Handle gerror during suspend
  iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to gate CMDQ submissions
  iommu/arm-smmu-v3: Implement pm_runtime & system sleep ops
  iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
  iommu/arm-smmu-v3: Invoke pm_runtime before hw access
  iommu/arm-smmu-v3: Add KUnit unit tests for Runtime PM

 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  15 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 150 ++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 445 ++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  27 ++
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  29 ++
 5 files changed, 636 insertions(+), 30 deletions(-)

-- 
2.54.0.794.g4f17f83d09-goog

