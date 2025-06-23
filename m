Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6B3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLS0jqGrb3MS8d9+Zqocfz6+iEasSrP5hi+kiaqEmQE=; b=iJiAnPActwEZgzTEKKZOfp8bwz
	8zOy1yIv0IVKN4DnHGN6fvpmIGMJlUPeZt+73bq47z8VpRg4+rXklCnvbSfAfEWuE6RQNTYOGHk9a
	ajdXBnYLXh5P3XNrxA0az3EqJrpPNgVp9JgeL6CJF9OQjOiV/j1ip2KhrVajU7jJgqqYjXYaBxxDR
	H8p8qaqJ4lzKxOdjJaXzEXFh51D4CyRpgrKr1Box+4vVdkgsQgsBLRYgVVPzirEUpp0ycA8IPiLGa
	wJ6JJUF32Lp1M90c78rgwHb6HinAAqOMqNBM9zxzxRW7WaLoCAcpdtn6glNGvTR2e/v2xQOtmDomD
	3GphCCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkV7-00000003Un6-2oOH;
	Mon, 23 Jun 2025 16:58:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThCi-00000002sDE-3AXy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 13:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=tLS0jqGrb3MS8d9+Zqocfz6+iEasSrP5hi+kiaqEmQE=; b=ecprC0BeB4NxOfTFqXpdgg1LEM
	5eXgD9f0C3XYq+pHcYoq7Ztl/bJbw5L9Ch82IPn1W2+iVqy2FpMiHLpJjsRJn3bdhg1fDd9N3wJkh
	mJTSuhvs45tGnJfLS5od6lE4qCOKvDGKgmLoT9QPOivFufL4Qto8OSTjbV99CmbqR1AvmpewxgC3T
	psnj+n7fKFLeFmMh1AxIr+lMPltlUZG2lQkWFny+SguVW32kM/5bqVwBLDlE3DBfRl20ZrrcIH5ER
	3kUZe24CFUFJlR4w1QiNfiX34Lbnumd3K2za9rylJ5nk5SDruYpFlogA1Moq4wsFnomxa51OEmwg7
	5CFdaX2Q==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThCe-00000005Du5-1SQN;
	Mon, 23 Jun 2025 13:27:16 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uThCc-000000043AO-2kz9;
	Mon, 23 Jun 2025 14:27:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [RFC PATCH 2/2] KVM: arm64: vgic-its: Unmap all vPEs on shutdown
Date: Mon, 23 Jun 2025 14:27:14 +0100
Message-ID: <20250623132714.965474-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623132714.965474-1-dwmw2@infradead.org>
References: <20250623132714.965474-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

We observed systems going dark on kexec, due to corruption of the new
kernel's text (and sometimes the initrd). This was eventually determined
to be caused by the vLPI pending tables used by the GIC in the previous
kernel, which were not being quiesced properly.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm64/kvm/arm.c          |  5 +++++
 arch/arm64/kvm/vgic/vgic-v3.c | 14 ++++++++++++++
 include/kvm/arm_vgic.h        |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 38a91bb5d4c7..2b76f506bc2d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2164,6 +2164,11 @@ void kvm_arch_disable_virtualization_cpu(void)
 		cpu_hyp_uninit(NULL);
 }
 
+void kvm_arch_shutdown(void)
+{
+	kvm_vgic_v3_shutdown();
+}
+
 #ifdef CONFIG_CPU_PM
 static int hyp_init_cpu_pm_notifier(struct notifier_block *self,
 				    unsigned long cmd,
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index b9ad7c42c5b0..6591e8d84855 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -382,6 +382,20 @@ static void map_all_vpes(struct kvm *kvm)
 						dist->its_vm.vpes[i]->irq));
 }
 
+void kvm_vgic_v3_shutdown(void)
+{
+	struct kvm *kvm;
+
+	if (!kvm_vgic_global_state.has_gicv4_1)
+		return;
+
+	mutex_lock(&kvm_lock);
+	list_for_each_entry(kvm, &vm_list, vm_list) {
+		unmap_all_vpes(kvm);
+	}
+	mutex_unlock(&kvm_lock);
+}
+
 /*
  * vgic_v3_save_pending_tables - Save the pending tables into guest RAM
  * kvm lock and all vcpu lock must be held
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 4a34f7f0a864..e850ee860238 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -442,6 +442,8 @@ int vgic_v4_put(struct kvm_vcpu *vcpu);
 
 bool vgic_state_is_nested(struct kvm_vcpu *vcpu);
 
+void kvm_vgic_v3_shutdown(void);
+
 /* CPU HP callbacks */
 void kvm_vgic_cpu_up(void);
 void kvm_vgic_cpu_down(void);
-- 
2.49.0


