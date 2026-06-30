Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4845EC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b11GVtladPRwtAnrqyMBKjVI7QEbzNXpHeXS1BWCw8Q=; b=lVP+JSySfxDpPExxN7EfTdYLxx
	dqRmyZN2prNRLuENgK/x8qsR/uq1XFr3pIcQ9y1PdqL32yPnw33M7EMPhofNVnQHACiuLHkZ/j4TU
	NLKH5kdz9seb/nJCw0S8De15W5rAKzBsIdj63WMcUZotmxcYcEp9Usgn3PtgWgtSmdaPQlc+52FCK
	/qHm9+dwzSKv7KSdvsFEz8a2c17nv3D2lAas6Qx8nzNYQj1399Vb1JbCqV2AKBwTvF2IJkmlSsMEl
	wrqfLRvS3UqGuOw5YKPJdipN0KoipmpMkq6RrBboz1lcE58LKFLNs7id0qRGST48QKzTEiuOP9Lwg
	h/p56wKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVb7-0000000GcRv-3zUJ;
	Tue, 30 Jun 2026 10:21:45 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVaw-0000000GcJy-0Dvo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:21:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4926596eebcso28796635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814892; x=1783419692; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b11GVtladPRwtAnrqyMBKjVI7QEbzNXpHeXS1BWCw8Q=;
        b=ePGdsV0z+OzVEbpnJoPM31T2ArzL2livFYhGAJAH4GcFIPBBPFMUArRvsDb7dQMBPr
         ZhmYHneykL8/LtbRvjEWvab04+6CnRRqt6gYQD4jsHofrqLQtLlUaQX5Z5uN+SBf2Cww
         4WnhTN7APpJST52V+6ZlPeCLtU8RdSP1yj+Quno46wAXAG6JVYVY5FmXLuJewRr7MWvi
         Hcd9Dsd8xVYmoiw+wqVl349K0y/qPWoZp+lDz0lPKxjALXz7PXf/jDAM+HemFHvu1r1b
         pC0H7FAK8hHJXyXhvIhd+Fw8xr8E74IiUYDRUbWhqtwZa+pQXESei3sQ3YwEaU+kjESf
         FkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814892; x=1783419692;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b11GVtladPRwtAnrqyMBKjVI7QEbzNXpHeXS1BWCw8Q=;
        b=fy1PVtcgBrcfODlXfjedfVYVVnLcgjGwTF9GaV0xt6mZC/+aZtqzfKojvwjYppwRJA
         6A07mgfpdXgcgffwSQk+p8D5ShAASS/njBoronViJhnKpTago1Uzaryx5/gUDH/jA9YS
         54KR+nXaIjMl8720I76HvUjrSY1VV8MGXqLTfEsC1xJVhsnPVIILPaABHfXejmRRZWg2
         qoCKaIOIYlitUi0GKcxZyRRT9EcyHhGeKGoUJJj1PTIDuhQ1YGcKbN9E39ziTPjvGkQA
         Ljvo1F54s89kXBUFaySL8KdXW4Bkzu3nmdm6e6jIw63BNfhZ9BZjSD/q3VydnWRS2+Fj
         HOQg==
X-Forwarded-Encrypted: i=1; AFNElJ+6uUf2Pk2GWkkB5HqdmSBvkh0QVqWidNrVPvPcm/8j4ZjdYY+b87lf3NA/ko2pede4bYjMLHlFwCH2SwZJlQ4d@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5I+X2EtqtXWIXYa0QSi7ES4081Y2nL9kZ6jzRrzUk8P0NuHDa
	zmCFh9KuzXL1udyvM1o+/JAyvZ9lc+jIKz8ecEjd7ZRAqHKDd5VaI+ulpp3BwjzPaB/lrVYyRTP
	tCrdHmHFWQgh4kE3QZ6DLxM4dJJf/bg==
X-Received: from wrbdt17.prod.google.com ([2002:a05:6000:d11:b0:470:f736:b5d4])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:cd15:0:b0:493:bd4f:510 with SMTP id 5b1f17b1804b1-493bd4f0530mr3477925e9.19.1782814891385;
 Tue, 30 Jun 2026 03:21:31 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:20:59 +0000
In-Reply-To: <20260630102058.3219867-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260630102058.3219867-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630102058.3219867-8-sebastianene@google.com>
Subject: [PATCH v8 6/6] KVM: arm64: Zero out the stack initialized data in the
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
X-CRM114-CacheID: sfid-20260630_032134_102406_6B87C6F7 
X-CRM114-Status: GOOD (  13.44  )
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
index bb01d8f83056..7407bc4b547a 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -881,7 +881,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
-	struct arm_smccc_1_2_regs res;
+	struct arm_smccc_1_2_regs res = {0};
 
 	/*
 	 * There's no way we can tell what a non-standard SMC call might
-- 
2.55.0.rc0.799.gd6f94ed593-goog


