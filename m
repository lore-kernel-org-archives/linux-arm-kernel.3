Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC99FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fih3i4e18PfvVXsOqO+51UGmMLaCoh2lR+Igb4mepcc=; b=4qznmcfKGflWs2kQlbCKNQgOZT
	+SHco9fMMEDWmWmYeG8Pf0EvqcPNS6SvK0DQ9evBh6XA/lS2FcDH4IIJixcjAhqHeI3uiXnUs1agf
	x9+U8S1/hWX+h3YBCjS6LseMGZMZJc5NVQnjGEeEtTLBCUaXecLfN3842paEvoX4t2TIz1pVpS3Kv
	boOBzbKjpVkcClTl29P7O+8b1vZQya29ydAJrYjbnGrZqZAB7OJZW1urYjf6rIVtDvIdhbvT8olsf
	SgKPeYhmXnYUJyh94btFkvRPaPLAUbniR90vFuhjeeZAhIhnAbyEAJS1DKLmEvrPsqkvrz7b6Cgbn
	tUrXLtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzx-0000000HCX9-0zX3;
	Mon, 27 Apr 2026 15:35:49 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzp-0000000HCRj-1xbj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488f973ddfeso76715105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304139; x=1777908939; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fih3i4e18PfvVXsOqO+51UGmMLaCoh2lR+Igb4mepcc=;
        b=dSZvk+VZNGGQ8GrngvgV/JNoduR4XhSCvKdFli3rwwUZV36VoCljvZztDNYYlG0h5U
         6h2EMbbBoyDksdwQmgu8ZeVei+/IulDXimpRzgWoqL25yTMumqFdx+6AfMcovXlz2s3Q
         aMpfYzjAldLQkJPfIlUfaGXVLHKl/uSxEj+8/OkKUkNX95zLsVrKodCOjiTtHlY0UnBq
         yJuMM1eWGSAd7YS1rxAA6uaKQfkIEtw8Z7fu3sFWpl1Zlnzu3Plj/2PNzTKIK9qv5ahI
         a8Wvp+j2Ww39/D72t6pbwr404CuQiAuhjfaxuFrx2JtA7GhnhyzD9qWW9MHl6twquAzV
         qGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304140; x=1777908940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fih3i4e18PfvVXsOqO+51UGmMLaCoh2lR+Igb4mepcc=;
        b=bwSWPATE/Rf0fQkxgUJkipB8R4dguqtLxoUFqiPf/tTQhqkQv0yN/D78/s7PQqzteY
         3DmIVkEkcaLls50CVI38VJKPRQ/wrldQCiZ/v4U2JmdX1Dy5eHmRQEz9jRNmUcLGT0jx
         Np0ZRp28srjaJbj1Bv3OemZoYjLBdHYmK/g2nblt4x3h/HxC703G7fVpzf9Afu7+24DN
         VINAXU7Lls5+dGzEqxr7xPKea2EYwO0nKX4TDwcik7zFLfHA0wTKRPPBKzCg/5t2OZVc
         8vSxINTnPM3+04MLFGALE/juU9MaJwcuNLifhvCuZtJit1vKhvZgYogcR+0X+tFGokTm
         OuiA==
X-Gm-Message-State: AOJu0Yx7jm3GzFbbXdEJbS01WXKIw9WoKopq0wcMoUnnkjj1QqEmF+eX
	tTkinU8Mhf0Rs0CtU1EWZGHFfT5wFuLyL5CZsjRmIdwS0YhEOre29KYTa890c8H2AL8tsyer9UL
	ZkaKYt4tVJwDb9smaTC6cxPN/Gw7gX2DOn3h5zUcaMFdhgKwnLT4JlTwzDCrjfd9y2SYpZk1low
	k4Xd63qcT9imc2f/Irvc6SBl5taTu8n73Aneszl5h25c71
X-Received: from wmok24.prod.google.com ([2002:a05:600c:4798:b0:485:3a48:d6c5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a30b:b0:487:4eb:d125
 with SMTP id 5b1f17b1804b1-488fb74dff1mr437765065e9.9.1777304139320; Mon, 27
 Apr 2026 08:35:39 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:22 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=ardb@kernel.org;
 h=from:subject; bh=h7ZYPXsk7x8qiYN5Bb4ArPGJm788B+DXEeUwDjC4Hlg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E2OMr//DSScOyewrtDKSTj2pNjs54uXG3/nW1/QLW
 jXW+t/rKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPxecnwP+a5BK/ZucVOeU81
 7jYvnbjm7Q/9FoVaDcW+23MP86w91sLwi+mK+4lU2YQl89dJGK4S/TllWwHHxeqs1PkRZyUC700 14gQA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-22-ardb+git@google.com>
Subject: [PATCH v4 05/15] arm64: mm: Remove bogus stop condition from
 map_mem() loop
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083541_538501_1F3846C3 
X-CRM114-Status: GOOD (  12.19  )
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

The memblock API guarantees that start is not greater than or equal to
end, so there is no need to test it. And if it were, it is doubtful that
breaking out of the loop would be a reasonable course of action here
(rather than attempting to map the remaining regions)

So let's drop this check.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 005844e521bd..bfbf3fe0d1be 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1177,8 +1177,6 @@ static void __init map_mem(pgd_t *pgdp)
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
-		if (start >= end)
-			break;
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


