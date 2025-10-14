Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B9ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEvM+uhGgelsYNE930lxc/ZO1r9l2srRhYCoY59fvZI=; b=BmBs+yuznH73exV/VGBU+ka1JP
	8S3y6NiH9p5IC2Skrw68i/sM1Uhv7bdhY11KbP2pjZzL5Pcnp3rxUhriRkiiuNiq7+p2sIMLKj+iq
	vk9VLmBcsWCVe7EoibQHUxoQxjRFXZz8Lcb+6ePSNpiepoDNvKWdvSoGkqfayigjTpqK5Pi/lCgmf
	n9GhJXr/lt6gfz51X1dW51Kob9J+hcCqxvgIrig8tRSt9MRUBP8EiP9XTT51qpJSEZbd5zetRUE6z
	npFBoVvZCQC5fSeByBAo83ohrAtdJ7AfoIdW2CdKMyvDuhOAy1kNK3OAltDgEHqGpIDHrXcDSpnAp
	jeNU+Wow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cki-0000000FzIn-19Gs;
	Tue, 14 Oct 2025 10:59:36 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ckf-0000000FzIC-1LDB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:59:34 +0000
Message-ID: <3acdcd15-7e52-4a9a-9492-a434ed609dcc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760439559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEvM+uhGgelsYNE930lxc/ZO1r9l2srRhYCoY59fvZI=;
	b=BiR+m8sacQLfJamWviP0aUJZSo9wnpjGz6QYPqt/6NI9DNz9xzTtXzaORvGO75k6ieWkbU
	ejrTjgascTaQ7moGN5ndS+DY7Tu/xY5mjJ4yJdKB476LoOWOBTkmiB8iYkbkn8w6lCrro9
	LY1hD72GCumzUMDh8YXWz5v0H039po4=
Date: Tue, 14 Oct 2025 18:59:07 +0800
MIME-Version: 1.0
Subject: Re: [PATCH][v3] hung_task: Panic after fixed number of hung tasks
To: lirongqing <lirongqing@baidu.com>, Petr Mladek <pmladek@suse.com>
Cc: wireguard@lists.zx2c4.com, linux-arm-kernel@lists.infradead.org,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, linux-doc@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Stanislav Fomichev <sdf@fomichev.me>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux@armlinux.org.uk>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
 Joel Granados <joel.granados@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Phil Auld <pauld@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Simon Horman <horms@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Florian Westphal <fw@strlen.de>, netdev@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
 <aO4boXFaIb0_Wiif@pathway.suse.cz>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aO4boXFaIb0_Wiif@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_035933_532786_0D6CEC3E 
X-CRM114-Status: GOOD (  20.66  )
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



On 2025/10/14 17:45, Petr Mladek wrote:
> On Tue 2025-10-14 13:23:58, Lance Yang wrote:
>> Thanks for the patch!
>>
>> I noticed the implementation panics only when N tasks are detected
>> within a single scan, because total_hung_task is reset for each
>> check_hung_uninterruptible_tasks() run.
> 
> Great catch!
> 
> Does it make sense?
> Is is the intended behavior, please?
> 
>> So some suggestions to align the documentation with the code's
>> behavior below :)
> 
>> On 2025/10/12 19:50, lirongqing wrote:
>>> From: Li RongQing <lirongqing@baidu.com>
>>>
>>> Currently, when 'hung_task_panic' is enabled, the kernel panics
>>> immediately upon detecting the first hung task. However, some hung
>>> tasks are transient and the system can recover, while others are
>>> persistent and may accumulate progressively.
> 
> My understanding is that this patch wanted to do:
> 
>     + report even temporary stalls
>     + panic only when the stall was much longer and likely persistent
> 
> Which might make some sense. But the code does something else.

Cool. Sounds good to me!

> 
>>> --- a/kernel/hung_task.c
>>> +++ b/kernel/hung_task.c
>>> @@ -229,9 +232,11 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
>>>    	 */
>>>    	sysctl_hung_task_detect_count++;
>>> +	total_hung_task = sysctl_hung_task_detect_count - prev_detect_count;
>>>    	trace_sched_process_hang(t);
>>> -	if (sysctl_hung_task_panic) {
>>> +	if (sysctl_hung_task_panic &&
>>> +			(total_hung_task >= sysctl_hung_task_panic)) {
>>>    		console_verbose();
>>>    		hung_task_show_lock = true;
>>>    		hung_task_call_panic = true;
> 
> I would expect that this patch added another counter, similar to
> sysctl_hung_task_detect_count. It would be incremented only
> once per check when a hung task was detected. And it would
> be cleared (reset) when no hung task was found.

Much cleaner. We could add an internal counter for that, yeah. No need
to expose it to userspace ;)

Petr's suggestion seems to align better with the goal of panicking on
persistent hangs, IMHO. Panic after N consecutive checks with hung tasks.

@RongQing does that work for you?

