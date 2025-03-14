Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E0DC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXntnSZAYPIM+jxaf+mIa8NQuEJqCGZgPyMOWTcNl3Q=; b=a4+C2OwsRZ8Se8hB5mtIcOZdWs
	sCcvIpjOp7QDiKoPU0OQJ2b33anraJzjv/D/7lIiQK33qy2/LtfsNsKmeZqJ1T185dK+w2XDAUYB1
	yimEMYIIMjP/JucerJDvup+qVxGjTM2eWm3xv+QzfgIWmitTI1CTDU1GF8Jzayo9UXvCp7fVvpgRq
	o6gHXASg2dc7XY+K70ABnGifAf0BExctLQmRLiw2YrJGkbicpq51Xd2b9e+Y70jTWJng+bPSA3zVv
	iEWFqxJzNnX0aJYcMGtHzi3m6MG6P8vZS95DCgJrqDR3BSarnwuGuGTcLM5Ni7o4oCVphfPueB1J2
	am2N4nQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9UT-0000000EzDX-1sRG;
	Fri, 14 Mar 2025 18:10:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Ew-0000000Ewqt-42S4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:54:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224191d92e4so49401595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741974874; x=1742579674; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iXntnSZAYPIM+jxaf+mIa8NQuEJqCGZgPyMOWTcNl3Q=;
        b=UULacgEtrr8/W+kEutNFO/1sENwem9fnk/PDWxF8QpH5/YSMd4ai79azoXAsl2M0rc
         OFNJXwMWqNK22XQsLN38fdN0QNVLq4Gh5LLD23Egr8pwTwpAPydfhbsjXcQ8uE55tgSc
         uJQux6eYD5SX8cvDTuhHUQ2Oa814HX4GnJYVm0s5cLY+BRLUMiWGkmI3jllbLnc9VBA1
         bijJaR0ApIlAoHxjNMXTcj8Ypc4B9E2tVBwlExdyWV55MOlHAGTDOT3V0bmBHRd6S34s
         X727vTgPxnET0xLV4F1AQgrQl3r8YxT8L7GOm6i2OTVYesLEk594xeGpU3YyRqG+bopZ
         UdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974874; x=1742579674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXntnSZAYPIM+jxaf+mIa8NQuEJqCGZgPyMOWTcNl3Q=;
        b=Ao1DSkTvVptayx/KXMyNJfrTEob4iqbLWUV/YFnsANGFFluY3qhGHuF0vlyM3+PXyp
         /J8DhZ9rxZmmRw2ONlYkMSOA4bSk4h396HVNqof9UXqSUYutreun9pnvKssSOQoGk0L0
         qZmC2A17xwa6qNTKuPgApzfPn281sgEdH8TmVn/NLlzS5Hz/mo9N6it38XJxY62ecaDR
         jJ0KwMOHq4uyKyGGUVpnP6lPC10QHV06hlpBpdEPQmLVFxi2OmOLnlqGYGLbs8Js92wh
         1lt35Sp1o8xQfAgwoHT1AWJnbMdaaGbZI5yluU69FZUHOEzGgwimpGluXeTidjzSbgYq
         4PJg==
X-Forwarded-Encrypted: i=1; AJvYcCWuVTHInYwNrVxsMr0CZ5wdQ1Ban/i7KDUuFgPUUZyVbhBQlhONYW0IwqYBGWmKeOgN4ZUxAaU2Vf6ADmfbYUBl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy/ryM8Zf1OrujhFG9Rm9WE5KcjWohHohZXtZUdPbPI93w+5mT
	uxOEwl9YH/5e3vtw/CqLUi9JYHYX4eCgWjSfHUhDAveQ5lZvWe6zuBKUVg==
X-Gm-Gg: ASbGncuW7WdsM71nbyhnY6mAiL+pzVtKCcJSYPfY2rmB2Z7tnNkuugTODupInGWXXMK
	1pw3XzSlt4RGpgcmvLa5+/7ZW12lpwoFMxeS0Vd/r+E65dAyfmHPDKR9FVKAF8sMvOjkc5I8QX/
	p6Afup1u1G4RScexORF9xM5lndO+R02HZWc4r7g9UJ8IotSBuiQgsBqJ0SCxILMMwgg3zdmOC9T
	Qc+X+z7TikEaOfFQDWJUcHoJ8uAI/x8ouc2r2PHLKiRE8mlgdGo2/7nFCoJKkoWyS8rlTGQWh/o
	ZzcAogmwlLtiL+Woeuh/9UPczkH/D/qpRo5Q5KGw771TEnXZIPS842ubYRswBBMN0E2dyZxA1WS
	8r3Rc0dfz7c7n8dll6A==
X-Google-Smtp-Source: AGHT+IFRwBgdl7FuQhUqV8cZZzVwzJUCim9MXgjq09Y2aIttdNEczOrIm9VXfo4AxaHvW8u0AXsCIw==
X-Received: by 2002:a17:902:f686:b0:224:c47:cb7 with SMTP id d9443c01a7336-225e0867fa5mr47944505ad.0.1741974874297;
        Fri, 14 Mar 2025 10:54:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4d95sm31420535ad.244.2025.03.14.10.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:54:33 -0700 (PDT)
Message-ID: <32e3fd04-d44a-4923-8323-02c53e8dbe82@roeck-us.net>
Date: Fri, 14 Mar 2025 10:54:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250314160248.502324-1-arnd@kernel.org>
 <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
 <71b81647-aa39-4c33-b92f-2c9e6d1e606d@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <71b81647-aa39-4c33-b92f-2c9e6d1e606d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_105435_005683_50E519BE 
X-CRM114-Status: GOOD (  11.64  )
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

On 3/14/25 10:39, Arnd Bergmann wrote:
> On Fri, Mar 14, 2025, at 18:37, Guenter Roeck wrote:
>> On 3/14/25 09:02, Arnd Bergmann wrote:
>>>    
>>>    	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
>>>    		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
>>> +		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
>>>    	}
>>>    
>>>    	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
>> Does that help if the pointers are 64-bit on a 32-bit platform
>> (multi_v7_lpae_defconfig) ?
> 
> Yes, that is the problem: resource_size() returns a resource_size_t,
> so this is a 32-bit by 64-bit division.
> 
> Pointers are always 32-bit, CONFIG_LPAE only changes phys_addr_t
> and resource_size_t.
> 
Ok. Thanks for the clarification.

Guenter



