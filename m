Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315D4CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPQ40+RMSw9qS4ujNZWl4iP11kHXvB3QBni3mxBtwvQ=; b=YqGQO94u2KPAoBuhFQ6VLA8pL0
	mgykDDvn70kOm4+IZ4O5/2ZzYIaheeNAqXuyIkIa1PaooNGpKMclIGo4t5ikYAdgGnNAx2aRPZyeE
	nDHZlBJQL/Sb9K/iGpigkHtXSGShq6kPGEXD0JzbuOfVm2Y7RmEtrzIr5IDZUOLOic11LYxgepZfb
	YMxaj5U5uRf61D1TSoVs6BNSw8gVW7wMjp+INCH/fraGEX1Ljp34FTYN2cx1bi7JPgJWJiXf/0vre
	pm4/O5+/2Lq5aiKwUPqMuVNB63dqRcXnS/Hs98iqwqO1prAMjJfx8xSLjzNtI/W1nsUPb8wzssUra
	KFZoSMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrj-0000000AR3e-1aYj;
	Fri, 12 Jun 2026 06:59:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvra-0000000AQvZ-0RmP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b2f22ea2so5631395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247572; x=1781852372; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPQ40+RMSw9qS4ujNZWl4iP11kHXvB3QBni3mxBtwvQ=;
        b=lmym6bVBkiv7G7RVDmbTD3dqi/84HDrJFLE3v6U8O/7RloNQ/0uEwc2BPecW9xJ+kC
         cxIC8uRkLAeQjtYiuNjvTpbbUgU4h43dLZapowLxKXXhbhBGTNaWZfiZCfxIfyfYxQFo
         rDB/8ycwXxU46QPtFomtBYzEUlxUZMcQy3dIAEn/+KxILTl9Af47DVtj7e+jRmDd6luc
         RoxGbfLwfcA25+zBmr8H731zuUllhQXGm2mVIAz77cdiLtZtFBibU2cbekpnBomg8M1U
         PYzxQH86jsQoUohLnTOr8kzIm5ikKT8rW2Z8npLs8PDWByaEMB8KGAVrjRWDOF02LhtO
         xALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247572; x=1781852372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPQ40+RMSw9qS4ujNZWl4iP11kHXvB3QBni3mxBtwvQ=;
        b=nZ2+nz1gK+0zO0Ef2ZWdoOyWalejv5XiDZxiyB4e7zL2aQ0NUIfkbXMklNVGsgswgH
         d5IqBjRQgd9pdZfmZgYXnUigvA41n42N45ecD6aUBiWBn0NGRs4PH2M1LfmKpPcVWtYk
         UZbe4y5w+zE76zjhMucgRBuSvLxemOUfl9mdrKplAsOXb6tbLJq5LeM0frorsPDNE03E
         k7xk0tLUgMqZrOd1eL4qV9ofvi8kZpl8wqwQsdaXXhicCV+80UF602ml3MtwyRjWnDiT
         kX22VIpDbgMu1EyGl6yMjBEuILJWpRNgn+4LWnTnLIQEgAy6MJRDlRWD1guPCB0OUy0S
         wFwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+f8M+YvDxvq1GUE/ZJ9BXaOIbiNPm8/a6rKP68n16G9mScyPb4Bq2dG4L8g9tI841CkyY7/Ag9/7rfVcdNoIL0@lists.infradead.org
X-Gm-Message-State: AOJu0YxjIvU84PAtqbATVXYI56404tdtXnHuR2TwZfQ6IexYBLyMEmuK
	PZ62Tg/CMBtMN+Hun7qemeSZ9uRWj4Ra/czCK5/GC0pFhBjQMrwNHgZrm7CLzE7Y4OGCSSBLhF0
	QMQ==
X-Received: from wmdd27.prod.google.com ([2002:a05:600c:a21b:b0:488:9c2a:aec4])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3104:b0:490:58ef:cea7
 with SMTP id 5b1f17b1804b1-490ec4f2603mr16796025e9.22.1781247571436; Thu, 11
 Jun 2026 23:59:31 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:19 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-6-tabba@google.com>
Subject: [PATCH v1 05/11] KVM: arm64: Make vcpu_{read,write}_sys_reg available
 to HYP code
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
X-CRM114-CacheID: sfid-20260611_235934_164007_F5DD5F3F 
X-CRM114-Status: GOOD (  11.25  )
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

The vcpu_{read,write}_sys_reg() accessors are host-only, so helpers
built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be() cannot be
shared with hyp code. Add _vcpu_read_sys_reg()/_vcpu_write_sys_reg()
inlines in kvm_emulate.h that dispatch on is_nvhe_hyp_code() to the
host- or hyp-side accessor. A follow-up series uses this to share that
emulation code at EL2.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 5bf3d7e1d92c..aed9fc0b717b 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -506,6 +506,22 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
 	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
 }
 
+static inline u64 _vcpu_read_sys_reg(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
+{
+	if (!is_nvhe_hyp_code())
+		return vcpu_read_sys_reg(vcpu, reg);
+
+	return __vcpu_sys_reg(vcpu, reg);
+}
+
+static inline void _vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
+{
+	if (!is_nvhe_hyp_code())
+		vcpu_write_sys_reg(vcpu, val, reg);
+	else
+		__vcpu_assign_sys_reg(vcpu, reg, val);
+}
+
 static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
 {
 	if (vcpu_mode_is_32bit(vcpu)) {
@@ -516,9 +532,9 @@ static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
 
 		r = vcpu_has_nv(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
 
-		sctlr = vcpu_read_sys_reg(vcpu, r);
+		sctlr = _vcpu_read_sys_reg(vcpu, r);
 		sctlr |= SCTLR_ELx_EE;
-		vcpu_write_sys_reg(vcpu, sctlr, r);
+		_vcpu_write_sys_reg(vcpu, sctlr, r);
 	}
 }
 
@@ -533,7 +549,7 @@ static inline bool kvm_vcpu_is_be(struct kvm_vcpu *vcpu)
 	r = is_hyp_ctxt(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
 	bit = vcpu_mode_priv(vcpu) ? SCTLR_ELx_EE : SCTLR_EL1_E0E;
 
-	return vcpu_read_sys_reg(vcpu, r) & bit;
+	return _vcpu_read_sys_reg(vcpu, r) & bit;
 }
 
 static inline unsigned long vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
-- 
2.54.0.1136.gdb2ca164c4-goog


