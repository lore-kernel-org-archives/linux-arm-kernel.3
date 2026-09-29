Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA02CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=761I7A620DIiMivjhpQoI4k8SlHoZoMAd4PeC0PUiQY=; b=29feCJHKBj1q12i7Nn8un6Og0+
	Tc3awNCWyNPuBbWswbRBNx4OPzFxsl/3qOxHkVR2oWMc3xOM1lKycpTOleHElWZDbiFxMd86ngx61
	MpmRI5mUd0tTSZI2ZHopfum3p11q80OxR0SWZ+T88yDa/7mTD9L7UIgFBHZ/wuK1692Pr20Ounhov
	dtXg5Fioep9IXWxKeeWMuSKLd8GxwaS4fP91SC7heTJu5RWigddF8jwjCt4oDkb9C8wbQ+fFePJVI
	tVOglLYiw8OTefbCqGx9Coj479f6/oy0feQ6gyAQRs+6twHHKLo3Q6PyTjXTtLv48VSI+8fdyOSxW
	1y3tSbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUGS-00000002yla-00T2;
	Tue, 29 Sep 2026 09:36:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUGQ-00000002yjS-0Wl1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:36:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD3E743A3B;
	Tue, 29 Sep 2026 09:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30121F0089E;
	Tue, 29 Sep 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790674601;
	bh=761I7A620DIiMivjhpQoI4k8SlHoZoMAd4PeC0PUiQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VhAvCZgaZ+hxSfL4kW9OW17OZ6HiMNStPbgmA6T8ivGGw5MTLYLLf7+7e05253tMP
	 1qkWplQao5PfupNnzAB2fObV4Nc8oSp5GZyY2a0wHC+FQs7h7RodKkTlR7NNZA5jfC
	 +flTlDXKa/EP7ZaJt36wsime9lIUCwiY234B/fRun3gQTzT8u9RwrYespqm7QetDOo
	 hB2c5ZcI2xu6l4AFZgNzlbZuD/btv8Ch6pw+zqJtvJT3pCiIAdAm9wFTSVF1u+CiCk
	 3gnWRKN7rOEoHkxjpL/ZuBLWJpJCMP28HKTxUcGG2k1JCa+fB0BWEQbh6MhZQ8/LHa
	 6e2OLal1GrU1A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xBUGN-0000000ElEa-49M2;
	Tue, 29 Sep 2026 09:36:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2 7/7] KVM: arm64: vgic-its: Stop the VM when handling MOVALL
Date: Tue, 29 Sep 2026 10:35:48 +0100
Message-ID: <20260929093548.3598547-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929093548.3598547-1-maz@kernel.org>
References: <20260929093548.3598547-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ndaugoing@gmail.com
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

MOVALL is a royal pain, as it requires us to iterate over all the LPIs
and move them around if they are on the correct source vcpu, and
requiring locking for each of them.

This locking can result in contention for vcpus that enter and exit
the guest, and hinders forward progress. In order to make sure such
process is not contended, just stop the VM altogether.

Nobody in their right mind uses MOVALL anyway, as this is a rather
braindead aspect of the GICv3 architecture.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-its.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index cc02d9b62bd95..094eede267e54 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1382,6 +1382,15 @@ static int vgic_its_cmd_handle_movall(struct kvm *kvm, struct vgic_its *its,
 	if (vcpu1 == vcpu2)
 		return 0;
 
+	/*
+	 * Bulk operations such as MOVALL are a pain, as they can clash
+	 * badly locking-wise with other vcpus entering and exiting the
+	 * guest, should they be affected by it. Stopping the guest is a
+	 * safer bet to ensure uncontended access and ultimately forward
+	 * progress. Yeah...
+	 */
+	kvm_arm_halt_guest(kvm);
+
 	xa_for_each(&dist->lpi_xa, intid, irq) {
 		irq = vgic_get_irq(kvm, intid);
 		if (!irq)
@@ -1394,6 +1403,8 @@ static int vgic_its_cmd_handle_movall(struct kvm *kvm, struct vgic_its *its,
 
 	vgic_its_invalidate_cache(its);
 
+	kvm_arm_resume_guest(kvm);
+
 	return 0;
 }
 
-- 
2.47.3


