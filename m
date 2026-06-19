Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B90CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbL9lwJzeVbN1iJUU9ZRwmA6X1IAE6tmxjMtgc8Iqwc=; b=sRRIKjRhKS89xIxlQVXuBCfOdF
	dAf1B4YGCFMGhRGTF1p29Cuzq/6UCEJEUZSe92LJeHoajc4tN0lO2kYGenYe/igrfKNTogjULoWpX
	iA7hb3jrM7UW/FtkkM6sHBk1PY5zotbkKDREqErjp27dA9CxiSaGYNwPYA1avSudwy++Enk+9lkwt
	1lz7scDrUIRLOeqcr0oo4300k+aQdid7BZVw1vj0gZCvdUCbx0jXFp9m7LQMtpVhvxoCwLP4OQ3yY
	Ztv9ChJpfJ1vdEzPyzkGJpIPPvaq7+f8P1WbyTibe72ri6MaFBbo2u26h7q4lrQNJJIbyMcNrROVV
	rz2lhLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTHy-000000024SF-2yEt;
	Fri, 19 Jun 2026 07:05:18 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTHt-000000024Oy-1917
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:05:14 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490e547f3cfso14342065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852711; x=1782457511; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbL9lwJzeVbN1iJUU9ZRwmA6X1IAE6tmxjMtgc8Iqwc=;
        b=Lq7vA7yiec12w7JtCF/ay9W1XPf+dirj+vVGeP7thV+0KDqeby+JGaQy8krQvYaB5Z
         1ZTdG3FtBKcHUN/DdCeAkGVDNHxRIOq41X5Rafxtubc11UyiDRGz2yLQ6MRG5Ap9lAIe
         eovdz2Hom5KinCQTdeu+p0yyL4BeCoForr2iMqaUhKp1ygVfjboTanUDfhikSdcFuz++
         sDKPjMCMUcMKH14egVroKls4wjbL2CYjr8ircvFMcpu9yHRV3qjD3zDSy/ZswNygjOe3
         s2azlf2zEIbptDdSw+JAh5/euyNFIQkGeEFFdzcLKp920xz7UA4ysNUpiqGjsIIHhQ+L
         B0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852711; x=1782457511;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbL9lwJzeVbN1iJUU9ZRwmA6X1IAE6tmxjMtgc8Iqwc=;
        b=SXJx/5TLTx1ceS6dk5h0T6hAGSpelcr9tBLulTgA6mOsV1Ix27im5c0RLH6PPv7Vtd
         ZmRb+eb9msJ/fbMyxEI7XrQNP7PkyoVu/T3KAA9D25tJAcVWpuhLnDl9QgW4TB68/btd
         mEaC/OSuwZfzw6ESdnXJW82XuOGCHGJtDlwWFYhEeQOCbztZkz+lGCo5gkqIUNz3bflb
         FcqOPA5qQi2Nl0Z/NcRB1GZOreFOlLI5qmHxl96pc3Dk8zcPk8eYetL1dfd32XNUURUi
         Ms89b7dvMYlJ/wVB9rZq4o2oCc84ix854lGUmTneZiGUuKp33jZBXRKDgPuhpUO5zBcy
         goAw==
X-Forwarded-Encrypted: i=1; AFNElJ882YX3SJI372oCbKaaYauuDRWUIHuV5dWuR/GAnafPX0YIgogbS5E7aF0BErOlW8ipSMikAr/WafmBBbCjIwhH@lists.infradead.org
X-Gm-Message-State: AOJu0YwW7Biyuu0137CT2O3SdIK/tLTMuSWY1+vEALAyNUP0J317c8AF
	xq6JTVNG+o+7qG1qxkZJUt6nvr+XbmSnspUfo9SW7vCZvAqHJsd9cvDXYt0c7vQ26raed2mZU/N
	FnA==
X-Received: from wmbdr18.prod.google.com ([2002:a05:600c:6092:b0:490:9d65:494e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5493:b0:492:1ea2:6258
 with SMTP id 5b1f17b1804b1-49240e7b049mr31031545e9.33.1781852711056; Fri, 19
 Jun 2026 00:05:11 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:05:01 +0100
In-Reply-To: <20260619070508.802802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070508.802802-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070508.802802-2-tabba@google.com>
Subject: [PATCH 1/8] KVM: arm64: Extract MPIDR computation into a shared header
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
X-CRM114-CacheID: sfid-20260619_000513_328471_4427C20E 
X-CRM114-Status: GOOD (  13.45  )
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


