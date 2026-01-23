Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD0CD778B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwAx5nuEH8XaXQiSpjDPXL9EBgyhOUhIYWFrUWZLo/w=; b=P6R3WCjfpB1EiqJwe9PnVydIk2
	f3ZquoeBoulrJkEzpa2jkYc/TOa3TLsbn8D1qQVeDSBuLzri8f6RocXdy/Q8GPJsPL4l6adwmCDIu
	Ib6qFhlzc9Ie1Md/wzeJXDyd0jSeKgO6GMStt+aYKjAe5tiDyanL2rq1LkfopjvVkFV0nzvenF8ix
	VvE5WoaUKFojVlbIWY69hqWRwQdaqY1i2hSkonC3Uh7g5g0ylJUDjv1OMMC4C/g4iU8oMpFLtRgYZ
	Y/8vNat7E3CcXNNY1sooHe1em8II3s4Ak2EjC0aLwR4kcGp6BfYjgA3Z0eaxl6GrWBX8GTV/BJPnZ
	SehGpxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeI-00000009O3l-479s;
	Fri, 23 Jan 2026 19:16:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeC-00000009O0M-0QDk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9E1F44347;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB28C4CEF1;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769195803;
	bh=9rLCNYcKbPurJNMKZwPicJGqVzWqMF0eXcse6bywNwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VF+4R3w4Rdp3BO9CrR+APcM3lKO2ZXFeBeQO76RWwdG4CT49Ur3US8AUt8In+CQF6
	 GUD2rbFb32917CjtCBEhs+SBp+al+g2QbXroaSdfUK2twtgWw5eB6okv078RNNIRmh
	 xIHlyDZS37W66NqCQfGj6xI0vsBmy1TJEx+/idAIp/ohWH0w8QqiG+2a4oGO6OGeKR
	 V76lCTdYodzvMli22K5DtMwTku37JgFm/IvICecB0z7p9o14MKritmZQWDjgygv4i/
	 GHdDm1vk9dhQi9xliWXw+8GnElH4CP1jy03QvirhL7rOMBJDkqqgC3nDDJLdaIcaff
	 bhk5XWxZwo6fA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vjMe9-00000005A2V-3DAj;
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
Subject: [PATCH v2 5/5] KVM: arm64: Simplify PAGE_S2_MEMATTR
Date: Fri, 23 Jan 2026 19:16:37 +0000
Message-ID: <20260123191637.715429-6-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260123_111644_177204_AABB202B 
X-CRM114-Status: GOOD (  11.79  )
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

Restore PAGE_S2_MEMATTR() to its former glory, keeping the use of
FWB as an implementation detail.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/pgtable-prot.h | 4 ++--
 arch/arm64/kvm/hyp/pgtable.c          | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 161e8660edddc..d27e8872fe3c8 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -109,10 +109,10 @@ static inline bool __pure lpa2_is_enabled(void)
 #define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL_EXEC)
 #define PAGE_KERNEL_EXEC_CONT	__pgprot(_PAGE_KERNEL_EXEC_CONT)
 
-#define PAGE_S2_MEMATTR(attr, has_fwb)					\
+#define PAGE_S2_MEMATTR(attr)						\
 	({								\
 		u64 __val;						\
-		if (has_fwb)						\
+		if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))		\
 			__val = PTE_S2_MEMATTR(MT_S2_FWB_ ## attr);	\
 		else							\
 			__val = PTE_S2_MEMATTR(MT_S2_ ## attr);		\
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 00e33a16494bd..a6f7533ce4974 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -653,13 +653,12 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 
 #define KVM_S2_MEMATTR(pgt, attr)					\
 	({								\
-		bool __fwb = cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);	\
 		kvm_pte_t __attr;					\
 									\
 		if ((pgt)->flags & KVM_PGTABLE_S2_AS_S1)		\
-			__attr = PAGE_S2_MEMATTR(AS_S1,	__fwb);		\
+			__attr = PAGE_S2_MEMATTR(AS_S1);		\
 		else							\
-			__attr = PAGE_S2_MEMATTR(attr, __fwb);		\
+			__attr = PAGE_S2_MEMATTR(attr);			\
 									\
 		__attr;							\
 	})
-- 
2.47.3


