Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AFAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 01:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhVW9oe2cjj3Hs7+7j3GMXcu7eiEDWbnxpNS4pNrjzA=; b=aC6vq5dys8i2glW5ufDYTax03D
	Mjx5zClQNxBp8Jw015j6YSAWTqojSMH9fUcJwOhKXu66lUn+v0N5tomKkOWHnBlN0lHo7YnR1tegF
	tbt0WyfOAMaIa/trUN2vFphU9l5ylJUMqqrvslUKw8O7gNtqZWhB5sGH5s+1iHBSB5AYAJjHbRASH
	Z3LV/Ur1Xz+LwKxLCWB42ly0XexeC+3g2HsSTCPbg81DXiOMlPac5Gb5k/LZIYwKec4P7HmriXdDf
	3j+Dm/XiCP+tROQNsCM0pVDW768t29uIzunVBDUwO0Zuv+upOItAywnuHuMMz4svRmfKSSGDraMst
	P8wUfNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzeQ-00000009kdd-1Z4u;
	Thu, 06 Mar 2025 01:03:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpyfV-00000009f2I-2jfQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 00:00:54 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff64550991so177532a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 16:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741219253; x=1741824053; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GhVW9oe2cjj3Hs7+7j3GMXcu7eiEDWbnxpNS4pNrjzA=;
        b=QiBGludfwNsazLS8lUkTD/zyAWEPjDpFU1mB/3VUDbkVTEphkVzCWQW659pVH2Kg7y
         RQLmh9pWAee0EXqhlSOKZoI8jXtlTJbJ32/z3Ky9+m+Gd5iOx3szFJ4bu4aTd91imTHm
         p+A33Q0NUCXT+jTjVS4GKvKYF+99N/cSlsZXmZ5Uv4vWi50VbwAfSKbDe9m+9BQznYLN
         5AwmTNLwMTpZd/Uk/oD96ntxdJ5J0JxHTaLPoM8Z5FsTdbZLR/sj1OkbTJXJqzYMQtzG
         JGw7VpAbKfxBFzz/OsIfRMgb6MWKvngJz/Bupg7yhPKpSl2kcV2GgHXE2+Xx16WWRUBx
         M2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219253; x=1741824053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhVW9oe2cjj3Hs7+7j3GMXcu7eiEDWbnxpNS4pNrjzA=;
        b=l9E3C++f9jtmmqCAWurwOSwjrT695aSFy2k0OiTTVgUvlLbeA83kcFrXgSGzpV8XrB
         vD79tsxQ1M4Q6CYFH0kSF2Hn1L07pHIlVKY+vbVMb0PjtKXRUNCtyE5mZbQMpP8I4QRn
         vX555tyAG4hiI3OOP6k8JqRYgD9bYZe5pKcCZCqXdMjupG5nAmqhXZkJVuSt4rPAOZMs
         3La+A6om9htLE7xiqjvm6ishPCi0j7BA1StFetECQuqZyR5c3AKPLylo5kteWyrxGyTO
         yGeECghZ7krPLb88PDeiCdtjb4NQWo1fAiuaEG1Z3L5CqbsgZ7w+wc4CgnpELET89ndm
         xm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV10JkO5veX95cpOkBS/2zDxCjE63tymqi9vJ7cHv/e+gMJ/82WHjDc6/xflX/vZ5EdNoaFgSRAtr3pSkOqGLeH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx7Z2+FeTbVEeIfcbtiB+vnsGUZ8B0i7uSCb3yENRzt9n6BhkZ
	9AZiMcVFv4GFEs1qwQ6Zaa7dd96P3m2AoISsEdmQXIfE7lhbxN2H
X-Gm-Gg: ASbGncsJGmpDj+YIf5GdkRlmywn5Llwsfn1Bp3Mr1Io5koDev0k9yUVb4Ezrm4zmGMT
	tusgzllQ2mo43pWT8S8uoJZoJJZbkSjcuDBorgapzMUHgcuUr16vqKNhiBFCDd+tKb/+n2Oad/K
	69tnw1GYZegiQUH9ogT+PKfNzDoU0uiaQq688uDftd0IJ8FJY55yYo/6Wgnx5uzNzL7y6hOe1qD
	EZWD7QnkJwltvahAuBEXcktGtSbLnxzr0Qg9PiexszxsYqM0Cpcpl47SI9RidrJZ3oVZfA7UDS6
	Zp6wUQh1R+hVZwVTVI3Xwuee8qWHe1V8h9w1ltMqCsrPMQnqX7aZyH9pu0UVbIhlhS29VbBmgC9
	5o/6iqio2BvJCE/xuWQ==
X-Google-Smtp-Source: AGHT+IG0o6NZDwL/ouuTSHVqdZU+QbHNr6bhBHpEI+HHBxP5E469uK+cbJOr5aaDszmuflfUD3yKfQ==
X-Received: by 2002:a17:90b:2750:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2ff4972ad4amr8472496a91.11.1741219252909;
        Wed, 05 Mar 2025 16:00:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff6935335asm30567a91.13.2025.03.05.16.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 16:00:52 -0800 (PST)
Message-ID: <5ca55233-b370-4176-9632-8e5df8d4c4ce@roeck-us.net>
Date: Wed, 5 Mar 2025 16:00:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drivers: watchdog: Add support for panic notifier
 callback
To: Andy Shevchenko <andy@kernel.org>,
 George Cherian <george.cherian@marvell.com>
Cc: wim@linux-watchdog.org, jwerner@chromium.org, evanbenn@chromium.org,
 kabel@kernel.org, krzk@kernel.org, mazziesaccount@gmail.com,
 thomas.richard@bootlin.com, lma@chromium.org, bleung@chromium.org,
 support.opensource@diasemi.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, paul@crapouillou.net,
 alexander.usyskin@intel.com, andreas.werner@men.de, daniel@thingy.jp,
 romain.perier@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 mwalle@kernel.org, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-3-george.cherian@marvell.com>
 <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_160053_699646_AEDC23C5 
X-CRM114-Status: GOOD (  13.07  )
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

On 3/5/25 02:33, Andy Shevchenko wrote:
> On Wed, Mar 05, 2025 at 10:10:25AM +0000, George Cherian wrote:
>> Watchdog is not turned off in kernel panic situation.
>> In certain systems this might prevent the successful loading
>> of kdump kernel. The kdump kernel might hit a watchdog reset
>> while it is booting.
>>
>> To avoid such scenarios add a panic notifier call back function
>> which can stop the watchdog. This provision can be enabled by
>> passing watchdog.stop_on_panic=1 via kernel command-line parameter.
> 
> ...
> 
> First of all, do we really need a new module parameter for that? Why can't it
> be done automatically if kdump is expected?
> 

Sounds like a good idea to me.

Guenter


