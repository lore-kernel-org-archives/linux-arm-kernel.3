Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57F1CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzAWroGHIdmdoXl8NVQtp090YEM7bqWnfRxnaV1KkGo=; b=rFQ1G0pa6JBQKvHaddJUBSwG31
	bIvJZNEhdNZqEaNP9q1QDcoU3F98OeM27Us2AbjRMuIKmU20wtOLcGqh8jWSB4WzFL/LiESCQnsAV
	UIb2+a/vHbjnHjS6Wm7QKAyJywPYChdEBK4UUkD37PJUdkyStw9p6rw6dJ1wCJb0lOwRw6DOnW9/6
	CKhdw5PhPlf4t9lWH4yojd2QR5eTThoR+x4m1DvGAmm27trohPSx2LjCiVZy2wS/W2OLngO4FmPCd
	wNbnFGuS4HPKqOd6ZlVo+btL/D5Fs/cPjR7vGsli5hCDpi3Kul49GhnWomjAfrzl68HLVLBsl2cIL
	CuNLez6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRs-0000000Fmgm-2J8l;
	Mon, 17 Nov 2025 09:23:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRq-0000000Fmf1-2xvG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 650B96025C;
	Mon, 17 Nov 2025 09:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6D1C4AF54;
	Mon, 17 Nov 2025 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763370941;
	bh=+pZ+pPRp95id58hrbhMyP0vzhLBregav22mAd+QANho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+gSvDa/ILB+oL4oLhVOqUWWpxfJM273ANBQnV8UYLvu4j1FTyFaxpDRzBhSKYxPg
	 0dfQvBqgEuKo8J35iBU7apZK7g8I828u4H4BMNnbAcut0RmAHfeEoaxF+IDZ+8mWm6
	 eO9F1Ry4pRQA7N9QkaPQWGrdxQJr9nsGy6ILBIyg1LBF56pH1xLn/zzvrUbVB3Bk3s
	 B658/Jpp4OwpeaErpoxKMBpfvUpPkkl2qsfZCLvzkwL3ru16o5vFjU802xDkg4Ocsj
	 SMTjdsGhfBJCo9anhIksF6YKKHlYkb92dQrIYI5XDUr2gxN0YqiL3Q4/xcuy4+A3Kf
	 Wvid+R+QHlSvA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vKvKk-00000005lB2-42Bm;
	Mon, 17 Nov 2025 09:15:39 +0000
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
Subject: [PATCH v3 2/5] KVM: arm64: GICv3: Completely disable trapping on vcpu exit
Date: Mon, 17 Nov 2025 09:15:24 +0000
Message-ID: <20251117091527.1119213-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117091527.1119213-1-maz@kernel.org>
References: <20251117091527.1119213-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

Fuad reports that on QEMU, the DIR trapping is still effective after
a vcpu exit and that the host is running nVHE, resulting in a BUG()
(we only expect DIR to be trapped for the guest, and never the host).

As it turns out, this is an implementation-dependent behaviour, which
the architecture allows, but that seem to be relatively uncommon across
implementations.

Fix this by completely zeroing the ICH_HCR_EL2 register when the
vcpu exits.

Reported-by: Fuad Tabba <tabba@google.com>
Fixes: ca30799f7c2d0 ("KVM: arm64: Turn vgic-v3 errata traps into a patched-in constant")
Closes: https://lore.kernel.org/r/CA+EHjTzRwswNq+hZQDD5tXj+-0nr04OmR201mHmi82FJ0VHuJA@mail.gmail.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index e950efa225478..71199e1a92940 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -243,7 +243,7 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 		cpu_if->vgic_hcr |= val & ICH_HCR_EL2_EOIcount;
 	}
 
-	write_gicreg(compute_ich_hcr(cpu_if) & ~ICH_HCR_EL2_En, ICH_HCR_EL2);
+	write_gicreg(0, ICH_HCR_EL2);
 }
 
 void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
-- 
2.47.3


