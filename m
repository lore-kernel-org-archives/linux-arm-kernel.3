Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB99C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC4lGjpRIsFQ3PxsIGKswS7a8Sk/ulLQg+3aOcjhhnA=; b=4Tq5yKbOqCg6Y1TthneAX9Yrtb
	/XJXGX1DPQT+WAdG0kMuIK2HIwDRD5NFxHFvJlXbxgp2GA9HQSsu4X+A1WzBYqRzPH246GC+gQgfV
	B1BJsbDxqhhI+6R9rSb7Mf+Zs+pUPF/vxtzdNmGvMRCuxJIXDntHFprjaRRwNAo7Pcrv923CN6zk0
	91bsOq41CIjfW+1B4Md7QNq5H+8+nSGHNd/vsCeJ/EX2zKQulvTy2nDqVSk4VoYLthNzKh+eNRCN3
	yGfyuxsCIiaq5X77M+FW8wYoAyYiQ4pIbUtlfDFMBaCTDIOI0BcUjZGDVFywWCbCeYfE41wCrFxQ+
	BmFy84Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBY1-000000003Uk-0PDG;
	Fri, 13 Jun 2025 21:02:49 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBVo-0000000039i-49Zl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:00:35 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4034118aeb7so654927b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 14:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749848432; x=1750453232; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC4lGjpRIsFQ3PxsIGKswS7a8Sk/ulLQg+3aOcjhhnA=;
        b=nfAY0SBr4ZwswrQwuK+24AnQxp16jBBHCGz/tOU0LzM7/cOniCrESBgLUZPU+8EvGh
         RG1Xf7O36YqQ8CsyMaTPuzKI/WLNTMAuyWsRCICFInt7125YamPoqNaiYmyJQoYyl3Lo
         mM0kEPJyQTK0yn7hFmb4gVkNOxoVNktyskcqhNzkEJjTvm+gfj6IhdAt0Y2z9xqltWTf
         LN8BLdDAHVgwT4NmSMv6KhUdqZ+cfk46m2ZyNdV4sYT0sId2d/Sjpi02whxwyL9NTt3r
         YWLYZL8BAdUWXkavxL5TtRi7faCax9GQa1T2TyQK4ECt514iPvPNoWL3YBmSd6HTxOuy
         XpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848432; x=1750453232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OC4lGjpRIsFQ3PxsIGKswS7a8Sk/ulLQg+3aOcjhhnA=;
        b=dB92ThxEHkwc+av/B3OuOwAnU4DYKRP9ldKFsDnxxgFqfcTSEn/gGyHsRB+Jt0ma5j
         CnRfZFJt8GmIycGiNM8JN+jaLwwDhMJfFI3WbmHOKawcSm98HXDIWaS0bqJUIV63i59/
         o/A1Pl6r31W7GQi+HzQBcnqBcG91T6BuEnlP5wZa8bw8j5VYksr9ZjeOJ0eDKW3YjqqL
         mklvUA+0byedo1XaGzHBrHFX0wPkD0akPmrC4Gb6ZA+3h7x74+BPhl0R7VpYnK1PWXt+
         zyfWPkOv69e1Ed660+d+8bC/5hR3cRKkJdrWsVDh4tYgMSH9zWOcbR+fhvW7QKjNOyua
         PJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3WJpzOYBnlEXwDha+5AaxvZOdpMKK4lAt1LzSnec6XRVLULUBLOuhKCn8YMQxpmEORq1yn/YoU1rrRRez0wjM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3TqeXG7IubG9FIQPKPY/+Gna+Mdm0g9Epp8kL2re23aK6Joga
	NvxzLEW3mVTLTHhWpvuEswrzOPXPRaO7OnEtwQj+C1c/kWin2/J9+G/AN8DEI1NOOsg=
X-Gm-Gg: ASbGnctANWVfslLgJpEiji/ltBNGBO7undT2v1rZvjaCBa0zAf50KIfOIP7AXc0w3X9
	vHk7mOd3ZwdfFW7JU9L/Tk1nzXwNbJVazuZgaLJFvnP8dDmeLd5z46dOm8Edg2S6HwI0cqT9sB2
	WlwF+l/CnMkTpXQO9jzTihTNY1EaN4Bnlz/TE8WwH4g+4ElBZACbIeml9xv5p8epP9zapK6iDCd
	LQGODZDckxVaTWjbePFdkIHO2+UDZ4kJl2OtA384u+u66EyygCtcPBdpgiOD497EiIKN/yCtDFr
	dkYT/8taJBniCM5Hznsxa69lwkcBz7U35SmhRnHQBB8uxuN7b65hb9YDPvXfOmcoPONxdRu5qhY
	PXhsjk88TKoCxF9pVbcxFDxcX0oRF58NFNUvE
X-Google-Smtp-Source: AGHT+IEtXeO28HYPr7tm/gNlkY2Yoh25MnNBR5GISA6s3KtN+9pVdziylV4ZXeGQBQkLiZ7HAFTGYQ==
X-Received: by 2002:a05:6808:2182:b0:404:766:3129 with SMTP id 5614622812f47-40a7c17a034mr646649b6e.1.1749848431590;
        Fri, 13 Jun 2025 14:00:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8? ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a74172ccbsm413546b6e.29.2025.06.13.14.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 14:00:31 -0700 (PDT)
Message-ID: <439f78d1-aa1f-4929-99a0-8d6bb1958912@baylibre.com>
Date: Fri, 13 Jun 2025 16:00:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
 <b0859b25-0e95-4966-a433-5757d8bd9e6a@app.fastmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b0859b25-0e95-4966-a433-5757d8bd9e6a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140033_263443_A77DFECA 
X-CRM114-Status: GOOD (  18.57  )
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

On 6/13/25 3:37 PM, Arnd Bergmann wrote:
> On Fri, Jun 13, 2025, at 20:55, David Lechner wrote:
>> This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
>> that didn't get applied yet for the bus subsystem. So I have changed
>> the subject line accordingly.
>>
>> Arnd,
>>
>> There was no maintainer listed in MAINTAINERS for the ts-nbus driver
>> and it looks like you have picked up patches for it in the past. Could
>> you please pick up these as well?
> 
> Sure, no problem, just a few things:
> 
> - These are all cleanups that can wait until 6.17, right?

yes

> - I see the driver has no in-tree users, and apparently never
>   were. There is a imx28-ts4600.dts file that should reference
>   it but doesn't. Do we have any indication that the driver works?
>   Added Sebastien to Cc as well for clarification.

I dropped Sebastien in v5 because the emails bounced in v4, so I
don't expect we will get a response. I'm not familiar with this
driver or related hardware myself.

> - it would help me if you can send the patches to soc@kernel.org
>   for me to pick up, as that ensures I don't forget them.
> 
>      Arnd


