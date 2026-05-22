Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00ACCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 05:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6VthUqcKepKjJupP2u4sKeVYf/HcaCpW/hf4AjZgMk=; b=YKo7HcXbtstXhO11mefcdHitBo
	bM1iz0aR5nGQpUGNduQh2rgCtlPcDGO8bnRHT1+CDlaoJRSN6VwtRdOOHD0ZjPaQr4Dr5ojNtUusX
	b/mn4F9EETo1VCXaifmJD0jYMelm/8bIVWvihlZSBnGkC46vZ+cP2N9QIssVskzNpBZi1LDXOxnmS
	jaMSZMFeOlCxaKGvaaZhS5fQKsP53i86xzy5CgHybiY+gQChYG5QxyD6KABCmZCKXG/Tfk1jxzAJd
	SJLjAhkr0fWA8cAIyoSqhqnhKec0BFNaNAyeBbHAgRynKj5siKpCp4OGGTjXJbz1eYuFiG0F5h9+Z
	gze0uD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUS-00000009rZU-3j9i;
	Fri, 22 May 2026 05:32:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUN-00000009rWP-0C9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 05:32:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ba6485d219so52147005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779427922; x=1780032722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6VthUqcKepKjJupP2u4sKeVYf/HcaCpW/hf4AjZgMk=;
        b=Qpq+oLjy8wH5/IMQO+dXb8Pbo2YNp2w2R81KVnCFUu022o06ACnsCMLYWHhBDw0BEQ
         CRrOU9D7SQlpJl5sPYeBFPd2MM8GbERfLkyVnKm65lIbqgmHb0nrfOmRYJkAOSUjHjGD
         h7+t+Jc4VrlvlVssNd6aXVWp66Db2vWQsqW7gKz0qxpRmRHXZJIqXr3zLLCtT+X/SF9D
         uhAS5Llw5MIhwNPgPyCSWRgZcG0474Q/yvSnqLaHvP3a2M75rw7tKJUXfTAjH0tM3zgu
         /RrEbhCVwzouuXPxwsT8If+y4fyLCsFN2Oxw1h5pWy+R9vbSdAMY2QsXeaR8uqaz/S7a
         RJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779427922; x=1780032722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6VthUqcKepKjJupP2u4sKeVYf/HcaCpW/hf4AjZgMk=;
        b=aLytQxClf/x1IgBQi63PM6mzQV8Vwk98HyO+WsgcIyJuGkhcdRO3Gskst5bUGKsoqS
         /FiqZWWjQpLl3xW+U/astMc7lRmtt5LBJQprx9qXDYFMwHxys0kaYxC3Uwm6VdDAaEED
         HuoURaLyAoDE9dDeZXdBYI6UTR9GFPUDTALKIEb9hTYoCLBrXqrtpCOgsMJBSZ+HQwj7
         ooM7FLtNjO9AqjZ6Qz6oX6C4xNRb1wyRZGHAPKOVy9mbLDGFW4KbMtd2zQSPt5lJY345
         7dwrgMORViaYiIFaCLq/Uk6SZXPl8Q6cPXYZaJlHAbv9Z5eipizgLl60jvC9Y9kz2S3o
         JyeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hwd6y/xctlvyEWsreschv7+sWNUTFcFsuJaDchVgdBh/Fo7w+NEf6eKsiu6y/N3RKYBi8rH9ArbdpQMyZZbt7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0G2sJHS1njGVUnvxUNz9bGIJXBANyyBhkvQUR4Xvxhy4KWM43
	HBw6QmF0OlrVp3c91rm7zoBERC8Qv2cxIUXBCQrwNq8x8tKeN2hyrEN4
X-Gm-Gg: Acq92OH/by9bNzvpTKj9ojXXAT5kefvMmVHGY0nnoXfI76DNsBKD8IprD+CxjfU6T/k
	HYTSr/5FHKWsp6fSjJErzW8Q4Y9MJKtf05zbJjlYgwmFgyCAv//0bYyUx+dlah+UMYbJ7MnNynh
	r21MqMTTLhUlgG7jpAMXek2zE6MtBX0GOLQKkPlBFqQqabwexo3En+2DDtbZJVL5QmKYbhse8Jz
	3mfIXy0ZC18HO66G1sjrc2UsipaWr5Qe2g7A60ScqlhHl2u1VTJZTIBpAmvbsTZCr3GHrT95T0n
	e6mB/8xg12t3ukirn+LAkL7IUln/j3prSkAZ7jthN2Xo4Wm+CbaLgzSH0TfGSMKkX/vXpobWLAY
	iabEpU59KuxD51pzY78C9VFCgAaG7uBZRq0B8iSAdEu/lDIEKUsGXb4W8/WQfFcCIL3DWPOtGHV
	jn3qWDJPMMqt3kKDlZbRNFOBomEl4X4Na5nKd2fvxcntNZxCE9qhY=
X-Received: by 2002:a17:902:f705:b0:2be:3dbc:eee5 with SMTP id d9443c01a7336-2beb0365bbcmr23143495ad.2.1779427922345;
        Thu, 21 May 2026 22:32:02 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm4782665ad.32.2026.05.21.22.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:32:02 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com
Subject: [PATCH v3 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE
Date: Fri, 22 May 2026 13:31:42 +0800
Message-Id: <20260522053146.83209-3-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_223203_088857_AF35005A 
X-CRM114-Status: GOOD (  11.60  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE hugepages,
reducing both PTE setup and TLB flush iterations.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/vmalloc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..787fd17b48e2c 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = 1UL << __fls(size);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


