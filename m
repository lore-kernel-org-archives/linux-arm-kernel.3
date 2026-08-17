Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A168C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTiXc1JtkpqJlEC/momRTKpF5PWMWM/1EcnbgRAUwHY=; b=YxTly2FhU80bluA1p9ImVC8k/c
	ZvTn2QvcsYMz6gh389i8fYHQ3OWm3PNiVd4vSO9yFr97mV/+G/qn06sWP254rdKNtnWzdX1B4G23P
	a/MQd4Srd5gLKT1gUILgmmtjSP3viCrQHLinaITFiCLk3aoiryM2LVhcLKNQETC0t4s3EOyA5+VMn
	SuyVLwXiaXQyDUF7ICtUdBpIvKwwWn1QwlM115WRUNgF9fc/jKu4FHrzAjtS8oYeHWmUOlAGKsr2e
	uGSvYgF+Je1etD/l9T/BaAWvsQjYX6VEKC1isnWXDudNoIqK0C7Ybj9+ursRYBjFgKvz5mnLteBka
	i/4L+SCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvue2-00000005vzv-0UUx;
	Mon, 17 Aug 2026 10:32:42 +0000
Received: from out-156.mta1.migadu.com ([2001:41d0:203:375::9c] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvudz-00000005vy6-1iCn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:32:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=iOgWnCEhDGyg56J6gm4nwCS3dgCjFHT30oB0fu9Wrzc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786962757; v=1; x=1787567557;
 b=P0hIBph8QvyowagfkE397x6s/R4i/4IuIugcN9foyvrA00O1OFkjuz4YdnxnxKIfCbprQoRt
 R/5jYwS5xKPhlUZqQLz/ARWELJPusR9nnaLI/3nZS7kyq7Onui07FfZUVOe+1K9RVj3KpWX4TmE
 AgZNq6Sx4+cqmLlka2c7Opv4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 0a54397236c5e6e6;
	Mon, 17 Aug 2026 10:32:37 +0000
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Subject: [PATCH v2 1/4] KVM: arm64: Validate the host-provided vgic model in pKVM
Date: Mon, 17 Aug 2026 11:32:25 +0100
Message-Id: <20260817103228.1203140-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260817103228.1203140-1-fuad.tabba@linux.dev>
References: <20260817103228.1203140-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_033239_635106_D83D9C67 
X-CRM114-Status: GOOD (  11.65  )
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

EL2 copies vgic_model from the host's struct kvm unchecked, and the nVHE
world switch dispatches on it with no cpucap guard. A host writing
KVM_DEV_TYPE_ARM_VGIC_V5 makes EL2 access GICv5 CPU interface registers,
which are UNDEFINED without FEAT_GCIE and panic the hypervisor on any
GICv3 machine.

Accept only GICv3, the one model pKVM supports, forcing anything else
to 0.

Fixes: 9b8e3d4ca0e73 ("KVM: arm64: gic-v5: Implement GICv5 load/put and save/restore")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 24d6f164129ac..f41b92c50ad7d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -340,13 +340,20 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 {
 	struct kvm *kvm = &hyp_vm->kvm;
 	unsigned long host_arch_flags = READ_ONCE(host_kvm->arch.flags);
+	u32 vgic_model = READ_ONCE(host_kvm->arch.vgic.vgic_model);
 	DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
 
 	/* CTR_EL0 is always under host control, even for protected VMs. */
 	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
 
-	/* Preserve the vgic model so that GICv3 emulation works */
-	hyp_vm->kvm.arch.vgic.vgic_model = host_kvm->arch.vgic.vgic_model;
+	/*
+	 * GICv3 is the only model pKVM runs, and the GICv5 world switch
+	 * touches registers UNDEFINED at EL2 without FEAT_GCIE. 0 is not a
+	 * valid kvm_device_type: "no vgic".
+	 */
+	if (vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
+		vgic_model = 0;
+	hyp_vm->kvm.arch.vgic.vgic_model = vgic_model;
 
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
-- 
2.39.5


