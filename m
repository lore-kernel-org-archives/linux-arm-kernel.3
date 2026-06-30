Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D03C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7qMl6JaTusMjQ71t10D/Z6xyVtqjy476HmM+ncXIDo=; b=UX6TNfWrDrDPxcJ4JidPXDx+nM
	fN624ArMum48cWAFH3wHqmw7sMcxUxn7e28LVTfRKtr8Rv2MLQvD46OB260/b9OZQhA1BPhPjzuIq
	YnuJqlKDCeOE1QAVAe/ljmeA78gXWevCsWiu/e00AZV+pEoOOZcZ857pLjF6fHdk+ELUCgNq6FgJt
	7nfJRZzyuFiiPSpimmEbvWKzAcIRE9dYUGvLpt9lzkuI/j340ib+IIRk2AAkbzZA+p+Wo/CyW465L
	iQAOteAqIJ0FSUXG4L+vb+6jhTrAvNxnENenMfu/Et9oL4jBsFhVYFAfcLVM2vJ9sTEZlURpHPrdk
	4nugNPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea0u-0000000HKPr-0E4W;
	Tue, 30 Jun 2026 15:04:40 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea0r-0000000HKOh-2fBH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:04:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c9c9913ddaso3840245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831877; x=1783436677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7qMl6JaTusMjQ71t10D/Z6xyVtqjy476HmM+ncXIDo=;
        b=chBBKmECXuvq+0p9glE2r/PgEhQNKfomdtWJ+3+vlgl1/Dt/MFJEWar+caJ6ZrcL4z
         /QNx6WRhpvD6y5f6x9Ys6AE6yJpdBeOJvaOJV7ok1bzU0gno6VFBwb/x31sIEtJHnuFa
         j0pp8tlax3L4muMYjBtUQwIFa4HzG665NUVMcxeGYzenJuAjlS4BEbrltrBOIgd98D4n
         LhabhqJ75zNhuLu/vXskdxiTMyX9cTQuln8iOs/qCO9OL6M2zfxYxE82Bo49W6Z0vcsg
         B6Tkq58NCdt0X3+OG5FIeIQ+vyYIXi+h7JmdembEtgGfP7K9D78cRdXLRX0bKbtcsCPV
         BL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831877; x=1783436677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7qMl6JaTusMjQ71t10D/Z6xyVtqjy476HmM+ncXIDo=;
        b=cr2BwTI4L+Ya4kMK2mW71I4twuvcTV4jgGyFyKc1J/qhCrLrYZUoUlHucq9ABLP2O1
         5gC3kEaXNgAvwT/qSzuHHjm6KAOan/X3ow3XB/DvqTTwv5z0JKtqFiTDewQDPRmUSb8m
         a1+zuoKvIhXR8icagIr5HpJfO3qCY+4FmIQ8cF0U63cR6X8S82cqlYgk3yIm0TjGCnN6
         3FXt4squ57nPbg8aCGGpNUOupuwwSNkL0ahbHtHF9LAPYcm1drGCf5qjiKJH5oXYZXOt
         YJpzhM0eBCU2XGLTjHUZj+s3xPl5rf326C1e7ettjmyYucY07GwddU9Q+YZoYjCiElsJ
         v2sw==
X-Forwarded-Encrypted: i=1; AHgh+RqyY6DA7QrmStU31rYX17ooxPYjcNj5lUWZxZWHgVWVNwKK/05sPOI7C4pc5KFmkAthv2zyEcoX2VdHeS9vbDdn@lists.infradead.org
X-Gm-Message-State: AOJu0YzZKzfi6tTxXntQ6iQ2YK6+zcrs98M6/COBbMH/WqKWPTCajctm
	F6Ws0W3KYUxznwyphpAppFtiUD/eG/fZ7v6sIjzZT1V6tlTR04z770mB
X-Gm-Gg: AfdE7ckK53Gmy61fyOK9YyF4ZMSYGkoR/DFEs0GoKhwcyFsRbXPeZm4cXm3IUGz4cAI
	q1qGlKOrnRu30gleQ4ABl2o+Scf7pJ6JsQ2RdFkPLdyg6n64WolvoFeZZQVRiDc/WzX83RWeea/
	gdXdHU0D08JnWp6ibJlTBbFnw7euZ7Wa99JODXk1wM1E4h3CEt9EWbqpbjHcGQnGWgUpBDvW2Rh
	1Ve3b/1DfdFLtwyJ4eau4mU1Bxbv37Vk7ihOZF3Xj437KAexz5Q5mWSKeJLLUZFsEtjjZ2ROnDw
	9Wi52efWhcYt34jyjgWwk1gVOWJeYi12RCAq77M6zy2MCF5k2WcMw2a6QXVwfkYQMcU6J/Qa69Q
	XnMJo/g0HaBMS+Ehuuy6HWddyKtBIw4lwgEcQjWfF5+GJdnWN6VmxxYZ0gBQlPkjAMsjVlv5/ln
	GAC+bdduU=
X-Received: by 2002:a17:903:19e3:b0:2ca:53f7:3c6b with SMTP id d9443c01a7336-2ca53f7403emr11246105ad.19.1782831876664;
        Tue, 30 Jun 2026 08:04:36 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70bc0sm16250465ad.10.2026.06.30.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:35 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH v3 1/8] arm64: mm: remove unreachable invalid range check in kasan_init_shadow()
Date: Wed,  1 Jul 2026 00:04:06 +0900
Message-ID: <20260630150413.1718632-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630150413.1718632-1-ekffu200098@gmail.com>
References: <20260630150413.1718632-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080437_671382_D66D644C 
X-CRM114-Status: UNSURE (   9.68  )
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

kasan_init_shadow() maps each memblock region with for_each_mem_range()
and breaks the loop when start >= end. for_each_mem_range() never returns
an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
---
 arch/arm64/mm/kasan_init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 3fcad956fdf7..45fbdce684c8 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -353,9 +353,6 @@ static void __init kasan_init_shadow(void)
 		void *start = (void *)__phys_to_virt(pa_start);
 		void *end = (void *)__phys_to_virt(pa_end);
 
-		if (start >= end)
-			break;
-
 		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
 				   (unsigned long)kasan_mem_to_shadow(end),
 				   early_pfn_to_nid(virt_to_pfn(start)));
-- 
2.43.0


