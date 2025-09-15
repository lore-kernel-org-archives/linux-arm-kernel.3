Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D28BCAC59C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MNC4u8tn+v2bXaK0M82WDEyMk7lFacWgKo3YnugEi0=; b=yexqu3+UOyERY/yzHk7CZ1lQQp
	8B7uASyieX3zhsYVFYhKtvyZc4xRoQ1rMMc1II57ek/OInPGG3uWiKQN6DkS4lvJsFWHlHq2bXxDZ
	Cw+CyAhREuiyFt89QwVptppVZ25DPUuOMj9m2d0graKDHDo4KByLZ6A4MqI4qpuuB9Vuas/zP+ioo
	JoV6zfabyMoHXwX/hfI0BTjzHKFo0Qtt+zBU7p2v4BW8d7Dus3FEiOgi28WSER3ISUdlRMfoC9Law
	iR1oxuNlB8Vt6LDQIC3yRWgFzi2GiDZ2vhgDOuA2lhiz/HMSI6333zbepsmplN57mb5Ac7xaFy0ns
	SkJAvrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7e2-00000003xvX-2nHS;
	Mon, 15 Sep 2025 11:45:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dj-00000003xeM-0QKZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74D246021F;
	Mon, 15 Sep 2025 11:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214F8C4CEFB;
	Mon, 15 Sep 2025 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936698;
	bh=fJ3VtTH//ia4F0gvgRNZ5Yn1DvuD73TXLhC3+A2vWzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QbjCcx7+pwb99RPy0mY+rzKaVVubUTmks4kfxcbAhJoxSA6U/1IqatL+56lZl5zWR
	 WBfcfmz3GcDm3dPy6XffaRKCOUF5KnsVC3+VDdD2MF1moX9sHqkDALOoC+Uw4vCd0M
	 r2seEO2xbxftqO0s8QgZuQ2tLWc389D0v1lN8WDypwDBbhjCyoTzpG1Lgc9xT1P0lW
	 xvnzskW+PzamIC6RMx/Oh49v0ooeJwfBRITqFA6deKT0pDe3XuWF5jLBReISvsvd3A
	 BOc1Z2m0hP/BqmxP4WifBrlPHHCchEZFx1ZxfZ92Lgv1EKTAp5JSwsNWUvOiDYDj8S
	 1NbVpi1a5NTsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7dg-00000006MDw-1GD1;
	Mon, 15 Sep 2025 11:44:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 07/16] KVM: arm64: Populate PAR_EL1 with 52bit addresses
Date: Mon, 15 Sep 2025 12:44:42 +0100
Message-Id: <20250915114451.660351-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Expand the output address populated in PAR_EL1 to 52bit addresses.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 952c02c57d7dd..1c2f7719b6cbb 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -844,7 +844,7 @@ static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	} else if (wr->level == S1_MMU_DISABLED) {
 		/* MMU off or HCR_EL2.DC == 1 */
 		par  = SYS_PAR_EL1_NSE;
-		par |= wr->pa & GENMASK_ULL(47, 12);
+		par |= wr->pa & GENMASK_ULL(52, 12);
 
 		if (wi->regime == TR_EL10 &&
 		    (__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_DC)) {
@@ -877,7 +877,7 @@ static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			mair = MEMATTR(NC, NC);
 
 		par |= FIELD_PREP(SYS_PAR_EL1_ATTR, mair);
-		par |= wr->pa & GENMASK_ULL(47, 12);
+		par |= wr->pa & GENMASK_ULL(52, 12);
 
 		sh = compute_s1_sh(wi, wr, mair);
 		par |= FIELD_PREP(SYS_PAR_EL1_SH, sh);
-- 
2.39.2


