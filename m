Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CB6C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFHIi52G0DLGh2jlHFvMQOsriC8Uz3afVC7wSChQQrE=; b=JwUrZGXSV4X8rnNL6RBm5EXZMl
	fijhugQnczxAsjTUzvCdYXYQzTkY6YQhY5fZgs19u1AKQNArWymUxn0XmW7ahxrhnRylPQrk7BP8i
	3lDUq5BDP5pY3X9+Hs/OY9lSlKan+xvMdi1uQRiV8SkOJ36/X1+Mc1hoAb5W8ELaAIKdy5xAAX1Td
	euykKHjzXliFXSPGURGQ4z+fQovLVPT/e/7QxMSEZHfn5gkqZzWgqHLAsg2lnAPKt0wfOb4tp0+/x
	ztRTnjAyfBCD+Ygc/eCj3OM07zsuGs/5i/BJt8qb7pN9k8WzzftLpvm3NEpEr3HmoLy1RQVgTx8I/
	zrmoCoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraun-00000003w0a-2RhQ;
	Wed, 05 Aug 2026 12:40:09 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraul-00000003w0F-3LKu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:40:09 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C7D8F3E26;
	Wed,  5 Aug 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBBE8779C3;
	Wed,  5 Aug 2026 12:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5Z90LiMvc2owfAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 05 Aug 2026 12:40:03 +0000
Date: Wed, 5 Aug 2026 13:40:02 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] mm: add basic PTE const type-safety
Message-ID: <anMrnsN1xf_Psn3w@pedro-suse.lan>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <a5afofuxhzwkeb76jdheottyxt4mms3arg2iucunztczbmd3lf@wiqp7yccjzlt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5afofuxhzwkeb76jdheottyxt4mms3arg2iucunztczbmd3lf@wiqp7yccjzlt>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: C7D8F3E26
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_054007_986409_668B4E76 
X-CRM114-Status: GOOD (  20.48  )
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

On Wed, Aug 05, 2026 at 04:12:21PM +0530, Anshuman Khandual wrote:
> On Mon, Aug 03, 2026 at 05:43:54PM +0100, Pedro Falcato wrote:
> > Since forever, MM code has thrown pte_t * around with no concern for const
> > safety, or typesafety of any kind. This is confusing. Attempt to address it
> > by:
> > 1) Making sure pte_get*() helpers can cope with const pte_t * arguments
> > 2) Constifying the pte_offset_map_ro_nolock() return type, which by definition
> > already pledges that users will not write to it.
> > 
> > These two simple steps were already able to uncover code smell from
> > khugepaged + do_swap_page().
> > 
> > Separate steps could include introducing pte_offset_map_ro_lock() for more
> > widespread usage of this.
> > 
> > Benefits of this include less confusion and better type-safety. It could also
> > futurely aid in efforts such as [0] which may want semantic annotation of these
> > accesses.
> > 
> > Based on mm-unstable and compile-tested on a handful of architectures.
> > 
> > No functional changes intended.
> 
> Even though the pte accesses should always be type-safe, this series does
> not really address the problem completely and instead changes things only
> for a small set of pte access sites. So just wondering how much beneficial
> this series really is ?

This series is meant to be a small step in the right direction (while
feeling out what the community thinks, which seems to be receptive). The
obvious next steps would be to introduce some sort of

const pte_t *pte_offset_map_ro_lock(struct mm_struct *mm, pmd_t *pmd,
			   unsigned long addr, spinlock_t **ptlp);

and use it in more places. That will obviously involve a bit of churn.


-- 
Pedro

