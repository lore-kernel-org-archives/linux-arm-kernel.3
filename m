Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05D21098792
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nHE9g4Iled9/dsrfh2bAJinc1yfJyvV2ys78zWRafI=; b=bxRpuedOfjOVw+zIPWIJJ8Z9Mt
	25RwJIhagxJkbCQV0LH2/FU4IwIdDxHFrCTqaoGWGEJjlohR5H9wJfDREiP7S62Cr01FFDRviofKg
	PlMJrxdtGRH1BG4UunX2t5zI9jtmHKrK2LHIdV2FOZJZMQLaHV5oyA+SEfEacd3eGkTwVL4eUmiXM
	4eZsrk1kpl2eCTQ+DBO4AUZgP7wDBn6kvmy7GdRqYWDgRGUOxqJqsAfxhA/TR9SWxQOgP0KlEasyy
	CR096K4ZSJQ/z3+o4IAundcSgzBzubHkdOchHHDHIIRwtv9Cf5JjBGk1/aPQYZnlP/TmgPIrywd/E
	HnJXxj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKw-0000000CynK-1pMG;
	Fri, 20 Mar 2026 15:00:30 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKa-0000000CySf-1FmE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-486fb29a8b8so15398915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018806; x=1774623606; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+nHE9g4Iled9/dsrfh2bAJinc1yfJyvV2ys78zWRafI=;
        b=qnB/UKB9+UYJfI9x6/uYHWe8bJ2NhPwRWZZR4gFBACKSczYzSAJJh3k3e8T41++Uzn
         gyUvML0llmfkchhJIWbxktj+R8kSFcJPlrouShG9Pol2L65RhqNFMIsqKARkpWTb/VcD
         uXkKBMnaXHYY9ukxpJkUNstnmrEovPKdlOCnrMTdBhunoHy+lpOBDsM1D36xu3WH7Iha
         VcgjnmZlWkXmO0I/7IXyq49zGQoMJqUvwZKaqEv9QcE2aG3GWbSJ6KSJvXm0MqaWrGyN
         tPoeFQ4h8vLZoZK2FnlwTPYLClu0SvtVAzSiA+TnXZNTdLOgA/nsq405fLPmVtFglYTw
         eocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018806; x=1774623606;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nHE9g4Iled9/dsrfh2bAJinc1yfJyvV2ys78zWRafI=;
        b=BZfEG4ph6uiqsVBLfnE3cyID6DJVYVqvS0EB/XNqaLMvFoHCTWZEKxXOKfo/TblRmH
         ONqtUpLJUZzQDzHgED1FCg0he6bG2gRllhCko5UKsPZUabY0ofYArOkiFTMtYVEymjSl
         hoWeFV0XDZLPbDUcK53pFDyVtVnhlhUQZgybh32d0gk8huP1ylVXCIIf8f3G8e+ZPo0X
         AL/baVvHcmrwdTd1LcoYTt4QsiIedhlDiu0bYd75TEiRBwuz9SP2fkYVqixo8fPFS3On
         DObOF/TpeRZJMDQvHr68oUi1VRKo8nXrtxmAI7cl4/7PS7HKOzbCSkAzVmMYr00Ax8of
         TGcA==
X-Gm-Message-State: AOJu0Yx3HlN9Cr7CeWuLljIjwHkT3bCMPpmQnxXaq355KxiE2fugLxN5
	RAE7JFxbmGBuFh2P0MGh6PqsZoZTr7RlmxGKGZcBQkGgSjeouSHjpL2hVsXGmeclM5mi7e1l6Q=
	=
X-Received: from wmaj7.prod.google.com ([2002:a05:600c:6c07:b0:480:4a03:7b6f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e8e:b0:483:c35d:3659
 with SMTP id 5b1f17b1804b1-486fee04a48mr47773445e9.18.1774018805524; Fri, 20
 Mar 2026 08:00:05 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:42 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198; i=ardb@kernel.org;
 h=from:subject; bh=dhCmT0xhgO1wynakhoxtMTULOKMtch1e7OuwxF75oGw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwoMI8+i12Utr1y67d7vnI7fbJp4TO31Wf/7f9fSZp
 X3oO/cfHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAigkyMDGscNhv8F7vWM/FC
 Br+T9vd3Pc+uP/MPefnRf/d5MatA3WeMDPcY8y/NOCEmXsvdHe7z5c29JU1ceyKN9p2IN9+S579 /KTsA
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-22-ardb+git@google.com>
Subject: [PATCH v3 07/13] arm64: mm: Use hierarchical XN mapping for the fixmap
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080008_348156_D5EE8D96 
X-CRM114-Status: GOOD (  12.60  )
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

Nothing in the fixmap or in its vicinity requires executable
permissions, and given that it is placed at exactly 1 GiB from the end
of the virtual address space, we can safely set the hierarchical XN
attributes on the level 2 table entries covering the fixmap, without
running the risk of inadvertently taking away the executable permissions
on an adjacent mappings.

This is a hardening measure that reduces the risk of the fixmap being
abused to create executable mappings in the kernel address space.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/fixmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index c5c5425791da..c3dd3c868cf5 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -48,7 +48,8 @@ static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
 	if (pmd_none(pmd)) {
 		ptep = bm_pte[BM_PTE_TABLE_IDX(addr)];
 		__pmd_populate(pmdp, __pa_symbol(ptep),
-			       PMD_TYPE_TABLE | PMD_TABLE_AF);
+			       PMD_TYPE_TABLE | PMD_TABLE_AF |
+			       PMD_TABLE_PXN | PMD_TABLE_UXN);
 	}
 }
 
-- 
2.53.0.959.g497ff81fa9-goog


