Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BD9CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RFflol+bsWEcr4KlK98zfj4SqOIgycSAYTOMgzlgw0=; b=AeapJSpkjUjZ1VU2WrMSQOEpEm
	rnYP7TlIL5SFHRo7Y2GUlRVPjiEdyX7mqOWrEBlwan+BjpsGM+JQNjAfo1d01XJ9h4SPgDd8Hxmjn
	RWAPoKlI+ANLTvmxxUdW0GXt/a5OL1F02YYtUSslChZsXRGYARmCXCNbhF0Hm0gcVLk0N1tWU4XFa
	ggp7weXhKgLei7+oyJ3yzsBclrWn26TWOQWDp9+qdO2/v/HL734aIaLvB+SXGvUZFELTgdGEj3ZAD
	SjetUyafhrb/YeeWExq9WSYvLBlFHT9rWuFyOzfotJOUyMXX9LWAN7vDl4PJMzMYsOClDIwYosAFO
	eS8VBXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3q-00000002mkK-2tLU;
	Tue, 26 May 2026 17:59:26 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3o-00000002mij-1lXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:25 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-49048e21ea7so20745225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818362; x=1780423162; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RFflol+bsWEcr4KlK98zfj4SqOIgycSAYTOMgzlgw0=;
        b=oc7iqRN1HU0Nt57FIw6Z9N5WsF5cOTEbPDCAWiK74TabD8TZkqQrZK4yUSZsjik6k0
         IKQA8r1DgLy53YA7teCT0Wdy2uLfjKGWVTgl2a9YsGqW6EMfJcHyS3OuXDzitDfT78G8
         /wrcWtRsSvd8R+UlzXB82jCnXwZVK3hDVz1FDD7q2TR1tSj1X+KIy7FHHdjYsDypP4fe
         idHrnS3q+0CY9Fgg83GMdeItuSVnI/5HfJCCl7nB0xJjPbb3Hl+D9/MUDS84PbV0LirT
         vxf6B0YFNXnMQiHz+4T6FJBk7tX/uGYyc5O3I8xU74iwEGg3zWoppruzURUBu+UY1KPs
         5syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818362; x=1780423162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RFflol+bsWEcr4KlK98zfj4SqOIgycSAYTOMgzlgw0=;
        b=Tg3fKxiX5SLXsMlKzNkx3XGwbrBt5ubew/jJJUbS9tyJMEqd/6WRW6J22hVfLINPe1
         6mh5MHpKO86gFV/ETVrXk+fkmQjJPsAQnc0eesqMPy83BnGcOq20nVqD+sd4XBcnVYtp
         d6VMFN3PdWvRIOPhsxVoq7fXQytz49ygWra4S1E4Vlr0/kJDPgdTiuqNOvFeKAQiPNPh
         YJt9SFVwuigyS2PBtmh6oWxkcfh4cKWEVFc3y8KOkVpMAnGkF/tZI/i9nnasidixlLZ4
         RPgz5YLlmzGk5SnX5drixEjaJQno4kuBVASN+HZvWFtzFa//mYaJjcQDpZngXPYOo6ID
         p4TA==
X-Gm-Message-State: AOJu0YxnyuRceoAcDpP9y16SlkfWv7T/aAO7n9Ba5v0576MU3tY7Kmaj
	2WcMfVT4kEN28b6/pUkM7BYvLK+LSFIWeCZn1l2qKmAEpJDp7rzCzwZteW7+CoM5V9N091aryuf
	QBBSfxxg8w6CXzqaHcv1RZWP7XH9YidyyPqfopkIqFZOILKlQzoeAgs/dTlTOMeuGALd0bOEuvG
	YewFRd+17FbDTIRQXHm8qfy8ds8tpbEJZtk5INWSSKkQkR
X-Received: from wmgb20.prod.google.com ([2002:a05:600c:1514:b0:48f:de5b:469b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8599:b0:48f:e230:29f4
 with SMTP id 5b1f17b1804b1-490426ade02mr205371775e9.15.1779818361151; Tue, 26
 May 2026 10:59:21 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:48 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=ardb@kernel.org;
 h=from:subject; bh=Kh7cxWXkNrSTDvznUsNThby14Lf6cpInZSVAIOoSUVU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0fsQvk8viPq9V2vx6dMWennJ+dkQqIjT+cV/VLZF1b
 R7nhSZ2lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgImsLWZk2HK0ii1yonQZe7ZV
 +ApXXrWOD0eLlqwV53zN/y7vkpHmYUaGZx8+meyLTM/2WSaWZW95P1zc+UOGxrXah+2Pw7MWVjW xAgA=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-18-ardb+git@google.com>
Subject: [PATCH v6 01/15] arm64: mm: Remove bogus stop condition from
 map_mem() loop
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105924_466779_52E0F0EB 
X-CRM114-Status: GOOD (  12.77  )
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
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093ffdb..112fa4a3b0eb 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1173,8 +1173,6 @@ static void __init map_mem(pgd_t *pgdp)
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
-		if (start >= end)
-			break;
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
-- 
2.54.0.794.g4f17f83d09-goog


