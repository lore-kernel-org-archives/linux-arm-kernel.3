Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B85CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xa5/25SiNRkAqSjzYKvz46uYWaA8u0CL9trp73+tAk4=; b=Rm7Ccco1Mb3nsgbkVMJvqP0PRB
	FdlSzFkgrHVTL9WvGXcoiERk9dMwkKCZWguYsR016G1vzCDXMfMEHD3IIiE8sCQsMQwb1n6Ro86TD
	Y/Gou61t1ENFkrkZuxkTCkeZWRVmlPon0r0Xb8DpFCg9E6M73D+huL4sMmXm9Auja8naCd6bghbzo
	Iu1+AZP8SoTaGAwr0MGygfwtAIk9CrnoItGeMyYmSCiBhgU4kOODce/4zuBFyL7hbrF2BCNQSP+2M
	9aBUzb+0Q7b47rAJbCutJWe5eZ0GVffjVEJQIo+oXKvPSI24/SXSC8im7PCin6+Hq2CpsDO2WkEwi
	LWvBm88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY09U-0000000AoFT-1qrh;
	Fri, 12 Jun 2026 11:34:20 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY09R-0000000AoEx-4AOt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 11:34:19 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-691a67a7b58so690424a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 04:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781264055; x=1781868855; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xa5/25SiNRkAqSjzYKvz46uYWaA8u0CL9trp73+tAk4=;
        b=bxngW0lqzXbz8wmOpgv/lVSJHbwtbhF8Pv0ZtrYTXyQDxRTwLZfz/jHwKPsEGaIMmr
         UNTVKD5AFf2NfaZz0pluzG/2fSVAAxt98bwuasImFcG1sW1bL4vFBAJbiNF1lWQS5gNB
         LJbE/ykY3N2sXt6WUdXtxa4ZBKOg6YPsn+a+I+1SPk13567UyI7Y3/sIrBI+fR+l5gGP
         xhdFxiwUrrbR+Z57jrSQzR6xAwr2WY1LNSF6jKxn32OVpPW/SDJSpdjKciCNuU9HqPmz
         zgMsfnDQO/G+/3Qc7OtXTt0oEpkBPILX49j9XOL+4TARjYtTkM4Ylyn+SSkYM++C9mQ7
         rr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781264055; x=1781868855;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xa5/25SiNRkAqSjzYKvz46uYWaA8u0CL9trp73+tAk4=;
        b=bu7nzSLfemCfD0LzXJY9IGMocoqj+5FKdzBT5qCMoldFSNU8h/WUwU9bzh05OYWSU7
         JmfiB6Cxa0qHdspDFGQvrZG1MrR8cEwdaIDYH88Z5E0tOyjiG0cVwa8BAChC+ufY79Fm
         dbyL3qDkVvOllNXSTHgLgRLiZGKGipP4SQtf9POvCothftmNVfxbjhJxYzYZShPh1zOI
         +69E0Sx7nxomNEasGgXipH6SUTr5D92/Ge99D7bYpOqXPgiIveQobbSxdkiOgzC3ciYY
         eCCI0lu8Us6L4PW7O8lQZLr1a0DbtXCf3G6mGE+egJFYkSooDrN4QXWA0zrOk2mMSM2z
         1xYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nQaRFjUHFxHqzQuMbk8dHe1n4wWlr8DJoDPlHbAEhjJlT7gWKVAVHLUNLBabrbAmV6JtcDsniZ7yFQ/uoRJwG@lists.infradead.org
X-Gm-Message-State: AOJu0YwZaIC1wfe4IxuJtlg0SRmVKra/F4cQXL+CN6EJ8d9J1Ammm/9S
	l/7Lg8EmwbfF5eg3Bjh1Ergg7gxsixDRtTm6H0uAX7H9bPh+1kWUsV9MierlXDY+ASuZZyCSVWX
	T5w==
X-Received: from edber23.prod.google.com ([2002:a05:6402:4497:b0:691:acc4:471e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3607:b0:691:956a:cf6a
 with SMTP id 4fb4d7f45d1cf-693785fed15mr1080488a12.12.1781264054903; Fri, 12
 Jun 2026 04:34:14 -0700 (PDT)
Date: Fri, 12 Jun 2026 12:34:14 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612113414.1022901-1-tabba@google.com>
Subject: [PATCH] KVM: arm64: Sync SPSR_EL1 when injecting an exception into a pVM
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Andrew Jones <drjones@redhat.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_043418_071206_27BFD244 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

When pKVM injects a synchronous exception into a protected guest, it
re-enters without restoring the guest's EL1 sysregs and writes the EL1
exception registers to hardware by hand: ESR_EL1 and ELR_EL1, but not
SPSR_EL1. enter_exception64() sets SPSR_EL1 (the interrupted PSTATE)
only in memory, so the guest's handler reads a stale SPSR_EL1 and
restores the wrong PSTATE on eret.

Write SPSR_EL1 alongside the other exception registers.

Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
Reported-by: sashiko <sashiko@sashiko.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8c3fbb413a06..1a7d5cd16d72 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -268,6 +268,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
 
 	write_sysreg_el1(esr, SYS_ESR);
 	write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
+	write_sysreg_el1(read_sysreg_el2(SYS_SPSR), SYS_SPSR);
 	write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
 	write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
 }
-- 
2.54.0.1136.gdb2ca164c4-goog


