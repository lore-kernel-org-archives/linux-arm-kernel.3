Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117D6D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUvaD/a8anfJZItTYwmyLI/CkuocMV/FORUPB1iCvhM=; b=K4rhTjtpa6HiqaZ6QDmp5gn9o2
	m98FKNlGGB58W0GFdWMXhQx47VOBD+F/GsheBm7mR7OHLfjElFyyxa9/wb1PcTwuKrvJzhsUWDuSz
	jSBw4VJ3Z528rDUU+LKvBYXJCLPmxw/P1BL5ctSeYYzTV/9b8DgO78C8+hUQ2l8VwZG2FPEaIhB5r
	blwXl8kOuCBUU6DjvFlmTgkIIsIbBQ9eEpuarZOYI/U4D/n4eXjJQxnlxGbb0m6xN+FaE5HzSs9q3
	59G5hSMz74dS4zPHRsoN3QRNcqFsKpQ8x5qjE/HXpgfmozcKAckhR0/QVlg8EahRzwzt9Ry9P5oy7
	xUJQ3Efw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeD-00000009O14-1c8M;
	Fri, 23 Jan 2026 19:16:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeB-00000009Nzd-2vpW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D6CD43F58;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C401C2BC87;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769195803;
	bh=rWK31wXn61TDUD7Wh3d8yDUdkv93mnDeLCM+19FrlMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3Wlyr8zdvb4Y2xc/QUWy0FbX7bSfuTlvEChqSuOX9pl5QWMMzljoMQ/vzsL/rFf2
	 /USIm0vKh8X0iauC61PMJx+CCGbl5jA1qGfCsyrXNL/VWUCwY4ILhWuYboPVqdv3Do
	 gvpRgFoYOKojlBxoUgnXES+BVvVK5B+maTDen1KOoOi/Hk47RKVLavUUxH6YLCVDsq
	 TePstyoA7gku2dmiF9oxsuqQlVi2z44fZc5D3lBdnaM3rtw7CR6skM9z59DqgwS1VJ
	 FKE+gobeuKFLZcLVtjbkIoa5KN7+oadOeLkaCds96MlgH6MjYtDIs0EHqK9nT/QDeN
	 J52i0nmG57gjA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vjMe9-00000005A2V-09CR;
	Fri, 23 Jan 2026 19:16:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v2 2/5] KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
Date: Fri, 23 Jan 2026 19:16:34 +0000
Message-ID: <20260123191637.715429-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123191637.715429-1-maz@kernel.org>
References: <20260123191637.715429-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_111643_778168_BEBBA84A 
X-CRM114-Status: GOOD (  12.60  )
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

Plumb the MT_S2{,_FWB}_AS_S1 memory types into the KVM_S2_MEMATTR()
macro with a new KVM_PGTABLE_S2_AS_S1 flag.

Nobody selects it yet.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h |  2 ++
 arch/arm64/kvm/hyp/pgtable.c         | 14 +++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index fc02de43c68dd..9ce51a637da0a 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -232,10 +232,12 @@ struct kvm_pgtable_mm_ops {
  * @KVM_PGTABLE_S2_NOFWB:	Don't enforce Normal-WB even if the CPUs have
  *				ARM64_HAS_STAGE2_FWB.
  * @KVM_PGTABLE_S2_IDMAP:	Only use identity mappings.
+ * @KVM_PGTABLE_S2_AS_S1:	Final memory attributes are that of Stage-1.
  */
 enum kvm_pgtable_stage2_flags {
 	KVM_PGTABLE_S2_NOFWB			= BIT(0),
 	KVM_PGTABLE_S2_IDMAP			= BIT(1),
+	KVM_PGTABLE_S2_AS_S1			= BIT(2),
 };
 
 /**
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 947ac1a951a5b..c52a24c15ff28 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -659,7 +659,19 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 	}
 }
 
-#define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
+#define KVM_S2_MEMATTR(pgt, attr)					\
+	({								\
+		kvm_pte_t __attr;					\
+									\
+		if ((pgt)->flags & KVM_PGTABLE_S2_AS_S1)		\
+			__attr = PAGE_S2_MEMATTR(AS_S1,			\
+						 stage2_has_fwb(pgt));	\
+		else							\
+			__attr = PAGE_S2_MEMATTR(attr,			\
+						 stage2_has_fwb(pgt));	\
+									\
+		__attr;							\
+	})
 
 static int stage2_set_xn_attr(enum kvm_pgtable_prot prot, kvm_pte_t *attr)
 {
-- 
2.47.3


