Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80758CFA453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2EE3sVxYqIJ1dH+QTH0uydlcXtt1ReqMB1Nu0t+juU=; b=Yav/4w+f8lBlPw0rHy/nWbq6Iq
	iXy182ZPCCyaAxiHGLQoZWaNTfo8Sp3R3JMIxBd9tEEzTJYmLjAB4DDQIqf/443FmwhvZsSCK650u
	exFa0JTCTbHxchcr14teLf13zLDkx0ZutLBXRAJH8fyL2tk09oEoFOcDiBm5g47k1QeaDmyTWa+H4
	luZ24LSAF8klgNw1Hl0HB2rZvrlqFwb9Teq5naMe0CpFBDMWBu5874P3X8ei9FU2N83jTKpmo1Y+X
	ybKmgZH8wa4xDjfQnqPYQ6hb354IJiBYDyTYWi7yBbL7Us/bIC+n8sCq/JiFTvI9smotmsKwzQsbc
	hNl5vuIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3egZ-0000000FFRT-2tTk;
	Wed, 23 Oct 2024 16:58:15 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dG4-0000000ExJ6-0FKd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:26:49 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e3705b2883so135070887b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729697207; x=1730302007; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A2EE3sVxYqIJ1dH+QTH0uydlcXtt1ReqMB1Nu0t+juU=;
        b=r5ORK2whcW606TEWWM6c+eG7HcSB8Z2L9qhHXJvApetqz0lOG1zVlN8uRdYFm81vKe
         X9xCEPekLOYO6NjjUqqVizQWo9bFx61ZxqM+mGwq3QJ2FYhQAR3NDaD6lNdGz2Phw4sl
         F4hRhT5CZVSw+3uX0jWmrBnh/3nctAsRAMPZfGX85Pr0r40B7BrmL0dk8df3V9mw4c0O
         +8FD8c0lQvFMQn4Ui0LmbwLmFrXpADbwAVB6ygpbPva/5OxVigZ3PJ/MRgQ/CXxPG2nY
         7tP7m+vmYl9rIijGJbtfo9g5gXhvpjiNOY+g9zjSnI9F5WiqdJdCbyax2HXGY/K6bH9Z
         w4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697207; x=1730302007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2EE3sVxYqIJ1dH+QTH0uydlcXtt1ReqMB1Nu0t+juU=;
        b=xB4mSVL44JqBS2ZApCjv/ItRpnpvLHV+ubF0RnLBPdvUb7aG+rP1/jzf2GxlDbjOiR
         Rb1ZP1GYBYOH7dM5ixY9lbLPcwi32RDv1ItTm1F/FFVqmihBa6C387rZFSaSwZLRJbNc
         f7SeYDI6dXWzKY+zyXZTo2Sc1KUtHnG+NmygXBVdscAWf/vahvwXxmVmEq/TH6wzsif2
         Y7PfIc9aPLxbp6IxViochGjIUKWIWfWM/ueQ06vV6WEiJ+YZ8TNqcyd3hSb/oBVX3Ikz
         MrQ7ZPEo3h0FxUuzLfBIXtVP+coB498B+HNpYF1WKWD1JAYfap8seiBAGJXsfYWoAIuC
         84VQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4m8qMeA+unL5RS+YI1V9R4XZKJZP5oIeRuhrsUSdchhVKrGLRTgVU4rtQgwEYrGPXVH8ri5rJmtxOOYbqZgqN@lists.infradead.org
X-Gm-Message-State: AOJu0YwrX4+QoDj3tT4vjEd9oJXrI8q8H0HO8n7m397aE4pagHCT3T8U
	hjkNb+KH1C8b3z5vnTPccYBpQr2+f+Q/uv6oz2JczPcrBKDeAGZoNESwdTMWSuo1MVfXmxsLvgS
	vcZXL1A==
X-Google-Smtp-Source: AGHT+IFIvoDWzY92c7Ql5MqDK4/LO8cFIPrnyxqxIgb86cVrW0eQyRyYu3QqngJF51cWPwSpHNgspMn0AOrE
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fac1])
 (user=rananta job=sendgmr) by 2002:a25:df45:0:b0:e28:e510:6ab1 with SMTP id
 3f1490d57ef6-e2e3a6c91cemr1496276.8.1729697206388; Wed, 23 Oct 2024 08:26:46
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:26:38 +0000
In-Reply-To: <20241023152638.3317648-1-rananta@google.com>
Mime-Version: 1.0
References: <20241023152638.3317648-1-rananta@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023152638.3317648-5-rananta@google.com>
Subject: [kvm-unit-tests PATCH v2 4/4] arm: fpu: Fix the input/output args for
 inline asm in fpu.c
From: Raghavendra Rao Ananta <rananta@google.com>
To: Subhasish Ghosh <subhasish.ghosh@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Andrew Jones <andrew.jones@linux.dev>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_082648_124685_D3DE86C4 
X-CRM114-Status: GOOD (  10.47  )
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

The macros fpu_reg_{read,write} post-increment the '__val'
pointer register as a part of 'stp' and 'ldp' instructions.
As a result, mark it with "+r" for the compiler to treat it
as read-write operand.

On the contrary, sve_reg_read() never updates the value of the
pointer/register. Hence, mark this as "r" for the compiler to
treat it as read-only operand.

Without these adjustments, the compiler can potentially perform
optimizations over the registers holding the pointers that could
lead to data aborts.

Fixes: d47d370c8f ("arm: Add test for FPU/SIMD context save/restore")
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arm/fpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arm/fpu.c b/arm/fpu.c
index f327a349..f44ed82a 100644
--- a/arm/fpu.c
+++ b/arm/fpu.c
@@ -55,7 +55,7 @@ static inline bool arch_collect_entropy(uint64_t *random)
 		     "stp q26, q27, [%0], #32\n\t"	\
 		     "stp q28, q29, [%0], #32\n\t"	\
 		     "stp q30, q31, [%0], #32\n\t"	\
-		     : "=r" (__val)			\
+		     : "+r" (__val)			\
 		     :					\
 		     : "v0", "v1", "v2", "v3",		\
 			"v4", "v5", "v6", "v7",		\
@@ -89,8 +89,8 @@ do {							\
 		     "ldp q26, q27, [%0], #32\n\t"	\
 		     "ldp q28, q29, [%0], #32\n\t"	\
 		     "ldp q30, q31, [%0], #32\n\t"	\
+		     : "+r" (__val)			\
 		     :					\
-		     : "r" (__val)			\
 		     : "v0", "v1", "v2", "v3",		\
 			"v4", "v5", "v6", "v7",		\
 			"v8", "v9", "v10", "v11",	\
@@ -140,8 +140,8 @@ do {							\
 		     "str z29, [%0, #29, MUL VL]\n"	\
 		     "str z30, [%0, #30, MUL VL]\n"	\
 		     "str z31, [%0, #31, MUL VL]\n"	\
-		     : "=r" (__val)			\
 		     :					\
+		     : "r" (__val)			\
 		     : "z0", "z1", "z2", "z3",		\
 			"z4", "z5", "z6", "z7",		\
 			"z8", "z9", "z10", "z11",	\
-- 
2.47.0.105.g07ac214952-goog


