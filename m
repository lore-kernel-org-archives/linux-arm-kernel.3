Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D28C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 17:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k95L5dONGc9CGpjQXqAX4pgyDviRC1HRrOs4s2XHP00=; b=fTs2HTzMCKwXigALCS/Bn64VDM
	RvgG+L4qlJbBfAgNv6s/SdszfOypkZHhgSgkOZm3wGDSyGt8xKRD9z73ciNXfwtDkZvydWPjCQ209
	qKi7pnT1Nd40sRc55E9MFXSvtMDd2+GwIexnbaaS6q6MdWpOglk0BfPk1eVxaOKNBvQ/U8BuV0KS/
	8waUmQBWkNdEckNbj5GT1LAZz3tpSezT6WHYoFWstl2O+u1kN/LbH62p/qwzFpiJ2K/UJyRhkpAdH
	wAbblKWMxN4SX3sw/7Y9D5ZkqEHO7nK3dvl9Qty4P8jHVGus1nxFO3ffLslxg2gOlACFbAdk2oO5j
	pob4Cbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaQn-00000000gu4-0pxw;
	Fri, 06 Jun 2025 17:00:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaOe-00000000gTG-2eLd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 16:58:26 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749229102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k95L5dONGc9CGpjQXqAX4pgyDviRC1HRrOs4s2XHP00=;
	b=35ARZ3cWSCFsiwLfUkdujv+aKxhUsCTUh2IX4MmwT3dO0YvNhz8mxqLjOLSmRedTSFebTq
	psSABq/JZEzPlaUlHXBoeRc1oUYheu3iQI9vWbhT1AgIwul1wKZhwKSByI/aTYyprU81AP
	WDs52bDysUvt+72dq1xUeXUJxknI1Zij1y76fKpF69gei+VLeesoQgLgGfI3JlPIW20Cq1
	yWVwMlT2Kl1M/LZEdGyYhkTBiYx8FuORb+ERVlRo27PChn4RZE5gkqCGWNiTkgqqzzDW7K
	kgzePptvKAELg7I58UBeLnnPQ9pGPu4PhTNHLy/mdwBh7lGsczKGkYLat+gSUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749229102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k95L5dONGc9CGpjQXqAX4pgyDviRC1HRrOs4s2XHP00=;
	b=D/ZzWL1WLUKSjbYuu1m6EkVXeRSKEWqtK71hgfzILpbVD+lKbq+WraD7rm7MeCUilnhyBo
	Z/6FCBLz9/2tTICg==
To: Petr Mladek <pmladek@suse.com>
Cc: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>, 'Michael Kelley'
 <mhklinux@outlook.com>, 'Ryo Takakura' <ryotkkr98@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <aEL0tZgSEhsR9qbf@pathway.suse.cz>
References: <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEApOPTqbVOR35F_@pathway.suse.cz> <84o6v3ohdh.fsf@jogness.linutronix.de>
 <aEBNLMYVUOGzusuR@pathway.suse.cz>
 <TY4PR01MB13777CC92C858572B9C19394FD76FA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEGeARVcCwqcoHb8@pathway.suse.cz> <84frgdcgug.fsf@jogness.linutronix.de>
 <aEL0tZgSEhsR9qbf@pathway.suse.cz>
Date: Fri, 06 Jun 2025 19:04:22 +0206
Message-ID: <84msakdcy9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_095824_950347_2A7863B1 
X-CRM114-Status: GOOD (  28.89  )
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

On 2025-06-06, Petr Mladek <pmladek@suse.com> wrote:
>> What if during non-panic-CPU shutdown, we allow reacquires to succeed
>> only for _direct_ acquires? The below diff shows how this could be
>> implemented. Since it only supports direct acquires, it does not violate
>> any state rules. And also, since it only involves the reacquire, there
>> is no ugly battling for console printing between the panic and non-panic
>> CPUs.
>
> Interesting idea. I thought a lot about it, see below.
>
>
>> diff --git a/include/linux/printk.h b/include/linux/printk.h
>> index 5b462029d03c1..d58ebdc8170b3 100644
>> --- a/include/linux/printk.h
>> +++ b/include/linux/printk.h
>> diff --git a/kernel/panic.c b/kernel/panic.c
>> index b0b9a8bf4560d..8f572630c9f7e 100644
>> --- a/kernel/panic.c
>> +++ b/kernel/panic.c
>> @@ -304,6 +310,8 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
>>  		smp_send_stop();
>>  	else
>>  		crash_smp_send_stop();
>> +
>> +	nbcon_panic_allow_reacquire_set(false);
>>  }
>
> I have two concerns here:
>
> 1. I wonder whether this is reliable enough. It seems that
>    smp_send_stop() waits at least 1 sec until the CPUs
>    get stopped. But is this enough on virtualized systems?
>
> 2. It might increase a risk when CPUs are stopped using NMI.
>    The change would allow a non-panic CPU to reacquire the ownership
>    and enter _unsafe_ section right before being stopped by NMI.
>
>
> The 1st problem might be avoided by allowing the reacquire all
> the time unless an "unsafe" takeover happened.
>
> The 2nd problem is worse. But allowing the reacquire all the time
> might actually help as well.
>
> Note that the information about the "unsafe_takeover" is stored
> in struct console so that we even won't need a new global
> variable.

That is a good idea. We should add unsafe_takeover as a condition as
well. That can only happen way after the smp_send_stop() anyway. But it
means that only the atomic printing code would ever need to worry about
unsafe_takeover (assuming a driver were to implement some sort of
handling of it).

>>  /**
>> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
>> index d60596777d278..d960cb8a05558 100644
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -235,7 +235,8 @@ static void nbcon_seq_try_update(struct nbcon_context *ctxt, u64 new_seq)
>>   *			the handover acquire method.
>>   */
>>  static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>> -					    struct nbcon_state *cur)
>> +					    struct nbcon_state *cur,
>> +					    bool ignore_other_cpu_in_panic)
>>  {
>>  	unsigned int cpu = smp_processor_id();
>>  	struct console *con = ctxt->console;
>> @@ -249,7 +250,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>>  		 * nbcon_waiter_matches(). In particular, the assumption that
>>  		 * lower priorities are ignored during panic.
>>  		 */
>> -		if (other_cpu_in_panic())
>> +		if (other_cpu_in_panic() && !ignore_other_cpu_in_panic)
>
> If you agree with allowing the reacquire all the time then I would
> rename the parameter to @is_reacquire and do something like:
>
> 	if (other_cpu_in_panic() &&
> 	   (!is_reacquire || cur->unsafe_takeover))

Looks fine to me.

>>  			return -EPERM;
>>  
>>  		if (ctxt->prio <= cur->prio || ctxt->prio <= cur->req_prio)
>> @@ -913,7 +920,7 @@ void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt)
>>  {
>>  	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
>>  
>> -	while (!nbcon_context_try_acquire(ctxt))
>> +	while (!nbcon_context_try_acquire(ctxt, READ_ONCE(nbcon_panic_allow_reacquire)))
>
> And here it would be:
>
> 	while (!nbcon_context_try_acquire(ctxt, true))

Right.

>>  		cpu_relax();
>>  
>>  	nbcon_write_context_set_buf(wctxt, NULL, 0);
>
>
> Summary:
>
> I open to give this alternative approach a chance when we allow the
> reacquire all the time. It might work well. And it won't require
> any special "panic" handling in all console drivers.

Agreed. Thanks for being open about this approach. I will put together
an official patch.

John

