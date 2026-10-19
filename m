Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEEFCCF2DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqlZmIFYpFJ7sMwft3bXitWK6GFw2x/CJJAS4J6nfGc=; b=yweEOGrPQNWxbiXGm3kcrG9O97
	EFpXlLo1VKX4f0g+JqgKsQhg/NjaFSTyiKD/IueJsrMkxGnsFKuCjBos1maRGeXOZXKeSCY38mT4u
	UQb4uMuLNqAqB6vd2Z9yg5sf4/cfQrzFMCKoydBiVCBM9suFicKtPyIEqID9+TWzifvWFiXOjza2T
	sSP933CpelxuDeO4ev0+y3PX9oZ6KqrHTi6DDKnQXujR6H7JkrwotRZhE51xckS4h+Og2asq+/yGv
	Iqq/GeKvBh73nP1psbO9ac7cxJDZpy3O3V/ExYRKO8pPFDcbQLT6LrPa9T3pN9If9e3wOq+RUNmEi
	n//vDI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInIs-00000007UwE-0pbU;
	Mon, 19 Oct 2026 13:21:26 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInIo-00000007UuP-3tcP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:21:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uakg/74zoXwi1Kx44nvRA0V20527TnJNQegACr4zriI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792416080; v=1; x=1793020880;
 b=Ud4Y+iT8DMSfP3LR7ccR+3xIBw1LKp85jWg9o3FHQ8cxKYWCviH6zqigN1nwjNdxxz4ohmf1
 AKIt0WHKUtpiUC3G6lMbbgm0HC7vQ7o+vvEhn+ECvuiAbBJ/VEqd/hL8uqjcm1veXXn4MOr+vSx
 a47kI+czACXm3mYUgJC5znzI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b0f93a7c611f8a5d;
	Mon, 19 Oct 2026 13:21:20 +0000
X-Mizu-Trace-ID: b0f93a7c611f8a5d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] KVM: arm64: Sanitise MTE tags when a permission fault installs a mapping
Date: Mon, 19 Oct 2026 14:21:03 +0100
Message-ID: <20261019132103.3836646-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019132103.3836646-1-fuad.tabba@linux.dev>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_062123_118278_15BF1BD7 
X-CRM114-Status: GOOD (  14.13  )
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

The stage-2 fault path sanitises MTE tags only on translation faults, as
a permission fault normally just relaxes an existing leaf. However, when
the page is backed by a THP, a permission fault at page granule installs
a block whose other pages may never have been mapped or sanitised. Once
dirty logging is off, a guest write to a page mapped read-only during
logging installs the block, and the guest can read the tags those pages'
previous owners left.

Sanitise whenever the fault path calls kvm_pgtable_stage2_map() rather
than relaxing permissions. If the VMM replaces the VMA after the guest
takes a permission fault but before vma_lookup(), that path would map
and sanitise memory from the new VMA without checking it. Run the
VM_MTE_ALLOWED check in kvm_s2_fault_compute_prot() on permission
faults too.

Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 48a08b608ea72..208fcae80f67f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2005,7 +2005,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	if (s2fd->nested)
 		*prot = adjust_nested_exec_perms(kvm, s2fd->nested, *prot);
 
-	if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
+	if (!s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
 		if (!s2vi->mte_allowed)
 			return -EFAULT;
@@ -2060,7 +2060,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		}
 	}
 
-	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
+	if (mapping_size != perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
 		sanitise_mte_tags(kvm, pfn, mapping_size);
 
 	/*
-- 
2.47.3


