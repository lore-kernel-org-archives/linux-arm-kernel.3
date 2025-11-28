Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB0DD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGY0r5D8qNKOcNZn+sDVQ0IvehJnPt2DhJI4HXiLrfI=; b=kT76Rf2huwqFB4DdixGHcahQez
	s2X23D77uOA8aGPKXIuMhGKMXzExdoGYt56dYW4aBcS3pSz8R4WLlEVG/wmBKPvD9+LWQfMnYPIEC
	NuC0whNssntZ4G+a4sdJHis2nIjbJSxyWJ2gbHXnPW3255RS7QpyMDNYIV98dlftJA5RBDgiEGyPO
	wRnrap4Ele7ztAin8SsJTIkVf4kGra9TtFHpBJ1mr7CHbEn5Vid33LXyiue1mX+ce+rcfxrAndzND
	1ZcgZvJNGuKiKsG+pXs7ZI7WKGnn58XAuPTEAGKXBR6056ZMPsnko2nJI0rELERi4jmECJukHqf9z
	XEBrlQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvR6-00000000GgP-3EJQ;
	Fri, 28 Nov 2025 10:10:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvR3-00000000GeH-1fNp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:10:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08B5B1A2D;
	Fri, 28 Nov 2025 02:10:33 -0800 (PST)
Received: from e140010.arm.com (unknown [10.57.90.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F08213F73B;
	Fri, 28 Nov 2025 02:10:35 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 4/4] KVM: arm64: at: Update AF on software walk only if VM has FEAT_HAFDBS
Date: Fri, 28 Nov 2025 10:09:46 +0000
Message-ID: <20251128100946.74210-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128100946.74210-1-alexandru.elisei@arm.com>
References: <20251128100946.74210-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_021041_501453_E0F9CF9D 
X-CRM114-Status: GOOD (  10.43  )
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

A guest can write 1 to TCR_ELx.HA, making the KVM software walker update
the access flag in a table descriptor even if FEAT_HAFDBS is not present.
Avoid this by making wi->ha depend on FEAT_HAFDBS being enabled in the VM,
similar to how the software walker treats FEAT_HPDS.

This is not needed for VTCR_EL2.HA, since a guest will always write to
the in-memory copy of the register, where the HA bit is masked (set to
0) by KVM if the VM doesn't have FEAT_HAFDBS.

Fixes: c59ca4b5b0c3 ("KVM: arm64: Implement HW access flag management in stage-1 SW PTW")
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/at.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 6d41a95f6c60..53bf70126f81 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -346,7 +346,8 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 	wi->baddr &= GENMASK_ULL(wi->max_oa_bits - 1, x);
 
-	wi->ha = (wi->regime == TR_EL2 ?
+	wi->ha  = kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, HAFDBS, AF);
+	wi->ha &= (wi->regime == TR_EL2 ?
 		  FIELD_GET(TCR_EL2_HA, tcr) :
 		  FIELD_GET(TCR_HA, tcr));
 
-- 
2.43.0


