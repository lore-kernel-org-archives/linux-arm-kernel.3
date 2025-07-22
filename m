Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B02C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mvsu2vjVRIsk6oZmKXVbnoH+nR7s7OCeL0T9nIIghGo=; b=KHBmdV/Bb6ZsMvkob9y71F0r3x
	WLk6M3U6yi2qzoMnN4UF4YzKkubnMb9ZGhOYV/uOqo3ROiMSvJIVsyyGX0l2ZHmCRBnx1InT5/Y1+
	XmDPIfC3DJPOcvEBzXMLKMesGxfYEP4rMqjd42M47ay486jGzJnbMJzf73SNQJA3v5A4p5rhOzaqR
	k2023/qt2ub90VxtB7YUcnJQK4IoafjRZqUmC9aDrI1/XMAmAO67ZubkWyfGqGSdkS0IixDw4Eix/
	InsHw5p7p0BCmE83dCs/pv2+6FYlrR6EDFMQz22cnK7af/lXAIB4XlqalPV9M7yzdKiHqlc4tlBL5
	fVqGJy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8Q0-00000001qEJ-0agh;
	Tue, 22 Jul 2025 08:32:12 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8Fy-00000001oNW-30WY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 08:21:51 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5027122a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 01:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753172509; x=1753777309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvsu2vjVRIsk6oZmKXVbnoH+nR7s7OCeL0T9nIIghGo=;
        b=E+vocKbidxc5JuOfayxsAk+doM28gjETzt8HpJ1lrEzPRO6F7OTtMEl+5gMtl6/+M7
         +Em5BpQyfCFVuvdGYsNS6l4vSMbFlfk4ois9aZXiUsPUgN3uYvINjt3aoPLQIadQMj9d
         +PlSeehvKdSdkXzWpXLcN4PV3KHEuNPOwmrYGPNV1mEdhi7RDjwxU5USOYKNgjn7hWWX
         hQKN3HhM6VK/Cqn3H7uID4xqaH6pmn93VJZgY2s3jXG9tF745zPJHbHfO04Wkzp3tCYQ
         ih5H2KH7KCvliCMqpxDtSyv34HhuZ1c6v44kVoIN2PvyGmt7ZMtMjDHUkRHI2KnqjJAi
         igCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753172509; x=1753777309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mvsu2vjVRIsk6oZmKXVbnoH+nR7s7OCeL0T9nIIghGo=;
        b=fA3DqtEjMmfFiqOdxxY1eBirmeaE8MAz1B941Avc9CpnvkAJYcywL7fR5mcT5k5dD1
         PtpdQFtms8p5cH/ZEKt8aCJ4+xhGRjRoxleTYO8Fdunah0qEMgJR7DJxkWHT3sk5/A5P
         6aD7cMwcwNj2RDrD3pEiA4ekGHXCI9M7lLChzan/D7bJKKAZjFOGyGnZvYjgAGF6dIq3
         O9x2l2lq2AS3+zL0Lr47QMEpRrjQfNDO6ssrV0pRJ9AkERm7E0rfzUynrj5KK0wvZo0Y
         AGEcieefsL+xRgCQFyGyg63qgXqyxbw3SV5ot3Ap/Nz5CNIVbDPLu++s97UvvzWdl3VA
         quKQ==
X-Gm-Message-State: AOJu0YwuMYxrqe6D8G1nlpw5NBbxVs65/Eph6R9YRa6xaxdA5FQ8BAnQ
	YC8w1ebcw9KPBf3iG6r+IikmYKD4qD7+uwwWEM81BC5VQx9gneqDBKoIcvLSwEUr6Es=
X-Gm-Gg: ASbGnctVNZxtqJp69gOXllGrX/p7EmfH51Nd90JQ+J2FwEEWqBTYO4oZDvhQBS1tksv
	6P9c3d7Ne5hIq5ok8MbF3nXfjdRZnkQ289YPws9q6bFS2hO297Ix6IJZdindBOEzOrUmoKPPvTz
	nILElZiHAfhI2TBCJCJdbAhubNL1ZISNADR6iWtTZct+USp9dXuxPeWRaIACNGallMXl67OXbiO
	9FaYnrs+aNDR4tTuNs3/X46Iw3FadfNaniO7glNF4fvXql18AJlqglATqZ5CzW4T4CMB1MHleX7
	aii9gxrTY0kpuvJWuea8SQ8GsiWnzMCsRIICQheeMmbjr5qwQekdxilADDMD5geb+o0eZUgu5iS
	WqlQ2pfjvuiTdPwLH0anWqkW3yC7zQICC75LMKj/VgHqK6w==
X-Google-Smtp-Source: AGHT+IEjJOxKFCMA/W05J86dcoXFeTq9z2VaU8ffTPvx80au0umrXWr+q+XebdIcsaID7+0UviaoUw==
X-Received: by 2002:a17:90b:5485:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-31c9f47c799mr33546230a91.24.1753172509476;
        Tue, 22 Jul 2025 01:21:49 -0700 (PDT)
Received: from localhost.localdomain ([36.110.106.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3c3a5d15sm70337265ad.62.2025.07.22.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 01:21:49 -0700 (PDT)
From: Weikang Guo <guoweikang.kernel@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Weikang Guo <guoweikang.kernel@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: mm: Ensure phys_to_ttbr on pgdir for idmap_cpu_replace_ttbr1
Date: Tue, 22 Jul 2025 16:21:13 +0800
Message-Id: <20250722082117.1777570-1-guoweikang.kernel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_012150_758013_B2A65BA6 
X-CRM114-Status: GOOD (  14.40  )
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

Commit 5ffdfaedfa0a ("arm64: mm: Support Common Not Private translations")
changed the contract of idmap_cpu_replace_ttbr1, requiring that the TTBR
argument passed in should already be processed by phys_to_ttbr (i.e., in
TTBR format, not just a raw physical address).

However, the current map_kernel implementation does not always convert the
pgdir/ttbr argument via phys_to_ttbr before calling
idmap_cpu_replace_ttbr1. This can lead to issues on systems with
CONFIG_ARM64_PA_BITS_52 enabled, as the TTBR would not be properly folded
per the ARMv8.2+ requirements.

Signed-off-by: Weikang Guo <guoweikang.kernel@gmail.com>

---
Note: I do not currently have access to ARM64 hardware or an emulation
environment that supports 52-bit physical address (PA52). I would
greatly appreciate if anyone with such a platform could help test
this patch. Thank you!
---
 arch/arm64/kernel/pi/map_kernel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index 0f4bd7771859..05a04eb91e81 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -18,7 +18,7 @@
 
 extern const u8 __eh_frame_start[], __eh_frame_end[];
 
-extern void idmap_cpu_replace_ttbr1(void *pgdir);
+extern void idmap_cpu_replace_ttbr1(phys_addr_t);
 
 static void __init map_segment(pgd_t *pg_dir, u64 *pgd, u64 va_offset,
 			       void *start, void *end, pgprot_t prot,
@@ -90,7 +90,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_offset, int root_level)
 		    true, root_level);
 	dsb(ishst);
 
-	idmap_cpu_replace_ttbr1(init_pg_dir);
+	idmap_cpu_replace_ttbr1(phys_to_ttbr((u64)init_pg_dir));
 
 	if (twopass) {
 		if (IS_ENABLED(CONFIG_RELOCATABLE))
@@ -129,7 +129,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_offset, int root_level)
 	/* Copy the root page table to its final location */
 	memcpy((void *)swapper_pg_dir + va_offset, init_pg_dir, PAGE_SIZE);
 	dsb(ishst);
-	idmap_cpu_replace_ttbr1(swapper_pg_dir);
+	idmap_cpu_replace_ttbr1(phys_to_ttbr((u64)swapper_pg_dir));
 }
 
 static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
-- 
2.25.1


