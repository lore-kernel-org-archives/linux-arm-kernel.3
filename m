Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2612CF9C7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR4Tn6oqiCAPnmtVt1lN6fmyKZuYK6V00zzHr7SsMU8=; b=qqFVRfHvK5raJebz+keTx7N8M6
	AOy0PILBiJdhMLYFTEtiveJID4ckYinHH79VWRQbL7aNUJ7zyGAobLExmY9XdlYaAIFJWri+EUcIl
	7Ek8VmLipg5lOnHhnMuPE6K30JeNMh6Val0nHl8sI/cb9+I5N7seQ8uqMx3fk8KcWotqV2b+YpQOr
	OXqy71o6dDf0a3aENoftDVw5MqWycvE0sqSqG/Rq9v76y2v1IdZZMtktkjNxp5E8uQKL4xgiDM5iM
	rAFkJZhoHBBJUCrc++WzXui6Ic+ZAk3hbyvCBXF5w89/U1WQ2cG5oDGQZIiwg9vus+TFDEBpyTBrB
	YyCImM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QA-000000075qH-0u3O;
	Thu, 20 Nov 2025 17:26:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pu-000000075Zw-2hAp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B5BD4445F;
	Thu, 20 Nov 2025 17:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3052C19421;
	Thu, 20 Nov 2025 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659558;
	bh=Phnjr10/3FSU814EfoeZq4CTVio4OIfPI7Xamjqjd9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m6md+j+NSq+asIjrap5hOKsHaUMm1LXwNUJk2deeiAQ9aTWLbFOD49vyusxWHU03B
	 +jvvGtDcZKGLR0Zf8MSOoQd4jpWOiaOAM3tsGl3nX27/AkLm7l3fsto5PW28avaY1F
	 7FxU9jN8r0CLblbxga+HNp0LMZpdbn6P2Li5AJInZAEn2Q3F4Q8WnEWrWFRqTi141A
	 MmcKZ6ZCnragJlZIa1l+I1v3yDuAEKsZOoxGsYiJ/73vUJ1tTJ9vmmcOiHGQZLI7zV
	 6UqhYMGbuxpCtjwCvVYJkWMxR081OQWtVwZgUmCQCVjF+8+5QsOoicjpLmx+GwD0RT
	 U8URsKlZrL+dw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Ps-00000006y6g-12j3;
	Thu, 20 Nov 2025 17:25:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 10/49] KVM: arm64: GICv3: Drop LPI active state when folding LRs
Date: Thu, 20 Nov 2025 17:25:00 +0000
Message-ID: <20251120172540.2267180-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092558_697592_833DE265 
X-CRM114-Status: GOOD (  12.90  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index e3f4b27e0225f..81d22f615fa66 100644
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


