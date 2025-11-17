Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53850CEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUIxZquQXVtX0uERjRMa8YtmaaoNV1JazioE3K4AHfE=; b=s/6usuY+O53UiFo66MFXojeQ38
	1Vs+CRxgoeiqh/alVEk6l/IFhgovuy6myCQaO+2eE6RW0Zx5I4Ns44gtx8iwO0OLjKfJHor6Yp5AX
	kemP4QYVtrF0mDTDKqMhhqg9+wVrPUzHyOJC/MBB176qN+lvXkLGVT5T96wXuNAMd3nnoXsCnmshB
	rLCw7bgj46JpMXFEIG06DbavSqgfKFQFgxxRuuktp+rDh+JzyE3v0S/jaO3RUILZ8bhv7hdjyMgPN
	qDHx/9IF5ndX266n7tCqlSjXlq6l3ePoRDp6oh+FP/s7lrI6pCAeqPrvrVjwGiZoBPMlhJZcEx6fx
	Yvp9PZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRs-0000000Fmh6-3UYn;
	Mon, 17 Nov 2025 09:23:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRp-0000000Fmek-3uiS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF40E445D7;
	Mon, 17 Nov 2025 09:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4FBC4AF52;
	Mon, 17 Nov 2025 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763370941;
	bh=/C45AVhwxcbfmGnWQDgEhd+JCA1eBfJ8Dc8LALrDDmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSg8Bt0BqSwHhYjQtoje1u+k2RBy8dQ87yR/Bs4uAaCvTmSbtl2ACGRx5E9bHBZk1
	 ohczO2mg4ZRG0C9QsdyOXYcj27qHjdO0vHnpFsHEue/ciNI9dC2PwtZtggDhaXn/KT
	 tXutSYNAQhvusb040UPOeO129XDuezryOM7foVGY2Qd/WCuWjmTkWk9rt36ElzfS7t
	 tWu8JHmrd3Fpm9A12MaTwKDcbnwfY8YSP+gpC/13+r+bTVIue8t5k64SijX2+FjTL7
	 kRfUJjjuV/FySUEio1qHfDa84XGzEcUIsnAPtthtBpnhRaDVlpBt52l5Ok/Ka1DAda
	 P1q7rxg8j76dg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vKvKk-00000005lB2-32gG;
	Mon, 17 Nov 2025 09:15:38 +0000
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
Subject: [PATCH v3 1/5] KVM: arm64: GICv3: Don't advertise ICH_HCR_EL2.En==1 when no vgic is configured
Date: Mon, 17 Nov 2025 09:15:23 +0000
Message-ID: <20251117091527.1119213-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117091527.1119213-1-maz@kernel.org>
References: <20251117091527.1119213-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_012257_988983_81928671 
X-CRM114-Status: GOOD (  10.82  )
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

Configuring GICv3 to deal with the lack of GIC in the guest relies
on not setting ICH_HCR_EL2.En in the shadow register, as this is
an indication of the fact that we want to trap all system registers
to report an UNDEF in the guest.

Make sure we leave vgic_hcr untouched in this case.

Reported-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/r/72e1e8b5-e397-4dc5-9cd6-a32b6af3d739@sirena.org.uk
Fixes: 877324a1b5415 ("KVM: arm64: Revamp vgic maintenance interrupt configuration")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 598621b14a30d..1d6dd1b545bdd 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -26,6 +26,9 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 {
 	struct vgic_v3_cpu_if *cpuif = &vcpu->arch.vgic_cpu.vgic_v3;
 
+	if (!irqchip_in_kernel(vcpu->kvm))
+		return;
+
 	cpuif->vgic_hcr = ICH_HCR_EL2_En;
 
 	if (irqs_pending_outside_lrs(als))
-- 
2.47.3


