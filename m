Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7C6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnsZRNIB8hetqXSqNWPFijSOGEL9fFftMDBphMgGKT8=; b=T5LiPMFj/kw+N4kEk+HrFf/jII
	/LMSBeCAjmpmetWuRduiqXU/rqUCKT8L0Zsrt1ZnIzpR8Z/VRtUh59idvMOTzfgTrRSdYfhphReum
	lcppJZySOMB/2bj/dRR2KRpBFwUlE17Gcfv4r0qK9f+M9cbmzjsXjHhm8PB3GmJHTKGc9mKPe69+Q
	MlvEqiCJ7svdGv+Hi4vBQzv8BJfwbvBS52aBF1BShKD45053Vv2eI39qCX5CtI5Ped1rzLO3G4Jq5
	W4ROv/wMhraMsatH2oWF/H35xKziXXrPuelMgeGGuXk9p2dIHSInbXaV0mYPeVU8LEvAyj6yvgTL7
	OhEcoC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI925-00000004Cas-3z8K;
	Sun, 09 Nov 2025 17:16:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91l-00000004CAQ-0j1W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40A5C446A8;
	Sun,  9 Nov 2025 17:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B35CC19422;
	Sun,  9 Nov 2025 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708592;
	bh=kWoh0WbC/Y4kIFVS60fKkmQMxaj8UxkbJZiL9Sdz734=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s6eWqtNsy+YPOKsxhtkQNveZzZe8K+2RyAQ66AAYSNfEs8r26bBSku3afYqS3dvwL
	 csAlBHdaKKpvQect2RyGszB0Y31hn/IGK/5BFFDM50PAYkeGi4QQNi1VsPSu+yTDxg
	 pvhgzG6z/1XaOTfm/WMGOkItzh+Hmc6lGXqD2KY2nQFpysJTSEK/ZIaVG8WY39kuOV
	 6wXMCYqS+bA1r1Jyc8eYW1PqFP1Im5qiOmmkKF+5dAxl2UvZuzDaZ3uNOXThtudqlZ
	 gIDaU9LAlZVlHn/jC/kCLX53XsTVLguaUfHDfVFdqhyROx3ow6G0cD7iSqV8VjWe6x
	 s+hdb2KpleyMg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91i-00000003exw-1L5i;
	Sun, 09 Nov 2025 17:16:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 09/45] KVM: arm64: GICv3: Drop LPI active state when folding LRs
Date: Sun,  9 Nov 2025 17:15:43 +0000
Message-ID: <20251109171619.1507205-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091633_300611_337A0753 
X-CRM114-Status: GOOD (  13.26  )
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

Despite LPIs not having an active state, *virtual* LPIs do have
one, which gets cleared on EOI. So far, so good.

However, this leads to a small problem: when an active LPI is not
in the LRs, that EOImode==0 and that the guest EOIs it, EOIcount
doesn't get bumped up. Which means that in these condition, the
LPI would stay active forever.

Clearly, we can't have that. So if we spot an active LPI, we drop
that state. It's pretty pointless anyway, and only serves as a way
to trip SW over.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 58942abd2f4e7..3ede79e381513 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -72,7 +72,9 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 
 		raw_spin_lock(&irq->irq_lock);
 
-		/* Always preserve the active bit, note deactivation */
+		/* Always preserve the active bit for !LPIs, note deactivation */
+		if (irq->intid >= VGIC_MIN_LPI)
+			val &= ~ICH_LR_ACTIVE_BIT;
 		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
 
-- 
2.47.3


