Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE5CCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L5K8UK2MsZZPVLL6gVUiO47uURDGeEw8rDgtDDz0bOs=; b=lzJ3OXxsKCFHi72gXpajQ5YvwH
	9hsNUw5b8p6LA+SsVG2XAr9d8XIAn915GsScTwtpQEFA+x9bn/BUpmwrbezqUzi2EsRA8m7O0SAZr
	I+4tvLZTAtjR6yjwFHLqx2BAjlvWHci+wpmHgtkZEtzj4xc11AS9CUHIlXkT3+LFZvHxeTCqRme0n
	I9lSVHxXi/eBMo3COL2Fqu8flz3g6hYMGnLiciVZDzx/bgUeU3QGOEmZxa0+GWVdnEEcxISysUFuH
	5zytvw6swORLyBu8yhe2po1/DFUKKH8zsW9Ta/pw+h86o8Td88legLQ2u+exHqHxyIajie9lyN6bd
	puiSEf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2AqK-00000002eem-3Qq9;
	Fri, 26 Sep 2025 15:58:44 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2AqI-00000002ecl-3Bfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 15:58:43 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32e09eaf85dso2978336a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758902321; x=1759507121; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5K8UK2MsZZPVLL6gVUiO47uURDGeEw8rDgtDDz0bOs=;
        b=ItBsG03fe2MoG7zQuKF4zatWJnq7wBnXHVp/sI7hiT6EK89lePKP/kvgvBZ3Mb9hNG
         QzZylft08y6/N+PAtygT7RMSaJ8h4eimCOfnvAF/iI7D4N1jlf690+wbFIGQuHFrsKlU
         f3X2lD7l4jw+l4H9il5RDJurq2thTiRKDHGZGkIy60d49c/LrP9L9RnmD/B+bd9ECjus
         dIx1a9cuw1TZyHxB8M0QAl+f1LLddKsqsupkgZQL10/SkdNeP0uwSsvyXd2nItjegcqy
         0HQKmeB3btz8jkVTl4BJqi4a/4whjxmOQz05bqngQR3ClWwSfmG0Vce1N8rCmEKSJ2Zg
         EDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758902321; x=1759507121;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5K8UK2MsZZPVLL6gVUiO47uURDGeEw8rDgtDDz0bOs=;
        b=dS18TYWWIakXZM7ahYhal4g0G7j1LzTUQ1/AmlwuhjXNBEm9AAZqd/OOXZfOhnQEH4
         UxkT4mlUr38PkXpG7/Vyv7yudk2UL+hLQnJZU9Pjikuq/aE8hblOWfO9jOiJznQ0/HlJ
         YfaZ+gsJKExLyPgHFiKmduVox6f/BMQSBWXDZfDWA/tQ2JSiJ6qYgjNKIrSg3qGP8dEe
         yDoNXxrs7v3Untl0VTIw9uBjHVOo1nAIulShEmTei30TIkLUWf2cEvVMztl+6FlNI8HY
         Abka6TMgwqAm0STM2/VPD3PlCrZ9FOu1xYKAABDtU4KufaIf67wLjbUAzLB13L0tNdCA
         pt5w==
X-Gm-Message-State: AOJu0YxFe3woq4ZqJNE7t33kpxCGgjdvEXFaMIoH6rNt+kpj8Sv35YPj
	2Jcft6lRU7C1NSjbN2YMqvpgPbSr4hBxew2GB6g+Ra6PWmh2uUlOM7P5kpMwqmiwhxKHzJ+8Ufu
	U9JTlwQ==
X-Google-Smtp-Source: AGHT+IFjpgSzA5Rlw7JbImpaC56pYTXgSa295k3g3PBWsimpHinIifwdOO6eH2ZwQpZ8/ysgQKAAB2w8fRA=
X-Received: from pjber8.prod.google.com ([2002:a17:90a:f6c8:b0:32b:6136:95b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f8f:b0:32b:8582:34be
 with SMTP id 98e67ed59e1d1-3342a261050mr7471559a91.13.1758902321029; Fri, 26
 Sep 2025 08:58:41 -0700 (PDT)
Date: Fri, 26 Sep 2025 08:58:38 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
Message-ID: <20250926155838.2612205-1-seanjc@google.com>
Subject: [PATCH] KVM: selftests: Track width of arm64's timer counter as
 "int", not "uint64_t"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sebastian Ott <sebott@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_085842_798681_24C64340 
X-CRM114-Status: GOOD (  11.20  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Store the width of arm64's timer counter as an "int", not a "uint64_t".
ilog2() returns an "int", and more importantly using what is an "unsigned
long" under the hood makes clang unhappy due to a type mismatch when
clamping the width to a sane value.

  arm64/arch_timer_edge_cases.c:1032:10: error: comparison of distinct pointer types
     ('typeof (width) *' (aka 'unsigned long *') and 'typeof (56) *' (aka 'int *'))
     [-Werror,-Wcompare-distinct-pointer-types]
   1032 |         width = clamp(width, 56, 64);
        |                 ^~~~~~~~~~~~~~~~~~~~
  tools/include/linux/kernel.h:47:45: note: expanded from macro 'clamp'
     47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
        |                                                  ^~~~~~~~~~~~
  tools/include/linux/kernel.h:33:17: note: expanded from macro 'max'
     33 |         (void) (&_max1 == &_max2);              \
        |                 ~~~~~~ ^  ~~~~~~
  tools/include/linux/kernel.h:39:9: note: expanded from macro 'min'
     39 |         typeof(x) _min1 = (x);                  \
        |                ^

Fixes: fad4cf944839 ("KVM: arm64: selftests: Determine effective counter width in arch_timer_edge_cases")
Cc: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index ce74d069cb7b..38493c9cde83 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -1027,7 +1027,7 @@ static void set_counter_defaults(void)
 {
 	const uint64_t MIN_ROLLOVER_SECS = 40ULL * 365 * 24 * 3600;
 	uint64_t freq = read_sysreg(CNTFRQ_EL0);
-	uint64_t width = ilog2(MIN_ROLLOVER_SECS * freq);
+	int width = ilog2(MIN_ROLLOVER_SECS * freq);
 
 	width = clamp(width, 56, 64);
 	CVAL_MAX = GENMASK_ULL(width - 1, 0);

base-commit: a6ad54137af92535cfe32e19e5f3bc1bb7dbd383
-- 
2.51.0.536.g15c5d4f767-goog


