Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7FFCF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLFgq/vTKJ+YwN/uD1UpRjjWq9MY2DAZGhser3A4CS8=; b=vaDf0odfLBJP4zP1qJXnKwrRgw
	Ai/aNWzKcF0sRkxlrpDa3Rit5kkDNJtEnd3AVV5XpOv/cBZATyzQqZDrthTGstnaPX+rL4jRycOfF
	L+tdI5X09Q/sPIv1g1Sw1cmZ8pboLEiPz6EAELlYVT+x70k8WjPrlDIj6zwmknn7ck8SaVLqNBLsR
	7/IXPMHNx5GI+k8hdzLkfCshTzsbKse2SiHtClmGuboP1ZdQ/OBvRaoz0oabqUimAkHSH4yH33han
	lfpHNgxhVfH1ynhGngVsG+BxlQwF4XWz1h+zqwed2FePY/kVY3t9F6Z1LJvdn60GXmvDzXI0atl6x
	k+D2ILpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QO-000000076Kb-2eog;
	Thu, 20 Nov 2025 17:26:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q0-000000075dR-30aq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99655436D4;
	Thu, 20 Nov 2025 17:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E250C4CEF1;
	Thu, 20 Nov 2025 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659564;
	bh=uuXDuGaawaXMBpGfHqc3VPAUhOtcPVebdv2VhuACRvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D8G85O4T5oUURqygPg8xL4mOvnpU1Sp6CEWSVGWzlGv+2l7cb9V/HpHkveNdeDQC4
	 FjBAURz8ozOIZ6IJ9tyvWo/V4VRkp2Tt0yP4QvF2Jr4WUQEt2GRBLTuxMpdvzYmtrk
	 bNzJNjTumeOhtelKSTEPowhA1aoBgwf+FYyfYtWsemrtNeaXlxbBDkPZjTMAzYUj2e
	 3R8iiGEpnI5TVuAIMguDRToL+v9x7Ebxy3gIX8DaCdIDs811PVwSUFnqR3HjY4mwdh
	 7FK/8IREPAjPeeHlQ2eeOTQue79qrzxY0+7sgfpBaaj9i7ICLi/NyQGMEJy3kYT3hV
	 20krSVHL30oJQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Py-00000006y6g-2q5M;
	Thu, 20 Nov 2025 17:26:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 36/49] KVM: arm64: GICv3: Force exit to sync ICH_HCR_EL2.En
Date: Thu, 20 Nov 2025 17:25:26 +0000
Message-ID: <20251120172540.2267180-37-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092604_814452_3DFD8152 
X-CRM114-Status: GOOD (  17.03  )
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

FEAT_NV2 is pretty terrible for anything that tries to enforce immediate
effects, and writing to ICH_HCR_EL2 in the hope to disable a maintenance
interrupt is vain. This only hits memory, and the guest hasn't cleared
anything -- the MI will fire.

For example, running the vgic_irq test under NV results in about 800
maintenance interrupts being actually handled by the L1 guest,
when none were expected.

As a cheap workaround, read back ICH_MISR_EL2 after writing 0 to
ICH_HCR_EL2. This is very cheap on real HW, and causes a trap to
the host in NV, giving it the opportunity to retire the pending MI.
With this, the above test runs to completion without any MI being
actually handled.

Yes, this is really poor...

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c      | 7 +++++++
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 99342c13e1794..0b670a033fd87 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -244,6 +244,13 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 	}
 
 	write_gicreg(0, ICH_HCR_EL2);
+
+	/*
+	 * Hack alert: On NV, this results in a trap so that the above write
+	 * actually takes effect... No synchronisation is necessary, as we
+	 * only care about the effects when this traps.
+	 */
+	read_gicreg(ICH_MISR_EL2);
 }
 
 void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 15e7033a7937e..61b44f3f2bf14 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -94,8 +94,10 @@ static int lr_map_idx_to_shadow_idx(struct shadow_if *shadow_if, int idx)
  *
  * - because most of the ICH_*_EL2 registers live in the VNCR page, the
  *   quality of emulation is poor: L1 can setup the vgic so that an MI would
- *   immediately fire, and not observe anything until the next exit. Trying
- *   to read ICH_MISR_EL2 would do the trick, for example.
+ *   immediately fire, and not observe anything until the next exit.
+ *   Similarly, a pending MI is not immediately disabled by clearing
+ *   ICH_HCR_EL2.En. Trying to read ICH_MISR_EL2 would do the trick, for
+ *   example.
  *
  * System register emulation:
  *
-- 
2.47.3


