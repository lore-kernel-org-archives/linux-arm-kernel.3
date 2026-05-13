Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E81CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKJozyiXPAnQIsv7H4f79u/+ZUVGgrXC9SUuc+YMN9A=; b=qn2IsQ4Z91FSCfdCLYP/6Fp1Jo
	Ks/vUUbJ4wZl+fA7qvPGKKVs7QqInoIEuPfo3eYX8JjMS2h8FAIXPAFhXFaKlZ7pJbz9GGOdJ1eCk
	l5v7g8B/CMWhw1a761uo0Djn5HQHimw7K2ygGljEfKbaPRYAww5RNOZtExNf1WguLaHVFS/QVnIPW
	cU+DaZDYNiZV5ZskBC+83rg/XenLOxD94R0UtnCoW++lKDqinp0fhd+51UoL2eefHtUlXRPlEfs/m
	9NsGVhlXe5FeRal2RznO1BIc4joldUHQZAGAHkXxAc97/cuiSYt8kacI1ck/RkEGgmkwb8Icq9pXN
	Bm+CM91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEIp-00000003TU2-34hW;
	Wed, 13 May 2026 18:27:27 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEIn-00000003TT0-0IYE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:27:26 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2f0ad52830cso10485749eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778696844; x=1779301644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mKJozyiXPAnQIsv7H4f79u/+ZUVGgrXC9SUuc+YMN9A=;
        b=p0Z87kxMJZEosOeeOmJa/X15EFHEQBGIP988V7T2kiXueas8Md5EAwF1fSsr2d7slM
         oheg5BeTJ5+DpAPBOLrkOV4lpWRAXPXJGVb/LlV2WHAIVtik1R+ZKMd24Y5lUh+IOibZ
         CRUjELoSsdEswpQVEG/xskxHuAv3Vx4V1gNWfLOgv+jOMLltmjPAYiyLt47D61z6eOKp
         03E2SAEtWgkTg8DpXonO3yp+VZEMqDKh/sOHzRlk74s1FYEXEho2MmP9ytkms/IpDmms
         ZwTRoVRf3xY5tueFlspJ6/2DTU2Cst4xyDY4uSDUn+XOaeodWYm45h3z20EBGXWrE6Zu
         b7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696844; x=1779301644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKJozyiXPAnQIsv7H4f79u/+ZUVGgrXC9SUuc+YMN9A=;
        b=Qd0HH+VluycO4/5dVUEiYwQOtQXWgTZ7ciovQjt91rISOHmMsb5GC1i62jLs5fLK1j
         +XTb1+zWGwdwGQ+VWE24+ZhsK373o6w1KYTKj6kBkfigN96AFDtS/tUc7JF+GPXbI4Eu
         b8BeNjZDRwwEpmH5jilTVHwGI3/1doi4f0/dnMzQiOCKJm1n+ADQDo0YF0VmQG0mpFuy
         KTtLTDU/C7U6nwEHW/oJQtHO4UbYnonFXJ9Df0rwXDCWvgafo1yDfDrOAyJ04L9jSiwp
         Q1rfxz+p9c2ELM7V8nXr/GbkS1xMc7xrpY/BpgWsxqmP+2166yJKO5OMCs8ASUX0aQXh
         knhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W/5Yas5jQEAixjeTKoaxBcGI2ykuq6wJrMSwsX4hUqendFWWejOXARvQH8A1CFN7P+fu0zbx+CEZPMjcE4fba@lists.infradead.org
X-Gm-Message-State: AOJu0YwrOtP+mGYA2ye8lnOUI0N9Zsfifgui9qWvvDZ0XL3KUu3MyTFE
	R0LrQqLRIRtfChPAULCADe3wWFRrK73muRPS/vjwdIw6Eq/jmQBu0dtb
X-Gm-Gg: Acq92OHNpFLGmYAe72/S8jJNT3IXQA1rbLhrzBLfyaFHsXLtgQ7s0/38qcHrRmmGfvD
	m4CAMcRa45qoQV05eDjosjiTcNrb3tZl8YpG6fG5V/Q9sw30MJ1rhoSJRXHvHhjhTZnpUGeG+EI
	Wx9YZi6tquYsUi8Qn+OCVZhZ59nB2I+rGfP8I80PCs9Js+P+d68P5p5d7kmf8pbr9XE5oQkolGR
	/fCf/SBwZVbfU/t8GVbY2VwWC1rhbR8cv0EOufeRzH6f8OJUhp/oYG7AlADHoOPUAFbNY9Lcx4E
	9AhN5KSU6umRVSAmNE0dvdwMXXnV5bQj7zzrivXoZspBtyl6xDgFSml/u8yvAXMlDFHXqZkKSrJ
	ITbly/ZhAOu/gbXPaXD6Yo5x638jOKC7zahshIv2GlDJxvXc5yrdGc24OOsjsGxKG8f5xsVRyE3
	pL9IIwyBQLeUE6LZjmn38YWjn5Kgxa9Ijb8IbA0CuYzsq/bD8w3AM9UX5cgFbLUClHFtaGq+jc
X-Received: by 2002:a05:7301:7c0c:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-3011996d245mr2563952eec.18.1778696843940;
        Wed, 13 May 2026 11:27:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm27544171eec.27.2026.05.13.11.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:27:23 -0700 (PDT)
Message-ID: <1f2fb1de-ebc8-40ef-ac53-3348499295e3@roeck-us.net>
Date: Wed, 13 May 2026 11:27:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] scmi: Log client subsystem entity counts
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Alex Tran <alex.tran@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <agS8udcvqgQmiqB4@ashevche-desk.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <agS8udcvqgQmiqB4@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112725_116738_A06A7BD6 
X-CRM114-Status: GOOD (  12.46  )
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

On 5/13/26 11:02, Andy Shevchenko wrote:
> +Greg (I believe the trend is to drop such messages and not add them [back]?)
> 

Is there some common guidance on this ? I'd be all for dropping messages
instead of adding them, but there seems to be a perpetual battle between
people who want to log everything and people concerned about logging noise.
As maintainer I always seem to be stuck between those two camps.

Guenter

> On Wed, May 13, 2026 at 09:44:18AM -0700, Alex Tran wrote:
>> SCMI client drivers do not consistently log the number of supported
>> entities discovered from firmware. This information is useful during
>> debugging because it shows which domains or resources were exposed by
>> firmware during probe.
>>
>> Add logging of the number of supported entities to the SCMI cpufreq,
>> pinctrl, reset, hwmon, and powercap client drivers after a successful
>> probe. This aligns these drivers with the existing logging in the SCMI
>> power and performance domain drivers.
> 


