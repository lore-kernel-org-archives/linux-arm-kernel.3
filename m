Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A326C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzBk8z0DOusDgNSHogcnLfhfdXdnsKjnjoN5hWalnyc=; b=c/dIQbIXJrL8+sHHpOhOx/w0Z9
	h4vD6Eb0S4UvJ7Lppxx9eP9U8fnSKa72BITpMSkU3adp5P+zCGM8aoKFuMO2+xwUwOVzSadQ5U4Gr
	5rih2T/zIn9Azy+ufALQMij1qOA3DGQVU2fT3DH7/XoyOWJCMPtio5NB2c+otg09gNSB+wDu+VbVE
	sNwEp9Q+1VYWCYYQnRtAVtKGx4uSM9Gfw81Ka3lqndM+ykyoyk2QwvIAhZkOcrI3Pa7MWbywGc/xF
	Qwsfqsq3jTdRUi6B5mnsZVUVRI+mlo0Bv8OitvLGst1YgAwozskgZn4b6rGJhZ9zK7FtOD3ApKadh
	e0QhriAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lx6-0000000BWb1-40dS;
	Thu, 24 Sep 2026 16:05:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lx3-0000000BWYn-2NkP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:05:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96A5A152B;
	Thu, 24 Sep 2026 09:05:32 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A4283F86C;
	Thu, 24 Sep 2026 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265936; bh=vhmzYOeEMeS1gUmiyRsM5hDk21KN/XfVddfQo5gUwVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IfVjZlGFBFOo82R0dy/xaHAJ4Chh0qKIT4MXPi0AxpjOEm8iOEjQ/OEZYDpjfhQ0X
	 exElgaxlLeOdxP54t9qkAyR3+clfAHFUeVzzYgr2AIp6eIhBgIgv5Adp/YpD/iemMe
	 tF6mtCDuBUt5pkR50SnjJ+IkUQoGNgHVYaEjewrg=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v20 04/22] KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
Date: Thu, 24 Sep 2026 17:04:46 +0100
Message-ID: <20260924160504.853911-5-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924160504.853911-1-suzuki.poulose@arm.com>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090537_722753_10428961 
X-CRM114-Status: GOOD (  11.52  )
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

From: Steven Price <steven.price@arm.com>

To avoid future include cycles, drop the linux/kvm_host.h include in
kvm_pgtable.h and include the lightweight headers required for the types
and inline helpers used there. Additionally provide a forward
declaration for struct kvm_s2_mmu as it's only used as a pointer in this
file.

Both pgtable.c and kvm_pkvm.h relied on the indirect inclusion of
kvm_host.h, so make that explicit.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v19:
 - Include asm/memory.h, asm/page.h , linux/bitfield.h in asm/kvm_pgtable.h - Sashiko
---
 arch/arm64/include/asm/kvm_pgtable.h | 10 +++++++++-
 arch/arm64/include/asm/kvm_pkvm.h    |  2 +-
 arch/arm64/kvm/hyp/pgtable.c         |  1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb6..a211a5d87bf96 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -7,10 +7,18 @@
 #ifndef __ARM64_KVM_PGTABLE_H__
 #define __ARM64_KVM_PGTABLE_H__
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
-#include <linux/kvm_host.h>
+#include <linux/kvm_types.h>
+#include <linux/rbtree_types.h>
+#include <linux/rcupdate.h>
 #include <linux/types.h>
 
+#include <asm/memory.h>
+#include <asm/page.h>
+
+struct kvm_s2_mmu;
+
 #define KVM_PGTABLE_FIRST_LEVEL		-1
 #define KVM_PGTABLE_LAST_LEVEL		3
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index beea00e693a0a..54a618d887fa4 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -7,9 +7,9 @@
 #define __ARM64_KVM_PKVM_H__
 
 #include <linux/arm_ffa.h>
+#include <linux/kvm_host.h>
 #include <linux/memblock.h>
 #include <linux/scatterlist.h>
-#include <asm/kvm_host.h>
 #include <asm/kvm_pgtable.h>
 
 /* Maximum number of VMs that can co-exist under pKVM. */
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd3..f48253b9d88b5 100644
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


