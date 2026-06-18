Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B59CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CWrIkL6+XzrRSwpatYKrxag9f+rKkB9yY8JYBbAq+c=; b=qL31f01X0GxDcPPvUEPZGGNMbK
	HydTXpexUMW+zqOzTqnvqKk88tDk3CPRVN76guC5vJKQ8N5YI8katafFM9TqKUF0+KIeQxAQ4onHg
	ATBq4zK7hq1T9cm11O4VHOJR16bjrN2C7gwEKigkD4butPzTufdqbjYbZbEimEvmRgtXqpvTLBL9c
	zG98xcizX5lgLWW53JGv8jY6gPEVjtyl1c5X8n9w/l3lfE13/Z3l8e3Zo64ZNDEueMXtPdJO7qHMo
	splVVQUKwB1boO1598t0i3Kg6/sDR099RjHL7K2AA9vAs55QJ5dIGCB2531SSgPJeRk/jFLJJJHxb
	RmIfv8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfy-00000001F1r-1VrJ;
	Thu, 18 Jun 2026 12:16:54 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfv-00000001Eyq-2YsL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:16:52 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490bfd70b0fso7611185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781785008; x=1782389808; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0CWrIkL6+XzrRSwpatYKrxag9f+rKkB9yY8JYBbAq+c=;
        b=vWlFduoOrVrNbY9T7s71+Yfs0wxwIJABRfirEDCpNWW7MqU3PEYBpnhSgfN6BJmOi7
         +hWpoemWnIWYaa38X0AjDac99tgIuxXTv7R1W/MmZMqGRycA9YVyxPbBS0IgKdIUE16U
         LP6Uhp2PziBVUlkjUzJhVgDGakCW9R9f8ezofDCgKcM7rVdCt7kO6UGknfRWaVAya3if
         U9sFz6gj/jNew+jrmcy6YRcF6t5gapzphN/bymJI5KBDnQdl4QfhJSVV2re0GAX2+QGN
         UUWO1p3jQD+tZzc1lDwBfDgK1Tf/oMaoFAY9oJXH73XebVYnHUOhXsZpoUpSSb2Lgpvv
         f21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785008; x=1782389808;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CWrIkL6+XzrRSwpatYKrxag9f+rKkB9yY8JYBbAq+c=;
        b=qHgvxHy8ayuvesg0kGtQgdE62Kdve8gsJxMBFYbshdBL3dhkeRPekYJii1phf4+YhW
         WywFpi0d/ZbQ3Uah86MTvyMQ8IamNL89wTGz9w0c+lUQ3VzMNGX2KLKVpdooCaoTUYSk
         VDo9Bh15k6fnG8jckv/mohpkn9Y0MN1dEzQ8ppB0ihpVV5cLssygQIRwx/5AnjqOyIYt
         JAq3ePi2KFdAOi8CS8jTWKUTcF2lAH4r8xn6pP4eodGNQvDypQ42jevMsDglK1h5fxEA
         1ODxxmM7kA/wTqtRYxFAwkIheeu0pwCe2qRI6cr5baGNYgOn2zyrMQhmWAaRRZiYyl8Z
         T2wA==
X-Forwarded-Encrypted: i=1; AFNElJ/yYnS7jMBvqv5Gsam0goiNDMpIjAAHm2bD61g59krYCWFn+ptghotxdcAS70rLuiz88bPqafEzNzNmyxV5iKZn@lists.infradead.org
X-Gm-Message-State: AOJu0YxbePyFTjjAzAB8GI8XysnPMCd19PW+lYCjFWclwH6LCgjdJ1Tb
	i7c2oT0r9cRh43UvAqr5VBtEik//EIPNEUEnTTWSletL50VFjEcfRiiHztlF4WnaDMjdrn5eIgB
	/rQ==
X-Received: from wrme5.prod.google.com ([2002:adf:e385:0:b0:462:9324:e0bd])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e92:b0:491:ba04:2ce4
 with SMTP id 5b1f17b1804b1-4923410c35dmr117676115e9.16.1781785008175; Thu, 18
 Jun 2026 05:16:48 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:16:39 +0100
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618121643.4105064-4-tabba@google.com>
Subject: [PATCH v2 3/7] KVM: arm64: Unconditionally set IL for injected abort exceptions
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_051651_653618_2507FC8E 
X-CRM114-Status: GOOD (  12.30  )
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

inject_abt64() derives IL from the triggering trap's instruction length
(kvm_vcpu_trap_il_is32bit()), but the IL of the injected abort is fixed
by its EC, not by the triggering instruction. The architecture mandates
IL=1 for Instruction Aborts unconditionally and for Data Aborts with
ISV=0, and this function never sets ISV (the FSC is always EXTABT or
SEA_TTW). For a 16-bit T32 trap (a 32-bit EL0 task under an AArch64 EL1
guest) the trap has IL=0, so the abort is injected with the wrong IL.

Set ESR_ELx_IL unconditionally.

Fixes: aa8eff9bfbd5 ("arm64: KVM: fault injection into a guest")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/inject_fault.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 9dfae1bcdf99..444d219b0217 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -138,11 +138,10 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 		pend_sync_exception(vcpu);
 
 	/*
-	 * Build an {i,d}abort, depending on the level and the
-	 * instruction set. Report an external synchronous abort.
+	 * Build an {i,d}abort, depending on the level.
+	 * Report an external synchronous abort.
 	 */
-	if (kvm_vcpu_trap_il_is32bit(vcpu))
-		esr |= ESR_ELx_IL;
+	esr |= ESR_ELx_IL;
 
 	/*
 	 * Here, the guest runs in AArch64 mode when in EL1. If we get
-- 
2.54.0.1189.g8c84645362-goog


