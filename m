Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8205BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lev9IqoBe7DATFicdC4dz1Qxteo+Idnlcoyl0MobQLw=; b=GkFIlp143HSjc2/XJ6dkzX3/eF
	Q6IQ0dEcMczqgjc2NGg/dSTjI3bALCQlPZDiQY1tmd6Q14I+7siTvWmq1K+vYjnVfzm5mhFDnSy5w
	t6EX9aQCmH3FU+QXXGQItt/BWzLQG81sj8EF5M8dWZcMjjnubgm+7GOQ0xF3jfbCE43ML1iQNKQl9
	9hHCd771OKenSNoh2id4TqNzI4X3k+lmc1r0uyKwvuE41SlKh7AFDJ3M1Za8jXtHs1jhj5ip7aY+J
	YCgHzdxMLhLxXbqYDxmELf/1nYvzHg1gd0fQWwmmUkCCO1I/3gyWDCgJLl5Nh6LEQIJ5hcY9BTymw
	Ze2jqnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trciF-00000002i4T-1FVx;
	Mon, 10 Mar 2025 12:58:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC2-00000002bSS-2HsA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0C215C62FF;
	Mon, 10 Mar 2025 12:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70094C4CEEF;
	Mon, 10 Mar 2025 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609513;
	bh=mNrZXrOFxAD4Z5DMKCnS/i5RqN2sl0u4OwioMTMgDQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NFo+pTKPU+5a3Bv1p1X7f/NU55wTW8a2akMZ6VYXs6M5ZESz2/GeiZZV+5an59Rz+
	 x0g263V8WfkomM0kKVDqvZSvmD9g4o+ss+pLmC7cfQuZIn15aKLDHN7zG1WliPECNX
	 G/WYFTX9ntPldZXIHMURYEpsc7ko5O+K9FKF+lpLC7akA1GELhQF5SC3cizm0/cXLY
	 /HqUEJ2PwulwLHqmphtisyCM80LM7Fc02gVYMkw8k1leVc8pLQPMTxDAI/pDOzEhNV
	 I7pu5qGFnCzIQwlNnXwTNbAu6xNuoo3aXuGRSUw51YLE+ndLMK6+wZ+TeSouFlZVVz
	 88aznrCAkTqDw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcBz-00CAea-Kx;
	Mon, 10 Mar 2025 12:25:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 07/23] KVM: arm64: Don't treat HCRX_EL2 as a FGT register
Date: Mon, 10 Mar 2025 12:24:49 +0000
Message-Id: <20250310122505.2857610-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052514_646127_3679F83F 
X-CRM114-Status: GOOD (  11.34  )
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

Treating HCRX_EL2 as yet another FGT register seems excessive, and
gets in a way of further improvements. It is actually simpler to
just be explicit about the masking, so just to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 23bbe28eaaf95..927f27badf758 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -261,12 +261,9 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
 		u64 hcrx = vcpu->arch.hcrx_el2;
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
-			u64 clr = 0, set = 0;
-
-			compute_clr_set(vcpu, HCRX_EL2, clr, set);
-
-			hcrx |= set;
-			hcrx &= ~clr;
+			u64 val = __vcpu_sys_reg(vcpu, HCRX_EL2);
+			hcrx |= val & __HCRX_EL2_MASK;
+			hcrx &= ~(~val & __HCRX_EL2_nMASK);
 		}
 
 		write_sysreg_s(hcrx, SYS_HCRX_EL2);
-- 
2.39.2


