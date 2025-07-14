Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43815C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2df5CgaiNSOSJQI830/3U6ZG30WtGqUHs7qhXV+f4I=; b=4wPitdWHFeamKiChlD1yAwm+2D
	uWJXpMwWOsGKBSl++1WLvzlU7gbCCqIdBSEcC4Lr3MaAbZAqF3ug+xKUcsdcKRTyliwsPrigqMU7r
	3LhgZ8PfiWxwh47ZMMU5HW5uAWkmIwY8n3UTt05GyzwoDASQU3IvXsLhAdjCEU0gxUG5OuLSbKCKS
	cfiJECv5axphnfauoIHR3pfyp4VicoJtz3kz7hldtrV61hM7garELMTqo5eQcAY941PKhKlgo7pqH
	naznjwc8a4S31F0l3J7f9CgLtGWpAA4Cm06gjGqjZ5ILDhqxoP/1lzpTNCMiBPbHnWPUHKfpB+orV
	fy1LscmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIWF-00000002CAW-32qM;
	Mon, 14 Jul 2025 12:42:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGa-000000029ik-36q3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17ED8A57051;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B829CC4CEF4;
	Mon, 14 Jul 2025 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496003;
	bh=XJ3TrLkRrj+mRM4a05rezAW0AfRDUsAnmqyYGIp/zo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGf8nvMIT1Y+ULXRFOQtOVCAZOMDYpRBBzwunh1brBIxQr77cyJ4kREqBg7KuS6wu
	 539OvS8hhG5l95dNZrOSg3lOfITd/XOmbkcmwGe/Do30+83JWcYJsHdXe3luBFxoUm
	 MarVEmngnl9xHyuaATBqH2wUvjq5nujk0rxU4QcpCD4CW4sBeKi9CQg0c79P5Mf03z
	 puoFhUXFbnKn13feK61ypmFBF4pgTB+ST8X13RBA8t8P+DNZpbnJPNanSqhgpHOMun
	 LSVnWKUlbL+2R8utE1JiQ1aGf8g52kjey7wWD9BcNrc7ZiRhAoPudw4z761nH8k+9L
	 BEtTiFkx0GdZw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGX-00FW7V-Qh;
	Mon, 14 Jul 2025 13:26:41 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 01/11] KVM: arm64: Make RVBAR_EL2 accesses UNDEF
Date: Mon, 14 Jul 2025 13:26:24 +0100
Message-Id: <20250714122634.3334816-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714122634.3334816-1-maz@kernel.org>
References: <20250714122634.3334816-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052644_858222_C63B0E56 
X-CRM114-Status: GOOD (  10.43  )
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

We always expose a virtual CPU that has EL3 when NV is enabled,
irrespective of EL3 being actually implemented in HW.

Therefore, as per the architecture, RVBAR_EL2 must UNDEF, since
EL2 is not the highest implemented exception level. This is
consistent with RMR_EL2 also triggering an UNDEF.

Adjust the handling of RVBAR_EL2 accordingly.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f8..3f226cd5b502e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -108,7 +108,6 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		PURE_EL2_SYSREG(  HACR_EL2	);
 		PURE_EL2_SYSREG(  VTTBR_EL2	);
 		PURE_EL2_SYSREG(  VTCR_EL2	);
-		PURE_EL2_SYSREG(  RVBAR_EL2	);
 		PURE_EL2_SYSREG(  TPIDR_EL2	);
 		PURE_EL2_SYSREG(  HPFAR_EL2	);
 		PURE_EL2_SYSREG(  HCRX_EL2	);
@@ -3370,7 +3369,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_MPAMVPM7_EL2), undef_access },
 
 	EL2_REG(VBAR_EL2, access_rw, reset_val, 0),
-	EL2_REG(RVBAR_EL2, access_rw, reset_val, 0),
+	{ SYS_DESC(SYS_RVBAR_EL2), undef_access },
 	{ SYS_DESC(SYS_RMR_EL2), undef_access },
 
 	EL2_REG_VNCR(ICH_AP0R0_EL2, reset_val, 0),
-- 
2.39.2


