Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0403C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SAil781b+ignDHnziQ7YQ7stwv2I2Uc2jhfRJsoP/Y=; b=ywICWEBwZwWbK1/t4a0QvGBEqG
	P586F59W5zEZgwXmaDmcN++HIymc+OreC8B7i14IuQTT0MTTgmG+CI8ln42NwUqACEMYGwqU0700/
	DpWwg9Kc6JXY0u/CpEV1KeUWt5swjRkRosRdzQY7f0UIgOv5PrJDnIilV5xGrVAn1Za/8T5b52oHe
	UO9WVMpRBK4++izcJB7i0umdVra8F6hdXKswYSG7w7oyjfc+BgixREoQZNWgyIysciFjWnmqkCpmt
	r/rV+Di/75nQMHUgdzy3zoTnE+itydzkq/lfOx+XmU/lpprr/Odnm5kCmZeN71jxfnMsnGg5m9N4A
	oCQa49CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMIt-00000000WlK-3yjJ;
	Sat, 15 Feb 2025 17:50:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7V-00000000Uqe-04Jj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0895C5C4906;
	Sat, 15 Feb 2025 17:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B04C4CEE4;
	Sat, 15 Feb 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641104;
	bh=XuMX9D51rOvDLqugXxKyuaKFZB0IP1O1SmRry/eT/uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WvHKozjea013rJ5CdYymCIVcomvPnzedyhCWg+IFXMlR5hleGEXLFFZS8W211fmbQ
	 nF7vJdiPsEysLCxJoUsb+mE0gzElLPRDbvAMg51XuHVcKRQ2IYdTwxb2Fmw4WdS+6d
	 ys97uUvr/G+cTQ+1Nbbdf/+GpuGPTkn4TT5ZKtFsTAzJWwgW3TLSU4y3TLaBvsc8nt
	 VTZ1srnGkkGHyFaTEVEHdAJfCJszhVKns9Rg1Kt+npGULYFuKW9Lva2Il2Iv62uvCK
	 fKwOxCaWsMqY0Bc1goy2H7UkPNUXvt3Vjb0SRav2VywPsD2+QCWeQ1oLvxyolAQEzA
	 8WvCNQPC96oyw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7S-004Pqp-E4;
	Sat, 15 Feb 2025 17:38:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 11/14] KVM: arm64: Make ID_AA64MMFR4_EL1.NV_frac writable
Date: Sat, 15 Feb 2025 17:38:13 +0000
Message-Id: <20250215173816.3767330-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093825_097097_9BEA8578 
X-CRM114-Status: GOOD (  11.08  )
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

We want to make sure that it is possible for userspace to configure
whether recursive NV is possible. Make NV_frac writable for that
purpose.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c1e050a58fb2e..db7c4e791b99c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2669,7 +2669,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_WRITABLE(ID_AA64MMFR3_EL1, (ID_AA64MMFR3_EL1_TCRX	|
 				       ID_AA64MMFR3_EL1_S1PIE   |
 				       ID_AA64MMFR3_EL1_S1POE)),
-	ID_SANITISED(ID_AA64MMFR4_EL1),
+	ID_WRITABLE(ID_AA64MMFR4_EL1, ID_AA64MMFR4_EL1_NV_frac),
 	ID_UNALLOCATED(7,5),
 	ID_UNALLOCATED(7,6),
 	ID_UNALLOCATED(7,7),
-- 
2.39.2


