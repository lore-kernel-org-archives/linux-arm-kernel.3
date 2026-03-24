Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40524F54ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=as56aPNtWm44s9wE7zPwXim0QPC6mmk0ed7R9T8xyHw=; b=vkk9vhV0/aJknAZFEE66T6xuXL
	s7D583FH7sUkO9ZJA1GDG/w3QQ70tH/SJSxCme4Rurc+cSiZb8zp8Ebac8x/UYI8WyrbTtwHiC0QA
	yWUHOSkloEiiYjYZyLZJQgBTkWEZpZcQS9xTykxUFVs+qm1nt9NBcs2PnI/++VsYfMeTy1MI3NPdV
	/oiEZtQK1s8I8M9CxfN5kELnXzCT+R5FHoUSFLYCG5u09ZFjGmcZHCsStgp52x7xIzqMJ5ssi6IXe
	xw3tbyV7xJ/fZ6kKDSmkd76f23Aa4wKnMHjM2pfhQhj6L36p9R89BQC6dOvGamg/LpCy2gvQmg5Hh
	7YJsj4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52GG-00000001bB4-2s2m;
	Tue, 24 Mar 2026 13:57:36 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52GD-00000001bAX-2Zsv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:57:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-485375aa56eso34761045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774360651; x=1774965451; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=as56aPNtWm44s9wE7zPwXim0QPC6mmk0ed7R9T8xyHw=;
        b=h6RgdkvI8dCHU19Qvg+8ovDZbQ896voiSm32BhboA6lIgr6kzwBFrM/mSAaT9t1qfM
         H9OSWdhIKwiMYzCG6coSiEUsHuHOuqmxwSfZWWwXMBsd3LlJ/WKqtIEMoPkNe3Ez7Zrt
         5UkPColumI1glGxJD0JC+ZhyzFhlURTEowaM3scUAFn5b8mZkPilbA5xnPr49u44n9RQ
         +11G34Wdl4KjPs9eCWZC6ZbMvGfJowvJkzHPDdO+fj+M4npYRp5qT+51zZyHXzIZl8mE
         Gx7b4tXyhHQ5fZ/cuLxgFTqpbYWLbErz3wQc++JbrJoOPT/cQjF/LOlUKPzI9By4VgHF
         JzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360651; x=1774965451;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=as56aPNtWm44s9wE7zPwXim0QPC6mmk0ed7R9T8xyHw=;
        b=NqLXBOo6YF5MPPRezH2qm2MATDnaMuZiAMeG8fnG7r0kksXxXq15DvlhmUh1LVX2GF
         UVP8G8wOESmr8m6vmIJpZ5/EPfFINisS2W9OinU3sWTPIG1jV+IXIDJsDSabQhmUN0pd
         ZTEyBwmsm5qhbU492gxHBl02++qtKAvg0eh+hFQEqquNmbCEs37iCkInW33jKe7UCpLx
         aF5PKmcloo122l12c6nWLbZTt/wKWhI0PtFZ0cDL4c9CBeGW3aOP21m+IQPaLmgz9N/p
         vJGCw4phxjSOYAzsvRrZjfNlVgMpbD4uikTNzuTK1HbpKOi/u19zD6G4+9d1/VmXECMO
         ZsVA==
X-Forwarded-Encrypted: i=1; AJvYcCWO0yrEVxvmy+MJHqGoomRvVIikqWL4tHyxGDkVxxeDLmTWAxlrCrPthHBvWMJm5DtmN/5RbJe4X/SOm7k54x3g@lists.infradead.org
X-Gm-Message-State: AOJu0YyLcqxZpZ+dGIFMktuNLkretqGDlRfVaPjyaVDxqsS0uG24b5bK
	l82vrjpgS5aJl3CxzzLnfhh/NsOWtwf4R7eIT5EaOXLiwja3x8C0zUPphHze8i5JqZgeCWLJjXR
	kZsSw39XsLtqSBPSIFVCiNvYtwhxr7A==
X-Received: from wmbjx8.prod.google.com ([2002:a05:600c:5788:b0:485:3ddc:f26b])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:33a3:b0:486:ffa3:584 with SMTP id 5b1f17b1804b1-486ffa30b40mr104955515e9.15.1774360651034;
 Tue, 24 Mar 2026 06:57:31 -0700 (PDT)
Date: Tue, 24 Mar 2026 13:57:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Message-ID: <20260324135728.3532400-1-sebastianene@google.com>
Subject: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc with
 imm16 != 0
From: Sebastian Ene <sebastianene@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, android-kvm@google.com
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, sebastianene@google.com, 
	suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_065733_660931_3B83FA8F 
X-CRM114-Status: GOOD (  11.83  )
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

The ARM Service Calling Convention (SMCCC) specifies that the function
identifier and parameters should be passed in registers, leaving the
16-bit immediate field of the SMC instruction un-handled.
Currently, our pKVM handler ignores the immediate value, which could lead
to non-compliant software relying on implementation-defined behavior.
Enforce the host kernel running under pKVM to use an immediate value
of 0 by decoding the ISS from the ESR_EL2 and inject an undefined
instruction exception back to the caller.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e7790097db93..ff6a90a4a4c7 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -756,13 +756,18 @@ static bool handle_host_mte(u64 esr)
 void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
+	u16 imm16;
 
 	switch (ESR_ELx_EC(esr)) {
 	case ESR_ELx_EC_HVC64:
 		handle_host_hcall(host_ctxt);
 		break;
 	case ESR_ELx_EC_SMC64:
-		handle_host_smc(host_ctxt);
+		imm16 = esr & U16_MAX;
+		if (!imm16)
+			handle_host_smc(host_ctxt);
+		else
+			inject_undef64();
 		break;
 	case ESR_ELx_EC_IABT_LOW:
 	case ESR_ELx_EC_DABT_LOW:
-- 
2.53.0.983.g0bb29b3bc5-goog


