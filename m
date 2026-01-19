Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993A1CCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tG2tbwvXoCZNYOOUFlBlhS6ihOyFKxVFh3nuuXiKJmU=; b=4x7rWyTWmdZHFUQ0Q1I31HS+4+
	UAf9BTE7lP9eFZWxO47RTswXRF/gzq9WnMTzxSYRdi594oNU0Dn8r40PJLCFaGO+eEvrRxQHSUXze
	fYmLyl8AHh9DWFfG4OXPmIQ5wB6pT7S84f/XXG7npuksox89dLP894+kRoz9ISrayvt2mOggJ/mrO
	YDZax5TkLGkJjHjXNeTIYm7dsSFUygfmEtn5YI01Nnjhl42QZZyQfiHs1Hozvza93/tYAHnOlpKeE
	W7azCiud2AH/kr84cJtsGB6xAsxSWWyC80lqNnPCsLr1Uul2jkityP7dd9PG6nkUcRSlMK+ddl7z+
	iK6J74sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmwQ-00000001pXf-1y63;
	Mon, 19 Jan 2026 10:57:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmwM-00000001pUJ-3ETE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD57444421;
	Mon, 19 Jan 2026 10:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C23C19424;
	Mon, 19 Jan 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820217;
	bh=uTXpYO5WtXclYdggoann9HiinQtNq2ANggCc1hfRfek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IwsATEUp/4Lvgj/M1nAevcyTnGN18Kcx878AvV6kkj8rKrRmCTfiJqizx21mVFM8A
	 zQVR5QGIZSVrwpYNUKpE82eCdzFDxLvWl8YCIs+ukHArSxCfJ1YG/YjMyWXBGJvNYg
	 DsaKVFunRHdvkghInB8lp9iZdAigCJe8yI/oxaNtby5MNItaNdP6161qy/iXE55S05
	 EaWVI/SjlguW12PLgnlM1kJIHuC2dz1nrvoAE9XUKLOfcrKSD0AQdaES07uWQJmV/7
	 otUDVgAyREspLQvu1yqjOCq45M3BWwMy3PtvRj8ONaJ2tx1hedeDnodWGDJ67chd0S
	 B76A+j/b5m5rQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vhmwJ-00000003YVK-1gB3;
	Mon, 19 Jan 2026 10:56:55 +0000
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
Subject: [PATCH 3/6] KVM: arm64: Make stage2_pte_cacheable() return false when S2_AS_S1 is set
Date: Mon, 19 Jan 2026 10:56:48 +0000
Message-ID: <20260119105651.255693-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119105651.255693-1-maz@kernel.org>
References: <20260119105651.255693-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_025658_835130_1A5797E3 
X-CRM114-Status: GOOD (  13.94  )
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

We cannot tell from the S2 attributes whether what we map is memory
or not when S2_AS_S1 is set, and issuing a CMO on device memory may
not be the best idea.

In this particular case, pretend that the mapping isn't cacheable.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/pgtable.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 3c5f399b1b986..07561a227f75e 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -911,6 +911,14 @@ static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
 static bool stage2_pte_cacheable(struct kvm_pgtable *pgt, kvm_pte_t pte)
 {
 	u64 memattr = pte & KVM_PTE_LEAF_ATTR_LO_S2_MEMATTR;
+
+	/*
+	 * With S2_AS_S1, we have no idea whether the OA is actual memory or
+	 * a device. Don't even try a CMO on that.
+	 */
+	if (pgt->flags & KVM_PGTABLE_S2_AS_S1)
+		return false;
+
 	return kvm_pte_valid(pte) && memattr == KVM_S2_MEMATTR(pgt, NORMAL);
 }
 
-- 
2.47.3


