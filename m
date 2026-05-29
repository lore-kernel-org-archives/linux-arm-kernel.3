Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0F0CD6E54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiyjEGpnno65e28CupjUd9OJcNW9bWS5umqxs4/DfeA=; b=mj8Pi3o8s3hbpx7b8nCHuXW+Ah
	NLT9a31+lIc/Hk2/4ruJqmrmggtgs9hDwUZLYuXZRgyZ3CWUTxVdtiB0SP8ILDRLj6VWHQnXj7ezZ
	ZBPJoYoH6tPrjJYNlfJUO87YJWOcLOqXUhnT3nM7+XjgqZimSZ6H1bp5vpLUeOtUBtcU0QzWZ1c9C
	jMh0tVBFCdtSQ5edTGHfW5KU5hF7TBC5mbLfNXY7eyw6SoMdB5oHDJrcRvUkn9ixTduxSS92QvKtb
	oAilgKbK6lt6LKiy25bHKY+q5i4FQY/a8KDCts+X0jOTbWs+E3PMEZ29Gbe9sGoN0zk3Qlo4RJHZ/
	sNnWaRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjP-00000007bqB-31fH;
	Fri, 29 May 2026 15:02:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjD-00000007bgE-2sK4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:29 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4909c0f0ba2so6454155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066944; x=1780671744; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiyjEGpnno65e28CupjUd9OJcNW9bWS5umqxs4/DfeA=;
        b=EpSSdCsQanfqQXVpthGkS8PWg3hX/EAr4TtCyVUbBw82CrkzN0NGYDiQp8H7nbQAv4
         Su0oY6dmEIcTLzditIidL2mp6DINZUAcudu2knkpTsq9WQ4u3ODymyjC7uEnIRlP3smK
         XaKA/l6n/eqrCRN+WVjb4putMcSCdmNiO+a5nQSTfvwTywjetWo4x69EDA5542A5VfIa
         B1gHqp8GRCS6zrtH44EQaPiZ1hEEjCVHSgnnEBF9TPlC3tgrafRKQlx6LszzEiRDAqwc
         g/7GHT+ei5+W8CmZAyVJZQlXwS7oCmeNPSDTJG/8xkJkbS8shU0lyfl7gumCZs25RfKf
         ExFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066944; x=1780671744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jiyjEGpnno65e28CupjUd9OJcNW9bWS5umqxs4/DfeA=;
        b=MbOFTANC5nBucJIK0fOa1YuMsBmoP2r9/w6Sa0X66coMw/UG0t9QlyH9AeDkGwMiRF
         5HdSmT5VrMnYx1jHUiOjGYFfenHpk5kki1XfrCZ7uhs9SnCTxZOv6YTKCS0yB7nGlhgX
         l4mhZOLL8p5C4CWmU9AE4An61Vxx0AULtzlz+An4FWTDkJD4oA6ORW6AgJSBdZSZQtR8
         snCfRyQ3zGDeSVXfYdxBWcGVtFg120W4YN0kFtgFJGneGywUd/NDIG+hDpmeSttLgrAR
         ZfmPAW6ValdTKA2zTF2dwT9YPbBvh0mMmt1vLy1DMzdqt54igHjZlWnX7/rlldKzi5Ps
         0rGg==
X-Gm-Message-State: AOJu0YyP7g1anKelKED5loL3y/xcXMA4x6mjb0DPV+J6nnN4bXSIoZOa
	sN/xpYOioI+fGxJjgiIzdq+tBnSWAXD4PQ8jclmkkbsPHCuNgFCIfVUmN1/hvwcczwTg/1v4GJR
	rSCbzzqgb4CfgTEj9br4Tz8pggj7K2XkQ5X1jdnfO9LPnAcw8YS+2+MYQG6rdkrGRJ2WktkcJLD
	niSw+24FygFiLC9y0JHkejK+7OLL0UX5mxusXnzbtLdUJG
X-Received: from wmbgx19.prod.google.com ([2002:a05:600c:8593:b0:489:1d25:1a63])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a315:b0:490:53d3:4767
 with SMTP id 5b1f17b1804b1-490a2912114mr284275e9.7.1780066944330; Fri, 29 May
 2026 08:02:24 -0700 (PDT)
Date: Fri, 29 May 2026 17:01:57 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543; i=ardb@kernel.org;
 h=from:subject; bh=aFPaV3eZRwZbfRuJcOVglMiqpjLOoyYLSair5CgEE90=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVZr0Ro45KbG/U3TOPQvc7JNkwC0kaWy1cjWvuuPuw
 kXLLSd0lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInMk2T4Z7Hw4UF3Zx6hsg1W
 SuvzdNwYJPwFeT9LdVbN/bJSSk70NCPDCQPV3OWP9bYd/e+4xmP7gWzbOV2yZp1zagvtpm/ydwp nBwA=
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-23-ardb+git@google.com>
Subject: [PATCH v7 06/15] arm64: mm: Permit contiguous descriptors to be manipulated
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080227_751857_5ACBA48A 
X-CRM114-Status: GOOD (  14.44  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Currently, pgattr_change_is_safe() is overly pedantic when it comes to
descriptors with the contiguous hint attribute set, as it rejects
assignments even if the old and the new value are the same.

In fact, as per ARM ARM RJQQTC, manipulating descriptors with the
contiguous bit set is safe as long as the bit itself does not change
value, in the sense that no TLB conflict aborts or other exceptions may
be raised as a result. Inconsistent permission attributes within the
contiguous region may result in any of the alternatives to be taken to
apply to the entire region, which might be a programming error, but it
does not constitute an unsafe manipulation in terms of what
pgattr_change_is_safe() is intended to detect.

So drop the special PTE_CONT check, but still omit PTE_CONT from 'mask'
so that modifying the bit is still regarded as unsafe.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 6b42d724bd1b..d7a6991e1844 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -134,10 +134,6 @@ bool pgattr_change_is_safe(pteval_t old, pteval_t new)
 	if (pte_pfn(__pte(old)) != pte_pfn(__pte(new)))
 		return false;
 
-	/* live contiguous mappings may not be manipulated at all */
-	if ((old | new) & PTE_CONT)
-		return false;
-
 	/* Transitioning from Non-Global to Global is unsafe */
 	if (old & ~new & PTE_NG)
 		return false;
-- 
2.54.0.823.g6e5bcc1fc9-goog


