Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495B6C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 04:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jp+CLm+182YvIt4B09+/Rre5LjSBYKWjXMYkkY1eENo=; b=AKphHiSSahn/bCYyn4WKGvUfuk
	+EIJuGey+slWeJTDfdbpESqOdXJGg4+BTf8cljyqzvnf/fNfJaUUUiUIvaCwrR9gIV6CyRKDEiMwt
	EZnm8+86VhqFxRZtktVQ84r+y1hmClj6DP5Gb8oa57jjPMP7QJcXW/g9w+DkGM7Y9DVYM3KFILn5T
	0OhZ0UOao8I92l+vBpoCcPl0WE0uRcPamiZaVJhWkboravM/1iKpx1XD3wPKxkvkQVjFv8VJXbY9o
	SLN3pDN3d/aqtcaZDulXQM2pR3/Z51nQyY2NOMi90njRdbdKLMKkXQvxbUjUWrx7lVoUepWVs76ZE
	0uOBshgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trrOo-00000004bEK-0dri;
	Tue, 11 Mar 2025 04:39:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trrN9-00000004bA0-1kq6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 04:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741667860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jp+CLm+182YvIt4B09+/Rre5LjSBYKWjXMYkkY1eENo=;
	b=PDjUHzEqNXwg7wbSvPj3uSVQ24muV0dD4PNRPITlUUATSGTgP1tdl0TS+vrOzQkXiStywn
	55bwQty5Spq3xPbXjaM9Ble3/lLq0y2u3pKVLXYUYiVOXnhuy6H2rAfLZ3osxiNedshpgC
	dDckZ+fLij6yvz7sgvh345RXEx7pxUg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-rppQY3LgOnyGAPoEZaPR1A-1; Tue,
 11 Mar 2025 00:37:36 -0400
X-MC-Unique: rppQY3LgOnyGAPoEZaPR1A-1
X-Mimecast-MFC-AGG-ID: rppQY3LgOnyGAPoEZaPR1A_1741667855
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A74C5180035C;
	Tue, 11 Mar 2025 04:37:33 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.64.136.79])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4628C1956094;
	Tue, 11 Mar 2025 04:37:25 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	qperret@google.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shan.gavin@gmail.com
Subject: [PATCH] KVM: arm64: Drop sort_memblock_regions()
Date: Tue, 11 Mar 2025 14:37:18 +1000
Message-ID: <20250311043718.91004-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_213743_529853_1711DDFD 
X-CRM114-Status: GOOD (  11.15  )
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

Drop sort_memblock_regions() and avoid sorting the copied memory
regions to be ascending order on their base addresses, because the
source memory regions should have been sorted correctly when they
are added by memblock_add() or its variants.

This is generally reverting commit a14307f5310c ("KVM: arm64: Sort
the hypervisor memblocks"). No functional changes intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/kvm/pkvm.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 930b677eb9b0..d9c9174f89a1 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -10,7 +10,6 @@
 #include <asm/kvm_mmu.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
-#include <linux/sort.h>
 
 #include <asm/kvm_pkvm.h>
 
@@ -24,23 +23,6 @@ static unsigned int *hyp_memblock_nr_ptr = &kvm_nvhe_sym(hyp_memblock_nr);
 phys_addr_t hyp_mem_base;
 phys_addr_t hyp_mem_size;
 
-static int cmp_hyp_memblock(const void *p1, const void *p2)
-{
-	const struct memblock_region *r1 = p1;
-	const struct memblock_region *r2 = p2;
-
-	return r1->base < r2->base ? -1 : (r1->base > r2->base);
-}
-
-static void __init sort_memblock_regions(void)
-{
-	sort(hyp_memory,
-	     *hyp_memblock_nr_ptr,
-	     sizeof(struct memblock_region),
-	     cmp_hyp_memblock,
-	     NULL);
-}
-
 static int __init register_memblock_regions(void)
 {
 	struct memblock_region *reg;
@@ -52,7 +34,6 @@ static int __init register_memblock_regions(void)
 		hyp_memory[*hyp_memblock_nr_ptr] = *reg;
 		(*hyp_memblock_nr_ptr)++;
 	}
-	sort_memblock_regions();
 
 	return 0;
 }
-- 
2.48.1


