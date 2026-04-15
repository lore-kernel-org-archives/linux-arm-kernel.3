Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00D8F4199A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8hylrdlZ4KIN3L65a2PXNqR6zyyuGjiuT0CqPhiFRQ=; b=HDmwuLfmxua4Ic9bawxwb5JiKN
	jGOJxGyIZ/qw/jOEZxZ0vRjY+pU8+/Gn9r1tnHntsNoql3yNf/mvyNKa0ydhxcI2RqPYd0nlxR5a9
	v3FA1y3NCBO0+ezZsVjN6SwbheoV4Ug1XZBUIog+h570eJzTsErPvgYhawDDJjgoSGFOohKIdLaUg
	Dky25C2/x4XeAQlnbplMYxw4WIL6bBBlk2u1Nzz8JGO8spIjfxYTyijcP2EGrjYtWnjE5/5Iftr44
	J3J+6YpwJnkBRe6BkDx09iGeAHjhrLKPtlBriD4fZCwg2nhEF0QR/kdgOJsMuglc1VKdwgOznrv/V
	VLBzjB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrL-000000014Pw-2Cy3;
	Wed, 15 Apr 2026 11:56:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrA-000000014Dm-1pPd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Apr 2026 11:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K8hylrdlZ4KIN3L65a2PXNqR6zyyuGjiuT0CqPhiFRQ=; b=QwF2nrRRPDWrNAyQpiJNOXX/c6
	LYSisjIQtqLvBdwL8G8Jga24aF8sSZDPpHXIttYjGCs0ISK75nW/6yVoMjKMeWi91qbUfsf7nEd7v
	sRdskXDQrZ+UtqQ+qPoo9n/PXn8WzidnlrdWoVoSOhYA/BTT03gM/u5z1fd/ET6uDTA1izjhY2LA/
	uDyjYnF7cJgR7qHx6qwLJ7jw14rugK/RqZOMLjcEqp3ChUpip0lSSf2d7pM5X2Fa3K4FnT5HOzevE
	WDg0i0YL5t9x+1NMiML4CIpvNgF0/C0hXkHXX/O6dcrb95Lb3eaebRBDUEryOCGxybrZp6qN+jx9O
	/v8mvk1Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr5-00000002NLJ-0ooB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2604F44592;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC10FC4AF0B;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254183;
	bh=ER28zVe1DmGq8vxHeWqpatHRhR5k442Yw/ftqMPVQ98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLlbW3k9+6o1MJ3vfYxifdiMCEbHhnB8pZTtl8aCfc5op15ZvOSXqapOUx2wBbe3B
	 UrjNeEwcOL3knY9UQnik8j5Dovnc4RQPCj0o4uouy4Qj5SztitnN0aVg+0KKNj8PqR
	 3yQKAM0+vn5GUcZzOv0kyWOh1JrJNxKhqr8hVvxfAveiAzLqN1pfoBW8MGSDZNiG2W
	 at+RUdVNTcijLg1YpVZNYy5YWv9u/DsWycMi9xyQarujbVkuD4Ed5KFLEd4DKppuXV
	 UNYMymREQtJbUyyoVXdRvOUXJVDKw2K8rVh36soMmz4fLMnP9ac0qwhDRD8U6ytLGE
	 yWWaadut0POQg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqy-0000000Bqsi-3sFu;
	Wed, 15 Apr 2026 11:56:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 09/18] KVM: arm64: vgic-v5: Limit support to 64 PPIs
Date: Wed, 15 Apr 2026 12:55:50 +0100
Message-ID: <20260415115559.2227718-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_125627_969658_A540AEBF 
X-CRM114-Status: GOOD (  20.71  )
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

Although we have some code supporting 128 PPIs, the only supported
configuration is 64 PPIs. There is no way to test the 128 PPI code,
so it is bound to bitrot very quickly.

Given that KVM/arm64's goal has always been to stick to non-IMPDEF
behaviours, drop the 128 PPI support. Someone motivated enough and
with very strong arguments can always bring it back -- it's all in
the git history.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v5-sr.c       | 82 ++++++---------------------
 arch/arm64/kvm/sys_regs.c             | 17 +++---
 arch/arm64/kvm/vgic/vgic-kvm-device.c |  9 +--
 3 files changed, 26 insertions(+), 82 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v5-sr.c b/arch/arm64/kvm/hyp/vgic-v5-sr.c
index 47e6bcd437029..6d69dfe89a96c 100644
--- a/arch/arm64/kvm/hyp/vgic-v5-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v5-sr.c
@@ -30,10 +30,9 @@ void __vgic_v5_save_ppi_state(struct vgic_v5_cpu_if *cpu_if)
 {
 	/*
 	 * The following code assumes that the bitmap storage that we have for
-	 * PPIs is either 64 (architected PPIs, only) or 128 bits (architected &
-	 * impdef PPIs).
+	 * PPIs is either 64 (architected PPIs, only).
 	 */
-	BUILD_BUG_ON(VGIC_V5_NR_PRIVATE_IRQS % 64);
+	BUILD_BUG_ON(VGIC_V5_NR_PRIVATE_IRQS != 64);
 
 	bitmap_write(host_data_ptr(vgic_v5_ppi_state)->activer_exit,
 		     read_sysreg_s(SYS_ICH_PPI_ACTIVER0_EL2), 0, 64);
@@ -49,22 +48,6 @@ void __vgic_v5_save_ppi_state(struct vgic_v5_cpu_if *cpu_if)
 	cpu_if->vgic_ppi_priorityr[6] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR6_EL2);
 	cpu_if->vgic_ppi_priorityr[7] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR7_EL2);
 
-	if (VGIC_V5_NR_PRIVATE_IRQS == 128) {
-		bitmap_write(host_data_ptr(vgic_v5_ppi_state)->activer_exit,
-			     read_sysreg_s(SYS_ICH_PPI_ACTIVER1_EL2), 64, 64);
-		bitmap_write(host_data_ptr(vgic_v5_ppi_state)->pendr,
-			     read_sysreg_s(SYS_ICH_PPI_PENDR1_EL2), 64, 64);
-
-		cpu_if->vgic_ppi_priorityr[8] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR8_EL2);
-		cpu_if->vgic_ppi_priorityr[9] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR9_EL2);
-		cpu_if->vgic_ppi_priorityr[10] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR10_EL2);
-		cpu_if->vgic_ppi_priorityr[11] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR11_EL2);
-		cpu_if->vgic_ppi_priorityr[12] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR12_EL2);
-		cpu_if->vgic_ppi_priorityr[13] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR13_EL2);
-		cpu_if->vgic_ppi_priorityr[14] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR14_EL2);
-		cpu_if->vgic_ppi_priorityr[15] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR15_EL2);
-	}
-
 	/* Now that we are done, disable DVI */
 	write_sysreg_s(0, SYS_ICH_PPI_DVIR0_EL2);
 	write_sysreg_s(0, SYS_ICH_PPI_DVIR1_EL2);
@@ -74,9 +57,6 @@ void __vgic_v5_restore_ppi_state(struct vgic_v5_cpu_if *cpu_if)
 {
 	DECLARE_BITMAP(pendr, VGIC_V5_NR_PRIVATE_IRQS);
 
-	/* We assume 64 or 128 PPIs - see above comment */
-	BUILD_BUG_ON(VGIC_V5_NR_PRIVATE_IRQS % 64);
-
 	/* Enable DVI so that the guest's interrupt config takes over */
 	write_sysreg_s(bitmap_read(cpu_if->vgic_ppi_dvir, 0, 64),
 		       SYS_ICH_PPI_DVIR0_EL2);
@@ -108,50 +88,20 @@ void __vgic_v5_restore_ppi_state(struct vgic_v5_cpu_if *cpu_if)
 	write_sysreg_s(cpu_if->vgic_ppi_priorityr[7],
 		       SYS_ICH_PPI_PRIORITYR7_EL2);
 
-	if (VGIC_V5_NR_PRIVATE_IRQS == 128) {
-		/* Enable DVI so that the guest's interrupt config takes over */
-		write_sysreg_s(bitmap_read(cpu_if->vgic_ppi_dvir, 64, 64),
-			       SYS_ICH_PPI_DVIR1_EL2);
-
-		write_sysreg_s(bitmap_read(cpu_if->vgic_ppi_activer, 64, 64),
-			       SYS_ICH_PPI_ACTIVER1_EL2);
-		write_sysreg_s(bitmap_read(cpu_if->vgic_ppi_enabler, 64, 64),
-			       SYS_ICH_PPI_ENABLER1_EL2);
-		write_sysreg_s(bitmap_read(pendr, 64, 64),
-			       SYS_ICH_PPI_PENDR1_EL2);
-
-		write_sysreg_s(cpu_if->vgic_ppi_priorityr[8],
-			       SYS_ICH_PPI_PRIORITYR8_EL2);
-		write_sysreg_s(cpu_if->vgic_ppi_priorityr[9],
-			       SYS_ICH_PPI_PRIORITYR9_EL2);
-		write_sysreg_s(cpu_if->vgic_ppi_priorityr[10],
-			       SYS_ICH_PPI_PRIORITYR10_EL2);
-		write_sysreg_s(cpu_if->vgic_ppi_priorityr[11],
-			       SYS_ICH_PPI_PRIORITYR11_EL2);
-		write_sysreg_s(cpu_if->vgic_ppi_priorityr[12],
-			       SYS_ICH_PPI_PRIORITYR12_EL2);
-		write_sysreg_s(cpu_if->vgic_ppi_priorityr[13],
-			       SYS_ICH_PPI_PRIORITYR13_EL2);
-		write_sysreg_s(cpu_if->vgic_ppi_priorityr[14],
-			       SYS_ICH_PPI_PRIORITYR14_EL2);
-		write_sysreg_s(cpu_if->vgic_ppi_priorityr[15],
-			       SYS_ICH_PPI_PRIORITYR15_EL2);
-	} else {
-		write_sysreg_s(0, SYS_ICH_PPI_DVIR1_EL2);
-
-		write_sysreg_s(0, SYS_ICH_PPI_ACTIVER1_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_ENABLER1_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_PENDR1_EL2);
-
-		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR8_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR9_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR10_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR11_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR12_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR13_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR14_EL2);
-		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR15_EL2);
-	}
+	write_sysreg_s(0, SYS_ICH_PPI_DVIR1_EL2);
+
+	write_sysreg_s(0, SYS_ICH_PPI_ACTIVER1_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_ENABLER1_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_PENDR1_EL2);
+
+	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR8_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR9_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR10_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR11_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR12_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR13_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR14_EL2);
+	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR15_EL2);
 }
 
 void __vgic_v5_save_state(struct vgic_v5_cpu_if *cpu_if)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 4ef13ac0703df..eba3ef793097d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -724,6 +724,7 @@ static bool access_gicv5_ppi_enabler(struct kvm_vcpu *vcpu,
 {
 	unsigned long *mask = vcpu->kvm->arch.vgic.gicv5_vm.vgic_ppi_mask;
 	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
+	unsigned long reg = p->regval;
 	int i;
 
 	/* We never expect to get here with a read! */
@@ -731,21 +732,17 @@ static bool access_gicv5_ppi_enabler(struct kvm_vcpu *vcpu,
 		return undef_access(vcpu, p, r);
 
 	/*
-	 * If we're only handling architected PPIs and the guest writes to the
-	 * enable for the non-architected PPIs, we just return as there's
-	 * nothing to do at all. We don't even allocate the storage for them in
-	 * this case.
+	 * As we're only handling architected PPIs, the guest writes to the
+	 * enable for the non-architected PPIs just return as there's
+	 * nothing to do at all. We don't even allocate the storage for them.
 	 */
-	if (VGIC_V5_NR_PRIVATE_IRQS == 64 && p->Op2 % 2)
+	if (p->Op2 % 2)
 		return true;
 
 	/*
-	 * Merge the raw guest write into out bitmap at an offset of either 0 or
-	 * 64, then and it with our PPI mask.
+	 * Merge the raw guest write into out bitmap, anded with our PPI mask.
 	 */
-	bitmap_write(cpu_if->vgic_ppi_enabler, p->regval, 64 * (p->Op2 % 2), 64);
-	bitmap_and(cpu_if->vgic_ppi_enabler, cpu_if->vgic_ppi_enabler, mask,
-		   VGIC_V5_NR_PRIVATE_IRQS);
+	bitmap_and(cpu_if->vgic_ppi_enabler, &reg, mask, VGIC_V5_NR_PRIVATE_IRQS);
 
 	/*
 	 * Sync the change in enable states to the vgic_irqs. We consider all
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index a96c77dccf353..90be99443df3b 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -730,18 +730,15 @@ static int vgic_v5_get_userspace_ppis(struct kvm_device *dev,
 	guard(mutex)(&dev->kvm->arch.config_lock);
 
 	/*
-	 * We either support 64 or 128 PPIs. In the former case, we need to
-	 * return 0s for the second 64 bits as we have no storage backing those.
+	 * We only support 64 PPIs, so, we need to return 0s for the
+	 * second 64 bits as we have no storage backing those.
 	 */
 	ret = put_user(bitmap_read(gicv5_vm->userspace_ppis, 0, 64), uaddr);
 	if (ret)
 		return ret;
 	uaddr++;
 
-	if (VGIC_V5_NR_PRIVATE_IRQS == 128)
-		ret = put_user(bitmap_read(gicv5_vm->userspace_ppis, 64, 128), uaddr);
-	else
-		ret = put_user(0, uaddr);
+	ret = put_user(0, uaddr);
 
 	return ret;
 }
-- 
2.47.3


