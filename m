Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EFFC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ye0bS5qOFjAgfh+Zfj8a/VIJRUoAZES4phAbfO8bPp4=; b=jH6oByyHopUQtQVIAq21I1PAd8
	aP8kVwOyOuUNx+3BIYhwLeSGxI2/3gYSBB2a0zAT2pPOnOyDv7zfXeTEALR3fURbVe3xsuovluWRK
	VgCYiPoqD6gjYD0mwBFihi/wBZ0wA03q+7Owi32DvPYy1+wVW4Arn9z0+Yq24ZmGxAqvXawKzm3+R
	UBNwYf5zGFUZqDidfLwEr9bMEkEm6eLs3nldd7om3x7yL9rdBEBxWp95Pwa3wVpC9zM4WMAFQieI3
	gm3Vxl7NmeC0P7EgJPWiy6K8ZZ/4abjuL//NXmrIa9f5GH5aKnFCal+uSqWwi/8I9YtpStYK2kX64
	cA4gbVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdU2-00000005yQJ-3i7Q;
	Tue, 01 Jul 2025 16:05:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbsf-00000005gak-2Tbg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1E6645B2F;
	Tue,  1 Jul 2025 14:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE16C4CEEB;
	Tue,  1 Jul 2025 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751379760;
	bh=Wl4lyyrYUcT3WQOaPBwaLkFiqBgAhrV+nWS3JZrxsb4=;
	h=From:To:Cc:Subject:Date:From;
	b=T1muoWW9B/AVNJTOi1xuV0GGFtHeR+/s3BIaFKkSAeBVDkTCw8do064SOOFkbDIzs
	 jnQ5ZueO5VbdDTgSSobJUO+p8axqMx9Oa/oakN22ZNBgR/Unyqw08C5LjNUaEJHf+j
	 m0ECv6oBrCivuaYNsKIdFvdmjwCNPw7rWfXYphFkZm8EuMTftB3UUah2gD10ARbqSH
	 1ohxeJgw6XWcNX9vf7eoFXaxtoGwQry9769LIJ5wDm7iegGfMMiyHOzK5iC9vjEFRK
	 flr+hNNLZntlbzvxaWoOB8PKonYND+aTurHfviXqeIvtVtIxGJ8NVbW3WJEK8Ly0jf
	 ePvlx8vQ1YkCg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uWbsc-00BbMO-Mr;
	Tue, 01 Jul 2025 15:22:38 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Fix handling of FEAT_GTG for unimplemented granule sizes
Date: Tue,  1 Jul 2025 15:22:25 +0100
Message-Id: <20250701142225.753984-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_072241_663937_3B07CD4B 
X-CRM114-Status: GOOD (  14.18  )
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

Booting an EL2 guest on a system only supporting a subset of the
possible page sizes leads to interesting situations.

For example, on a system that only supports 4kB and 64kB, and is
booted with a 4kB kernel, we end-up advertising 16kB support at
stage-2, which is pretty weird.

That's because we consider that any S2 bigger than our base granule
is fair game, irrespective of what the HW actually supports.

Add new checks that will verify that this granule size is actually
supported before publishing it to the guest.

Fixes: e7ef6ed4583ea ("KVM: arm64: Enforce NV limits on a per-idregs basis")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 5b191f4dc5668..dc1d26559bfa3 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1402,6 +1402,21 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
 	}
 }
 
+#define has_tgran_2(__r, __sz)						\
+	({								\
+		u64 _s1, _s2, _mmfr0 = __r;				\
+									\
+		_s2 = SYS_FIELD_GET(ID_AA64MMFR0_EL1,			\
+				    TGRAN##__sz##_2, _mmfr0);		\
+									\
+		_s1 = SYS_FIELD_GET(ID_AA64MMFR0_EL1,			\
+				    TGRAN##__sz, _mmfr0);		\
+									\
+		((_s2 != ID_AA64MMFR0_EL1_TGRAN##__sz##_2_NI &&		\
+		  _s2 != ID_AA64MMFR0_EL1_TGRAN##__sz##_2_TGRAN##__sz) || \
+		 (_s2 == ID_AA64MMFR0_EL1_TGRAN##__sz##_2_TGRAN##__sz && \
+		  _s1 != ID_AA64MMFR0_EL1_TGRAN##__sz##_NI));		\
+	})
 /*
  * Our emulated CPU doesn't support all the possible features. For the
  * sake of simplicity (and probably mental sanity), wipe out a number
@@ -1411,6 +1426,8 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
  */
 u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 {
+	u64 orig_val = val;
+
 	switch (reg) {
 	case SYS_ID_AA64ISAR0_EL1:
 		/* Support everything but TME */
@@ -1480,13 +1497,16 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		 */
 		switch (PAGE_SIZE) {
 		case SZ_4K:
-			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN4_2, IMP);
+			if (has_tgran_2(orig_val, 4))
+				val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN4_2, IMP);
 			fallthrough;
 		case SZ_16K:
-			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN16_2, IMP);
+			if (has_tgran_2(orig_val, 16))
+				val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN16_2, IMP);
 			fallthrough;
 		case SZ_64K:
-			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN64_2, IMP);
+			if (has_tgran_2(orig_val, 64))
+				val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN64_2, IMP);
 			break;
 		}
 
-- 
2.39.2


