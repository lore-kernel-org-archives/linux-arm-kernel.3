Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230DACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX7ZWTGcfO6cjMLSuPAPLarY79uM4KjOvmSn3Yf+60k=; b=cgUq3fP+3IiaC1iDKDsw8ZFC7S
	fugn98h9OU+RZLC/s0VFgOvNASmVUp9wiEcbYIzydLERQx88awHy93eGRIGJnojBujQuDertK4rCI
	1/QkNu10a5kwVjM1vZEGWauJm8B9g3pgCHbmpTbZrEZN3PSH+FTvGQzoLSccHu9oVAzmS+v5omrey
	c76w01ZKa19/pPH95+mqt7rZtUCUohAtVCJVPAVGUeYyJTrUOcir3IA4GGW5l5OB61jMBpDRu7RtX
	l7iZH+UM851FQgrlefOQHTQxbmDlk1IqRIkzAZpNdKCfGGyq3LBo8CxMMC1rZtLe86mb9koUmMbat
	3bghGyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzX8o-00000002KwU-1eKM;
	Fri, 19 Sep 2025 09:10:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzX8l-00000002Kv4-3Y6l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:10:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758273049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DX7ZWTGcfO6cjMLSuPAPLarY79uM4KjOvmSn3Yf+60k=;
	b=QuK5wRa0gDQO1gXgXehNLVasmKdIhOap5o64R2lG53jbo6J/WT4kVJ3gBmtdp5Kbz++Us4
	1xhgDgHTmFas3SJGlGEO3NiLQMIQokw5F3MhYbuQneqBKJB9JczoJF0aNvX417+jxDAs+R
	X3ywGry7Rp8uEvN21n02DE0781iXrphv/m9W52CXuBkskWKIa6zpRr2PsyQnROEqjXRuHS
	a08Qf3dsf5uiq2XvNMKmhxGGUK5gidEf4wQJa2LYQr71wqnmxgk5ic9dabJkN6DWw3Okwj
	uUxA+mg75xRft7B5XFN5q+sYTv8eo+PefhCyqlbpsErvZjxXOu6S8fwJErbhOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758273049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DX7ZWTGcfO6cjMLSuPAPLarY79uM4KjOvmSn3Yf+60k=;
	b=WYy6M2/T0lb7WW23IIDdRWWBS23UuLkHY4UK6FOSWYzoGycbAdkixRSpst7y1Vv4h8T1H5
	1Gf58LjH/I8W1jDw==
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, kernel test robot
 <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Nathan Chancellor
 <nathan@kernel.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>,
 x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 3/6] uaccess: Provide scoped masked user access regions
In-Reply-To: <aMwHHkaSECBDjuir@localhost.localdomain>
References: <20250916163004.674341701@linutronix.de>
 <20250916163252.164475057@linutronix.de>
 <aMwHHkaSECBDjuir@localhost.localdomain>
Date: Fri, 19 Sep 2025 11:10:48 +0200
Message-ID: <87bjn6959j.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_021052_026928_D8D7F11F 
X-CRM114-Status: GOOD (  23.21  )
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

On Thu, Sep 18 2025 at 09:20, Mathieu Desnoyers wrote:
> On 16-Sep-2025 06:33:13 PM, Thomas Gleixner wrote:
>> These patterns beg for scopes with automatic cleanup. The resulting outcome
>> is:
>>     	scoped_masked_user_read_access(from, return -EFAULT,
>> 		scoped_get_user(val, from); );
>> 	return 0;
>
> I find a few aspects of the proposed API odd:
>
> - Explicitly implementing the error label within a macro parameter,

Which error label are you talking about?

> - Having the scoped code within another macro parameter.

Macros are limited and the whole construct requires a closed scope to
work and to keep the local variables and the jump label local.

> I would rather expect something like this to mimick our expectations
> in C:

I obviously would love to do it more C style as everyone else.
If you can come up with a way to do that in full C I'm all ears :)

> int func(void __user *ptr, size_t len, char *val1, char *val2)
> {
>         int ret;
>
>         scoped_masked_user_read_access(ptr, len, ret) {
>                 scoped_get_user(val1, ptr[0]);
>                 scoped_get_user(val2, ptr[0]);
>         }
>         return ret;
> }
>
> Where:
>
> - ptr is the pointer at the beginning of the range where the userspace
>   access will be done.

That's the case with the proposed interface already, no?

> - len is the length of the range.

The majority of use cases does not need an explicit size because the
size is determined by the data type. So not forcing everyone to write
scope(ptr, sizeof(*ptr), ..) is a good thing, no?

Adding a sized interface on top for the others is straight forward
enough.

> - ret is a variable used as output (set to -EFAULT on error, 0 on
>   success). If the user needs to do something cleverer than
>   get a -EFAULT on error, they can open-code it rather than use
>   the scoped helper.

Just write  "ret = WHATEVER" instead of "return WHATEVER".

> - The scope is presented similarly to a "for ()" loop scope.

It is a loop scope and you can exit it with either return or break.

> Now I have no clue whether preprocessor limitations prevent achieving
> this somehow, or if it would end up generating poor assembler.

There is no real good way to implement it so that the scope local
requirements are fulfilled. The only alternative would be to close the
scope with a bracket after the code:

      scope(....)
        foo(); }

or for multiline:

      scope(....) {
           ....
      ))

The lonely extra bracket screws up reading even more than the code
within the macro parameter because it's imbalanced. It also makes
tooling from editors to code checkers mightily unhappy.

Thanks,

        tglx

