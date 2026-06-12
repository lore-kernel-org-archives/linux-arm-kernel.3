Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8961CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6lByUAON2kwH/WVx8s6LHD92Bsz3VHXajDWnpZfQxc=; b=UHubUunfDJ2Ja7aZmM1zjdLxg4
	+dC7yqcweydMKvDFJM3MhSMDcdUpV1L5BPA0J2NRciFB2O81N9v8avXQvrI7/jFu56ht+aHdRmTFt
	CfRf5uzQXR8iLzYQvMOdvbt+rhxy5KQyEDS3ovdYIIMBjJhqbxg1Gp9neIkKIIwS5bJey/iiWVcZE
	awkyfaATe1UnuQ1s7WY0hyqcht7VvwrR+SdXVFvcRNTtV1p5Dqqk7mNk9zE2BNAFEvFYbATkRbWsw
	wpyzVY5k0uhEQXAyUxj79C7ev7NAFO+QH4+M1815yFLKBHLjn0s6ne3dtQmKn8qpcc/vVJTP0kRGL
	yt8bsZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrj-0000000AR3N-1CYe;
	Fri, 12 Jun 2026 06:59:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrY-0000000AQvG-2tMl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:33 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b2f22ea2so5631235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247571; x=1781852371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m6lByUAON2kwH/WVx8s6LHD92Bsz3VHXajDWnpZfQxc=;
        b=Gv6e3xn78HZRRXaCb5OEEVJwZi9R0qML9OQnsi7Lt7dpoLF3G43yx6eYCO1UjNofBK
         vn8gX7hH1lnde+xTiciqHOF4HFn3qEpNn5k+xGhROIHs1vLPnBpO7OMtuSxkCnIzO3wI
         pynIRI88CifgDXAkkz+ZgdevQ/R5sSGmEhC2oSWtv7efEJ+ebev0WdP8wUrAxxLydDHT
         P6CI5D6cKFqG4Gh133N56kqLkv0Hzp8572w/gQH01sm+EW7UfWWFanA0GOeof+NtYWkU
         Oe9/kawBSZd6goKwl7kKFasxgo2PMg1ATlRRIUEQGm5Xjp3dml28a0GRlVZWKPxrAKSx
         hT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247571; x=1781852371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6lByUAON2kwH/WVx8s6LHD92Bsz3VHXajDWnpZfQxc=;
        b=J3PgHRH+piLUajR2zRKx9e1RDHzYYnh9IgXNqbqMuLHzz0rb6n+wN5jz52U5YWcl7C
         YOXkHEdYz/F2qYYjRbAGY+PI8Q0Yktl6vsEaPTdlW1AqtuFwKtKh/LiGME4WHzbmTSIF
         jHmKMIIwXzFs2WuZHQQQ+iCiebodN9wnC8LojBzVx1OO6X4JVUUkJuNT5phtyEM6f+9a
         TFFPMPyV4Wt/N5k8tjvTcTFTkRyBL6y+9iQqKhXXQml+9LA74Np3Mszlzbv0bAmnb0Wu
         8p3OCud7FAfF29DLQ8Bt+jNHAk+oepQaZaVGgG7eh5lVuIHblyFhMuzSAyqK5Etg06sf
         abXA==
X-Forwarded-Encrypted: i=1; AFNElJ/vaIyWNpgLijEAY+Iseu/1uZP209FjAFrPn4cTmXG840GR+SCYcL5TZ9lfWNr4s8NnIrZNkaBoUSZbaHRLacuW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn9xTH2HvpB7yV8oNKAOaTS5L5nb93VLk+57khxOLHVN+6Uywz
	NnQFTSMgInOeW3uz0m6EXKMxGtlTy1k9WrFy/OfrAp5rPvo6dPLM/DeH8P4f3aoQNfoawLhNWto
	EOA==
X-Received: from wmoo1.prod.google.com ([2002:a05:600d:101:b0:490:b195:62b3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8012:b0:490:b9d3:a9ce
 with SMTP id 5b1f17b1804b1-490ec5047d3mr16382375e9.30.1781247570557; Thu, 11
 Jun 2026 23:59:30 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:18 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-5-tabba@google.com>
Subject: [PATCH v1 04/11] KVM: arm64: Extract MPIDR computation into a shared header
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235932_754681_243F5B34 
X-CRM114-Status: GOOD (  13.79  )
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
index fa5c93c7a135..869a4bac96d6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -979,21 +979,9 @@ static u64 reset_actlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 
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
2.54.0.1136.gdb2ca164c4-goog


