Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681F8C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dr1npthRS596q766VwCo3BxGKb+h7Go/35hKziPbN5g=; b=ZsLhZYD+w1Hx1oIinN9D2GNLgI
	XYi7OUsZKPWwVEOMLBfamjhT03RiXhN7V8/hB1nLpQfKSECKCuwvhmWipUWRJDVnhh8splSYA9qAx
	qGhDQjNJlpIeJS7jIZkbSl78yUONFlkCREU90v4t7gbe2cwZHq2fCymZUqrsCxSaOBNBU45Kt+jof
	EY4ofzXBrzqslmQpkYTZn2Ky5v8xYPSjWebHhWs/KcB9rcTZzg0tPSgbaCuK6/qV6cLBXg01AKId4
	RGdNXqpSzlCaWBQ17y7KqBTdJmWf1vzb6A02PXq/Mjb22121yZP03g4DQ+jBca0/j31GKzBDzeP5S
	zSJmgRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsU-00000004uE7-3gdU;
	Thu, 02 Jul 2026 16:03:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsT-00000004uCD-08rJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C638543D56;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4081F00A3F;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008180;
	bh=dr1npthRS596q766VwCo3BxGKb+h7Go/35hKziPbN5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PHlVQbx8j1oOdDz0wziFeWEyXvNFrmVY4tD3GrEHEQHGsIdEx3iXsT5+IGXnfk6Ol
	 kxMRw8nyO7G3y7+KxaivPvAOaEbbJ2oxthBVHaF0o9TsvnHZDXi9v3GeAYVQC7dMeN
	 wFLxw03OjMQzja/6TlWymb9XEqnp1OoC+J+RIvTM51GM4NrooTPh3XMlz5bcKQi3W4
	 ty8EcRW8gpwckfy2dcBd0dWQ0ZMum5uisW9XjqL61u2AHKIURWa0rb3KsFq3XAD1d+
	 +UeLo6hIX3iowRCGLknIQdcIMMAQ4UpOprWX4stFWJkKvnclf9fvPTIr8uys5Hwt0f
	 w5O36dZgBq9bQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsQ-00000000ojd-3trS;
	Thu, 02 Jul 2026 16:02:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 04/28] KVM: arm64: Drop __HCRX_EL2_* masks
Date: Thu,  2 Jul 2026 17:02:24 +0100
Message-ID: <20260702160248.1377250-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

The __HCRX_EL2_* masks are a leftover from a time where we didn't
have much sanitisation for the system registers. Since we are now
in a better place, rely on the existing checks to detect unhandled
bits in HCRX_EL2.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h | 15 ---------------
 arch/arm64/kvm/config.c          |  3 +--
 arch/arm64/kvm/emulate-nested.c  |  5 -----
 3 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 3f9233b5a1308..f6cd851047947 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -287,21 +287,6 @@
 				 GENMASK(19, 18) |	\
 				 GENMASK(15, 0))
 
-/*
- * Polarity masks for HCRX_EL2, limited to the bits that we know about
- * at this point in time. It doesn't mean that we actually *handle*
- * them, but that at least those that are not advertised to a guest
- * will be RES0 for that guest.
- */
-#define __HCRX_EL2_MASK		(BIT_ULL(6))
-#define __HCRX_EL2_nMASK	(GENMASK_ULL(24, 14) | \
-				 GENMASK_ULL(11, 7)  | \
-				 GENMASK_ULL(5, 0))
-#define __HCRX_EL2_RES0		~(__HCRX_EL2_nMASK | __HCRX_EL2_MASK)
-#define __HCRX_EL2_RES1		~(__HCRX_EL2_nMASK | \
-				  __HCRX_EL2_MASK  | \
-				  __HCRX_EL2_RES0)
-
 /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
 #define HPFAR_MASK	(~UL(0xf))
 /*
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 0622162b089e5..16d8148dc3f12 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -933,7 +933,7 @@ static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
 };
 
 
-static const DECLARE_FEAT_MAP(hcrx_desc, __HCRX_EL2,
+static const DECLARE_FEAT_MAP(hcrx_desc, HCRX_EL2,
 			      hcrx_feat_map, FEAT_HCX);
 
 static const struct reg_bits_to_feat_map hcr_feat_map[] = {
@@ -1579,7 +1579,6 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 		break;
 	case HCRX_EL2:
 		resx = compute_reg_resx_bits(kvm, &hcrx_desc, 0, 0);
-		resx.res1 |= __HCRX_EL2_RES1;
 		break;
 	case HCR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3c82f392845d1..b7f3d86a94031 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2320,7 +2320,6 @@ int __init populate_nv_trap_config(void)
 	BUILD_BUG_ON(__NR_CGT_GROUP_IDS__ > BIT(TC_CGT_BITS));
 	BUILD_BUG_ON(__NR_FGT_GROUP_IDS__ > BIT(TC_FGT_BITS));
 	BUILD_BUG_ON(__NR_FG_FILTER_IDS__ > BIT(TC_FGF_BITS));
-	BUILD_BUG_ON(__HCRX_EL2_MASK & __HCRX_EL2_nMASK);
 
 	for (int i = 0; i < ARRAY_SIZE(encoding_to_cgt); i++) {
 		const struct encoding_to_trap_config *cgt = &encoding_to_cgt[i];
@@ -2346,10 +2345,6 @@ int __init populate_nv_trap_config(void)
 		}
 	}
 
-	if (__HCRX_EL2_RES0 != HCRX_EL2_RES0)
-		kvm_info("Sanitised HCR_EL2_RES0 = %016llx, expecting %016llx\n",
-			 __HCRX_EL2_RES0, HCRX_EL2_RES0);
-
 	kvm_info("nv: %ld coarse grained trap handlers\n",
 		 ARRAY_SIZE(encoding_to_cgt));
 
-- 
2.47.3


