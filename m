Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D950D1D484
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4XGbvQxR6Y2Lg93Scvku0Dyh8HyJCa6Nib8A2eMBm4=; b=OiJsCHnax9DA4uVksn1ujMMqED
	SU/lsV04ccd3JJ4zB0zebqsK6BoV6PHAcUbwcRKeMZRTOT/cM8vl2WS+eW80+h7GL0ZNmO8sHew/P
	Gf8W+SzyYj/C3Dg0mXnb2yviE5uIVLn/XhAkqAmphRo6JkBLb/4Y7R9m0rz/3UgJambI8YlqIKgN3
	IgFnCnXZgBnLhBe3acV1Ehl5sML2MGbAE85GqLV7elA28T+qtKtz0mvpgbF3CkXNHtVpFUfaooI/v
	DaIesrXVnvKvCAF2yId73UlAiT7k/Jat/0aeCjwhjwUZg1fHF+HO4TX+/aLWusg1Chu+HDkVFbYGC
	rd5gw8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsN-00000000PWp-3uje;
	Thu, 08 Jan 2026 17:32:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsG-00000000POr-02Bj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAD9443A94;
	Thu,  8 Jan 2026 17:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28B9C116C6;
	Thu,  8 Jan 2026 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893558;
	bh=/JUEeryixnEw0K58Sa0URLCommZX+4qzbGxWFFq18eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOW2YZAnkGUMbtnuNKI1vh2waYI6Abc/4RlyqLutWI1o3SoJQbxIjCED3B4apcORD
	 w+NeVHLgUCifDz0LD6g2Laa8qv73U2U+d/iHCIZyWOVMumjyOm6tgbxcL+yDkIpFzE
	 KmY2tw8b+1zoaVqCZw2sIVLY6ExBg1jmfHz73M6idPZl/cE3bCq39FVsC5cxNLzqnc
	 K6Le7tNT5y//gEgks0mCFtvcTtMUa6mL31WIDYtnB/w5RRjz4bX0r1htduwPvqltl0
	 kSXYvVCOWFYrJHoJVmciGkgp2Z3zSEJBrH0DLhMFXWLsAZ9ZkKRXsrJ++3hZsGiJ6U
	 41XU1XTLR+y/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdtsC-00000000W9F-2TZj;
	Thu, 08 Jan 2026 17:32:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v4 1/9] arm64: Repaint ID_AA64MMFR2_EL1.IDS description
Date: Thu,  8 Jan 2026 17:32:25 +0000
Message-ID: <20260108173233.2911955-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108173233.2911955-1-maz@kernel.org>
References: <20260108173233.2911955-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093240_099455_61EB749A 
X-CRM114-Status: GOOD (  11.01  )
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

ID_AA64MMFR2_EL1.IDS, as described in the sysreg file, is pretty horrible
as it diesctly give the ESR value. Repaint it using the usual NI/IMP
identifiers to describe the absence/presence of FEAT_IDST.

Also add the new EL3 routing feature, even if we really don't care about it.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 +-
 arch/arm64/tools/sysreg            | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 3108b5185c204..4db0562f5bfa4 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -134,7 +134,7 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr2[] = {
 	MAX_FEAT(ID_AA64MMFR2_EL1, UAO, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, IESB, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, AT, IMP),
-	MAX_FEAT_ENUM(ID_AA64MMFR2_EL1, IDS, 0x18),
+	MAX_FEAT(ID_AA64MMFR2_EL1, IDS, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, TTL, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, BBM, 2),
 	MAX_FEAT(ID_AA64MMFR2_EL1, E0PD, IMP),
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8921b51866d64..d0ddfd572b899 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2256,9 +2256,10 @@ UnsignedEnum	43:40	FWB
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Enum	39:36	IDS
-	0b0000	0x0
-	0b0001	0x18
+UnsignedEnum	39:36	IDS
+	0b0000	NI
+	0b0001	IMP
+	0b0010	EL3
 EndEnum
 UnsignedEnum	35:32	AT
 	0b0000	NI
-- 
2.47.3


