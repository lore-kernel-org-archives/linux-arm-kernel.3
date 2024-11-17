Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09820D10F23
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR5qTNQd5oJOH/eTCQXL4DH1MfE0XTXwt9TFKnJQc5U=; b=qbS2XKjNvzGDOYWMfRu7LMLjor
	rkRIVLW9oUbyApcqu5xKkw39GdeJMY04940jwyWJygVvW1ISzrItaZqhG26Wi6b+wjKVVBJOgJYxs
	6B/SOYUxpQawnDmG6m1fvKp6ljGacKQ4hauj+BOWgG22i5sZuqxFeKqDO/zu+U4WlsddcXNZcg5GL
	B8xg9nPY2zwnSUPsgSecUi5qvnZq0CRAqaNRoGOrxg+hPM6806AMlH6I47ikyoUM/Zs38Kw5si0mW
	YgSo9N8EF7+ZrVMDxShv7zsF96Ozek9r34fAXJcYvxbwtJ511O1+Bxcz03e6LLhDBLZCK8j5K62oL
	D1tI3dcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCifb-00000007aia-04lG;
	Sun, 17 Nov 2024 17:02:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCib7-00000007aGo-1Ylr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 16:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F2E8A41032;
	Sun, 17 Nov 2024 16:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BFEC4CEDB;
	Sun, 17 Nov 2024 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731862683;
	bh=9zNkXkUqhiT4/4QyOrzhcl3PWYD7D6JifJQs9H3zeIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AlNehxc/o8WzdofOWsZ/cIeq3vaojCfLGcp20Mzm0YNYqI8cIV0OvB0WB46+tcALp
	 oOjt+VLaZjMWKVSHrgYYv95+qPRNKCPzCOHgxPoJ4SuR4loLoeNTQG4Ee9+3cxUtsi
	 Y+qp+6pNZ2hgUkI0If7J5yQKBf2ciOltQvPXBbphfaR7i7pGSNxByy1vjGBy+CtiuP
	 VGGJHBnbju40KI82rc/RMUX3oCqHdQkdPPrbCvu/2VHCTohOGLy+Fg0myjhx25eglX
	 z53Dhp88dV9/umJTxyfQALkTSMalFl2BVmL/8XmNvQIIfIjsuH0zzIFqXP4I1U/BLy
	 Okhl6FhOrP6SQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tCib3-00DYt6-C7;
	Sun, 17 Nov 2024 16:58:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexander Potapenko <glider@google.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] KVM: arm64: vgic-v3: Sanitise guest writes to GICR_INVLPIR
Date: Sun, 17 Nov 2024 16:57:54 +0000
Message-Id: <20241117165757.247686-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241117165757.247686-1-maz@kernel.org>
References: <20241117165757.247686-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, glider@google.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_085805_499402_1C38C29F 
X-CRM114-Status: GOOD (  11.31  )
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

Make sure we filter out non-LPI invalidation when handling writes
to GICR_INVLPIR.

Fixes: 4645d11f4a553 ("KVM: arm64: vgic-v3: Implement MMIO-based LPI invalidation")
Reported-by: Alexander Potapenko <glider@google.com>
Tested-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 9e50928f5d7df..70a44852cbafe 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -530,6 +530,7 @@ static void vgic_mmio_write_invlpi(struct kvm_vcpu *vcpu,
 				   unsigned long val)
 {
 	struct vgic_irq *irq;
+	u32 intid;
 
 	/*
 	 * If the guest wrote only to the upper 32bit part of the
@@ -541,9 +542,13 @@ static void vgic_mmio_write_invlpi(struct kvm_vcpu *vcpu,
 	if ((addr & 4) || !vgic_lpis_enabled(vcpu))
 		return;
 
+	intid = lower_32_bits(val);
+	if (intid < VGIC_MIN_LPI)
+		return;
+
 	vgic_set_rdist_busy(vcpu, true);
 
-	irq = vgic_get_irq(vcpu->kvm, NULL, lower_32_bits(val));
+	irq = vgic_get_irq(vcpu->kvm, NULL, intid);
 	if (irq) {
 		vgic_its_inv_lpi(vcpu->kvm, irq);
 		vgic_put_irq(vcpu->kvm, irq);
-- 
2.39.2


