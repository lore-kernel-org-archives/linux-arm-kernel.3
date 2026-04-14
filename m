Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA01F531CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 00:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=benOn9LBj7v8ilS4dNoqkKSPj7qth7jV5m24asJKWUg=; b=j8VfkAXWHP7zrva7xxWwAUytYo
	3sLKtZ2iaOeCc2EGzuGXekuJLmSFK0ibRqnJGGZimEx9BYRd/0iQN9gVePdX23IxisXpiM5Fc7CGo
	d6H3pDyLzTxDcPeY+MNcHbkLibX0l/DHlEWGyFtZGY5Faj+Ku/VHNTHlxVBfkFJ03c84bjao5Vnxn
	AGBanjeLoCQI9XyP59HffLbj5dkfFVhr2pPCl8Btk1Whw1cHJow4EExOZPcU2aUpqgNMog5MTNAx1
	PkW5wuL3QmeFmt2RnDpsqqtZ2WrgnmlYmMtpR7Y9srwmHEkXquqXFRQ+gZuaZMiESF6Bd5DWiREC4
	6ml+7ztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRGB-0000000GVK1-42zW;
	Tue, 14 Apr 2026 00:04:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRG9-0000000GVIf-1Rhy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 00:04:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02A3E4E28;
	Mon, 13 Apr 2026 17:03:56 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07E4E3F7B4;
	Mon, 13 Apr 2026 17:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776125041; bh=sNkeD3oItSsUYpcwRXopPrAGHGTV7rUHC2RBworXx6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qzTpUOMtt4Daa1iCNSkoG6aW71GBI52JmOBJuML2B5kaxm32WfnMgBniZyQU6tfLy
	 wGJiXEDWZDjfG3XFWBAbi3+oo7PfuScZCQrVlsKy+nb33CUJI2CryYbapSVVRTBccG
	 KKzE9uO+KkTyzyLE+t3FvSci7YdovJoyMiHr4MXI=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 1/4] KVM: arm64: nv: Rename vtcr_to_walk_info() to setup_s2_walk()
Date: Tue, 14 Apr 2026 01:03:31 +0100
Message-ID: <20260414000334.3947257-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414000334.3947257-1-weilin.chang@arm.com>
References: <20260414000334.3947257-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_170405_418208_F925F65F 
X-CRM114-Status: GOOD (  10.08  )
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

This rename aligns the stage-2 walker better with the stage-1 walker.
Also set up other non-VTCR walk info in the function.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/nested.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 2c43097248b2..f20402d0d7e5 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -378,9 +378,12 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 	return 0;
 }
 
-static void vtcr_to_walk_info(u64 vtcr, struct s2_walk_info *wi)
+static void setup_s2_walk(struct kvm_vcpu *vcpu, struct s2_walk_info *wi)
 {
-	wi->t0sz = vtcr & TCR_EL2_T0SZ_MASK;
+	u64 vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
+
+	wi->baddr = vcpu_read_sys_reg(vcpu, VTTBR_EL2);
+	wi->t0sz = vtcr & VTCR_EL2_T0SZ_MASK;
 
 	switch (FIELD_GET(VTCR_EL2_TG0_MASK, vtcr)) {
 	case VTCR_EL2_TG0_4K:
@@ -398,12 +401,12 @@ static void vtcr_to_walk_info(u64 vtcr, struct s2_walk_info *wi)
 			      ps_to_output_size(FIELD_GET(VTCR_EL2_PS_MASK, vtcr), false));
 
 	wi->ha = vtcr & VTCR_EL2_HA;
+	wi->be = vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_EE;
 }
 
 int kvm_walk_nested_s2(struct kvm_vcpu *vcpu, phys_addr_t gipa,
 		       struct kvm_s2_trans *result)
 {
-	u64 vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
 	struct s2_walk_info wi;
 	int ret;
 
@@ -412,11 +415,7 @@ int kvm_walk_nested_s2(struct kvm_vcpu *vcpu, phys_addr_t gipa,
 	if (!vcpu_has_nv(vcpu))
 		return 0;
 
-	wi.baddr = vcpu_read_sys_reg(vcpu, VTTBR_EL2);
-
-	vtcr_to_walk_info(vtcr, &wi);
-
-	wi.be = vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_EE;
+	setup_s2_walk(vcpu, &wi);
 
 	ret = walk_nested_s2_pgd(vcpu, gipa, &wi, result);
 	if (ret)
-- 
2.43.0


