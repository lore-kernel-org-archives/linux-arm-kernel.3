Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670FDCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khmUbZAVBAgMmhcF+lM/inT3vpF0mGfXglRvMdTMl0Y=; b=qIV+8ea9leBmWDQjmyb3NpP/Ve
	HWIpWWlCs36TKlilNwn0rkJ2TRfrYxVYg8ZJ0fa6EdLu+4EaYYbxNxrCSep7yBqRXbqGAC/PduHeL
	AyCIiwWTymkImfda8Av6LmnGU7YVbbipFkM7U/nH5g8bVZ0naEeeKWu9U8/iKFj9tZlFDMm2C3V3b
	UISWLA/7Z67KfSRif0N5bw1g15j+2+Mp8T2XRMqhe8FGP2qgYsxmlFnemFNnGx7WZfrxraGTF4FgG
	gBLoQPyGHujD20t/T1eBzzMAwJYbK5L7U0opZyhQNfMBhrFjZcdOvHI1t9pQF2D4XYCMNxAOyIVR9
	WgwUyiKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbr-0000000GZCm-3DXv;
	Wed, 27 Aug 2025 19:15:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIja-0000000G8nT-1KKS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13FA944A2D;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57CDC4CEEB;
	Wed, 27 Aug 2025 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311049;
	bh=gHppliEY0y6/P8OeBVVGz1thwVeXvKiBpmZt9uamRz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bIMx1wfH16+5WGE10JGaZXuJEj6afjd6aWOlULnrRciZOfwOB+bpe7tscNBG7+TL5
	 IpX4fXqVozziGe9bwY8q5VD72Pi9JdmJaHzl2I/6oDXC/GhP68zEsPd3YVDW4KkYy4
	 sZHsMajrHLIq5q/40waKOc9RtIIfCN0ly6t8ukOo4D7f5UiiAn8q/HfRay7bY5AlNY
	 42c4TivCfleSQj4nj0pJ5/PbNxsDOpuTxAKj82aFcfNbChtNzcuWCpBO2zrHVe2ff4
	 kZk8sphI2RmIBCqe3nS8Kot7NlosdiWQEYMUWHCZJ+VOCbmcxs3hDRqmk52JzajtiD
	 nLxT+2MaO5f9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjX-00000000yGc-3ox6;
	Wed, 27 Aug 2025 16:10:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 07/16] KVM: arm64: Populate PAR_EL1 with 52bit addresses
Date: Wed, 27 Aug 2025 17:10:29 +0100
Message-Id: <20250827161039.938958-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091050_377871_FB58E718 
X-CRM114-Status: GOOD (  11.60  )
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
index c684325b954d3..4d97a734e0f50 100644
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


