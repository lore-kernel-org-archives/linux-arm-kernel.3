Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB74EC79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMqAAXcPG1mQTje6JqFUoPl6OEEoTvW7nL5aPgWzuos=; b=K+bcgZ6qRcvVtb8p7FDN/Fw6Ci
	6VWjIf9+0M3gaxfs8KEvVExHGnSM1CLQkFi/MUSt8XGWSJMhiNvqc8unkcZdSX+7HFeCBnolqGTWb
	K+htoj+xN3ZOxV4Jed6zJ+2lL4yoyeHzDXwmmRPqA2GwbQQnxyo11NaKzIYAYxahbW1tLhNa0IcTD
	h2sVIO5KzEKMIG8XuaGM1FTmi1fjn0Fmskd7cWz5BX81DnuEezsbCKpDhlWU6y+Z2vyr6HQ84VBq7
	IMg3qWGM9EWH8aAujrTTPiac3wXb9bc+Z1p6DM2781lcntJBEjA0FpFlPHee+gzuaycwq6BpEgp1K
	pDMNU8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrn-0000000BfBu-2Hpw;
	Mon, 05 Jan 2026 15:51:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrc-0000000BezH-0f5L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 600E843C92;
	Mon,  5 Jan 2026 15:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4D5C116D0;
	Mon,  5 Jan 2026 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628283;
	bh=/V5dGEakqoFT9LVTg+cj6j+kFWdHnlUpnUyXyuEtntQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dGk7c90z2HommBZ2GTtxwIiEvCqia1sAHQVDMnraEGn2/pVFpZkNVqvaDIS42nCa/
	 XkLb8DM/pfgjjTRIo3drvDOErvtMe+eK19kEiScMZuJM6iCYHRCy0rO5aTxkZVClkN
	 V7snS/mz9qTABKI2Rb3cwqDxxcKayNK1GA8OQa/5QtC5mS9OgZyC47qNJnr6RhnYP+
	 gciKe9O1gxvBJ7t5nV+AV0VTL2OPiUC2VZ2zdhx9TSEJ/FGDjhTXtYIGFgCqJp+0+e
	 yEUFDQ275AAzZG81tK2FWlYR4+vFtac7X58uv/eflfxd0kMRCW3k8Pbv7ssUwoEnAE
	 0QkaPJv6mlO8Q==
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
Subject: [PATCH 30/30] KVM: arm64: Extend pKVM page ownership selftests to cover forced reclaim
Date: Mon,  5 Jan 2026 15:49:38 +0000
Message-ID: <20260105154939.11041-31-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075124_476009_CA4A023A 
X-CRM114-Status: UNSURE (   9.20  )
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

Extend the pKVM page ownership selftests to forcefully reclaim a donated
page and check that it cannot be re-donated at the same IPA.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f59f5e24ddda..5a1bac31e253 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1776,8 +1776,20 @@ void pkvm_ownership_selftest(void *base)
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
2.52.0.351.gbe84eed79e-goog


