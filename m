Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EBBCDDE7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AJP3Cnxr/BCcEHK8/9xQxjiZr3g8Idmg94tyWkccAo=; b=tV1vK0P57d1Mz6LJEX7VcEMPPP
	Z2TbrV1dThZdrW4xhWH/8Ps7XrUqv7SIGkBRIqcF9dH3CiJSimkKsF4DbdFENMlraffTIB3MJgloP
	rexaJl3bgVoS8D9Q2P+tUfdNMNxaRcHerT7szeggsTzPs5gT6u+N9mSgd81WL4KNv1Yb1ALrERqWQ
	whRKjkJfjW6Br5E5kYTdPTmoCwJ9A5nJMyU+TZkpjlovsffaKw39oWzHqBgOeIJYFYMtIX6XnCNkd
	FO/d3Ajp1xYH0RqEW63dr1dTTUwBKSywDa3Vj8ypacIX6NkhyH++UZ4Pv6sT4uCy4LdyXfkyvsVDP
	hgFflkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3d8O-0000000EvUL-3B9w;
	Wed, 23 Oct 2024 15:18:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckI-0000000EpMA-2Jqz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28A9B5C5E8B;
	Wed, 23 Oct 2024 14:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C03C4CEE5;
	Wed, 23 Oct 2024 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695237;
	bh=8W7GYB/MhzBoRpu54iRYPqYWO2XTNA2bzwt8/xeYfm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tL70LC6q+hfZ1ZCsbZDoNUEx6vC4AHrvNEK8/SGns1Zr6m6XDh5jQlplKNDEwgoi3
	 Cpq5C0PqreY2vyYsw3Djk1suX0tO4cIhj0Cm1w0GlOqQoWiTI9Vs1cVNQK3OvppHyj
	 c+qTLqcej10icZOeTb+J4K9OHtLnISqbxRMMXmVxSFX/Rc0BRsYpQpGDjT207aA4CL
	 ElCmpCQa9mio2n3rcm5pVzGRjo6osW5KO7btXy6XH0RxuZJbdGq2KR+vYhXkSnpkgJ
	 iL/hCG/rmxLsKtPclWynYEyZx9w0KoV5bUhsx45p8qcCWTLV0xzaQaIOEXhyX1GLP0
	 gqybFiu/jNUaA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckF-0068vz-I6;
	Wed, 23 Oct 2024 15:53:55 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 29/37] KVM: arm64: Subject S1PIE/S1POE registers to HCR_EL2.{TVM,TRVM}
Date: Wed, 23 Oct 2024 15:53:37 +0100
Message-Id: <20241023145345.1613824-30-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075358_800383_D3A7F135 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

All the El0/EL1 S1PIE/S1POE system register are caught by the HCR_EL2
TVM and TRVM bits. Reflect this in the coarse grained trap table.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index ddcbaa983de36..0ab0905533545 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -704,6 +704,10 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_MAIR_EL1,		CGT_HCR_TVM_TRVM),
 	SR_TRAP(SYS_AMAIR_EL1,		CGT_HCR_TVM_TRVM),
 	SR_TRAP(SYS_CONTEXTIDR_EL1,	CGT_HCR_TVM_TRVM),
+	SR_TRAP(SYS_PIR_EL1,		CGT_HCR_TVM_TRVM),
+	SR_TRAP(SYS_PIRE0_EL1,		CGT_HCR_TVM_TRVM),
+	SR_TRAP(SYS_POR_EL0,		CGT_HCR_TVM_TRVM),
+	SR_TRAP(SYS_POR_EL1,		CGT_HCR_TVM_TRVM),
 	SR_TRAP(SYS_TCR2_EL1,		CGT_HCR_TVM_TRVM_HCRX_TCR2En),
 	SR_TRAP(SYS_DC_ZVA,		CGT_HCR_TDZ),
 	SR_TRAP(SYS_DC_GVA,		CGT_HCR_TDZ),
-- 
2.39.2


