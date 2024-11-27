Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF20D6ACE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ycFpYnG4M3pW2q14NE6/ihqJTbDKGGyyRx7Q9yFq9Q=; b=1AYWcWeTs8CjdpT+Esro2UZu1h
	JEEIn8MEYLZs+FVQoOAcJTK4acbVlf0N9vFIW9sDYLlTXVz0tnhqCUQq9eGpUFxUQ02bm4TV1QehJ
	zhPCxUCWy9FYDqgrij79i7SHe+Vicu+yxIxEbvnIqmKP+kqYVcpOQLVQGxqt2epOgdw3VGs5YzTmb
	mAGjIryK8nXmxju5IxAaSwSF02ZtQgxhIVsRRNhsEidVOf7mBWO31vcUQoSJRTL20zTW5zE/jHJiO
	1rn6Pj4PObS0/N3RcXx7Tn0shfB4INfsoFDWK3JxKa+8eLSW82nA0noy69+i5qJt0JzX/nVEbOpax
	YdJVGDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJUT-0000000DQdL-1RGx;
	Wed, 27 Nov 2024 14:58:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJTU-0000000DQWF-2n1r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 14:57:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B31C1477;
	Wed, 27 Nov 2024 06:57:30 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.69.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B85D3F58B;
	Wed, 27 Nov 2024 06:56:57 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Bump KVM_VCPU_MAX_FEATURES
Date: Wed, 27 Nov 2024 14:56:31 +0000
Message-ID: <20241127145644.421352-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_065704_743474_A88C8884 
X-CRM114-Status: GOOD (  11.51  )
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

When the KVM_ARM_VCPU_HAS_EL2 define was added, the value of
KVM_VCPU_MAX_FEATURES wasn't incremented, so that feature has never been
in the KVM_VCPU_VALID_FEATURES bit mask. This means the HAS_EL2 feature
will never be exposed to user space even if the system supports it.

Fixes: 89b0e7de3451 ("KVM: arm64: nv: Introduce nested virtualization VCPU feature")
Signed-off-by: Steven Price <steven.price@arm.com>
---
I might be missing something, and it's possible that
KVM_ARM_VCPU_HAS_EL2 is deliberately not exposed yet. However I'm
working on v6 of the host CCA series and as part of that want to add a
new feature but and bump KVM_VCPU_MAX_FEATURES up to 9.

 arch/arm64/include/asm/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e18e9244d17a..af7c827b216e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -39,7 +39,7 @@
 
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
-#define KVM_VCPU_MAX_FEATURES 7
+#define KVM_VCPU_MAX_FEATURES 8
 #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
 
 #define KVM_REQ_SLEEP \
-- 
2.43.0


