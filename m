Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08244CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/+5d6Iee2Wnc2t8RkTdT9sHxMC62Ecd6fmVxlQHbEE=; b=TDainDT9GV1yNqoZRqfKq6cMh8
	HbxpZBKiChOq2jUsJDGHrD6GPkbCmn1hRGyyNAYY0PqIxvnlUq16b2zadBP5hcXodyXHfhwK4LpWM
	lj1c1Iru4QU4WbGfo/RvrcOiYl6Wv+zC+qzFnbA+pk1OTps3C14wRqL6pMzNM0Y/OOiv7gdqEBXGJ
	6x9zysnwHbw4IMA0a6PdKJFoMbMNJ89JAWcHW2dS3cZU14cuNhsZOelw4a8AdpOKyy3c84FU+iGhm
	7FIh70r2rLoMXf1FIC980WaMZ9ElOGJ27J35wMvnsIBesYLGrnJJoPVTs65pvVajtPgwkjNcI1zSH
	X7+5z/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9UK-00000002eUD-1srS;
	Wed, 13 May 2026 13:19:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Tq-00000002drV-31ke
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:18:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C79FC1E2F;
	Wed, 13 May 2026 06:18:24 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68CCF3F836;
	Wed, 13 May 2026 06:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678310; bh=L2CeU8vxIxbtmaEZc3t55CUNGK5e4FMZDRDaVix4sq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tnCIj/2xwLblTM/Ij6JP9/NL7go962aQhxYY1e8MYBkOeaWsKN3edKqiQ2c8pzj2e
	 oxVyFhNXWDFF+VKeq4hZhchmXM3W/yQQqDYQOjEcjVq/t4OQT8r9AAI3bnfb3RuC2x
	 etf55nU10Xtsi0yOxBtPxbV65yPId1IykH57WaQc=
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
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 02/44] kvm: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
Date: Wed, 13 May 2026 14:17:10 +0100
Message-ID: <20260513131757.116630-3-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061830_864077_F593D080 
X-CRM114-Status: GOOD (  12.05  )
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

To avoid future include cycles, drop the linux/kvm_host.h include in
kvm_pgtable.h and include two _types.h headers for the types that are
actually used. Additionally provide a forward declaration for struct
kvm_s2_mmu as it's only used as a pointer in this file.

Both pgtable.c and kvm_pkvm.h relied on the indirect inclusion of
kvm_host.h, so make that explicit.

Signed-off-by: Steven Price <steven.price@arm.com>
---
New patch in v13
---
 arch/arm64/include/asm/kvm_pgtable.h | 5 ++++-
 arch/arm64/include/asm/kvm_pkvm.h    | 2 +-
 arch/arm64/kvm/hyp/pgtable.c         | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..e4770ce2ccf6 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -8,9 +8,12 @@
 #define __ARM64_KVM_PGTABLE_H__
 
 #include <linux/bits.h>
-#include <linux/kvm_host.h>
+#include <linux/kvm_types.h>
+#include <linux/rbtree_types.h>
 #include <linux/types.h>
 
+struct kvm_s2_mmu;
+
 #define KVM_PGTABLE_FIRST_LEVEL		-1
 #define KVM_PGTABLE_LAST_LEVEL		3
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 2954b311128c..1bc6a6a34ec9 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -9,7 +9,7 @@
 #include <linux/arm_ffa.h>
 #include <linux/memblock.h>
 #include <linux/scatterlist.h>
-#include <asm/kvm_host.h>
+#include <linux/kvm_host.h>
 #include <asm/kvm_pgtable.h>
 
 /* Maximum number of VMs that can co-exist under pKVM. */
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 0c1defa5fb0f..0bcd6f06aafb 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/kvm_host.h>
 #include <asm/kvm_pgtable.h>
 #include <asm/stage2_pgtable.h>
 
-- 
2.43.0


