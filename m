Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74DCE9A05F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 20:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI/A7iNXCicM0eX7PESju9pA0T4gNBVRW7g2h/AnymA=; b=nzByhWYBeD3qf92XJHPYCqiTUh
	d+53ie1KPxS9VMqpqIQgEg9flX+dzv+dmYmPMRfbM8rkhS1FEF4n2qSPQiwZIWDOjcVBG/qMWrSjJ
	OWWlUn6g8ByFnOzZ6RNXz/1zm4c1PK4Cj4aCa9kMNuQZ8i0cqLSz6H1cVMRMAwcLlmTZQUFqTUzFS
	2GvMwPFUBx2Rl2LdOikb8X6kQ4gHkxHPLfrWyhAA0pRqpf+FYtmGILBwyTQqrQH2X/Lgumvj4L1pt
	vWcLsDx5DTA9OSguJ5p83kZXVdzU6kczO+sv2s9rb6IGIBH4BZ5izAKd00Z3Ze3pGyYt11GL6RWmJ
	pgqhOhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtAni-0000000C3bs-1cVT;
	Thu, 19 Feb 2026 20:39:06 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtAng-0000000C3bU-06Z9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 20:39:05 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2baa098ffc6so1285105eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 12:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771533542; x=1772138342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SI/A7iNXCicM0eX7PESju9pA0T4gNBVRW7g2h/AnymA=;
        b=zclHk6F9d2ZVGalyQwoW0EiS7WMQ6wVatas12XzIXbMTRceOh00uLSueCnhvRTShU1
         i+aE7TGpr40mUyNZjqdpEiUy9RoOUMR1W+83r8g4P3po5UAnllYMFumkWqKxR/wYwQJT
         AtmR9GpcGP6L92Ivi2hQ3CQEL3lqXOGelvPd4obtQD3CXDO7rrzcewp9rIp7jTPtGs1X
         Lg8E/LcT3bNCmRWUVOOFwDBfXScWhWy2r+/RnIj/mGf1LQ9jUYKpyOP0EGtE/0qDy15e
         6HP7V4F1QdPj83Z6jzKZ4A4QIzTw4tVzrQ+5rvWAGfF50x+4m2jIFPJHAIep+RaZrLh+
         FvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771533542; x=1772138342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SI/A7iNXCicM0eX7PESju9pA0T4gNBVRW7g2h/AnymA=;
        b=kXQ7iWCfb0G3tJox0OoXjgYfo76sAvsfeGKSXADtCM8Wms025EfVOgFDMT8aL7qE7U
         rEFxMCztN8+4HlhDxvUt52ZqKoaJPxkINBfkhdCwQBYCXcUNbULaYO7rZYVSM7RLaY8A
         fydvOv1laaBUvbvuSVpyp+GINWON74gdGtrGLWR702rPG7wlLyb/UycuOWWGxAccwr/B
         IKc39g1jHVtEnjUy+DnvA0jkYPVhiJQ+XJOIpJvjUZxmhcL46KNjhD2zSJhlqOzhrpY3
         VZx4T72E5OcK/WcfgO/Q5lhpZi/ajuw1GUreGiHWzGRoX+eASLfbkuyZ/BywA7R5jiJl
         t9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCV38x+4IZsAUjTIXOQFTh7gI1ZmfNmY7rqnry844tKj3XCUohaPpUpxZWAmWp7lqTYueJyY0kwTfkJEK6+cAGg2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6bxWIbT0JutuvUWKlmCJMCEZwkuSsejLohFOkEmiRswM49ye7
	9GJaObbJAwoEH3cWRaVcHGFZJWWfBMa7mhg+wI4xZ27kGn3nIcd8lwU0Z5GNCjqc7Q==
X-Gm-Gg: AZuq6aJH38GZu/ZtsMwReAy851SgBVBi/1oa9yZN8NJTMwUj+PH+0xUiT1L8t3WNgf7
	EAI9uJFvVWIWlM4buUzv24deV8ehYBISG2bsiZE0DGviz1Wty6dVbdLFHlf+cCZ394NAyB04Pqu
	/oPwH4lM/k34O3FN0BmTTbGRFONl94Nqs251M+xlLIU17Pkwn0Fx4+h5zhRibdvKU7oJkY0+rXS
	JOH1cLeDHQWTytU+013qoBHrFSqyC1X9lbDOI9TrR8OE3bVz0jjGCflZdywpkiPplmEAH6POfhI
	Ii4905hEQhS+6ACNUIhfN1xotlCNQn3EposWlLjAafsz81iuu/4rGiTLxEXo2sbCinh+MN379cN
	dUkKgdQaTp6h3laNDtC/edIgLFew59hP5xVOBKg2ObjiaiN833g98e3AQqssPRi/z6pY0ApE2tJ
	cPZhQxFI1D7XgFQvaq0OM5FHYzFH8rrani5Zbb0Gep7u4KA8Pi9K6C9lnxc6XW9Tz52/fFICADs
	3GSveyjziki0rk0nHicgCHzpA==
X-Received: by 2002:a05:7300:cb15:b0:2b0:48f7:837d with SMTP id 5a478bee46e88-2baba03cffcmr6411860eec.11.1771533541615;
        Thu, 19 Feb 2026 12:39:01 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:748f:1ebc:e491:46c0? ([2a00:79e0:2e7c:8:748f:1ebc:e491:46c0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658544sm24546429eec.17.2026.02.19.12.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 12:39:01 -0800 (PST)
Message-ID: <5bcc02b3-2785-4fc4-ab58-2dd94ea7b00a@google.com>
Date: Thu, 19 Feb 2026 12:38:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] power: supply: max77759: add charger driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260218-max77759-charger-v7-0-e8d907ce69c5@google.com>
 <20260218-max77759-charger-v7-5-e8d907ce69c5@google.com>
 <f46fa180198ec103aeb1e1c06286c6a2a0fb8b7f.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <f46fa180198ec103aeb1e1c06286c6a2a0fb8b7f.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_123904_072061_09648F44 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Andre',

On 2/19/26 7:52 AM, André Draszik wrote:
> Hi Amit,
>
> I was trying out your series and noticed a few things that I didn't before:
>
> On Wed, 2026-02-18 at 21:59 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>
> [...]
>
>> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..035f16822d85de94c7707ce11c49345c714cd559
>> --- /dev/null
>> +++ b/drivers/power/supply/max77759_charger.c
> [...]
>
>> +		dev_err(chg->dev, "Invalid mode transition from %d to %d",
>> +			chg->mode, mode);
> All your format strings are missing the final \n throughout this patch.

Sorry will fix. I think this is because of my muscle memory from writing 
`tcpm_log` (which doesn't require an escape character).


>
> [...]
>
>> +static int max77759_charger_probe(struct platform_device *pdev)
>> +{
>> +	struct regulator_config chgin_otg_reg_cfg;
>> +	struct power_supply_config psy_cfg;
>> +	struct device *dev = &pdev->dev;
>> +	struct max77759_charger *chg;
>> +	int ret;
>> +
>> +	device_set_of_node_from_dev(dev, dev->parent);
>> +	chg = devm_kzalloc(dev, sizeof(*chg), GFP_KERNEL);
>> +	if (!chg)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, chg);
>> +	chg->dev = dev;
>> +	chg->regmap = dev_get_regmap(dev->parent, "charger");
>> +	if (!chg->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "Missing regmap");
>> +
>> +	ret = devm_mutex_init(dev, &chg->lock);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to initialize lock");
>> +
>> +	ret = devm_mutex_init(dev, &chg->retry_lock);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Failed to initialize retry_lock");
>> +
>> +	psy_cfg.fwnode = dev_fwnode(dev);
>> +	psy_cfg.drv_data = chg;
>> +	chg->psy = devm_power_supply_register(dev, &max77759_charger_desc,
>> +					      &psy_cfg);
>> +	if (IS_ERR(chg->psy))
>> +		return dev_err_probe(dev, -EPROBE_DEFER,
>> +				     "Failed to register psy, ret=%ld",
>> +				     PTR_ERR(chg->psy));
> Why are you returning -EPROBE_DEFER here instead of the original error? This
> is quite unusual.

Will fix. The original thought was that the 
power_supply_check_supplies() (run as part of power_supply_register()) 
wasn't deferring probe if it didn't find its provider device but I was 
mistaken.


Regards,

Amit

>
> Cheers,
> Andre'

