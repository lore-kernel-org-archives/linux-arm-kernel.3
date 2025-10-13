Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F00CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDkS7xaFanzLK5fvE4yiUIYEArD3L0x9EQsd1crdhUI=; b=1E3RUpDYLP8fJGei+QMUgDETjI
	N1eL7Mk4SdI4ULV4fPnjASMJURcmQKrJg2s321lGQaV0koOG1oBoOpF9xEefulh58VzYZwzc8TFNA
	DlK/Tld+Z1TINbNsuj5w5MR2Jrl4+0XZAJQs8ANovbWuhcFGW17dVGF8VOlBrlwXQB23djhTiwltC
	MmRD0zpJ0xAaV5uCASwWXlOYRH0/e2GJmBwzUt4bZFwUV0REatqAJlwvxmQuSvw724f/Q+YLVdX1r
	JtIjG9VYDoQZb0VLAP0PzU0ysBoHltLmksqIe23qadwTcqHAJp5umrVggeDIOLDBde8ewOxhdGwAf
	yFGWmk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dyk-0000000CbuH-3Zn2;
	Mon, 13 Oct 2025 08:32:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dyf-0000000CbpR-001P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:32:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3694F454F0;
	Mon, 13 Oct 2025 08:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1677CC116C6;
	Mon, 13 Oct 2025 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760344339;
	bh=e4jSbrTR091qdtjsZD853eW2199IQDEFqqJDuRj7BAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HeRVsr0qs4gBzQ0wAfVSY+ncgi4aRM8Dk5yc9Cf7VYR+S4pKL6MSRGQ7leHdapfn+
	 whqtM1anLGxy3WTA7ExzI5OjYttsLpYeVkEdLtk+S42c6hOcsnR5/KgxEKN9NacffO
	 xOTqSMgS9bOZQCLoLS3GdoSyx4kC7xPCHjIKL/tkHwlyX5rpv/G51Ph5g7wFT0pkza
	 AEDHJ+5f5dJS2GflhsT3NBBR6ZfrimdHamUco8peUSEeqZ67BpK3k9y6WuwLziLOSu
	 pz3sDkw6Ui83+AYP/baQpOeBRLk91gWbfFyKC+jTWD071pm9Rc1tKCYKCSQItkwQXJ
	 1oc9TVjxLvafQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8Dyb-0000000DRrP-0AUh;
	Mon, 13 Oct 2025 08:32:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/3] KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when GICv3 is configured
Date: Mon, 13 Oct 2025 09:32:06 +0100
Message-ID: <20251013083207.518998-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013083207.518998-1-maz@kernel.org>
References: <20251013083207.518998-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_013221_077121_EC94A518 
X-CRM114-Status: GOOD (  11.54  )
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

Drive the idreg fields indicating the presence of GICv3 directly from
the vgic code. This avoids having to do any sort of runtime clearing
of the idreg.

Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 4c3c0d82e4760..2c518b0a4d81b 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -161,10 +161,16 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 
 	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
 
-	if (type == KVM_DEV_TYPE_ARM_VGIC_V2)
+	*__vm_id_reg(&kvm->arch, SYS_ID_AA64PFR0_EL1) &= ~ID_AA64PFR0_EL1_GIC;
+	*__vm_id_reg(&kvm->arch, SYS_ID_PFR1_EL1) &= ~ID_PFR1_EL1_GIC;
+
+	if (type == KVM_DEV_TYPE_ARM_VGIC_V2) {
 		kvm->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
-	else
+	} else {
 		INIT_LIST_HEAD(&kvm->arch.vgic.rd_regions);
+		*__vm_id_reg(&kvm->arch, SYS_ID_AA64PFR0_EL1) |= SYS_FIELD_VALUE(ID_AA64PFR0_EL1, GIC, IMP);
+		*__vm_id_reg(&kvm->arch, SYS_ID_PFR1_EL1) |= SYS_FIELD_VALUE(ID_PFR1_EL1, GIC, GICv3);
+	}
 
 	if (type == KVM_DEV_TYPE_ARM_VGIC_V3)
 		kvm->arch.vgic.nassgicap = system_supports_direct_sgis();
-- 
2.47.3


