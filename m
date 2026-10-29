Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4766606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XRJ743DF;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NV2zPwOw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S5U2Nx4uu0l5UY+vpx3TvB7FV+qMp+ahvwvUvYtuJ00=; b=XRJ743DFqsdfWq
	qdhVPRL9PHLnYTIWkLY43PAt5D/tyvGpzbdMam4wzdxnAavOcs/X3d5BmhT4bRzdXMz7rvyplNhyH
	IlLBmXJhWqqzj3KgA8aCfK9qn6SrcQxAOSd+OIMzPJ1G8V/rqEYj7irp4zorHEfQOdNooJkmaMNKw
	CyWJAEFwCtJCTvO75xcMpeAgskeV7TZWZoRIbOwd50hIfiSAGWWoRsgV94jxJYvVHwPNA/SUZZo+w
	VHgYisqiIgjKUurJ7p9ydzWb6Ez7M3j8CvoZ37pDuu/NphVr1VKlc1EAQq4lFEM2TT4Up3MofYowP
	UYEIE1XNwWrVb4oDdzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUJF-0000000A1TO-3Zw6;
	Thu, 29 Oct 2026 17:53:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUJ8-0000000A1RC-3CCX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:52:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5B6D169E;
	Thu, 29 Oct 2026 10:52:54 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E2693F59E;
	Thu, 29 Oct 2026 10:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793296377; bh=xrY9NPZLAByOeK2cryjztDk7I9iH/vElRi5/N8juw04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NV2zPwOwPWucx2y+IgN5JcV+z1JRay0Ov2VIsmtxTY03FiQHkZQqvAxIyIcL8iW6l
	 +RujiVAVn1IE7J1lE2FTIrozzsEEdzbVcPnQ3bcqiR1b9hiO6+Bo5XivlYaAJ9GqVN
	 8LiXkpR+86e+iXVe0B0BawRRkJlG1vBaLzR5psiI=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: arm64: Fix dirty logging detection in ring-only mode
Date: Thu, 29 Oct 2026 17:52:37 +0000
Message-ID: <20261029175238.3214788-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029175238.3214788-1-weilin.chang@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_105258_845230_851427E3 
X-CRM114-Status: GOOD (  11.52  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When checking whether a memslot has dirty logging enabled, the
KVM_MEM_LOG_DIRTY_PAGES flag is the source of truth. Previously in
memslot_is_logging() we were testing the dirty bitmap only and did not
consider dirty ring.

With the ring and no bitmap, a logged memslot can still get block
mappings, so guest writes to most of a block are never logged and a
migration can copy stale memory.

Fix this by using kvm_slot_dirty_track_enabled() instead which checks
KVM_MEM_LOG_DIRTY_PAGES, within memslot_is_logging().

Fixes: 9cb1096f8590 ("KVM: arm64: Enable ring-based dirty memory tracking")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 705f6d84770e..c7df646af79f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -176,7 +176,7 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 
 static bool memslot_is_logging(struct kvm_memory_slot *memslot)
 {
-	return memslot->dirty_bitmap && !(memslot->flags & KVM_MEM_READONLY);
+	return kvm_slot_dirty_track_enabled(memslot) && !(memslot->flags & KVM_MEM_READONLY);
 }
 
 static int pkvm_flush_remote_tlbs(struct kvm *kvm)
-- 
2.43.0


