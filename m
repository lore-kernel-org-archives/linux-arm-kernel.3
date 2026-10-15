Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E77CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYZtliE6jqQGjnSKE/8fS++RZfkDgdjeis6gl9kgVeY=; b=362Fa80R9uWfgZycYNSRcMxUlO
	h5PoJPbNllJU6FCFTUAtgE9tIzgy+PybA3hAEWPe2BVZnKsumQZ5GIaUqgUy/V38n0jfXgJ035eYf
	NJjXTtztghlRmt1j0OvO+gbyWr3U7+S8se3gOc/osjVLEXpd1TxTYooLpNzQ28Q3Y+y+0+hIO5QYw
	1I6/gx1alktcv0gHsFakclmCYGOxlvC34sBEQIfUcXwMM0d3DPFgq8m+HYwwfqUPweP2zfUuaj4fx
	MI94Xm/ivld/AXlwjjg+xS08VxT09gxt/6WfQxd2EJQe1kIFCSt4li9NPjZzBsFWN05Y8yu+SQHqJ
	FbYKBpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHILO-0000000HNsc-2l7e;
	Thu, 15 Oct 2026 10:05:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHILK-0000000HNqk-0rnt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F24D143C5C;
	Thu, 15 Oct 2026 10:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EE01F000CB;
	Thu, 15 Oct 2026 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058745;
	bh=XYZtliE6jqQGjnSKE/8fS++RZfkDgdjeis6gl9kgVeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OsjQ35gkeRZ6hw66X+lFuG/J1fzbOQ9ia5uYS9ENSDH96RiRkuLoew1zqU4HTx9hy
	 7m/jxCXLO42Q1jtblaUFUv5KH8tCYfsBjElCDEy1TCoNRWizLIOxGkk7SEf8u+FLZ3
	 QKNkbWOxEteOd/jG0mCINpgrxcwh4ej97RrRJdlg8JRCrWH9wRhuBxvs2qEsNXcXNl
	 JHgaTc4DrlIf+guByYrzpRQ8mOjh3mjuyy6muVpsrRat0h/54hc/wVMkv+K8ES23mH
	 9naYX4ZsgAcVIHRBnf56dqx76EmWGMkitYkjb1PwE6QUsJaZgbWHrDbzNZ75PV5/+J
	 JIq7yngDAmocQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xHILI-00000003EfK-0Vlu;
	Thu, 15 Oct 2026 10:05:44 +0000
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
Subject: [PATCH 7/7] KVM: arm64: vgic-its: Stop the VM when handling MOVALL
Date: Thu, 15 Oct 2026 11:05:39 +0100
Message-ID: <20261015100539.1011760-8-maz@kernel.org>
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
index c10a11373e106..a9949ab4e4133 100644
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


