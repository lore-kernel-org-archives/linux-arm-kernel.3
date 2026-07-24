Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24BEC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgLR94cnov6/P8Yl4U/7T81H0kr3VMn5Pq5dQ8bzHh8=; b=diET9TXlHGxl1nmKkKiOgBNqoU
	ojTauUxVJrqBr9H0M5rqTV+ERLdm+gwF7e7X2kd072y9Nj7BOCQ6Npfd/7S4MPcp6kOkT6WWDPL7k
	c2vv16bs8w7r6ru1h8AimFAJgpi9NWUZ7qm/6NecZDWo4E7d4DAL1MxLnDeiKAI1S4+xGLIkGL7l8
	w0sXFr9tlbWYK+e4R6m8evC87uA4O/SWd83vf2oxRkT8uRu7PA617RKAmoiTvPFeRBX1gdTaZQMMn
	NXlO8TVxZNfAVSrE03aFHJhcWdXAaKheVMJ/GE0KG1HAZQuOb9iEGl6zM1yKaTxNWNYfyNnEF0rQF
	O2o4dWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHtT-0000000GipQ-0mgV;
	Fri, 24 Jul 2026 15:32:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHtN-0000000Gine-3kiw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MgLR94cnov6/P8Yl4U/7T81H0kr3VMn5Pq5dQ8bzHh8=; b=eBXG7P28LjWWh47//+K6ZR2Q6r
	EIxNd0FyoVb+lhxqg4aaLaZ6EaSMRLEhyBbiCKZroqJwBDc6/M13YKe6N9vko0QwZi9a4vAl4G5KE
	AhHpB+DHqE+CmjYqBL+CsARdCZZZHaBb3oSWvjjzZvE5KI6TLO+i5+0HUWk2gVsFCcJUU6P5PDiWt
	+tNJk5pNDKvQmQBJr/sgmQmrOvjzy9TnVUYzt9w/hN6zzWryDqK7xc6uruP21ZvtKvmQc0W/jB4w2
	n7TkamyZWxCkwGuQv92+KBnJv0pc5Xv5wwYGBw2S5voQvYyuGbbtwfPsAyDw4Mod6+/JcFMK+csIQ
	/8zBKE8w==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnHtJ-00000002iEi-2ZZG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:32:52 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 401727BA2C;
	Fri, 24 Jul 2026 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784907168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgLR94cnov6/P8Yl4U/7T81H0kr3VMn5Pq5dQ8bzHh8=;
	b=2LOVYft95wMJIyhJa6PZSbwOiNmbFFPbcqUTuJ8eG3N/5dEfFfS1xnrE15U2j40DHgjDmq
	6SVMdKicnUTzPnTNepl6LS43ziFb719IQZ/YpmgYwEQMWN5wsTERRtQjRxILqRY7bav/0w
	AiPtTwFDpTdCdCi2BNy9lyN9DKbBWuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784907168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgLR94cnov6/P8Yl4U/7T81H0kr3VMn5Pq5dQ8bzHh8=;
	b=ngn5ZFPemuxkfH460JBtHk6gBgwLnC/4m+F/Wm5dLwshckWwMM8hRMhkcYUYLvLbPxDwRh
	a99cvpioZ+OPOGDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784907168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgLR94cnov6/P8Yl4U/7T81H0kr3VMn5Pq5dQ8bzHh8=;
	b=2LOVYft95wMJIyhJa6PZSbwOiNmbFFPbcqUTuJ8eG3N/5dEfFfS1xnrE15U2j40DHgjDmq
	6SVMdKicnUTzPnTNepl6LS43ziFb719IQZ/YpmgYwEQMWN5wsTERRtQjRxILqRY7bav/0w
	AiPtTwFDpTdCdCi2BNy9lyN9DKbBWuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784907168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgLR94cnov6/P8Yl4U/7T81H0kr3VMn5Pq5dQ8bzHh8=;
	b=ngn5ZFPemuxkfH460JBtHk6gBgwLnC/4m+F/Wm5dLwshckWwMM8hRMhkcYUYLvLbPxDwRh
	a99cvpioZ+OPOGDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C990E779BA;
	Fri, 24 Jul 2026 15:32:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KCyrLZ2FY2ozGgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 24 Jul 2026 15:32:45 +0000
Date: Fri, 24 Jul 2026 16:32:43 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Usama Arif <usama.arif@linux.dev>
Cc: Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/5] mm/parisc: constify ptep_get() argument
Message-ID: <amOEUZlp1BxYh6_t@pedro-suse>
References: <20260724102017.141532-1-pfalcato@suse.de>
 <20260724102017.141532-4-pfalcato@suse.de>
 <0fd713a8-e4ab-4c07-b36e-79dd138b4a86@linux.dev>
 <amNzLXuwflIZFKtI@casper.infradead.org>
 <253f7ac0-205b-42f1-9fb5-d19eceb581b6@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <253f7ac0-205b-42f1-9fb5-d19eceb581b6@linux.dev>
X-Spamd-Result: default: False [-6.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	R_RATELIMIT(0.00)[to_ip_from(RLxu57a9hfgn7tttf5jiwuqe5o)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,linux-foundation.org,kernel.org,arm.com,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,google.com,suse.com,suse.cz,nvidia.com,linux.alibaba.com,redhat.com,linux.dev,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,kvack.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_163249_829473_36B8BFBC 
X-CRM114-Status: GOOD (  21.99  )
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

On Fri, Jul 24, 2026 at 04:03:44PM +0100, Usama Arif wrote:
> 
> 
> On 24/07/2026 15:14, Matthew Wilcox wrote:
> > On Fri, Jul 24, 2026 at 02:36:59PM +0100, Usama Arif wrote:
> >>
> >>
> >> On 24/07/2026 11:20, Pedro Falcato wrote:
> >>> ptep_get() does not need write access to the PTE.
> >>>
> >>> Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> >>> ---
> >>>  arch/parisc/include/asm/pgtable.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >> hmm I think you might break build bisectibility if
> >> you separate out the patches, you should squash patch 3 and 4,
> >> with patch 1.
> > 
> > I don't see how this breaks bisectability.  Can you elaborate on what
> > you think would break?
> 
> Patch 1 does:
> 
> -static inline pte_t ptep_get_lockless(pte_t *ptep)
> +static inline pte_t ptep_get_lockless(const pte_t *ptep)
>  {
>  	return ptep_get(ptep);
>  }
> 
> 
> ptep_get() takes a non-const arg till patch 3 for example for parsic.
> I don't think you can pass a const variable to non const function arg?
> 
> So parsic won't compile in patch 1 and 2, powerprc wont compile
> for patches 1, 2 and 3..

Aha, yes, nice catch! I'll have to rethink that. Maybe squashing the patches
would be the cleanest way forward.

FWIW, the vast majority of architectures aren't doing funny things on
ptep_get(). E.g PA-RISC, loongarch only define these so they can use it in
their own asm/pgtable.h. I'd really like to delete these but I can't tell
if they are *actually* required.

With those gone only PPC 8xx and generic would need to be squashed (arm64 also
defines its own version of ptep_get_lockless()).


-- 
Pedro

