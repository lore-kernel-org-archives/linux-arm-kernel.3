Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFE6C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh6sf/0cKXadcZmQR4PGzWs7fubxPpGtogL6k9WOu9g=; b=zmOUw605uG8zHFI1FssDSV50ov
	ylRpVwyi7Gm7c9dRb6XBN2IBE1GFB96mh+MRORNqfUAEXAv6Zq5czIJLEl8AQYy1xPt7IkyRUA48H
	szZjJ2mooKBh9YIkM98W3uetjog3YE1v2buJUsUm0mr2yDlZwbsGfxGw01qgnhzDfy6UpOAsmdCFU
	jhYfJXO7dJtNFGNwG/r5TKGp1kcsg0bPU60aCiM+JNoDys2/YMTnEF+nxnRtMYOikR76m2D/7mcpP
	qx3iglXMkt0e1xRuVCN5TYjoUYgzapmLBzbU+FV9W0cpavgMT6xb9h3ZudSkyF/BuIDP5O7/X6pHm
	XzciPGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsxD-0000000H0OH-05r5;
	Tue, 25 Feb 2025 11:18:23 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsXs-0000000GuC3-2lkX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:52:14 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30a317e4c27so46890261fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740480731; x=1741085531; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oh6sf/0cKXadcZmQR4PGzWs7fubxPpGtogL6k9WOu9g=;
        b=YdFbdsTwRMW4rmi1dsRXXIXZ4+6uhKucM1f8suBf6UMHVkdevv8q70/8FaNqleNRIE
         4txrlMubd80ZnKES0oE6kI5qDknTZwAXGE0hODiHzeKQ1TkS0cNngsE6VfStF/5OC9ml
         M0yIEPt+dVKiwzTESRIOu/dcOcECXc5y4xHGYts2t6NbPGV7v9Q/YsIRrFGSBxfzEMRl
         R151Y7eaegj0xQZVt4W9uUm3i58m2ANtlhkwFjTmt7RijL0PyDn9samnr/qdImOvz8NL
         EOXSrWI3ubiv7lmO97kdDQajUBPUSlBeecp8d3PsTho9ssi3kKzMYQGlIuD/Cn6uVdGl
         HFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740480731; x=1741085531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh6sf/0cKXadcZmQR4PGzWs7fubxPpGtogL6k9WOu9g=;
        b=SjBQChAaMqX7CHZDiwJasRX9rU/3Plj+GSPid6Ay2CYKvjd3o9sUQcPBYME4bDd04z
         NLoYnlW07JprGciEPRquKatWAHn/jUcxCOJNnMsELmgYzUC2kSN3dUbvx3e/kelVRUi+
         VlK6wFoO6xJHVNAmuwSyCk24oph+HifrNL8DEQj5sRU8opGuoGTO52tAhnvtDxMj9LzR
         /udQvKXj07DuMSOJwAcXtUR2TG2Dz22xVwemVQFP2i0QTsOKVIy7X4Yf/LzMtFl9JubT
         LDIakWc3kFAnUDNks3tlZaG007q2czlPAquFfBHwd5pEel7W7EfcSGk29YbMAZ8tap6v
         18Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWefGdyP4Rhqgi1hSTb1PJgof2xc5zUmCt7s/zr4U1gCYmBuZBbPfBsWOXbXktSzTBtjNG+G3guSOkV+b9UDfQe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf9idMr3d0pUOAZ7U1LB+tzyosT0qOG44AUBDJneYCCKxckZ3K
	0TchYyyBSOu50Y8TSsuI8XqrBqtnzmxZCbaGA3GfMh02/W5uhl4j
X-Gm-Gg: ASbGncud6KChGvKlKK7ED3TC1WBmfvvITQzUfXBLsBul4aRsp7l44mIX0tjp5vvg1gh
	R0OgtMIygimz2Wf5N53MmD5BsZx5xahrAQGJ6qgISbaEkGNlNrrDrjFs3yedMbNdT8D3uMHVgiM
	u9ybeLq31K6QJqM+ZScQzvtoGIA+yEzoVM2KUrPHj9aUnh1lIj39blTSjXSZ2EbgbIKIE6C0MUY
	O9XCho6RsNIxd8Ov7PWGx5g9E0apd0ky/AhB5i1Qb1ei06CmBuiArBGWst06zaKdYWc6w6DVmIc
	edqY2HLqpftHVKk5nqPlBVG3GehGIz3k5GnnChg=
X-Google-Smtp-Source: AGHT+IHos/L3fbLnhOLot3czcjTdpc0kSS3ue5NjEpFQm5GfsKczAy1WAOw0rIcb+pgC1rLfhfv55g==
X-Received: by 2002:a2e:98da:0:b0:300:de99:fcc7 with SMTP id 38308e7fff4ca-30a80cb8079mr9573441fa.36.1740480730280;
        Tue, 25 Feb 2025 02:52:10 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ac3190sm1936591fa.80.2025.02.25.02.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:52:09 -0800 (PST)
Message-ID: <f92724d5-e9b9-4cdd-8443-4866946d4568@gmail.com>
Date: Tue, 25 Feb 2025 12:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
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
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z72d7TzZ21WITW3f@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_025212_703236_A632B9FA 
X-CRM114-Status: GOOD (  19.68  )
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

On 25/02/2025 12:39, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
>>>>> +/**
>>>>> + * device_get_child_node_count_named - number of child nodes with given name
>>>>> + *
>>>>> + * Scan device's child nodes and find all the nodes with a specific name and
>>>>> + * return the number of found nodes. Potential '@number' -ending for scanned
>>>>> + * names is ignored. Eg,
>>>>> + * device_get_child_node_count(dev, "channel");
>>>>> + * would match all the nodes:
>>>>> + * channel { }, channel@0 {}, channel@0xabba {}...
>>>>> + *
>>>>> + * @dev: Device to count the child nodes for

...

>>>> I did not check how many users are you proposing for this, but if
>>>> there's only one, then IMO this should not be a global function yet.
>>>> It just feels to special case to me. But let's see what the others
>>>> think.
>>>
>>> The problem is that if somebody hides it, we might potentially see
>>> a duplication in the future. So I _slightly_ prefer to publish and
>>> then drop that after a few cycles if no users appear.
>>
>> After taking a very quick grep I spotted one other existing place where we
>> might be able to do direct conversion to use this function.
>>
>> drivers/net/ethernet/freescale/gianfar.c
>>
>> That'd be 2 users.
> 
> I haven't checked myself, I believe your judgement, but can you add a (rfc?)
> patch at the end of this series to show that? With the luckily event of acking
> by the network people we may have it already done.

Sure. I can add a patch to gianfar when sending the v5 - if this new 
function is not completely NACK'd before that :)

Yours,
	-- Matti

