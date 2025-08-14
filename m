Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9A8CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyCLhoYy7jyy9fXZUW6l5VbrMofMsKhJtElwy0Ukqwk=; b=c6p6sTolQDYQyJEsRwEnKN3/ZE
	nappU8vhENPhLcfL5TshRKu0UFyJXEV3QwzjYYASpQB9u4C1LoeeqA4YEdRXz341kHrSnqPc+CfD/
	XpOcXAvRhc3tv1WQRnZJsSP5dd/jTzzBh37zGrGyuJX1hNN7qMHyhdgqJtBIJJJLtC0MtKpJXusSy
	C4RDEeCINbBmvmbO1w3XNhfmdL2XaCSQsdjMjPfFpSdJVT2e5Vzf5yBE2mGi6vXqR2i/KQlZTV53T
	RCgJWztIcBKSIQ03OLggoahmHjZCN1zBTARzMfbkcKbSytyhfLlhNq6kQocM9c6LtWEyKHAxLwGoM
	siVgEVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfS0-00000000air-0Jmh;
	Thu, 14 Aug 2025 21:25:32 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfKV-00000000Zrv-49C9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 21:17:49 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-435de93740dso356082b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 14:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755206267; x=1755811067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lyCLhoYy7jyy9fXZUW6l5VbrMofMsKhJtElwy0Ukqwk=;
        b=s53xZ6lDxxGgljfhkVBq+RzADI/tjFBlMIBmAsQrD3daisg1F/e4S4FHsWwKJqJn0a
         nalscVuF+g/ePeQKwYnNTGk88bngLMlB5AGOApj8L4vVCJqkZxnMiTbWMqtc49poNLOL
         LKebd70SkvFecFskP1dUsSF9eTl2asc37l9ML0P0s8TxRpeibgJ7OOolqhp+dhblJg9L
         vjdUH8VKer5YxlGjLgioNukX5H2BirlCfxZEmAiFMlWy245JqyRBDhfC/37fnYHAt6P7
         vRyq+LSQpZAPnzTT0U4zAvlFb3ipYSa7pdVRH+owsBcMoq+JO8bH/bFO9ZvKO+CfN94i
         lLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755206267; x=1755811067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyCLhoYy7jyy9fXZUW6l5VbrMofMsKhJtElwy0Ukqwk=;
        b=S4yHUlNbWH5zxhnLu7pBuQQYb/Ql/tcgH+D/WgMNoghKmGHA7QwMQPSIzeJmUy6lQj
         UkeUsikUzGf/Wblau3KCTMUAAyFb1ZxazOHfe/I0g890sveQ/UsqfsBoBvc+Cju9b11D
         btDxSr6vFvsbTsgYD6ZXBusSpBTqGc7AIwdvnpyYjlE/dqBMKhG1vFHsDZZahYraLpwy
         YvQvMmYlWi/zD5tuo+U83tVdblEMtaUwWa8JzJTZtdcFd0SbmnQX1BGuJRMAUAj3BReu
         S5czwAtlC6dxdQY3IFEcplWhNvatxaRgyX/0CrWWvtOth2Slz8yVF67SroCvfprQAud9
         YtNg==
X-Forwarded-Encrypted: i=1; AJvYcCUuIgUyJ2hMrsov3Jd7i9sbf4+DbkhiBjRSTxFb+4ipTP6JfdQs9uXpnQFRUGPj1cSLLKb8GCWt4Lr/x4AOBXxa@lists.infradead.org
X-Gm-Message-State: AOJu0YwyAzrhfiMNv0AHPxX/xcF4cHsc75RZfZRwsayYI3phTkEfT0/5
	FS3lIHCcQQMys3RAPGi3gYZxty/7cWgS0JffyiDELN1BqrFVDP/ACPYKjEL13QP2kT0=
X-Gm-Gg: ASbGncu+HRAuIdg92jRKGxRa40e1Kb7IUA4szBjpyVHD67n+QBhj+ksueVGnTzC8OT9
	OEl0mr7XCHGVYzV+yo2QIDaO5SgF4mTBz1kTmri46tkgub4ydAznwoxolm5qn6fseqZEG3UixLz
	irjGMKlG6i5kaOHRZiIF+8jxjuv0Q54HW9ItvtnY4NpL5tiRcscDCHD6QydTDzvqUgOxcWfIyt5
	gZfzk+wTSV/aWe124MSZB+eF4uae8Mkw3CXSXf52Jc4qxmwGtOG8FPxWeHUErhDPDFOzePm7vkZ
	Z6hcJcJKTRUZr5cEtPb2suvYzpF7/IMKLoG7mbDNeDH55Cox9eTLZ964zFJJnCD3dESome8ZB7B
	EwA6BvEBd0xhNZKnxYmtSRcfNP59de8rslHtlAifp0rpc7xOov2lh6ibm6V5JFpCQ5Oj++GGKJq
	I=
X-Google-Smtp-Source: AGHT+IHLwc3eKl5bHyawwGLuUnTbJjGRZty13s2Nm04iMLIbVVsuSQ73l1ycimhqcR9RpsB41KxtMQ==
X-Received: by 2002:a05:6808:4f24:b0:41c:95a3:8180 with SMTP id 5614622812f47-435df7caeabmr3019825b6e.20.1755206266927;
        Thu, 14 Aug 2025 14:17:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:2d9b:959c:3c59:5831? ([2600:8803:e7e4:1d00:2d9b:959c:3c59:5831])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-435ce6fe528sm1217497b6e.7.2025.08.14.14.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 14:17:46 -0700 (PDT)
Message-ID: <5bbdddaf-4ff1-4cff-a933-143160896717@baylibre.com>
Date: Thu, 14 Aug 2025 16:17:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
 <1a87f436-317b-40e0-a655-cd82f969f22e@baylibre.com>
 <5b02293b-9c86-441b-9344-2d0263eb1659@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <5b02293b-9c86-441b-9344-2d0263eb1659@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_141748_035147_53A62513 
X-CRM114-Status: GOOD (  10.73  )
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

On 8/14/25 4:15 PM, Sean Anderson wrote:
> On 8/14/25 16:55, David Lechner wrote:
>> On 6/16/25 5:00 PM, Sean Anderson wrote:
>>> From: David Lechner <dlechner@baylibre.com>
>>>
>>> Add a spi-buses property to the spi-peripheral-props binding to allow
>>> specifying the SPI bus or buses that a peripheral is connected to in
>>> cases where the SPI controller has more than one physical SPI bus.
>>>
>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>> ---
>>>
>> FYI, Mark's filters won't pick up `dt-bindings: spi:`, we need to change
>> the subject line to `spi: dt-bindings:` on the next revision.
>>
> 
> Sounds like he should fix his filter then.
> 
> --Sean

No, this is a documented expectation for contributors. [1] says that SPI and
a few other subsystems want the subsystem first in the subject.

[1]: https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html



