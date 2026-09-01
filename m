Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158EBC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1RngNz1izmirvFZ3A73M9H6QDB0HWQQSYLcGQ4IXqs=; b=FrEGy2+XUPRmQANRlILXx/jxpW
	ZH+VK7QtAq66ZG6S9mTuea9pLIutYPHZqo3wrrw4jCoY7RBIiwX4R6iT/1kCwlhp8RWdiA8d+F0ob
	MPXqsRKClm3jyPQZEncj3cN/zzV09Li3RExo/POd6ROqhci+rcWlJKdiCrkZ7c0Yk2AuH6keDJl6d
	xq3gwXa33vCNe5f0gVymiIMXV6yeD7aJpBHj/phSFfjZWkExkabQO9WijD5+ERHABM4K9xhfgjkO0
	3k1MqgYesdprp3TnCQKMGQrZiV++ffuj4GWJ5obEpezU0BR+CTy+NfvCL8/g3tqBcp666Fe4Dhk2i
	rL4D5jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S5q-0000000CnNA-36Ck;
	Tue, 01 Sep 2026 17:16:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S5l-0000000CnIa-432m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:16:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6893F1756;
	Tue,  1 Sep 2026 10:16:09 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CA563F7D8;
	Tue,  1 Sep 2026 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788282973; bh=xHPxvRUZ+WgjAT7cIxsez9QFHBw7/cnqGtqr1gFdEFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=avpHPUawEvIy+sjjbEKnOY/hZjj8JDCtZFbHdPe0LrsVzAxThZRqt9TwPpoocuO7B
	 ce/wL7F/mIQIfaQIbqYOoesaX03FGn2TTY9i90TeC1Lwsp/0/m1ZqzY5rqdPXOrqAa
	 GeD6emuHuERG7trk/+9ySHWUi+Kto67cqMGylIiY=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/5] KVM: arm64: Add KVM_REQ_RELOAD_STAGE2
Date: Tue,  1 Sep 2026 18:15:55 +0100
Message-ID: <20260901171558.2674031-5-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901171558.2674031-1-leo.bras@arm.com>
References: <20260901171558.2674031-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471; i=leo.bras@arm.com; h=from:subject; bh=xHPxvRUZ+WgjAT7cIxsez9QFHBw7/cnqGtqr1gFdEFs=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKms81rLTxzPFn9uwlPFJfEYf1pFw7Zip9VPPj7mbHxr Ck/DhRt6yhlYRDjYpAVU2SRfTR/Fc/3KRlHrvxYADOHlQlkCAMXpwBM5G4qw//Mw89LmMwSwl+8 cix5IPL2uHOF6+LtRlsc+c3mTD205gc7wz+zqTk8ftFcZ4LqisRjjE4uPl5+ge+qWvzJXZmHgi9 8UOcEAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_101614_119420_6950122F 
X-CRM114-Status: GOOD (  14.03  )
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

Add a vcpu request to exit guest, reload Stage2, and then come back to
guest.

This will be used on future patches that enable S2 HAFDBS and HDBSS, as
they may need to change VTCR bits for enabling/disabling the feature when
the vcpus are still running.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 ++
 arch/arm64/kvm/arm.c              | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7..00fe169f239f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -48,20 +48,22 @@
 #define KVM_REQ_VCPU_RESET		KVM_ARCH_REQ(2)
 #define KVM_REQ_RECORD_STEAL		KVM_ARCH_REQ(3)
 #define KVM_REQ_RELOAD_GICv4		KVM_ARCH_REQ(4)
 #define KVM_REQ_RELOAD_PMU		KVM_ARCH_REQ(5)
 #define KVM_REQ_SUSPEND			KVM_ARCH_REQ(6)
 #define KVM_REQ_RESYNC_PMU_EL0		KVM_ARCH_REQ(7)
 #define KVM_REQ_NESTED_S2_UNMAP		KVM_ARCH_REQ(8)
 #define KVM_REQ_GUEST_HYP_IRQ_PENDING	KVM_ARCH_REQ(9)
 #define KVM_REQ_MAP_L1_VNCR_EL2		KVM_ARCH_REQ(10)
 #define KVM_REQ_VGIC_PROCESS_UPDATE	KVM_ARCH_REQ(11)
+#define KVM_REQ_RELOAD_STAGE2 \
+	KVM_ARCH_REQ_FLAGS(12, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 
 #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
 				     KVM_DIRTY_LOG_INITIALLY_SET)
 
 #define KVM_HAVE_MMU_RWLOCK
 
 /*
  * Mode of operation configurable with kvm-arm.mode early param.
  * See Documentation/admin-guide/kernel-parameters.txt for more information.
  */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90..1e528d53d093 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1164,20 +1164,28 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		if (kvm_check_request(KVM_REQ_RESYNC_PMU_EL0, vcpu))
 			kvm_vcpu_pmu_restore_guest(vcpu);
 
 		if (kvm_check_request(KVM_REQ_SUSPEND, vcpu))
 			return kvm_vcpu_suspend(vcpu);
 
 		if (kvm_dirty_ring_check_request(vcpu))
 			return 0;
 
+		if (kvm_check_request(KVM_REQ_RELOAD_STAGE2, vcpu)) {
+			unsigned long flags;
+
+			local_irq_save(flags);
+			__load_stage2(vcpu->arch.hw_mmu);
+			local_irq_restore(flags);
+		}
+
 		check_nested_vcpu_requests(vcpu);
 	}
 
 	return 1;
 }
 
 static bool vcpu_mode_is_bad_32bit(struct kvm_vcpu *vcpu)
 {
 	if (likely(!vcpu_mode_is_32bit(vcpu)))
 		return false;
-- 
2.55.0


