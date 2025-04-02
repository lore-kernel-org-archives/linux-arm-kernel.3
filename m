Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2722DC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 20:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLbPJRlyqVSx0cIJ3mGyFLKANvzzRuV5I+YYDBn/Qb0=; b=A3EvtoY/UeKh96uJhxV421zAE7
	W1JV3I9IoJJns5AOzddBf7IXJKcM7eELunJEQdue25WsGjZL5HOAWGjC5PDladHIVIHebx4dCM+B+
	Uo27Bqk67bm6A8RjpFqP33sZeH/ngngQewEUdFO14TuTRnkwhDKd32+QAIyuckTIdZb5jypQ7VBpG
	gC4dWQpNmgMQaQuard1xVSAWGrCPHmBGj428LPOocd/jzUQiKtl/Srx9J7dOPE8M543jR+qHya+D0
	N1tZ5OcaHSEoHrsRhgJ5oBQyeAsyaW5GdJhE+N99wiCAYE4ZoT41uO2SqTKhVNvbOMoirUSD921GQ
	H92YTqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Zf-0000000788S-27qi;
	Wed, 02 Apr 2025 20:20:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Xv-000000077ph-1m08
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Apr 2025 20:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QLbPJRlyqVSx0cIJ3mGyFLKANvzzRuV5I+YYDBn/Qb0=; b=Nfrz3ROGXN0O80DToFCDxfu6XG
	yoyUyBkZqiwBQIjSx0CUpkS7l7FsHD3njuvDumbfUaGa2zSt7S3oisW9uQx3hTFhvpXaN/ObTk1Ow
	gQYkewg0TLVGgufwQ78yCM45XNjHzaEJAtcCOXjNSF0I0vubrHOQdr9/G43iAC1nHsMByQhY9dP3w
	XKK0ICk6AId5UHnCNKEAMKtzPshdkmLVAE4G9El40B82ioTzorcncoc3p8Uq/idZY3MdIIQxeeCtd
	HbfA5xi6ZzxM42IQRE/iQIBKVE7I+/KmNBg30BWFZRouqfIlIM7+NAQU01c3e+5geZbpIasnFrSaN
	nfD3oIvw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Xr-0000000759n-0W23;
	Wed, 02 Apr 2025 20:18:43 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u04Xp-0000000DcH8-2kho;
	Wed, 02 Apr 2025 21:18:41 +0100
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
	linux-mm@kvack.org
Subject: [RFC PATCH 2/3] mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
Date: Wed,  2 Apr 2025 21:18:40 +0100
Message-ID: <20250402201841.3245371-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402201841.3245371-1-dwmw2@infradead.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
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

In the FLATMEM case, the default pfn_valid() just checks that the PFN is
within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).

The for_each_valid_pfn() function can therefore be a simple for() loop
using those as min/max respectively.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/asm-generic/memory_model.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a3b5029aebbd..4fe7dd3bc09c 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -30,7 +30,31 @@ static inline int pfn_valid(unsigned long pfn)
 	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
 }
 #define pfn_valid pfn_valid
-#endif
+
+static inline bool first_valid_pfn(unsigned long *pfn)
+{
+	/* avoid <linux/mm.h> include hell */
+	extern unsigned long max_mapnr;
+	unsigned long pfn_offset = ARCH_PFN_OFFSET;
+
+	if (*pfn < pfn_offset) {
+		*pfn = pfn_offset;
+		return true;
+	}
+
+	if ((*pfn - pfn_offset) < max_mapnr)
+		return true;
+
+	return false;
+}
+
+#ifndef for_each_valid_pfn
+#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			       \
+	for (pfn = max_t(unsigned long  start_pfn, ARCH_PFN_OFFSET);	       \
+	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
+			 pfn++)
+#endif /* for_each_valid_pfn */
+#endif /* valid_pfn */
 
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 
-- 
2.49.0


