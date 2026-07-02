Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71534C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Un4RsCE8ClG46waU3EoWIfi0gOM5MfO/J2aFh49A2VQ=; b=Jtqe4L6HFglYLUNxW2X5KnbkmG
	MVgY/ptZI9fjIhJWKbK0LnxK6Kxwl0wA1/KiAisJRm+bfc+UvJ0mbQ0fClYuImTSKAR0F6GuPvASO
	HOAPEslxnaJpLsJtSTsDvDlMmEHN20EAk8rx1KdwXZkr0JWYxjDvLecIAPJQ0hQ/XQROofvI4uDkE
	FG3X5AZozdAOLxTkg8Q4vePg9lH/hDheNgLjVFGHFLNwMUlZQztMsmQf2vJCbfAxAFZGokITBPPNN
	dKBI1vACewOdMQkPFAZzu4O5ow1Xnawfb3BRUkIKF+WhPxZNxbCPqbkKsmU/rTLMu+mqbOXyRdBcB
	6sRoqtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEpK-00000004Bo6-0jYS;
	Thu, 02 Jul 2026 10:39:26 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEpH-00000004BkM-05oA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:39:24 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4744b72f90bso1164564f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988761; x=1783593561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Un4RsCE8ClG46waU3EoWIfi0gOM5MfO/J2aFh49A2VQ=;
        b=AXRFCGxQ4LTQpjt2gfQucpLNwGaYFrpvoTeVvjZ6zyQh+ILygwZI6Bghhe5fyk9hIT
         yBBH4cqFp/atbPH/V5e9evwjqtz7L1/7cTB9DVlzwBHScU0RF3yOP2ZQyP3hxwZh9b1O
         aWKatnYbVffIg1snqVJOpRdML6+iyE4JI68fBH6XqZISBUJZE+8W089OLrCn6jyl2r+r
         N+FqhMMBWAcraqmr5PlUHnkDE0FzyFEuD867AU0F1+TBsf4HAg6ZEuz5KQkKVMldydjL
         QlfTpbVrEvdLMTkAlwdZ6hazHrZ2uXSVrJiZMSdbk5gihvCwN924IUWcWGQdjTl9qNx9
         BcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988761; x=1783593561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Un4RsCE8ClG46waU3EoWIfi0gOM5MfO/J2aFh49A2VQ=;
        b=Rz29HX+8zpLQhRdwDZvOTm/ncmnlgOMZrgRHfASzXaaoFZwWgidN18Kai1751XA03G
         HdXRPDexLlqI86d/CqO1GhYHeeOjQ2b2lvLU+7TkMbgJmR4gPzMd8aBwmA4wjQDBhHTO
         s+L64/ejpqwyHyXw8Vw6v/vMmQLIZz9QXfkdDGKICAacDM1OTGUz+Gu491oWbpGJGcZ1
         +9NT/i4l9n+m0sut/CoKAmQ3zHTtmewI5RDoxdbROXNdQa7z3z1rRZ8XnIUozjDU9JV8
         0vb8e+ALZTtT9PT3mIEk+W0hLeC0AhTfGzeZbuCpwD+QoNv/JLi9Dz7OpmNW4LVaFeNS
         55Rg==
X-Forwarded-Encrypted: i=1; AFNElJ8hBBnYFjdtBUWBWLQJPrcWGAkldLCIJqQMURUEbIBscRajqlKKzfkLH/Z2SdwR6KpymcAIlw/u2oh9ZE8qh4xV@lists.infradead.org
X-Gm-Message-State: AOJu0YxMTjnPQITZ2zSYC2Xci2jsc9/ux/a1hndkDWd8+hQxwt9ZAhVq
	ufE2DkgxIDrTRo3h/yzl3bDAijwf20poVm7B9HaVDm+pHjuZqCPK9yTKT2TXNpBvgXLAyXnEowT
	H1X3Bq1hrJyvS5irNYq6daqZn/7yaBA==
X-Received: from wmbjp19.prod.google.com ([2002:a05:600c:5593:b0:493:c562:3fc6])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1594:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-493c2b7dc45mr45687565e9.20.1782988760577;
 Thu, 02 Jul 2026 03:39:20 -0700 (PDT)
Date: Thu,  2 Jul 2026 10:38:43 +0000
In-Reply-To: <20260702103848.1647249-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260702103848.1647249-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260702103848.1647249-7-sebastianene@google.com>
Subject: [PATCH v9 6/6] KVM: arm64: Zero out the stack initialized data in the
 FFA handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com, Sashiko AI <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_033923_076128_3CF7E2C4 
X-CRM114-Status: GOOD (  13.82  )
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

Don't leak hypervisor stack data when using the FFA_VERSION call.
When the compiler doesn't support -ftrivial-auto-var-init=zero option
we need to zero out the stack initialized variable before returning data
to the host caller.

Closes:
https://lore.kernel.org/all/20260616160016.C62C81F000E9@smtp.kernel.org/

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Fixes: c9c012625e12 ("KVM: arm64: Trap FFA_VERSION host call in pKVM")
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Link: https://lore.kernel.org/all/20260616160016.C62C81F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 9c96e72e522e..a327c2bbb6b6 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -880,7 +880,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
-	struct arm_smccc_1_2_regs res;
+	struct arm_smccc_1_2_regs res = {0};
 
 	/*
 	 * There's no way we can tell what a non-standard SMC call might
-- 
2.55.0.rc0.799.gd6f94ed593-goog


