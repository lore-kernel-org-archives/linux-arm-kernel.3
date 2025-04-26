Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FD4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giOockGI77ixd86liRhKoot/4LIj0Pm0QMmADlVHtdY=; b=TsPETz3jkwVNfVCIVS67DzL1Qz
	uqnXGrlwOJbIVj3IxPNlCWpTL2AT6ynMeBoKENljUzIc1y7ZXqw2pVhSWU6QvKQ0+9i+xEIoItCtD
	Sq4yRpK5k+eTCuhu9zvBnuq0BizjfHsnUyi21j+9zWgeC4YX/lU8Y01Dm6Afd0rN8RM6UWESZqyRr
	d+SqSHSON/J4XM3fGkN7PqgQNrvG/DecoQLpT8qdyNxjj9dmxSnEknOuYJqmmfJT4ttP6qdgZ08d9
	Oi07Im5V9wob6txiTVaXovyGJmjzLxUz6x9+ePep6HkPveiICPmNP4SX/hZ1HtDB0++jlSnUY033H
	HW1RfhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fIu-000000023eq-1V0Q;
	Sat, 26 Apr 2025 13:10:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeP-00000001z1C-0Z1F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BB474A6F5;
	Sat, 26 Apr 2025 12:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62CAC4CEE2;
	Sat, 26 Apr 2025 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670536;
	bh=LqwKgDJzzrWXnhuECxO/djlAD9kZbExAEmBWQBVwwpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPeQP85jwPSu22aevdCz3XoSElrFM3kAXHU+uf4vUiH4Qc/p8Az/+JJlKWUiDUh5p
	 k1FuKysJRAW3GOPMF0dBFgDRK12NEhAe4gik0+c3sA+q7btCQK01NAy+na8Bi8PS+4
	 x0G/jAb788zdPJmzG40Du5DUE9FUk81BYnIkLYaX7JLoLEIeFjFpsdXLLLUZ1fsQm6
	 EZgXCwPdnaGLDuJvpbqeRiZntwCtu4G/9UvkO3duqMAKJbIEVIonPNJNuqaUaDhypo
	 hsP0CmI77Os0Jhx+vxELS7YU+L4WAMCmMkVLdOEGp3TsJ2hpPH+zYzlh6uuzTlDqEB
	 LpE4yKV6UXTEQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeN-0092VH-1f;
	Sat, 26 Apr 2025 13:28:55 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 23/42] KVM: arm64: Use computed masks as sanitisers for FGT registers
Date: Sat, 26 Apr 2025 13:28:17 +0100
Message-Id: <20250426122836.3341523-24-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052857_218389_71BE88CC 
X-CRM114-Status: GOOD (  12.21  )
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

Now that we have computed RES0 bits, use them to sanitise the
guest view of FGT registers.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 16f6129c70b59..479ffd25eea63 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1137,8 +1137,8 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= HFGRTR_EL2_nS2POR_EL1;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, AIE, IMP))
 		res0 |= (HFGRTR_EL2_nMAIR2_EL1 | HFGRTR_EL2_nAMAIR2_EL1);
-	set_sysreg_masks(kvm, HFGRTR_EL2, res0 | __HFGRTR_EL2_RES0, res1);
-	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | __HFGWTR_EL2_RES0, res1);
+	set_sysreg_masks(kvm, HFGRTR_EL2, res0 | hfgrtr_masks.res0, res1);
+	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | hfgwtr_masks.res0, res1);
 
 	/* HDFG[RW]TR_EL2 */
 	res0 = res1 = 0;
@@ -1176,7 +1176,7 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 			 HDFGRTR_EL2_nBRBDATA);
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2))
 		res0 |= HDFGRTR_EL2_nPMSNEVFR_EL1;
-	set_sysreg_masks(kvm, HDFGRTR_EL2, res0 | HDFGRTR_EL2_RES0, res1);
+	set_sysreg_masks(kvm, HDFGRTR_EL2, res0 | hdfgrtr_masks.res0, res1);
 
 	/* Reuse the bits from the read-side and add the write-specific stuff */
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
@@ -1185,10 +1185,10 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= HDFGWTR_EL2_TRCOSLAR;
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceFilt, IMP))
 		res0 |= HDFGWTR_EL2_TRFCR_EL1;
-	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | HDFGWTR_EL2_RES0, res1);
+	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | hdfgwtr_masks.res0, res1);
 
 	/* HFGITR_EL2 */
-	res0 = HFGITR_EL2_RES0;
+	res0 = hfgitr_masks.res0;
 	res1 = HFGITR_EL2_RES1;
 	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, DPB, DPB2))
 		res0 |= HFGITR_EL2_DCCVADP;
@@ -1222,7 +1222,7 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	set_sysreg_masks(kvm, HFGITR_EL2, res0, res1);
 
 	/* HAFGRTR_EL2 - not a lot to see here */
-	res0 = HAFGRTR_EL2_RES0;
+	res0 = hafgrtr_masks.res0;
 	res1 = HAFGRTR_EL2_RES1;
 	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, V1P1))
 		res0 |= ~(res0 | res1);
-- 
2.39.2


