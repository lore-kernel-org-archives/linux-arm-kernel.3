Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985E9CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvNQ4tIxSouECNeVr4s6zto6hS9KDqxG0yViEXlduVY=; b=tqNe8VHFMT6BU9t8cTug9h5Iqz
	+P+RC5FNayf6ty+41VC9wNW4DeQLpXY/2WhDPHWgPF4O12McHI2Be21YDLiOKS/5pITTXSkQ9dU28
	2Ivgj+PerXRhn7WcGiP/DLuSJMC3J2zHrIqoMRybDd+VUiwzBrtaO4kzujagHlDegrNqTTBJsNh5n
	rlwl3hCqkDtv45B1VhQgU76nS+mZppbM0ufi/4fCVqvqhG6l37c8GJ+5p+pUnijpmcl3Mz5SEdsMW
	1ogKxsjRQ5zrynbazi1gnpVkw8Hp8HLwVKHljMYAwbt40PuDpZVvXvksGQ+9PuhOA2NtnKzQ9oMng
	iufz+utw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1hQ-00000007Ess-15vO;
	Wed, 30 Sep 2026 21:18:48 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1hG-00000007EpD-0VFP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:18:39 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4b2d1eb484aso9108236b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790803116; x=1791407916; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvNQ4tIxSouECNeVr4s6zto6hS9KDqxG0yViEXlduVY=;
        b=M8s3VshXJxfFdilHZqePhnucbgG6yUxB/dgfEVTJIZkX0ItrRmKfeczZkoL9+lB9I5
         je1CL/oSP5W3M++w0D42HURpBRjjQtVS6w78ReFptDdQ8TAK9rb4jStHr4pT/Kbxk3bV
         iLBZcydUOhHBarIgBEqbsl4o93inaWpciotgnD7XnqQ6D6HsN/XAi9YIHT1+2hhUay+U
         T1QwFX9ivDKUZbugWC8XalxrN9mFj+v8hQ3icModF7kYH18lIqKN6NZRJGMvrdPtJvTC
         qPNB1xrUK+mm6O1ZlYMkkiKMSl7zCzn1dl9QbfeHPIik2txdxBmKlPfdUSnIXSA3utom
         SUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803116; x=1791407916;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvNQ4tIxSouECNeVr4s6zto6hS9KDqxG0yViEXlduVY=;
        b=S29sRXz57RGasdLw04z9wXPxv0q87L5Su84W+lHegtZR41NDhpqEiv6eQqUX7VNwoK
         8QwS3E6cW/8wYlOxoxYKsqEtSBZ77ds/V9t34LTww9KBzEvw5mFokD11LfaaouTjjhgZ
         IQup1k6pI49TXiLBnDC5ao1LzOD9ZCcGXkkTaueq+Zgp+B/5YukwcKlIRQ9D7pwe3nQy
         Xq7ztWe6vKNvr7uBh4629uCsaYAjhIEhX7Hwk18h4QXp3cfRSRZ+8qwMj9zejsmF/PyG
         /Vileiom3VbLvF7FZDUSz3vCN1vcUBiFjPqNEzB61gx+YDLpea5XFeu7CrfVEGWq/ZXb
         XG1A==
X-Forwarded-Encrypted: i=1; AKwUvBzh211UVdbmxEmYargmnZyrIpoViKv3PeiRft1ZAPq2JLp4ygCXQyWlLNPxYMGuuscD4KsKjMRwd69iQGQ+npxY@lists.infradead.org
X-Gm-Message-State: AFuF++lH+zCUhP2c1g7BWyqlQE8Ru72L31AhNGa30Jtq8a3xQQN0T3xQ
	74GRvuKbQn5kWCVwFAa0GGm2M+30mxU5gAB0dAhpOG2FQuXJ/xczbaFOtyMoclI1z8QWOTblWdX
	KcT3vKqK7UQD7Ju6tjqmFIP6URA==
X-Received: from iljm9.prod.google.com ([2002:a05:6e02:de9:b0:50d:b61e:e6c3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1190:b0:4d6:9153:295e with SMTP id 5614622812f47-4f1ba4fc340mr2480554b6e.47.1790803115577;
 Wed, 30 Sep 2026 14:18:35 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:18:33 +0000
In-Reply-To: <20260930211834.2773546-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260930211834.2773546-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930211834.2773546-2-coltonlewis@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Handle ID_AA64DFR0_EL1.PMUVer == NI in __kvm_pmu_event_mask()
From: Colton Lewis <coltonlewis@google.com>
To: kvmarm@lists.linux.dev
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_141838_196298_3C61BF1A 
X-CRM114-Status: GOOD (  12.55  )
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

When userspace initializes a vCPU with KVM_ARM_VCPU_PMU_V3 but sets
ID_AA64DFR0_EL1.PMUVer to NI (0) or IMP_DEF (0xf, which is sanitized to
NI), resetting the vCPU invokes reset_pmevtyper() and calls
kvm_pmu_evtyper_mask(). Because __kvm_pmu_event_mask() does not handle
ID_AA64DFR0_EL1_PMUVer_NI, it triggers a WARN_ONCE("Unknown PMU version
0").

Explicitly handle ID_AA64DFR0_EL1_PMUVer_NI in __kvm_pmu_event_mask() by
returning an event mask of 0, and drop the redundant kvm_vcpu_has_pmu()
check in reset_pmevtyper().

Fixes: bc512d6a9b92 ("KVM: arm64: Make PMEVTYPER<n>_EL0.NSH RES0 if EL2 isn't advertised")
Suggested-by: Oliver Upton <oupton@kernel.org>
Assisted-by: LLM
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-emul.c | 5 ++++-
 arch/arm64/kvm/sys_regs.c | 4 ----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 5b1af7e2176fa..e2b28dbc0451b 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -50,8 +50,11 @@ static u32 __kvm_pmu_event_mask(unsigned int pmuver)
 	case ID_AA64DFR0_EL1_PMUVer_V3P5:
 	case ID_AA64DFR0_EL1_PMUVer_V3P7:
 		return GENMASK(15, 0);
-	default:		/* Shouldn't be here, just for sanity */
+	default:
+		/* Shouldn't be here, just for sanity */
 		WARN_ONCE(1, "Unknown PMU version %d\n", pmuver);
+		fallthrough;
+	case ID_AA64DFR0_EL1_PMUVer_NI:
 		return 0;
 	}
 }
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a2f4e769a4282..e4ad9c171c7ca 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1059,10 +1059,6 @@ static u64 reset_pmevcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 
 static u64 reset_pmevtyper(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 {
-	/* This thing will UNDEF, who cares about the reset value? */
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	reset_unknown(vcpu, r);
 	__vcpu_rmw_sys_reg(vcpu, r->reg, &=, kvm_pmu_evtyper_mask(vcpu->kvm));
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


