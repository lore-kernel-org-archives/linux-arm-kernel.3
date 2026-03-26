Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E307710A88E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7bbzsRKofa+D1ELP96YyxtZkqJeM45V3nnaf82sDkQ=; b=EgjqTwKm3n/qJi15u3r4AQfFVy
	xvuaA9QVdmIW62VtwaRp60klFJOysvkpMsoJra4/Sh8aVlB6r81W2Uy4buqLBw5gyzRDW+l6t3hBG
	HCm8ekvt6VDti7rlUPfCbkHaEMTm8jLyWsQZuiXUN2d3h3daJuuxxMBRmbwDai71DJno2wwVSRG8l
	d4BdHpiJTmY83SodeG88jzM8BdtMEE3o3FvqkwH8Z69DDxSNJrsCFEF3QF/CW1nVs+HPeGWlZHFgl
	/zlVDcwQs8StOwnh/2EGiE4iz/nPQGvxTj7huvEq+KAfzSJSu3+PxduL6DyDPAbMGv9NjZAdl3uIl
	IBrCjpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkP-00000005lDT-1JP2;
	Thu, 26 Mar 2026 15:35:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkE-00000005l4F-40VK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5A16445B2;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872E7C2BCB6;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539337;
	bh=CrWdCZA8JdxCY9eF4XTewZwde0WwVr8is3+3aUovL/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b3WpifxGUJ0U+zRraD1mwOcqxlKJxl0XsxXA0UB8dEis2gVni1mDng1sNGNmuypj/
	 sy+90bvZBbuG09nz2KtR75yJsG82uAdDMHCcnHCLExLu4DKK4MYYdvMJCY+d2gKROJ
	 EprjcfFZlfSaTeGbJklAZRrmzkl/FMdj276pBhftxi+3DwKZDmz1+z6OuWhVkScmJj
	 kXMUo9F/jG3GYEpj9daSZZ6yV/vllCWqNgGTpsNovCL3eHp8EHxK5GQhEw1q3beWXd
	 Xy4TikF0MPv+Kds6ps4bNmgdZbCtIoEzCWjiCrJFPG2VGFm1Lz/JMOgs0jPdTXFWue
	 D6kewkfi+c7+w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkB-000000060II-37mF;
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
Subject: [PATCH 07/15] KVM: arm64: vgic-v5: Transfer edge pending state to ICH_PPI_PENDRx_EL2
Date: Thu, 26 Mar 2026 15:35:22 +0000
Message-ID: <20260326153530.3981879-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260326_083539_067930_2813175E 
X-CRM114-Status: GOOD (  12.63  )
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

While it is perfectly correct to leave the pending state of a level
interrupt as is when queuing it (it is, after all, only driven by
the line), edge pending state must be transfered, as nothing will
lower it.

Fixes: 4d591252bacb2 ("KVM: arm64: gic-v5: Implement PPI interrupt injection")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 119d7d01d0e77..422741c86c6a8 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -445,8 +445,11 @@ void vgic_v5_flush_ppi_state(struct kvm_vcpu *vcpu)
 
 		irq = vgic_get_vcpu_irq(vcpu, intid);
 
-		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
+		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
 			__assign_bit(i, pendr, irq_is_pending(irq));
+			if (irq->config == VGIC_CONFIG_EDGE)
+				irq->pending_latch = false;
+		}
 
 		vgic_put_irq(vcpu->kvm, irq);
 	}
-- 
2.47.3


