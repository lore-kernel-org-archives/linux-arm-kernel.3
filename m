Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF5ACFA44E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NioyoNb1tbeyUGY4RlitjUeF9A4E3KRPhc6ahZCNVQ=; b=CtsSMfILD6PC11bL4Yb8hhHKev
	0fi9Eq/UvXxT1eiAaHSE7IaToQoPBRkbIgkLQUg3fhNrOutqljkTxiFYr0t+FrtMsdTto9/zX9qiO
	ZzDgfPgqgKrt0ngxAcmIRIIa9+TxHsi2aadyXP76zoXyhA49AJzFf6/GhANeOMr4uXyX8D06gCaje
	s4JEWc0TWzRtAAX/ArX469X7wSAnkhd3RCRvXILhLfIrZczTIBrQ7WeCCfto6RUs+iK5oVfATLfnh
	jIsCjrzy2mC96ptTDJQdupK7hOren4L/P2pU+mAkDwMg8WrDD0nd/VaeK7vtZCrbQSClXfUNni/hV
	DU9P/wXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e65-0000000F74w-34Xe;
	Wed, 23 Oct 2024 16:20:33 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dG3-0000000ExIl-1sYW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:26:48 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e29205f6063so11045119276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729697205; x=1730302005; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7NioyoNb1tbeyUGY4RlitjUeF9A4E3KRPhc6ahZCNVQ=;
        b=tp22JUJduoXan4aMP9RLOFfiQCqGrooKkxloFegmN4tTSEIhBgrO1vGIzdjPGorIpq
         iNaBFc/uMtzwzaXomuSHs0yzQ1D6oI/rg00j3ovj6p8easuvjn51+izy/EjDFWlSC7lZ
         Rdj1zJDuCXJo9zmo6Pj+BmuKqTDG4YU0btWZwuhnoG5D8RKPG/Ps5XBxNcRtV/kecOD9
         vuI/+sdtu4QC6aP2d6HoQhH4AG7+RUYBxMgFEDVABrXSFYAJAcFFfNnT1cwckRliQEzF
         eyjq57+wiuKSPeA9WVFmp6Kt5kVTPEmFRRzqy4dsBILzlv5qyxxfgpVqpTpYXCYCRaKT
         E/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697205; x=1730302005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NioyoNb1tbeyUGY4RlitjUeF9A4E3KRPhc6ahZCNVQ=;
        b=K3NJCQxT47iJ4JYR8JIzHOq1LW1zYurLF9AYfAiYtn/nZt2AgkNOCV0G8JFAgeRM9L
         /vfpizFkXPdAPTpkZbwMM8G4SaTehUB2xpGPshpid458g2ZMcFx7w1ygA1FAQ2/cHEqp
         jMrKQo6KuPE669I4NkA6xSfugxfPGWKv/wcD4H33azWSSzYTGoL12vYWyBouykU4rrdE
         zZDUWcqdfw2KGKKyUBXQMwsyzliqw05y7y0uxQAkoAJvB0dzr9Rp1ZfWcZshfV+o/091
         EpOQ+sSZmS3ZeDYwL7WbMOWsPOdNuvttD5iwXJtN7rf7TiKw6TZx5pAnnheTRk1ZPmQa
         Q5sg==
X-Forwarded-Encrypted: i=1; AJvYcCVQqZsYyMmeKdNv/9FHSyjikaSslP++v4bddUD/nZG+K36ggaKtWTEofSgfgXEp7G9fC2G4D5vDe/vLCYahfzf7@lists.infradead.org
X-Gm-Message-State: AOJu0YxkS+vmlTN82ZHZo0LyCDZhuxMrwaQdf+7blwsUbrQBY2HP9/ZZ
	shc/UfddNnkve27GYxobH8X9sFT16RgENOUyX8YJ/9g0LEDbvUGnd+0JCNalG4dEbgK18Ewg1r5
	In3h+tA==
X-Google-Smtp-Source: AGHT+IE9OyKSIQFj5g+9JOMt/US00gq7iSxNgRTSGWr8GfQo9rufdELdBzRinCot5ZkBU1YALlbhI9gWX/bZ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fac1])
 (user=rananta job=sendgmr) by 2002:a5b:947:0:b0:e28:f454:7de5 with SMTP id
 3f1490d57ef6-e2e3a6b78d6mr6103276.6.1729697205144; Wed, 23 Oct 2024 08:26:45
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:26:37 +0000
In-Reply-To: <20241023152638.3317648-1-rananta@google.com>
Mime-Version: 1.0
References: <20241023152638.3317648-1-rananta@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023152638.3317648-4-rananta@google.com>
Subject: [kvm-unit-tests PATCH v2 3/4] arm: fpu: Add '.arch_extension fp' to
 fpu macros
From: Raghavendra Rao Ananta <rananta@google.com>
To: Subhasish Ghosh <subhasish.ghosh@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Andrew Jones <andrew.jones@linux.dev>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_082647_508207_2DDE3E95 
X-CRM114-Status: UNSURE (   9.84  )
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

Since the tests are built with '-mgeneral-regs-only', clang-18 tends to
push 'q' registers out of the scope and hence, the following error is
observed:

arm/fpu.c:281:3: error: instruction requires: fp-armv8
  281 |                 fpu_reg_write(*indata);
      |                 ^
arm/fpu.c:74:15: note: expanded from macro 'fpu_reg_write'
   74 |         asm volatile("ldp q0, q1, [%0], #32\n\t"        \
      |                      ^
<inline asm>:1:2: note: instantiated into assembly here
    1 |         ldp q0, q1, [x8], #32
      |         ^

Hence, explicitly add fp support where these registers are used.

Reported-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arm/fpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arm/fpu.c b/arm/fpu.c
index 587b6ea3..f327a349 100644
--- a/arm/fpu.c
+++ b/arm/fpu.c
@@ -38,7 +38,8 @@ static inline bool arch_collect_entropy(uint64_t *random)
 #define fpu_reg_read(val)				\
 ({							\
 	uint64_t *__val = (val);			\
-	asm volatile("stp q0, q1, [%0], #32\n\t"	\
+	asm volatile(".arch_extension fp\n"		\
+		     "stp q0, q1, [%0], #32\n\t"	\
 		     "stp q2, q3, [%0], #32\n\t"	\
 		     "stp q4, q5, [%0], #32\n\t"	\
 		     "stp q6, q7, [%0], #32\n\t"	\
@@ -71,7 +72,8 @@ static inline bool arch_collect_entropy(uint64_t *random)
 #define fpu_reg_write(val)				\
 do {							\
 	uint64_t *__val = (val);			\
-	asm volatile("ldp q0, q1, [%0], #32\n\t"	\
+	asm volatile(".arch_extension fp\n"		\
+		     "ldp q0, q1, [%0], #32\n\t"	\
 		     "ldp q2, q3, [%0], #32\n\t"	\
 		     "ldp q4, q5, [%0], #32\n\t"	\
 		     "ldp q6, q7, [%0], #32\n\t"	\
-- 
2.47.0.105.g07ac214952-goog


