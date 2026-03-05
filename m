Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36956F33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgP/zWRUG4BpiiGDcd8G5nA6nglYNR7D1y2gM6shD+E=; b=nNgJpJnR8zGN9DSM8c7y3yK2gY
	2ISP/akb0+xjZ5tYOr3oAYvdZXLFbpBiAWuOhhdtvOS1SAAnabDfoVjG2Ygfl4QXpqc8Iyl6bFjFs
	NkTdwtXJazp0dj4MUsauhmE8ewH5YB04lfmabZmJmXW5e9LgyvFPf0t1bkxANmhiYG8EQNdUx7OQZ
	f8W7kqZ5pxXudpqRke3Jf9KH52nBFSRvwTCsGTEyuSmHfHoGhfaVcsIAlHlxqtm8FKJRBY6yOoM4i
	dQBTrwxmhxk2B2EOIclsbUp6nbSyd98wFUvbV8fLiSTuqphD7RNHT760ebrFcTCkiZq1U6A7cEI+V
	wwLROXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xq-0000000234r-3c7P;
	Thu, 05 Mar 2026 14:46:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xp-0000000232i-1knD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC36F61340;
	Thu,  5 Mar 2026 14:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28ACC2BC9E;
	Thu,  5 Mar 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721968;
	bh=SYRALiYS850xWg3rAEJIWtzEkjEK13L1b+03ZuBiGOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UpmF5Zy/daE6Nkfntxh7G+lAf6dZpU/vKMiAoDUmCu7QmcHumq/D/HXmz9JLy5oue
	 OnGSomm0TF5SEyLwx8fe+fx5GIwDNRBiLAhWcuDRorGNnpzgMk/Bej42JY05Vp7jii
	 6Miujf/FU1sCLs25UefzCrcdhXH7fB1W+1G8qrixwPWTcc2/4v9Dg3w+qZL+3QtOY+
	 igP/ijJA9om6WhOF1fklTKdRFGxfZKZOZKKMVTJsZKdV7vEypYPVkAOTdLy8oulI+G
	 vDTWeNT2kmnUjzZmABr0NK5iHzVC/I1sJBwbQQJuAdcS/fG8Bj/AObyO1HvbpbPzXi
	 NCZCP//3Lsr2Q==
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
Subject: [PATCH v3 34/36] KVM: arm64: Extend pKVM page ownership selftests to cover forced reclaim
Date: Thu,  5 Mar 2026 14:43:47 +0000
Message-ID: <20260305144351.17071-35-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
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
index 1f461a0e9a77..de224e4ffeeb 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1813,8 +1813,20 @@ void pkvm_ownership_selftest(void *base)
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
2.53.0.473.g4a7958ca14-goog


