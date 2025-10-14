Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D46CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd2PoIE+rPMCr6jd3OwU3he0uZl4CmPgrMZ61+ge710=; b=uL6B6GS0Q4+lvszSMwwcIWnuJv
	sfiJYKMHkeafvq/69bA/nZa/q2NHb6e9MQPl7T4l/B9BHY1Azfui4mR3ksqkj3IJNd65d2kidWCVc
	0EolZQRo5A32hMbaYoYfYkzTbXpfqLAfPv2+TK7N5pbnf6aBTPHcAxjViM6w5+LRdUmR9R2JMotaM
	yaKdxWg933H/uAcOyyrbkaYLoz0lFrtYm+Kk2pLxqXm46DX3YAZzEWgWtJ0hoMV3/TbK0m+xWPPnK
	mY5EO0DFqLV2VB7sXvHuKasUC82cN22nXfyLFiQ8GeI4NDLIdLpD5jcWRBGFVXeZpthzbC8NfoDek
	6Abs8+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dP3-0000000G83W-2sqG;
	Tue, 14 Oct 2025 11:41:17 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dOz-0000000G81S-48Uy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:41:16 +0000
Message-ID: <096168a6-8687-4dae-a774-0741d3e5a891@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760442070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hd2PoIE+rPMCr6jd3OwU3he0uZl4CmPgrMZ61+ge710=;
	b=VK9bY4LuIi4ji669KYN12TIOH35WJDu8pKASGIJSdi9qQhdHcSOS9ZOqAwGKpQPsCsa/MC
	Any8FgOqFuOI1eRpcwlhhwocJFbU9rKLsGQh3WYropHOaMHnqd5PxuOYzCW6qqbWxTyanS
	cCDvtJaYV62OHRnEZ5m/iARM6dBj9oQ=
Date: Tue, 14 Oct 2025 19:40:58 +0800
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdW3YzXSBodW5nX3Rh?=
 =?UTF-8?Q?sk=3A_Panic_after_fixed_number_of_hung_tasks?=
Content-Language: en-US
To: "Li,Rongqing" <lirongqing@baidu.com>, Petr Mladek <pmladek@suse.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux@armlinux.org.uk>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
 Joel Granados <joel.granados@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Phil Auld <pauld@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Simon Horman <horms@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Florian Westphal <fw@strlen.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
 <aO4boXFaIb0_Wiif@pathway.suse.cz>
 <3acdcd15-7e52-4a9a-9492-a434ed609dcc@linux.dev>
 <38af4922ca44433fa7cd168f7c520dc9@baidu.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <38af4922ca44433fa7cd168f7c520dc9@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_044114_171525_1549E954 
X-CRM114-Status: GOOD (  13.91  )
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



On 2025/10/14 19:18, Li,Rongqing wrote:
>>>>> Currently, when 'hung_task_panic' is enabled, the kernel panics
>>>>> immediately upon detecting the first hung task. However, some hung
>>>>> tasks are transient and the system can recover, while others are
>>>>> persistent and may accumulate progressively.
>>>
>>> My understanding is that this patch wanted to do:
>>>
>>>      + report even temporary stalls
>>>      + panic only when the stall was much longer and likely persistent
>>>
>>> Which might make some sense. But the code does something else.
>>
>> Cool. Sounds good to me!
>>
>>>
>>>>> --- a/kernel/hung_task.c
>>>>> +++ b/kernel/hung_task.c
>>>>> @@ -229,9 +232,11 @@ static void check_hung_task(struct task_struct
>> *t, unsigned long timeout)
>>>>>     	 */
>>>>>     	sysctl_hung_task_detect_count++;
>>>>> +	total_hung_task = sysctl_hung_task_detect_count -
>>>>> +prev_detect_count;
>>>>>     	trace_sched_process_hang(t);
>>>>> -	if (sysctl_hung_task_panic) {
>>>>> +	if (sysctl_hung_task_panic &&
>>>>> +			(total_hung_task >= sysctl_hung_task_panic)) {
>>>>>     		console_verbose();
>>>>>     		hung_task_show_lock = true;
>>>>>     		hung_task_call_panic = true;
>>>
>>> I would expect that this patch added another counter, similar to
>>> sysctl_hung_task_detect_count. It would be incremented only once per
>>> check when a hung task was detected. And it would be cleared (reset)
>>> when no hung task was found.
>>
>> Much cleaner. We could add an internal counter for that, yeah. No need to
>> expose it to userspace ;)
>>
>> Petr's suggestion seems to align better with the goal of panicking on
>> persistent hangs, IMHO. Panic after N consecutive checks with hung tasks.
>>
>> @RongQing does that work for you?
> 
> 
> In my opinion, a single task hang is not a critical issue, fatal hangs—such as those caused by I/O hangs, network card failures, or hangs while holding locks—will inevitably lead to multiple tasks being hung. In such scenarios, users cannot even log in to the machine, making it extremely difficult to investigate the root cause. Therefore, I believe the current approach is sound. What's your opinion?

Thanks! I'm fine with either approach. Let's hear what the other folks 
think ;)


