Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A0CDDE7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8MmjfWzst7mskG+3asEch7naFBMnFD+Tuz2fl6g6JE=; b=Y3Eo+ae3Ix1aJK/xPFgwA6GuHM
	MGkhEGIG+IOoDS5M8N+mjJm3Uwpn2dO2I885Tva/ERW/mNpN4mGvWAOegWobxxyCTiFJ8BoECTKn2
	LowvpQrDjEoOx5feD8umZS7EzCHXP6BXd0ul8E/GmHcGc8w0R9wIgZeRHQgudEmVzY3lu0le3GyqY
	Hk7cFfDVtzDtMQhpeQhMGHAWqPaRaP3zeiPxvhJTdkfCwasLjZvmo8VGAQJuj/Xd7IrebNeKolac7
	RiP1ygw0Wasac+P9XwXzj+UV5GuF/NzD5pP2p6Mfzwm3bn5NkmGx2QGN1fadrcFHmIyvDJbQVB1qb
	GLWoPhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3d3r-0000000EuK9-365J;
	Wed, 23 Oct 2024 15:14:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckH-0000000EpKl-0sqG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35057A4502D;
	Wed, 23 Oct 2024 14:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29927C4CEE7;
	Wed, 23 Oct 2024 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695234;
	bh=qefyqNxfTd06KWngVuTOytAcncJSMMCvufExwS1FNjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qoO4w8B93+PB/KuOv09sRusKlqy9JlUyM1POjZX1JEqnsHql3OOfbRZoQxnhADHvo
	 WG8M4RG/t9jzbPSVG96l8AW4U1fJeJtTxvC495+QoPL2rnwxuDeez+TzDOzsR9XXmS
	 9XHs8/K67dcZb9YDZzplGaCj0VVeVCY7wvwsZ+S2HAHvX7QZwwATaxJBmAW5AvbnJ+
	 cBPC6N3HI07L11ImuMBYXahfmns+dFG5uWhHGKm0o+E4Uu8vn/Fj3n9CHQR8sbP5TS
	 BycVvcISaDBJCyT5POs4zq9qwN/8szOW17XYRJKatwJxY72m6OWllPXSEOt30qiuc1
	 VER3tpRzemx1g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckC-0068vz-Dd;
	Wed, 23 Oct 2024 15:53:52 +0100
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
Subject: [PATCH v5 14/37] KVM: arm64: Add PIR{,E0}_EL2 to the sysreg arrays
Date: Wed, 23 Oct 2024 15:53:22 +0100
Message-Id: <20241023145345.1613824-15-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_075357_491815_410460D2 
X-CRM114-Status: UNSURE (   9.38  )
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

Add the FEAT_S1PIE EL2 registers to the per-vcpu sysreg register
array.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 2 ++
 arch/arm64/kvm/sys_regs.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ca064af6cac21..1a5477181447c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -471,6 +471,8 @@ enum vcpu_sysreg {
 	TTBR0_EL2,	/* Translation Table Base Register 0 (EL2) */
 	TTBR1_EL2,	/* Translation Table Base Register 1 (EL2) */
 	TCR_EL2,	/* Translation Control Register (EL2) */
+	PIRE0_EL2,	/* Permission Indirection Register 0 (EL2) */
+	PIR_EL2,	/* Permission Indirection Register 1 (EL2) */
 	SPSR_EL2,	/* EL2 saved program status register */
 	ELR_EL2,	/* EL2 exception link register */
 	AFSR0_EL2,	/* Auxiliary Fault Status Register 0 (EL2) */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 514b016d09764..a85f62baebfba 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -135,6 +135,8 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		MAPPED_EL2_SYSREG(FAR_EL2,     FAR_EL1,     NULL	     );
 		MAPPED_EL2_SYSREG(MAIR_EL2,    MAIR_EL1,    NULL	     );
 		MAPPED_EL2_SYSREG(TCR2_EL2,    TCR2_EL1,    NULL	     );
+		MAPPED_EL2_SYSREG(PIR_EL2,     PIR_EL1,     NULL	     );
+		MAPPED_EL2_SYSREG(PIRE0_EL2,   PIRE0_EL1,   NULL	     );
 		MAPPED_EL2_SYSREG(AMAIR_EL2,   AMAIR_EL1,   NULL	     );
 		MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
 		MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
-- 
2.39.2


