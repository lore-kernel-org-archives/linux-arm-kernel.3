Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8956FFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WwzihijZssqSOtMqDRFEFZS96kFccDT7AOSNModvwc=; b=rBEZwmD+o9gpOHII05tbROVZa7
	i6wjg9DHxhgcxo7OhsT2uhbKVHdm11wEBdm8+Q5sdN5MgFcF0yVg8RGso7VdQteuOt+4oETT0P+X/
	qVp1Z0pKiJZWMfKQwLjeahpDzUovEF2k6TONB2uZtmg79R2sm1ZGQaQL027NuvVrdgQEghmhx0NR1
	pzZDMndiCV149WlfHltKX8u8wJPNxID2nNWnC4R5P8PDJU4Mi9p/Q3OXKJAgpx8WmXGdx+6EvudFH
	uOB1bljDCtvIGzmfYWdL2t2588ac/H7h5E94bC7AQriebJWwfywiIjYtuLD5f4F/LMdTVjf9ZiB9f
	qOoGqpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO0H-0000000HCns-21RE;
	Mon, 27 Apr 2026 15:36:09 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzv-0000000HCTf-0xzR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:48 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4440c5944fbso1288003f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304144; x=1777908944; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+WwzihijZssqSOtMqDRFEFZS96kFccDT7AOSNModvwc=;
        b=LMoY9k0oB9kxf2yrk3J+ra5reoMq/jnI9JZMO4kBDIFTNPe1OBa7Xxs3/l/8wzytpV
         4fNJi3dT3VU2/N6NewXwW1k0J3R50f+07qsDoda7UwUnGTV3ImOFjqdK5sY8kyitqQiF
         Ug6DKAj/YQlWj6/yb54fOKNV51DHNnvavW1kmmbSK0GIJug1sBS4mirpo+AQWBP5aQO+
         D3b0h1NW165UbJBC0Z/T0PPpfTdAX40kHpF0p2duy58HFTvR4t/DRyprpiofaESUNoio
         dxGlfcAUGZRT3P+H7UbgN/uUTfVZEBCOr1V5n+rTGZmp6qJDepIlUMzt7sNs+fRrpgrX
         00HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304144; x=1777908944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WwzihijZssqSOtMqDRFEFZS96kFccDT7AOSNModvwc=;
        b=AkkpMUAW8SJcFBwufB5F6x1sKDHA+gKp57Gu+g4AHA6JmoAw8E1gpaRn8a0lNuZcyr
         WahjYCuTpASdQBWimoJyMRE88/Pgqb2cO4LoXRVIJveBINeVrVbeTx1eANIkWOxl4HZQ
         hCrLjAgXMaEFc8f2aoCOqOyV5VGCZNvjrgoLviHoSje3FwMBaznZHjU25/2ot1aNQlsN
         lkvMyy7ajnNfgGvDsoYz3TeXngbjugnvnbZWXgJCGX8GsQqnqnXomsQN8SZeyTr3RfB4
         iFKZKkgjPtDIwRWHQKdT2qcMwTg29QFnVdmLGQ7Gb426E9Prbsa3/mljdNvFMSzWjlDC
         TXBw==
X-Gm-Message-State: AOJu0YyAwJ1DFSFG26uuHqg+888IcdhGgpsz9Oe0kRJ93L77WJpzTl77
	mCkuYX2H9dMH7b/zydPI3CenfmF5/LF2WGAsnryOim6m8jgbmtLTCaaTzQxtsFWS5DELbv8FbYY
	Y8My3pkPjkjIUx7yc0JSnUZg5fcR6zyyIAtLDSyAoZAzMQWSaV43Nqz0a/zUml3FEN89oBR+5Bz
	y4DNNrv77G6EPlnusCGRhrprXRW/7weZnDhxkp670qO7Jy
X-Received: from wrbdy16.prod.google.com ([2002:a05:6000:e50:b0:43d:729a:b525])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d05:0:b0:441:247a:e98e
 with SMTP id ffacd0b85a97d-441247ae9ebmr36895346f8f.24.1777304141472; Mon, 27
 Apr 2026 08:35:41 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:24 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=ardb@kernel.org;
 h=from:subject; bh=2M+2R/xfGuHti5Wurk6r5E9xqbGluJyDsIl7VYMOsyI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9E8tUw49az8LPeSafvHDx3bajk3bfqxCf4/ElO9n+i
 EqbmadXRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhIxHGGf2rT5kc6JZw8EfTc
 dtq0B6b/C6uZdnxyULeaKj/79Ou3L1gZGd7fr5d6L8ZyoL7vypL3Bx1P/wzxNdu7JOz5R5H7c65 9f80EAA==
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-24-ardb+git@google.com>
Subject: [PATCH v4 07/15] arm64: mm: Permit contiguous descriptors to be rewritten
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
X-CRM114-CacheID: sfid-20260427_083547_320595_C1708274 
X-CRM114-Status: GOOD (  12.47  )
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

So relax the check to allow that.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9610dd2d7bd9..bfb2f1cae724 100644
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
2.54.0.rc2.544.gc7ae2d5bb8-goog


