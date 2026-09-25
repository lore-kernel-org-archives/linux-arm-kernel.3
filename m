Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6403DC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHp1U1kutG6t+AyptcXmG49o3LX2wmq5MBgrLhVKgvw=; b=dBYzxK/B0qWGl1tskTNnqA1Fjj
	3ZxwjYMB0dis/oe8VskLf+4qT5sfzvv7k+X3QRFJ8Pd7L8/Bhqn0PDRkNZ9NVlUKUCEKZ1gYKlWm+
	1UGFuuuaWnXVE1IbpuY0qkQeQ06heN5qHiz+HE3eqQUy7usWRmcZVIxL57zDwYcDZjtOv0uXv7WPi
	/lzf+UCSK7qzL4qohPldbOtTtvaVZz22WX86qU+SjHNjWtvAewlh5bm/RaKGC0xib9lgdjFihA8F+
	/AjQM2BWqbNbdZH/mTlVQ0PaINA/18tiUvyElPzJ9ziqTIobhDBK3hHGAW44JK+ASXLkH0Q2XUHq0
	jP9otF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4AK-0000000DCf0-3jDF;
	Fri, 25 Sep 2026 11:32:32 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4AE-0000000DCdy-1kvg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:32:28 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 25 Sep 2026 20:32:22 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 9C1BF20695D1;
	Fri, 25 Sep 2026 20:32:22 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Fri, 25 Sep 2026 20:32:22 +0900
Received: from [10.212.247.157] (unknown [10.212.247.157])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 2932A10A019;
	Fri, 25 Sep 2026 20:32:22 +0900 (JST)
Message-ID: <3ea1f574-ddb5-46a6-9bc1-7a8ea84c54bd@socionext.com>
Date: Fri, 25 Sep 2026 20:32:20 +0900
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
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <arUvJyvChXXcasSu@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_043226_584498_BD643C05 
X-CRM114-Status: GOOD (  22.31  )
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



On 2026/09/24 23:09, Andy Shevchenko wrote:
> On Thu, Sep 24, 2026 at 06:07:37PM +0900, Kunihiko Hayashi wrote:
>> On 2026/09/17 13:05, Malathi A wrote:
>>> uniphier_uart_probe() enables priv->clk by hand and is then
> responsible
>>> for disabling it again on every error path. It misses one: when
>>> uart_read_port_properties() fails the function returns directly,
> leaving
>>> the clock prepared and enabled. The neighbouring path, taken when
>>> serial8250_register_8250_port() fails, does call
> clk_disable_unprepare(),
>>> which shows the leak is an oversight rather than intent.
>>>
>>> Rather than adding another manual unwind, switch to
>>> devm_clk_get_enabled() so the clock is released by devres. That
> removes
>>> the error path entirely, along with the explicit disables in the
>>> register failure path and in uniphier_uart_remove().
>>>
>>> The clock is still disabled and re-enabled by hand across system
> sleep,
>>> which stays balanced: only SET_SYSTEM_SLEEP_PM_OPS is used, so the
>>> device cannot be unbound while suspended and devres always sees an
>>> enabled clock at detach.
> 
> ...
> 
>> I'm a bit concerned about the error path in uniphier_uart_resume().
>> The clock may have been disabled in uniphier_uart_suspend(), and
>> clk_prepare_enable() can fail when trying to enable it again.
>>
>> In that case, wouldn't devres try to disable an already disabled
>> clock on detach?
> 
> Isn't there is a guarantee that the .remove() is called with PM runtime on
> and
> get, meaning it's called with the enabled clock? But if not the case, we
> might
> use PM runtime force operations (resume and suspend in the respective
> cases.
> 

My concern was just the case where clk_prepare_enable() in the system
resume callback fails, leaving the clock disabled before devres cleanup.

This driver currently only uses SET_SYSTEM_SLEEP_PM_OPS(), so I wasn't
considering runtime PM here.

I don't have a strong opinion on whether runtime PM should be involved,
but if it guarantees that the clock is enabled before .remove(),
that would address my concern.

Thank you,

---
Best Regards
Kunihiko Hayashi

