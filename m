Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F313C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 05:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xyg383WQs++mdg+KNHFWZy7e9+DE/XMzzSgB2As2m/o=; b=NU2xruh+zCRv3TdboFuqJ0UlxC
	pZSj/pEXemcg5FQV1FAGp88Y3EpRHvrDErHnOr7tID6JAgQ6c5B9C9Txd2l/GRI3tlkKfy7m3UnEv
	FM7dUHINBd8pTOFE53pZDCflf9SdSoc+CWxFrcygimsHoeBl9LWqhJ76pJrd6Pq4uMIDinORQCb7u
	xj5A9d1pr4t3zHmMWWk0H2xcuvAIiFndbgCsDEz8JZCI+tFD8hRvITXKEEHnUDaMV3uD5uzhbPpOr
	e0/zkh9iQ9Ze1d8tZ1FkNxJLLVKftlie7O39ffjEcCZOJTZqBS392jE9WVwW3iXfg+JvK+zOEejle
	PBip3ukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SEK-00000009Da9-3k3Y;
	Wed, 23 Apr 2025 05:01:04 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SCM-00000009DO1-1ABr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 04:59:03 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-736a7e126c7so5197599b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 21:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745384340; x=1745989140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xyg383WQs++mdg+KNHFWZy7e9+DE/XMzzSgB2As2m/o=;
        b=d6AsBft1f4ay75Xor9XlzgKOfaOe2tEojW9vr7JegS47Sv+9tqNpNMA7cPZv4Q65/c
         QIU5VvQfearaqgJbR0/UXFpnTHs9/P/f/7t6UBdXGYSvHP1mXyZuGHipIEpTD1o/ibvg
         yPn+qq/zk5NQw1F9Lr6NLiu4dPdC8hRdbCKc/4uTNcA3VOCPI7olvDVSd2lF0nMAY3a1
         3eMelDxVc+fZMJn4uGnD5o9p7JlrhLOuHZ55PdrtCA0ZbTKFVMJ9kHmXfyJKlhJNH8cF
         rRBNz5aQBby/+/Svl+gTdKt0ik/alZZadM1fYIq36VDV9qSXQv16dUnrm5MWyJIRjYMo
         Qx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745384340; x=1745989140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xyg383WQs++mdg+KNHFWZy7e9+DE/XMzzSgB2As2m/o=;
        b=uVaw+ccAZbuqO6O4eLnR9I3X4QtC0vI+Ww7GBR+2dWIKdXAFSfxwNUcDRwjdETW2bE
         MzJ0hcSjz1kruSLWiXpkuqv3zfXRLYtsMkMiANQHoh0qHhizlCMRx18inE8I9J1PPT0P
         T0WiJ2S0+vYCxO4WF1n7h1oyrItsqZ1+F0TaHAxW/4dbENvN03eJZiIOZ2c380KLI/pj
         u//epkzLim7aexGkX+X1u7l3/4spBW4daUk5v1n8354vsdGb0TYcWmOTNDMMdVQeCfJh
         lnH3nhRIjFBnF4uHfLBZ7mBLD6cGvUipMGZ5KrA3CfWvVm1H0GTZDKkWzeuR6HhWCpo/
         ugNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcHYHHK+ho1sXVjwx22515OqrixOiGneUQwS2WxMc5we9NcL1G3Q+FqqiJ+QtIeNXC9UHHE/KS6yRbxtghndcP@lists.infradead.org
X-Gm-Message-State: AOJu0YxIzbHOsRdOyvqIwiLH9rYlKi8t66hAusDrqGT0p1aSMZ5CPOgs
	67GOwGw7+x2N3TstLJFQIZSv5PFZ6nh0IBmhmMqzvNt4enLsEEJ9LYdpeA==
X-Gm-Gg: ASbGncs86FxCk1b8kh/Z7+wOaHrZ9c2ao/sWFsLUcA5E/WFBUT6nrmtMX0NPWLkLQk+
	iW4egzL/umdpKYqHtwhKQyTurot4Q4qXiddoF+RewwmANO9KoZe/P0V92Caag09AmTfzihFYw/y
	J+TySYB+4BEVGRFjb5CDkz33s2/a7SCKawZ/zrbLeL5+UEjozib9TJPc0cRn2MMWneVhEr+dKEg
	VgJ76f/ds9U/GtVyqFLgZQgVtwVVgjijQab17cciSyJ0tlY7GDDZHT76NqEM3OlY8YNuRhuEIDv
	xrPd2EsrrF6WutY4yso0U+O4oug75cKGsGr+nb8rzE43isy/erlRevlb+jY3up+asHiRr3k=
X-Google-Smtp-Source: AGHT+IGTIS5Xlm9+VhCnh58WLvEtwL4pxJkbeifvZpi31EsCMwvpE4ldGQssGqpK2dlu5H9jrh6Pxg==
X-Received: by 2002:a05:6a21:7108:b0:1ee:d06c:cddc with SMTP id adf61e73a8af0-203cbd207b4mr30512585637.30.1745384340420;
        Tue, 22 Apr 2025 21:59:00 -0700 (PDT)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309d5d61f7asm2606442a91.0.2025.04.22.21.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 21:59:00 -0700 (PDT)
Message-ID: <e4159c2b-4081-4a4b-9a53-d6d559a3196c@gmail.com>
Date: Wed, 23 Apr 2025 12:58:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
 <20250422133619.GA1095169-robh@kernel.org>
 <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_215902_319930_D9A90CFB 
X-CRM114-Status: GOOD (  19.31  )
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


Sasha Finkelstein 於 2025/4/22 夜晚9:44 寫道:
> On Tue, 22 Apr 2025 at 15:36, Rob Herring <robh@kernel.org> wrote:
>>> +title: Generic SPMI NVMEM
>> What makes this generic?
>>
>> A generic driver is great, but "generic" or "simple" bindings are
>> generally a mistake.
> There is nothing apple-specific in that driver, just re-exporting
> several registers as cells. If you think that it is a mistake, I can
> rename it to apple-pmic, or something similar.
>
>>> +      - const: spmi-nvmem
>> What happens when there's some other feature of the PMIC exposed that's
>> not nvmem?
> If you have a PMIC that needs more features exposed, then you'd have to
> use a different driver. Or am i not understanding the question correctly?
I think the problem is what happens if more functionalities needed to be exposed from the M1 SoC's
PMIC. (right now I do not believe anything else is needed from it)

It would be multiple drivers. A simple-mfd-spmi driver (like drivers/mfd/simple-mfd-i2c.c
but SPMI) that exports a regmap and a generic driver that reexports regmap (any regmap,
not necessarily SPMI) as nvmem cells, plus extra drivers that uses the regmap exposed by
the mfd driver for extra functionalities.

To make this submission more generic and extensible, what would be submitted should be a
simple-mfd-spmi driver and a generic regmap nvmem driver. For specific examples, see below:

The PMICs from dialog semiconductor on older Apple SoCs definitely needs such functionalities.

On Apple A11 SoC there is a RTC clock device on the PMIC and the SMC on there does not have
RTC functionalities. To make the RTC clock work there a driver would read a counter that could
count a maximum of 194 days from the SPMI PMIC, and then access the PMIC nvmem cells that
held the rest of the time. In this case these drivers are needed:

(1) simple-mfd-spmi (2) rtc driver (3) generic regmap nvmem driver.

On Apple A7-A10X SoC a similar PMIC also exist, but is over I2C instead of SPMI, those devices do not
have a SMC. To make the rtc clock work there three drivers are needed:

(1) simple-mfd-i2c (already exists) (2) rtc driver (same one as above) (3) generic regmap nvmem driver

The PMICs on A7-A10X SoCs are also known to have WLED output for backlight, shutdown controls and
some sort of pinctrl needed for things like bluetooth.

In both cases a combination of (1) and (3) is more generic and applies to more than one bus types, and
allow extra functionalities other than nvmem to be added.
>
Nick Chan

