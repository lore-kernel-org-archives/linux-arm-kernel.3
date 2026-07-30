Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C200C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FByzWifFnU/f8PPlfimQB06kGfpqX85cK4oJFIEZ8EU=; b=CCuv6msPG8THDyUdor+iwglrtc
	vR5xrDE6FrQVXzTYTUCfmLUTBmQvMiN633x/IjlpSbPIj5JbxnDHX2K6+gOXr+7Isn3AKVyAnhptp
	hOhGjTTVzQdHzu1UwoBMv4cRPWthhzDBNguV2pYbbs2gpQvwTFpjJIZyAOziWtEB63F6CeJ7ne70j
	eYx9ijXrHUV/gO9Dgr75OM35bEKuKPBo1W/a94m6PUETW5OaXX3RgMwyi1lMoDDqTdZxeyCiyWTqt
	h8IXwKGxYu1FwBSDLOstfrBS2TFnq68F17FaLh6ZCkR+gR4rAHeYn5uB0DSCDqO3zROI7en56qUOY
	+VRvWjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvd-00000009gsl-3CrZ;
	Thu, 30 Jul 2026 07:11:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKuu-00000009gPo-2CwX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 461EE43FDD;
	Thu, 30 Jul 2026 07:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4F11F01576;
	Thu, 30 Jul 2026 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395456;
	bh=FByzWifFnU/f8PPlfimQB06kGfpqX85cK4oJFIEZ8EU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X6L0Sf177CVGtoX2u7ln/g/Q9HkMKSjaK1od6ndTCGyzrri57pEdPsjJgdBoGB4lb
	 8y5weJ7eHnYPfaeGKwxR3TIQzmXazdBGP9NlksBcE48biv8BfwHRnDjecjSVXexcVj
	 NVA4FE/YGX1VrfuFAPKwFlDUjJQx8cSJRR0Rz3XgFSI9kpFxAxXobMTVV1xXgtcTCe
	 GILlxbp1LfpYHJcn8WOGzJWMants6sA4v/s0KBY07kQ4B4qgofR55DDHVinQrrMEu2
	 wo1KOYF6CabxzFhuRUqWvoCzS8lqgejk6RbK2G883XlrGActis3M+d6HGhSjNJaZlt
	 SbqiuizX0wLmQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKus-0000000AOpW-1yfB;
	Thu, 30 Jul 2026 07:10:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 28/29] KVM: arm64: selftest: Add NVHCR_EL2 to get-reg-list
Date: Thu, 30 Jul 2026 08:10:21 +0100
Message-ID: <20260730071022.296811-29-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Since we now expose a new system register on NV3-capable HW when
the guest is exposed to it, add it to the existing checker.  FWIW.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 0a3a94c4cca16..3cecc6d5dbd51 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -67,6 +67,7 @@ static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(VDISR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
 	REG_FEAT(VSESR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
 	REG_FEAT(VNCR_EL2,	ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY),
+	REG_FEAT(NVHCR_EL2,	ID_AA64MMFR4_EL1, NV_frac, NV3),
 	REG_FEAT(CNTHV_CTL_EL2, ID_AA64MMFR1_EL1, VH, IMP),
 	REG_FEAT(CNTHV_CVAL_EL2,ID_AA64MMFR1_EL1, VH, IMP),
 	REG_FEAT(ZCR_EL2,	ID_AA64PFR0_EL1, SVE, IMP),
@@ -770,6 +771,7 @@ static __u64 el2_regs[] = {
 	SYS_REG(SP_EL2),
 	SYS_REG(VDISR_EL2),
 	SYS_REG(VSESR_EL2),
+	SYS_REG(NVHCR_EL2),
 };
 
 static __u64 el2_e2h0_regs[] = {
-- 
2.47.3


