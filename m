Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0ABD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMmPqAnpavuFbCxjQjbAaZaTSSzKDk0vPDyzAczow0w=; b=cyfcmPQTUunV5j44R036plFXxH
	C6QOn5O2azEfA1Cz+s1iRYSOGRrY6f3uXYWRfNBt85x1nU5lsjjeRxuhX+mXoDQlzamK480yyh7yG
	3/S1Cs984DhTGtK2Uno/2HumBcruWMluweV4HeCwHSX1E72Oub0+y7JZjYQYH6tjqeC7o/yDlMjnV
	bdwBveLgGdKJDUeNMyvsjYaBRWGcgWD1i+k3myCXGmit+M7mbNKWF6I+0d0vkkgkH6IoCjmbGGYcg
	bsEakp/LKjKRrbOzr1wqUKkW09/rUBV67g+p8+XAIk19iTexaQRpLWyawi0JqQNnDHY2+y9QhMDJs
	UsbZJ/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsO-00000000PXU-1HZa;
	Thu, 08 Jan 2026 17:32:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsH-00000000PQm-1iSQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 010734419C;
	Thu,  8 Jan 2026 17:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC78C116D0;
	Thu,  8 Jan 2026 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893559;
	bh=14vGUcf2My30ymRVUO1QsDP5Hi0obb2aytzKycfx2Gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u4D83xWwCfw/8NYVqph4QrAD0S9o22dQ4EOuUbcbiYK6GPM6U47qqhJYpyme78gaK
	 L9TfBPvfV09ZADN/5He32Zyd7QdbaDxWCTs0f28Qx+ax4094BjKtIOb/LpVVUzF/nf
	 fvBE+0cCEpbYXAPAGXg+IU90MQbpXthLY/CvCHgI33ZRdaTaTMbiG9MwmI2gUWTRzT
	 gcpxN8NJVV/yREJB3zsCckv6u18RCjGs4LJi8HJ998AlCaxAky8pg6laBVAs0QjhfT
	 J72von3j+UYBGPAiTE2IUyslyXs1meOx4f1c04+ZarIrgIMw6s1fhcz7iKIKh+lR8e
	 ffrdqw3H5fsfQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdtsD-00000000W9F-3yCX;
	Thu, 08 Jan 2026 17:32:38 +0000
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
Subject: [PATCH v4 7/9] KVM: arm64: pkvm: Add a generic synchronous exception injection primitive
Date: Thu,  8 Jan 2026 17:32:31 +0000
Message-ID: <20260108173233.2911955-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260108_093242_057126_DCE0054D 
X-CRM114-Status: GOOD (  11.92  )
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

Similarly to the "classic" KVM code, pKVM doesn't have an "anything
goes" synchronous exception injection primitive.

Carve one out of the UNDEF injection code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 4db0562f5bfa4..b197f3eb272c1 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -243,16 +243,15 @@ static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 	}
 }
 
-/*
- * Inject an unknown/undefined exception to an AArch64 guest while most of its
- * sysregs are live.
- */
-static void inject_undef64(struct kvm_vcpu *vcpu)
+static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
 {
-	u64 esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT);
-
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
+
+	/*
+	 * Make sure we have the latest update to VBAR_EL1, as pKVM
+	 * handles traps very early, before sysregs are resync'ed
+	 */
 	__vcpu_assign_sys_reg(vcpu, VBAR_EL1, read_sysreg_el1(SYS_VBAR));
 
 	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
@@ -265,6 +264,15 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
 	write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
 }
 
+/*
+ * Inject an unknown/undefined exception to an AArch64 guest while most of its
+ * sysregs are live.
+ */
+static void inject_undef64(struct kvm_vcpu *vcpu)
+{
+	inject_sync64(vcpu, (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT));
+}
+
 static u64 read_id_reg(const struct kvm_vcpu *vcpu,
 		       struct sys_reg_desc const *r)
 {
-- 
2.47.3


