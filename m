Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781A9D6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaqWkuf5TU+rnm8MN1gyWP/T6opSapPhTQ8IKmB/MJI=; b=IHoH9M5yFzLl7GrbSczv8j8twK
	PfmOav5wKSVK57u9d+ap4ZPNJItwpWnRGLsx8r4YpfHfd48q9S/sc81JQzWFsd0Sr1Kk6x/jGIVXw
	VzoCdFZUFkVQWnYQsE62IFtiyLsaE1cWpE9FO5qP+ZwD0wq31C7MdEvx8G6wMQYFfziZJstxVYhUb
	s7seUUBRXHny/eXy48DLjf74IbRaopcQpID9pvNBKW3upXbgc7ptGYKn2AkFlp2e7sp7RgRmMTdgW
	sSpFzBq/15xVricfFrYHy8fwMvks44AsiMWVsEHirnTo8+2mpAKFG0Oy2aPY1IF47JYX8/XQfFSzl
	YtOCPRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoYI-00000006YOr-3T92;
	Wed, 17 Dec 2025 10:14:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoY6-00000006Y2e-2XxO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:14:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01E4B1517;
	Wed, 17 Dec 2025 02:14:19 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38B123F73B;
	Wed, 17 Dec 2025 02:14:22 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v12 33/46] arm64: RMI: Always use 4k pages for realms
Date: Wed, 17 Dec 2025 10:11:10 +0000
Message-ID: <20251217101125.91098-34-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217101125.91098-1-steven.price@arm.com>
References: <20251217101125.91098-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021426_760490_E1E2BE88 
X-CRM114-Status: GOOD (  13.49  )
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

Guest_memfd doesn't yet natively support huge pages, and there are
currently difficulties for a VMM to manage huge pages efficiently so for
now always split up mappings to PTE (4k).

The two issues that need progressing before supporting huge pages for
realms are:

 1. guest_memfd needs to be able to allocate from an appropriate
    allocator which can provide huge pages.

 2. The VMM needs to be able to repurpose private memory for a shared
    mapping when the guest VM requests memory is transitioned. Because
    this can happen at a 4k granularity it isn't possible to
    free/reallocate while huge pages are in use. Allowing the VMM to
    mmap() the shared portion of a huge page would allow the huge page
    to be recreated when the memory is unshared and made protected again.

These two issues are not specific to realms and don't affect the realm
API, so for now just break everything down to 4k pages in the RMM
controlled stage 2. Future work can add huge page support without
changing the uAPI.

Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v7:
 * Rewritten commit message
---
 arch/arm64/kvm/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 860c42aabcf0..c30d7be27361 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1762,11 +1762,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	write_fault = kvm_is_write_fault(vcpu);
 
 	/*
-	 * Realms cannot map protected pages read-only
+	 * Realms cannot map protected pages read-only, also force PTE mappings
+	 * for Realms.
 	 * FIXME: It should be possible to map unprotected pages read-only
 	 */
-	if (vcpu_is_rec(vcpu))
+	if (vcpu_is_rec(vcpu)) {
 		write_fault = true;
+		force_pte = true;
+	}
 
 	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
 	VM_WARN_ON_ONCE(write_fault && exec_fault);
-- 
2.43.0


