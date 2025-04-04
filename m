Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6170C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAQbWjWGGmEWV/yrGcgLnMo50LiJ5Xc9HvWor5bjKpE=; b=Va5llWxPRQ9JY2xfO6kAe9XNGy
	1J0LNjzS0V/4/+UC96fQmZcxZotClGwpYtubL0IL/EGfO3BzKr+nZka6z0cfIRJoZ71zlZD07MIJX
	IFpw9vLeRBzxNHJiDtEfzvIVrc/SMjvqrwn1LAsUWK39nHT6XI1KuOPnVhPDEyeu+9UvosEHmdqz9
	XK2itxzvX0pOeuQ+GX8Ofxwkp/fV9LQN/uU7IfJWyTQMaAhxoEhAZHpeFtVGpNq1qHbcS2nU8hGfR
	ugZR/YSVlj/O3QzBE7/JKPUTpmHqLmn953j9nUJTjw0Pipc4two1lQCsWd8RLO6XsC0PqLj9LrlZa
	F37rTLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jYv-0000000CG3S-0flT;
	Fri, 04 Apr 2025 16:06:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSf-0000000CF3c-2SX7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Apr 2025 16:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SAQbWjWGGmEWV/yrGcgLnMo50LiJ5Xc9HvWor5bjKpE=; b=d7l3I/9/QLogRFJbAFJpwKuy6H
	B0t3Z7Upm6Db3cxysxtEATptTKPyFIjrvR1IiTqa6fj8zd+dQ8qw/mYXmi9eramZYOT01xjsBr9gv
	g3S8NHQZZWom5Th4kzq6dixygw3CD0iPWHeYGA+zJcTe5SD91Taidj9jqPX5gJFJP4ueN+seQocDD
	jPgCHdxWYs/rmNqy4h+MUxbebrc9j5fMAou3iLqAwi6nhlq91/43pUrP3Nh2E91NbF/NfMzh1yd1o
	cmGSfeUGIxkQ2VCvR8WSn2FWLQC/FlgQVqNRFhNpjyGM/f89o/R33M7cx3j005R7UGgMZUqNNonCz
	5OSe/p9g==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSc-00000007QOz-0XcV;
	Fri, 04 Apr 2025 16:00:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERSQ-40aW;
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
Subject: [RFC PATCH v2 6/7] mm, x86: Use for_each_valid_pfn() from __ioremap_check_ram()
Date: Fri,  4 Apr 2025 16:59:58 +0100
Message-ID: <20250404155959.3442111-6-dwmw2@infradead.org>
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

Instead of calling pfn_valid() separately for every single PFN in the
range, use for_each_valid_pfn() and only look at the ones which are.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/mm/ioremap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 331e101bf801..12c8180ca1ba 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -71,7 +71,7 @@ int ioremap_change_attr(unsigned long vaddr, unsigned long size,
 static unsigned int __ioremap_check_ram(struct resource *res)
 {
 	unsigned long start_pfn, stop_pfn;
-	unsigned long i;
+	unsigned long pfn;
 
 	if ((res->flags & IORESOURCE_SYSTEM_RAM) != IORESOURCE_SYSTEM_RAM)
 		return 0;
@@ -79,9 +79,8 @@ static unsigned int __ioremap_check_ram(struct resource *res)
 	start_pfn = (res->start + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	stop_pfn = (res->end + 1) >> PAGE_SHIFT;
 	if (stop_pfn > start_pfn) {
-		for (i = 0; i < (stop_pfn - start_pfn); ++i)
-			if (pfn_valid(start_pfn + i) &&
-			    !PageReserved(pfn_to_page(start_pfn + i)))
+		for_each_valid_pfn(pfn, start_pfn, stop_pfn)
+			if (!PageReserved(pfn_to_page(pfn)))
 				return IORES_MAP_SYSTEM_RAM;
 	}
 
-- 
2.49.0


