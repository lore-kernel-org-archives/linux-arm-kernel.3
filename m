Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E83CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnO5IioVzWSYwRbqhkh2raHko5bjhTUierG2nULceM0=; b=ItCWMsncGSTR6VYzEPnHEJCwok
	nkCxOm3W/lT+1+60PVlctvkYC32axj8GhXNv0wm7lb2IeVQp6g+bDKQfIvWLeDfWXJ4dI57SWdv0q
	YmnZmUAinVg85aTnGf9VP8FyIWOlA+WKNb0CPwRInQNs5qhmx5xfR4xYWUv/Ddm6OcYgua/pprMw3
	TOlfiWd5SQ/JleWxKhfCB4tRUi5yGqDdGM2EUMTaOAgJNo1VF/PHijN4OtKjRZn6wcfv83/hKD5Ju
	0eKGXzeXYsBk4YXX61Oukh9/hnhH8eW/7xaVAD8Q8iq59MKfV8A7rfqN9cNu9U1g9EKHNq+FJjXKo
	j4BrIogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJhE-0000000BBZk-07GR;
	Sat, 16 May 2026 18:25:08 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJh7-0000000BBYO-2tS2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:25:06 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2f0ad52830cso1112372eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778955901; x=1779560701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gnO5IioVzWSYwRbqhkh2raHko5bjhTUierG2nULceM0=;
        b=REeFayx661pa7KH9HlqlC9aqJZ2Rs3dtWfeTDIMCLXMsLVtB8Sz2QT3adl627bc2gO
         NF3oVTUPwGuennPEHBYeA3Nw5uPyRKF6k7qI6VVy5sSfFetDx4Yz/5cA1pLZdZYiMvVk
         L88NuXc6Vq3MvT1jU4i5VTp6vT5KJ0bXn8YAdIFhvgfHCk5bkQs8t4GuWciId/nTtwQM
         E3dwYjexEVKZCyPoTfIeQ26/RUMBvhhPfNOmdzaOhooppVbnCwS6fZAgfYSqPNg6w/B1
         W6jP/SFSvfg+qUdBmo1W1zzWqesTUsBdotSEQFPItOlQdH9LOfZ61yY51lH1pSpXnpLJ
         SILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778955901; x=1779560701;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnO5IioVzWSYwRbqhkh2raHko5bjhTUierG2nULceM0=;
        b=itwt7C69WQ0p/Fr9E5TiJT7JjzRolEgYlCKBNZKedHZfYJ1Kw3uAWaMGWu2GNXySyh
         Zwd6bxpAMCPjwTFI53xst1pV4EDGqCLMSLpdv+VUg7GFWAUsWg9HQi9Zm7O6Dad4+kp0
         CZIjZb2df4BaKgIeUs55iay3nEnZ+g/szSn6aJmrvlbq8f2f40neWFGQoVfOc/e/qQK/
         rd+jdYQtxiV/INzKR3K4FHYyh2GPHb6vBikxmMEKMAj03JwTS8eZEasMeMwDcJN3ZRKZ
         Txe5PVkhMurpWAIKL9649He6xicS1Sfk3SyWWH0W2SdYIA9fXfhaSJ8F/szUAMCsqJdV
         qIfA==
X-Forwarded-Encrypted: i=1; AFNElJ8c4/icq0/uW4lX2QRdO8+jnAyEOjl+9zHHvR6BvXNI8nlvZFFoMiomtHEwxXItSfKYuN+syzGlNozv+b9XsCIa@lists.infradead.org
X-Gm-Message-State: AOJu0YwI3kVrx6iSENOJc7eCsz6TgqaqwHNJ+99qc0X9maFASNpXTGt+
	V1Nxuxx4gmAH2iiBN5FMVtu+25O6rUv8JHYvALkSVoe4yYmKVMA8va+d
X-Gm-Gg: Acq92OH8O7THGvM9Fh24bxwQfduT1wuPfGwJcUkcVh0LF6hC4a9apxnJ5oP8YR+C61Y
	QFNBY6Jtw7poCrgTo5qwWva9wQz5XpQ7tQkp8U/5Fda8LU+d/7twfGzLmP0rjME7yTvumiFSqTl
	DxF/UcfuXNfQ73IzEbMGc4ayDcNcvRPXtngtOIjFCEqdy6UvOIteWsMfdydZNHKjbaSC72ZVrP/
	MbHe9oDctxGrtvl/BA/+0knTxJ6JY/6eVOQ85NgxgkeoccfyzojNr2sTEXTEcOjv4l7E30qjXLr
	RDkR+PorJy4xm187vVW7pmXd6M1hpj0rk8r+Pd8E4lgr1uI6UWFHMithp/6XtJAO+DXZlQUmOYv
	pydv3QlEbqnRO6hZYjvi8gWML2/6FvgjDxWkBtMuLuEBv6vzATn7h3K7KELxyr/SHd1xX/MYDiX
	9ulK1MGzPlO50V9jHrucEePdcMj16rKBDEcdY4Pk5k6wwIqh1nOxK+rSB4JAFc1V1zJJfU+q+X
X-Received: by 2002:a05:7301:608a:b0:2fc:9aa8:83da with SMTP id 5a478bee46e88-303986a03d0mr4032865eec.29.1778955900702;
        Sat, 16 May 2026 11:25:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm10300284eec.29.2026.05.16.11.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 11:25:00 -0700 (PDT)
Message-ID: <68c963ab-042f-496b-ae38-9f9584b3c427@roeck-us.net>
Date: Sat, 16 May 2026 11:24:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: raspberrypi: Add voltage input support
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516164407.25255-2-chakrabortyshubham66@gmail.com>
 <ff7bf6f8-0090-4aea-ba60-3477cc81a458@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ff7bf6f8-0090-4aea-ba60-3477cc81a458@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_112501_769194_7C4B5FC0 
X-CRM114-Status: GOOD (  32.57  )
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

On 5/16/26 10:13, Guenter Roeck wrote:
> On 5/16/26 09:44, Shubham Chakraborty wrote:
>> Extend the raspberrypi-hwmon driver to expose firmware-provided
>> voltage measurements through the hwmon subsystem.
>>
>> The driver now exports the following voltage inputs:
>>
>>    - in0_input (core)
>>    - in1_input (sdram_c)
>>    - in2_input (sdram_i)
>>    - in3_input (sdram_p)
>>
>> Voltage values returned by firmware are converted from microvolts
>> to millivolts as expected by the hwmon subsystem.
>>
>> The existing undervoltage sticky alarm handling is preserved and
>> associated with the first voltage channel.
>>
>> Tested in -
>> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>>    Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
>>
>> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> 
> I wasn't copied on patch 1/2, so I have no idea what is in there
> and how it is related to this patch. Either way it seems unlikely that
> the new functionality is supported by all versions of Raspberry Pi supported
> by this driver. Just returning an error when the user tries to read a sensor
> that is not supported is unacceptable. This needs either evidence that the
> sensors are supported by all board variants and firmware versions supported
> by this driver, or the is_visible function needs to selectively enable the
> supported sensors.
> 
>> ---
>>   drivers/hwmon/raspberrypi-hwmon.c | 112 +++++++++++++++++++++++++++++-
> 
> Documentation/hwmon/raspberrypi-hwmon.rst needs to be updated as well.
> 
>>   1 file changed, 109 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
>> index a2938881ccd2..c73a970db025 100644
>> --- a/drivers/hwmon/raspberrypi-hwmon.c
>> +++ b/drivers/hwmon/raspberrypi-hwmon.c
>> @@ -5,6 +5,7 @@
>>    * Based on firmware/raspberrypi.c by Noralf Trønnes
>>    *
>>    * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
>> + * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>>    */
>>   #include <linux/device.h>
>>   #include <linux/devm-helpers.h>
>> @@ -18,6 +19,11 @@
>>   #define UNDERVOLTAGE_STICKY_BIT    BIT(16)
>> +struct rpi_firmware_get_value {
>> +    __le32 id;
>> +    __le32 val;
>> +} __packed;
>> +

More feedback:

Why define this here but RPI_FIRMWARE_VOLT_ID_CORE etc. in the
firmware API include file ? struct rpi_firmware_clk_rate_request
is quite similar and defined (and documented) in the include file.

Also, the name is quite generic, suggesting a common structure.
rpi_firmware_clk_rate_request, as used for the clock, is much more
specific. I would suggest to either use a single structure for all
requests or clarify that this is for voltages only (i.e., name the
structure and the returned value appropriately).

Last but not least, please send both patches to the same set of people
and mailing lists.

Thanks,
Guenter

>>   struct rpi_hwmon_data {
>>       struct device *hwmon_dev;
>>       struct rpi_firmware *fw;
>> @@ -56,6 +62,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
>>       hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
>>   }
>> +static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
>> +                    long *val)
>> +{
>> +    struct rpi_firmware_get_value packet;
>> +    int ret;
>> +
>> +    packet.id = cpu_to_le32(id);
>> +    packet.val = 0;
>> +    ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
>> +                    &packet, sizeof(packet));
>> +    if (ret)
>> +        return ret;
>> +
>> +    *val = le32_to_cpu(packet.val) / 1000;
>> +    return 0;
>> +}
>> +
>>   static void get_values_poll(struct work_struct *work)
>>   {
>>       struct rpi_hwmon_data *data;
>> @@ -77,19 +100,101 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
>>   {
>>       struct rpi_hwmon_data *data = dev_get_drvdata(dev);
>> -    *val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
>> +    if (type == hwmon_in) {
>> +        switch (attr) {
>> +        case hwmon_in_input:
>> +            switch (channel) {
>> +            case 0:
>> +                return rpi_firmware_get_voltage(data,
>> +                        RPI_FIRMWARE_VOLT_ID_CORE,
>> +                        val);
>> +            case 1:
>> +                return rpi_firmware_get_voltage(data,
>> +                        RPI_FIRMWARE_VOLT_ID_SDRAM_C,
>> +                        val);
>> +            case 2:
>> +                return rpi_firmware_get_voltage(data,
>> +                        RPI_FIRMWARE_VOLT_ID_SDRAM_I,
>> +                        val);
>> +            case 3:
>> +                return rpi_firmware_get_voltage(data,
>> +                        RPI_FIRMWARE_VOLT_ID_SDRAM_P,
>> +                        val);
>> +            default:
>> +                return -EOPNOTSUPP;
>> +            }
>> +        case hwmon_in_lcrit_alarm:
>> +            if (channel == 0) {
>> +                *val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
>> +                return 0;
>> +            }
>> +            return -EOPNOTSUPP;
>> +        default:
>> +            return -EOPNOTSUPP;
>> +        }
>> +    }
>> +
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static int rpi_read_string(struct device *dev, enum hwmon_sensor_types type,
>> +               u32 attr, int channel, const char **str)
>> +{
>> +    if (type == hwmon_in && attr == hwmon_in_label) {
>> +        switch (channel) {
>> +        case 0:
>> +            *str = "core";
>> +            return 0;
>> +        case 1:
>> +            *str = "sdram_c";
>> +            return 0;
>> +        case 2:
>> +            *str = "sdram_i";
>> +            return 0;
>> +        case 3:
>> +            *str = "sdram_p";
>> +            return 0;
>> +        default:
>> +            return -EOPNOTSUPP;
>> +        }
> 
> This can be implemented as string array.
> 
>> +    }
>> +
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
>> +                  u32 attr, int channel)
>> +{
>> +    if (type == hwmon_in) {
>> +        switch (attr) {
>> +        case hwmon_in_input:
>> +        case hwmon_in_label:
>> +            return 0444;
>> +        case hwmon_in_lcrit_alarm:
>> +            if (channel == 0)
>> +                return 0444;
>> +            return 0;
>> +        default:
>> +            return 0;
>> +        }
>> +    }
>> +
>>       return 0;
>>   }
>>   static const struct hwmon_channel_info * const rpi_info[] = {
>>       HWMON_CHANNEL_INFO(in,
>> -               HWMON_I_LCRIT_ALARM),
>> +               HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_LCRIT_ALARM,
>> +               HWMON_I_INPUT | HWMON_I_LABEL,
>> +               HWMON_I_INPUT | HWMON_I_LABEL,
>> +               HWMON_I_INPUT | HWMON_I_LABEL),
>>       NULL
>>   };
>>   static const struct hwmon_ops rpi_hwmon_ops = {
>> -    .visible = 0444,
>> +    .is_visible = rpi_is_visible,
>>       .read = rpi_read,
>> +    .read_string = rpi_read_string,
>>   };
>>   static const struct hwmon_chip_info rpi_chip_info = {
>> @@ -159,6 +264,7 @@ static struct platform_driver rpi_hwmon_driver = {
>>   module_platform_driver(rpi_hwmon_driver);
>>   MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
>> +MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
>>   MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
>>   MODULE_LICENSE("GPL v2");
>>   MODULE_ALIAS("platform:raspberrypi-hwmon");
> 
> 


