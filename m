Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40FACC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhijomrVgpU5nlp7P5LehWDg9luMd/07B0ez7SrB20I=; b=02bFi/Ck4julsxi5lwzoHADwl4
	SqdNLAZNzzZqVcHBBr6NsZQMXdW3q1Uindz4SSH6yWsuqQXrhZ6m7jXbYD5dTSJpv5U+3ek2X0v7Y
	Js2EB7cNQPq8q1ZGx3eI/1LYAO/7mVbrmIXUbv/mluqAO7CV6NAb50GP1ck6XkyH8HszyxW85Lvc1
	4zcgCgtZJfi0zJsNiijQeB5OzRXHGD8TV67IILwFUcpkqyZ/XWghXgMdfx1idbRLkPJlhiK0vK3p0
	mqrq6dkxq9WQ5b7iJneLTszfCnch9BomSgeILCSKrmCSmuCw7T/YDPgYzqZTPLHXyLigl3vUt0NGV
	mKah5tOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHILO-0000000HNrp-0IqH;
	Thu, 15 Oct 2026 10:05:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHILJ-0000000HNqI-3uCk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:05:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CC0343F62;
	Thu, 15 Oct 2026 10:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6233E1F000CA;
	Thu, 15 Oct 2026 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058745;
	bh=KhijomrVgpU5nlp7P5LehWDg9luMd/07B0ez7SrB20I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O4J8jMkN/oVXCbOwp54mOsV0gq8TVDrbE8CyHnpbT1373tcbyhO0qdtgSNSttkErz
	 +AsUgx1ZbS6SZvjqt0GnqnmeoqgoFEhq2KfQfxA09/aZpsuRB+N2hRKlJy2qQR9MdN
	 HBXlpDL9TjVzQ1PNycuaUJLM6L56v4gQWY7D7cJ8NBlC18oQxnd8o4obpPaQQPSGHF
	 op9xPXefuVtdDs+Hno4f0NvY8ra3O2HxENN7YQTrZa82l0BQEX011sThQTNAbE/ivc
	 dpYRE0c4L2WXE29sR1hIPASkdSBD2X8N0CnlWZu/eMJB2W58yv3hRtalh1aQs8hkQ7
	 QNpAbXttgncEg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xHILH-00000003EfK-2jnd;
	Thu, 15 Oct 2026 10:05:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH 5/7] KVM: arm64: Add helpers to halt a vCPU
Date: Thu, 15 Oct 2026 11:05:37 +0100
Message-ID: <20261015100539.1011760-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015100539.1011760-1-maz@kernel.org>
References: <20261015100539.1011760-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
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

From: Oliver Upton <oupton@kernel.org>

Currently we pause the entire VM when modifying VGIC state that requires
state to be synchronized back from hardware. This is perfectly fine for
heavyweight operations but not ideal for 'simple' things like migrating
an active/pending IRQ.

Add helpers for halting a single vCPU such that they can be used to
manipulate the AP list remotely.

Signed-off-by: Oliver Upton <oupton@kernel.org>
Link: https://patch.msgid.link/20260929212925.31775-2-oupton@kernel.org
[maz: fixed to use kvm_make_vcpus_request_mask(), guaranteeing that the
      caller waits for the target vcpu to handle the IPI]
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/arm.c              | 21 +++++++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 9c068f27f9b8a..7b4f7b6d94b8d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1254,6 +1254,8 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 
 void kvm_arm_halt_guest(struct kvm *kvm);
 void kvm_arm_resume_guest(struct kvm *kvm);
+void kvm_pause_vcpu(struct kvm_vcpu *vcpu);
+void kvm_resume_vcpu(struct kvm_vcpu *vcpu);
 
 #define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->pid))
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 07bf8b2e683d5..a2f1606822614 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1017,6 +1017,21 @@ bool kvm_arch_intc_initialized(struct kvm *kvm)
 	return vgic_initialized(kvm);
 }
 
+void kvm_pause_vcpu(struct kvm_vcpu *vcpu)
+{
+	DECLARE_BITMAP(vcpu_bitmap, KVM_MAX_VCPUS) = { };
+
+	atomic_inc(&vcpu->arch.pause);
+	__set_bit(vcpu->vcpu_idx, vcpu_bitmap);
+	kvm_make_vcpus_request_mask(vcpu->kvm, KVM_REQ_SLEEP, vcpu_bitmap);
+}
+
+void kvm_resume_vcpu(struct kvm_vcpu *vcpu)
+{
+	if (atomic_dec_and_test(&vcpu->arch.pause))
+		__kvm_vcpu_wake_up(vcpu);
+}
+
 void kvm_arm_halt_guest(struct kvm *kvm)
 {
 	unsigned long i;
@@ -1032,10 +1047,8 @@ void kvm_arm_resume_guest(struct kvm *kvm)
 	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (atomic_dec_and_test(&vcpu->arch.pause))
-			__kvm_vcpu_wake_up(vcpu);
-	}
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		kvm_resume_vcpu(vcpu);
 }
 
 static void kvm_vcpu_sleep(struct kvm_vcpu *vcpu)
-- 
2.47.3


