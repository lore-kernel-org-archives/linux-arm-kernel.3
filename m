Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED15D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boPNj0hMdCwLXc3rvbW63YSYRYwSFrQmubJjfe6asaQ=; b=veTNoYhbKVr0Ysj+0vpKlH4F0h
	YX3E8QuxSFBl/67YxzNC3plx5dJi/GNtdyzwRR048v8uAuSd3U6Ocrb1yh6T9LPbr7YrByQ3oV7jD
	grzzTUXBEfek4tXyEv8JpoqInV+sMID6Simw3Gycgec/Ss/ywEs3R6QMGTY0ZT86c9R5PmJH4Wphc
	mzlKxJVq0i6hIdNvKXO0rGOW56kesr54Pf7WXALHyJHbGUZi/nRPYOlc8ZiDCaH2J82Q56YBToYAE
	t/JFcULji8H3QKeQyXWhN7yUcgkWcsV/8+r1JqXNR11e+0Pk0xz10aTN5ECWzO1FTVI5wyi1+GQUj
	c5KgERbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvR1-00000000GdS-1vSO;
	Fri, 28 Nov 2025 10:10:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvQy-00000000GcB-3fAB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:10:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F14991A25;
	Fri, 28 Nov 2025 02:10:27 -0800 (PST)
Received: from e140010.arm.com (unknown [10.57.90.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC18A3F73B;
	Fri, 28 Nov 2025 02:10:29 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 3/4] KVM: arm64: nv: Don't mask VTCR_EL2.HA if FEAT_HAFDBS is present
Date: Fri, 28 Nov 2025 10:09:45 +0000
Message-ID: <20251128100946.74210-4-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128100946.74210-1-alexandru.elisei@arm.com>
References: <20251128100946.74210-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_021036_954579_6C403DEC 
X-CRM114-Status: GOOD (  10.72  )
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

Commit 39db933ba67f ("KVM: arm64: nv: Implement HW access flag management
in stage-2 SW PTW") added support for hardware updates to the access flag
to stage 2 if the feature is available to the virtual machine, but forgot
to remove the VTCR_EL2.HA bit from the res0 mask for the register. Remove
it from the mask to allow the VM to use the feature.

Fixes: 39db933ba67f ("KVM: arm64: nv: Implement HW access flag management in stage-2 SW PTW")
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/nested.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 911fc99ed99d..7a34163f6c68 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1719,7 +1719,9 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	set_sysreg_masks(kvm, VTTBR_EL2, res0, res1);
 
 	/* VTCR_EL2 */
-	res0 = GENMASK(63, 32) | GENMASK(30, 20);
+	res0 = GENMASK(63, 32) | GENMASK(30, 22) | BIT(20);
+	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, HAFDBS, AF))
+		res0 |= VTCR_EL2_HA;
 	res1 = BIT(31);
 	set_sysreg_masks(kvm, VTCR_EL2, res0, res1);
 
-- 
2.43.0


