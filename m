Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB9C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySUALm4kAiEtFHHbP93/9gqyCVQ7SC9yKGUHGHBoiHU=; b=zTDUl4KpyjW/H6TSuRvhyb9R0j
	7kTsTHdiC3bSKS1F0miOOqD96tpUHz/6cLU1Lj45VbXiJMhVOxUhh3Op1J2UIVcFUf9XcIj3GBwMW
	bRtlXSOaiwBK4WMacVZ0gKKdXD/pY7b0L7CvyPmSC+sCLcxmkBz2Ue4HsHd62RrQI6ZPxsbdJxBk7
	DG0rY3itK/ovivGEH/HOvD65O/jXHqwK2uKT3ky5A9RNb0qP+RtchkrkXBWC9yz89Q4D/cB4EC+Sy
	wJKby6+3+rrOEno3MfjyS/JOsn7GzhR9Z2kuHn6T/HuTtbLwA12nDG2obUEREobIfrY6qZqldRVfe
	CbYTv8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Je-0000000ABqG-3CyQ;
	Wed, 16 Apr 2025 16:08:46 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54fB-0000000A4SO-0mUF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:26:58 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5e5c5ea184dso6420855a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817215; x=1745422015; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySUALm4kAiEtFHHbP93/9gqyCVQ7SC9yKGUHGHBoiHU=;
        b=LQ8ffLigo5Fr/BD7u/P6fQ96LN6/aLsNCPBCo5PAuHuDq3vpTP5axsOwm92Wg46CY1
         bzr2Cj9EB1835Afz1aEyGNRqUdwfs5jZif0/XvDEnVe07Y7S1D6gSbqpq+lgGas8G/fg
         +MXmc259nSWg4h1hp9zPtvDX8t2ifIdBSaE5h2edJHx11vKoZlQo1TxzQgwCjhs4nQ6D
         3p5LUEAUYKIKxu5Rf26pHO9Ac+pdhoSNmhGjDoIi1Vj2QsHR00XAgDWdVq3ZChAwN+vf
         cogx5oHvOjrepEDjhuRurbuM42JUaOwCIt7hFL/UqHEBKp5zXEmUzEa64aYXPqLkPL6j
         MNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817215; x=1745422015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySUALm4kAiEtFHHbP93/9gqyCVQ7SC9yKGUHGHBoiHU=;
        b=NUXMFtc/CjNRmmGWJvmhpIDZaQAWI5IjZQLAhiFIjlR5GS4mGETUN4De+trTgNrbO5
         cfEykrFXN/6K6c8igDdHbzhrtivV5A0/oUwbN4GwbSSVhSQ2WXo2d0cNhvu7TESuZqHd
         RIuj4yVfD4B4vWiIPj1dtspP6CW9fy4FYSC+md9KbJJfepXEFgwEKR7dvkmYMXdYK6+U
         i/HEh8ngohKK9aZX+C5jqECkWQaEo3DKATlTfGc0jVg60ULtsvpUkkRWV34CIrAuy8/n
         4Ht5NEA3L5Ln4cL5aenDW9jbweq9tFgGi3cvCTlL6lDTNdG7MctdrSHvcMC1/N7Sx7/e
         CMLA==
X-Forwarded-Encrypted: i=1; AJvYcCUKeU6QhN86QVEbCl7AQAs14UQkp8ZGCVoWSnhtEH7sCGcEXo9GshjB8Di5ZtilaqOIvaPbD6URzd3ZcRIu+xkP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3rpI+Yn6RwK72osGshq/7VHgyAm1ch+PZ9uImwbDpmE+puQvd
	hA+M9puh1DAq8VV6oLgSkmigYqhUoX9kI1N83hBei+/n4/WaPZKtKDhniwNKdI87ejwuggvj44/
	GK818Lw==
X-Google-Smtp-Source: AGHT+IFO6LqLQpchltIVKkcVMTkkcoAUlzOcNnFkY+QSrpAdIOkv/ajoQQVC0VjwY0/SmeO3qq2XvFKzCmMO
X-Received: from edb17.prod.google.com ([2002:a05:6402:2391:b0:5f4:b71f:15a6])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:26c8:b0:5f4:c619:2392
 with SMTP id 4fb4d7f45d1cf-5f4c6192660mr959365a12.1.1744817215420; Wed, 16
 Apr 2025 08:26:55 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:42 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-3-qperret@google.com>
Subject: [PATCH v2 2/7] KVM: arm64: Fix pKVM page-tracking comments
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_082657_240537_0A5E4308 
X-CRM114-Status: GOOD (  16.31  )
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

Most of the comments relating to pKVM page-tracking in nvhe/memory.h are
now either slightly outdated or outright wrong. Fix the comments.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 29 ++++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index 34233d586060..178028172c0b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -8,20 +8,29 @@
 #include <linux/types.h>
 
 /*
- * Bits 0-1 are reserved to track the memory ownership state of each page:
- *   00: The page is owned exclusively by the page-table owner.
- *   01: The page is owned by the page-table owner, but is shared
- *       with another entity.
- *   10: The page is shared with, but not owned by the page-table owner.
- *   11: Reserved for future use (lending).
+ * Bits 0-1 are used to encode the memory ownership state of each page from the
+ * point of view of a pKVM "component" (host, hyp, guest, ... see enum
+ * pkvm_component_id):
+ *   00: The page is owned and exclusively accessible by the component;
+ *   01: The page is owned and accessible by the component, but is also
+ *       accessible by another component;
+ *   10: The page is accessible but not owned by the component;
+ * The storage of this state depends on the component: either in the
+ * hyp_vmemmap for the host state or in PTE software bits for the hypervisor
+ * and guests.
  */
 enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
 	PKVM_PAGE_SHARED_OWNED		= BIT(0),
 	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
-	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
-
-	/* Meta-states which aren't encoded directly in the PTE's SW bits */
+	__PKVM_PAGE_RESERVED            = BIT(0) | BIT(1),
+
+	/*
+	 * 'Meta-states' are not stored directly in PTE SW bits for hyp and
+	 * guest states, but inferred from the context (e.g. invalid PTE
+	 * entries). For the host, meta-states are stored directly in the
+	 * struct hyp_page.
+	 */
 	PKVM_NOPAGE			= BIT(2),
 };
 #define PKVM_PAGE_META_STATES_MASK	(~__PKVM_PAGE_RESERVED)
@@ -44,7 +53,7 @@ struct hyp_page {
 	u16 refcount;
 	u8 order;
 
-	/* Host (non-meta) state. Guarded by the host stage-2 lock. */
+	/* Host state. Guarded by the host stage-2 lock. */
 	enum pkvm_page_state host_state : 8;
 
 	u32 host_share_guest_count;
-- 
2.49.0.604.gff1f9ca942-goog


