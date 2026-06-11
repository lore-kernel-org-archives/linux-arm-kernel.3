Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CBBCD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iN7hrd6qn67T2t3j/i98eZyOA4V4M70JMbuUd8RCBF0=; b=TLA9qjAfNmYK5TqEf2+Q41MWUR
	GD5FluHbpuR6XCUo5hDB2gdax+kU6C+savSpt1mRwO2KxPjdQX17ptIHFUL2HgjWWBURtVZtjH6V0
	zQp7GsVgR33s6ohJbo3wfCYAIGcLbEVWzG8THiG2IKcspNN8uJcanVf1yiG8iewe2sESzFBYfphHM
	AupvWqxonkI0sNgvDd3adRcNjNNmQg84uFtlMVOXcSST2jkHPqc1uIRuDNujxDvzmjEC0p2xF6VQU
	3a19L/yPNmY8nEPtRyZGI9j8TQsG/uT4S9mxW9HtWqCRmbA7pYZlSyjb5IlUyMDbc53z/SlbbxS9a
	J14XOanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2j-00000009SW3-0vA1;
	Thu, 11 Jun 2026 13:01:57 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2f-00000009SSS-2XbT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:01:54 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45eee3f9f03so7627839f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781182911; x=1781787711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN7hrd6qn67T2t3j/i98eZyOA4V4M70JMbuUd8RCBF0=;
        b=cbT2uTqCG2GZCax+8dv964CSfBqx9zGJM84+Ws6zbuHU6wx72df1MJ/Jgb7gI9qFcx
         TJYJwqltXK7wUQ0Ep9gyZ1o5Q5ivlxdIA/nYoKreQP4CIscSbtgu8GL/WTlN5yM3ia/A
         i7SYynlo2lVlMZRbUC3KWXKs54OcMXw18oFxsFYN9p6ybhpUKigt5CIi5y/iHrh/fdDA
         T8sDCx/NO3ffsoN3ictwdaJg0TjF/pHOTivsaqHsccI+M6xUG6y2LT6lCBu8pgfUd5fa
         ZimBFZxEIER/3ohG74958vhpOyOJYRrWh+RDpzmqhJzH+haMZsBFmj+E6Ug2JfSubM+B
         E8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182911; x=1781787711;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iN7hrd6qn67T2t3j/i98eZyOA4V4M70JMbuUd8RCBF0=;
        b=B2Yzze+cyfHv6u62zhk2WqemYbRevFN4ouOiAAMoDsiym+yLX0aPfEZFcKI/5miM9L
         uhmi+8daEJ6MxisPJQ8+0BasosnLZ64Q5gsjzmjpeb47Kk09YocsVr7qXPYBu3LpYW3A
         GuJA9fSNWLPruBbF6/tVpYTqQ5ppNmtOZqeu3SdFLHMocSF1nEC8NBznBdjA0lfZj1t6
         qWpjAYKHAN0Ki7jvfKrbsqfZc83UsSd5/ouM2cEzuFycYKFFMulmLccZbBJhGjeW2WCu
         WQKl9WtX0mCxQQoXP5FMGeNsZo9eoRUW61wJuGbEckCaFCRicFRJ/30t2ad9chdEDX6A
         61gQ==
X-Gm-Message-State: AOJu0YzN+ZbN+0E9f3PbovYaZlhTrJwztwt6Re/GRvXqQ202kVW2wogn
	fbuju7ucSlhAK6Sp5oI2QW4aQLhuxmcF6+ZHorwPOCnaEObTM0ZT9PaRBS1AlazdChiCARQUFia
	4UJSzRf3UHha/iAmItM9zjzsYxnSS7Mok23dTzxseC+ZmGbdwT+2t2qGIaBC1CVwwk6Dzj8HZm6
	zhY18O0eUlnWoFYcf+F/iWz901fTWZ6lBKvlafx4cgCieZp4J58esvX+KA649u
X-Received: from wrqd14.prod.google.com ([2002:adf:f84e:0:b0:449:a1ea:d14f])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f83:0:b0:45e:f4f7:7cad
 with SMTP id ffacd0b85a97d-460677f3340mr4265866f8f.39.1781182910754; Thu, 11
 Jun 2026 06:01:50 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:01:40 +0000
In-Reply-To: <20260611130144.1385343-1-abarnas@google.com>
Mime-Version: 1.0
References: <20260611130144.1385343-1-abarnas@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611130144.1385343-3-abarnas@google.com>
Subject: [RFC PATCH 2/6] arm64: mm: allow huge vmap permission adjustments
 with bbml2_no_abort
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_060153_662428_3EE4FF49 
X-CRM114-Status: GOOD (  15.09  )
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

Remove the protection against huge vmap permission adjustments on
systems that support the bbml2_no_abort CPU feature.

Splitting live kernel VA section mappings into page mappings was
restricted because it could cause TLB Conflict Aborts. This forced
permission adjustments on memory allocated with VM_ALLOW_HUGE_VMAP to be
rejected, resulting in performance drops (e.g., when enforcing rodata=3Don
disables huge mappings).

The bbml2_no_abort feature (which mirrors the architectural guarantees of
FEAT_BBML3) ensures that changing between table and block sizes without
following a break-before-make sequence will not generate a TLB Conflict
Abort. This hardware guarantee makes it safe to allow dynamic permission
adjustments on huge vmap regions.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/mm/pageattr.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 358d1dc9a576..88720bbba892 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -157,23 +157,29 @@ static int change_memory_common(unsigned long addr, i=
nt numpages,
 	}
=20
 	/*
-	 * Kernel VA mappings are always live, and splitting live section
-	 * mappings into page mappings may cause TLB conflicts. This means
-	 * we have to ensure that changing the permission bits of the range
-	 * we are operating on does not result in such splitting.
-	 *
 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
-	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
-	 * mappings are updated and splitting is never needed.
 	 *
 	 * So check whether the [addr, addr + size) interval is entirely
 	 * covered by precisely one VM area that has the VM_ALLOC flag set.
 	 */
 	area =3D find_vm_area((void *)addr);
+
 	if (!area ||
 	    ((unsigned long)kasan_reset_tag((void *)end) >
 	     (unsigned long)kasan_reset_tag(area->addr) + area->size) ||
-	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) !=3D VM_ALLOC))
+	    !(area->flags & VM_ALLOC))
+		return -EINVAL;
+
+	/*
+	 * Kernel VA mappings are always live, and splitting live section
+	 * mappings into page mappings may cause TLB conflicts if bbml2_noabort
+	 * is not present.
+	 *
+	 * While bbml2_noabort is not present disallow VM_ALLOW_HUGE_VMAP mapping=
s
+	 * to guarantee that only page mappings are updated and splitting is not
+	 * needed.
+	 */
+	if (!system_supports_bbml2_noabort() && (area->flags & (VM_ALLOW_HUGE_VMA=
P)))
 		return -EINVAL;
=20
 	if (!numpages)
--=20
2.54.0.1136.gdb2ca164c4-goog


