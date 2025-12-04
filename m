Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ACAD1D892
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPJ9k3jWQJjEaxIk9aXA2JWOUzKgaQLCybsGAb7i/pk=; b=VQaoHPtFwJIstZZqEiW6DUtEtC
	LY9Bv6zjAzBpymCrViOHfWrgNrxdkFaE4ByNW0Yt2wd2SKlZhww6/7MGT9+xf+GrNMgas3vrGwXDL
	pFPWY0kOqZVRQ0TsCvputFKttGVxaj0lQasJT3aoG4iheMMSi0dNNBLUMH258m4UbDrC21y4ObfA+
	9Ker1ky7f9JV6fgMyPsHMur6IylU56Bvc//44s2kgqL/TAb6LMqZ23EiZQ/lbI4879T8zHZqn5Yuu
	WdJh7805DaatB1I1ghgEbE3hGSl1JjvuhuD0pcLdod4rUlexyLn9DJOE2h72iLjChBswGBS2K8t7r
	Dtdb4f8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x6-00000007mwf-3UNV;
	Thu, 04 Dec 2025 09:48:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x1-00000007mql-1Lfm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A70B8441A6;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88668C19424;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841717;
	bh=9h9YsTsk5vn4vCNtdHh8qjme05rekVSJ2pUxZ7SnzH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gVP2oguJz42dqE3YljNBpawv/MxrxWGRUluteUC3wevwekNYQXj0k4f0Tg2ABSJ0M
	 XC+moOejr7Dt5feDdNx/Go6gEx4e6F6R2KYlS6NyUNGMw+IHDDgrCO9lKAY2+34uVv
	 ISY5Tt0aYj6mhjB+hZq5+QCpc5QQ2bb5UxXpUzg8sO95/OKRlMlLQWYsY8LoaryvTQ
	 RbZnvwkwDOmhCzb/WqPxlC5QUedDNH5GW2+DK3uPpAoSpoJ8H2WlKeB4OlGGZj7wia
	 9rpoQWlMgP1DDiCTJ3tVbpLN4RWUkiEfrCoX53R3l5ibn3b/xgGKz2MPjCe6EsT3OZ
	 0YY+gQxCLt/pQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vR5wx-0000000AP90-36QO;
	Thu, 04 Dec 2025 09:48:35 +0000
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
Subject: [PATCH v3 7/9] KVM: arm64: pkvm: Add a generic synchronous exception injection primitive
Date: Thu,  4 Dec 2025 09:48:04 +0000
Message-ID: <20251204094806.3846619-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204094806.3846619-1-maz@kernel.org>
References: <20251204094806.3846619-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_014839_405441_94F136F8 
X-CRM114-Status: GOOD (  12.11  )
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
index 107d62921b168..876b36d3d4788 100644
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


