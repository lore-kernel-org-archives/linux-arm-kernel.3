Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296FACFA44E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFBeTk/ypl/mbwDh0gs/JhAq5wRwgc/prGa+mqCvt5o=; b=IxQe1EgcL9Berl33BaVEhOh9z6
	O5CstcRbBfKjYbHfzdlinxLUgD7TuvozykftVw5N8aSHBokP0BHmZcoM0UCf6JTK9/yIqB2QBo/1Q
	VLnbBfxYOSg6uwD/DNXYXdKVo7+qZVhS74FA5CNcetF5HHLnUdJrb7CNtPFO3Hi9ijGAux2xGcNCS
	AMqJvnhAOmAN1iuDtetSdWw99ATOQcRt9eRj7QIqoeeWbt3lGwckoHjbEqjbWgX+CouQfYtjSjD5G
	7bbkVXwwsn68A+BmmSdb6CVqYIBA6QZbO+jBhcsKEeJOf1oT/9h5UaFElqAPY1i8naBo/TS5kO9f0
	2TIwZvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e4a-0000000F6gf-2Zz1;
	Wed, 23 Oct 2024 16:19:00 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dG2-0000000ExIO-315N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:26:48 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fdb4f35fso10978273276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729697204; x=1730302004; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fFBeTk/ypl/mbwDh0gs/JhAq5wRwgc/prGa+mqCvt5o=;
        b=BnmBPVw3svMGOU7XoWc4/xSHDLr8uMSMjBoyOIomxukdll1SmUFqBUXOnSJHllDplg
         l5KwOJUHAk1Lpf4s4M0aCAh37A1f3BC9S17SG018epcNEMViO8ETFg2jhgklwFHeGGbP
         HDyAx4CFAvG8HOL/8UpGm6wSV49yg4sz42TGq9nMVP6p6v7irje9I/OTl3OBAKsnOH9x
         69CyLt03lhzBgJoSOUvxGefAMPvwxwtalHG1XgLnp390nAq2dhhfJTWkvLqwbEXW00Gd
         0ndz64rtbiTNA6O3GD+q5Gaqucd071iuinX/q9DbBAkeBw7DnaWrssZbEOoNHtW1qr1U
         8+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697204; x=1730302004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fFBeTk/ypl/mbwDh0gs/JhAq5wRwgc/prGa+mqCvt5o=;
        b=uwNQykJdmg8rvPD2PtRswYJQIgO9o3TZm7GFZ0P+FdDb67vGzGQTFKfvK+FmobXuTW
         f0hAtvg4cKa1vm2gA5I9eZgvOMl6TB6jdGxDYBi6yiS1QdqGLk7HBKHppNjL2tqtA9vf
         0tJhuP7SlIRNE74nBfSpCpZvgGnMu2ACE3yaIk7B7m9Qqn5hiMRzmbM1UtJ6CpfhbGWz
         a/1+q6Th4OPFure5Yf4ULe6fln5wf8QK1kH7waJon59M9wgkJ6qway3JXw85JvOUCHtY
         wxg/mBMq7LlPsTF1mBol68b8JG7KuzlUAQI1eTFCzLyX31Udh4UOZFRMPKuX4JLDloM/
         eirQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGeBsguVrfftvwfECeV05ENEk8il9bGOfyjfLa20jsE4nsJaEqxBpukA6/JLmv8GmSC7bShwGZYoQeB8dt9ebF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/FeaW1WMzpZ1Ve3KLxzouMDaaZUIp0LeIj3si3BMIE6RJsHg
	mob28nW8HiNgCLeK10zlmlegAYt2W5s4S8kpaCDNvIqGNWE99UaqwAopmHSF1dARepEN5XAnTe5
	8DdTjGw==
X-Google-Smtp-Source: AGHT+IFh0UYQGtbCtvsET0xrrd1Y/kAJ4FbXvNEzhh8lcJJcZvj2pTt+HaP9rNqWRxjhbRVfontBWLjAHjHZ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fac1])
 (user=rananta job=sendgmr) by 2002:a25:acce:0:b0:e28:8f62:e735 with SMTP id
 3f1490d57ef6-e2e3a5f5d18mr1688276.1.1729697204137; Wed, 23 Oct 2024 08:26:44
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:26:36 +0000
In-Reply-To: <20241023152638.3317648-1-rananta@google.com>
Mime-Version: 1.0
References: <20241023152638.3317648-1-rananta@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023152638.3317648-3-rananta@google.com>
Subject: [kvm-unit-tests PATCH v2 2/4] arm: fpu: Convert 'q' registers to 'v'
 to satisfy clang
From: Raghavendra Rao Ananta <rananta@google.com>
To: Subhasish Ghosh <subhasish.ghosh@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Andrew Jones <andrew.jones@linux.dev>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_082646_777583_E7084F06 
X-CRM114-Status: UNSURE (   8.99  )
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

Clang doesn't seem to support 'q' register notation in the clobbered
list, and hence throws the following error:

arm/fpu.c:235:3: error: unknown register name 'q0' in asm
                fpu_reg_read(outdata);
                ^
arm/fpu.c:59:10: note: expanded from macro 'fpu_reg_read'
                     : "q0", "q1", "q2", "q3",          \
                       ^
arm/fpu.c:281:3: error: unknown register name 'q0' in asm
                fpu_reg_write(*indata);
                ^
arm/fpu.c:92:10: note: expanded from macro 'fpu_reg_write'
                     : "q0", "q1", "q2", "q3",          \
                       ^
2 errors generated.

Hence, replace 'q' with 'v' registers for the clobbered list.

Fixes: d47d370c8f ("arm: Add test for FPU/SIMD context save/restore")
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arm/fpu.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arm/fpu.c b/arm/fpu.c
index edbd9a94..587b6ea3 100644
--- a/arm/fpu.c
+++ b/arm/fpu.c
@@ -56,16 +56,16 @@ static inline bool arch_collect_entropy(uint64_t *random)
 		     "stp q30, q31, [%0], #32\n\t"	\
 		     : "=r" (__val)			\
 		     :					\
-		     : "q0", "q1", "q2", "q3",		\
-			"q4", "q5", "q6", "q7",		\
-			"q8", "q9", "q10", "q11",	\
-			"q12", "q13", "q14",		\
-			"q15", "q16", "q17",		\
-			"q18", "q19", "q20",		\
-			"q21", "q22", "q23",		\
-			"q24", "q25", "q26",		\
-			"q27", "q28", "q29",		\
-			"q30", "q31", "memory");	\
+		     : "v0", "v1", "v2", "v3",		\
+			"v4", "v5", "v6", "v7",		\
+			"v8", "v9", "v10", "v11",	\
+			"v12", "v13", "v14",		\
+			"v15", "v16", "v17",		\
+			"v18", "v19", "v20",		\
+			"v21", "v22", "v23",		\
+			"v24", "v25", "v26",		\
+			"v27", "v28", "v29",		\
+			"v30", "v31", "memory");	\
 })
 
 #define fpu_reg_write(val)				\
@@ -89,16 +89,16 @@ do {							\
 		     "ldp q30, q31, [%0], #32\n\t"	\
 		     :					\
 		     : "r" (__val)			\
-		     : "q0", "q1", "q2", "q3",		\
-			"q4", "q5", "q6", "q7",		\
-			"q8", "q9", "q10", "q11",	\
-			"q12", "q13", "q14",		\
-			"q15", "q16", "q17",		\
-			"q18", "q19", "q20",		\
-			"q21", "q22", "q23",		\
-			"q24", "q25", "q26",		\
-			"q27", "q28", "q29",		\
-			"q30", "q31", "memory");	\
+		     : "v0", "v1", "v2", "v3",		\
+			"v4", "v5", "v6", "v7",		\
+			"v8", "v9", "v10", "v11",	\
+			"v12", "v13", "v14",		\
+			"v15", "v16", "v17",		\
+			"v18", "v19", "v20",		\
+			"v21", "v22", "v23",		\
+			"v24", "v25", "v26",		\
+			"v27", "v28", "v29",		\
+			"v30", "v31", "memory");	\
 } while (0)
 
 #ifdef CC_HAS_SVE
-- 
2.47.0.105.g07ac214952-goog


