Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1390F10ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7sXBfwyQInOkkJ4D8pFFmhgMz4At6ShywffA7v3WS4=; b=AN/ZwyAX/ulKpz9xQBRoC8rS1t
	grqGhf3gb2Cbu+xdAeQSKelTgg22+3j12I5IBT0zBtP7IerCCtMuAov0GvIOBGN19lR+MbgjQHlXv
	etcdZF/KGbupic83kfvU582fLz74loBJTFn1KR3SPFDySdvxhD+XDOQWp5Z18LNQ84mXJyDJZRKyM
	AyvqNZmjMYWA6is51MSBrIeNsJZSOlejzreBgt+ZJUkN3M67KxXgukiRAGfUlolCW/FCBDXytL3FM
	MuAIllk4+1sNVoYDrzW9DUvRSffUF0lT3F+xLz9V2LyvbUF64x5MWFUuafG84IBuEy6kidLhVpDLD
	oB3dswuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ua-00000007FFp-3pxw;
	Fri, 27 Mar 2026 11:36:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UI-00000007F1N-2esq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07FBE6188A;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0F8C4AF09;
	Fri, 27 Mar 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611385;
	bh=bC61XAT5f24Q6uazjH9bN98/WFRDLM2026JAuAM3igY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JtDpr2sGrjnJwuQv/ncDHqG/JmX6w6XhZD+NyTZZwPBBvNTmewkgYupcdvZWqWeeY
	 ZqnJSPFwaG+m7h+K1k+MUIsLvaigAozHSbXSZBqOV7WpZA/zGVmkNmwrcwmcv0f1JU
	 vwZkhvBg5QfA8UGnhTrmlFZL5iaKH5HtfWI/wWSILK+pEqKbD+2H9ElBP71lZLd0jM
	 3bgiQEpfwpiRJlNAIGyoS8qGGc+lU9uTQbIK+G9vLzsgnwxklJfjy46xc/z5hR/y2a
	 eXkyvq0q6gCwquU1KoJ8Gx8jTAEwoM46f1d27Y7BnxjgxxY51aMIbLECT65fh9+Fv/
	 lM1woZE1fEZew==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UF-00000006K4a-3GCB;
	Fri, 27 Mar 2026 11:36:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 07/30] KVM: arm64: Simplify nested VMA shift calculation
Date: Fri, 27 Mar 2026 11:35:55 +0000
Message-ID: <20260327113618.4051534-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
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

From: Fuad Tabba <tabba@google.com>

In the kvm_s2_resolve_vma_size() helper, the local variable vma_pagesize
is calculated from vma_shift, only to be used to bound the vma_pagesize
by max_map_size and subsequently convert it back to a shift via __ffs().

Because vma_pagesize and max_map_size are both powers of two, we can
simplify the logic by omitting vma_pagesize entirely and bounding the
vma_shift directly using the shift of max_map_size. This achieves the
same result while keeping the size-to-shift conversion out of the helper
logic.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 164f1160ea33d..5572b127f8663 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1646,7 +1646,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
 				     bool *force_pte, phys_addr_t *ipa)
 {
 	short vma_shift;
-	long vma_pagesize;
 
 	if (*force_pte)
 		vma_shift = PAGE_SHIFT;
@@ -1677,8 +1676,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
 		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
 	}
 
-	vma_pagesize = 1UL << vma_shift;
-
 	if (nested) {
 		unsigned long max_map_size;
 
@@ -1703,8 +1700,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
 			max_map_size = PAGE_SIZE;
 
 		*force_pte = (max_map_size == PAGE_SIZE);
-		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
-		vma_shift = __ffs(vma_pagesize);
+		vma_shift = min_t(short, vma_shift, __ffs(max_map_size));
 	}
 
 	return vma_shift;
-- 
2.47.3


