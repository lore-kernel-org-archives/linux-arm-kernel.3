Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC60CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3da3ndZkq5JxsBN5E/e/pVYoGrUCtX487+oH/FKdMc=; b=esf32acKsKd0C05ZoOd4yfQqXl
	N+i2PT2dWRehgeg4REbLVmmO6cm5I01qnb61uNIJvIVZ3HqTBZ6yIZFh9MC02ylqkPGB63jIx127v
	tkF2VYf92HOW7ewT67+3LHf4lu36GTZN5wwFiInc+kUtAMt4Dw0cYHHGm3UK3qS9T/5OTQP4WwS5M
	/CXcaiRntBXi0ME/N5rQh7+HdIEx/3cJfYiL9fYKdP1OcIGPFjBazHFMmWJMOPO5b8sC4bMeLFSU+
	hOnE+RjV+Nsw3gLgs70+7KWIDXS06qF6uMi8bA91rkEzvGzayzZ66bNMp0g1IPFwZqNFAA/tVfGPx
	CqiSPqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1mD-00000007FS2-15GT;
	Wed, 30 Sep 2026 21:23:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1mB-00000007FRu-48kl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 21:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o3da3ndZkq5JxsBN5E/e/pVYoGrUCtX487+oH/FKdMc=; b=GRfsOjKutYaB+C+/B4+ZbCfMQS
	ayAs37wguNrVOzNFha/e7UjV4xZnfq62kq1tTGtpUff2Ex3JBxZWhY4LwURZhbKpJnwP896K58pnC
	xhKcHoPexS6wVPlBIcLBezoC68tHQAtvf7BJaHrLJ/mThDccnIPCPLZLKQEbDfkjrck42P0pJ0NSh
	7+XE1IYk9SR1MYM7FTzBWHOWALpmAk1cPKQnGuMERtxignCHv7w/+noHv+GTN4VKzpk9oWu5F7FLB
	5CsIVYM4WOR2nMVixqD6AMo3qhv1EhNHdNIqYoot02Dy/N+c7Cq9Z/Rql+1geQCUTbScNlHP795eH
	V7cQ3oAg==;
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC1hc-00000004Jdh-2HSJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:23:22 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4cc89e86e4dso8825531b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790803117; x=1791407917; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3da3ndZkq5JxsBN5E/e/pVYoGrUCtX487+oH/FKdMc=;
        b=IcYKLDlp6REBD/QU7SkcljrPAdTVQfRQYrYPIRZ1iodRO1VWkyt23gHSckxWzYpnF+
         fAM37KAsvd/F3kPp9ZwM2cej7CkDref1JtHQSLlzR88ms1+86O8J4c+I+qaljdHuhOMp
         d1UrD2gsG7rI9etfUwsQcpDq4r3Vkx/ZLWZEH18g3yudHWlkCM4HE1jD2WXsp7VXh1VA
         kB/C0AaTVebh2D22wD7B7mqS/eLgCgZwrRAoLI+/0lO5F5xATwZMnTT50aXQEa7mFr7Q
         FvaZBP9WHbCG5Ec/pc6PReBP2wExVZTWZ3FcNPDNsOmBDl16Om76x5Q/kP0JUYC3hRfO
         aqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803117; x=1791407917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3da3ndZkq5JxsBN5E/e/pVYoGrUCtX487+oH/FKdMc=;
        b=wvq/z/aA+EMKcBp2BKLeK+jLaOx+LQeXiEe/5+Jiqdi2rXvI+8CvDWDjzmyeuAJNCb
         P6IcbX3U8/MEVv3et9Pa57+azD7UZ3vR1etHs4XBnFCJItK/9vPgzeaBx1ovJgiJUXGh
         WTEAgV3QeNIasy8iC9t3ezyx/M82MYbsNrjHTnj+hlbiE4epAjHuXhbm8IwMhjtmAVUO
         7R3uCkkgYsbg0NhUYtbo6op+72qh9sSaSu6qK1rx2W/FAGBMkE1u790cWfXbJZM25vNv
         yuBrQk4el+UPNvXMcg6k9br/6yOR2S7NzWZSN5qYq+uinpFwjYOIqhxK9m+R6TmE6/Dz
         JfOw==
X-Forwarded-Encrypted: i=1; AKwUvBzKHFsmTdd/f6BXw1qM0aoB+verG+Nrs1KGkj/Q+w3uCnRba70V4jEle8pRTEHm+ISWUjQVxmZiUX3PPe5jl92F@lists.infradead.org
X-Gm-Message-State: AFuF++khy4yGfN0iEVKRgBWOLoIm7ah6EpjvpvCBW65pFlCzYUvVIZNH
	7RYajskHGS4sG5PLCytQGGaiUQ+1rYN9kAK02fTdHxhkHO5nLTd6qDUDzNjP+uPYOad6P9hDR19
	gk/EoS90kg8fXFwhsVpiAr6ch4w==
X-Received: from iobir24.prod.google.com ([2002:a05:6602:7158:b0:9c3:8b15:2c82])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:138b:b0:4e8:d530:daf6 with SMTP id 5614622812f47-4f1b6c6e13fmr3792236b6e.26.1790803116491;
 Wed, 30 Sep 2026 14:18:36 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:18:34 +0000
In-Reply-To: <20260930211834.2773546-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260930211834.2773546-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930211834.2773546-3-coltonlewis@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: Check ID_AA64DFR0_EL1.PMUVer in pmu_visibility()
From: Colton Lewis <coltonlewis@google.com>
To: kvmarm@lists.linux.dev
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_222121_745514_CA625D63 
X-CRM114-Status: GOOD (  15.26  )
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

pmu_visibility() currently checks kvm_vcpu_has_pmu(), which only tests
whether the vCPU was initialized with KVM_ARM_VCPU_PMU_V3. If userspace
initializes a vCPU with KVM_ARM_VCPU_PMU_V3 and subsequently hides
FEAT_PMUv3 via ID_AA64DFR0_EL1.PMUVer, KVM continues to expose the PMU
system registers instead of emulating guest accesses as UNDEF.

Check ID_AA64DFR0_EL1.PMUVer directly via kvm_has_feat() in
pmu_visibility() so that PMU system registers are marked REG_HIDDEN
whenever FEAT_PMUv3 is not advertised in the ID registers.

Suggested-by: Oliver Upton <oupton@kernel.org>
Assisted-by: LLM
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e4ad9c171c7ca..46dd6e16de28e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1029,7 +1029,7 @@ static unsigned int hidden_visibility(const struct kvm_vcpu *vcpu,
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
-	if (kvm_vcpu_has_pmu(vcpu))
+	if (kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
 		return 0;
 
 	return REG_HIDDEN;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


