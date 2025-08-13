Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DD2C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ezPPApvQ2xGo1Tf2IGGI/q/jNbwVwsEJODPGA7ESnU=; b=4dEh8SSNY2DO9YorgZGQSp1XvD
	gNf36Nv6ZIGdzi8yHW8TaXYxmEBXCTxnVPplHKAI7zZ1QDgbejdLniWu+LUdb0fyz0OgRiDmaMtmq
	Xu/F/x8t8vwxG0iT7vUr6OFiei8aY05iHZzSjruRipVsf/IKD7hJnhpzH1fCeweNXpbHM6VMJPDe/
	io00rLTVgX7dG9pGgdBaaG5OvUzQMqfRInF/OSE9TjhuOMobji07iaahh6JEDLZ7F1GdC+HYXkcaK
	VH0asEF25nHHj3UTR/HdI75t61F/cZLmLWmlKlgdaOz8KFTYIPkViEUZJ8Du/8Sn2Op7NhWbRBHTw
	sdh9gOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtA-0000000E4YD-2mqI;
	Wed, 13 Aug 2025 14:55:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCoC-0000000DyCt-2w5e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:50:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-459ddf9019cso22096875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755096631; x=1755701431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ezPPApvQ2xGo1Tf2IGGI/q/jNbwVwsEJODPGA7ESnU=;
        b=ViVd+SaZLPgXLa8pOHZnTaFbFVBIkmpjRo6e1s1apLHrwzHXJ3xMFA5YtZrEgNd1sU
         xK77W5lV8W87rZwtM6mNQ8Scz63tw7M4czVrf0EpMcXU+3eEGyDZm/GFhj/tazy3zomV
         1UtheqlzfRchA79SroPmYQTvFyZjqObdjNZ10fbF4BVMdFC41/3QSEW57G9w7RnzSU0m
         GUiMEdldN+sf8N+dKPoB4sMQHzW5tHbW36M+ilzTFP1euFHbaWHp+alyxhG79WnGVULv
         qXNDCfg7Msw0gWmLa2GqAnglRt62Q1zKejvxXWv0B5bKco7hxJFYV+b+Vf58cK9UmneK
         1lPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755096631; x=1755701431;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ezPPApvQ2xGo1Tf2IGGI/q/jNbwVwsEJODPGA7ESnU=;
        b=pR3yfbnCKZ8S65PR1I4lRW2Zolb8orfTwvFGHAEmKON3HydX9PpvoMxflCosnDKxWC
         jPdjnBa4RZ55LAecWDMhVrDnvCkdLbxgz/FYkyEJGLJ6KGiL6S613BlSFUR7lJQiaR2k
         2G9gql4VifU+yVPY7jvte/RxkBBfmSFsfN+0ynhNPiYkAMabrFwvT0QKKFTl45txLQUj
         R7J1soQ9w1+SD4B3767QTNluYlhMtAL0BTe+kORut4Ixpl3Wrc0Oby06px/iuExra8/9
         2UzZphmG65gKJ7e9aV9y699t9euRaKa04vAfZowrUhMrLqEyxj4Kd9DUoISL7LmCFQAm
         wEUg==
X-Forwarded-Encrypted: i=1; AJvYcCW53dHkGEIaPyIwHfKjNSlmup+INafyN+Riheic+IWpTMCdH1CEaGNgsadnzBmKDLLPo7aDPnEcBy8EQQhWCxFi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh3gBbDbokvzkoAeXIJcMMzPaZ3q1Io5/tl3HpI5MCAjph0DRw
	rnscgw4+ym9zyS13VkUFFRa1fkN45zoDatI79xP9ChL88xtQ39dPxwt5
X-Gm-Gg: ASbGncuqB6WnPJnrF9hp4iJY8nKPVdgZ+kZ9NHgUb25/VbCz00roC5pe2qjJ9mlCxUW
	TmyIMq5O/sPG6F5UNCCvyMtUBeluB8FDoh/7KgbhZFNwgftAe2hu4xMMGGGKxzIKjks34vj07l1
	HyCT70d8UDC17IfiokVcTp0uiR0YAiueSTZ34o2DCxizpFjBE5U9Lfu5Qdb2As6/ZtvOhdPgwKa
	UiPt51qzYK6uf+5A0QZHlrDezlIh3Q9pxeAMX9DML4vt549JUoaezQvJt08oRzQW1dONfMs3Z3j
	Pq2qu0AYpXmenWTyA+Sj9ej8+pXX2GvXm3MMbMChTHSJcMrw5GGmLgr8av6yA/hWggVAWHUoJLe
	GiQQ3yRiUharCqWldSVsd+MIL83h7nItPZGOu0QEHnpOrKSd0na/CaUo8aLUS9EabRUsNW/GnYw
	==
X-Google-Smtp-Source: AGHT+IFJSSZ94OtT4ZHv+bwsJzRMHFPjwQlds7MccjDC0e78z0RxSH+Y9lq/9TY/OBkJJzrfnQpY0g==
X-Received: by 2002:a05:600c:a41:b0:456:191b:9e8d with SMTP id 5b1f17b1804b1-45a1aa66e72mr980515e9.11.1755096630808;
        Wed, 13 Aug 2025 07:50:30 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50b9e6sm6265605e9.6.2025.08.13.07.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 07:50:30 -0700 (PDT)
Message-ID: <2b106715-de6f-4455-a558-42eb3a95982b@gmail.com>
Date: Wed, 13 Aug 2025 16:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
 <4cd3efbd-4798-4f25-9440-879ee289d8ed@gmail.com>
 <aJyM3N9T4xI4Xo1G@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJyM3N9T4xI4Xo1G@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_075032_769632_4C7AEA4C 
X-CRM114-Status: GOOD (  16.05  )
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

2025. 08. 13. 15:02 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 13, 2025 at 12:13:26PM +0200, Gabor Juhos wrote:
>> 2025. 08. 11. 22:12 keltezéssel, Andy Shevchenko írta:
>>> On Mon, Aug 11, 2025 at 09:49:54PM +0200, Gabor Juhos wrote:
> 
> ...
> 
>>>> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
>>>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>>>
>>> I didn't get this SoB chain. Who is Imre here and what is his role in all this?
>>
>> Imre reviewed the patches before publishing those, but we were unsure about that
>> the Reviewed-by tag can be used when it is offered privately before the
>> publicaton, so we decided to use the SoB tag instead.
> 
> It's exactly what should have been done. As a such the SoB chain is confusing
> (taking into account the authorship of the patches).

Thanks for confirming!

> 
>> It can be changed to the Rewieved-by tag if that is applicable in this case.
> 
> Please do so.

Ok.

Regards,
Gabor

