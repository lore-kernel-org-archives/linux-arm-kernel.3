Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0077AE7DF1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhKPRQuAR1Cxo/UlnNVFGsbltaNouYhpwEaAHUjFW1U=; b=MqvwHc90lqpAva24xj6iQw4EOh
	43gSmvFaS1FZbqraAK06xVKMCZWOpy0Fsva/x79CP3+QeAKF7wsIp4QUVOwLT6hyROJ9gtGnDkv3K
	fP9CdHPiR8MqwSnI5XyFeZMIWmon7ZTsNo4C1sGNQgrl0oi1ftV7GeUwwyDzcpu5mz+zxB1efL/g0
	ip2d6Kc/jNYyWxT3p1ikq337VfY8LBuO215/oyOkJdCWdgLTsFBeG/nFY/1aDopsJGjMsSrdzkPUL
	RtVuxPTKhmwiq3Iv6V5BMLhLVEBimsUDsOyH0QaaBZDo5Z7kFzscVx4Mkd/ZI6ddwywRJ3fCjrqLp
	NilMfpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytr-00000005R9D-1uez;
	Mon, 02 Feb 2026 18:43:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyti-00000005Qxs-2ASM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E8A4444B1;
	Mon,  2 Feb 2026 18:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E822EC2BCAF;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057822;
	bh=rQfpvN1QW7QzQxpd6omBQ9k+alI4maW0dDTZ/Ir0YqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uIqhwPwsfAvSyZ5L2Nm1G0aLLH2ak3wcEZE5QRt1qZVo+tNuzUHjxdAJtNgJDHQaz
	 FkIhJgxXEOCfGE5DsKH1X+wBmdrNLHkV7iD0febI4PDhorANAeBYDR/KK8XxpHNHIa
	 oLA+ZETonHlYUriv/Der+tKDswsHnW+2tig6SgFvtoFOC6gO4drH9HOC+yuJemtDlK
	 5vcNdDwagsM2YyjY1kor9NtO+FfvrFffPGgHD3NPNKNBlPzgur23BzoVMhsz2wX0fH
	 9ZLWV3KS3MmAllJrLriB78+f+lP4tLi6E34enM2u1rLXt6m4hlzXa268SebNaImmZi
	 qgGvSfhfLg6yw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytg-00000007sAy-0SxB;
	Mon, 02 Feb 2026 18:43:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 06/20] KVM: arm64: Inherit RESx bits from FGT register descriptors
Date: Mon,  2 Feb 2026 18:43:15 +0000
Message-ID: <20260202184329.2724080-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104342_602028_02FA39B2 
X-CRM114-Status: GOOD (  11.43  )
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

The FGT registers have their computed RESx bits stashed in specific
descriptors, which we can easily use when computing the masks used
for the guest.

This removes a bit of boilerplate code.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 2214c06902f86..9ad7eb5f4b981 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1342,6 +1342,11 @@ static struct resx compute_reg_resx_bits(struct kvm *kvm,
 	resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
 				 require, exclude);
 
+	if (r->feat_map.flags & MASKS_POINTER) {
+		resx.res0 |= r->feat_map.masks->res0;
+		resx.res1 |= r->feat_map.masks->res1;
+	}
+
 	tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
 
 	resx.res0 |= tmp.res0;
@@ -1422,47 +1427,36 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 	switch (reg) {
 	case HFGRTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgrtr_desc, 0, 0);
-		resx.res1 |= HFGRTR_EL2_RES1;
 		break;
 	case HFGWTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgwtr_desc, 0, 0);
-		resx.res1 |= HFGWTR_EL2_RES1;
 		break;
 	case HFGITR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgitr_desc, 0, 0);
-		resx.res1 |= HFGITR_EL2_RES1;
 		break;
 	case HDFGRTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hdfgrtr_desc, 0, 0);
-		resx.res1 |= HDFGRTR_EL2_RES1;
 		break;
 	case HDFGWTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hdfgwtr_desc, 0, 0);
-		resx.res1 |= HDFGWTR_EL2_RES1;
 		break;
 	case HAFGRTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hafgrtr_desc, 0, 0);
-		resx.res1 |= HAFGRTR_EL2_RES1;
 		break;
 	case HFGRTR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgrtr2_desc, 0, 0);
-		resx.res1 |= HFGRTR2_EL2_RES1;
 		break;
 	case HFGWTR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgwtr2_desc, 0, 0);
-		resx.res1 |= HFGWTR2_EL2_RES1;
 		break;
 	case HFGITR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgitr2_desc, 0, 0);
-		resx.res1 |= HFGITR2_EL2_RES1;
 		break;
 	case HDFGRTR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hdfgrtr2_desc, 0, 0);
-		resx.res1 |= HDFGRTR2_EL2_RES1;
 		break;
 	case HDFGWTR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hdfgwtr2_desc, 0, 0);
-		resx.res1 |= HDFGWTR2_EL2_RES1;
 		break;
 	case HCRX_EL2:
 		resx = compute_reg_resx_bits(kvm, &hcrx_desc, 0, 0);
-- 
2.47.3


