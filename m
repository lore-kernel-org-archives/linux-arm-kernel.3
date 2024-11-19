Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA48D6C299
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r6S4rOH3+OQSdJMr5U+1w/fQ9eAelD/5+HuDvTmNypE=; b=kU9bJIwEFFMC8BJDS+VO7elgXf
	4hbGV1rUsxCcAcAHkCQzSsaPLD2tSy8lstJhdqt7B9hBQh50WJ7tUwVtrXWFx0Sf59q+oxtxZn5J0
	fjHpGydBmBEeFc8ZLGM+NX9Vo9C1N+vIzjTGmr07m80/0Qrwh96OfhUgwuFObGW6zDwJCqQWNxsUS
	aX/9/9B4ClaaZYiLGqcOcTKfAeaESgI8yNTBlYWNttEb3nYdVfXAPzFU2hXvmqUAawg4Y8SSzeEIX
	RDDaRlpI+rpuUYgRYp54f8nAUOo4o7XVs1R3U+t/kbpuVwTxcOW8shYcMCJOAjPT/40WzosHtyt0L
	c9ZOnibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVK4-0000000Dm1r-12SK;
	Tue, 19 Nov 2024 20:59:44 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVJ8-0000000Dlwt-1qGY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:58:47 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e389ef22432so4313347276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 12:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732049924; x=1732654724; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r6S4rOH3+OQSdJMr5U+1w/fQ9eAelD/5+HuDvTmNypE=;
        b=GoV1h9BF1faXxI4/kHDKXq8sE2olU1IBtII1tiZhSq+W+HGPQUhf3oEKpPLoUtWI/e
         jWryxhA4lg8cRU7oZY28Yv8eyLhbPfyQ6prQh6dRdribXAHXto1AtU4gi6gjvmgDmvag
         Sd5DZ+zoQKOUb/WQMoU982b/0/xdqlyZjSA4APv2SrVs68tHcoub2nOls5lVz56a4ESm
         yqxcw8/dx/9tGi7JBuzlU02OSgodbQWbLzek+yRlLIi0moDq/CnrXUUfA1tK0g2DU+WZ
         IapDUAkNTbOtmmfcN4n+CVqe06mxF1tHXsMQ1awUjzUnGqTIYWi7AqMXmowsr/cKTLSg
         cjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732049924; x=1732654724;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6S4rOH3+OQSdJMr5U+1w/fQ9eAelD/5+HuDvTmNypE=;
        b=lSzMUIrN5JWg/Hop65RlLILQ+H/rTT3A1TdHzIusEOR+ZWFZ1f7HLxv52ENzt4Kzfy
         S3xdmozVi0V7dUNeq0rUtfzR6bG4xIsBqgEpmPY18Vqjx0kIrMCp8Wu3hKHURyBGDp0K
         iUv1S3Ohrf+VjT8W5vZ/QeSKeNZBGg/Gb2VHwIu9AnzYn9OEjdN5TYbpUbwFMoGA14e5
         6VuRMjFuedto8R1iTLurcMwXdURs+fY+3qT3jFVGT4DRXJgicK3MrAgB7dljuC/VQyal
         zgdkMynlMvGTprYKgBFPDKBterxAN/B4XC6pSeJZ7aFviUjyZk7Cz9zjpnAnpz4U4Krf
         R8KA==
X-Forwarded-Encrypted: i=1; AJvYcCV8rmLtVSHtGzzENswlhep82Qh5LPewn7MKIwiPOrJaBLhI1hQSI0sjFftJFGKoJATknrxnSnxu8caNGm8t3uxz@lists.infradead.org
X-Gm-Message-State: AOJu0YzPKvqNh2e9UKUd9sbQMz7UUH0I/WQXO083QLAG1ZXofrft5eJi
	4IzH0a++W0S+buRfN+7AonHxu7WDIJfNJkUOmMGmddyeeNT3PpAa6EpqnXhXpw1bBMjp6Fdm1Zj
	zk2EtQA==
X-Google-Smtp-Source: AGHT+IHpK5pQqyJ2pkrSLDCOOUklWO2InSnJR1eVoVoMwnsqp16+77q4Yb5PQps1c7yCQOY0bhbxQaG15qmS
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fac1])
 (user=rananta job=sendgmr) by 2002:a25:2d0b:0:b0:e38:c40b:a0a9 with SMTP id
 3f1490d57ef6-e38cb60bac3mr38276.5.1732049924316; Tue, 19 Nov 2024 12:58:44
 -0800 (PST)
Date: Tue, 19 Nov 2024 20:58:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241119205841.268247-1-rananta@google.com>
Subject: [PATCH] KVM: arm64: Ignore PMCNTENSET_EL0 while checking for overflow status
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_125846_493265_29793C95 
X-CRM114-Status: GOOD (  10.44  )
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

kvm_pmu_overflow_status() currently checks if the PMCs are enabled for
evaluating the PMU overflow condition. However, ARM ARM D13.1.1 states
that a global enable control (PMCR.E), PMOVSSET<n>, and PMINTENSET<n>
are sufficent to consider that the overflow condition is met. Hence,
ignore the check for PMCNTENSET<n>.

The bug was discovered while running the SBSA PMU test, which only sets
PMCR.E, PMOVSSET<0>, PMINTENSET<0>, and expects an overflow interrupt.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/kvm/pmu-emul.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index ac36c438b8c1..3940fe893783 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -342,7 +342,6 @@ static u64 kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
 
 	if ((kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E)) {
 		reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
-		reg &= __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
 		reg &= __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
 	}
 

base-commit: adc218676eef25575469234709c2d87185ca223a
-- 
2.47.0.338.g60cca15819-goog


