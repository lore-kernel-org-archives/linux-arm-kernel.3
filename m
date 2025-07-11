Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB577C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uKzGV8OnV+hp4DpvDUPLtngn7PJUqAAJsVZSE9Zn1Es=; b=NVOVx5jiWnrJuGkndZYH5gzcAR
	wI7zuKkHwH+r1UHRzTc38Ph+3afnhj1pVbsDlODm7xWdXKjDz+rza3cKhYxA9ra/r1Q0JHk2Y59l8
	FOJSOa4cXcRujk2uBHUbwjnukV88JYEkVEcoclsvQ4uBBg2mg1gWXHOp+LH938e23BuY9tVJ537dX
	VNcKZ74c566c0BuCESntjVGdrtdvS6QqtlIzhd5R0+yQBfVeMREs3NGpIuuEPCWDeAcyX/WFT1+Wm
	0g7Rl4IUkKONEsP1RDbaeWKITBP2QfTA+D/QARAM3uUGik9EC/HgFXLs9VKTwxqizJBWn4ZKF+eVH
	iwUivGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8S2-0000000E1Gx-32I4;
	Fri, 11 Jul 2025 07:45:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Ao-0000000DyLe-2ou9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF0C4444B3;
	Fri, 11 Jul 2025 07:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0814C4CEED;
	Fri, 11 Jul 2025 07:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752218877;
	bh=1j6zpFS1DVxWS1hxIV2/OdRNBhbPf+kJqE3FRm4cKC4=;
	h=From:To:Cc:Subject:Date:From;
	b=d0OLdVU4WW5AyI7Qx0K6WV7vTsCe8RYod5bHaEglGd68ShyZuQBsiCZKJbvDq8fG5
	 /3rgIEMyKy/WVzx8LSE8c6JPNA9uwUr0p6mu7IKoGE7CalIEjtnquG9JmrjiXlGJde
	 4kGmdSSbclD4AHFyAjRqLLHVDZI35/MEDvivwPaDcZo16v1dqpKqcBLNYnuz+iU8Gz
	 W1JiLAd+rki6nEXs4bOzc1J8ppdazvdGKhfan6USczkBV8AqEMm4ETus9uh1Uihc7n
	 O4xSnlwpG6n9H64HA3voGAMTgvH1zLlPva4hY+BUuS/jcbsaT+Lkq0lUN2GlxzfQJg
	 WigyTZS+XaRaQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>,
	James Morse <james.morse@arm.com>,
	Sebastian Ott <sebott@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: fix u64_replace_bits() usage
Date: Fri, 11 Jul 2025 09:27:47 +0200
Message-Id: <20250711072752.2781647-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_002758_736022_795886C9 
X-CRM114-Status: GOOD (  12.83  )
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

From: Arnd Bergmann <arnd@arndb.de>

u64_replace_bits() returns a modified word but does not actually modify
its argument, as pointed out by this new warning:

arch/arm64/kvm/sys_regs.c: In function 'access_mdcr':
arch/arm64/kvm/sys_regs.c:2654:17: error: ignoring return value of 'u64_replace_bits' declared with attribute 'warn_unused_result' [-Werror=unused-result]
 2654 |                 u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);

The intention here must have been to update 'val', so do that instead.

Fixes: efff9dd2fee7 ("KVM: arm64: Handle out-of-bound write to MDCR_EL2.HPMN")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 33aa4f5071b8..793fb19bebd6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2651,7 +2651,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	 */
 	if (hpmn > vcpu->kvm->arch.nr_pmu_counters) {
 		hpmn = vcpu->kvm->arch.nr_pmu_counters;
-		u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
+		val = u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
 	}
 
 	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
-- 
2.39.5


