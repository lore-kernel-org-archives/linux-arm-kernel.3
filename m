Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B812C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pm0s+AsqOaCIBBUGjt0XXuWc3EEq4aufaW3cPaeVBkw=; b=D+e7vd4Qt5mu2P4GHSFjdfC/24
	gQa5Vzc4rigpZpb0iGn/MTPUPcjkDomMHmA3QfMZxA4tHZCDwy4DJ4aWpM+zsZ98yzx+r3Zv/AVKV
	ZGnHQ6UQcvmsNBupxcjIm7jBp4H55qPUplbR9eV35k6F5jm0uKBkytdi6yQeaeR0qAGRPTssO+207
	7NPnhSCME+e6qOOrOUoMbPjAVBIGZGaMev6x8X3qvtzWcgujLgVZWBg3W0tH/eWZpHABfmrdKEpvp
	6bqChhjCsSDcDz4lWhaz1JMXysqUs+7hjKW1x539ydNt14rsK49O59Ac2jQQVbzn5q34e1IciZak+
	7sR0QrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvmD-000000007Zr-3y6L;
	Mon, 03 Aug 2026 16:44:33 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvm9-000000007VJ-3BJV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:44:32 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E0E447F296;
	Mon,  3 Aug 2026 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785775452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pm0s+AsqOaCIBBUGjt0XXuWc3EEq4aufaW3cPaeVBkw=;
	b=LyPDW6G9DO9kGmtasy6JzDsxEZSL+/ubBLbvz3Y8qNNkybob446hHJmU+SzJwLthf2oydx
	F7WEPpZDlevxLl+BgjFpMJ2Skz4ogA7PB7lEhnXrJB6sVVypbi3MEvYm+PEZo5rszLXVUh
	8NrThPoWbZPX14llmWnWNWwnh/lpHFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785775452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pm0s+AsqOaCIBBUGjt0XXuWc3EEq4aufaW3cPaeVBkw=;
	b=0pPxGq3jdZp1wnB1Eatpgjw+/kRSXRvgCk60qXhpqlasQ3L1d0XooOzJe4VKkci23lTTbX
	P3sTk++1EdyOpZCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785775447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pm0s+AsqOaCIBBUGjt0XXuWc3EEq4aufaW3cPaeVBkw=;
	b=ZqZzv3B+eA7ZRC75dOzE0mwwaEXh8rvPayEdnndeVFAbgeqcDixEL/KXDedR0CnJaSiPAR
	Fv4RGs44Tkfq2aOSBwWqvxpphvDOPO7wh0RX2XKhep4EoEDVgyUjkeA4jV08kSJOLuvZ1e
	Hw4anHYdrF5R7wjzJKfUZkvUTku92Mc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785775447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pm0s+AsqOaCIBBUGjt0XXuWc3EEq4aufaW3cPaeVBkw=;
	b=3c/5ZykzosMf4mcpE1rX0Os1q4KTcbsLa6uY0Vi2qu9zelcgBzB6GL1MDflLsucxbEvdnV
	eMcfSXv+xhYMVJBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F35D0779A1;
	Mon,  3 Aug 2026 16:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YvRMOFXFcGp/SQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 03 Aug 2026 16:44:05 +0000
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
Subject: [PATCH v2 0/6] mm: add basic PTE const type-safety
Date: Mon,  3 Aug 2026 17:43:54 +0100
Message-ID: <20260803164400.531199-1-pfalcato@suse.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[suse.de,arm.com,kernel.org,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,infradead.org,google.com,suse.com,suse.cz,nvidia.com,linux.alibaba.com,redhat.com,linux.dev,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,kvack.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	URIBL_BLOCKED(0.00)[arm.com:email,kvack.org:email,suse.cz:email,gmx.de:email,ozlabs.org:email,nvidia.com:email,infradead.org:email,alibaba.com:email,suse.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,linux.dev:email,ellerman.id.au:email,hansenpartnership.com:email];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,hansenpartnership.com:email,gmx.de:email,suse.com:email,kvack.org:email,arm.com:email,imap1.dmz-prg2.suse.org:helo,ellerman.id.au:email,nvidia.com:email,suse.de:mid,infradead.org:email,alibaba.com:email,ozlabs.org:email];
	R_RATELIMIT(0.00)[to_ip_from(RLxu57a9hfgn7tttf5jiwuqe5o)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_094429_968593_7CA49982 
X-CRM114-Status: GOOD (  13.14  )
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

Since forever, MM code has thrown pte_t * around with no concern for const
safety, or typesafety of any kind. This is confusing. Attempt to address it
by:
1) Making sure pte_get*() helpers can cope with const pte_t * arguments
2) Constifying the pte_offset_map_ro_nolock() return type, which by definition
already pledges that users will not write to it.

These two simple steps were already able to uncover code smell from
khugepaged + do_swap_page().

Separate steps could include introducing pte_offset_map_ro_lock() for more
widespread usage of this.

Benefits of this include less confusion and better type-safety. It could also
futurely aid in efforts such as [0] which may want semantic annotation of these
accesses.

Based on mm-unstable and compile-tested on a handful of architectures.

No functional changes intended.

[CC list editorially trimmed for brevity reasons; apologies if you're not on it]

Link: https://lore.kernel.org/linux-mm/20260526-kpkeys-v8-0-eaaacdacc67c@arm.com/#t [0]
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: Usama Arif <usama.arif@linux.dev>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org

v2:
 - Small fixups on the arm64 side
 - Re-order patches in a way such that bisection is preserved
 - Pick up Helge's patch dropping parisc ptep_get()
 - Constify s390's ptep_get() as well

Helge Deller (1):
  parisc: Drop own implementations for ptep_get() and
    ptep_test_and_clear_young()

Pedro Falcato (5):
  mm/arm64: constify pte_get*() and contpte get logic
  mm/powerpc/8xx: constify ptep_get() argument
  mm/s390: constify ptep_get() argument
  mm: constify generic pte_get*()
  mm: constify the pte_offset_map_ro_nolock() return value

 arch/arm64/include/asm/pgtable.h             | 10 +++++-----
 arch/arm64/mm/contpte.c                      | 11 ++++++++---
 arch/parisc/include/asm/pgtable.h            | 20 --------------------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  2 +-
 arch/powerpc/mm/pgtable.c                    |  2 +-
 arch/s390/include/asm/pgtable.h              |  2 +-
 include/linux/mm.h                           |  4 ++--
 include/linux/pgtable.h                      |  8 ++++----
 mm/filemap.c                                 |  2 +-
 mm/khugepaged.c                              |  2 +-
 mm/pgtable-generic.c                         |  4 ++--
 11 files changed, 26 insertions(+), 41 deletions(-)

-- 
2.55.0


