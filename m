Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCA8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asRIaEd/4xjJYIGtw3zuzx+gj7hp/R5cp2IcFUGc0Jo=; b=RjQAo5nm8wqcNVO9FbEDY7FPLj
	U/WVm3aWPyK1HyUcY7mqQL3X5/XR2AuQmugY6LfK1nTdROsfZbUVFrl4CX35spumT6gWFbvZTdlrB
	uwQ7DhjD0Gb3UcU72ePjpAaOC7AHHdAL+idqXDlSXKQxgpjLDcGU+0xx2z2hDNEO9bQoCQn6Y2AvY
	eQuB1PYwm7tTSDBHqwVkD0zjOnKMaFw7wqgOFZfPQgZGyXxlAv0QAuZ1kN3cn7VVQVx/+vYS5BWN+
	tU/it7BuEuuH6B/DV0dNaUlGI/QNw4z2yfibKMuCsfdnp5DsMwCxkAn8CFztX3NrUXPkSLUl9kGT5
	Jdp7JCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenqr-00000000iUQ-3F88;
	Wed, 01 Jul 2026 05:51:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenqq-00000000iTY-41ss
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:51:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67D45600AB;
	Wed,  1 Jul 2026 05:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433C51F00A3A;
	Wed,  1 Jul 2026 05:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782885072;
	bh=asRIaEd/4xjJYIGtw3zuzx+gj7hp/R5cp2IcFUGc0Jo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j4osoUj9I8yeii54T3u3pBSNp8p9xiEhJWUw3aaBdBJT0G/KufvfaIpGGv8COfiNl
	 ymf6HwNOY9rr6N3Q9VVv0uuYIjwtuZiy5HxDZIPXrr0ivNbH2ZQ8+utRxN5aZcVpGE
	 aafd+DyNMFr6D3SoIqr9ms23CveKGidlx02FYfgZl7AcHEDGIttSU+r0L2ZB4WNlWO
	 IAt9UZ79529koYkCHM59leWoNs0Ragyb1uQoZv9Qooeh7QsS68CQ5ETEmTl35TjmzN
	 kBNX3L/kq3Xv6KEue8F/nWRtBjGoDTQk15zoZxtBwCtNQPOGuDbz+VofKpt3UsKxND
	 +K1R8FtJVezmw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org
Subject: [PATCH v7 08/22] coco: arm64: s390: powerpc: Mark secure guests with CC_ATTR_GUEST_MEM_ENCRYPT
Date: Wed,  1 Jul 2026 11:19:12 +0530
Message-ID: <20260701054926.825925-9-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701054926.825925-1-aneesh.kumar@kernel.org>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

arm64 Realms, powerpc secure guests and s390 protected virtualization
guests currently report CC_ATTR_MEM_ENCRYPT, but not
CC_ATTR_GUEST_MEM_ENCRYPT.

These environments are all secure guest configurations. Their
force_dma_unencrypted() implementations also treat the same secure guest
state as requiring unencrypted DMA. Report CC_ATTR_GUEST_MEM_ENCRYPT for
the same condition so generic confidential-computing code can distinguish
guest memory encryption from host memory encryption instead of relying only
on CC_ATTR_MEM_ENCRYPT.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/kernel/rsi.c                      | 1 +
 arch/powerpc/platforms/pseries/cc_platform.c | 1 +
 arch/s390/mm/init.c                          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 92160f2e57ff..207e36db1e7a 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -27,6 +27,7 @@ bool cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_MEM_ENCRYPT:
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
 		return is_realm_world();
 	default:
 		return false;
diff --git a/arch/powerpc/platforms/pseries/cc_platform.c b/arch/powerpc/platforms/pseries/cc_platform.c
index e8021af83a19..46e110a5a717 100644
--- a/arch/powerpc/platforms/pseries/cc_platform.c
+++ b/arch/powerpc/platforms/pseries/cc_platform.c
@@ -17,6 +17,7 @@ bool cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_MEM_ENCRYPT:
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
 		return is_secure_guest();
 
 	default:
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index c29326c44af0..6b1c5a4fa9ce 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -148,6 +148,7 @@ bool cc_platform_has(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_MEM_ENCRYPT:
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
 		return is_prot_virt_guest();
 
 	default:
-- 
2.43.0


