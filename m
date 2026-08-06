Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AA0C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYmsZN1mEJc1s26rxNv68w2Qd9AxfNAhcy0pmx5D2is=; b=XUkQJ3TUN8EKsvCPySupgLx941
	xj4da5WXisbOJI/PnXeJ4ibGtTdcL5WZKRwYe+0/fiU+5J1z17WcBgUWFiD09EQe5vQapY3qf9Xrb
	6v49zr89bfRKxreAMuowVZYENSh9cv+NfubsTCPdVI4szGZxsCU6ZWYIuFddj3aoyHej1qUap/TNq
	N1XzYshZF7Rc/H1GMNhqwlsOSpelC/HSk5PBajwT6UoktCBN2mGhgHDsmkMDTOqrxUOZowUDC79Ty
	Kpyd7T1JLts0SqUzJynm59ZJtdyou72SXQYciyzCZbeGXYZYfnVdMdFAQ+Cy+vK1Hqq6olou/uz5G
	kO/PTRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru7a-00000005L4f-42rZ;
	Thu, 06 Aug 2026 09:10:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru7Y-00000005L1Z-173E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:10:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4841360AB4;
	Thu,  6 Aug 2026 09:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07481F00ADB;
	Thu,  6 Aug 2026 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007435;
	bh=PYmsZN1mEJc1s26rxNv68w2Qd9AxfNAhcy0pmx5D2is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NfUy+FU2vQ7K6s1Gyd2T5GiI2aNzBxCE4jOM7S23hI5jNNT16tcfskxVcKT4o8/0a
	 1Te+kyidaebRTW5nkulPP7tSFIY9UalPympE0VSGcbIn147fpYwIDhxhJJ8FiIUbRo
	 D4Gs0SdosJMm6bJcR2juo7HPNa6qH8WBO9oiXNOhW7FOexh+zEhB+06GzSQ5pNW3fC
	 4oKQsd0JWv9dXYtSVR8N55AdooNnQCZri+V8Wl+i+QMxNCK9qozKjsgeYJ7hfWk9Ez
	 dds112kgaEI20srGEyEh0kvQdxkpCXk+qxakBdNuQWUMPSqJXMLQoPLQ4JQx2/MJy1
	 wvWc8Xz6AiEhg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wru7V-0000000CtHi-13kg;
	Thu, 06 Aug 2026 09:10:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	ljs@kernel.org,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 6/8] KVM: arm64: Sign-extend VA for range-based TLBI invalidation
Date: Thu,  6 Aug 2026 10:10:24 +0100
Message-ID: <20260806091026.620700-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806091026.620700-1-maz@kernel.org>
References: <20260806091026.620700-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, imv4bel@gmail.com, yaoyuan@linux.alibaba.com, ljs@kernel.org, sashiko-bot@kernel.org, stable@vger.kernel.org
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

When the decode_range_tlbi() helper was moved to be used for S1 TLBIs,
the required sign extension was omitted. Add it.

As a result, special care must be taken to not overflow PA bits when
this is used for S2 invalidation.

Fixes: 85bba00425ae0 ("KVM: arm64: nv: Move TLBI range decoding to a helper")
Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/r/20260801130337.EB2BA1F00AC4@smtp.kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/kvm_nested.h |  7 +++++++
 arch/arm64/kvm/sys_regs.c           | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index bfed664d823bd..c83be6d0e79ac 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -291,6 +291,13 @@ static inline u64 decode_range_tlbi(u64 val, u64 *range, u16 *asid)
 
 	base	= (val & GENMASK(36, 0)) << shift;
 
+	/*
+	 * We only deal with at most 48bit VA/IPA, so 48 is where we
+	 * sign-extend from. Should we support FEAT_L{VP}A* at some point,
+	 * this will need to be revisited.
+	 */
+	base	= (u64)sign_extend64(base, 48);
+
 	if (asid)
 		*asid = FIELD_GET(TLBIR_ASID_MASK, val);
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5d5c579d45790..797e888bf9394 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4057,6 +4057,7 @@ static bool handle_ripas2e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
 	u64 vttbr = vcpu_read_sys_reg(vcpu, VTTBR_EL2);
 	u64 base, range;
+	int pa_bits;
 
 	if (!kvm_supported_tlbi_ipas2_op(vcpu, sys_encoding))
 		return undef_access(vcpu, p, r);
@@ -4068,6 +4069,16 @@ static bool handle_ripas2e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	 */
 	base = decode_range_tlbi(p->regval, &range, NULL);
 
+	/*
+	 * Ignore TLBIs that start out of PA_bits range, and cap the
+	 * invalidation to the [base:bit(PA_bits)] interval.
+	 */
+	pa_bits = kvm_get_pa_bits(vcpu->kvm);
+	if (fls64(base) > pa_bits)
+		return true;
+
+	range = min(range, BIT_ULL(pa_bits) - base);
+
 	kvm_s2_mmu_iterate_by_vmid(vcpu->kvm, get_vmid(vttbr),
 				   &(union tlbi_info) {
 					   .range = {
-- 
2.47.3


