Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ACBFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etH/ucf0ROVAevEBkHReKesjYkPK8m2/xS+mJi9/Az0=; b=dXw5Osv4h4P6TbyBhoDCPKDeJA
	ltZSkC1yOZcyftcUCneQf7XyZAcc7LkEUNpi+nVsA1japb+hedrVqPoymRhdhm/+pWr/r0zYYSCr/
	I2ivmBkpJNBc+O2LizLBJqh0ioGlLs1Hsl1qRgOYjBNxPfJN13sf2dCTIoomKD2JVZ58L/Kn5IhCO
	zCnm2szs0VMumHmguFNU2DLBMqrMBWSwWZzkU3PphFWsHGYDa1hGSeCZ4yNpAPAPiUP9lPJ65r8e8
	aPiMiDyJJIF4/wcv9zQ5NMWU3QW5mrlOUqQAsKVprV44zCB8mHple97y+6mmKCTW8dETAAWkHhi5y
	6FQQsHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzw-0000000HCVG-0IbT;
	Mon, 27 Apr 2026 15:35:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzn-0000000HCPk-06LO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:40 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488c2aa6becso94071495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304137; x=1777908937; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=etH/ucf0ROVAevEBkHReKesjYkPK8m2/xS+mJi9/Az0=;
        b=cG4jQCgVX+zaQdOSWCPxu+RGxNLinFiqccmuMyAmXGAYhmbrNVxXoZ69C48gowtGJR
         Uj8bTbyshceMbelLu8wJk4WauOvK8RyDDalMVmY+TyWbweGLExO8B3/z9rApsRaAxtif
         XVGW/PcdjvPkW5/l6snYm3rHyxC1E8zwylkDm4kwRgVvrjTAJ6S/aQmRy5CU+dD0cSih
         g4KEW5bT1t5prVa9kx5gGcLj+kzzKQmUhA8Kw7gmPapzBIi1KUbLpNr4blZqq5dxDRxA
         Rpn2EcWgsmvehdWsZCJskk2kIUMLUBGUpTSuVyg+QGRy2VtJPA9lZObFYx6QaCeUDFVV
         vjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304137; x=1777908937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etH/ucf0ROVAevEBkHReKesjYkPK8m2/xS+mJi9/Az0=;
        b=R/JovYpYOrrF2Y9nNNdFqut5yyGj8H0l19JVNhwuRiVOJEcVBoAItJwND+E7R81qcv
         Wwuti2WI18VaaWyPw0zMdUdPeT/+HbyWadSL+b8xxMQczJ3ZOHXvVfwDnsmIa6ctp6HD
         +GxbVoqFKAwj3MU4oy94DblFO5wdvvd6nWc/94R14Akk8vWKJyaPj8F5J2d+OB/3vsmd
         TD2rGhp+KipulBNWmoXqGWXqr/aSJMtUGw/tfuSx6FDxLcUHq0GmlhQTK+UzrSYAACmW
         xhCpmvBiwGnYr5Jj+9rLY/WfvbSFY4b4hOxmrKcnhziM5t10vGaKtPGGx4RwpCVUyjyG
         5HYQ==
X-Gm-Message-State: AOJu0Yy5R6eOzqGCA68zNwVflXYS6kerQasNDOCySe/OKOQ6f2dj9ahh
	rPjXwW4gdb9I8u26anuFk+weYBoxeIsugfJkiZ/przyURZq/Ow7SHp+eMTfbHHQmho9oibOZ4qa
	JJrye759TroW1emp3l4hV+nnlSD0rcqDTPByOlZOpDzKkTrshHa5euWTahxTTZLqBbXb0HP4Kce
	O2Jy9pi9XwM88cgm7OP7DssOSCu0wVCPi2e/0eYmxwfC/D
X-Received: from wmcn9.prod.google.com ([2002:a05:600c:c0c9:b0:485:fb9c:ffa5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3e0d:b0:489:6c28:dbc6
 with SMTP id 5b1f17b1804b1-4896c28dd4emr454740575e9.31.1777304136468; Mon, 27
 Apr 2026 08:35:36 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:19 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=ardb@kernel.org;
 h=from:subject; bh=Xui4zHPMyqNAfMojX3d72dmyPg9HBiaeXXlaXljmfJY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN945+SRZJXH5vdEE+o7Yvo32RxfuaV3S/5HSeeLwufe
 mV64bHIjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARpwUM/6tzU1eeXBAlq+Z5
 +VDlfPmd8pIhfj95ZQ8bhFlenPP7LBvD/7yyGqPIczsnJ5sZWSR+cbBZf/Xwp98hlSGvVEzOB0r eZAIA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-19-ardb+git@google.com>
Subject: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
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
X-CRM114-CacheID: sfid-20260427_083539_084202_8F6756D2 
X-CRM114-Status: GOOD (  13.77  )
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

The empty zero page is used to back any kernel or user space mapping
that is supposed to remain cleared, and so the page itself is never
supposed to be modified.

So make it __ro_after_init rather than __page_aligned_bss: on most
architectures, this ensures that both the kernel's mapping of it and any
aliases that are accessible via the kernel direct (linear) map are
mapped read-only, and cannot be used (inadvertently or maliciously) to
corrupt the contents of the zero page.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index f9f8e1af921c..6ca01ed2a5a4 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -57,7 +57,7 @@ unsigned long zero_page_pfn __ro_after_init;
 EXPORT_SYMBOL(zero_page_pfn);
 
 #ifndef __HAVE_COLOR_ZERO_PAGE
-uint8_t empty_zero_page[PAGE_SIZE] __page_aligned_bss;
+uint8_t empty_zero_page[PAGE_SIZE] __ro_after_init __aligned(PAGE_SIZE);
 EXPORT_SYMBOL(empty_zero_page);
 
 struct page *__zero_page __ro_after_init;
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


