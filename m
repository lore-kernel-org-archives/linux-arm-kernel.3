Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DC6C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDpfwfDj8mWUuSG1LdS+ozLLdWjJmIOisHydIRxuvwI=; b=4Q16LMqMWYC+G6kOHRAi1ydZ7x
	5ADvxpCtQwgaFldhPh7GlvBjXeCxUJWQ4SINknb99EjsPDRr4LpeFiNllyHWKuqk2z/4eL3tynO1w
	XcDoLySSaUeFdsdQp+PkBX3F0/yKVfNuow9QQ/y2N82fVxcClGg3zOnod5iiPJzmUlpuiNCH9GAPb
	reL2eMfOVCu9+0MnvfrfnZ9DrgYkCxL8hTGT33IEqcaDKx+6JsEC6LTWhSA0nI8WgXZKhY2c2+ApW
	D2WfSmnQSGNV405r6bC/DeDXN3VVUpX6e9EV5IFiIH4bAfyNPXpUy8gkNuiK1oRm/c57iqlHL7ocv
	0QdXJk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEb5-0000000CS6f-0mQn;
	Tue, 05 Aug 2025 10:08:43 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujELg-0000000CQBe-48TW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 09:52:50 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 00B87211A3;
	Tue,  5 Aug 2025 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1754387566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDpfwfDj8mWUuSG1LdS+ozLLdWjJmIOisHydIRxuvwI=;
	b=MbzDK56WATBzpYvm36PNRjnPakyEpA0LxY05vXUpaJh9MMuMEMri4LNxqixWXpZE0ujwi2
	L+GUGKQmmq3DdmYrQpdZknuq0a52XYiGsEWfKKMuTvrp4/SSXHFbSTNHI1MRqoWx7xx6IB
	QSBtK4dDay15AfV7AmP8sn0DPxz98k8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1754387566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDpfwfDj8mWUuSG1LdS+ozLLdWjJmIOisHydIRxuvwI=;
	b=DhVywzYJxBPrz+KzmpiM4/Q2zxvwVcCLxQF6f+fvfGe2r69RE6DlgZiHiEs1FXmPkvD5tA
	jHuaVAUJKfDbmjCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1754387566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDpfwfDj8mWUuSG1LdS+ozLLdWjJmIOisHydIRxuvwI=;
	b=MbzDK56WATBzpYvm36PNRjnPakyEpA0LxY05vXUpaJh9MMuMEMri4LNxqixWXpZE0ujwi2
	L+GUGKQmmq3DdmYrQpdZknuq0a52XYiGsEWfKKMuTvrp4/SSXHFbSTNHI1MRqoWx7xx6IB
	QSBtK4dDay15AfV7AmP8sn0DPxz98k8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1754387566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDpfwfDj8mWUuSG1LdS+ozLLdWjJmIOisHydIRxuvwI=;
	b=DhVywzYJxBPrz+KzmpiM4/Q2zxvwVcCLxQF6f+fvfGe2r69RE6DlgZiHiEs1FXmPkvD5tA
	jHuaVAUJKfDbmjCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEFC013A55;
	Tue,  5 Aug 2025 09:52:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LolANm3UkWi+VAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 05 Aug 2025 09:52:45 +0000
Message-ID: <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
Date: Tue, 5 Aug 2025 11:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: Juan Yescas <jyescas@google.com>, David Hildenbrand <david@redhat.com>
Cc: akash.tyagi@mediatek.com, Andrew Morton <akpm@linux-foundation.org>,
 angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org,
 Brendan Jackman <jackmanb@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com,
 Michal Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>,
 wsd_upstream@mediatek.com, Zi Yan <ziy@nvidia.com>,
 Kalesh Singh <kaleshsingh@google.com>, "T.J. Mercier"
 <tjmercier@google.com>, Isaac Manjarres <isaacmanjarres@google.com>
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
 <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[mediatek.com,linux-foundation.org,collabora.com,cmpxchg.org,google.com,lists.infradead.org,vger.kernel.org,kvack.org,gmail.com,suse.com,nvidia.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_025249_181336_98A9D7CF 
X-CRM114-Status: GOOD (  31.40  )
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

On 8/5/25 3:22 AM, Juan Yescas wrote:
> On Mon, Aug 4, 2025 at 11:50 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 04.08.25 20:20, Juan Yescas wrote:
>>> Hi David/Zi,
>>>
>>> Is there any reason why the MIGRATE_CMA pages are not in the PCP lists?
>>>
>>> There are many devices that need fast allocation of MIGRATE_CMA pages,
>>> and they have to get them from the buddy allocator, which is a bit
>>> slower in comparison to the PCP lists.
>>>
>>> We also have cases where the MIGRATE_CMA memory requirements are big.
>>> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 500MiBs.
>>> These cases would benefit if we have THPs for CMAs.
>>>
>>> Could we add the support for MIGRATE_CMA pages on the PCP and THP lists?
>>
>> Remember how CMA memory is used:
>>
>> The owner allocates it through cma_alloc() and friends, where the CMA
>> allocator will try allocating *specific physical memory regions* using
>> alloc_contig_range(). It doesn't just go ahead and pick a random CMA
>> page from the buddy (or PCP) lists. Doesn't work (just imagine having
>> different CMA areas etc).
>>
>> Anybody else is free to use CMA pages for MOVABLE allocations. So we
>> treat them as being MOVABLE on the PCP.
>>
>> Having a separate CMA PCP list doesn't solve or speedup anything, really.
>>
> 
> Thanks David for the quick overview.
> 
>> I still have no clue what this patch here tried to solve: it doesn't
>> make any sense.
>>
> 
> The story started with this out of tree patch that is part of Android.
> 
> https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeaurora.org/T/#u
> 
> This patch introduced the __GFP_CMA flag that allocates pages from
> MIGRATE_MOVABLE
> or MIGRATE_CMA.

What kinds of allocations would then use __GFP_CMA? (let me try guess
one - zswap backend?)

> What it happens then, it is that the MIGRATE_MOVABLE
> pages in the
> PCP lists were consumed pretty fast. To solve this issue, the PCP
> MIGRATE_CMA list was added.
> This list is initialized by rmqueue_bulk() when it is empty. That's
> how we end up with the PCP MIGRATE_CMA list
> in Android. In addition to this, the THP list for MIGRATE_MOVABLE was
> allowed to contain
> MIGRATE_CMA pages. This is causing THP MIGRATE_CMA pages to be used
> for THP MIGRATE_MOVABLE
> making later allocations from THP MIGRATE_CMA to fail.

If you don't want THP's to use the large (THP-sized) MIGRATE_CMA pages,
what kind of such large allocations would be ok to use MIGRATE_CMA then?
> These workarounds are mainly because we need to solve this issue upstream:
> 
> - When devices reserve big blocks of MIGRATE_CMA pages, the
> underutilized MIGRATE_CMA
> can fall back to MIGRATE_MOVABLE and these pages can be pinned, so if
> we require MIGRATE_CMA
> pages, the allocations might fail.
> 
> I remember that you presented the problem in LPC. Were you able to
> make some progress on that?
> 
> Thanks
> Juan
> 
> 
> 
> 
> 
>> --
>> Cheers,
>>
>> David / dhildenb
>>


