Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E335CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WG/fOgOed7F+q/vykBWwKRqhGGU2/L6CsAzZkzcjHA=; b=p9aJzuk73fc8TwRNPJViQOvSLz
	8A+mPmHaB3NkiNs4y6gPgHqFYwacXG5vuNX936HCNfvAUml7X7zLIPFn82LwCLxxdkQSSMZ6WqhN6
	98XBTiBiUlTzZxMBU1eJsy8WKUJu/Xge0fOrm3lJS56CP4frZJTkuNZZvQC1SnMmeje/Ue/Cxc42M
	XSEhyuKtdxHbYMqldVcdfYOdrcdzODeyWQ7zgganyFg17qr4XpBqBc8AAubWuRmCem4KvfEg9lDqJ
	3A/zLfQgZnNT7+k1i6VbGJktCEnmYxqc49YXCFsAtU9fzh1lRcMBLXOx9Tc3K23c3miZpzZwAAS8l
	dU5zYj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFXr-0000000CfSg-3VUe;
	Wed, 10 Sep 2025 07:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFXq-0000000CfS7-38Me
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+WG/fOgOed7F+q/vykBWwKRqhGGU2/L6CsAzZkzcjHA=; b=gYxpk9FfDU/2Q9IKhEekiIug6S
	CpbrNbz7ULrGFQJHsVcUIJk2KJqk+eeoHkPxlc8B6dSehIBrpp/5WM5PqGZZ+FhFz/rZYMX41yMHA
	RcCjx0ubwXvupE7j4g7LRphIwzC0mM7bJooFqo2An27q5PG/GSPoxfUGJg8aH2P9sXrVYQw0isF/a
	A8VbFofmSMK4/VZ88nUQVbYaboxQY36nsIrsT05OHOYLmjf/4rrQOvfXG9RQAjtkHeCV/DNQb9WCs
	e/24eesgRX/GK/bqdI+0eeyifBLHvqzZ1b+9PUJyoeLC9VBxN8jCCyNNwxCQU0od/Ll19bK01Gz+M
	i0e4hfvw==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFXn-00000005mfT-2z5w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:47:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45ded619608so14278735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757490426; x=1758095226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WG/fOgOed7F+q/vykBWwKRqhGGU2/L6CsAzZkzcjHA=;
        b=ElBqt3hIvO6Pg5LZTTtKBfpCs34vdISXJYmQN4eWJ9raQua/0ldxg0TjhseGswfwDO
         6KMKZXOIRTtsssWmUMfzQcat/zUxySSQawFHtTjlJcitTgVNBNdsAGBq1E/pI3gGqv0H
         lm9lH+Hd9WF1kBr+j5SqBCmQAwvEHrcZ0Nd3jBV9hhHOE0uhsv4NWGNsquxflkJlRsC6
         tCQMHLBY0MsD2AtL+N7oG6SPbjwHdDqKiz3JGGZOCW/Kv/bM7bupe7o945cXo1YGBSfP
         i5qAOQrRkwx9bvO4LXEzHV8GUpll1HjMpbNbc5+NR3dDh+nj0KSuSWoYYPTC46pDD21s
         rMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757490426; x=1758095226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WG/fOgOed7F+q/vykBWwKRqhGGU2/L6CsAzZkzcjHA=;
        b=ZREuh1+ODkGgC0QbK6fG6effV8U9gJ1tZ4U7hbIGdvJGnRuXa0y+5/9U+Z15CjJ0wj
         eE+H+xkaeCX41UpO+nOohdF/BD38le0o9XrOi2VU2LCg+SETSxW7kEIYqdx1Q5dylZco
         K/8T7khCX5214WOUfUfI69mZoCHRWj9me0oQtkLlRXSnrLrmOCoym5lRIjeGZqrXM2RJ
         om9tAJn+nrRFvEGF8aZU57p2Jkqk97mbZ7zX8Ms6HcgwgEJ0tDmMMCH96B+XwTDgn0yF
         pb34AomCOAEM7fmI2pD91ERzO6xRKcfVfZ9+J8ll7GDNZ2rw6G5WjDmgEWgSrrgqFtpB
         bR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFmCov0qjQHOeBJyU7lzpShY2+XcdJG0wQysONFInHR3mRfK0KmZXLIeUCUriKSS4TOqd/odLEYMKL4DcZAUiM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3X8pxNrYKrIrzB0wHmkCz/jfKTxzbMXE5VE/bBx2bhZhEv6qi
	7jPtdaCVhF8SjNXhectf6RkPpbCh7D5tvd9YWed5GDdzfLS6cm59+JNW
X-Gm-Gg: ASbGncsQQIsyKNPmk7iOf2bV3RT1JDVkUoUO1MhRSgw1NlgzsitfZCAY1JkmbfYuz+c
	seZdmQGpbhL43Ai3txMyyC31/h8ukkt0Ru3EQgzAbpLS2pGVSHtA2Hd2n+WJf99FIXRajvKA/xe
	auF3P1WoaQ/JP6SG48d7e/82k5dMfZrLiHGP/M5qw/tuqXybtqfjWnmKir7CIkGbjUmyodtZIi8
	iovIivOrsBf2/hkUyHnvFe7fibkKpgqWVVQmto8R6qDqntvsKCI+0HtI1vvypimXUUeJvzWDGrc
	p5nAdQFsZiFCq1YQ4XoGPNXX8dhpVShGe+YrB+mhjKC1H14YQdRnBmxX64XHAIrVBIEweLS3Zgm
	0d+cZkow7FRBB4wlQv7D2D/tRyRVEnsjenOd6tLaELdUcNda/MHkEWXFN4cKbcOZlbNhVl9FbnE
	TOB/wbFKWVfIwttUJxog5RskAqt6lDDAsbPlzM1YepuA6SnTLw7PvPtI3HBwM+Vm1j4RsSr8+jX
	Q==
X-Google-Smtp-Source: AGHT+IHCQlyEGA4dQJ+eF6cYPq/TcQfhp+X5TSRzHZoqn+jcag/Ng+LaHLBRVKb0m1OSVaCN+kNKcA==
X-Received: by 2002:a05:600c:4f91:b0:45b:88d6:8db5 with SMTP id 5b1f17b1804b1-45ddde82fc0mr127441425e9.12.1757490425798;
        Wed, 10 Sep 2025 00:47:05 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef? (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net. [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df821f714sm17367435e9.16.2025.09.10.00.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 00:47:05 -0700 (PDT)
Message-ID: <19e664da-df4c-4bc0-84ce-41e4364f10bc@gmail.com>
Date: Wed, 10 Sep 2025 09:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/20] bus: firewall: move stm32_firewall header file
 in include folder
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
 <9a46c8a8-1d25-410c-9fa2-267eb4040390@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <9a46c8a8-1d25-410c-9fa2-267eb4040390@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084708_009979_3DACBBBB 
X-CRM114-Status: GOOD (  19.60  )
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

On 09/09/2025 14:25, Gatien CHEVALLIER wrote:
> 
> 
> On 9/9/25 12:12, Clément Le Goffic wrote:
>> From: Clément Le Goffic <clement.legoffic@foss.st.com>
>>
>> Other driver than rifsc and etzpc can implement firewall ops, such as
>> rcc.
>> In order for them to have access to the ops and type of this framework,
>> we need to get the `stm32_firewall.h` file in the include/ folder.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
>> ---
>>   drivers/bus/stm32_etzpc.c                       | 3 +--
>>   drivers/bus/stm32_firewall.c                    | 3 +--
>>   drivers/bus/stm32_rifsc.c                       | 3 +--
>>   {drivers => include/linux}/bus/stm32_firewall.h | 0
>>   4 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/bus/stm32_etzpc.c b/drivers/bus/stm32_etzpc.c
>> index 7fc0f16960be..4918a14e507e 100644
>> --- a/drivers/bus/stm32_etzpc.c
>> +++ b/drivers/bus/stm32_etzpc.c
>> @@ -5,6 +5,7 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/bits.h>
>> +#include <linux/bus/stm32_firewall.h>
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>>   #include <linux/init.h>
>> @@ -16,8 +17,6 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/types.h>
>> -#include "stm32_firewall.h"
>> -
>>   /*
>>    * ETZPC registers
>>    */
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>> index 2fc9761dadec..ef4988054b44 100644
>> --- a/drivers/bus/stm32_firewall.c
>> +++ b/drivers/bus/stm32_firewall.c
>> @@ -5,6 +5,7 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/bits.h>
>> +#include <linux/bus/stm32_firewall.h>
>>   #include <linux/bus/stm32_firewall_device.h>
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>> @@ -18,8 +19,6 @@
>>   #include <linux/types.h>
>>   #include <linux/slab.h>
>> -#include "stm32_firewall.h"
>> -
>>   /* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
>>   #define STM32_FIREWALL_MAX_ARGS        
>> (STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
>> diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
>> index 4cf1b60014b7..643ddd0a5f54 100644
>> --- a/drivers/bus/stm32_rifsc.c
>> +++ b/drivers/bus/stm32_rifsc.c
>> @@ -5,6 +5,7 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/bits.h>
>> +#include <linux/bus/stm32_firewall.h>
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>>   #include <linux/init.h>
>> @@ -16,8 +17,6 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/types.h>
>> -#include "stm32_firewall.h"
>> -
>>   /*
>>    * RIFSC offset register
>>    */
>> diff --git a/drivers/bus/stm32_firewall.h b/include/linux/bus/ 
>> stm32_firewall.h
>> similarity index 100%
>> rename from drivers/bus/stm32_firewall.h
>> rename to include/linux/bus/stm32_firewall.h
>>

Hi Gatien

> As the firewall header is moved to a dedicated firewall directory,

I don't move it to a dedicated firewall directory just to the "bus" 
directory where the "stm32_firewall_device.h" header file is already 
located.

> maybe it would be coherent to create the same kind of directory
> for the sources as non-buses drivers use it. I can test it on my
> side if you're willing to make the change.

Do you mean create an include/linux/bus/firewall/ directory ?

Best regards,
Clément

