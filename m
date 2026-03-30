Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976C3FB3D1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCpQaHn340hA9gXHDWXNQio0q+3ps0T5nKIr2QuIXig=; b=KmghbGAAEoweof6b+NVQofEpq0
	Ev4SHh/tzgaKXPnrtizV4AW4fpx4aEZ5CHENWtX4kjXUdYVT2hAg4ctjefGE/T03k2n4vwRcRdwuv
	NUT+tKBLPfxd4cgH23fzKYBu9mtc/4KbMEAHX2Wkg5wJNLqnqQaZS5790DUjon3CHnItYQf0YHDlv
	nVV2oQPXbeWNw6R/N1m9kJXE3PwInjZiqjEBJHnIAIUrRF21q0IWFRk3EzVW6FbbrXKqwYfd+63YR
	Mtn1KzpVat6/JTTOzmApP5UWhJGihk0pPrRJy0JFdJ3gYCXXF70vpzcHQfMPCG02/w5Wkii1kcstF
	k1AQKj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AGh-0000000B71Q-0NMK;
	Mon, 30 Mar 2026 10:54:51 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AGd-0000000B70d-1ziI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:54:49 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4871f6712ebso26174115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 03:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774868084; x=1775472884; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OCpQaHn340hA9gXHDWXNQio0q+3ps0T5nKIr2QuIXig=;
        b=M+4oqmHS/94RhYi0YxO6zi9rnFDbO6t7KmhIEecYeMg/QHUcAl59zDgS/kmNcdT8EJ
         /DiwzCV8HGEh1hb+FdOJSl9FoN03djrS7N5TeHTezR/Yh6dYdhEfNeMzD8c3Yo7Ea4rN
         0snDS8waWfaHkLV8uJIjtujghOxco4/hGN49+fHKdd/c29HCVOhGKS7/wFftp8JtgN8f
         MuA8nAZ0F0HHK7f1UR9G0/aBsgeBDKDR+2hw+FUuUHFxn5q1FQihpNU7dJ1X+GDYWhwy
         zOdVggW0NnrW+TSk+qP1GgHrjI9gRb1iTUbj8bgSBc3f/9GpLQ2Xxgdx+LGNS+BG9WPg
         4hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868084; x=1775472884;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCpQaHn340hA9gXHDWXNQio0q+3ps0T5nKIr2QuIXig=;
        b=M3AB1TWciKVdpQ+zyonL/thG072zLF/shhEPLfUBtUaX0GFoS1LzlSPE8ibKyUlzl6
         FPT53Cv3NFrkzNFLAyrdrrcrcYOEjLDZt/GuY8Xnz5gb/X/W/RltORAcK+Jm22KyBrkm
         RVGpWJfOV3krr957M2Z9AGvuupQ59A3X/1xeXMFzGnoynHr+sVQeKIMXUb7MUwAruxtP
         HbdaWsJoHoV5rYb4K6wipfj9harAxbwlPuFbVy0dszo1JIOasfO4vA2H6kgDelO2xlGr
         Z7yATdYbDxnA385nEyb0ZNF8XBUGGWPg1EnYPRi03GuhqeX7NhE/TRorZIimMbLRi7qC
         yzFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWiv9h9JfO7JxtvBbWk2fbpvLcYOQQrggSmM3w8Fmd4fuXcLa13gAYdfK89eE9htLsyYAmoSmgz9McF1rMGSmj@lists.infradead.org
X-Gm-Message-State: AOJu0YwGnRH5YJxYKHWGxtEe3rM5oLGN5KmyyYrUDFGyMSVdREUX31ha
	IJsCxHPTYa+TuqBmfp3Bib63atV2lPsIrWSSnJpOaGaWha5EWCSzUh74Zbo5ohDJrNhvgDQDBhQ
	R7uf/eat5tKK8pQcacMOy/J5O3u4eXw==
X-Received: from wmro3.prod.google.com ([2002:a05:600c:3783:b0:483:41b6:adeb])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5290:b0:486:fcdf:c065 with SMTP id 5b1f17b1804b1-4872808d317mr201624445e9.27.1774868084528;
 Mon, 30 Mar 2026 03:54:44 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:54:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260330105441.3226904-1-sebastianene@google.com>
Subject: [PATCH v3] KVM: arm64: Prevent the host from using an smc with imm16
 != 0
From: Sebastian Ene <sebastianene@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, android-kvm@google.com
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, sebastianene@google.com, 
	suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_035447_558729_DF77A7FE 
X-CRM114-Status: GOOD (  14.72  )
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
16-bit immediate field un-handled in pKVM when an SMC instruction is
trapped.
Since the HVC is a private interface between EL2 and the host,
enforce the host kernel running under pKVM to use an immediate value
of 0 only when using SMCs to make it clear for non-compliant software
talking to Trustzone that we only use SMCCC.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
v2 -> current:
 - move the ESR decoding of the imm16 in the handle_host_smc where it
   was supposed to be
 - updated the commit message to include the reason behind while we are
   not doing for HVCs as well
 - updated the commit message to clarify that pKVM is not handling the
   imm16

v1 -> v2:
 - Dropped injecting an UNDEF and return an error instead
   (SMCCC_RET_NOT_SUPPORTED)
 - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
 - Updated the title of the commit message from:
   "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
    smc with imm16 != 0"

Link to v2:
https://lore.kernel.org/all/20260325113138.4171430-1-sebastianene@google.com/
Link to v1:
https://lore.kernel.org/all/20260324135728.3532400-1-sebastianene@google.com/

---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e7790097db93..461cf5cb5ac7 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -676,8 +676,14 @@ static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt)
 static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, func_id, host_ctxt, 0);
+	u64 esr = read_sysreg_el2(SYS_ESR);
 	bool handled;
 
+	if (esr & ESR_ELx_xVC_IMM_MASK) {
+		cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
+		goto exit_skip_instr;
+	}
+
 	func_id &= ~ARM_SMCCC_CALL_HINTS;
 
 	handled = kvm_host_psci_handler(host_ctxt, func_id);
@@ -686,6 +692,7 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	if (!handled)
 		default_host_smc_handler(host_ctxt);
 
+exit_skip_instr:
 	/* SMC was trapped, move ELR past the current PC. */
 	kvm_skip_host_instr();
 }
-- 
2.53.0.1018.g2bb0e51243-goog


