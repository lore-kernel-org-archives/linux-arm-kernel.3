Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC99710A88E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZyrtGNHyZaah9DWMUKPedkFJn8z4FM/93HzagM0nS8=; b=p4BvupdZgFFlJg6BTpqEInQOkD
	amHxv3+findPczQnHMWqY+JvR47sl0LsDDgo7S7sHVo0XpqSibOd1AjSk7DAaigOCuzafzg3FpXzu
	yw+rUHNJgS76yMcR/a1eCI2WZoSyPNXaOdQXYTkA8/f9bqZyfNoFr9xYU0lq+A8enqPQiKzrWwf1g
	1RGkeFd1roXBHKeGeuWpyRNVO4SaeqsX5iSfTUPhu62i2xl4Wf4lXg+4dKKlA/SqaLmyUUJmNJ1kT
	HQc3TAl9P16KRUFCw0RfJM1PiLTXmW+lSoJtCkotg5ASEcnUUam6QD8KHeDRKbe0O1H6vzHFT/yGc
	HTwdAk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkO-00000005lBj-0bmC;
	Thu, 26 Mar 2026 15:35:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkG-00000005l5f-1R4R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B621B6011F;
	Thu, 26 Mar 2026 15:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5627BC2BCB1;
	Thu, 26 Mar 2026 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539339;
	bh=ySmf95sCaTpuq/j9vN9jvDmawClA6Um8zHS+321vTh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i3ogVYIjI+opMtjyUhFsPrwJY/E0Jo2tshdeGkkpkK9eAQXtBn5EiYlNetxQj4v/q
	 6bTbGiv5RyLCQvf6igSxJ/bceKmXpxjPuB61ffGCvsn8ZecE+cKIjHgEVsa4dmYElu
	 qPzLSZWPlJCGuGT8Dd80YTuGDXkcdUUSo/mEjrzhjwUbnz2o9AiQZhZhKys9WO/Jhs
	 oJOjD84zAUMvNgEHu5eUcSrxJgruHkC0e7G1yCzXtjn9J1tFrlglCeQHPEI9z+1zYo
	 RvTFu4YFZqIQx1Kio6JSraN/nlaShr5RJaZ9VViScaA83cKBGwp1GcklJGDhpvzj46
	 3VBJFoWtvU6bA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkD-000000060II-2FwC;
	Thu, 26 Mar 2026 15:35:37 +0000
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
Subject: [PATCH 15/15] KVM: arm64: Don't advertises GICv3 in ID_PFR1_EL1 if AArch32 isn't supported
Date: Thu, 26 Mar 2026 15:35:30 +0000
Message-ID: <20260326153530.3981879-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
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

Although the AArch32 ID regs are architecturally UNKNOWN when AArch32
isn't supported at any EL, KVM makes a point in making them RAZ.

Therefore, advertising GICv3 in ID_PFR1_EL1 must be gated on AArch32
being supported at least at EL0.

Fixes: a258a383b9177 ("KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE")
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index ecb0aea180327..5c684ecf79e66 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -700,7 +700,8 @@ void kvm_vgic_finalize_idregs(struct kvm *kvm)
 		break;
 	case KVM_DEV_TYPE_ARM_VGIC_V3:
 		aa64pfr0 |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, GIC, IMP);
-		pfr1 |= SYS_FIELD_PREP_ENUM(ID_PFR1_EL1, GIC, GICv3);
+		if (kvm_supports_32bit_el0())
+			pfr1 |= SYS_FIELD_PREP_ENUM(ID_PFR1_EL1, GIC, GICv3);
 		break;
 	case KVM_DEV_TYPE_ARM_VGIC_V5:
 		aa64pfr2 |= SYS_FIELD_PREP_ENUM(ID_AA64PFR2_EL1, GCIE, IMP);
-- 
2.47.3


