Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F3510ED67C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36AvUlNtgK0T7U0U4oZfdexMOsAgghtB3DUynVUApCo=; b=LOIuo7L8bir0KcdjaFYv0YWgjg
	y/XfqT4V4RFYA5El7V8CAqAhyB6XilGyUDFMPDGZiRxerZKBt3VGyJ/HnwqbzbaPmzc7V5cD2wyGe
	wsf5Y35Ex+VLRpfGLBu4RGW6fy1Las/YC9nWOSQ+vHxMbh7DdhnHRxkd5JAG9vPGd8APhyEPf1an+
	7AlrRh0wnFhlkueJhiv1dPRefKBBUk3RpsAKLof+MK4K08F0q3FXI7yYG+cx6FqLG0VGNBybN/72i
	3i/Vll5OFzjZGN/wWTmZHEhZe+BdFZxt2f2AhkydDc6JdTEAum3YtTkJK6Zx+VG5SQzxejp3cxdP7
	rpiomCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67mz-00000007Xil-2lSv;
	Fri, 27 Mar 2026 14:03:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67ly-00000007Wyr-0VzL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B2B142A48;
	Fri, 27 Mar 2026 14:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5122C19423;
	Fri, 27 Mar 2026 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620169;
	bh=Lt5f4dcoCx+8QH+YtzLO7DvbDoIX+GF3jrrIPRh/lk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TybQmRMghihEsVjuRnCaUj4SMLLRoPsxWCyHL4I8WvcneUizNAotgG1BYgUt4thj/
	 Cm4fi1HILYK9vULdPIkCsvE144v6JsVRxox6r/NyZl/gzeGDU7RSrrvHt0QxA/bq36
	 qehm/uKn7W2VN3FlzOTQVz+rqELrxxGMrnmQGi/h7EDaUc0pKycm2cwwUHQqOXmJj4
	 uG0DX7sh/Fe2XJWBwHCj7++1pe1mas3gTtZTvT938LCRMzQ19+xjq3Dtx2LmsWECns
	 slvP82aPFq5R/jtAn2hLVPCx38a1p5Tlm1JNF+75rACa7WLMx1nnP9tE1yFQK+RC5G
	 XggexcdUoFbdA==
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
Subject: [PATCH v4 36/38] KVM: arm64: Extend pKVM page ownership selftests to cover guest hvcs
Date: Fri, 27 Mar 2026 14:00:35 +0000
Message-ID: <20260327140039.21228-37-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070250_297234_0F499BAA 
X-CRM114-Status: UNSURE (   7.91  )
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

Now that the guest can share and unshare memory with the host using
hypercalls, extend the pKVM page ownership selftest to exercise these
new transitions.

Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 05a5b145e303..0921efb8a16f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1812,11 +1812,41 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
+	selftest_state.host = PKVM_PAGE_SHARED_BORROWED;
+	selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
+	assert_transition_res(0,	__pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(-EPERM,	__pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+
+	selftest_state.host = PKVM_NOPAGE;
+	selftest_state.guest[0] = PKVM_PAGE_OWNED;
+	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[0] = PKVM_POISON;
 	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
-- 
2.53.0.1018.g2bb0e51243-goog


