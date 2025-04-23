Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE4EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbMdDFG9P+bdaitfSB/95+V1DKWHcnUFJFkFTDn7hYM=; b=SN4mGZLIqIVpgs9D3LPyrQXD7q
	EGNsIa7UssT7S6zp7LP9x5tL+zeExYbVrj070mZnSBR/TIE3oe6ILgEJ9tF+Xvr9Xg0jXS4TTVbut
	qiVBqUFnfQBgMi8z8tz701swWLxLZfOtjM2xkCBJCAyUZH3leaz8f7sDzoYoo5ISTMOoILjFUFO4x
	fmr/2GpFui/hdWZabchDnbNTyzCZwug0e5Ppu6d4CRPXByrEw13Oi8L35i55AMop7/ObAFp8iOtts
	mIn644imAP/L8cdeZy9UGIO6C6TC7wTIej+dCPDjatqEWu1ijL9Ft7EneEcMrgDTt8vLIX21Zv3Mq
	ilIUXWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WSq-00000009yY3-0Nf0;
	Wed, 23 Apr 2025 09:32:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VJc-00000009goP-2XX3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Apr 2025 08:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cbMdDFG9P+bdaitfSB/95+V1DKWHcnUFJFkFTDn7hYM=; b=ICIc2yM6OI9RDh+NOJty3eOWUJ
	FgYo2iqowgJFiYjbmeBB6IulpyokzNwdkLIKrlmp25lnGlNqJTuA2fNNuiQHre8pHPLQrjmmLGnE4
	M4hU22kFsneFnr8WhMTs/7G8PFgjZwwDjFR96WytCVzYxAsZiByHue6BlJjK4kQLeXJUuyQDQ1kR3
	ejQdsH8GeC2avhfbiNgmQQx20r1oAhzCfbwUEJ0vbOnE1b3IKAelb/IjTxSfKUvhUe4c6RMW23P4Z
	D0sqNEwszCaPmeUJExBUw080o/JA3LMGMxB7T9ZYsalDsgBkoUUWGoUdL38Pknptkkcf5QSjFZyrt
	mkR51KVw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJR-0000000BOif-1akK;
	Wed, 23 Apr 2025 08:18:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YO5-2FrH;
	Wed, 23 Apr 2025 09:18:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v3 7/7] mm/mm_init: Use for_each_valid_pfn() in init_unavailable_range()
Date: Wed, 23 Apr 2025 08:52:49 +0100
Message-ID: <20250423081828.608422-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423081828.608422-1-dwmw2@infradead.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

Currently, memmap_init initializes pfn_hole with 0 instead of
ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
page from the page at address zero to the first available page, but it
won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
won't pass.

If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
kernel is used as a library and loaded at a very high address), the
pointless iteration for pages below ARCH_PFN_OFFSET will take a very
long time, and the kernel will look stuck at boot time.

Use for_each_valid_pfn() to skip the pointless iterations.

Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 mm/mm_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 41884f2155c4..0d1a4546825c 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned long spfn,
 	unsigned long pfn;
 	u64 pgcnt = 0;
 
-	for (pfn = spfn; pfn < epfn; pfn++) {
-		if (!pfn_valid(pageblock_start_pfn(pfn))) {
-			pfn = pageblock_end_pfn(pfn) - 1;
-			continue;
-		}
+	for_each_valid_pfn(pfn, spfn, epfn) {
 		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
 		__SetPageReserved(pfn_to_page(pfn));
 		pgcnt++;
-- 
2.49.0


