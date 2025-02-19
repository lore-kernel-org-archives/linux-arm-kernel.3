Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A167C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 03:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIaBkE8+UmoWwYLNXAVzpAMzNdqrJST2j8vQ4BHyKd0=; b=Gktevw29zQwqsPb3BslEVigKMW
	MYxDDFU1chFzwqWnhmWf3YlOkTRAeYDI230ssz9D0JYCjx9o0+YHv9gHeFkSnbVY9fV+QutZckYrA
	7CbPadT5q2RHeRe8NJNpZ57T891WsWDvObIBRajUV2axQoFsYCu24/FGJNxlKeHkyoWu68Oj8LSnz
	tWzqtMycWK/BM9GaEUfI+Euew52kY1GMWdrTd1EHVGLtoUZosWGefS1N6ymGicLjdeBKvaQU1gvYZ
	shbUA3vfhcbdNCXDrkiMhOiYxwOPlcXqQylJZ1sJdAeIGu/a84EpcnU4uf/5kFZ5tC7ppeS0vH8GO
	DzxxVH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkazI-0000000AmBO-1TqN;
	Wed, 19 Feb 2025 03:43:04 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkaxn-0000000Am2M-2wqy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 03:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739936486; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hIaBkE8+UmoWwYLNXAVzpAMzNdqrJST2j8vQ4BHyKd0=;
	b=j3dkGUXo7CT6LjGxLhhCRy4Ynzk94hlBOyqH5ZI2mYI9VydV9krV9Rlo0wMOtG0ppujhTvXuLsFBL5BN3mSTUqrGcks115sheG4WoQHGjoz27bvbHX4dALVCKdw0aBD1R5/rgLEJ8hExglEmpzFtBlb5xFB/3O75jQqy9Q/4LtY=
Received: from 30.221.144.226(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPnjerv_1739936484 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Feb 2025 11:41:24 +0800
Message-ID: <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
Date: Wed, 19 Feb 2025 11:41:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_194132_546194_778F0BDD 
X-CRM114-Status: GOOD (  21.99  )
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

Hi Guenter,

Thanks for your comments.

On 2025/2/18 13:33, Guenter Roeck wrote:
> On 2/17/25 19:16, Heyi Guo wrote:
>> Aspeed watchdog uses counting down logic, so the value set to register
>> should be the value of subtracting pretimeout from total timeout.
>>
>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>
>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>> Cc: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/watchdog/aspeed_wdt.c 
>> b/drivers/watchdog/aspeed_wdt.c
>> index b4773a6aaf8c..520d8aba12a5 100644
>> --- a/drivers/watchdog/aspeed_wdt.c
>> +++ b/drivers/watchdog/aspeed_wdt.c
>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct 
>> watchdog_device *wdd,
>>       u32 actual = pretimeout * WDT_RATE_1MHZ;
>>       u32 s = wdt->cfg->irq_shift;
>>       u32 m = wdt->cfg->irq_mask;
>> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>> +
>
> It is unusual to use a register value here and not the configured timeout
> value. I would have assumed that pretimeout is compared against 
> wdt->timout,
> not against the register value, and that the multiplication with 
> WDT_RATE_1MHZ
> is done after validation. This needs an explanation.
It was supposed to be a straight-forward way to check if the pretimeout 
value is supported by the hardware. I can change to wdt->timeout if it 
is better.

Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we 
restrict the pretimeout to be larger than wdt->timeout - 
max_hw_heartbeat_ms  / 2? For the watchdog_kworker works in 
max_hw_heartbeat_ms  / 2 interval, pretimeout event may be triggered 
unexpected when watchdog is not pinged in (max_hw_heartbeat_ms - 
(timeout - pretimeout)).

>
>> +    if (actual >= reload)
>> +        return -EINVAL;
>> +
>
> On top of that, you'll also need to explain why 
> watchdog_pretimeout_invalid()
> and with it the validation in watchdog_set_pretimeout() does not work 
> for this
> watchdog and why this extra validation is necessary.

watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, 
but we can't determine the hardware pretimeout value if timeout == 0 here.

Thanks,

Heyi

>
> Guenter
>
>> +    /* watchdog timer is counting down */
>> +    actual = reload - actual;
>>         wdd->pretimeout = pretimeout;
>>       wdt->ctrl &= ~m;

