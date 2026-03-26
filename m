Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B810A88E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YppUxT16TZ6mdR/tVE12ElPFig8LRvKBwVKRQBfddwQ=; b=3XXzkYVU404Ou/W1xvwI4UsvMD
	RAUjCoRb0BpflHMV/0C8xhYcgHNXBdklb5+tb57mIsPFB+llBvqCSyR/mnpn+bHRT5jQr55zUjeIn
	xMPM6INjwUpxn/BhaMQwsz+pSuJrKSML5vYThk5fem3dpuSM2Jh/BLK1uUaZhw8RPdxZXwyWaTCTV
	qrKxfqrtQa6q1rBhpQnsUSy1G9wlzBJHw+ECn+2jcLlxLn6u7Ksy5bYS+NIjh9Juykrp+qRbBZ7W5
	l2JmwjgMKg1AnHWgADj5KvgcaLyiEwHndI60SJR5obn8bDLDSJIrT5bwmFo9y6/9/wCYfNBDnXN42
	NCyJKIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkO-00000005lCm-3fUq;
	Thu, 26 Mar 2026 15:35:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkE-00000005l4E-3ybp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B16B3446A8;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C404C2BCB4;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539337;
	bh=BRbmzUOJBjqYkQ5YB+hmyXy64v2qULuFBJxfbjyyGRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VI4WsgMAyvo2ow4/RFEWZKHyYZp4RTvpwDfyWPwNxRH0T8UxkIAjVytwiiAOevfw9
	 +v/XYWBCuBjD/JSRHFCmsfzf3x/EXyFeSP2OIwewcqGEO7PL7x4YQl5sa0XBJwT86O
	 ssu/0tsjthkio9FagoBHJ+ppyGR9FDOwhE19hZmNFbggTLY34CnHu1Wr2pVe8RNwpm
	 qbOO1nj12O9Hstzkdx6bs19sxIfux0hsrdinOUJ30L2ZwQ/5jIGEWZJwy3vAiKNLqf
	 OoBM5eLAq/fKmTPjhJkqJ6xccKwWmg9C9foPxJDHyDFBSsxhCoHgvhFyUqMeCpeBhU
	 gcjjWqz0+bupw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkB-000000060II-2BdE;
	Thu, 26 Mar 2026 15:35:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 06/15] KVM: arm64: vgic-v5: Hold config_lock while finalizing GICv5 PPIs
Date: Thu, 26 Mar 2026 15:35:21 +0000
Message-ID: <20260326153530.3981879-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083539_023066_232E5E05 
X-CRM114-Status: GOOD (  13.22  )
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

Finalizing the PPI state is done without holding any lock, which
means that two vcpus can race against each other and have one zeroing
the state while another one is setting it, or even maybe using it.

Fixing this is done by:

- holding the config lock while performing the initialisation

- checking if SW_PPI has already been advertised, meaning that
  we have already completed the initialisation once

Fixes: 8f1fbe2fd2792 ("KVM: arm64: gic-v5: Finalize GICv5 PPIs and generate mask")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 2b6cd5c3f9c2f..119d7d01d0e77 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -172,6 +172,16 @@ int vgic_v5_finalize_ppi_state(struct kvm *kvm)
 	if (!vgic_is_v5(kvm))
 		return 0;
 
+	guard(mutex)(&kvm->arch.config_lock);
+
+	/*
+	 * If SW_PPI has been advertised, then we know we already
+	 * initialised the whole thing, and we can return early. Yes,
+	 * this is pretty hackish as far as state tracking goes...
+	 */
+	if (test_bit(GICV5_ARCH_PPI_SW_PPI, kvm->arch.vgic.gicv5_vm.vgic_ppi_mask))
+		return 0;
+
 	/* The PPI state for all VCPUs should be the same. Pick the first. */
 	vcpu0 = kvm_get_vcpu(kvm, 0);
 
-- 
2.47.3


