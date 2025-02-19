Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F229FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 06:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/jQax5rnvlh2BbJC5kEw9SnvVj7TrlZC5/fP2OvErs=; b=BSbfhaozYBAcQDbme87V5v7F05
	5elNpsDGFHAhDOqT5P6ewMk49+xAfS3d08HF8hba7+B3IEXoQIh2tolLX0O69KrO8qykHJxRZGWS3
	GUFFDvqCYiMpU4INk8dVXjywsNcyFxkwQF5k8ZGsSTnNK+n/zXdIGsGDn17sLR71lRqpw/bA/NjyU
	CF7BFvim2P/ol++KIP5rPxQPDf9KHHEIvjJmuj/EGdGqDj6ylhhEskKnaHXPl/gg17IyYNkwu34JQ
	rupkihBRI7KyZHZWPmiHEZ6BX+ywwX0KHPYi8bnADERfgu0A8vFLe9eOPiJ4aOAXkc5Fu0fRGHLhc
	i+CEeiUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkduk-0000000B6VT-1aib;
	Wed, 19 Feb 2025 06:50:34 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkdtE-0000000B65k-2zVi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 06:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739947736; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6/jQax5rnvlh2BbJC5kEw9SnvVj7TrlZC5/fP2OvErs=;
	b=tquTWW5zM5CvnAsD02xwiTQzb0AermlWICxjaiplMNNSdrkx283k+FbnrIUHKXFve9WQe/vq0R+usYUg5i8mfSrMP5c0qZTT4+/nbj+G3tVXOYrtMuWOZGLiSr5ZMJABC3njS2cFhWnB89rS5ih2KcDOd2vv3sfyi835bvR8We0=
Received: from 30.221.144.226(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPoEUPx_1739947734 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Feb 2025 14:48:54 +0800
Message-ID: <0c5e1e72-f1c9-4ffc-853f-f094a6d7799c@linux.alibaba.com>
Date: Wed, 19 Feb 2025 14:48:53 +0800
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
 <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
 <e692263e-a390-4611-b629-2b9feca1883a@roeck-us.net>
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <e692263e-a390-4611-b629-2b9feca1883a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_224901_519039_FA8CC936 
X-CRM114-Status: GOOD (  23.42  )
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


On 2025/2/19 14:07, Guenter Roeck wrote:
> On 2/18/25 19:41, Heyi Guo wrote:
>> Hi Guenter,
>>
>> Thanks for your comments.
>>
>> On 2025/2/18 13:33, Guenter Roeck wrote:
>>> On 2/17/25 19:16, Heyi Guo wrote:
>>>> Aspeed watchdog uses counting down logic, so the value set to register
>>>> should be the value of subtracting pretimeout from total timeout.
>>>>
>>>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>>>
>>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>>>
>>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>> Cc: Joel Stanley <joel@jms.id.au>
>>>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>>>> Cc: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/watchdog/aspeed_wdt.c 
>>>> b/drivers/watchdog/aspeed_wdt.c
>>>> index b4773a6aaf8c..520d8aba12a5 100644
>>>> --- a/drivers/watchdog/aspeed_wdt.c
>>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct 
>>>> watchdog_device *wdd,
>>>>       u32 actual = pretimeout * WDT_RATE_1MHZ;
>>>>       u32 s = wdt->cfg->irq_shift;
>>>>       u32 m = wdt->cfg->irq_mask;
>>>> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>>>> +
>>>
>>> It is unusual to use a register value here and not the configured 
>>> timeout
>>> value. I would have assumed that pretimeout is compared against 
>>> wdt->timout,
>>> not against the register value, and that the multiplication with 
>>> WDT_RATE_1MHZ
>>> is done after validation. This needs an explanation.
>> It was supposed to be a straight-forward way to check if the 
>> pretimeout value is supported by the hardware. I can change to 
>> wdt->timeout if it is better.
>>
>> Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we 
>> restrict the pretimeout to be larger than wdt->timeout - 
>> max_hw_heartbeat_ms  / 2? For the watchdog_kworker works in 
>> max_hw_heartbeat_ms  / 2 interval, pretimeout event may be triggered 
>> unexpected when watchdog is not pinged in (max_hw_heartbeat_ms - 
>> (timeout - pretimeout)).
>>
>
> The kernel internal logic should handle that. If not, it needs to be 
> modified/fixed.
Do you mean the watchdog core should also handle the case in which 
pretimeout < wdt->timeout - max_hw_heartbeat_ms  / 2?
>
>>>
>>>> +    if (actual >= reload)
>>>> +        return -EINVAL;
>>>> +
>>>
>>> On top of that, you'll also need to explain why 
>>> watchdog_pretimeout_invalid()
>>> and with it the validation in watchdog_set_pretimeout() does not 
>>> work for this
>>> watchdog and why this extra validation is necessary.
>>
>> watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, 
>> but we can't determine the hardware pretimeout value if timeout == 0 
>> here.
>>
>
> Sorry, I don't understand what you mean. If watchdog_pretimeout_invalid()
> returns false if timeout == 0, aspeed_wdt_set_pretimeout() won't be 
> called.
> Why does that preclude depending on it ?

if timeout == 0, watchdog_pretimeout_invalid() returns false, so the 
code will go on to call wdd->ops->set_pretimeout().

static int watchdog_set_pretimeout(struct watchdog_device *wdd,
                    unsigned int timeout)
{
     int err = 0;

     if (!watchdog_have_pretimeout(wdd))
         return -EOPNOTSUPP;

     if (watchdog_pretimeout_invalid(wdd, timeout))
         return -EINVAL;

     if (wdd->ops->set_pretimeout && (wdd->info->options & 
WDIOF_PRETIMEOUT))
         err = wdd->ops->set_pretimeout(wdd, timeout);

>
> On a side note, I do wonder why the driver accepts a timeout value of 
> 0 seconds.

 From the code, it seems timeout == 0 / pretimeout == 0 will be 
considered as a turn off switch.

Thanks,

Heyi

>
> Guenter

