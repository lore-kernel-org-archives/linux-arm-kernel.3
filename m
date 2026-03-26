Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48C310A88E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnUmysIete5pgW0Hw1Ixbqd9G1Po2E2or06S8YwFu1U=; b=dAZvdy7vfnakSIftiIJGphv5e8
	YBoulBhLsCFB1/Pf/4M/3Tfcm8tIN+Nq0eXKUhEZvuh6NMyvO1BlpQRKvQQ7ERZ7OBLP4QjaKT8sL
	Xjg8NcBsxP2+gt4cofcR7u2gDjiTfI+yS2ZLCmbx7jbb5YRVE+gli7/7YXaQekxfTMBFNJowBoxxo
	RO7RLFqJZbTeML0+KOflXHaR5X8+o7YBeWoM9xoLD6u3zJtNSDlttf90JdC00CHioF/JW7p6ZFnzf
	IcSWMtl9+OMU3fjrub6z7WOKRSAQInKGqGzl1PNptlT8crRdboxc3rbaKMKT0XoyBaLQyukyqHpjZ
	32aQf7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkR-00000005lHo-32OK;
	Thu, 26 Mar 2026 15:35:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkG-00000005l5j-1Mlj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7672C445AE;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55088C19424;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539338;
	bh=JkhDOiUWj8vJwfdrAJzWW8C4iPkVzQFcygk2ZWMvfzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mgZaSN/D3i21HE/R0OV41wRZ9N8suMZwjsMhw7A6VQPkpUHpN1sP9iK/BioDcH5qH
	 hCjPRA5Y1sauETiJXMUqho9oKlHX2Pcz5ic5WX+LLT+ta5YocbRhXK26LFU76lfLpQ
	 FXu3ZoDCD4eSQZIeMFAuVA1uV1WAgp1poTF/VM3oIsAtHE6N+D9V7mN6KeesyCtWtn
	 VP8jNY+NjDqacafWKzIlfYSEvI+JSY3W3szUJ6fV7QMuNlnCBov8WpQnApiRiucUnf
	 X4BNIftej2qVzgd8iVPblGrA7voiN86N12O8FyhRbwsGYpzUfBSYWPWFdTpIyMZCYQ
	 ZRm0FJ6cqstuw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkC-000000060II-2XLE;
	Thu, 26 Mar 2026 15:35:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 11/15] KVM: arm64: Kill arch_timer_context::direct field
Date: Thu, 26 Mar 2026 15:35:26 +0000
Message-ID: <20260326153530.3981879-12-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083540_524288_2AF1F7E8 
X-CRM114-Status: GOOD (  17.36  )
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

The newly introduced arch_timer_context::direct field is a bit pointless,
as it is always set on timers that are... err... direct, while
we already have a way to get to that by doing a get_map() operation.

Additionally, this field is:

- only set when get_map() is called

- never cleared

and the single point where it is actually checked doesn't call get_map()
at all.

At this stage, it is probably better to just kill it, and rely on
get_map() to give us the correct information.

Fixes: 9491c63b6cd7b ("KVM: arm64: gic-v5: Enlighten arch timer for GICv5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c  | 15 +++++++++------
 include/kvm/arm_arch_timer.h |  3 ---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 67b989671b410..37279f8748695 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -183,10 +183,6 @@ void get_timer_map(struct kvm_vcpu *vcpu, struct timer_map *map)
 		map->emul_ptimer = vcpu_ptimer(vcpu);
 	}
 
-	map->direct_vtimer->direct = true;
-	if (map->direct_ptimer)
-		map->direct_ptimer->direct = true;
-
 	trace_kvm_get_timer_map(vcpu->vcpu_id, map);
 }
 
@@ -462,8 +458,15 @@ static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
 		return;
 
 	/* Skip injecting on GICv5 for directly injected (DVI'd) timers */
-	if (vgic_is_v5(vcpu->kvm) && timer_ctx->direct)
-		return;
+	if (vgic_is_v5(vcpu->kvm)) {
+		struct timer_map map;
+
+		get_timer_map(vcpu, &map);
+
+		if (map.direct_ptimer == timer_ctx ||
+		    map.direct_vtimer == timer_ctx)
+			return;
+	}
 
 	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
 			    timer_irq(timer_ctx),
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index a7754e0a2ef41..bf8cc9589bd09 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -76,9 +76,6 @@ struct arch_timer_context {
 
 	/* Duplicated state from arch_timer.c for convenience */
 	u32				host_timer_irq;
-
-	/* Is this a direct timer? */
-	bool				direct;
 };
 
 struct timer_map {
-- 
2.47.3


