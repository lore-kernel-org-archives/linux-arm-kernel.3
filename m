Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FABC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbqCUn6gz37WzeN1KZjuSX3PD2UQTnr+fmi1Atuk78g=; b=lW3R+8FHaJuZo03NFvMUbrKqmN
	UImpfKQLWIASb8cR6eWqpTDYmz0sbbfVJrIXAhtgqueVMqzRZ3aREUDWby0BELPATUkA3d0qwVdtc
	jnV8QweJJpVOXvon2IKF/M7RBdNV25L5nokL1bK7RFX+HTz7QAuCH1M28kFVCQOXy4x2IAKSHZ8Zr
	Iku6rocowAIcqwv1ucun9Go34axXkm5Cif8/Rz2aMq2x6aE7R8Fd+NK587Hbv6Di4at5Co/6sdDdM
	OLzXlTCbb3UPYIDkMzykcDhKQ07fr3vBCkpGP4vSf74VN2/B/m04U5D+JtutCmefI518dvnXtxZ2C
	XYQQLk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jfm-0000000CGv0-0YxV;
	Fri, 04 Apr 2025 16:13:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jUI-0000000CFOs-25oB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Apr 2025 16:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MbqCUn6gz37WzeN1KZjuSX3PD2UQTnr+fmi1Atuk78g=; b=RWsr+E1eF3WBGQC6oJ449g9gwA
	SsSn8lnsUC2YHgCc1DkPkPKUDY6p05kQ+DQHTMZxOHadeL32SbwkTwJzKhfQt/wfDVlQW8LT7jUZt
	VX02qdQbHulXzvoBi+9rj6QYyJI/ylZjTYb8TVl1afWmLJP+zM5u8vNCNCebmdlJ2y8SBe/ZXyXt/
	JJSQzpsnNFWFUa2iVi2mxTLgNYe1QyHZhX8Ij0hjPdB6nmog4HCDepVSKqkH+UqV5YSpcns6K4gS4
	9UCNGOU2P1ees86sHyldV/kbLqCzOHfVVIER2EGdjXCQetTdlO1ArY++q7RNBABd1DojRtj+sALb7
	Zq45ERmg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSa-0000000GFHx-39D6;
	Fri, 04 Apr 2025 16:01:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERSH-3DUK;
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
Subject: [RFC PATCH v2 3/7] mm: Implement for_each_valid_pfn() for CONFIG_SPARSEMEM
Date: Fri,  4 Apr 2025 16:59:55 +0100
Message-ID: <20250404155959.3442111-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404155959.3442111-1-dwmw2@infradead.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

Introduce a pfn_first_valid() helper which takes a pointer to the PFN and
updates it to point to the first valid PFN starting from that point, and
returns true if a valid PFN was found.

This largely mirrors pfn_valid(), calling into a pfn_section_first_valid()
helper which is trivial for the !CONFIG_SPARSEMEM_VMEMMAP case, and in
the VMEMMAP case will skip to the next subsection as needed.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/mmzone.h | 59 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 32ecb5cadbaf..67cdf675a4b9 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2074,11 +2074,37 @@ static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
 
 	return usage ? test_bit(idx, usage->subsection_map) : 0;
 }
+
+static inline bool pfn_section_first_valid(struct mem_section *ms, unsigned long *pfn)
+{
+	struct mem_section_usage *usage = READ_ONCE(ms->usage);
+	int idx = subsection_map_index(*pfn);
+	unsigned long bit;
+
+	if (!usage)
+		return false;
+
+	if (test_bit(idx, usage->subsection_map))
+		return true;
+
+	/* Find the next subsection that exists */
+	bit = find_next_bit(usage->subsection_map, SUBSECTIONS_PER_SECTION, idx);
+	if (bit == SUBSECTIONS_PER_SECTION)
+		return false;
+
+	*pfn = (*pfn & PAGE_SECTION_MASK) + (bit * PAGES_PER_SUBSECTION);
+	return true;
+}
 #else
 static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
 {
 	return 1;
 }
+
+static inline bool pfn_section_first_valid(struct mem_section *ms, unsigned long *pfn)
+{
+	return true;
+}
 #endif
 
 void sparse_init_early_section(int nid, struct page *map, unsigned long pnum,
@@ -2127,6 +2153,39 @@ static inline int pfn_valid(unsigned long pfn)
 
 	return ret;
 }
+
+static inline bool first_valid_pfn(unsigned long *p_pfn)
+{
+	unsigned long pfn = *p_pfn;
+	unsigned long nr = pfn_to_section_nr(pfn);
+
+	rcu_read_lock_sched();
+
+	while (nr <= __highest_present_section_nr) {
+		struct mem_section *ms = __pfn_to_section(pfn);
+
+		if (valid_section(ms) &&
+		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
+			*p_pfn = pfn;
+			rcu_read_unlock_sched();
+			return true;
+		}
+
+		/* Nothing left in this section? Skip to next section */
+		nr++;
+		pfn = section_nr_to_pfn(nr);
+	}
+
+	rcu_read_unlock_sched();
+
+	return false;
+}
+
+#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)	       \
+	for ((_pfn) = (_start_pfn);			       \
+	     first_valid_pfn(&(_pfn)) && (_pfn) < (_end_pfn);  \
+	     (_pfn)++)
+
 #endif
 
 static inline int pfn_in_present_section(unsigned long pfn)
-- 
2.49.0


