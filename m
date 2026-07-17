Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF6C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI1v8eeCBLFTdJ/DMxS17nabZVLaO47wNFZpGWZf8b4=; b=p258kPhUFDDG1bmm5KBGHowxFy
	rXSm2Dkx2J8qb1Cq/Fiqb4pi53WXw2qdoV7lR5kGV2moFAlQu4pDp7eSGuHAI+qKD8Xrdq4SMe8hf
	F6hcJgIHjZXHsL1X567/V3OMuYVWHWarHSFYc1MwHAYEIROrAsqPdlnY7SOh64DAUrIsVsvh4+DUF
	7OLvTfAYI0X/dFCPl3ClcCQ6Qx9ppXk71QGxQYYTbbdULJIiTyHTgCgOaKuAOIxMywBuj7lHvNgi4
	HrBl6d7YJgSUvXqGyqjj1OotDK/yNv3MlDH5qaRYha+fy4v6vAFxryrOvGIwTpnULDuTxtc2vthRF
	lIgxJ6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEi-00000002Lmn-2gKP;
	Fri, 17 Jul 2026 13:04:16 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEc-00000002Lj5-0uv2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:04:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784293447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CI1v8eeCBLFTdJ/DMxS17nabZVLaO47wNFZpGWZf8b4=;
	b=vqChw9zcOPNplCIkodaAthFKhF9/qHUGIO8HHLx9F8lVMbcLi5gYPYL/7We5a26SbrUd9h
	qAD/apqCdmgb68x8+zjhhYHf2IA+T/cKcQv/4eXY6msQu4tBdxb8n0OLSvgtVZUBeLurIJ
	PMoBYcZ8Qpet0gmuNcGgEz7kh/BL75Q=
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
Subject: [PATCH v5 4/7] KVM: arm64: Skip pKVM stage-2 flush when FWB is enabled
Date: Fri, 17 Jul 2026 14:03:14 +0100
Message-Id: <20260717130317.1953574-5-fuad.tabba@linux.dev>
In-Reply-To: <20260717130317.1953574-1-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_060410_404759_0D644E15 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

pkvm_pgtable_stage2_flush() cleans the D-cache for every mapping in the
range even on hardware with stage-2 Force Write-Back, where FWB keeps
guest memory coherent to the PoC and the maintenance is unnecessary. The
generic kvm_pgtable_stage2_flush() returns early in that case, but the
pKVM MMU does not, so it needlessly cleans the whole range on, e.g.,
every set/way trap.

Return early when FWB is enabled, matching the generic walker.

Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index f70c601dcf4c..ba6570e37545 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -518,6 +518,10 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	struct pkvm_mapping *mapping;
 
 	lockdep_assert_held(&kvm->mmu_lock);
+
+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
+		return 0;
+
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
 		if (!mapping->nc)
 			__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
-- 
2.39.5


