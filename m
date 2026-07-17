Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A971C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t62BgL8MjPLp/vMP9DZbVtXwp29HVKeCqzhIx8Pz0Y8=; b=Fd2xZJgQZwhL1/vD+uGvEUIgKi
	gXSwx0COfro/ATTAk7APWnoH+ha6UrmTvcyVlxI1kgUfAZirjgN7+rs7kuTizIgx1stDz41iz+a/t
	gTBZ5VmMrV9t/3E6MXFnUAh4Gw5bPa+esykBdDA/ABuvnvEdxTtZy/eQyX//yDRtDWIQyo6CsXBvA
	ngeLpb1bqTxYsTVRm2mhZltKSdWNqw9E5QZWhLJEZY8XujK7TjkhZnk98IFpV+F2qPN1/TNbJ+1qD
	DIN6QgtvHsqGijzOsUmycZw18qyOJQfnsPv4DyHOhJuGT0sn3JKGPsDuhRPl6pgPIA9qNoo3LU1vE
	9FH/nQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEi-00000002Ln2-3JzW;
	Fri, 17 Jul 2026 13:04:16 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEe-00000002LkD-15Wy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:04:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784293449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t62BgL8MjPLp/vMP9DZbVtXwp29HVKeCqzhIx8Pz0Y8=;
	b=OdKlhYzO5z90QIvAtZFzdTuaTThgKal3zbR5ENagrtMDYVyYo2JEhmsSEYG61sVy6mDvmo
	Z0okoOfILrcrBo0mAl6Q3WfUGSPkrvRhx9xRaDkeTjOQoJJt86SMhyH2k0Szb1qdZIWXTy
	64WfrqN30uGScUnE1fiVvhfe/YokMHY=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Dev Jain <dev.jain@arm.com>,
	Bradley Morgan <include@grrlz.net>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] KVM: arm64: Don't WARN on pKVM stage-2 map failures
Date: Fri, 17 Jul 2026 14:03:15 +0100
Message-Id: <20260717130317.1953574-6-fuad.tabba@linux.dev>
In-Reply-To: <20260717130317.1953574-1-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_060412_439692_82DBBE5A 
X-CRM114-Status: GOOD (  10.70  )
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

pkvm_pgtable_stage2_map() wraps the __pkvm_host_share_guest() and
__pkvm_host_donate_guest() return in WARN_ON(), but those hypercalls
fail for reasons that are not EL1 invariant violations: -EINVAL for a
pfn that is not memblock RAM (check_range_allowed_memory() rejects a
device page mapped into a non-protected guest) and -ENOMEM under
memcache pressure. Both are reachable from a guest fault, so the WARN
splats on host input.

Return the error without warning. The unshare and write-protect WARNs
stay, since a failure there does signal a broken EL1 invariant.

Fixes: 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index ba6570e37545..1212a2c5613d 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -466,7 +466,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 					size / PAGE_SIZE, prot);
 	}
 
-	if (WARN_ON(ret))
+	if (ret)
 		return ret;
 
 	swap(mapping, cache->mapping);
-- 
2.39.5


