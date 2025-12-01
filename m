Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED2DD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2borD2eJcv573vytYZct+VW+TwAVkVqTnJeZ2AHkFyo=; b=g+BFLjEmOVIABjkx8U7ziuGoHu
	3Iqxl+4Ed7F+EqynNkav37vgjle5u2ECQhXllUQO8UdKu8U4wX/eDrSMMzgU1czF8Xw2L01+WnIwe
	vFMy/KoLV4XzUpX9QhOLx5t/oVfmJp6Zi3e0iiuBjm9JTFLGesYGK1KR2bOmR7F7VyKPTxcm87Pa+
	Mon7f2T+W7j/ZPL7n3ClGCeH5NSfXqad5mDW+oJjGFWw/4n12Qmr2cXf/eRZhHIMilBD4PsxVFgBR
	ItYDwho3m7VJkL+7JbKY/XKqWcbpPZu4wpEyuEkZwyjVzrcRxNJ4lQ6bplJ+erD+Su0za2TS/OzAT
	fu1VxXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ42M-000000040f4-2d8f;
	Mon, 01 Dec 2025 13:33:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3qQ-00000003qmz-3r5h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:21:36 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764595293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2borD2eJcv573vytYZct+VW+TwAVkVqTnJeZ2AHkFyo=;
	b=YVE7OLEf2UppUJ8b8RcAmr60ws/MZRmpYAucHLVc2qLD7AvRERxObt9KkwgEGWohLNrWsk
	q5e96FBQjWP6ixgecsFF/qH/u6ELFrr0aeASdKNYt9sMyPej7tim/v+wOqaBsKiq+l1LeW
	VD4oVgew+y3jujI4oGX4aeBYNYzJUzZlRhfuI8+eZdLZEa8K2Gne5nSMr/LBIwrCvObHI9
	On5In87JA8Ld5Ap0jwVZMOeYmCdGEsqbY5qjrnpzENuBGEALn7lCniQBJzlXyJT04TGVaj
	E4UYn6/wUsMeuuiQN1ZwMeyRpzZM4HBinS0eiS/YndS1CudzJCGSWfWihzmnAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764595293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2borD2eJcv573vytYZct+VW+TwAVkVqTnJeZ2AHkFyo=;
	b=7scM4e8TjAtX0Ht+aHL+Y6W/ycyyj3wa94Xl5rb9kVmetQJGz9HmBqSVryRx9KO6E7ZTqm
	cld8lqlvp126H/Aw==
To: Petr Mladek <pmladek@suse.com>, Breno Leitao <leitao@debian.org>
Cc: linux@armlinux.org.uk, paulmck@kernel.org, usamaarif642@gmail.com,
 leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
In-Reply-To: <87ecpefjee.fsf@jogness.linutronix.de>
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
 <aSnI8UQRNICSKxAb@pathway.suse.cz> <87ecpefjee.fsf@jogness.linutronix.de>
Date: Mon, 01 Dec 2025 14:27:32 +0106
Message-ID: <87bjkificj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_052135_100107_A4466DE7 
X-CRM114-Status: GOOD (  10.89  )
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

On 2025-12-01, John Ogness <john.ogness@linutronix.de> wrote:
>> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
>> index 3fa403f9831f..6b8becb6ecd9 100644
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -1549,6 +1549,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>>  {
>>  	struct nbcon_write_context wctxt = { };
>>  	struct nbcon_context *ctxt = &ACCESS_PRIVATE(&wctxt, ctxt);
>> +	unsigned long flags;
>>  	int err = 0;
>>  
>>  	ctxt->console			= con;
>> @@ -1557,18 +1558,31 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>>  	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
>>  
>>  	while (nbcon_seq_read(con) < stop_seq) {
>> -		if (!nbcon_context_try_acquire(ctxt, false))
>> +		/*
>> +		 * Atomic flushing does not use console driver synchronization
>> +		 * (i.e. it does not hold the port lock for uart consoles).
>> +		 * Therefore IRQs must be disabled to avoid being interrupted
>> +		 * and then calling into a driver that will deadlock trying
>> +		 * to acquire console ownership.
>> +		 */
>> +		local_irq_save(flags);
>> +		if (!nbcon_context_try_acquire(ctxt, false)) {
>> +			local_irq_restore(flags);
>>  			return -EPERM;
>> +		}
>>  
>>  		/*
>>  		 * nbcon_emit_next_record() returns false when the console was
>>  		 * handed over or taken over. In both cases the context is no
>>  		 * longer valid.
>>  		 */
>> -		if (!nbcon_emit_next_record(&wctxt, true))
>> +		if (!nbcon_emit_next_record(&wctxt, true)) {
>> +			local_irq_restore(flags);
>>  			return -EAGAIN;
>> +		}
>>  
>>  		nbcon_context_release(ctxt);
>> +		local_irq_restore(flags);
>
> Using local_irq_save()/_restore() here is not acceptable for PREEMPT_RT
> because __nbcon_atomic_flush_pending_con() is also used by
> nbcon_device_release().

After thinking about this more, this would be acceptable. If
printk_get_console_flush_type() is reporting nbcon_atomic==true, then
the system is in a state where latencies are irrelevant.

John Ogness

