Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30BECA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cO5CSezgILdCLgBGPoB5QW8zV3ggyW4Ktr4y/Mx2zCY=; b=EVT6oH71hU/2KPMpb3Ri+K8P9G
	JUxTkBfVTQVnTbc6EQEOPtOQpgk793cuCm0aEkmhF/sl9pUUTbPFaN+z0NafB7eAbQsA2N63Vnip5
	KZ2BcGJgk/3eThBQEk1UiljT6SFPPRHPN9CP8KqnHIbhteQ0HpvJGww181huv2WsnJUXTAKCIfDzB
	rVjL4ECj3Y9xzBrWMbcO9usVBRzMiaADnn+OgNRfvaAsFUKUUDs6Zrv3QDGDVpuoNj1Xz5QQ1G3y8
	G/GZ91N7F103g8SMy3lxA/XG6GxhdmEWhLgrxOCtPTgb+wLMbTCXZfnt/JoMSh+xuTo9hlahVgBxK
	hJttWD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmM-00000002G3G-1Ikt;
	Tue, 29 Sep 2026 03:45:18 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmJ-00000002G2s-30E4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:17 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-8814bf38f80so2341989b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653514; x=1791258314; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cO5CSezgILdCLgBGPoB5QW8zV3ggyW4Ktr4y/Mx2zCY=;
        b=PtwgAGH1FAUu2sScQ8TswnLGFw8r1ILEokMwzdAZU64rlSfGEyOELjqZo2i/ybwwZZ
         u+nLgHG484tnVw0XHCwUggDZlUuu/urDvnknoVjsSbNh3kSkVE0X9XO7AgDoEWcMMdYq
         iYSBRyospTKHWEodhSulEkLbiGOHvvv0JJCm8wXrZA+rADhuTmUPDZMpCssWJEtZaPUd
         Hms886M9tnc9CJ3YSLTAjA7ZEAJ2ASI+Z7lE4vt8EVeM5XBcg4n8WYeMPcCLFr00U8er
         TG7O3/JJP0Zuf7+ApllWjILFQLBVxRWRZ1R3mJLydKEtMfGhxg2v6lnuqUsnukmaE/vm
         CLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653514; x=1791258314;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cO5CSezgILdCLgBGPoB5QW8zV3ggyW4Ktr4y/Mx2zCY=;
        b=NFZgbnGW0wsRytEmgOQsAKTHGYzzGfqQgTcP1vqWjNlvcyk8WBwGbFCYsItKzopp+x
         hFU4JLZLHBc3syE9RG+S7nBM5i93y3Q35a4r0fl1v+y/nbyh3/TwprQ2EpPZzTr5IWNG
         91Q6eV+QtFjuaambAOKUqi7+m9kgEKQdDdsomq2joDmV9K6c1jjhjLOwkLB7XakeMAJQ
         qhmyrDCsej4l9nD3fpl5hjPoa45rVJ5ysPtpFqTEB9k+qqxOTVfRsPuLDz1Y+OA/DCVU
         I8Rf8pi8fV3AHDHPDmJkZKH/8ig6GM7Yz1o0YDRBmPbnORK2PoGFMo3Wj+sn//kF/TeI
         8usQ==
X-Forwarded-Encrypted: i=1; AKwUvByoYSV8qlQvOfm2RZfNBt87BPttokx4meOzSBmoOVGOCJz8jtapzNqpaay49AsAHo+Di+9W9DoW8MY7RLE0xox2@lists.infradead.org
X-Gm-Message-State: AFuF++mE2LUpirBkcDEL0ECjfWYUO+zi40B3zi9w+8hg6o20qeVROA8L
	YHsf0qj4yLD3OxnosGcAFWPUaUcVZre9AetPqVGrx3rw5eAeC0+XpWPxAsBPM9WdZDSoAXg4tgx
	n3A==
X-Received: from pfbem34.prod.google.com ([2002:a05:6a00:3762:b0:87f:b894:8564])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a8d:b0:883:54dc:7892
 with SMTP id d2e1a72fcca58-88354dc7c05mr3977977b3a.52.1790653513709; Mon, 28
 Sep 2026 20:45:13 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-1-praan@google.com>
Subject: [PATCH v11 00/16] iommu/arm-smmu-v3: Implement Runtime/System Sleep ops
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204515_780669_9C8CC59C 
X-CRM114-Status: GOOD (  22.24  )
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

Entering the suspend sequence implies that the device has no active
clients. In v8, a surgical state-correction is added to runtime_suspend:
if draining fails, the software trackers (cons and owner_prod) are forced
to align with the masked producer index. This voids any stale commands for
the next session and prevents deadlocks or spurious executions upon
resumption.

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
is active if the endpoint is active; a WARN_ON_ONCE() catches
inconsistencies.

4. Implementation-Specific Quiescing (Tegra VCMDQ)
Implementation-specific gating and draining are consolidated into
a unified quiesce_and_drain_queues callback. The tegra241-cmdqv driver
is updated to gate all active local virtual queues (VINTF0) before
draining.

5. Interrupt Re-config
a. Wired irqs: The series refactors arm_smmu_setup_irqs to allow
separate installation of handlers, aiding in correct re-initialization.

b. MSIs: The genirq/msi core caches the msi_msg in
irq_chip_write_msi_msg() and provides msi_device_domain_restore_msi_msgs(),
which arm_smmu_resume_msis() invokes during resume.

c. GERROR: Late-breaking global errors are captured and handled
immediately after SMMU disablement during suspend to ensure no diagnostic
information is lost.

Scalability and Performance
===========================
A key design goal of this series is to ensure that high-performance
systems (typically servers) that do not enable runtime PM are not
penalized. By embedding a stop flag in the command queue's producer
index and designing RPM helpers to perform only read-only checks when
RPM is disabled, command submission on these systems incurs negligible
overhead. Power-managed systems only utilize runtime PM atomics as
necessary, ensuring that scalability is maintained across all hardware
classes.

Sashiko Reviews and Documentation
=================================
The series was run through Sashiko locally. In response to the review
feedback, extensive verbose comments have been added across the series to
thoroughly document hardware/software synchronization invariants, memory
ordering dependencies (Point of Commitment, dma_wmb vs. smp_mb), and
devlink power guarantees. Several edge-case race conditions, unmasking
bugs, and resource leak paths were also addressed.

[v11]
 - Replaced platform_device_msi_rewrite() and driver-side msi_msg caching
   with generic genirq/msi core support as suggested and provided by tglx
   (Thomas Gleixner):
   * Cache desc->msg in irq_chip_write_msi_msg() and document why the
     assignment in __pci_write_msi_msg() remains for direct callers.
   * Provide msi_device_domain_restore_msi_msgs() in kernel/irq/msi.c.
   * Update arm_smmu_resume_msis() to call msi_device_domain_restore_msi_msgs()
     and drop manual msi_msg caching from arm_smmu_write_msi_msg().
 - Rebased onto v7.3-rc4.

[v10]
 - https://lore.kernel.org/all/20260908171712.356645-1-praan@google.com/
 - Picked up common drain helpers from Nicolin's PRI series v3 [1].
 - Introduced platform_device_msi_rewrite() in platform/msi core
   (suggested by Jason).
 - Fixed the stale interrupt issue caused by calling arm_smmu_setup_irqs()
   early in probe (as reported by Sashiko in v9) by passing a bool to 
   arm_smmu_device_reset() to ensure irqs aren't set-up again on resume.
 - Fixed a CMDQ gate bypass race where threads waking from 
   poll_until_not_full() could commit commands after STOP_FLAG was asserted
 - Fixed a masking issue in __arm_smmu_cmdq_issue_cmdlist() & tegra241-cmdqv
 - Added tegra241_vcmdq_wait_quiescent() to wait for in-flight owner threads
 - Fixed VCMDQ drain loop error handling to continue draining remaining
   queues rather than abandoning them on timeout (pointed by Sashiko in v9)
 - Explicitly zeroed *_IRQ_CFG0 registers during resume as they reset to
   unknown values.
 - Cleared ARM_SMMU_FEAT_MSI on MSI setup fallback to avoid spurious
   MSI rewrites on resume.
 - Retitled GERROR patch to "Factor out arm_smmu_handle_gerror()" for clarity
 - Handled devlink creation failure in arm_smmu_probe_device()
 - Added checks for the retval of arm_smmu_rpm_get() in 
   arm_smmu_disable_action() & arm_smmu_device_shutdown()
 - Clarified rationale for asynchronous put in teardown and shutdown paths
   where hardware has already been explicitly disabled.
 - Documented safety of eliding ATC invalidations during suspend based on
   PCIe link power states and devlink guarantees per Jason's comment.
 - Fixed stack timer lifecycle in KUnit tests using timer_setup_on_stack()
   and timer_destroy_on_stack(), and resolved mock register endianness.
 - Added extensive verbose comments across the patches explaining locking,
   synchronization invariants, and devlink power guarantees based on local
   Sashiko review.
 - Collected Reviewed-by tags from Jason Gunthorpe.
 - Rebased onto latest arm/smmu/updates
   [1] https://lore.kernel.org/all/cover.1788222485.git.nicolinc@nvidia.com/

[v9]
 - https://lore.kernel.org/all/20260728210928.1050849-1-praan@google.com/
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

Nicolin Chen (2):
  iommu/arm-smmu-v3: Add Q_POS() macro
  iommu/arm-smmu-v3: Add arm_smmu_drain_queue() helper

Pranjal Shrivastava (12):
  iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
  iommu/tegra241-cmdqv: Add a helper to drain VCMDQs
  iommu/arm-smmu-v3: Add a helper to drain cmd queues
  genirq/msi: Cache MSI message in irq_chip_write_msi_msg()
  iommu/arm-smmu-v3: Restore MSI config on resume
  iommu/arm-smmu-v3: Factor out arm_smmu_handle_gerror()
  iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to gate CMDQ submissions
  iommu/tegra241-cmdqv: Add a helper to quiesce VCMDQs
  iommu/arm-smmu-v3: Implement pm_runtime & system sleep ops
  iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
  iommu/arm-smmu-v3: Invoke pm_runtime before hw access
  iommu/arm-smmu-v3: Add KUnit unit tests for Runtime PM

Thomas Gleixner (1):
  genirq/msi: Provide msi_device_domain_restore_msi_msgs()

 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  20 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 215 ++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 702 +++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  29 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 128 ++++
 drivers/pci/msi/msi.c                         |   6 +
 include/linux/msi.h                           |   2 +
 kernel/irq/msi.c                              |  46 ++
 8 files changed, 1109 insertions(+), 39 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


