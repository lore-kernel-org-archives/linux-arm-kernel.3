Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C711061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suqUmV3t0TCfxqOUJuk6ssfZFyY8qGljIeleXvxkicA=; b=eWrxtIcZ3gOcfKTIyn3ttz1Z85
	2MswpdKny1EnCatYQo4Tm7GHjUI03krzzMW/LuMU/ADpkcyQnRuCmj7kOSfDXSsAZuQITYG76J4DI
	0HV7dvtbqz29jYEymq9OBpozXVVht4S4tho4+PmkC0LQRjsvQGoDkbw0g9PBBtAiK20vhb8Rpg7yR
	GWiE5Czai6ZyXh9zv6LSU3Mk83HCgjh5z1Ei7wLFxsxKY9XFP8qTjS4mupcNKni07HLGLBIljg7xy
	hr6GEhVSS89UkJEkET0zjB3J2G9D81anAq8fgrBG5FyAPvVwKm33JfrKdYQ2nCd4YlDcmLe58BuIW
	6M8FvVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DvT-0000000BSwn-41Sm;
	Mon, 30 Mar 2026 14:49:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DvQ-0000000BStv-0oi9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D76A243F3C;
	Mon, 30 Mar 2026 14:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088B2C4CEF7;
	Mon, 30 Mar 2026 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882147;
	bh=GEg9qAdks1S+YwQJuBag8f327Zhp7USRaMcrpEgiyho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYnLwmCTC5Pdo/AJEKshXlYSsKwjMIe7O18EUCdKOy3IsG+1Jmh+D1K62Nv50Drwe
	 BwHTmBhaGSlYH+xWddww1dhdxYeJS86B37ftoONSC3CDKD3gNFICwBoH3N0QKrrwvm
	 u5uvMmmkv9qhaALLhI6plueG0DPvtQiWdFX/m5ParaDLxzm87jmJyMt2tVT82v5277
	 buIgzhiq42LjrXPIF9VyINgVIKYFEatiFz0Ppy28mlNQsaG28rWQ/Hbd+/fH2AtDot
	 ufT+vnAK4V6POCuCG4DELFaLbzriFOg9PQ80twkgWSnKgN84ekbY/+lIiZ4jn76o6R
	 Wj1NhkWw4K2kQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 05/38] KVM: arm64: Don't advertise unsupported features for protected guests
Date: Mon, 30 Mar 2026 15:48:06 +0100
Message-ID: <20260330144841.26181-6-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_074908_247035_C212EB10 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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

Both SVE and PMUv3 are treated as "restricted" features for protected
guests and attempts to access their corresponding architectural state
from a protected guest result in an undefined exception being injected
by the hypervisor.

Since these exceptions are unexpected and typically fatal for the guest,
don't advertise these features for protected guests.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_pkvm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 757076ad4ec9..7041e398fb4c 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -40,8 +40,6 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_MAX_VCPU_ID:
 	case KVM_CAP_MSI_DEVID:
 	case KVM_CAP_ARM_VM_IPA_SIZE:
-	case KVM_CAP_ARM_PMU_V3:
-	case KVM_CAP_ARM_SVE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		return true;
-- 
2.53.0.1018.g2bb0e51243-goog


