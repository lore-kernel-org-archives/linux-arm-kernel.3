Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C296BF43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D9fB9YPS5bWDOTVeNiq3WO6cAOHLgc4jMTJXbNx0ZY=; b=43k4h7RnXtyIOTJWYJtPdxTDd3
	ICXkjHiYIawZNTPnGUNSEAYhRoEBB1KXDPCB2s9LGBZ6eIknRceLYnwa35jCptz5eMphD5TFgTBiZ
	nlW/w8qv+9/aGunkLdHxf0hKMn4JGeQ+G8hT6iTQHvSfsyzQf0Dy4MHMPnaEVZ9fPAszxOjDDqmty
	wgH5HBUnOlUb271OXFHVcYxqPouL0p+1/aIGs1qZ5ZewIbkz6G7kDVVCwGDaP/V4awp2xaSAQ3CCg
	GLex10K7SHYrQonks2mkq2y2WeQ1/4WRkxleA7OoHdF33My+FiBh02sqoKPDrO35CqXGsk0CH6caS
	XJHc+2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgUQ-00000003ucw-0ChO;
	Fri, 17 Apr 2026 10:31:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgUO-00000003uby-0wZV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 10:31:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so366874f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776421914; x=1777026714; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0D9fB9YPS5bWDOTVeNiq3WO6cAOHLgc4jMTJXbNx0ZY=;
        b=HfpbT4m7XI8MyjvYrsaemiNKw6wrBUcU9LczP3pzmLhvQ8TUsgxIlZf7qz89y59rMR
         dE9PhJCszvKLaOf+cb4p3DPlohyc11/c83FIat80X6judj5vooDC1GG6g8ecU9H7cItT
         VRsTVNi4/3GZZaUdP2ToMXBd1b1jdeHVqc6zKFENeTs4Y6tJKIgpG6kT8oqY/7W0QN9E
         dqMSKDFlN7AQY3ehZTDDAlaPzmVgQir/iEcUKQG6ttM5VAyZhRKLIJel0R5ZkVutHzVM
         eXdtaAfiuBCoo8JNjiE/xhVX5XJMyzcdVhloQJG+ArWaKq/KY0DmWx+rQ99139SAAo3z
         VOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776421914; x=1777026714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D9fB9YPS5bWDOTVeNiq3WO6cAOHLgc4jMTJXbNx0ZY=;
        b=mDnplztcdNzcM4GUvKOnMkb0ZEhQJMyI+UWUiJeF5doPQ3egcYiAGIBkUl81E2Nuny
         r32CaKSRVjoNsf2wPPz74tviSXXoTbFCsgZJbF9kYqtrChnPdQRLhenm9AiLEC7gggpq
         nq3T/HA0WXmtuuDNJrrmven1M006lWrSDplyxZrfQMZy9qMkGkPFfv5cs7KrCZxo0HJd
         CWE5VvR7GE6+28gNzDH+zJJKlM/PCoY8pzU61c+QhjmgBtgeUYzs/knVFVLDMM7I1DWm
         ITw/fas055E0b8ndFMmUcgE1YJHQbH7EWNT61M5FONMYZxUu3eOE0lc8nhfzeqO4jL5G
         V2IQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NZTwTfoRA0sXDTIDLJ2DCoqwyzVKkl0Axnx7cmR/UGs+o9JWQ7+jaUQRv6SwLjxc9P+SU3Qs6l1a/nXVm20EL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyauo/mvgdgNn2tzOH7ZlqstcDxor91+WSrP3oqZroupClBq1hL
	5TFa2RzF4SODewOEHONh8wqw6FPDsYkh7Vli1dU8jv+8xhwOy7Nwx4OXDJWnFA==
X-Gm-Gg: AeBDiesaf9x2MmeYz2kXhcL8vxtkHRXzEWrHRAPGBRPRDBnzCaKINNdXDXWi66bbmlp
	yZ3eJG82dgPL4acmg1VAjMLf0OYeELsoaANutOOk4bAeAPMJeCpjHJ40s84hZxfLF5LLISnQevm
	KoTXNqkThapO7fFoYIlsSr73QJJwTYsNTj3M64r6sCV6vf74CRYCQvi2+ZgBOEO4gjXYxSxJs2F
	wHR27y1edwmGWHxSnY0l3tBza9pW0HJIMBS1DUxfTVmOvOqLvi3Bmy3jIlbll8ZO7zjYokR4XZb
	GcrG/BqS2HdpmN6WcgKtqygzPs7X7Q5drMhDFtqh28GWXKcxB7KYuG5ihW0upA5xVvRe0FdtQXT
	n+yk72WXs95/eLpnACg2h9w3TLWvuGO+/QyB0m9FHytE8ei4A7cTLIuPyTOsm1QWJSMgAru2YCQ
	5T1P7zrq9W0rKRi6RLR7zi1Ji4VlwimslZbR3pdMkCfMu5lOU=
X-Received: by 2002:a05:6000:22c5:b0:43d:6fb7:fedb with SMTP id ffacd0b85a97d-43fe3e1645emr3218314f8f.36.1776421913626;
        Fri, 17 Apr 2026 03:31:53 -0700 (PDT)
Received: from [192.168.1.169] ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46898sm3395465f8f.27.2026.04.17.03.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 03:31:53 -0700 (PDT)
Message-ID: <26cd0656-ca76-4cb7-9f1e-b8c042a7e2cb@gmail.com>
Date: Fri, 17 Apr 2026 13:31:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: mxs-auart: Compare the return value of
 gpiod_get_direction against GPIO_LINE_DIRECTION_IN
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260416083254.1798-1-zlatistiv@gmail.com>
 <aeHt3c9Fqp6-WdLV@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
In-Reply-To: <aeHt3c9Fqp6-WdLV@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_033156_282824_782A91B9 
X-CRM114-Status: GOOD (  16.67  )
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



On 4/17/26 11:22 AM, Frank Li wrote:
> On Thu, Apr 16, 2026 at 11:32:54AM +0300, Nikola Z. Ivanov wrote:
>
> subjust suggest change to
>
> Replace hardcode 1 with predefined macro GPIO_LINE_DIRECTION_IN
>
> Frank
Hello,

I suppose you are suggesting a subject change, in that case I will send v2.
Also I can see that automated code review notes that this will not build
on greg's tty tree as 7.0 is not yet merged into it. I will wait for 
that to happen
before mailing v2.

BR,
Nikola
>
>> The GPIO_LINE_DIRECTION_* definitions have just recently been exposed to
>> gpio consumers.h by breaking them out in a separate defs.h file.
>>
>> Use this to validate the gpio direction instead of the hard-coded literal.
>>
>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
>> ---
>>   drivers/tty/serial/mxs-auart.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
>> index cc65c9fb6446..6c6df4d5c21f 100644
>> --- a/drivers/tty/serial/mxs-auart.c
>> +++ b/drivers/tty/serial/mxs-auart.c
>> @@ -1519,7 +1519,7 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
>>
>>   	for (i = 0; i < UART_GPIO_MAX; i++) {
>>   		gpiod = mctrl_gpio_to_gpiod(s->gpios, i);
>> -		if (gpiod && (gpiod_get_direction(gpiod) == 1))
>> +		if (gpiod && (gpiod_get_direction(gpiod) == GPIO_LINE_DIRECTION_IN))
>>   			s->gpio_irq[i] = gpiod_to_irq(gpiod);
>>   		else
>>   			s->gpio_irq[i] = -EINVAL;
>> --
>> 2.53.0
>>


