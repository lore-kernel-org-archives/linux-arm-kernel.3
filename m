Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2322F33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YUdsNFl22keQpnklD9TJEiIfnBe26KJuOQIX6FYZjc=; b=ax0gRyH+kI5BbLRslHQPQlMcbm
	0AANEbIrMK1EFrrLgmQlSmJi07OD+vk1YfZhAXt+/S/VGe2i4RMkF11gWB9DamkaP/XZ6j+CQE1s6
	GdhPF+ny1shQLbzXEFfFRnf9EVhuuTxcEjzCoBnAJ8/F/8p/yE3Bk8adSnEOm9/R1lTSLhfFAp3bC
	gR3CUKpjrkRO29Vud99kvkno8y2QQ4jxeHc/r2586FmVTbg7T3vSdhYIpIyWyAXRli1d4LquL5ld2
	uLO7Rx/286PEjuOvr6Z6kLmp5frz0sEUs+MZLFjCybgH8fRgvswJefQPSxv21tRsipa/QoIIVzFS/
	LOrDe4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wA-0000000215P-1Zcb;
	Thu, 05 Mar 2026 14:44:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9w9-0000000214l-39f7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 332476183A;
	Thu,  5 Mar 2026 14:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0062EC19423;
	Thu,  5 Mar 2026 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721864;
	bh=gCsYu54+rda1wp7ZSqfP5W9dm2M/NIWUZ+HpfEGTVN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GSfRmb/1xNnovsjt+t+jVHxUtHx49sEd+QkEyHCqOdW36nlPM7HJi48gXq87WQw24
	 1BuC29R1p7953RpFi6jkuLxAACCuRoeSwDO83AmboJ8O6dR9W1ZPkZIDHNKNZtT9Un
	 MiICCTasLZZqyagodb5gNRkRqtgELdL4H20o447kDtlah71DQ+VLvZ/hlVmgP6YJOP
	 WCS7Tv0ilKHkOVLD3rP0VSFxdKCa1jfYpaiaAkcTkQg0M9rzI171MlO4CpovwOojwO
	 +BtXhsPS861C4FTBeN1O3JWEwPrS/CmPcFPOfGSJBToKx9+C6XpJA6Q2E+ZAsFozrG
	 Bu6mlW33vWNcw==
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
Subject: [PATCH v3 04/36] KVM: arm64: Don't advertise unsupported features for protected guests
Date: Thu,  5 Mar 2026 14:43:17 +0000
Message-ID: <20260305144351.17071-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.53.0.473.g4a7958ca14-goog


