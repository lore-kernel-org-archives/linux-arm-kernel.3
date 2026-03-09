Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF4AEA854A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 03:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRC/SSBoLNJpBv7w3HXObuyQkJlK3e7PgCYEr0NFv4U=; b=fPp37Qds87GyGiS4BjqTJ6P6D/
	gleUW2F2TJLGpQ042D5D7JBPyDAsD2mef998Dlu5CKFamk4wuE8ZxNf7xSKeU8GCq0SgXDcuglDlo
	NOvHlRJESw+F4kBa0Xk0CYF43aWCkFF77kE1cHhUCP3t0OOetfmHbweTCEyG8Fu65UmnD8f5Irr18
	4Je5tq8inko0EVr7Nd9a8rowazVtPDClkS3RkKbUNUgjcPpjVBZEEiR1r2AdEct6Tz41WWR2kX9a/
	00Dfq1DfIYvR3wsjUrVo8zJ793JXNuKZomVDrpclQxrF9Cu4EjAXkqDz1wkvO1Sh6JRBr0TMcMDsI
	Odu9NYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQtV-00000006ZnW-2inS;
	Mon, 09 Mar 2026 03:02:57 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQtS-00000006Zn1-45H6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 03:02:56 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso13740857d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 20:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773025373; x=1773630173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRC/SSBoLNJpBv7w3HXObuyQkJlK3e7PgCYEr0NFv4U=;
        b=voB/MGYJfi7m32sG+yiQxUJ2+ss/OMx3GyPMvTRnA+uzOXx218sHIocz6EhvC1Zd7a
         VHtCYMizvpmWEgELPOnnKqM8qmv3N2X4zY4ABTmKVOhWKip/m73GrNNV3+DzsbUhf6LT
         RgtedGQvomRDYIOS5NPLX+pkr8LBdpV6gupT9WeGtDjudRs500GNMrWjeMRw71JKn9MO
         01TvM3Ozx1SVj4ojHpfF7cliGU100JAZe1hWrsmgKD7Qht3rLadkwqWLcjxiO4MFRsnS
         PBDz3zTaCVY5vL29bmMUa3u57RyohAVdZuDNWsXpyCF4jflYwSEkypCnqCbJvXp0sxuf
         uowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773025373; x=1773630173;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRC/SSBoLNJpBv7w3HXObuyQkJlK3e7PgCYEr0NFv4U=;
        b=h9cLfGiPi92zLKNu+ELCVAhoLH6CEufwvfTGrwApuGiQYRx+YsBy4X7uGsPVsLg/NO
         HRWUsyIn7silxpvBBj1g1Y9CvI/L4cQoqUGfunSa8paeyXrYh4HzcEnrIR0fPRkjAEct
         jhmL92fp4xa+ER8x0qsBuoiLrpahHne/Pa5M1OjBi+k/vKAcpsUVro1CdzRLOPFspN5M
         K15OlLUc+uKcLbV8F43zBW0alOhOToU4cc6G7uiMtW5EvF3cW6HMTQsM3WIX2m1RCO01
         Zjfmr19gg61xPIvHyO9v8xVtauFV2SvinV8ceyjBXcjp1aWln7hQnSviQX4hrtSfuK/n
         umqA==
X-Forwarded-Encrypted: i=1; AJvYcCWIleZOlMPAbgd4am4emk8+jgv9z6AgDjWrPkHh5Bvpg8bS5NTJc/9tBmryOLJmy0vx7ggTwJY85j4/SyfS79qD@lists.infradead.org
X-Gm-Message-State: AOJu0YwMVP/fy8EbamJXFM7qCtWQyltQMAPS4PiZS2g8irUOC73OI2xl
	71FGIHIP8YxbcJ2V1tB6pnivxBod6vMYnAQs2040jjDuLjp7W3AV2o4YRaJ24MeTMA==
X-Gm-Gg: ATEYQzzh5UHTmxOU/wLLcZDoOirZ5uJodScNxIP+ST0OyvcMXLGniq8JcfT2bJvyQkK
	FLiK+J7/vQcHJC+x5O4MkslTZvV+BLCU/o5LFYwPbw+TaH/44x0ry0yW8eOMjR2SrA8gjyDe62e
	wNikyxoEnRQxiAu7JaMHmP3m+PrQ4m7r3CJDK9RAPVNyFKO0ZNLdm44d0/MIk5JP4bnakvp2O7K
	3SGIXSBAAv6igSgN8EvxJVejhe5xDiRellcn/rHDWLYTvmesxnDnM3IqJCLcSHXE8xsWWHDFRWr
	fUpWsGc+H1j3lTbgASouB+BMpGrim2Fw3JJNq/oQrATAEoBpP2Y/uZVZ1+0sw8Ku7xIEDvZEVli
	5b6elL8zj34yb+QkxaKPxhIPOYOTXkrEjKblEJ6RnPTKAn4mqVLkpQzZ9GQPNSg1yJZgrCGFbbN
	+mA1DiQzLgUJq3uEhNS/YZlWhhJ13Yr122r8RwVT1Ku7t2wOYdXDGXvPYWd1mQgCOnEUGQUoE=
X-Received: by 2002:a05:690e:1186:b0:64a:7bf2:3afa with SMTP id 956f58d0204a3-64d0715a07dmr12447389d50.28.1773025372369;
        Sun, 08 Mar 2026 20:02:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:3329:ea09:3c41:e7ec? ([2600:1700:4570:89a0:3329:ea09:3c41:e7ec])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176c59dbsm4094408d50.11.2026.03.08.20.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 20:02:51 -0700 (PDT)
Message-ID: <103a2828-c567-4b95-8583-e2358ccfc1f6@google.com>
Date: Sun, 8 Mar 2026 20:02:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-3-eb86bd570e9c@google.com>
 <20260306130031.GK183676@google.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <20260306130031.GK183676@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_200255_016563_6D63B51D 
X-CRM114-Status: GOOD (  13.98  )
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

Hi Lee,

On 3/6/26 5:00 AM, Lee Jones wrote:
> On Tue, 24 Feb 2026, Amit Sunil Dhamne via B4 Relay wrote:
>
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add register bitmasks for charger function.
>> In addition split the charger IRQs further such that each bit represents
>> an IRQ downstream of charger regmap irq chip. In addition populate the
>> ack_base to offload irq ack to the regmap irq chip framework.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>> ---
>>  drivers/mfd/max77759.c       |  91 ++++++++++++++++++++--
>>  include/linux/mfd/max77759.h | 176 ++++++++++++++++++++++++++++++++++++-------
>>  2 files changed, 230 insertions(+), 37 deletions(-)
> Does this patch have any dependents or dependencies?
>
This patch does not depend on any other patch.

The patch that depends on this one is:
https://lore.kernel.org/all/20260224-max77759-charger-v8-5-eb86bd570e9c@google.com/


Thanks,

Amit



