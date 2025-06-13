Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBCBC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuBzFJ8bax/C07ekYms0nJGiLaxwPvHrXMpn69ItGCE=; b=QkQKW8AJzQKVJIlhVgwasTzZP4
	iM7+R9jbCyNROZA9zMqO1Nz9kmZCYHyDDkVF3eTJhKocfAsXWvORK9vUwSeeq/FtSBniD0BbV/zNl
	EZvi6Ku5dWL7cfIOl3Jz29Y1sWOPNuJkBZ8X4ctRMaZb3p6bd7AhzuTwTMYkAeBzGTVeT6dU622hk
	gxvRGVc+fuO8IMX74aorRR3jni/QItLyv6qKv8ieah5tL9PBMo9zbwkssdDhwXInG1LppAg8KAnv9
	f9mpL5ZOzEuQV1Px/tfkT0f0p+OFOXe0Mh2y5A6uD2VQixvkGzduwNTJE/eN8VqlHO07Ut7WoVuUH
	WS6ULUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBhq-000000006Sp-1QF2;
	Fri, 13 Jun 2025 21:12:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBf8-000000005kw-1xbt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:10:12 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749849007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MuBzFJ8bax/C07ekYms0nJGiLaxwPvHrXMpn69ItGCE=;
	b=W/+KmpmNybGnuRoYv0AkuKtnsKYy49mDsnZqnAuVFR1iteOuBy0nacsuwGwXn52voU6/A3
	rlpGxKzE17HSzJPSKGvwNQJEKPQ2IFAH0QXreT8YqKLVvYCy/n1ZCmO4AAVX15Jd+MYBUZ
	f078Jahg2V4fzWuEaulUv7ngS3jkX9Tek/CfN3Gn+gU1TOIbsKZQYlPliMSLFsqyqornBW
	lsIadsSDSfNHZTi+A/6p2ZwnwTvAdvZSMEF/OVyDAxeAFC4jk3gJJG1QVukp+FAy2z+3wo
	2gYCjOHwj5rC7TfnnNYbSEVUNJgT0ejodJqurt21ADxWP4ylesQwYB2SVPEGEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749849007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MuBzFJ8bax/C07ekYms0nJGiLaxwPvHrXMpn69ItGCE=;
	b=B+7CxHUzslKZqG2mQ5S8cP+m4qTSW7M8mzh4mOWSOA/tKqAiCbq9U6NTQHVBHdo+sCpJ1L
	VBPCCiAD4jsOM0DA==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 andersson@kernel.org
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
In-Reply-To: <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
 <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
 <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org>
Date: Fri, 13 Jun 2025 23:10:06 +0200
Message-ID: <87ikkzpcup.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_141010_814051_C09ED721 
X-CRM114-Status: GOOD (  24.06  )
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

On Fri, Jun 13 2025 at 17:33, Eugen Hristev wrote:
> On 5/7/25 13:27, Eugen Hristev wrote:
>>> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
>>> kmemdump specific section and then kmemdump can just walk that section
>>> and dump stuff. No magic register functions and no extra storage
>>> management for static/global variables.
>>>
>>> No?
>> 
>> Thank you very much for your review ! I will try it out.
>
> I have tried this way and it's much cleaner ! thanks for the
> suggestion.

Welcome.

> The thing that I am trying to figure out now is how to do something
> similar for a dynamically allocated memory, e.g.
> void *p = kmalloc(...);
> and then I can annotate `p` itself, it's address and size, but what I
> would also want to so dump the whole memory region pointed out by p. and
> that area address and size cannot be figured out at compile time hence I
> can't instantiate a struct inside the dedicated section for it.
> Any suggestion on how to make that better ? Or just keep the function
> call to register the area into kmemdump ?

Right. For dynamically allocated memory there is obviously no compile
time magic possible.

But I think you can simplify the registration for dynamically allocated
memory significantly.

struct kmemdump_entry {
	void			*ptr;
        size_t			size;
        enum kmemdump_uids	uid;
};

You use that layout for the compile time table and the runtime
registrations.

I intentionally used an UID as that avoids string allocation and all of
the related nonsense. Mapping UID to a string is a post processing
problem and really does not need to be done in the kernel. The 8
character strings are horribly limited and a simple 4 byte unique id is
achieving the same and saving space.

Just stick the IDs into include/linux/kmemdump_ids.h and expose the
content for the post processing machinery.

So you want KMEMDUMP_VAR() for the compile time created table to either
automatically create that ID derived from the variable name or you add
an extra argument with the ID.

kmemdump_init()
        // Use a simple fixed size array to manage this
        // as it avoids all the memory allocation nonsense
        // This stuff is neither performance critical nor does allocating
        // a few hundred entries create a memory consumption problem
        // It consumes probably way less memory than the whole IDR/XARRAY allocation
        // string duplication logic consumes text and data space.
	kmemdump_entries = kcalloc(NR_ENTRIES, sizeof(*kmemdump_entries), GFP_KERNEL);

kmemdump_register(void *ptr, size_t size, enum kmemdump_uids uid)
{
        guard(entry_mutex);

	entry = kmemdump_find_empty_slot();
        if (!entry)
        	return;

        entry->ptr = ptr;
        entry->size = size;
        entry->uid = uid;

        // Make this unconditional by providing a dummy backend
        // implementation. If the backend changes re-register all
        // entries with the new backend and be done with it.
        backend->register(entry);
}

kmemdump_unregister(void *ptr)
{
        guard(entry_mutex);
        entry = find_entry(ptr);
        if (entry) {
                backend->unregister(entry);
        	memset(entry, 0, sizeof(*entry);
        }
}

You get the idea.

Coming back to the registration at the call site itself.

       struct foo = kmalloc(....);

       if (!foo)
       		return;

       kmemdump_register(foo, sizeof(*foo), KMEMDUMP_ID_FOO);

That's a code duplication shitshow. You can wrap that into:

       struct foo *foo = kmemdump_alloc(foo, KMEMDUMP_ID_FOO, kmalloc, ...);

#define kmemdump_alloc(var, id, fn, ...)				\
	({								\
        	void *__p = fn(##__VA_ARGS__);				\
									\
                if (__p)						\
                	kmemdump_register(__p, sizeof(*var), id);	\
		__p;
        })

or something daft like that. And provide the matching magic for the free
side.

Thoughts?

Thanks,

        tglx

