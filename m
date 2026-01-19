Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9BDCCF2E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOYADXbKY32Uu+0LiEDVov47KyyI49Q12xS1vDKYsRA=; b=k9EalP3vDPK6YeDxOQXsokmYk0
	3Nmq1zGAwKxwZxeyE3dH0RdMW3aFH5Y/7hjO3gQTdD227C2j716Re9Oo9gG1zpvXD409nGa7zZJMm
	CcLp5ybY4r5rt+AQxg5vHUCzxj/U3sBRBaFRZE4XqOs7htdD1zoEWj1ZB7bQS0Eoq53frspsk+sHP
	OyewkojLEOZCNo6u33Jb8cnVASbdEzGE7+KzljDGiWnvRSzrsB4jRh+Bay2t/5Y9+gBIv9Qzj/pu0
	FIW90gf4iY+kAx0TbeK2+9uy4fRaQNRbBRX78Epy4x+RM2NNFx7N2lpGK5KEs2tULX8W/JtDppl6n
	ySWrZ/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmwP-00000001pX2-3gzA;
	Mon, 19 Jan 2026 10:57:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmwM-00000001pUQ-3BTH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35B7060142;
	Mon, 19 Jan 2026 10:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB52C19425;
	Mon, 19 Jan 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820217;
	bh=S+d7dcrSisjP88iOeAUf6TBHCdFaRU9DyBerjTFuYU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i6e4LrkNppSWjaM5xObnJIDmqO2vz3n+YS+yKTWV+mBhYAkcHBDninybuIp/FRXGl
	 i7dtf7Mwzag94AEkRCgn1fXRavyzNGjR/SZKTZ+pgnCIxpEBCFtcTSFnGrHzHLKA0g
	 qtF7wXKlq4UIdrOJCqper/TmXww0DyI5q9JnexC07rF0OZ7ZtOd3mQm6c11PThthfX
	 a4uU8pD4BxzxaAziwG0a2B3b5UGew9PxsYbEwVOvob8PgBClHX+yYx1qzVJDfNPO7m
	 SLJUyhJ0FR34MJnNTzuX2U3vSkUSF8cK6tTjOZ8HNX9FM5wuH++t/blrnZKgqM1Dle
	 PglhRaG7BBqdA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vhmwK-00000003YVK-0Iyd;
	Mon, 19 Jan 2026 10:56:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 6/6] KVM: arm64: Simplify PAGE_S2_MEMATTR
Date: Mon, 19 Jan 2026 10:56:51 +0000
Message-ID: <20260119105651.255693-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119105651.255693-1-maz@kernel.org>
References: <20260119105651.255693-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/pgtable-prot.h | 4 ++--
 arch/arm64/kvm/hyp/pgtable.c          | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

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
index 3c2f7967fdc03..34c9afa442932 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -660,11 +660,9 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 	({								\
 		kvm_pte_t __attr;					\
 		if((pgt)->flags & KVM_PGTABLE_S2_AS_S1)			\
-			__attr = PAGE_S2_MEMATTR(AS_S1,			\
-						 stage2_has_fwb());	\
+			__attr = PAGE_S2_MEMATTR(AS_S1);		\
 		else							\
-			__attr = PAGE_S2_MEMATTR(attr,			\
-						 stage2_has_fwb());	\
+			__attr = PAGE_S2_MEMATTR(attr);			\
 									\
 		__attr;							\
 	})
-- 
2.47.3


