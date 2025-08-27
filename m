Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D38CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWlEEa9FdUN2zJcQtqepJKUAvgcsiNc6jwdCVzIXab0=; b=wLIiVbZFgYECpULR70/m4Qxkk9
	+6/nWB5qyH3W7Sg7cnUgklW67wu8NTLEtiYz3zPsO4lbJp/JUjyaZSNVIL+a2qXhOZYrmY5ZDbHk+
	gJRkOQz00ej06VGtTFdoby0ko8hHE7wsUU5QoW8Pb/F4obB3KHzynR2KxG4tFXt/4qm3ZLIVU8LSD
	cKI+dUyM560rEb6t7cbcUl1+cNyAP6HgWgRnRO71nhHDJR9oTQe9U3KmI5jLpUqq3etXhRDTptxJq
	T5ZFSzWsclCziVMkWEe3uUT3kGLR7uQnHcFWLx9S5iyOQH3GtmS34CVgSeblb0Wt94jRvAkMYXpnF
	nwd7SThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1H-0000000FC7H-2SBL;
	Wed, 27 Aug 2025 11:08:47 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDFy-0000000F2YH-1cuZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:19:55 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-afe73808e6cso427059066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756289992; x=1756894792; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pWlEEa9FdUN2zJcQtqepJKUAvgcsiNc6jwdCVzIXab0=;
        b=ek27XcFuEN4irgxh6X4EoDyO1CcIWKEI0X1EuR2jpQ7e43kf8N8FGIj4Kedrmha3vH
         G/nn2CYSWGqk739Ta3isLKExKJS4hH6vjwYM598/IJHXLznC582mNdvfqXHROCZoA5M9
         k4ytmlUYMokMWHGrWNboRGx4YsOsgYTLPfAqYtwlTL1Kuio5LCoes+crHv5cuGveTfqD
         97pJA4HwYJaiI86p+/Cqqd+5kPw8nKXPgViqpCpjcWY5+b4Qg3pJ3mGKXpodk/mrQLaH
         S6dNluJQYWN+K/DZlXcmnRMFqoeL8c4Msf4+7Z1ZDh9Fkp7OD+8TFYjA2I6vNJpwVhlH
         y58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289992; x=1756894792;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWlEEa9FdUN2zJcQtqepJKUAvgcsiNc6jwdCVzIXab0=;
        b=NjZZWNKmgEuqeKgGROMZMyhRduqAqXVaD9rV8P9XwVTSJ3Q+scS0YCOJDxsbGB7FbC
         QtB5jZqPN5fz3I8lmnOXUbI6lR4Z2ok5Ff/mdjVuW4O7A2e2M1pC7AwAt43aB66tlrjG
         dtU7jeDESS5+eU4LEIXSfr3oNi2iSoDTbfPC3ryNTqe/ITPzoDWYWfPleW3hG9V7omeu
         /RuSmEkiqbUD3q6rafJBCQ9FDXwoMFvIJ7duJAQuq9rfLQRwajmpXfe25mjnPZ1GF/21
         Floi4MQ8OJzYyv1COehM9AmvCzBDBUYSeppTqU8WACYKFNM3dPUa7Scx5g5v7A1g7H7l
         6a9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDCTWi0qCh/hvao/SiVbAPf2GeQXT7cv4EaJy4AUxQ8tAxUPgwl4hMOK7GaVR2fmGpRJgXcKtxDelsSGrmecyQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxXBILOESyhuiISJGlUjCCdZXCpJ/qLhMbarflrVcLOIwRqVXcN
	mmkU9feHR7QE2jThCrh3RnxYVg0504uxYMiQicqvWSVdjV6F7pagQVJ3l3fn9v4c/N0hfiofBqK
	8KQ==
X-Google-Smtp-Source: AGHT+IFxJhReaSFTqpPGeb6pKgScnDIt4APx3m4DP6X9fzvN0CY8gtebf6nCyPV1qcYxfxLc8vvJN/9tnA==
X-Received: from ejcsp8.prod.google.com ([2002:a17:907:3948:b0:afc:aa8a:a50d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:a4c:b0:afe:6fdf:c27a
 with SMTP id a640c23a62f3a-afe6fdfc8d3mr1146661666b.33.1756289991787; Wed, 27
 Aug 2025 03:19:51 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:41 +0100
In-Reply-To: <20250827101949.4089456-1-tabba@google.com>
Mime-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-2-tabba@google.com>
Subject: [PATCH v3 1/9] KVM: arm64: Add build-time check for duplicate
 DECLARE_REG use
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031954_425931_3300B96B 
X-CRM114-Status: GOOD (  16.12  )
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

The DECLARE_REG() macro provides a convenient way to create a local
variable initialized from a cpu context in the hyp trap handlers.
However, a common error is to use the macro multiple times in the same
scope with the same register index, but for different logical purposes.

This results in valid C code that compiles without error, but introduces
subtle bugs where a developer expects two different variables to hold
values from two different registers, when in fact they are both sourced
from the same one.

To prevent this entire class of bugs, modify the DECLARE_REG() macro
to declare a dummy variable whose name is derived from the register
index. If the macro is used again with the same index in the same
scope, the compiler will fail with a "redeclaration of variable"
error, turning a subtle runtime bug into an obvious build-time failure.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
Note: I considered a more restrictive compile-time check to also enforce
that the register indexes are sequential and without gaps. However,
achieving this without requiring significant refactoring of all the call
sites results in too much churn. This patch catches most (or all) of the
related issues we have run into in practice.
---
 arch/arm64/kvm/hyp/include/nvhe/trap_handler.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
index 1e6d995968a1..ba5382c12787 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
@@ -12,7 +12,8 @@
 #include <asm/kvm_host.h>
 
 #define cpu_reg(ctxt, r)	(ctxt)->regs.regs[r]
-#define DECLARE_REG(type, name, ctxt, reg)	\
+#define DECLARE_REG(type, name, ctxt, reg)					\
+				__always_unused int ___check_reg_ ## reg;	\
 				type name = (type)cpu_reg(ctxt, (reg))
 
 #endif /* __ARM64_KVM_NVHE_TRAP_HANDLER_H__ */
-- 
2.51.0.261.g7ce5a0a67e-goog


