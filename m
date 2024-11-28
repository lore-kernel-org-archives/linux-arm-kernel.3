Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F074D6910B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iaG1b+JwMIQi3DAhpRd2uui2yB6sNRs4Dsa8pT9Cl5Y=; b=ufhrxFfW+r23/URZv4UbzNSqcA
	uLqJsJLrUZKkFZVKEhEfNDH42nAn+4ldBgCuixa0b7+JFQ2gQaQYDgUr2mXRzNdWpJf8GH9VcSSdO
	dBhcYuIb4oOYfTm6/DTV1dJ+r6nBC+PH5fRndEPYpNN7ZbIX2YtlYLkwji/Tyfji59KdllDzbPHdV
	iGBU2FciaRIswR9Oay4oKvcY1ptfMFF/yC68cRpnZfyKyXBGSALJKzKe4+5X+N5wyRLkUrJxClETM
	AphoJniqLs28HMq7nsVGfEgV6S2Qqpfz5ASo5VrUCHWMPW4o5TZfkcDG5u3izvOx+qY/UJ6acGeo4
	UZkL6wWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGert-0000000FfaL-11zp;
	Thu, 28 Nov 2024 13:47:41 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeqs-0000000FfQb-2F24
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 13:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iaG1b+JwMIQi3DAhpRd2uui2yB6sNRs4Dsa8pT9Cl5Y=;
  b=jgdJKA1k4OEhWqv+nL2OKASeAJVraXY4UpfvLPeti47MZStlCeV1UKh/
   UqqYR70toyScT9uroTm5DRTXkxlL5lFvYVZwRbHAkMpzMwA4RbJnlTtU0
   A4KdwCwhUGMw24SvucUmlQaB55FKo20ytUHUwtncDXHGwc7xI6b/F1OKi
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,192,1728943200"; 
   d="scan'208";a="102888059"
Received: from dt-aponte.paris.inria.fr (HELO keisuke-XPS-13-7390.paris.inria.fr) ([128.93.67.66])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 14:46:31 +0100
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>
Subject: [PATCH] KVM: arm/arm64: vgic-its: Add error handling in vgic_its_cache_translation
Date: Thu, 28 Nov 2024 14:45:34 +0100
Message-Id: <20241128134534.361144-1-keisuke.nishimura@inria.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_054639_039909_147FD03B 
X-CRM114-Status: GOOD (  13.58  )
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

The xa_store() may fail because there is no guarantee that the cache_key
index is already used in its->translation_cache. This fix (1) resolves
the kref inconsistency on failure and (2) returns the error code.

Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
---
 arch/arm64/kvm/vgic/vgic-its.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 198296933e7e..8f423857b7d2 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -555,7 +555,7 @@ static struct vgic_irq *vgic_its_check_cache(struct kvm *kvm, phys_addr_t db,
 	return irq;
 }
 
-static void vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
+static int vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
 				       u32 devid, u32 eventid,
 				       struct vgic_irq *irq)
 {
@@ -564,7 +564,11 @@ static void vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
 
 	/* Do not cache a directly injected interrupt */
 	if (irq->hw)
-		return;
+		return 0;
+
+	old = xa_store(&its->translation_cache, cache_key, irq, GFP_KERNEL_ACCOUNT);
+	if (xa_is_err(old))
+		return xa_err(old);
 
 	/*
 	 * The irq refcount is guaranteed to be nonzero while holding the
@@ -578,9 +582,10 @@ static void vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
 	 * translation behind our back, ensure we don't leak a
 	 * reference if that is the case.
 	 */
-	old = xa_store(&its->translation_cache, cache_key, irq, GFP_KERNEL_ACCOUNT);
 	if (old)
 		vgic_put_irq(kvm, old);
+
+	return 0;
 }
 
 static void vgic_its_invalidate_cache(struct vgic_its *its)
@@ -618,6 +623,7 @@ int vgic_its_resolve_lpi(struct kvm *kvm, struct vgic_its *its,
 {
 	struct kvm_vcpu *vcpu;
 	struct its_ite *ite;
+	int ret;
 
 	if (!its->enabled)
 		return -EBUSY;
@@ -633,7 +639,9 @@ int vgic_its_resolve_lpi(struct kvm *kvm, struct vgic_its *its,
 	if (!vgic_lpis_enabled(vcpu))
 		return -EBUSY;
 
-	vgic_its_cache_translation(kvm, its, devid, eventid, ite->irq);
+	ret = vgic_its_cache_translation(kvm, its, devid, eventid, ite->irq);
+	if (ret)
+		return ret;
 
 	*irq = ite->irq;
 	return 0;
-- 
2.34.1


