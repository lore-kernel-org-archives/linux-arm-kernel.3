Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC8A10ED67C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6zb5pMqXsUxzgfMgRUFvHEkkKKRmYwiibXMKLvzHDY=; b=HusOSZzd1ufWEZdbF+zBwS8ekp
	NET6NTZGTgP7yQ68cupsp0P/+yX/pS6vYvGM3Z8VCC0QFI/gZZD5pjM54K9fKTgdSVXJcmV/yNnph
	QqTwJ7EssVOV1+VFL3yAQYp1sHmjlUbIRHOko5j6HGvMQwFBjWXiq0NKfiLh0xWsOFHhragLuBLVB
	cprXpdvbAWQBNET27oxD+NUJZSODwHVAstEfu4OEHxWATkJuy4nAqWDJ0LD04nl34bCdORs4UZSWk
	q8oz+xZEX2grB8oWN/8nXEOepP+xmwGAvvi7yO3OM5mvD//p3xW3fWt3Qdza7FFJRMqgA5Lf9KYvY
	08SfrkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67lZ-00000007WWg-1eWQ;
	Fri, 27 Mar 2026 14:02:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67l7-00000007WBx-1fo4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0967C41A54;
	Fri, 27 Mar 2026 14:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E30C19423;
	Fri, 27 Mar 2026 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620116;
	bh=7j8yBkqQI9cz054zxle+5jUI341HVt5dkS3HCJOIz8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JoGtmbwWDPYp8gMtlRWdRhatYc36K1f2e7ChAeTFigVTLUdCc+Lu9c8sJm+GuDcZ2
	 /gsI2jPsL+ecPOG8qj3LnB/movfydj5uX9PScwW/m0ngTFBR3FWHoNoQIIWnW+aM9e
	 9VZV9EUnYSdJSy8NLSGFCKWDQAJkvHjvVqDIY1fyy//nj8jUVpYseDR02w1CUdwOVe
	 h1Ad2/VIYPj05rfUk3mStRwdl3e6Kx89lhkpxtRmRtGKsZUIGEH9dxRzdx5rWRFiLe
	 GbKMe5eZ3ww2d9tQ2GVq3nVSidI8IEw70YBwjyNK2vgq4SoCAJTtsqzH0eSg3sqz5A
	 AOfJBiz3xyjeA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 20/38] KVM: arm64: Avoid pointless annotation when mapping host-owned pages
Date: Fri, 27 Mar 2026 14:00:19 +0000
Message-ID: <20260327140039.21228-21-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070157_509372_FD10AAB1 
X-CRM114-Status: GOOD (  12.41  )
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

When a page is transitioned to host ownership, we can eagerly map it
into the host stage-2 page-table rather than going via the convoluted
step of a faulting annotation to trigger the mapping.

Call host_stage2_idmap_locked() directly when transitioning a page to
be owned by the host.

Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 28 +++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 0e57dc1881e0..bf5102594fc8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -551,23 +551,27 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 {
-	int ret;
+	int ret = -EINVAL;
 
 	if (!range_is_memory(addr, addr + size))
 		return -EPERM;
 
-	ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
-			      addr, size, &host_s2_pool, owner_id);
-	if (ret)
-		return ret;
+	switch (owner_id) {
+	case PKVM_ID_HOST:
+		ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
+		if (!ret)
+			__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
+		break;
+	case PKVM_ID_GUEST:
+	case PKVM_ID_HYP:
+		ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
+				      addr, size, &host_s2_pool, owner_id);
+		if (!ret)
+			__host_update_page_state(addr, size, PKVM_NOPAGE);
+		break;
+	}
 
-	/* Don't forget to update the vmemmap tracking for the host */
-	if (owner_id == PKVM_ID_HOST)
-		__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
-	else
-		__host_update_page_state(addr, size, PKVM_NOPAGE);
-
-	return 0;
+	return ret;
 }
 
 static bool host_stage2_force_pte_cb(u64 addr, u64 end, enum kvm_pgtable_prot prot)
-- 
2.53.0.1018.g2bb0e51243-goog


