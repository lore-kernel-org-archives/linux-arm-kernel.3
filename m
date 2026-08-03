Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4B6C55838
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygAzH+FQgLJrgBdhFAHfKQ03vfYuxl+i8XyjFfW9SDo=; b=kS6ras4cOzIS8x0oLt87MztZI4
	FIydgFP9ovH0oi1JB+ywM2GOAasntaPKkR2hGdjR8iX+KIrlLyQpHWgh52kwMmX0eKZ0H/Kh2p2En
	ZMr1OET1DzvYSWf1KuKMW+t9NmNn2vUC3bbWgWad2ORNkTXIlPxH+n/rtFzS0tkU3uOmuPfDomaEx
	Y+2fsbVIqnmUNiTJPHTDRrStj1TOiKT54YSohG0j5xltixzRp3zZI0xHM0jHj35WMlrvHHJ1t7Pzl
	TdeekCzkwRX82HgeUC0hkQ905D4fXSX0suMGII087Sb8tjjhlkPhn618r5hux4xqIeHeoIh9fMISC
	teTdCBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvm5-000000007Su-1zjF;
	Mon, 03 Aug 2026 16:44:25 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvm2-000000007QZ-21o3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:44:23 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2D5F3FB9;
	Mon,  3 Aug 2026 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785775454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygAzH+FQgLJrgBdhFAHfKQ03vfYuxl+i8XyjFfW9SDo=;
	b=fVaZOjiw4tGe5jF9DxPqF1IHf3xZVUT8j+7Jh/SXq8L7ymBs6PTJLAnL4+tv7s0yaEZ+NH
	YSugHilLxwkrEvdmR76hUCZ1NvxUUDyj3r6uNtGNFcaDvcdY+X1LSlHXhgFiHuMS3qevEP
	p2EppnDRsBeL569Y9Bd6fHytSS8/1Xg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785775454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygAzH+FQgLJrgBdhFAHfKQ03vfYuxl+i8XyjFfW9SDo=;
	b=QGD/Qwf3pojJ4A/NOwOvvQ2GmpGoO8Os2O5gMourjcbIPZJUW08FkNErONVX2eVVZ4UWmC
	i2YHuREacuyUCkBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785775449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygAzH+FQgLJrgBdhFAHfKQ03vfYuxl+i8XyjFfW9SDo=;
	b=eRAF//7c2hrRZi6Hqw/71YZVfpFa30gEZRxzsYvfPwSj4Nq9HeINTwlhjKCxi2K27cgHvW
	ppE9niHbkpGCZ9sgEQ/CnlNX5zfyfcuzHk+qf2kzjERVfz+I1J3NfV5VksDRE0lOtGgeVi
	kcrn3D6lMVLWc2CX8aQS/X79BbUCxaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785775449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygAzH+FQgLJrgBdhFAHfKQ03vfYuxl+i8XyjFfW9SDo=;
	b=WidZld5pCyaSuY5KrUcuhomuCxHdCu/rO89ht0SZwK06aFUx2fkO7daLaHjvmADVX/aVr7
	PQnrLsfuzhh7Y4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03E7A779C1;
	Mon,  3 Aug 2026 16:44:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sGJtOVfFcGp/SQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 03 Aug 2026 16:44:07 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 1/6] mm/arm64: constify pte_get*() and contpte get logic
Date: Mon,  3 Aug 2026 17:43:55 +0100
Message-ID: <20260803164400.531199-2-pfalcato@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803164400.531199-1-pfalcato@suse.de>
References: <20260803164400.531199-1-pfalcato@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_CC(0.00)[suse.de,arm.com,kernel.org,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,infradead.org,google.com,suse.com,suse.cz,nvidia.com,linux.alibaba.com,redhat.com,linux.dev,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,kvack.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLxu57a9hfgn7tttf5jiwuqe5o)];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_094422_839932_BD8CBFFB 
X-CRM114-Status: GOOD (  13.66  )
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

None of the contpte code needs write access to the PTEs.

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 arch/arm64/include/asm/pgtable.h | 10 +++++-----
 arch/arm64/mm/contpte.c          | 11 ++++++++---
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a2681d755358..043bc0649cee 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -378,7 +378,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 	__set_pte_complete(pte);
 }
 
-static inline pte_t __ptep_get(pte_t *ptep)
+static inline pte_t __ptep_get(const pte_t *ptep)
 {
 	return READ_ONCE(*ptep);
 }
@@ -1652,8 +1652,8 @@ extern void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte);
 extern void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte);
-extern pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
-extern pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
+extern pte_t contpte_ptep_get(const pte_t *ptep, pte_t orig_pte);
+extern pte_t contpte_ptep_get_lockless(const pte_t *orig_ptep);
 extern void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte, unsigned int nr);
 extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
@@ -1732,7 +1732,7 @@ static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
  */
 
 #define ptep_get ptep_get
-static inline pte_t ptep_get(pte_t *ptep)
+static inline pte_t ptep_get(const pte_t *ptep)
 {
 	pte_t pte = __ptep_get(ptep);
 
@@ -1743,7 +1743,7 @@ static inline pte_t ptep_get(pte_t *ptep)
 }
 
 #define ptep_get_lockless ptep_get_lockless
-static inline pte_t ptep_get_lockless(pte_t *ptep)
+static inline pte_t ptep_get_lockless(const pte_t *ptep)
 {
 	pte_t pte = __ptep_get(ptep);
 
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 2de12656b4d8..3a5d6937fb51 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -26,6 +26,11 @@ static inline pte_t *contpte_align_down(pte_t *ptep)
 	return PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
 }
 
+#define contpte_align_down(ptep)                                                       \
+	_Generic((ptep),                                                               \
+		 const pte_t *: (const pte_t *) contpte_align_down((pte_t *) (ptep)),  \
+		 pte_t *: contpte_align_down((pte_t *) ptep))
+
 static inline pte_t *contpte_align_addr_ptep(unsigned long *start,
 					     unsigned long *end, pte_t *ptep,
 					     unsigned int nr)
@@ -310,7 +315,7 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 }
 EXPORT_SYMBOL_GPL(__contpte_try_unfold);
 
-pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
+pte_t contpte_ptep_get(const pte_t *ptep, pte_t orig_pte)
 {
 	/*
 	 * Gather access/dirty bits, which may be populated in any of the ptes
@@ -367,7 +372,7 @@ static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
 			pgprot_val(prot) == pgprot_val(orig_prot);
 }
 
-pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
+pte_t contpte_ptep_get_lockless(const pte_t *orig_ptep)
 {
 	/*
 	 * The ptep_get_lockless() API requires us to read and return *orig_ptep
@@ -386,10 +391,10 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 	 * because it is not part of a contpte range.
 	 */
 
+	const pte_t *ptep;
 	pgprot_t orig_prot;
 	unsigned long pfn;
 	pte_t orig_pte;
-	pte_t *ptep;
 	pte_t pte;
 	int i;
 
-- 
2.55.0


