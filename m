Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BD3CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj117hR5F7fXljsSTUYiNVx+3hCK+KUesoGBzJj5nSM=; b=L83OMBHehgCACflbLjUvQHbSFl
	PNOUl/j3FzEBPfZBowmI/tQqJLbaKMEykcHlxPD+k6W3A1T8uUztVHrWm17pjaiXJjkp+np/g17uu
	iUmqtnoStNS2PINvSv/N3D4eRUl8qM8qUgR6BFuyMelATQ3M1D4IFMUQP9gpaxmtVi5K8rAaVjKSl
	hQcjDEXd7DwItSFzOPgF0byZv8yEmjG4nqghQo3Zx8MYdSr/o2pathzu8df5anauGWSKhYaeuyuFw
	+1Oq4uP+gusvJLXoKiDHGqcNXlLQNRqJDJFtqgulC669MCW8A9vALFDOxP10JaFA7Amezr/pGbxYE
	eXKzKLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkLV-00000003MnW-279B;
	Fri, 16 Oct 2026 15:59:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkLS-00000003Mku-2pjZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:59:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9E501516;
	Fri, 16 Oct 2026 08:59:42 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 049663F673;
	Fri, 16 Oct 2026 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792166385; bh=1azRP57indFClCcwxXjFmZrHm+gz1WUDbaiw0k9ncPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9x3GfvnJCiIP7VskhZFbK3EILwU1ab/cafP/crdTOiJtLjwiNXtGr9HV5eKxCQI9
	 aWBxLGca6TgMeaTACFswdqjX5tnWP6c5qUrQ3QnDukzoLymbsSHJh7jGTecs+/o3Ve
	 tWIHF1+NTSVW7MvjqSMEdTsQVXKZr6XESdla9Lvo=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	peter.maydell@linaro.org,
	lpieralisi@kernel.org,
	timothy.hayes@arm.com,
	fuad.tabba@linux.dev
Subject: [PATCH 12/16] KVM: arm64: vgic: Move direct MSI support helper to common MMIO code
Date: Fri, 16 Oct 2026 16:57:37 +0100
Message-Id: <20261016155741.979985-13-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016155741.979985-1-sascha.bischoff@arm.com>
References: <20261016155741.979985-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_085946_760400_82E46AE3 
X-CRM114-Status: GOOD (  12.04  )
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

Move vgic_supports_direct_msis() from the GICv3 MMIO code to the
common VGIC MMIO file without changing its behavior. GICv5 will extend
this helper when irq forwarding support is added.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 13 -------------
 arch/arm64/kvm/vgic/vgic-mmio.c    | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index f5e6c1fe52431..9f16e19c25a23 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -38,19 +38,6 @@ u64 update_64bit_reg(u64 reg, unsigned int offset, unsigned int len,
 	return reg | ((u64)val << lower);
 }
 
-bool vgic_supports_direct_msis(struct kvm *kvm)
-{
-	/*
-	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
-	 * indirectly allowing userspace to control whether or not vPEs are
-	 * allocated for the VM.
-	 */
-	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
-		return false;
-
-	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
-}
-
 bool system_supports_direct_sgis(void)
 {
 	return kvm_vgic_global_state.has_gicv4_1 && gic_cpuif_has_vsgi();
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index 755bc2d74c352..44f4a7f33fa3e 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -1142,6 +1142,19 @@ int vgic_register_dist_iodev(struct kvm *kvm, gpa_t dist_base_address,
 				       len, &io_device->dev);
 }
 
+bool vgic_supports_direct_msis(struct kvm *kvm)
+{
+	/*
+	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
+	 * indirectly allowing userspace to control whether or not vPEs are
+	 * allocated for the VM.
+	 */
+	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
+		return false;
+
+	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
+}
+
 bool vgic_has_its(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
-- 
2.34.1


