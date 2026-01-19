Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A751CCF2FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owReMfd7fUHGoY7wGCtA7Sg0DGWt3iNxaocNGZdM+eo=; b=Msod6sgh3fTHmTTz6M+xw1CKeP
	IBF5XOiFwlxv9BatJZGRDLgKE6cfp2lEEYYnQIRi5uiMGrBferNr3TUSa99A+TrzJmu4TA1IQVFK3
	SCAw7AsREOjYJuwjAcGljYLw23EJivh0y9AlOvaQ/VFyeg4e6M1gVoE6cZyei9XeWvFMwbApSduAs
	C7QD5RSRxfMjQs54P5QAI3dbBWZbC4XLkRtswg7r0YK+JVvJxTb8dcJqkZIsxvJXDOP2WLvQt/Ko9
	KX3HeUlPrzUkl4hqXZPA37wf0sbID0qSyZyeXTwQMz0WgGPFu20gAtNFA+S2H4vTqlBez7zKRw50C
	TLsfIBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhohW-0000000256F-2b4P;
	Mon, 19 Jan 2026 12:49:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhogQ-000000024Es-2ukt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A7406016C;
	Mon, 19 Jan 2026 12:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44187C116C6;
	Mon, 19 Jan 2026 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826917;
	bh=kQcy7tZbHLnHu83JmogDffTHHwCWfmsWUHO+FmDCzzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HMXFTSprX7EZ9/BSDIk0pC4Bcr/3BG+tyJIXFYB1oOSidh4y8JnJwUlQjEpjRLGtu
	 yOlQuzGCntTVei76DuTyBba5NFp5z23b1PgbmKkPFdXDGm1B/Goj1xzwSJ34mL+VP9
	 8S1kiZ11+2pddF6G3oYeyjA76W5McY5m31bK/3WWzy0Xdx1ROdUkBGWzLGETT3vklG
	 vuGxHiKYUPmNlzOnJdx91/zG2sLLh4gFZs/1s1T/1+6w5Nu/DD53+rknaHhEQ2W0ct
	 flmytL71DDZYT2HD2fKzWO4indfWP9NXUs2rpbhkckLwOdNUjKKyU8TX1z+McHRJsG
	 Iliq52SXeTr7w==
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
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 34/35] KVM: arm64: Extend pKVM page ownership selftests to cover forced reclaim
Date: Mon, 19 Jan 2026 12:46:27 +0000
Message-ID: <20260119124629.2563-35-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Extend the pKVM page ownership selftests to forcefully reclaim a donated
page and check that it cannot be re-donated at the same IPA.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f36f81f75fdf..a7d880701933 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1821,8 +1821,20 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
-	selftest_state.guest[0] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_reclaim_page_guest, gfn, vm);
+	selftest_state.guest[0] = PKVM_POISON;
+	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
+
+	selftest_state.host = PKVM_NOPAGE;
+	selftest_state.guest[1] = PKVM_PAGE_OWNED;
+	assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
+
+	selftest_state.host = PKVM_PAGE_OWNED;
+	selftest_state.guest[1] = PKVM_NOPAGE;
+	assert_transition_res(0,	__pkvm_host_reclaim_page_guest, gfn + 1, vm);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, vcpu);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
-- 
2.52.0.457.g6b5491de43-goog


