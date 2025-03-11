Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EF2C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zhuiaZIhdYKodTSRHfJow4PUMD6UoZb9x3/nLZ72Wmk=; b=FemHY5CjgkKFvrtLxOhENyCilm
	vNHnmLuVTdv3AFTUWZXcIsjDqbgUzD3bdvIzvhr8691o9Rxlgl4qixfAvZLjNJtJAo/0z63JC37AR
	umOJ72yDvz8Kb3yajzipbraPylz6E9LhGAyExkBmNUfMLMqN/rLbi+XbkKz5OsNpryhpoM6T2p77W
	5fmDQ9vc+b0PPQp1IFbyaRkPYfFqf+WI0WkU7HeeJerFanYZiGUhNVKogMwIkz2s+AKGTs0td1RRG
	LvB9JMEXfs0Uv5jWR4N8xc4NWedR0+8ZBKMhJwRoJgzL47x5J25cSBDxW6oAIi5jp8Q2QoK2Jiqme
	i0t5Y7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tru6K-00000004qJy-33Jg;
	Tue, 11 Mar 2025 07:32:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tru4g-00000004q2S-1vVX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 07:30:51 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so8551335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741678247; x=1742283047; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zhuiaZIhdYKodTSRHfJow4PUMD6UoZb9x3/nLZ72Wmk=;
        b=yrwYYKsOxup9/U1SijwlyWYgP3YsVjLVJfAbEi+17Zv5ZHQIHqfxNY2/NJM2o9W/oP
         YT7TGCfqmYLV3PoLnOp1bd28BiPQSoEHB1pJnB1g7/Sdf9ZmFVj7Rk64ESrdQRkEQ7uR
         DHPJojFu/0a7mMmR0hjUWkqQoQwxJf4DrMPmtOA9qX/Lvms29gIFkda3ciwNiXB3CaJy
         /gv10NVbcEV5KiiOWJ94LiiCbj0Htaizx6cgLvI4mrH+by1A0IF0biuCpo3vAxQM/cP0
         5Iug6Tz6ZY+ujDY/8RYLfN4EG9CNvBJKs6c2CF04z4PUXMvPb9LHvN1RkalCZeJFKzzh
         1inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741678247; x=1742283047;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhuiaZIhdYKodTSRHfJow4PUMD6UoZb9x3/nLZ72Wmk=;
        b=dLyyu+mrwG1sO9BAIptyXtgE3un6/HVKkJNEsgGPxA+3s2k5EqEgIqpfnHax0l+Mkv
         L2vcJAIj0gRgwrI9mjeHZwVY58wkvJN9707VHCi9LhR1xwW+MHVyFp9npOh4vLTHQJjP
         2VdO9lP4YOs558QKCD1QrW4t6S+gHA4I/azifPlmDthRjHNPhQVlzdYadBzGru/zo9nN
         /lYh+rlu+3D8NY8yc2utkWOZaNXCBtpaof1Nf2VZ/XAuMCUp49BcOfVaKe/PN35hiD1D
         Pxu9v2r3DgEzXXZH3CANTPcXGGZT86fQBtFRTUDDvyr24MtRR2VzL5baOhvm8O+J0ojr
         rTxQ==
X-Gm-Message-State: AOJu0Ywffs3BoSTAlYj+9volw2PBu8IZMm03KNhtLaihPNa/KTiCG6Bt
	JbJShkpPf/V86H6chVh6Ap7e75Q2eUKDIGEOjbLM/5V5nQJptcfzSU1/pYQyFiqZwahEoJJbWx+
	tgbImy8vEFN9Q/EF4BzQPr6Tn+8kG9Js6/RlSqHBzCVQ4VgyWmOODtzAyt/1ZjtQdet/JCvwwAZ
	8h4hWQIST3ggRRZJOEpema0z03OnPW+tG2k261TnYz
X-Google-Smtp-Source: AGHT+IGdZDK1UMSJSho6/vTKgr+ZVUwGAK4BG/Lmd5N3BdsDSzLy1BG+KfP/kqDOcvwrCH22tHV+yNYH
X-Received: from wmrn42.prod.google.com ([2002:a05:600c:502a:b0:43d:1b8:4e53])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f90:b0:43d:fa:1f9a
 with SMTP id 5b1f17b1804b1-43d01c22acfmr37124095e9.30.1741678247711; Tue, 11
 Mar 2025 00:30:47 -0700 (PDT)
Date: Tue, 11 Mar 2025 08:30:44 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=ardb@kernel.org;
 h=from:subject; bh=q4fw2h5PkJrIGNXLFU2qUSwn/QGGmIKa9U1Zbj+tl8w=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf38syX/dverrT6wr5vNbqOL1eT0T1seVgqcev/x1Y0ZF
 69LzYrJ6ShlYRDjYJAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQATKV7EyNAud8/49uZ1DMY6
 Vx9UxQc277ffyevcvP3Kjqmuz5syb79i+J9kGbq8YqeJTLr0hqOXu2zFEuysLymJCLwJ3CoqsrN NgBcA
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250311073043.96795-2-ardb+git@google.com>
Subject: [PATCH v2] arm64/kernel: Always use level 2 or higher for early mappings
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_003050_498801_EDBF13FB 
X-CRM114-Status: GOOD (  15.78  )
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
v2: take the assignment of protval out of the loop again, so that
    clearing a mapping works as expected wrt the PTE_CONT bit

 arch/arm64/kernel/pi/map_range.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
index 2b69e3beeef8..5778697f3062 100644
--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -45,12 +45,12 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 	 * clearing the mapping
 	 */
 	if (protval)
-		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
+		protval |= (level == 2) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
 
 	while (start < end) {
 		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
 
-		if (level < 3 && (start | next | pa) & lmask) {
+		if (level < 2 || (level == 2 && (start | next | pa) & lmask)) {
 			/*
 			 * This chunk needs a finer grained mapping. Create a
 			 * table mapping if necessary and recurse.
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


