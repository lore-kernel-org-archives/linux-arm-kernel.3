Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51355CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbL9lwJzeVbN1iJUU9ZRwmA6X1IAE6tmxjMtgc8Iqwc=; b=XmQ3gr2txanADvGt2lbn2N9ybx
	dkTLwsEXQCzErZIjTV1ltA1mu1i+9JZD20dbjAAYUR6vvJb+94ElfJksA1OLBTRaLYI83MPve5Kql
	muKtSmcXI+wXgpGzWMrmW7HrkHTsfLtZe11MN8wja9JIOQl1bhPc/jGXT96WyomBpXkaZHr5pgMML
	1DytUuq0OLgKZhhqpKchr5rVt3zWmyQRfZH5acxSXf2aLRKShHbq5wAus6YNd4d5P2lASnIAgDoQP
	0wZuZu8OFA/zFhWfFtD3RxSjlOhq2ClcBvQjT/zoVFTg1ScCiniRvFfhuoh/seBVEr+pHy2F7n87r
	E1chq1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK5-000000025I4-309e;
	Fri, 19 Jun 2026 07:07:29 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK0-000000025Dq-3LTc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:07:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso11812845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852842; x=1782457642; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbL9lwJzeVbN1iJUU9ZRwmA6X1IAE6tmxjMtgc8Iqwc=;
        b=hkkwKfCkCnNQ+Oh6azPskqh+jzN1Hv0YwWBEYRBz67lXtO9zHy6fO1svmWjpgqt6C1
         lPNragQZTwUNvv4yw/5k/1Nu5IvTCt2wBDCjd2fNk7Oztf9pw1dBc5hUFATnsB8/DxzH
         6VXw7W+WVGXXN4sYvQU86KTFXVbx1PfafpEuch3lNLL70e8jPt0RmEEGhQjO1P8aGceW
         XE1G72qIhmAnrDRymkC6FVbukmhGcU4Z1uuBNd6E86tjDn03P/34OXFVwndpXHsfzoFX
         K/mEIexFi+Y+WHup6Kw9dyo7PnHuuuvtnXOeAm2V0S8eJp5AUN5sn4OSW6ITWi3ne7+9
         IDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852842; x=1782457642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbL9lwJzeVbN1iJUU9ZRwmA6X1IAE6tmxjMtgc8Iqwc=;
        b=Gq3YDKKONa036G6Bpn+kXFxzi2L2LeLtnmb3vK6TXjYdvWgqdFZ5ZoB6pElfCpv+Wj
         di/nHSieaMfPpZUh32P/wasTknB7uX3wkmIPM5c8IgdWiMaHZgfEHfzFyD5Au3IGYIIs
         VDmHZ/1zr7lBRj/r16WXbem2elDaVXNhPzSKTESZZGZqIj7F2q4k/Fa3hC7x2CBcPzZ0
         V1xutiqwHU0fezXwWEjG0tWojI6L+d7A8wewlOoTWHS9moSvUoa/loN3fQBd/fK2HFes
         Ga0wbwY+REVAVKleH5VuYDKGRXT2I6TvDZSJA5harL+Et8eH/BLlC3remDnZHTPVpakH
         kyHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2uQv1KNAf9WibMd3o6r6yA+GZ2fHRgaFphGo0uwmioDw0dWCdKPScFmpXD1HIwzabJviKIyht1BxHxQmReZwR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd2rIr82DV0e8lt/HQ4OVxZZriKggsdtDVyHkSrgyjzkXjk+GC
	heU1tDmBDQmECIYI6hBH13gEm6nK126sFTru3BS9ynyM/giI2MvNsGTkaP4Gm6EqbpOpnhEMpHQ
	V+Q==
X-Received: from wmsk6-n2.prod.google.com ([2002:a05:600d:8486:20b0:48d:1bc8:5961])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b17:b0:492:40a1:1e16
 with SMTP id 5b1f17b1804b1-49240a11e34mr32742455e9.8.1781852841684; Fri, 19
 Jun 2026 00:07:21 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:07:12 +0100
In-Reply-To: <20260619070719.812227-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070719.812227-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070719.812227-2-tabba@google.com>
Subject: [PATCH v2 1/8] KVM: arm64: Extract MPIDR computation into a shared header
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_000724_849256_BF510EB8 
X-CRM114-Status: GOOD (  13.66  )
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

Extract the vCPU MPIDR computation embedded in reset_mpidr() into a
kvm_calculate_mpidr() inline in sys_regs.h, so it can be computed
without duplicating the logic. A follow-up series reuses it to reset
protected vCPUs at EL2.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/sys_regs.c | 14 +-------------
 arch/arm64/kvm/sys_regs.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 33c921df19b5..674fabe1d40d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -976,21 +976,9 @@ static u64 reset_actlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 
 static u64 reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 {
-	u64 mpidr;
+	u64 mpidr = kvm_calculate_mpidr(vcpu);
 
-	/*
-	 * Map the vcpu_id into the first three affinity level fields of
-	 * the MPIDR. We limit the number of VCPUs in level 0 due to a
-	 * limitation to 16 CPUs in that level in the ICC_SGIxR registers
-	 * of the GICv3 to be able to address each CPU directly when
-	 * sending IPIs.
-	 */
-	mpidr = (vcpu->vcpu_id & 0x0f) << MPIDR_LEVEL_SHIFT(0);
-	mpidr |= ((vcpu->vcpu_id >> 4) & 0xff) << MPIDR_LEVEL_SHIFT(1);
-	mpidr |= ((vcpu->vcpu_id >> 12) & 0xff) << MPIDR_LEVEL_SHIFT(2);
-	mpidr |= (1ULL << 31);
 	vcpu_write_sys_reg(vcpu, mpidr, MPIDR_EL1);
-
 	return mpidr;
 }
 
diff --git a/arch/arm64/kvm/sys_regs.h b/arch/arm64/kvm/sys_regs.h
index 2a983664220c..bd56a45abbf9 100644
--- a/arch/arm64/kvm/sys_regs.h
+++ b/arch/arm64/kvm/sys_regs.h
@@ -222,6 +222,25 @@ find_reg(const struct sys_reg_params *params, const struct sys_reg_desc table[],
 	return __inline_bsearch((void *)pval, table, num, sizeof(table[0]), match_sys_reg);
 }
 
+static inline u64 kvm_calculate_mpidr(const struct kvm_vcpu *vcpu)
+{
+	u64 mpidr;
+
+	/*
+	 * Map the vcpu_id into the first three affinity level fields of
+	 * the MPIDR. We limit the number of VCPUs in level 0 due to a
+	 * limitation to 16 CPUs in that level in the ICC_SGIxR registers
+	 * of the GICv3 to be able to address each CPU directly when
+	 * sending IPIs.
+	 */
+	mpidr = (vcpu->vcpu_id & 0x0f) << MPIDR_LEVEL_SHIFT(0);
+	mpidr |= ((vcpu->vcpu_id >> 4) & 0xff) << MPIDR_LEVEL_SHIFT(1);
+	mpidr |= ((vcpu->vcpu_id >> 12) & 0xff) << MPIDR_LEVEL_SHIFT(2);
+	mpidr |= (1ULL << 31);
+
+	return mpidr;
+}
+
 const struct sys_reg_desc *get_reg_by_id(u64 id,
 					 const struct sys_reg_desc table[],
 					 unsigned int num);
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


