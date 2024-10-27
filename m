Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF152D13577
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L5vZv/8tG5PaUhVaI4xD57di04WpCuQf7q6CmAL9QM=; b=dSUe9Koeyy8boAL9LAE37Eapb2
	ZnzjwJyZ4hfP1zQOj8Sqb1R9Xsdj1BWGXQ+N87Hb0bBVLEImV956zVxKGDHciIXnY8lr0elJYwICm
	N1o/ZIJkPiKfO68117Cpvu4yiwUrSfIxDXI4KiVvAHcyllugwRPxz6HtpiyDQE2lGxjswgA/pcpZ1
	JiI7+lWa14r5WRuBndqHUGiMxOHtWBJljubzLwjcnBTvyBn40omn4j9v7rV5CipWllI6/QZepIOiB
	8Cq3xoQFuwzzpWuczRM4OdqJnkhMFYFinBMQmCm18AdVC1Eececlves5tEJ43ggkENmm8ZmoTJHgn
	pFSFkrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t57C4-00000008c1q-49zy;
	Sun, 27 Oct 2024 17:36:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t57AV-00000008by0-0AyN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 17:35:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c7edf2872so33348095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 10:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730050510; x=1730655310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6L5vZv/8tG5PaUhVaI4xD57di04WpCuQf7q6CmAL9QM=;
        b=Zp/r9KNTX8drqlOJIioSd0eJQ53ewa7/e8CYYjju5ouMd+nQ8Wqc4nzGSGZ+wKyF5E
         3pGTWFdhhy6EbLx5T/JAwuXTQbnhsdUlpklP2p9L/M1xzgUYwwfAbKFlAV7Pu9UfcLy9
         BR9uoERBZvJykm/2GQz4SvBMzuh9EhMr3qCyRnczst2cC15TeSwl/CGEoI8YOBPvPxbq
         macPPfphNg6LfFfSqPgKUrNrmFGhR/xO8LNdVSGJYytOhewMJuaWL2gmyawfTcBYq00e
         6ofBgbJyjueQ/DzDwfgd+kZuj6FsCbKJhjJPsf/DPdAwgiZgd85Ey+f4pBZkLWL50rbI
         MzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730050510; x=1730655310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L5vZv/8tG5PaUhVaI4xD57di04WpCuQf7q6CmAL9QM=;
        b=LNVtRt6mXRwkZWV/t5qE2Nx5QeIOdUAdy01Lc3bLfmBxMV8bflK8f4eJKaxoYJTBg+
         UbrlKNdm0hhEmF0msaud+9adDdKLXCi3iUmN5319cXJOw/TrJK6KLFbrLAPn8z+bL0pQ
         DERUS7q6Rnxj8HlG7K8sl4/u5/vh/kinVhWomggdT0Qy2oflu3reCC+ejqOTqzLZ1VGj
         62DVn7z+uqLzLuM6qobUdUg/AwcfmQWXCdQGZCdD/u9rowEqw3h/rjDhNZ4zEespr6O1
         fxLNtmdX/wLhYR2ibcxSNmvHrK5/4+kkK+Pi7/N+3231sNHgK7ximpaHQnYljW1NrUT+
         VLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkZpBQfa3mD/9947ZsiD9Nx9I77GjVlz3qRw6Zc8zrBNzMKq3QDl8iun7CcFv2kdwoVIbkiS4pmzlMU+YbQZEv@lists.infradead.org
X-Gm-Message-State: AOJu0YyoLsYcswQq+KqahlRHMn7/iMuCmVz/fBP4yM5qaEo9ey/ZbCTC
	N2t9pmgagTpGReB9yJTFzz78vCX0pEkBZxYA5lQ2qFb8x9dlsWHH
X-Google-Smtp-Source: AGHT+IFmR3/WUvd3TgBdFSXUkbRpBeyyJ2poUKLl3utOTlFV9TYgxWMYR6QMrhXLy1cYQ59RiMrpmw==
X-Received: by 2002:a17:902:f542:b0:20c:b6cf:f465 with SMTP id d9443c01a7336-210c593787amr88101125ad.6.1730050509837;
        Sun, 27 Oct 2024 10:35:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02ebc1sm37582945ad.216.2024.10.27.10.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 10:35:08 -0700 (PDT)
Message-ID: <016f25b9-58ec-4b51-81d7-4a573a4cc18a@roeck-us.net>
Date: Sun, 27 Oct 2024 10:35:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: imx7ulp_wdt: Add TOVAL range check
To: Stefan Wahren <wahrenst@gmx.net>, Alice Guo <alice.guo@nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241027105323.93699-1-wahrenst@gmx.net>
 <20241027105323.93699-3-wahrenst@gmx.net>
 <33721072-6ff4-45bd-b20f-cc0a213e3aae@roeck-us.net>
 <686d128c-ce02-421e-9af5-6c418e82071d@gmx.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <686d128c-ce02-421e-9af5-6c418e82071d@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_103511_112471_CE874E09 
X-CRM114-Status: GOOD (  18.47  )
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

On 10/27/24 08:54, Stefan Wahren wrote:
> Am 27.10.24 um 14:36 schrieb Guenter Roeck:
>> On 10/27/24 03:53, Stefan Wahren wrote:
>>> The WDOG Timeout Value (TOVAL) is a 16 bit value, which is stored
>>> at the beginning of a 32 bit register. So add a range check to
>>> prevent writing in the reserved register area.
>>>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>>>   drivers/watchdog/imx7ulp_wdt.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/imx7ulp_wdt.c
>>> b/drivers/watchdog/imx7ulp_wdt.c
>>> index 0f92d2217088..a7574f9c9150 100644
>>> --- a/drivers/watchdog/imx7ulp_wdt.c
>>> +++ b/drivers/watchdog/imx7ulp_wdt.c
>>> @@ -48,6 +48,8 @@
>>>
>>>   #define RETRY_MAX 5
>>>
>>> +#define TOVAL_MAX    0xFFFF
>>> +
>>>   static bool nowayout = WATCHDOG_NOWAYOUT;
>>>   module_param(nowayout, bool, 0000);
>>>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started
>>> (default="
>>> @@ -192,6 +194,9 @@ static int imx7ulp_wdt_set_timeout(struct
>>> watchdog_device *wdog,
>>>       int ret;
>>>       u32 loop = RETRY_MAX;
>>>
>>> +    if (toval > TOVAL_MAX)
>>> +        return -EINVAL;
>>> +
>>
>> The whole idea of having max_timeout in struct watchdog_device is to
>> avoid the need
>> for this check. max_timeout should be set to 0xffff /
>> wdt->hw->wdog_clock_rate.
>> It is currently set to 128. With wdt->hw->wdog_clock_rate set to
>> either 125 or 1000,
>> it can indeed overflow. However, checking the value above is wrong.
>> max_timeout should
>> be initialized correctly instead.
>>
>> Even better would be to set max_hw_heartbeat_ms and let the watchdog
>> core handle
>> larger timeouts.
> It's funny because I tried this on a i.MX93 board but it didn't work for
> me. But I must confess that I didn't spend much time in the investigation.

I can't test it, but something like the diff below should do.

Guenter

---
diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 0f13a3053357..e672d27af63e 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -187,11 +187,16 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
                                    unsigned int timeout)
  {
         struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
-       u32 toval = wdt->hw->wdog_clock_rate * timeout;
+       u32 toval;
         u32 val;
         int ret;
         u32 loop = RETRY_MAX;

+       if (timeout > 0xffff / wdt->hw->wdog_clock_rate)
+               toval = 0xffff;
+       else
+               toval = wdt->hw->wdog_clock_rate * timeout;
+
         do {
                 ret = _imx7ulp_wdt_set_timeout(wdt, toval);
                 val = readl(wdt->base + WDOG_TOVAL);
@@ -338,7 +343,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
         wdog->info = &imx7ulp_wdt_info;
         wdog->ops = &imx7ulp_wdt_ops;
         wdog->min_timeout = 1;
-       wdog->max_timeout = MAX_TIMEOUT;
         wdog->parent = dev;
         wdog->timeout = DEFAULT_TIMEOUT;

@@ -348,6 +352,7 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
         watchdog_set_drvdata(wdog, imx7ulp_wdt);

         imx7ulp_wdt->hw = of_device_get_match_data(dev);
+       wdog->max_hw_heartbeat_ms = 0xffff * 1000 / imx7ulp_wdt->hw->wdog_clock_rate;
         ret = imx7ulp_wdt_init(imx7ulp_wdt, wdog->timeout * imx7ulp_wdt->hw->wdog_clock_rate);
         if (ret)
                 return ret;


