Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863EBCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUcArKvUj1jkcs2OK6MvhEPcHSKMY4c3Dv90/tfztKo=; b=OkE7lp4ukFadlr45dZpfzi5D3x
	tFcSzgnkvkqA8UI0C/VudmU54eKfgOzYkxynH9a8VFWUY+wAuSCYjwxGTaIT5eoaojkir8/M6Gg/W
	tY1OHBByn9y+foJVG88yGRYJPb+KC8Pb4m8+8BH3VhOJmV/dE7ftqgQWwm1Y735blN7I4RyyuRhS9
	sdIi1Jx5oyrgBtKiZrXCRoU222VL1tA9SKmR0Wy0IZRdHI+FQWOkykC3fFc1mbPLSh5knyiOdiBhD
	5kZmtg0+1KMIn1VjFdc1FQJBvF2VeSIon9L6LhD0Ywo4kyuP+MDGoIJ5yG0q2ubXrq2+qVUWqMvws
	mvl3sVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKqb-00000001izS-2vcU;
	Tue, 19 May 2026 13:51:01 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKqZ-00000001iyv-28Ut
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:51:00 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-50d876329bbso37025831cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198658; x=1779803458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUcArKvUj1jkcs2OK6MvhEPcHSKMY4c3Dv90/tfztKo=;
        b=o1g1aM2mrofWF+PHu6QFC13msUZbqQGRSKjPUgzjiYG2OG2QOUMTBBLb85GyvqsVz0
         kAmt60Kog/BcSNrWyIZtzuG8y85elUBe4NG8aDnyn/AAsKs7k7hUBUIWNcH7HiLYPBSI
         ZfvyYtaERqfVqnPPVKC3l9DobMcfuATk0lKYpxrGb4qpMEqihuP26j1w86frZRM/yDSh
         S20vua6SUYrtLY/0rPpm/5OVe6ulkjqthtVVb0luXEczxjpq5xLrDFjfZbtxmMWZAgMV
         pM0zEekjaX3fvCC6QM52UH8SNtEhDFfm8XafmFUOl817e/03OLARaQVfVvVortIV1vII
         7AKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198658; x=1779803458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yUcArKvUj1jkcs2OK6MvhEPcHSKMY4c3Dv90/tfztKo=;
        b=i+7BksOF8d+Ct2IHWiaTe02q9S+/KJoH8GuySQ6t4NUZKLaH63E9Q3wQcNKxX+7UmK
         F4zctUGUfACrtuV7cfPtUxl2luIy2H603aEty/Z1+/Pjq/eBIwRnI9PUY5+QvofGwLpH
         DnKQ3E1/qFHe2evCEDbN/U8dLdkXqYvvT9f/LRAuPDJsHXbJl6fmiFGMaKyEuTKo1DtD
         1AuLZGkdN4R4MabWJzSN7c3ufquNn2YHkHcS+TQS2P59lUEqEvlMp2j81AFsvUl2zJyE
         hWcYl6q/+ZS4KHRN1m7xMKRFA0IgomQ+48CldoB509uTwHFRTpedOAXByLKDSKhzlSMH
         OPOw==
X-Forwarded-Encrypted: i=1; AFNElJ/AUTv90NOR/MhT8hUM3+uSXCyf4COxbI2QBxDss4ULexjC1dZDN9Siai+Q6itL7cwWxNZsIBAfLbvPAMEV+ODv@lists.infradead.org
X-Gm-Message-State: AOJu0YyolQCGMi+nVUnRedppcIS/6ZqqdTMCsKvn1ruagMKcCeh4g1tV
	Yg6B1Nui/SyE39ENfoLPOScj2jZ+DQ8YC8/J+Eb6zemUO0laU8SU51As
X-Gm-Gg: Acq92OFNP+m4QnhrYsqITnLD1pQm18bBXtrOgkIUCrUy/z/kDkTea4nhXzw13CyazUQ
	1OTl1438MlfHG3VOcgLm4Mh5js1/aSJv2rKu+nlxbHnfQmBZII1WsKgwyRx3sAtiFDORKhqhRuz
	JXGTgX/mQBoI+3tB4Pc8QTTlovv7bToLD0eJbBfugI7ZYBtlVN+jhaTjVLdjdzfdofuyyFVwMkP
	H3LRl5hPtF5vuRvQRX/3VmBVjUST55jVZjrg0DjG9neQAZNT48xA/6M425ekEAw7S2MlRm+lCrp
	yrCFCZ2P5e6VFdSXH/Dy8+X7XvUSdz/Qn0mg84nTUTaHYISN+IcD+nvKJPlSxcYNOYBBR6VZRd5
	TtwJWr/jpHYT7YtUJuZ+V4HMVKgeyJyCdIOiOpr1wGv+XoQ7OzwT8+uHamTqOW082KnrV9Jfis8
	XLY2jK8ks1mubVKkhcg1IiknfYOJZKY/kWy+hHAQ4xE5Q50kYcAPbCyo2FNoMm0NQy7LSejflhP
	PBjwqowcD9pXACvgvlv
X-Received: by 2002:a05:622a:5e16:b0:50b:445a:4139 with SMTP id d75a77b69052e-5165a30cb12mr283906821cf.54.1779198658020;
        Tue, 19 May 2026 06:50:58 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516457da48dsm162585401cf.17.2026.05.19.06.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:50:57 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: vgic: free private_irqs when init fails after allocation
Date: Tue, 19 May 2026 09:50:42 -0400
Message-ID: <20260519135042.2219239-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517181331.367676-1-michael.bommarito@gmail.com>
References: <20260517181331.367676-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_065059_558468_E06E8DAA 
X-CRM114-Status: GOOD (  13.49  )
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

Companion to commit 250f25367b58 ("KVM: arm64: Tear down vGIC on
failed vCPU creation"), which added the missing kvm_vgic_vcpu_destroy()
call to the kvm_share_hyp() failure path in kvm_arch_vcpu_create(). The
kvm_vgic_vcpu_init() failure path immediately above it has the same
shape and still needs the same cleanup.

Call kvm_vgic_vcpu_destroy() when kvm_vgic_vcpu_init() fails so private
IRQs allocated before a redistributor iodev registration failure are
released before the failed vCPU is freed.

Fixes: 03b3d00a70b5 ("KVM: arm64: vgic: Allocate private interrupts on demand")
Cc: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
Changes in v2:
- Add the Fixes tag Marc agreed with.
- Add Yao's Reviewed-by tag.
- Trim the commit message.

 arch/arm64/kvm/arm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 176cbe8baad30..5d5e2f81b9c94 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -554,8 +554,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_destroy_mpidr_data(vcpu->kvm);
 
 	err = kvm_vgic_vcpu_init(vcpu);
-	if (err)
+	if (err) {
+		kvm_vgic_vcpu_destroy(vcpu);
 		return err;
+	}
 
 	err = kvm_share_hyp(vcpu, vcpu + 1);
 	if (err)
-- 
2.53.0

