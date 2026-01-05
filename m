Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860ECC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMPAk2th1jHkliIK+0FnfoLEWXhbUgZrcoqmZLvr8Jk=; b=FdCkKxAiYk+bYjYnmBvBzT45Nx
	uPGUrzPOUExQLAKZg5jq4c3piO/5/3vAZFy6m+LXdwwEYnDAjQkHxD7fBN8azL/br7G+KVZGREErv
	3Nc7/miV/4mdaKZS/B5a3Ck5X4LfMEsntaQkPQiQzwrJOwJNgLQUG9Stu5qqwk8FSRFeqjNi6NU/Y
	FEnwrm1FQWIlnG15gZhkpVrYDU/CyoTJ/fFr/c81iT733CmuPLHmO8NxuKE+PO17uxr/SGKecLDve
	WPdwdWv7G/BLkPzShbWt+ufaHu85QvGgO1Du7zy3vYMy5dWqqSUyL0exmU0MgEco5kMivjbInBc7b
	upwHMamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqL-0000000Bdb3-0Y8F;
	Mon, 05 Jan 2026 15:50:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqJ-0000000BdaA-1uZY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB21B60141;
	Mon,  5 Jan 2026 15:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC8DC19425;
	Mon,  5 Jan 2026 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628202;
	bh=urzC1N4aQ6kG8UqznJupq3gEB8+LBsZGlefWUCpaFx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KxERz5s641JQj1eu2LAkhYryLlMlPmq6kWR6NNt9H+5YgdzKemLUI/Ps35nPCt9JS
	 td4ig/PraeyNZZtSR+HJ4sYRUvptYxeVeDszaxiEKS9X/F0fdJjeLii0oUaXTydS7v
	 MxilMjzon9CS1ELiX4Uum8zy1VuTAcLou1aZPfXrCa5d8a03BMvFWciYlLRalLVMtd
	 c/5EWK739nkggs+LhRCX1i6dGMlvHX8+k0eaaidIJwilSLSayKnZnt8eHC7DVRh0le
	 JNNCNGdl3MWG/p9kJU86+xQP4kR4p4EC4wAFpDnVwh216jeeWGk1wEAeJYVwcVcs3b
	 GunoWSrMEMYnA==
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
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 04/30] KVM: arm64: Don't advertise unsupported features for protected guests
Date: Mon,  5 Jan 2026 15:49:12 +0000
Message-ID: <20260105154939.11041-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
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
index 0aecd4ac5f45..5a71d25febca 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -37,8 +37,6 @@ static inline bool kvm_pvm_ext_allowed(long ext)
 	case KVM_CAP_MAX_VCPU_ID:
 	case KVM_CAP_MSI_DEVID:
 	case KVM_CAP_ARM_VM_IPA_SIZE:
-	case KVM_CAP_ARM_PMU_V3:
-	case KVM_CAP_ARM_SVE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		return true;
-- 
2.52.0.351.gbe84eed79e-goog


