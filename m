Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2EBF5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5TkYNL94NKu0U/OFCNswNWigEfxOEAkzVOSoJlSIOI=; b=oG3IBvYLgCzeiuQDyOmfEXEjMJ
	aC9t2lkEQMmH0azMIqaV/sr8+BeeD+hAa6Z6xM2iGxNI+AWmXg6kPqRvNXHJKfUNDeIX/V3/ymjhe
	UfU4C0kY02Rl1hb2BdMn1QpV6tHRbiesDkec+GIwHGAVDWBsheuXzdh91EXkINQf/hbLWPxXNdC5t
	C7fYDhqhZYlI1S9q17N28rW317+brVUnkq58ir8WB7Gq+nrGtVjqWiYoWHd6TsohVtvMFUpqmyI+Q
	O6t2lpBYwgGdP7pZNhJb8pLhMfkVX3AeCXZ3AuA93bZXYzwJBn4Al5wRJkNn2Coebi1bBn/5SIfgX
	IBnXIEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw40-00000007hfh-1SYl;
	Mon, 20 Apr 2026 21:21:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3M-00000007gdc-3v1f
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U5TkYNL94NKu0U/OFCNswNWigEfxOEAkzVOSoJlSIOI=; b=i6vN3qclkEnGkLKayAHsesmxEs
	vh7ahaEUkYFNEhA36TzcASSW9QjogqbpU0agkLKlFdKNzTYVEIB2VGyT9/sjJIQa7qTLXBLVUtczB
	eQDJTtpBx9qK945W9+dEy7o9sE2Qu3GOqZd55bs5eik6MNoLakkMS9uVSlRejKKQZaQw8lhFyYfQM
	ew6CujYG7OWA/lSS2JB09hYkAgwQGdoLGXUITXFVHhaCPgWnKr8a3Ic+g3D/6IuVIDoAPkQbREJEE
	b+VL3hONiUwagPrHkm6rV9M3PRLMneK0g2wF2hhCVOaYUokICraPpbHSHoxmjAuSWN/MnsEJ9QnoM
	jp+M3Dwg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2d-00000008pgF-0P4i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:44 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so4688667b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720023; x=1777324823; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=U5TkYNL94NKu0U/OFCNswNWigEfxOEAkzVOSoJlSIOI=;
        b=DRTw94zdP/8GKW941hnQepgcQWjJ09qkn8LI3YW2pblAegS6FMt9w5Pm+6AvdrE4Jy
         tGB8UjfQocqTfk181ClVVO82JqQDTYS5YjhQjAJ/hL8EXL56FuHtwUnojddoWOqJe63+
         KYPp2TmbymhmwzKsx2aM5DtYMjihD1mwyT/8msSk1R8RnNISchNGBUE9aNp1T7fYuifr
         vMnQqTU2XEBewzRy8TJ01IxHqV1j/qptE027RoOeLHfEudzluGkSZShXCdn2u/ednit7
         I7PopQBqUJheSvpHybbd1GugilA4hymewtTIRps0YAPPw7Jxal5Qd4wd2497et7I/Rq5
         QJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720023; x=1777324823;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5TkYNL94NKu0U/OFCNswNWigEfxOEAkzVOSoJlSIOI=;
        b=MrTKhLHPfTNPpu06qU13O9rxGmN2y7z1uWmBkj4OYLO8CzmjNknGkIbikHUgXNVAIy
         gVeyFuaPVeM5WLFYJnh1ipTnG/RbzKEuKZYXAFlN897kBastnMcL1O+lWekOgx35dkLN
         UHtg/T7F3eiEzlHNMcTqFBv9rgcr32klpcSt5SOTY8hAyk+mLD8C55KILtX9UgwQ1j67
         jKvisE8zY/0u/2WriBd5vjJt9MWD38wxF8BmL6bPisAdB1OgpQW6IaW2dkwX07ey1VxH
         /LAnmJl0JAarky9ZhrzfPe4gcTPLPzTcGKJUlnGFbJoXocMw7FPuTaUks5oXL12LIJhk
         W1mQ==
X-Forwarded-Encrypted: i=1; AFNElJ+R2ZR+jaNJnd+OlLEUnqxHUFwwGKmTZ4UOrUmxgl47zjKVStb2lHCaO7X315E2CscSsm/U2/5rzqf78XR5fEpM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+id4TA6JlEoVuT02/G/htj1hU9+O2Td8i9XJ2lXA6etwmfc/t
	fLzRiomIg1e+YKCphm4vgAesHDd80GGlGUCyrjr4uHB4tkAvKQOMkqsAAIPVjS5QG1PaNcEyIiB
	WZEJJog==
X-Received: from pfve12.prod.google.com ([2002:a05:6a00:1a8c:b0:82f:6a57:a9aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc7:b0:82f:5051:f024
 with SMTP id d2e1a72fcca58-82f8c8ca07fmr16761487b3a.27.1776720023205; Mon, 20
 Apr 2026 14:20:23 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:54 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-10-seanjc@google.com>
Subject: [PATCH v3 09/19] KVM: selftests: Use s16 instead of int16_t
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222030_486517_2E2AC6AF 
X-CRM114-Status: GOOD (  14.23  )
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

From: David Matlack <dmatlack@google.com>

Use s16 instead of int16_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int16_t/s16/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/guest_sprintf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/guest_sprintf.c b/tools/testing/selftests/kvm/lib/guest_sprintf.c
index 8d60aa81e27e..2a3ab9c168f0 100644
--- a/tools/testing/selftests/kvm/lib/guest_sprintf.c
+++ b/tools/testing/selftests/kvm/lib/guest_sprintf.c
@@ -288,7 +288,7 @@ int guest_vsnprintf(char *buf, int n, const char *fmt, va_list args)
 		else if (qualifier == 'h') {
 			num = (u16)va_arg(args, int);
 			if (flags & SIGN)
-				num = (int16_t)num;
+				num = (s16)num;
 		} else if (flags & SIGN)
 			num = va_arg(args, int);
 		else
-- 
2.54.0.rc1.555.g9c883467ad-goog


