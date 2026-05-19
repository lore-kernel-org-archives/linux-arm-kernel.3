Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D408FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BqpbKAWZ7q/0CP68ZcgDWV1seLRY3kHiP/caX3fZn0=; b=RJLCHNo8+QIn4kdfhdLRrWNyYc
	zb8WjwEGVw/oJaPcSH52uQ8St45qqbqK23JeoP8rbCwNPht8XPoG4mWAL8BjzV8XyiSiIoPxF1rrl
	I5Y6awynYFc2N3iSZbTDnmWg+r4eTSkgu1aEq+50w/2KI5utjrGjIF8vO9xlxd/TA2nivqg35CKaf
	JEish/PSr44dSa913lv0K+vvfSYnlqpkVmJB9fFGGME+nDBJYbgfQW5RTA87YPhMCOAb+zvnO+jNn
	FhiaxSHwaPSM+0GN32fQKbkVWLoJMZ5G/iAh3zgV2pBMUB2hfDqsKv+SrVkjds2J12bZMS03AUiLr
	wBY8tsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDL-00000001yeE-25IQ;
	Tue, 19 May 2026 15:18:36 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDB-00000001yUj-2OI1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:26 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fd396daedso24201425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203903; x=1779808703; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BqpbKAWZ7q/0CP68ZcgDWV1seLRY3kHiP/caX3fZn0=;
        b=pdtcrP5YTIWpNL79xozgx1oyG9wr5WO0YHxVSOrlPOtUG+NQRMTrTLQB3Kl2VyARg1
         mYDuea6YF/etOsPobft2nJGiRQwWGmdS3hrl6v/pX8aIgT8theO8N1Q57zx3ZmTx8U4g
         hVb2UM7c8Swq9dwz8/xVI4NSmqArTsUb2uWUxLQC2dAhhZjwhDdbIv9/zljjmCa80AOT
         lylieJmdupgGmq7tYkubnt75WjnV3y80ZisYuICyVI52K320O6Vwb+3xkKHEtQZUMWUk
         JDXAmudRvXP3Aj5sCy63ew4vHxNWjvzA0PcFHOUpn1qE8h4tWkQKF1AjQEDFSCIe8vRD
         yrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203903; x=1779808703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BqpbKAWZ7q/0CP68ZcgDWV1seLRY3kHiP/caX3fZn0=;
        b=FVLras2xRNfuF3E0kBB+6qyqh7q8JInMSYYcdUsBGtROoxBEB9enZ7j10vTMQbB7qS
         b8MHA/KduYOHkArTXGkmYgsUIbQjHhqxvAIphC+SQZ9dZalmNLpSdbN8fRca1pC3nK+5
         FkH9gAEhiR+QJkMTu+iA1nBnuFZRIhoamQeI1PN4J7t2UqIgiUxOWCGWg5VY5EqCl3FZ
         OlUKJwTgLAdt1NOjl28DG/L/WznsSew74edNEaqdDZw+5CDQVscDcNteGoJnAoQICpXS
         KVggDD06bufVuf1hEWxgZX+Zqr8WvDHlKyGXBwsYRKO7DWHSg/c5gJYDGH5RlK5d9hOo
         2f4A==
X-Gm-Message-State: AOJu0Yx7L4zQWrGBovAL2u2XuVMA1Zy1dWlAHabgM/OF08pMhTgrHToN
	teR378rBp/tQbYUmLMHj2pDVnESm3OKQyTOIbTh6u8S2QR76XuZLfz6IbNOvOzJhBkaRMgtybF+
	WS7MQ+qOk8vaIlAhagFK6VhShzkhhsFNLADg6Ef/beNM2NfC+sYU1ZnlQZerBEV//af4DCLzh9e
	oMxqYAlL/qJVRGHmOtEmqH40SClLN41xk1/71bhZ+hK3sL
X-Received: from wmlz4.prod.google.com ([2002:a05:600c:2204:b0:48f:f301:5115])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:34c7:b0:48a:54fd:54ea
 with SMTP id 5b1f17b1804b1-48fe60ecd93mr316640905e9.12.1779203902737; Tue, 19
 May 2026 08:18:22 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:22 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=ardb@kernel.org;
 h=from:subject; bh=Ku3pRDk9G9j/NzX3V+jyzDs6V1KXE9BKuYBtWjFzJCA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7uSdmn8Xi1/JLnzWebNMa9qxsDn1W/8/E5t3/2356
 9nLJq5821HKwiDGxSArpsgiMPvvu52nJ0rVOs+ShZnDygQyhIGLUwAm0jeVkeF+J9sCHsZM9s+P
 1wYpNRk982/e72CvdncSS6EzizDTPX2G/yXHhFfdUP9v++DE/9cvj37ZIBhl2cD+iFf1/KEVwWU yrUwA
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-20-ardb+git@google.com>
Subject: [PATCH v5 05/13] arm64: mm: Remove bogus stop condition from
 map_mem() loop
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081825_622508_B5BC324A 
X-CRM114-Status: GOOD (  12.26  )
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
index 4c6ef0d35714..cd841a392b44 100644
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
2.54.0.563.g4f69b47b94-goog


