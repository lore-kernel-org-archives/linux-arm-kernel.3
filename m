Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9EBD6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpykImWK6bjT2nlpOYqPcIo7o07mstIYTD+Wq8ULKFw=; b=2YgZn+I8ClZt1uzf5naXhnjbWt
	ijwMwwXvZG5rTE3vGdKVXzeF7yh0IPsxMov4K5PUmVcZW4VDQyySpOqBLkq7cqVOPWsR+wB8GN9tW
	3ciLozoQOjWyvA6AUuCglmf55FmKXPBjLcbqO8x9kgiIVQexUq42vsQQ2zGidSk43ENxBOmKQ3I2E
	j8RI1Qt7mHC4iTIX1fl7CirsgcwVcEcTKcXcQgM1mkkBbtM8v63UXxAFjNqPoWJ8MQ+fBtT4bIqdH
	RAO8khLT5RENoYNoVYKdMB7iNnUMktj39+qEr9HUr9NJ7jnLZ/AwSUdVtL3NJGzbauauI7c4ixUfX
	9ljF95EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8N4q-00000000gcW-3FeN;
	Thu, 02 Apr 2026 18:47:36 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8N4o-00000000gbv-2htU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:47:35 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so2887779eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775155654; x=1775760454; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpykImWK6bjT2nlpOYqPcIo7o07mstIYTD+Wq8ULKFw=;
        b=Q/Z3qrs49dbkAHGYd0GtZaZg3HNa75yM8WUmRvQwB37ErDz5T0fgyFhaLCMmoPiOEQ
         46ZNBbYPqe2MvTmAXfbmeR4Di8XCa2ZxIJVWOI6P400j2OM/fBf4O5+OhtgxvQCKYhqG
         RCIvCDJILb6b40Vm7fRhnBZYX0Av2ujV3L4MUbFdXKVq5W/pYdpS7f2U2Z5pux9ARx+I
         qNWR7lnGf/8zIlHqHRd/PVs0aHwhPIpmb754luqFNP4kqet5UjqHfjMV+ZXiyVAF28aK
         VkA/0IVTN9KOjItxi4+g+GQINN9LAyo3neq9QqPUbFaMs9rUCKpE8D5m0yDzGu0UVtIO
         Ny1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775155654; x=1775760454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpykImWK6bjT2nlpOYqPcIo7o07mstIYTD+Wq8ULKFw=;
        b=fbMcf+hfHRjnTJGIFLcv9iaU2bD1iVL1pcNQmf84DgFBk+Xx5SyplQ0pGgdaBUzseh
         LIiYK1DSAPo04UQGobT9KNkgCX6oYwz9nCSJXTclJbg7EePG5/YaO4ARTrqHxG9Zjc8y
         nrwXjrAvWKbRBaXpIZj2wmF57nrDxfjfGZXbVt5s2jRnBm7X1pIqs2hfNEmay5nV3X17
         +/ps9q2Ncvt4sBnJWTFqLK60CclBdbMmFtWuIqEw8er/pRVrJoD+oLaWL7NjbCVCnQFP
         QvkBb+nlyNxVsDngV1VSk1Tv/ipCp2ha4kN/BxQRj7An3oaERfJtm6h5Wmc2zvL6ibHE
         2k7A==
X-Forwarded-Encrypted: i=1; AJvYcCUCFtz+EBWZXQ4tRb7CByUyI5XxmsVh/AtkDn/bTcRlC4XOdJs8tfFcbdL5P3IQ0vjSCFs+IZtGtk7VdDnSwc1M@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvemu9RvpXx27kZQqC+kqIQycMiL0wdxEdb7j9zmjBpwMXOxFN
	nGG5Z+h6wigtbzZadTjqo71bzvaXTjw2kHpDx5MR85np2hZOq4Lsrqe3cYjbPmM3vQ==
X-Gm-Gg: AeBDiesFjsIC8nN61vNQBn1YNSZQCY+J5UpoOAUQ4IcZaPgJVJC34GuP/CzXt++EjNa
	vVh+v1TsMFgiREwG7XWqAaWPH00uJyPiDa6LCgmq87SwFY7bO6KZS1gGSxM74S22TVKxtGr6ftS
	S0FF8ke/H2nTz7Fy/YEVAaZ+ZxeGDcVWCF7Lu58b+b4eHJAr/W6d+93CfiEfDjWNY5qME5z3KKn
	98UvrD6SfKB+oljK3IY7FPtYHpG3Q3ZqraiefVeGfxwe8vcxa4wDLZ4CoxTZKz4QjBD7PNXdudX
	LpX9DJ/Hk0HEx8SKR0OVhdvkhS68lHG3FZT+xNdMiPpvc9O9AnnYm5ZcHze/1ARe47zQDzhbTyL
	xz/j5PTHFQxO1pW9y8EII95l5yO3XoKq/n4KjCBLV9MMPdotm39ORFXe1MaN6WuOHL2Vwq9Jy7j
	hO4k845f95bY5hNhfCE4mQv/YeiXqQwWef8gE5Iar9iUAitefyFRQk1yTnARkjlYL2F/73RnZM/
	MKMy2C029zlBKTNoPQTfTKh0w==
X-Received: by 2002:a05:7300:e8a7:b0:2c6:31f0:a025 with SMTP id 5a478bee46e88-2cbfc4623eemr138794eec.27.1775155653050;
        Thu, 02 Apr 2026 11:47:33 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:2412:bdd2:9fa6:2acc? ([2a00:79e0:2e7c:8:2412:bdd2:9fa6:2acc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b2b1sm3319049eec.18.2026.04.02.11.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:47:32 -0700 (PDT)
Message-ID: <017b8552-87e2-4409-ae34-9a3ab7365a68@google.com>
Date: Thu, 2 Apr 2026 11:47:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/6] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Reichel
 <sre@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-6-76f59233c369@google.com>
 <ac5-OzwQkczTWtMg@kuha>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <ac5-OzwQkczTWtMg@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_114734_818216_533428D9 
X-CRM114-Status: GOOD (  17.00  )
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

Hi Heikki,

On 4/2/26 7:33 AM, Heikki Krogerus wrote:
> Hi Amit,
>
>> +static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
>> +{
>> +	if (IS_ERR_OR_NULL(chip->vbus_reg)) {
>> +		chip->vbus_reg = devm_regulator_get_exclusive(chip->dev,
>> +							      "vbus");
> Sorry to go back to this, but why can't you just get the regulator in
> max_tcpci_probe()?

Thanks for calling this out. This was an intentional design decision to 
break a circular dependency.

The charger driver is guaranteed to probe after the TCPC driver due to a 
power supply dependency (the TCPC is a supplier of power for the Battery 
Charger). However, the charger driver is also the regulator provider for 
VBUS out (when Type-C goes into source mode).

Because of this, the regulator handle will not be available during the 
TCPC driver's probe. If we tried to fetch it in max_tcpci_probe() and 
returned -EPROBE_DEFER, it would create a probe deadlock, as the charger 
would then never probe. Therefore, I made the decision to get the 
regulator handle lazily and on-demand.

Thanks,
Amit

>
> thanks,
>
>> +		if (IS_ERR_OR_NULL(chip->vbus_reg)) {
>> +			dev_err(chip->dev,
>> +				"Failed to get vbus regulator handle\n");
>> +			return -ENODEV;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}

