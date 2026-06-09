Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F1BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 20:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ/YXPB/iVQYKnH/A0lTAooADjyGEwknQY/Na+W/VMo=; b=PxqOTxXpHqEVuo840mBI4k4tZk
	gaR+dU+14J62ocUB8aKuYCzJbl2yrbA3gHoYy+Sk5vNwNHOIpdzznzpyArO9ko1P4Ge3AYbcGWxiw
	njtupgJhBWxFREt3SvMPuLwXHPOMVZ0pxtgSHi+uts1sYQtejGO4md9CxnsJlBn8zTQXvDsUPOrSH
	LMQTEYBxSqur0gZTR3xI2SqYTKjmdb0o9PlAwkE62BNjmrclP9ChX64pebt5aDYFjhDgmjeKVhM2b
	pJv1aiUsqmmPcJMyiixzoxQitkieRbx8a3R2RS57M209x3TbG2icUHFKLps5rm3mhyvE0/HaAo0xf
	GkYRwgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX3Mo-00000006MoU-1sJc;
	Tue, 09 Jun 2026 20:48:10 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX3Ml-00000006Mo9-3oWb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 20:48:09 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso46535645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 13:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038086; x=1781642886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ/YXPB/iVQYKnH/A0lTAooADjyGEwknQY/Na+W/VMo=;
        b=WaDCUD0LhvTeUr/h59naCYdRa9/kG3n8eE/l9ocfAZkgtFO/Ue08oEmIPnRCvanjP3
         3wK59LNwuXPUr3H2ZcO5qkttAtDBuEKMq3hqgY5i7ppvfMNELUOH2KB1cgOa2TisHtgo
         3UjqErfRN7EjBL6G/HqxH2FDGRbaVJrFMfnjH5kJecgA6Dkul5CWM9hK7mVfcSsa/b3O
         WY0eagxQD7pyP/wol8x/tTIa6sft8JNjz00xXfE7cN12ANxhYRmubimPBPR+E+No/0uW
         pvxBq1h2tb+oAsjAG7v5JLoxv2kiphuzdgBG0EfZsh7UQnYwRegJbt+CBKUOx+mBFr09
         XF7g==
X-Forwarded-Encrypted: i=1; AFNElJ/fhI8fbUVt3KKBY5QA2L37EcTcdp4MQPZcIVQbvjOhWw57smw1lP6zGMmT5sPkjqWKlZyno56luxMSaZq6hXx6@lists.infradead.org
X-Gm-Message-State: AOJu0YweLeu7p/+NN1ZDrjmWN0b6nOJ+pjl0s+0bCISfXQo9FwPKRL3Z
	FoaeAXr7US9OpW0Xua3PWtRP0/KzWlrHIPzKA0YeByDv6ljD7Q1COLp/
X-Gm-Gg: Acq92OE7Us10XS0ZbprXy85HbuziULt6nuZk/842UQjnbecIMN++YknCNq5GXGv+RHE
	e6tU68voLU6koeJBe9XDQ469ZzLMKNgjlTQ5n/IXuApjIWVtnj61WObqwxAFSO6qrCITkS3qfdt
	SkqxwzCPUoHN8G7QTioDlf4DlQVaeJrUVitm+rvikdZ2W+MJcm6bXG1ttXT21gtmKzGVCe8Xb4t
	/4YIaZRQI7rKf7mJrIaEaxjG1QfCn/N2MDBSrhS9GBIRgiaJX1mqM10xYGaVRGRtXdCS/aGWbZW
	YJKrjrRuy0TXEng0C0xzt1DtfnJymxJl5XqaVwAf5J9RUL+RYn1l/5cC4nJKKt2ng2u0yO+zUfv
	AGBRpIF7vi0UgELdDx3RitF6y21S67QH1qRQYct5LJeOYaZE8wx1tuA0hrxiISFs77qaHQurW3I
	93UUMjxTgts4G4CYN47wKAa/KW+8hakMTaW1S49i0hT7h4Hmt/2SmgxZL1YGnhJ97lDWA1JMywM
	pvDco52JsFctxKXtqGqiaWAJ3JuH3ShP63bG5wMGg==
X-Received: by 2002:a05:600c:4e45:b0:490:c01a:5f10 with SMTP id 5b1f17b1804b1-490c257f8cdmr363952705e9.15.1781038085472;
        Tue, 09 Jun 2026 13:48:05 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm509551525e9.11.2026.06.09.13.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 13:48:04 -0700 (PDT)
Message-ID: <b07f5bd8-26f8-4de4-becb-4f76f9d33361@reactivated.net>
Date: Tue, 9 Jun 2026 21:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpiolib: handle gpio-hogs only once
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linusw@kernel.org
References: <20260608210108.36248-1-dan@reactivated.net>
 <CAMRc=MfUd3nwpjgz-87hrpQ9AV6T8_1zwCm+tfYFurkYHKoKTw@mail.gmail.com>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <CAMRc=MfUd3nwpjgz-87hrpQ9AV6T8_1zwCm+tfYFurkYHKoKTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_134807_986380_1F7C1DEE 
X-CRM114-Status: GOOD (  24.72  )
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

On 09/06/2026 13:39, Bartosz Golaszewski wrote:
> On Mon, 8 Jun 2026 23:01:08 +0200, Daniel Drake <dan@reactivated.net> said:
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 1e6dce430dca..b02d711289d0 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1031,9 +1031,17 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
>>   		if (!fwnode_property_present(fwnode, "gpio-hog"))
>>   			continue;
>>
>> +		/* The hog may have been handled by another gpio_chip on the same fwnode */
>> +		if (is_of_node(fwnode) &&
>> +		    of_node_check_flag(to_of_node(fwnode), OF_POPULATED))
>> +			continue;
>> +
>>   		ret = gpiochip_add_hog(gc, fwnode);
>>   		if (ret)
>>   			return ret;
>> +
>> +		if (is_of_node(fwnode))
>> +			of_node_set_flag(to_of_node(fwnode), OF_POPULATED);
> 
> Sashiko correctly points out that on errors, the state will be corrupted. We
> could maybe move the clearing of the flag to gpiochip_free_hogs() and track its
> state when processing fwnodes in order not to clear it incorrectly?

I guess you are referring to:

> Does setting OF_POPULATED here cause state corruption if a secondary chip on a
> shared node fails to probe?
> When multiple gpio_chip instances share a device node, the first chip processes
> its hogs and sets OF_POPULATED. If a subsequent chip fails probe (for example,
> returning -EPROBE_DEFER), its cleanup path calls of_gpiochip_remove() which
> clears the flag for all hogs.
> If the flag is unconditionally cleared, will the deferred chip attempt to
> process the first chip's hogs on retry, fail due to a mismatch, and
> permanently abort probe?


I don't think this is actually an issue. If we have two gpio_chips 
sharing a device node, a first one with a hog that probes fine and a 
subsequent one that fails during probe, both of the gpio_chips will 
brought down and the flag is cleared. If it was a EPROBE_DEFER case 
which is then retried later, the first chip's hogs will be set up a 2nd 
time when the probe is retried.

It is true that the teardown of the 2nd gpio_chip would erase the 
OF_POPULATED flag of a gpio-hog node that it does not "own", but the 
first gpio_chip would also be torn down at the same time (and 
OF_POPULATED unset a 2nd time). This is not ideal, but harmless as far 
as I can see.

I don't quite follow the suggestion for doing the clearing better in 
gpiochip_free_hogs(). It would be neat if we could go from a hogged 
gpio_desc back to the fwnode, so that we could only unset OF_POPULATED 
on the fwnode at the point when we are really removing the hog, but I 
don't see a way to derive the gpio-hog fwnode from gpio_desc. Also, this 
would be complicated because one gpio-hog node can hog multiple gpios.

Let me know if I'm missing anything or if you have any preference to 
handle this differently!

Thanks
Daniel


