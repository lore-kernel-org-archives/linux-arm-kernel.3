Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2CDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFwP+HOkx9OIb4pbH70hLKK+orD7hqcB97ngVQDPmuU=; b=uHPF84YYn9aSEXV9kmS0ZiaPuN
	591US3/MskyUEGX/kBYUWQXqn7dhRJfOPQA41NK3Ia5APkW8peFsElqzBru2KSLUJsUi5/dn7jY9p
	Rda+DO+NfnGNc7V6PxPOd6CyGTRjxpFYoK+OOS5h1BqynKjJUqjUw6j21bjw0GEyiUYSPeRstuGD1
	V4IzpKtrfIq7COen5mPbjQVa3BbSmKOEYkIoFh7hragQFrMN4BZFq7AAbt37JlzsNC6lqpJ5MHNd1
	w3bgMTaxu8uBsG6GilfQaOpmhnKxMiNpApydECocAQyxyMNF9EX7AWcMeP3hBrgzdNI0VBTv4yhy0
	ixdPBIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uck3p-0000000CYyH-2P7F;
	Fri, 18 Jul 2025 12:19:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj0k-0000000CPBj-1XKi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38746A57089;
	Fri, 18 Jul 2025 11:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB32AC4CEF4;
	Fri, 18 Jul 2025 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752837136;
	bh=cX7YrwMk2OOPZPPCwE1KB9e5hHTXFD0hbpP7g6YdzPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJ7kTBPRDROH/KI3582LtM6d9J6KQ0gQsSxx3MEZetOTzsOg8oOzKErcFR6QkQGk8
	 hLzsoTnLHdc68T4VFoAYv9u8ncqD0Zrp7UQ+/HyTlXn4+xOVs7eDjhGg1ixVWUAPj+
	 nlPtloQbq5RXpXPPRG+MGtUkiRgBruqMnvmFN5c9g4eLDEkig+6qp8KPUBQlIDrU/U
	 3kihL/fkb6zb3c7cXhmhgx8TUBx+gJsS4OwphygGGba/tThOxRHhjjBTvIBacVUiKt
	 8YVYNcjrlTmDl1a5UHdXhSSCXgQOB5j5hbAoYVbknDgzUK4a844w5FjPVG0a4N1t1P
	 HaV8jY9Cks8Ng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ucj0g-00Gt2B-Nu;
	Fri, 18 Jul 2025 12:12:14 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 1/4] KVM: arm64: vgic-v3: Fix ordering of ICH_HCR_EL2
Date: Fri, 18 Jul 2025 12:11:51 +0100
Message-Id: <20250718111154.104029-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250718111154.104029-1-maz@kernel.org>
References: <20250718111154.104029-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_041218_473375_20A8375A 
X-CRM114-Status: GOOD (  11.85  )
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

The sysreg tables are supposed to be sorted so that a binary search
can easily find them. However, ICH_HCR_EL2 is obviously at the wrong
spot.

Move it where it belongs.

Fixes: 9fe9663e47e21 ("KVM: arm64: Expose GICv3 EL2 registers via KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic-sys-reg-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic-sys-reg-v3.c b/arch/arm64/kvm/vgic-sys-reg-v3.c
index 75aee0148936f..1850f1727eb93 100644
--- a/arch/arm64/kvm/vgic-sys-reg-v3.c
+++ b/arch/arm64/kvm/vgic-sys-reg-v3.c
@@ -421,8 +421,8 @@ static const struct sys_reg_desc gic_v3_icc_reg_descs[] = {
 	EL2_REG(ICH_AP1R1_EL2, ich_apr),
 	EL2_REG(ICH_AP1R2_EL2, ich_apr),
 	EL2_REG(ICH_AP1R3_EL2, ich_apr),
-	EL2_REG(ICH_HCR_EL2, ich_reg),
 	EL2_REG_RO(ICC_SRE_EL2, icc_sre),
+	EL2_REG(ICH_HCR_EL2, ich_reg),
 	EL2_REG_RO(ICH_VTR_EL2, ich_vtr),
 	EL2_REG(ICH_VMCR_EL2, ich_reg),
 	EL2_REG(ICH_LR0_EL2, ich_reg),
-- 
2.39.2


