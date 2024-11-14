Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EFED65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDmbYNzWsci4PxZKuq25OJU12sv+lOWhhjNx9ffNUhM=; b=XRvVwE0qPLUHQARnmQGlXHIP1W
	Q8vvzcJfrXIulIcAdWiSVEm+c+l3+6J+uy1HzXk4hRNDs7l/iY4hxi8FHsOYQG2rhEAiPbn0OM8EN
	Pb+D/u/dm4PBcqOlM/xRbOcU+FmiwWDUXhBCbfPa8xAWo22n7I4UmyzjUcfGxXEoxgeRWsCr5yyYs
	b/IxcjthdMxdyuNBjS+RNIgY2BNDdHeQRNDvCN/1A/JFZLeTwXk91dEVeELbH09x4YO7n1dFVXOQK
	xrYeTIL1/RzWYSv7XEswBnZgCua9RHFwbbFxIaTGCra7sJASIrvfZ9Y6UQKi0YaiHw2uJ56Wo5HU+
	Cy5IZMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYGc-00000009lqr-2wqo;
	Thu, 14 Nov 2024 11:44:06 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXIl-00000009aJE-3Bdd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 10:42:19 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8C65B1F79C;
	Thu, 14 Nov 2024 10:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1731580933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDmbYNzWsci4PxZKuq25OJU12sv+lOWhhjNx9ffNUhM=;
	b=o/WWCW0Dt0HI7p5/Q0SshWlz/T1KMjlFcfxyFKl6SsAk/yIozg3tPsphsZur6P+LBaHUbP
	8cnq/t+qdtiKLrKVb0jkwY5m39IyiVXMu4InLOVK1EbBPXgjhIUYxihSXsCIRWXE8Okr8z
	XipZXdyzDCZRfjMsVstwA/SSmyVMdsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1731580933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDmbYNzWsci4PxZKuq25OJU12sv+lOWhhjNx9ffNUhM=;
	b=y398gvQLP8okIqeO5M6xapv7ck/Gun6tgRvK8I03Ls5wvVYhyH+4ZZw6XDsfPoBuPW2dAD
	B6qH4dXdI91ayxAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1731580933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDmbYNzWsci4PxZKuq25OJU12sv+lOWhhjNx9ffNUhM=;
	b=o/WWCW0Dt0HI7p5/Q0SshWlz/T1KMjlFcfxyFKl6SsAk/yIozg3tPsphsZur6P+LBaHUbP
	8cnq/t+qdtiKLrKVb0jkwY5m39IyiVXMu4InLOVK1EbBPXgjhIUYxihSXsCIRWXE8Okr8z
	XipZXdyzDCZRfjMsVstwA/SSmyVMdsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1731580933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDmbYNzWsci4PxZKuq25OJU12sv+lOWhhjNx9ffNUhM=;
	b=y398gvQLP8okIqeO5M6xapv7ck/Gun6tgRvK8I03Ls5wvVYhyH+4ZZw6XDsfPoBuPW2dAD
	B6qH4dXdI91ayxAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5475D13721;
	Thu, 14 Nov 2024 10:42:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8kr9EwXUNWfCJgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 14 Nov 2024 10:42:13 +0000
Message-ID: <80d61508-f714-4d4c-b8e1-b5c0db6adbdd@suse.cz>
Date: Thu, 14 Nov 2024 11:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 11/57] fork: Permit boot-time THREAD_SIZE
 determination
Content-Language: en-US
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Greg Marsden
 <greg.marsden@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 Ivan Ivanov <ivan.ivanov@suse.com>, Juri Lelli <juri.lelli@redhat.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>
Cc: kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com>
 <20241014105912.3207374-11-ryan.roberts@arm.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20241014105912.3207374-11-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[arm.com,linux-foundation.org,gmail.com,kernel.org,arndb.de,redhat.com,oracle.com,suse.com,google.com,suse.cz,infradead.org,linaro.org];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:mid,arm.com:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_024215_996969_E86106F5 
X-CRM114-Status: GOOD (  15.51  )
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

On 10/14/24 12:58, Ryan Roberts wrote:
> THREAD_SIZE defines the size of a kernel thread stack. To date, it has
> been set at compile-time. However, when using vmap stacks, the size must
> be a multiple of PAGE_SIZE, and given we are in the process of
> supporting boot-time page size, we must also do the same for
> THREAD_SIZE.
> 
> The alternative would be to define THREAD_SIZE for the largest supported
> page size, but this would waste memory when using a smaller page size.
> For example, arm64 requires THREAD_SIZE to be 16K, but when using 64K
> pages and a vmap stack, we must increase the size to 64K. If we required
> 64K when 4K or 16K page size was in use, we would waste 48K per kernel
> thread.
> 
> So let's refactor to allow THREAD_SIZE to not be a compile-time
> constant. THREAD_SIZE_MAX (and THREAD_ALIGN_MAX) are introduced to
> manage the limits, as is done for PAGE_SIZE.
> 
> When THREAD_SIZE is a compile-time constant, behaviour and code size
> should be equivalent.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>


