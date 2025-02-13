Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE22C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXz0i4QahAOiqhjyUijiq7EoIzddg7Mdn+xd3933h/c=; b=gJI4DEX9TGOR6sKQmnGs5rPTLn
	QI5AWpalRo37dHHkk1V9unDCOyJktDY0v2WKLU7+0DnexUKmYvjS+Yw+Tm+8+YDv/tptfdWgKOU2j
	hl2V0VMYfRzkr4B1zGf2L7yo7gkpiz31L8kjUXW1cO9e4o4rvTMHKcCduBS+JhmVTT0aXkZgdYf6j
	hyOYaTVVGv+RzUxN7NDkfKLbo0XBhHxtnTuxGaUT8iG/5xY7Oc51dCcm5X0gY4BVW/B2l2vPU7A+M
	ogx97akgvaxxY0h2pDESr0Zli2ZydUeesYj04jtpE/LI/mHLZGHeH2p2JYIhbkaI4wjznQRSowwhE
	Z+AbwUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidAY-0000000C2ci-1Tjl;
	Thu, 13 Feb 2025 17:38:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibup-0000000BjMf-3naX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:18:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC2226BA;
	Thu, 13 Feb 2025 08:18:31 -0800 (PST)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.32.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 180C73F6A8;
	Thu, 13 Feb 2025 08:18:06 -0800 (PST)
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
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: [PATCH v7 45/45] WIP: Enable support for PAGE_SIZE>4k
Date: Thu, 13 Feb 2025 16:14:25 +0000
Message-ID: <20250213161426.102987-46-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213161426.102987-1-steven.price@arm.com>
References: <20250213161426.102987-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_081815_987744_975E2E3D 
X-CRM114-Status: GOOD (  11.35  )
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

We now support host page sizes greater than 4k. For this to work
reliably the guest must be enlightened enough to make sharing requests
at a granule at least as big as the host. Which today means the guests
PAGE_SIZE must be equal or greater than the host.

Note that RTT tables are still allocated using the host's page size, so
most of the page will be wasted as only the first 4k are actually
delegated to the RMM. This is the main reason why this is still WIP - I
haven't yet implemented an appropriate allocator for this.

Large page sizes are also only very minimally tested, so expect bugs!

Signed-off-by: Steven Price <steven.price@arm.com>
---
New patch for v7
---
 arch/arm64/kvm/rme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
index a3eddf6917ad..4ae348ee9376 100644
--- a/arch/arm64/kvm/rme.c
+++ b/arch/arm64/kvm/rme.c
@@ -144,6 +144,7 @@ static int find_map_level(struct realm *realm,
 	return level;
 }
 
+/* FIXME: This conflates pages and granules */
 static phys_addr_t alloc_delegated_granule(struct kvm_mmu_memory_cache *mc)
 {
 	phys_addr_t phys = PHYS_ADDR_MAX;
@@ -171,6 +172,7 @@ static phys_addr_t alloc_delegated_granule(struct kvm_mmu_memory_cache *mc)
 	return phys;
 }
 
+/* FIXME: This conflates pages and granules */
 static void free_delegated_granule(phys_addr_t phys)
 {
 	if (WARN_ON(rmi_granule_undelegate(phys))) {
@@ -1694,10 +1696,6 @@ int kvm_init_realm_vm(struct kvm *kvm)
 
 void kvm_init_rme(void)
 {
-	if (PAGE_SIZE != SZ_4K)
-		/* Only 4k page size on the host is supported */
-		return;
-
 	if (rmi_check_version())
 		/* Continue without realm support */
 		return;
-- 
2.43.0


