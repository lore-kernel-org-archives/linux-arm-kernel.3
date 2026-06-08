Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4513DCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kysrR632iEoa2TtewvziwH+V25b2UIaMgtkp0tI6nis=; b=0xzeZWK6WIws8Dir0FD9DFlN9w
	DcKPl0K0kTbRQew2y7f2Tyh1UuWj3FsRbGFKnbZkRlRc5uRLjBj4oAdnMVuzYIIeweoWJHaDprTEs
	DV5OkiaRnBz1dYFeFmicCHW5ksEDamYZQru5AMw0CRz2cE3YVvhfL7WZRS52FJYohXQr+3Wbezrj2
	QMj9HZEFfNUIcI7WhizEX609uvBnaHIyIPQFqrs3orkg/h7aVAk37CgfdXr7+jdjOgxG7PV+tkIsU
	Y/c93g6FHslBPw6yYbqUbl9RPoQSGkQlirrGnuGorGOCImHJAM9iUU/4G4d8VRKpXPNKzT475pPGS
	Nflx0aQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXTP-00000003LrB-3pfM;
	Mon, 08 Jun 2026 10:44:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXTN-00000003Lqi-1oY1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:44:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEB1C1E2F;
	Mon,  8 Jun 2026 03:44:40 -0700 (PDT)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5119F3F62B;
	Mon,  8 Jun 2026 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780915485; bh=juw9Ecq+Ww23l+6wnG1pvcFHirYf/iwxehFssvlnUdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ZbUSTprRbmLSSuS0uttVUtUZT1SZGqlPF2Y1AJTGlssi1yrePrnT91uQPg9rboXe7
	 45v42GoGP2eDO5ROWq0TVav7o6lTwQpYu1/nBkn8UE5A4bkU2hQJ/sx04XCS9qd+U8
	 Djwqt7cmcqB4NjkEEdAAiuZdzPLE8o9+am24Wizg=
From: Jia He <justin.he@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH 0/1] KVM: arm64: Make kvm_s2_fault_pin_pfn() fault-in interruptible
Date: Mon,  8 Jun 2026 10:43:35 +0000
Message-Id: <20260608104336.2405384-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_034449_534025_AD57F1D8 
X-CRM114-Status: GOOD (  11.55  )
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

Hi,

I hit this while looking at long vCPU hung-task stalls with nested
virtualization enabled.

The vCPU was blocked in the fault-in path on a userspace folio which was
under migration:

  __kvm_faultin_pfn()
    -> get_user_pages_unlocked()
      -> do_swap_page()              /* PTE is a migration entry */
        -> migration_entry_wait()
           set_current_state(TASK_UNINTERRUPTIBLE);
           io_schedule();            /* no timeout */

At this point the vCPU cannot observe a pending signal. If userspace is
trying to tear down the VM, the vCPU thread can still remain stuck until
migration finishes and the folio lock is released.

Nested virtualization makes this much easier to hit. The migration path
can hold the folio lock while the MMU notifier runs kvm_nested_s2_unmap(),
and that can be expensive today since it may walk all active shadow
stage-2s. So the long delay is really caused by the unmap/migration side;
the vCPU is just waiting for it to finish.

This patch does not try to make that unmap path cheaper. That is a
separate issue, and range-aware shadow stage-2 unmap work, such as
Wei-Lin Chang's "KVM: arm64: nv: Avoid full shadow s2 unmap" series,
is aimed at that problem.

What this patch does is narrower: use FOLL_INTERRUPTIBLE when faulting in
the userspace page for the arm64 stage-2 fault path. If the vCPU thread
has a pending signal, GUP can return and KVM can leave KVM_RUN through the
normal KVM_EXIT_INTR path. If there is no pending signal, the behaviour is
unchanged.

Jia He (1):
  KVM: arm64: Make kvm_s2_fault_pin_pfn() fault-in interruptible

 arch/arm64/kvm/mmu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.34.1


