Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A487C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9olr04AtyTbiPDIyx9X9sacFZEY3X0bYJ7/A2XJEuFA=; b=MnPz4QIQhPk/n5CX+YW4y8egGF
	lnbGGRT4OnDeC/BiELq31VjxSS6YTfXumxdijwkJyRlCFNYFL7/JzsOO5YL4i/W4Tq7I4R3tTqA6H
	A4lJl0Bu6I3VTdZDpaCEOASdV6pQHuVptfK0Yb1KM3X1H0yEByhgLfuN6zWQhZgFZ+gr93XKV2ieL
	IITjPTBstqW5BHDPVcpnaEt4oAgr59MsJck6aFFMjRuoFNOsu0cZfQP75Wz6wzK6nVOuwEroNZ5JD
	5T+XiadthsRwmy67THEgAc7qVLRxO1GDglp1fYACMR/QUJXKeXAOgK3p5Oia9gmJpMlzSqEZOpP8F
	roShVNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55Pv-0000000HOJl-1QlI;
	Fri, 11 Sep 2026 17:52:03 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55Pq-0000000HOIh-2aqN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 17:52:00 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7f4f824de5dso578465a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789149117; x=1789753917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9olr04AtyTbiPDIyx9X9sacFZEY3X0bYJ7/A2XJEuFA=;
        b=ShQbDwoX9/IsCROzAWKb6Z9bdi7Pv3+e40lWdz+xr0gLMZmiEpo5hKa1R3mUHisuR1
         yTIK1iWOS+GDmGQjVqkqxvZKV/ZNwJ8hNSQiO4bfGiY/+I9mpdStlBzq71gichZNnC7M
         c/jwMb0MCgV89cUro7ew0Zv6mbDXW1Bl3L4HcdGGQwYqrequeqhiNNc8L7BqDOHMaj40
         QY1KjDODbdOmCZeHMQInyfuEVaorfTsqn8GCpnyxZRtmVrYB9MzMi2tslbw3+/aOfH/7
         K2iuNjqirFNjfESM1gFbgL9XXBy3AAB0Ak5r15I8rRarFuo6dbdE4iS1aLYiM/6TpDUM
         /brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149117; x=1789753917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9olr04AtyTbiPDIyx9X9sacFZEY3X0bYJ7/A2XJEuFA=;
        b=nUCnWUBc4VPWSPQHA6A3uvIeHL5aDD1UokFm2Q3f4i+E//VkfItyQ6a85jwxMvWZxy
         o/a4IHYtWGMhTSxjM2414FjmrQd/gilaB+7gOsm0EiUEV5bOfcwEY9dDpCqjxRnAX++q
         5novNDIZ9NRL994+jTLHQ2X928b8e41WsCBTxic0Xn0QIVHGS5P7Ca9NwKNKVEMFkA5k
         8aDvJl1JCAIR5MqVBfyUJwQiIrqkyq0uwj8Z9V1PXLrYMvfsm5fuicMiqVO9je2Ra0cE
         EetyeH2DCCNZp7OcDU/CVYdgyoXBLRe65IXq/8mmBCw9OvrdYNDwwlqB7yZuMzLLnmZR
         DulQ==
X-Gm-Message-State: AFuF++lYbzObswe8X/OXIA3WFIfzE6Lihiu9xmowWYIA/ljoU94VXLGb
	rWCBoKRkvSMcw5HP+QZG0lryAaLE4De5bo861eENAQLsG6vJooT+BWaeOyVRnTbA0/A4vbjHXu6
	WWA2qLOM=
X-Gm-Gg: AYBFou0qmWYFmJsu1520gvAbwNpxE92K9qd92oxmCifHJLldw/gF95X8FuCJGJEmapn
	FBM2x6lA5UWVC8iIrlusdl3K/Iv34Jcg0Gh01stR5l54MKcQyCiSu27oXS1tihveOEYBT9ncM8V
	2nLDpTIj4rGDWVwtoXQHK0XiK30wkWcewkbUrVGnFztseXGfoUAaUZgNLgAVzUND7Yw4e9rlRQx
	daFY6eXUGyAERCIVO//jY1UhgC9LJh/81C5O6t7bec/oaFYXJB3CWy/Ho8+jiuvqKWt0eQPVNtt
	H9S/IWCiH8ArwH3Vrrn8SB6Ld6GRYMFEEFW/Zwo8qLdwbNhf2s1YynR9ahshjM7wqP20d4tuEWj
	53dYVhM67vcNqfMtjw8pygMV3C0eljKMKknbbEIDRo/yNTd1oTh0EuWojHD+6GyB4cAGt64EGCX
	BEwX2iOy8pMGFB66rkoh4td2lxAu5RcdN7PH3D+UG7Revw4peqr3bjbfNoJh6MkNEpKngpe9Mwc
	cAeP11re0ITF+HRLWbnV3fMT7kBybZZ8wmf3Hl0IpOkrnu9/H0S9YNU
X-Received: by 2002:a05:6830:6abc:b0:7fa:ab72:9dfa with SMTP id 46e09a7af769-803ff447bcdmr4271484a34.18.1789149117393;
        Fri, 11 Sep 2026 10:51:57 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670d850sm3108041a34.17.2026.09.11.10.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:51:56 -0700 (PDT)
Message-ID: <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
Date: Fri, 11 Sep 2026 11:51:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Gabriel Krisman Bertazi <krisman@suse.de>, io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87tsnv1ynh.fsf@mailhost.krisman.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87tsnv1ynh.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_105158_842262_2AE94A06 
X-CRM114-Status: GOOD (  34.28  )
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

On 9/11/26 11:33 AM, Gabriel Krisman Bertazi wrote:
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> Hi,
>>
>> io_uring issues requests inline with IO_URING_F_NONBLOCK and punts to
>> io-wq when that isn't possible. For a range of opcodes it isn't possible
>> at all, as there's no nonblocking path in the kernel for them: fsync,
>> statx, openat, the *at family, xattr, fadvise, splice, etc. Those are
>> punted unconditionally, and the punt costs a thread wakeup, a context
>> switch and a task_work completion round trip per request. io_uring HAS
>> to be cautious to prevent accidental blocking in the kernel, even if the
>> operations predominantly never block. Sad story. Examples of that are
>> things like an fdatasync that doesn't block, statx that hits dcache,
>> openat for O_TMPFILE, etc. All of those would've completed inline just
>> fine, but io_uring just cannot rely on that.
>>
>> This series issues those requests inline in blocking mode instead, and
>> only pays for the offload if the request actually blocks. But by the
>> time it blocks, the submitter is deep in the kernel with the request on
>> its stack, so the work can't be moved to another thread. What we can
>> move is the identity. If the submitting task blocks, an idle io-wq
>> worker takes over its user visible identity (tid, signal state,
>> credentials, scheduling attributes, cgroup, user register state),
>> finishes the io_uring_enter() call and returns to userspace as the
>> submitter. The original task finishes the request as an
>> io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
>> the same tid came back from the syscall, it's just on a different
>> task_struct. Folks that have been around a while may remember earlier
>> attempts at this about 20 years ago.
> 
> This is both really cool and seems like very dangerous thing :) Count me

Oh yeah, it's definitely crazy and deeply an RFC.

> amazed.  I worry this impersonating method will become as tricky as the
> kthread impersonating model that you replaced with the user workers,
> though.  I haven't looked at your patches yet, but I wonder how you
> handle other tasks that have a reference to your task_struct.

That one was different, because these are normal threads, not kthreads.
They are created similarly to if you did pthread_create() in userspace,
this is what io-wq workers are already. So it's mostly as safe as io-wq
already is, by design, which is why the PF_IO_WORKER work happened and
why kthreads haven't been used since back in the early 5.x days.

So I don't think there's too much to worry about on the security front,
it's mostly a "this will confuse the application" kind of thing because
something has been missed. And yes that is no good either, but it's not
a security concern. That's VERY different from the kthread case, where
if you missed some kind of personality, then congrats you're now running
with fully elevated privileges.

> I was actually working something much simpler to improve this problem,
> which still require subsystems to cooperate, but largely reduces issue:
> 
> My idea was to reuse the non_block_count which already exists in
> task_struct preserved for every kernel config that has io_uring.  We we
> scope the inline path with it.  We then provide new mutex, semaphore
> callers that will check the flag and fail refusing to sleep, similar to
> a try_lock.  The new callers are required because we want subsystems to
> opt-in the behavior, properly clean after themselves, and return
> EWOULDBLOCK.  This is why we need to clean blocking paths in io_uring.
> sched throws a WARN_ON if we schedule out with the counter> 0, making it
> easy to find issues.

I think that would be a tough sell, mostly because of how many locking
primitives we have and how widely they are used, and how difficult (or
impossible) it is to introduce error paths for code that previously had
none. That alone would make it a non-starter for me. Let alone is that
it'd be a continual whack-a-mole kind of work, it'll never be fully
done.

> It has the downside of still requiring fixes to every path and we need
> to handle every new case that comes by, but it is much cleaner than
> plumbing a nonblock flag several layers down the stack across each
> subsystem or having subsystem-specific details in io_uring, which is
> what we have today.  On the upper side, it is much less complex than
> your approach. It also allow us to just back off during memory
> allocations that would block, solving the memory allocations anywhere in
> the submission path, not only inside ->issue(), which we discussed
> recently on discord.

I think you'll find it'll be a lot MORE complicated than my approach!
Backing out error handling is going to be impossible in some cases,
think file systems for example. How would those cases be handled?

> I'll give a try to this series and report back.

Thanks!

-- 
Jens Axboe

