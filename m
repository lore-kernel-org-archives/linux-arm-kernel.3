Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEC4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzhTX9e5Ndxofs9PWPQjKMiyjzcJ935BwY08z5T956o=; b=eLSK+mc1jfMJdgbGH+rouTWdRU
	8g7Dc7jyrSc4o10aXS1YRGdyC+IEN6rOCi23KSQVAsTc05jJplbRderzGYInXlHMwUDcniCzmJDkF
	P2cZWqiSy21UUYK48+3akZSt+qCrCrYdBfKhmrIzgYB+4Wff708qMVjdtZoSr0WxFpCeinyndLJi7
	elvMlckdVh+YiwRIaapjU9BwXY1/SejObo2HYoazYEwQXP/WX1Pc1ez5k/FY0pdt0+FZSnK4rKzTp
	Jk4+ZBRm76bKSHaZpTwH+UT4ES8gIKlltosDtBIRn7Me/GY0yBFlRBproVUsrbFSUG/EACAfQdcFr
	hN4PWrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jXD-0000000CFpW-1faB;
	Fri, 04 Apr 2025 16:04:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSf-0000000CF3f-2SGt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Apr 2025 16:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bzhTX9e5Ndxofs9PWPQjKMiyjzcJ935BwY08z5T956o=; b=FXBcvlGeZ+C24swIZknr5xL0p8
	XJhae2JBOiSnCkqw22sW73oMle0AScGnnrrjrgRcsQsZKQse1RoOVdLIAp+dv1eKSBknP+k57ZXTz
	oWUMRnld+BtYXoPg9UHMvLAZzjw0c1r0zO6b6YuvPysev0lfnzXdLFdhNKt0M0ZRh4D85BOqRtvFd
	tK/plvL5cesPT7WqFT+JxUKBNBmTGj3rplsy2rhhCN5gtGHW7sANGWiNY+prH/0XWDK8ACkkP8KYO
	0V/99vErEol0YusGdeIvCekK7OkuLDr72beS/ATKgCtccaGDE3fu936DgqYjnSi8OA0ZPVlXsvrGH
	9UT0Bu0g==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSc-00000007QP0-0VvU;
	Fri, 04 Apr 2025 16:00:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERSE-2u5h;
	Fri, 04 Apr 2025 16:59:59 +0100
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
Subject: [RFC PATCH v2 2/7] mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
Date: Fri,  4 Apr 2025 16:59:54 +0100
Message-ID: <20250404155959.3442111-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404155959.3442111-1-dwmw2@infradead.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
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
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/asm-generic/memory_model.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a3b5029aebbd..044536da3390 100644
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
+	for (pfn = max_t(unsigned long, start_pfn, ARCH_PFN_OFFSET);	\
+	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
+			 pfn++)
+#endif /* for_each_valid_pfn */
+#endif /* valid_pfn */
 
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 
-- 
2.49.0


