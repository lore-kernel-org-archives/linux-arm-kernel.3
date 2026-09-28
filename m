Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749B9C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIcYNXBnk2bfFjfQ6WtNslIsM8KVa3AEhevAZJnlBd0=; b=zizbiNRyuctvn0pi7SYTUhUo33
	/ZJEn5ZVaaTmD3G5aWImD8HxU6ZXT+JXJq6mkYqsauSwGmJPgyy3hP3RxV6mwoy19USRxiCt37QsB
	kSk69sSb6GoiSJvyEaHcc0ntCwwoejb/RPE+bsm5dh8MBtkSrTPJFKwdkS6htvnUJ+v0V7VmVnTy9
	Lt4mV1b/oFOWBXZi1ZkMlrByvxWDEqkTMtsg6qIGQ9OA5376AKCbXgLmRSo7F89Y2UwFO5lXGpFmg
	EodCDeHutK69Ofi26qAwCzmaSfUQGCgAEiM85OElP7X205bDOs7Q1uLrXhcG+J6SDmzzP0KH0o0Es
	h5mTdFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5Cl-0000000HUOc-2gqZ;
	Mon, 28 Sep 2026 06:51:15 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5Ci-0000000HUMJ-2VV8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:51:14 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 28 Sep 2026 15:51:09 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 3ED5620914A4;
	Mon, 28 Sep 2026 15:51:09 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Mon, 28 Sep 2026 15:51:09 +0900
Received: from [10.213.138.107] (unknown [10.213.138.107])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id E9B2310A019;
	Mon, 28 Sep 2026 15:51:08 +0900 (JST)
Message-ID: <faa1027c-7279-462a-9c6f-f03354b9cfd3@socionext.com>
Date: Mon, 28 Sep 2026 15:51:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Malathi A <malathi.a2000@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260917040511.103232-1-malathi.a2000@gmail.com>
 <97e4ab26-b147-4cf4-97f9-307903f14e61@socionext.com>
 <arUvJyvChXXcasSu@ashevche-desk.local>
 <3ea1f574-ddb5-46a6-9bc1-7a8ea84c54bd@socionext.com>
 <arZ5KxIp55qA6UA7@ashevche-desk.local>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <arZ5KxIp55qA6UA7@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_235112_764083_7D1A721C 
X-CRM114-Status: GOOD (  22.51  )
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

On 2026/09/25 22:37, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 08:32:20PM +0900, Kunihiko Hayashi wrote:
>> On 2026/09/24 23:09, Andy Shevchenko wrote:
>>> On Thu, Sep 24, 2026 at 06:07:37PM +0900, Kunihiko Hayashi wrote:
>>>> On 2026/09/17 13:05, Malathi A wrote:
> 
> ...
> 
>>>> I'm a bit concerned about the error path in uniphier_uart_resume().
>>>> The clock may have been disabled in uniphier_uart_suspend(), and
>>>> clk_prepare_enable() can fail when trying to enable it again.
>>>>
>>>> In that case, wouldn't devres try to disable an already disabled
>>>> clock on detach?
>>>
>>> Isn't there is a guarantee that the .remove() is called with PM
> runtime on
> 
> After reading a code of driver core I see that this is the opposite
> actually.
> The PM runtime might be off.
> 
>>> and get, meaning it's called with the enabled clock? But if not the
> case,
>>> we might use PM runtime force operations (resume and suspend in the
>>> respective cases.
>>
>> My concern was just the case where clk_prepare_enable() in the system
>> resume callback fails, leaving the clock disabled before devres cleanup.
>>
>> This driver currently only uses SET_SYSTEM_SLEEP_PM_OPS(), so I wasn't
>> considering runtime PM here.
> 
> So, in such a case how do you see the scenario when system is resumed
> (Right?
> Otherwise we can't do anything, like detaching driver from the device.)
> and
> clock is disabled?

Ah, I understand your point. I was assuming that the driver could later
be detached after uniphier_uart_resume() failed, leaving the clock disabled.

If that sequence cannot happen after a failed system resume, then my concern
doesn't apply. Thanks for pointing this out.

In that case, I have no further concerns about the use of
devm_clk_get_enabled() here.

Thank you,

---
Best Regards
Kunihiko Hayashi

