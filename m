Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBFBC88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKQwzY7p65REryck2UTHMcdDmPOmLn6GEJx6YfNlSLg=; b=RCTrbx6Zqo/E02x+zLFn3d2CGN
	dNg74p+VAFMbN0EgsZ4bQaNz1xTwgKlNmwhJe4AMZE3d4ZKWBgdXkiZv0KYZGWPk2RDCPi9MErGjb
	4tKyBJlDZDeQCOzVpRHTwxnehEPP2SR3jToTVvr25b2gwl4RZtA/xZeBfebSbOvxTOQUwo0KRKyHA
	5eAebR3Ui6VW9Ww9v6vwjqMkdxde6JGHXC0UfQA6tX5qp6XEdXZ9k5Ici/kAAviSzSZo8GLGcW74O
	65Bxe0kitcevTqlEwdvaogwnADZwDkfmqPLftmA7jJARtu1Hm48Cnhghg+w++wCm3FhIFln1kg1pI
	zO47fqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64y1-00000003Ghj-0EZK;
	Mon, 14 Sep 2026 11:35:21 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xt-00000003GWa-1fzt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:35:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4yfN1gycnb44ryNru42szUE7VLGbmxLWNo36QO1dLZM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385709; v=1; x=1789990509;
 b=h/R1SvUwuN31UE31Nxh9gTG53YtHCS0W31mFfA3NxyF83p9SjIPIn7zx56H6JwY6eSnsze5f
 oM5pHEL38uJriQFmEP4AhxUJC4cANSOxWOJaTk8GeKm4gHhCJSzyYg5Tf8b0CZFphzadhaR1n+4
 hEuURaNzi/vGu/SnQtf7YKvA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bc666f73e4b472fb;
	Mon, 14 Sep 2026 11:35:08 +0000
X-Mizu-Trace-ID: bc666f73e4b472fb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v3 12/18] KVM: arm64: Prevent host PC adjustments for protected vCPUs
Date: Mon, 14 Sep 2026 12:33:32 +0100
Message-Id: <20260914113338.159227-13-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914113338.159227-1-fuad.tabba@linux.dev>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043513_972088_5CFCF537 
X-CRM114-Status: GOOD (  15.02  )
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

__kvm_adjust_pc() lets the host advance a vCPU's PC or inject an
exception, which for a protected vCPU would let the host redirect
guest execution. Drop the request there: the entry handlers apply the
host's PC_UPDATE_REQ on re-entry, where EL2 allows it.

__kvm_adjust_pc() adjusts the vCPU a get/put pair returns, the one it
was given outside pKVM. Both host callers hold the vCPU mutex, so a
hyp vCPU loaded for the vCPU is loaded on the calling CPU. The request
for a loaded protected vCPU is dropped. For a loaded non-protected
vCPU, PKVM_HOST_STATE_DIRTY selects the copy, since adjusting the hyp
vCPU while the host copy is authoritative loses the update at the next
flush. Adjusting the hyp vCPU copies PC_UPDATE_REQ in and back out
again: without the copy back, INCREMENT_PC outlives the adjustment and
the next KVM_SET_VCPU_EVENTS trips WARN_ON(INCREMENT_PC) in
kvm_pend_exception(). With no hyp vCPU loaded, as under
KVM_SET_VCPU_EVENTS, the host copy is adjusted as before.

Until the marshalling patch clears PC_UPDATE_REQ on the host copy at
exit, a KVM_RUN that returns to userspace with INCREMENT_PC set leaves
it on the host copy of a loaded protected vCPU, and a
KVM_SET_VCPU_EVENTS before the next run then trips that WARN_ON.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/exception.c             | 21 +++++++++-----
 arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 19 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         | 32 ++++++++++++++++++++++
 3 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 6e60d890afa4a..7ea62e5304ae9 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -353,12 +353,19 @@ static void kvm_inject_exception(struct kvm_vcpu *vcpu)
  */
 void __kvm_adjust_pc(struct kvm_vcpu *vcpu)
 {
-	if (vcpu_get_flag(vcpu, PENDING_EXCEPTION)) {
-		kvm_inject_exception(vcpu);
-		vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
-		vcpu_clear_flag(vcpu, EXCEPT_MASK);
-	} else if (vcpu_get_flag(vcpu, INCREMENT_PC)) {
-		kvm_skip_instr(vcpu);
-		vcpu_clear_flag(vcpu, INCREMENT_PC);
+	struct kvm_vcpu *target = pkvm_adjust_pc_get(vcpu);
+
+	if (!target)
+		return;
+
+	if (vcpu_get_flag(target, PENDING_EXCEPTION)) {
+		kvm_inject_exception(target);
+		vcpu_clear_flag(target, PENDING_EXCEPTION);
+		vcpu_clear_flag(target, EXCEPT_MASK);
+	} else if (vcpu_get_flag(target, INCREMENT_PC)) {
+		kvm_skip_instr(target);
+		vcpu_clear_flag(target, INCREMENT_PC);
 	}
+
+	pkvm_adjust_pc_put(vcpu, target);
 }
diff --git a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
index a4fb04faa7d09..94ba768996032 100644
--- a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
+++ b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
@@ -68,4 +68,23 @@ static inline void kvm_skip_host_instr(void)
 	write_sysreg_el2(read_sysreg_el2(SYS_ELR) + 4, SYS_ELR);
 }
 
+/*
+ * Under pKVM, the vCPU __kvm_adjust_pc() adjusts for @vcpu (NULL drops the
+ * request), and the copy of the consumed PC_UPDATE_REQ back to @vcpu.
+ */
+#ifdef __KVM_NVHE_HYPERVISOR__
+struct kvm_vcpu *pkvm_adjust_pc_get(struct kvm_vcpu *vcpu);
+void pkvm_adjust_pc_put(struct kvm_vcpu *vcpu, struct kvm_vcpu *target);
+#else
+static inline struct kvm_vcpu *pkvm_adjust_pc_get(struct kvm_vcpu *vcpu)
+{
+	return vcpu;
+}
+
+static inline void pkvm_adjust_pc_put(struct kvm_vcpu *vcpu,
+				      struct kvm_vcpu *target)
+{
+}
+#endif
+
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index da8ab636063cf..1dcc75261dc08 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -642,6 +642,38 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) =  ret;
 }
 
+/*
+ * PKVM_HOST_STATE_DIRTY names the authoritative copy, the host's when set.
+ * A loaded protected vCPU takes the request at its next entry instead.
+ */
+struct kvm_vcpu *pkvm_adjust_pc_get(struct kvm_vcpu *vcpu)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+
+	if (!is_protected_kvm_enabled())
+		return vcpu;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || hyp_vcpu->host_vcpu != vcpu)
+		return vcpu;
+
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return NULL;
+
+	if (vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))
+		return vcpu;
+
+	vcpu_copy_flag(&hyp_vcpu->vcpu, vcpu, PC_UPDATE_REQ);
+	return &hyp_vcpu->vcpu;
+}
+
+/* Reflect the consumed request back, otherwise it stays pending. */
+void pkvm_adjust_pc_put(struct kvm_vcpu *vcpu, struct kvm_vcpu *target)
+{
+	if (target != vcpu)
+		vcpu_copy_flag(vcpu, target, PC_UPDATE_REQ);
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
-- 
2.39.5


