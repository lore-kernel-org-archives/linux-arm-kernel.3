Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A194BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CHQt4V4R0sEws0sxSIt05t6olkTlAE2lbHxNrSnph2U=; b=of5LCiu5XuEbtBbNU8ZuJeG7bg
	FmNLlyK3Js0FOF5hR4jnsz7uhyuggiAYU7tX4GEvPwI6DW4dK0wZfQeghGctnsMKdAd4iO5B/la+M
	YVdPSVwp2a+W9xNJ1pNbeAYCh0OFbdeTE/OkWFYaDLLijHna6VJ0vgnjrCEuy8ySvbisa7YPmtlv1
	in4v7OVD8bA1p5zqn4/2rc0Y5bEdmUvnGGFX7/Rk+57/jv+PKqo4sshqziMqLujvOfIyBAJiZnIyY
	7yeOMmwqdY8QPCAhm2r7gRX3n31kkRRkTW1m/tzDOp830jLDUqljg4SwRTg4fNdMcSrCYtVUS/syB
	5mtIEarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIViz-00000005u9Z-2KSw;
	Mon, 10 Nov 2025 17:30:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIViw-00000005u9G-12qI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 581EA601BD;
	Mon, 10 Nov 2025 17:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED17BC116D0;
	Mon, 10 Nov 2025 17:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762795837;
	bh=Oj/DqEQrV3Z259MuriU+WvexyYI+Pm4QRY0TAayDktc=;
	h=From:To:Cc:Subject:Date:From;
	b=p7ZvE2yOSxPMxI9k96VnPKPody/hqdXDOjY4pOxW9QPZv0XhGbpvv4KbOK1eUbOkK
	 Ha4GUAsyRsnA2/us3FNs2OpzXg5CoEi1/IKlpitwQ3rQOyKgso3qmENI3+L2SLywkD
	 B823d/1BQy5cb6ndVOW7sUMK8/V8IKZbqQu+51QvCrGOcxFRCHQMELROYB4mD3iBPb
	 itRF6bLq4dmVIQJ2VGiPkpA1Rj15+ExgXjwAV3NiwYbIZKahslYR5peo05FHWLpNyl
	 qOcVyDNRnvVIqryUi1QyHB0XF3IIhSW+ihHBi0YPA98fmXI9KrY7QlqYjoXTtghHi4
	 EAQopUty1q+tg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vIVis-00000003xP9-2G1B;
	Mon, 10 Nov 2025 17:30:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] KVM: arm64: Finalize ID registers only once per VM
Date: Mon, 10 Nov 2025 17:30:10 +0000
Message-ID: <20251110173010.1918424-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, broonie@kernel.org
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

Owing to the ID registers being global to the VM, there is no point
in computing them more than once.  However, recent changes making
use of kvm_set_vm_id_reg() outlined that we repeatedly hammer
the ID registers when we shouldn't.

Gate the ID reg update on the VM having never run.

Fixes: 50e7cce81b9b2 ("KVM: arm64: Limit clearing of ID_{AA64PFR0,PFR1}_EL1.GIC to userspace irqchip")
Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
Closes: https://lore.kernel.org/r/aRHf6x5umkTYhYJ3@finisterre.sirena.org.uk
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3bf7005258f07..19afcd833d6fa 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5624,7 +5624,11 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 
 	guard(mutex)(&kvm->arch.config_lock);
 
-	if (!irqchip_in_kernel(kvm)) {
+	/*
+	 * This hacks into the ID registers, so only perform it when the
+	 * first vcpu runs, or the kvm_set_vm_id_reg() helper will scream.
+	 */
+	if (!irqchip_in_kernel(kvm) && !kvm_vm_has_ran_once(kvm)) {
 		u64 val;
 
 		val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1) & ~ID_AA64PFR0_EL1_GIC;
-- 
2.47.3


