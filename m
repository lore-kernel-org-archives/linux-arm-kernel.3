Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BF7FD5307
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7eVWufdRnuJaMT82ARr6mUQU8+3LuBH9hu4HQmbar0=; b=GJceh+CQZPi3NpIReV1vE6Ohgt
	q0CFv3NdOBKmMnPzlFsag29X8IbDdo8Q33NSvuLdevRcirGR8Cy5G43y4rByQtYaHkAH6nya4o7JN
	eF6S2VuYPg09Ek0wJV8xCHoUv4v6vs6slT3AG1ECCTmwXbgQ67gJ8ZsHSJkRJM5AjWnuF2Jbu+Jod
	nfuafscK+RTKlMbunSUPc/k3LuH1fUZq3ffKUpmWe+ttx8bpteGp/3uLBaCHSABYYZujfLwkX110Z
	kQZpA0OwirQb7HP/3DLIybsDVYj8jzIt0AKOcYlGoJz1d8ATYiFrdDiThU59kRU5QkVhvMbnkxdn4
	u+xEROYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsW9-00000007uVh-3pNf;
	Fri, 27 Feb 2026 07:44:09 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsW7-00000007uUw-1JBX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:44:08 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c6e3e4e7388so664992a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 23:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772178246; x=1772783046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k7eVWufdRnuJaMT82ARr6mUQU8+3LuBH9hu4HQmbar0=;
        b=faTf8I4eBI2V2kr/V07PZ/jugpf1oFpvk6Vg0MOHo2iULqpyA/rTSSNq+hmo5K2VKF
         +twdOYMM9M2icVB2gEfmVbj0AUJytFHj58EpNmqmYnJatOO8vbb3HXoXICBa9KtV1WMy
         zN38A1li4YwguEvZwu/QKAQuBAYFTPfgt/UrkuO7eRY+VUqoySdsX6GxJw5uJrLiprSl
         ZnKJicE2tmMqdHfRCBPcnlFVa+tuEi0CRnCmT0O9geZciUenPcsCWh2xYQuWCB+5EXmv
         Xh0sqw7fgrDHOYMpjTiiQWYH7cUKsQHUVZgSIOhY8hUBdm4glzB40OccekUZ6VF+aKVp
         aVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772178246; x=1772783046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7eVWufdRnuJaMT82ARr6mUQU8+3LuBH9hu4HQmbar0=;
        b=PWjipTuVRE6QPyv7DmuZQiZtofZyRzxuxHCPMB/pqdow2M6o538t0Gsu+UYPhcl4Xw
         TXzOWYSqW/7GjCyM1qoxk3MqWHRuUPwXxRr8HmSNE/8NGNtwo+6718Yu3FKjcxVZ6hS9
         rnMsWlpMeu7nTIKfhDxNsdNFgnPIrYnRFivxTJsYtzHHsKf+s4ntXy89eT5jmnHPpc8S
         mihtaDbHf5VcMlzHBzrgTFrIkhYFODTE1gyge6jFYjlnXd3vv9k8lUNY739KDR4mFsZu
         09xzbVsQtvaeVVytxjRwGOB0QqKqoigxo9SP2qqy+3E0VAY3Pqzz2hdDk+IJ3A80ZYeO
         95Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXWHl9BuSiWDAqpFUR3Gj38lTn6S1+jmBA41+VaoSNfEMRwP2gSuq2+57plOEc/TOvCxO2uaj32tiwRRZnNpMlF@lists.infradead.org
X-Gm-Message-State: AOJu0YzrXWIzaJYicxkIAqMj1biwtN9RU2/jQf6FPxrehu8OrtQ1Jmw+
	76EbX0u7xnBzl733ufcPq3w2dts0ARYZbfWGVhMn0Nik58DpHXfw+bJn
X-Gm-Gg: ATEYQzy7Wj1NDd5W1sPRAzkYOczcx6Yx2SPTmJpFYs8RUHO1MUPDBjgIaz9a6KdUT7a
	9FccnHMDHaskByC9Tph4R/bOfUj9rBZ0ARkZ16ODZMXo8LfAIUNboZntryhPo52XMycX2vmGSn5
	3CVSbqFGGK18CiWYpRRsjsjB2ODDcqstPufxwqz0AdkZDn/pBa5s6rWrPkpGbkD3zQM/EJNGQIX
	s6Eo10YDPQxFzR9bE3u/Sagfcr9yUzdJEwlc1mg2S4mDjlO8hthHX51UNyTj7ZeRkg+VxxfnbAz
	fxpHft/REK9birmsEw20BjT2j0pTQu9uhqf7xRv2AmBeuJ6iDzYGaEkmGClEPr3g2YEZuDDSimo
	9hDcM2uqIJxnLewT34nJ1lOjj0T13+nywRi8VJ7ukFWJhrY1pM2lLd+NEOm0mX53r9wdz1dvMgb
	JMEG6xqcUdgrsmxyGhUGm0oezSBNpnj0aCfCTZCEJSRi1GUvwvUZrLwPi3B8xqz/Jsi8mz9bX6
X-Received: by 2002:a17:90a:da85:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-35965c93b31mr2286620a91.16.1772178245932;
        Thu, 26 Feb 2026 23:44:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912e19c4csm7147007a91.0.2026.02.26.23.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 23:44:05 -0800 (PST)
Message-ID: <e69972db-20c3-4ce7-ad12-bb91a8eadfb2@roeck-us.net>
Date: Thu, 26 Feb 2026 23:44:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] watchdog: at91/sama5d4: header cleanup and driver
 refactor
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 wim@linux-watchdog.org
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260227073116.30447-1-balakrishnan.s@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_234407_362917_08EBDCDF 
X-CRM114-Status: GOOD (  12.14  )
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

On 2/26/26 23:31, Balakrishnan Sambath wrote:
> This series cleans up the AT91 watchdog header and refactors the
> sama5d4 watchdog driver.
> 
> The header reorganization introduces consistent register naming and
> makes the WDDIS bit handling explicit for modern (SAM9X60, SAMA7G5,
> SAM9X7) and legacy (SAMA5, AT91SAM9261) SoCs. The driver refactor
> improves readability and fixes the reset regression introduced by
> commit 266da53c35fc ("watchdog: sama5d4: readout initial state").
> 

That is inappropriate as a bug fix. Ther bug fix should come first,
in a form that can be backported, followed by an optional cleanup.

Guenter

> Andrei Simion (2):
>    watchdog: at91sam9_wdt.h: Cleanup the header file
>    watchdog: sama5d4_wdt: Refactor the driver
> 
> Balakrishnan Sambath (1):
>    watchdog: at91sam9_wdt: Rename AT91_WDT_WDDIS to AT91_WDT_WDDIS_LEGACY
> 
>   drivers/watchdog/at91sam9_wdt.c |   8 +-
>   drivers/watchdog/at91sam9_wdt.h |  65 +++++++------
>   drivers/watchdog/sama5d4_wdt.c  | 156 ++++++++++++++++----------------
>   3 files changed, 113 insertions(+), 116 deletions(-)
> 


