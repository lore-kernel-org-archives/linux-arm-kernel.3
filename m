Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB1AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GBCTrGJB1mDqX6/Ebl8x0SDFQf9NjGpE5C21GQTHa8M=; b=mZQR2eXhGczCiNq6KVWIHfMXsm
	31U5caHRGwimXK5fOPuSLIOEOk0X/Z0nuGAwM+aTM5I5cfFuC9GgusF1Of+MrV54vJ1PFRxxC3nbD
	daWGEuT9etOXefsDP6vBLLaH5NFJo3619r/0Ytt2Log3+X+YNs4I3JHsBueeLJbH5GX42tS7Yp2Qu
	xiydW09GqVXmtThbtt6SOEqzADFgqQYizbrcFmWOIZYbt9OTbMr45QQBPkRUhQLtjj1UReV2QTg04
	RJ8ItKz4A4r+S/PLrPVJogYFp1N+qUhSSidIv1ymc+RcyXqcqQkmhJInkC8YZ7yJ+iThMw7/lH7yp
	Z8aUASDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1triuT-00000003k76-20mN;
	Mon, 10 Mar 2025 19:35:33 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trhtM-00000003bxk-39Cf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:30:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso5150755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741631418; x=1742236218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GBCTrGJB1mDqX6/Ebl8x0SDFQf9NjGpE5C21GQTHa8M=;
        b=lILOIdSKUeZOIYXHR0cFNFcsd/3UuQz/aThfI5rFiqWVy2/6dtjdQRtkypXRSJ1/Xj
         OF2XPAzGZEdw9XX92SFALWrlSQgypDy9OTOvuULaGq2eq2JVcjHjnz6qwe4AVwLe7r8o
         ruiw/UMjv3JRs5Be0sFO2+Z9aD0LzJpJ4hdlQIX37KbYMIfYvPq8CdWtCqSLAJ2zS8HV
         NvYOkUBl4dK63ej+Z2gZ/YtTaxK/uAut3VNo0OtFjffgZeuh7OBg/sALPpL5gfi99FNU
         f+JmA39XEePTLnrED/TxWa/edggVd84Uc0lFTxnPGFTg57YlYgqi6HmB/CE3ANa7ftwx
         ZV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741631418; x=1742236218;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBCTrGJB1mDqX6/Ebl8x0SDFQf9NjGpE5C21GQTHa8M=;
        b=nsz0f8ak/5L3KDEbPJW1LmR6u8Hlqil9H824rSVxahcyLxkCBf/zb7A35ZR4EjgHWd
         Om70G/KTcE5iK69nnMYN2rf8590GevufnHJoPcEuOFeg9VCoW26WM2DmlXQQAJqnomMT
         N8x9Q3G4bs0ac23RRPIbh5zdnKqcMnyuuND/pf9lAJ/vnfPcbZi8GOz1r+0Nc3v4cHIc
         kW5OYXuf5rrBZQdVgEN8Z8ZUirAnkjLWAvOyt+VOTS0quh6vcz5H6SucyTJWGN8iM300
         3b9B0wI96JIANidACIrsXGJKDHfLsvPDBbHlmvPhT3cZt/8rKijQwcXH2eMA2OAnRy1G
         arsQ==
X-Gm-Message-State: AOJu0Ywf0XtvuO3L7muZ/FouQ/WjIqJByVRGq745KUDrema7L+lkgWVu
	3WlJ9uXXSR3QwxekD0pbnb5O+nXRA8ejaexO/ffgC7ujbNqo+EWnOKLkM+m6mk8l00Qk1MiO7Dv
	xHIODWpWUhwjqRW9Q8HekDvwjAlfLA9o7p1ZfllvAuxpiF23B0Acg0H40dVM78Fjm+hYVYCCHb3
	bufdeS4HybdVBdMy2hrTGvj4q/UDv8s8p9k7erc2+T
X-Google-Smtp-Source: AGHT+IFmylnXC765vIkrlcBXJOLhfxj2Dp5htZKrcm7Lo1j1Z7lZy0NDOhY+5yNedTmzX+F1IMEzEWtL
X-Received: from wmbgx25.prod.google.com ([2002:a05:600c:8599:b0:43d:1d5:26e6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358d:b0:43c:f597:d584
 with SMTP id 5b1f17b1804b1-43cf597d841mr43447725e9.29.1741631418040; Mon, 10
 Mar 2025 11:30:18 -0700 (PDT)
Date: Mon, 10 Mar 2025 19:30:12 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=ardb@kernel.org;
 h=from:subject; bh=6U1WnWltJjm0+37BqDLoUuBxldhowZYK2AvL9mNi5mE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf28/pb6zAmPBLm2PNJkbI4LWRq26cOhzHVrDa8sWBav8
 rZnV8XXjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRpu0M/x2vHmR6b+cVdcR7
 9r+A2oVTzivtjuToeXAmPoEzvu8+pz7Dfxf+QEEmHZ5Z33U4jTUO6YblBjx1ljEOLO1veasc4VX EBwA=
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250310183011.2591600-2-ardb+git@google.com>
Subject: [PATCH] arm64/kernel: Always use level 2 or higher for early mappings
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_113020_810104_64C7AC15 
X-CRM114-Status: GOOD (  18.18  )
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

The page table population code in map_range() uses a recursive algorithm
to create the early mappings of the kernel, the DTB and the ID mapped
text and data pages, and this fails to take into account that the way
these page tables may be constructed is not precisely the same at each
level. In particular, block mappings are not permitted at each level,
and the code as it exists today might inadvertently create such a
forbidden block mapping if it were used to map a region of the
appropriate size and alignment.

This never happens in practice, given the limited size of the assets
being mapped by the early boot code. Nonetheless, it would be better if
this code would behave correctly in all circumstances.

So only permit block mappings at level 2, and page mappings at level 3,
for any page size, and use table mappings exclusively at all other
levels. This change should have no impact in practice, but it makes the
code more robust.

Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/pi/map_range.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
index 2b69e3beeef8..025bb9f0aa0b 100644
--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -40,17 +40,10 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 	/* Advance tbl to the entry that covers start */
 	tbl += (start >> (lshift + PAGE_SHIFT)) % PTRS_PER_PTE;
 
-	/*
-	 * Set the right block/page bits for this level unless we are
-	 * clearing the mapping
-	 */
-	if (protval)
-		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
-
 	while (start < end) {
 		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
 
-		if (level < 3 && (start | next | pa) & lmask) {
+		if (level < 2 || (level == 2 && (start | next | pa) & lmask)) {
 			/*
 			 * This chunk needs a finer grained mapping. Create a
 			 * table mapping if necessary and recurse.
@@ -64,6 +57,14 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 				  (pte_t *)(__pte_to_phys(*tbl) + va_offset),
 				  may_use_cont, va_offset);
 		} else {
+			/*
+			 * Set the right block/page bits for this level unless
+			 * we are clearing the mapping
+			 */
+			if (protval)
+				protval |= (level == 2) ? PMD_TYPE_SECT
+							: PTE_TYPE_PAGE;
+
 			/*
 			 * Start a contiguous range if start and pa are
 			 * suitably aligned
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


