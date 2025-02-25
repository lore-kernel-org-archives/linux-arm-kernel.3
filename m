Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED40DC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/fHdL9OxTBfJ/OtLlF+A8QVXV0YakMI11nkG7r9zEY=; b=IP6NNdwtJmejmt7BXMrRvIb6RA
	FLxd1dInDDKAMkIw0CRNohIY2u8ClR8N8pAj77Gk54C+Pf0tUB6qWS2uPb85RnQBbXuSvtMsLzj0w
	Xnwm2i0ldVJXleAcnpVk0U7LI+S1iFQCWn277/2GD9Ps3nYPfNegQiNnZnkIFj0tTCXFlEp30oeQ7
	OywH8KjhgIlNH8UEnLkqLtAz9s+lvI2yy+9hkJ8/QHRIhgLNFDm5YL9fOntrt0TvSra6UauCL9VyQ
	3try6o7fag2rD14fdtmYmzFRzzoOPAeIPS+FzljyfdwNxqjDhSXWoJMS6WSgi0ikOlcQCLMR3G7DN
	hK89mIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtfR-0000000H8o4-1arg;
	Tue, 25 Feb 2025 12:04:05 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmscW-0000000GvAs-1WSW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:57:01 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30737db1ab1so42835201fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740481019; x=1741085819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/fHdL9OxTBfJ/OtLlF+A8QVXV0YakMI11nkG7r9zEY=;
        b=Ki0WOKj4w6sZwqECsza4zg71+6xJLyMX+ZVSrz4jFTpedssx+A48aBnUSkFR3cKYkh
         lm8PdHLrT6GIHZd51Y1jnMINWkg0GGAmzy8gU4H8AKtA22yUPthxnpKz5aNloHZ5vKA0
         aqO7nKbkmsHzloST+9bZCpnsfi3nspKHNw37lPiVAXCOgUbw0ITi2THmo3eu2z/e6hNj
         6Os+kgqi7DZzgHMD6ENIYGF4MoXPKbTjS/d3+P1oFUfUZJu/rY86U40TjvVRg6MRikzt
         7PpOnrXh+SinvRw8+VjgnvAYnm3HH5GqP2zQu/ro6RexM6VftxIu6+cFqFV7E6raSXek
         dKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481019; x=1741085819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/fHdL9OxTBfJ/OtLlF+A8QVXV0YakMI11nkG7r9zEY=;
        b=jI31zMjbB7VDZeKH3ZH+3LsevgPAqY7LElRS2PB8roH9Nt3Ff38vf89b64sCj9DyxK
         zbYVA1MhgzIvk2i2Eciri+xG0UnhzlujxOAGRZN/mXUrDPZZrgOkelG3KBcBmXB7S3k5
         lO5D6DiT2yerLsXxUhM9DgI6UUPYpSWh5VjnmJzenikR7HmzhP/9nxKQ1hTs7wg1Yymu
         O8D0LYXBg7uasFCJX3vdaGXMMwwv3as3yAu4zIhbxN3sr3lsEehGLf1sXVBejjNmQMD5
         S/uWp/U3F5258GGRbAJ77h5Obiwk6OULccAq2uR8BMsOGq0KkfFnfuApIE5eZ44u8y1T
         bFDA==
X-Forwarded-Encrypted: i=1; AJvYcCXq2mKGes1l1LGN37s2ugm2KhuzLN8y+MtgqlGYDke7R897VNLtZ21Ap7AFxBfMaxSoMwfvCBUy+Qb8XJ2cc2H5@lists.infradead.org
X-Gm-Message-State: AOJu0YzEPU3RzAXIH2NBqaYKIbTUFhfw0om4kaRzRA8PsUjyRjE1hnAd
	ZpWeZarLgVudGdw21dcsF0SP4UQgOTunT5A+PZjrVEsfzatF+xZQ
X-Gm-Gg: ASbGncsyiL0abqjRO0uM+uZ+HllIXK31BytpY2ib4ipdtZpwwqtACPdSl0nXkaRHBaa
	WuZxie+OK40GPqYJep3kxzNWDBnPJDz2PJcjDJEsehpjUWfdZg4CJXvI8o5mvhOm38m3YPIiPiP
	tFgvjeND32uyqAxDGVNa151b54GVSNjmkTcdSCB6bB7s4d9K3oxM3sfFQpC9pUqbYGSAkOf3cBD
	DXO8j71bbXgdOM3OnQgVybMy+JAtGn//Tz4vYC79i+JLJkow5dUHcWnj00bk/Cuzk702y/juaUZ
	qyK52AW3W/G7XagvHvgoSXwVHMkcDIbeDNK057g=
X-Google-Smtp-Source: AGHT+IH2/CKNaTosFs8GlS0XdmUzabLuIWWzOTmpp5OU7F/me7OdOFzkGeicuNnt7xucX157I9qrZQ==
X-Received: by 2002:a05:651c:22e:b0:308:f75f:457 with SMTP id 38308e7fff4ca-30a5b18ae70mr54123081fa.12.1740481018475;
        Tue, 25 Feb 2025 02:56:58 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ae80besm1961621fa.93.2025.02.25.02.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:56:57 -0800 (PST)
Message-ID: <1e0a9915-fe52-4569-9da0-b0761ba8fedb@gmail.com>
Date: Tue, 25 Feb 2025 12:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_025700_405043_6716CA84 
X-CRM114-Status: GOOD (  22.86  )
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

On 25/02/2025 12:21, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
>>> +/**
>>> + * device_get_child_node_count_named - number of child nodes with given name
>>> + *
>>> + * Scan device's child nodes and find all the nodes with a specific name and
>>> + * return the number of found nodes. Potential '@number' -ending for scanned
>>> + * names is ignored. Eg,
>>> + * device_get_child_node_count(dev, "channel");
>>> + * would match all the nodes:
>>> + * channel { }, channel@0 {}, channel@0xabba {}...
>>> + *
>>> + * @dev: Device to count the child nodes for
> 
> This has an inconsistent kernel doc structure in comparison to the rest in this
> file.

Hmm. I'll take a look at the differences for v5.

>>> + * Return: the number of child nodes with a matching name for a given device.
>>> + */
>>> +unsigned int device_get_child_node_count_named(const struct device *dev,
>>> +					       const char *name)
>>> +{
>>> +	struct fwnode_handle *child;
>>> +	unsigned int count = 0;
>>> +
>>> +	device_for_each_child_node(dev, child)
>>> +		if (fwnode_name_eq(child, "channel"))
>>
>> s/"channel"/name/ ?
>>
>>> +			count++;
>>> +
>>> +	return count;
>>> +}
>>> +EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
>>
>> I did not check how many users are you proposing for this, but if
>> there's only one, then IMO this should not be a global function yet.
>> It just feels to special case to me. But let's see what the others
>> think.
> 
> The problem is that if somebody hides it, we might potentially see
> a duplication in the future. So I _slightly_ prefer to publish and
> then drop that after a few cycles if no users appear.
> 
> Also this misses the test cases.

I'll also take a look at the tests, but I have a bit of an attitude 
problem what comes to unit testing. Adding tests for the sake of having 
tests just hinders the development. It makes improving functions less 
appealing (as tests need to be changed as well) and adds bunch of 
inertia & maintenance cost. Sure, on complex functions having tests 
increases the confidence that changes work - but I don't see much value 
here.

Do we have tests for all the property.h functions?

Yours,
	-- Matti

