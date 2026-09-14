Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AA4C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 23:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDjN0WMFCOSBqgbtPzRrK3zeeUvndcJ2a115299joOg=; b=EQwE5QH4GxlBOkaVhn/xB+NsNO
	WYk56E0daF0HtdDa/wa9VWuMbb8OZTZyCHq6SslLJ2EfGtPExmYDNu6VgQf8SOMVEs6Zz4KCs4i0l
	OsncU0WCwDHJc1BjejVZdwB1ex8V93CJYasBgm0FMCcGR40JCQRVubwIotYze68hIQIcjr/ZBmMKg
	DJOb6WL1Xn5qYvyds6qyZWXdG10Q4hY8Rs7uKkq3XO4wfeOBunpiEzK9Ap1iuCN0YtCEIsjfkY86r
	PvjXGgrYaWpkmhcO1Gs4uXD23eiHz/4DFjhNxxXMOdpO1Aq7V/a6sYM/uN9V1JLLPcc2JGrgrhAau
	ATSMtHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6G5e-00000004rM9-41CH;
	Mon, 14 Sep 2026 23:27:58 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6G5c-00000004rLj-1CRy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 23:27:57 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d822dso18554145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 16:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789428474; x=1790033274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDjN0WMFCOSBqgbtPzRrK3zeeUvndcJ2a115299joOg=;
        b=scNJZbspxod/6kQIaoTAgSpKuKfdTZ2/E+LQuxcacFmVa7dF7b2ZsfeEFMctUthza/
         brPsW/RGKD6jISlu7t4EHQXLdgfuODPhQSOA2U74Jx4j6EyUDMfQoYBYn5km+81qgFAN
         29zyJAvasx3fSbvBFNAPWmq1TZyr22ByUjoeCO/2m/o+Ec1N8e/xButc2s1jKz591LMS
         F1kjrCauZlCFqJ85QHxrTpeahBAL7+4HFruFFpYKzDw7CtDviHai2+evz4GJSG4sOXgZ
         Z3LSkwE07azL42qLGEhNaOAlwUfDJlDrij5dqaTkY7ItCvZNTX1FN1+m4K21heLLbGQq
         b7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789428474; x=1790033274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDjN0WMFCOSBqgbtPzRrK3zeeUvndcJ2a115299joOg=;
        b=jxiOIMgj6CWe+aJ+8wAvKOh0HywIysr0+YbIj1KoMZ/5wrZNiyn1y35sxCWZWLqylG
         Q0BNeFqzzKe42cdbkkFoqK1U0nc/3u9S2wAHBwv0V/KD+mDQdv+OyFfpd1dJ0Icu4cCA
         A+n2beUldDNGVrkXBSazAA0iAVRJXkbFdKKW07svXDKqNbU2BJwMj2I43J90mkeDJVO/
         Kwdw3T9jq3C4DIm+/Rc5XyINtThvwzPJRCUcb0HlvT6OsZkH2whgDNJD//KK5TYUQ/QT
         C2JWJ3By3rKuEORVS01qMaSoqaD+/MbGh7Alhac2sotPenfblsF0EC7QbKXnbqy8Dkgq
         dA6w==
X-Forwarded-Encrypted: i=1; AKwUvBwpZx+BzqkeFIthMVYfjwdauw+EVebL+gghUrra57hjAV3elTQEdv0iRskFmRFaZmfr6Xxh5+QHPJ49q01+KJqe@lists.infradead.org
X-Gm-Message-State: AFuF++nMZHwvWmwR5jqA2fwOxK/bRLU1KzlfshILjpibcyNOxjUl8fmw
	Mnnu1bkZns2tWITc26h9hvCHBe3ssDyMS3BX+JSvpy8/3fneKVqgkdHqh61wOFC5NwQ=
X-Gm-Gg: AYBFou22hF0jLeKm6TD1ElRulHGAdvsH7vKcY+YyZIPVpJCZvQVLP97qClxBV7UavjT
	hRLLcQsIYMhwxKaSQSJ8zesZ8QCTSkSQcpRn+TydmXge2624Ed6YMX2HD1b8NcuQScv2iGHcSMQ
	61WzqBPt6TNJ6+andA53+TBLPNnuyDU8vSqtuzXr9A1U3cOndv7dS164Ci4SfEwxg3Cldoy9QSI
	J3ZThMCpmwg86XTkWaf/wWxgpjRdK6f220c4QCAsDdxqqxDBW6y0XdLV3OMeGHL1P1DSPzdTpT/
	jwUK0P71u3sxj+qBSEw+6p+T7VNsKF5W9rehgystZQcS2s1MWt5IFGujb9T1abtvaJbUo3KLQKF
	OKOJr6sBuwGprWTloLMfxXiFeFI4zd4ThULrxBHjstsnLOt5BGh1pGJ/UU/Re5vKRBfhVR9msAS
	k44ntFBCgzN6djTJfyM+QYExN1SOdUWVcb5n0xS6VoJFbqviz/7S40seVUqeaYsT1was9fL0bls
	q++ny2sZnc6CKFt0kARXFDcEkQUtJiXUovnZzZZk3ejncJxGGVmlY/VZ8TRALUxTfQKdp0D9Rdm
	Vdu2tLCZvKj6iNtL/xb4jMaNCw==
X-Received: by 2002:a05:600c:3589:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49e7a669271mr67975575e9.11.1789428473668;
        Mon, 14 Sep 2026 16:27:53 -0700 (PDT)
Received: from [10.160.16.196] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d66ab6esm25447395e9.2.2026.09.14.16.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 16:27:52 -0700 (PDT)
Message-ID: <74c87cd3-8ac1-46da-a1b9-9149d46b4788@kernel.dk>
Date: Mon, 14 Sep 2026 17:27:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Peter Zijlstra <peterz@infradead.org>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
References: <20260911154148.644489-1-axboe@kernel.dk>
 <20260914192243.GA776954@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260914192243.GA776954@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_162756_607144_416AFBCA 
X-CRM114-Status: GOOD (  32.21  )
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

On 9/14/26 1:22 PM, Peter Zijlstra wrote:
> On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
>  
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
>> task_struct. 
> 
> I'm still struggling my way through this thing.

I don't blame you.

> So thread T1 is doing this blocking syscall. When it actually blocks,
> you hand-over the userspace identifying part to another thread T2, which
> will return to userspace as if it were T1.

Correct.

> Is this really a hand-over, or a swap? I would imagine we not have two
> threads with the same tid and all that.

It's a swap, yes we won't have two threads with the same tid.

> Also, I'm a wee bit confused, why not swap out the kernel stack with a
> io-wq worker and have the original thread return to userspace. This
> seems like a better defined situation. In so far as anything here is
> well defined.
> 
> Swapping the kernel state seems like a simpler endeavour than swapping
> all that is or might be user visible.

I think we'd just be trading one set of problems for another. In terms
of the kernel side, we have the following set of issues around swapping
the kernel stack instead:

- 'current' itself, this is used throughout the waiting helpers. Things
  like wait_queue_entries that use private = current.

- Any kind of sleeping lock that also stashes away the value of
  'current;.

- signal interrupible sleeps via TASK_KILLABLE

- Just like the userspace side, we have a bunch of kernel side state as
  well in the task_struct. Not a complete list, but:
	- plug, for any kind of in-progress IO submission state
	- journal_info
	- reclaim_state
	- io_uring
	- PF_MEMALLOC and friends
	- task_work
	- lockdep
	- preempt/irq stuff in thread_info

- Kernel stack itself in ways it's tied to the task_struct
	- stack canary
	- KASAN
	- vma tracking
	- thread.sp
	- pt_regs

Probably not a complete list, but it's a start... I do agree that the
kernel stack swap seems like the more immediate idea, but I think it's a
harder problem.

>> Folks that have been around a while may remember earlier
>> attempts at this about 20 years ago.
> 
> That was the whole threadlet thing, right? Very hazy memories of that.
> I'll have to go read that back, I'm sure I still have that in my inbox
> *somewhere*.

Right, and it's actually pretty related to what we're discussing above.
The first one was Zach's fibrils which attempted the kernel stack swap,
and then we had threadlets from Ingo which went the route that this
patch set is also taking and dealt with userspace state swaps instead.

> Surely we abandoned that approach for a reason. ISTR there being some
> significant ick there, much like the thing you're proposing now.

Well like you that state has long since been swapped out on my end, my
recollection was disagreement on the API, not the swapping itself. But
also extremely hazy there...

> Not sure yet on how things compare. Will have to dig through that stuff
> again.

Let me know if you find something interesting there.

-- 
Jens Axboe

