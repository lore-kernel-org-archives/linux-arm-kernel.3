Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E9DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmPW8V8zA0N+0RM8g3oXGj0lKhBGP6NeWfr9DyiUeXw=; b=LeX7GHWYnJMduIi1sozKKsOVnl
	mqWLVHImTvS0ekoqXshnpUB2xGTq09nOhQe/T75NJD1WOja0FjXLhcYcUQAa/rW3tLSgTksm/Iuj6
	M7wR3BxQLPy6Wc94nsNWRKoK7Qq5GN4LzOgMOfBIWc5X2TqDccLH4mT9rXOOG4DdN+Cf8ynG4GuBy
	OpLffUj1on4N+v6zKmnsQ7SEhPnbJf3xmnlbpUgKGWhHMQRPx5YQJJ4NxypiE+O1C771CkMi1c68X
	6TxKaFeAdtn5l7Fbt2GQiU+SFAK3Yw5hmjK2PPiQr1TB0YbIEy3sX76/xS4kiIEbwdqBBrl8Y+FTI
	JY0qNesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX3ZR-00000009Rek-2lFO;
	Wed, 02 Jul 2025 19:56:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX3X5-00000009RRJ-3Os5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 19:54:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso53129666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751486053; x=1752090853; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TmPW8V8zA0N+0RM8g3oXGj0lKhBGP6NeWfr9DyiUeXw=;
        b=jpT7FP/K2ZRYs/k06bvcUcTtC0soVSBJqMJInIfnUDTtLI5rY/aqKwb9UzVDZQ4d8x
         cdfatq0ZR4M1fM82ka6M2daA55lDx1KqahC4CzySD7xNC8CkE8wt/yMbmCxq9tr7U4qF
         nFxAZqKygmleFvZEPC9huV2/Ji1Wqb4ko9EsNbbrUh63mpm1DuD0c1sARP6kWxn4fgRD
         CJlYzthsmz3S3xs0Gw0ODrFzAuefa4puNvT4LXKTD73/91sBxyLGFmI1OUOEugWUkzUM
         rcGLFIKZarBEiQbznI02EkBH+yaDwCKt2V4U0K3+XKon4RfGUxGw8wZf2NWS+Q+/VCWe
         aPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751486053; x=1752090853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmPW8V8zA0N+0RM8g3oXGj0lKhBGP6NeWfr9DyiUeXw=;
        b=uTC5WHDbay/Ro2yIHCd7O8KgO9jdDZpsL9tOVSmEKDPuwU2HXse3bYaeKHaAO4I95m
         8gZgu/0H7Tusb46cgc1mYC07493D84+1hedRJqB2XCqjF8Iyh1KrTAouZOx3LJBi3MdX
         p9VbrUDU9bpL58YqYAaXP1DpEw1lJsF+yLml3P2187vyqAj59OUfJEGwiTeENUM5TnqD
         o6GsOe1ZDtjiNkKN5m2ktIQEuVwyXHWREt7FdPQmvMgOuXzyvHJ6GZd6tqz24Sz6Q3zy
         yd7ZKcGZd7ZjHQJGO5/2oVDkpDGoHUtQLf7dU0CltdSTcAYURCNWoZXnurUuO0qwVVJL
         5K+w==
X-Forwarded-Encrypted: i=1; AJvYcCUJGNa3OixzgdH+/0bAM2uZhMnod+LK3TUmOoEV6BqZIpGcqm0+c0EPCGAy89l90MMldVgc3nqlrivXKkiCspl3@lists.infradead.org
X-Gm-Message-State: AOJu0YxK16uoFc1zPyoK9MOZn0gieCDaeGYKvfC9O4cQMiF+TatXctjl
	jJ1E9smop2d6kVBQXkhxW+dMg+BKt4aSU10Ppr1ocxhE5eHM70YqdTIO
X-Gm-Gg: ASbGncsmDsnG9FRTZBlqYPTO1GZoH8yVg9Vhgy6RSiJosT6k0YqsB6AJ5exggA85Soe
	ENYa3gtEOr3sc4SXXl9+FcrOL0/JQ+uvXMkbMogUb2SeCU4Pqtm3UtEYgiWKy/Dx0+MsM1ldH/q
	KJMxZa2GFJdsXwN8BTvbtGQ2Pd7Z+Pga+OjcTz8YFkIRKCjx+r4AHqmAgnUJM5koFcdCB0qodVG
	sm/OraJM/f0BNiusoagH8/VXSDpAC0cC/Ijucq2QTEI1z91PfuzzbzBx5yLWxLTJaUVaprjhYma
	ep0Onc7BTLnPijYubQ96jBYWBcvrjF0Xr8xBMEAb7ZIfXoZQdBfLNCoJHHKA7v5SJPjUO3cGAP7
	jctR+vbRVvgu/OA==
X-Google-Smtp-Source: AGHT+IEEv4SAI/kYMvjmT0AuIHDgZyTBNcF2bWLyaYLuZrid3Rgx7jF4/Zg1edoD8uel5WIfiOf7DQ==
X-Received: by 2002:a17:906:ef0c:b0:ae0:a464:99d with SMTP id a640c23a62f3a-ae3dd3c1e03mr18767066b.17.1751486052730;
        Wed, 02 Jul 2025 12:54:12 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca201asm1132959266b.150.2025.07.02.12.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 12:54:12 -0700 (PDT)
Message-ID: <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
Date: Wed, 2 Jul 2025 22:54:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_125415_857752_86291A4F 
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



On 7/2/2025 9:49 PM, Mark Brown wrote:
> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
>>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
> I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
> system in -next which seem to bisect down to this commit,  I'm seeing
> separate boot failures on the EVK so haven't been able to confirm the
> status there.  There's no obvious logging, the dt selftest shows:
>
> # not ok 141 /sound
> # not ok 142 /sound-hdmi
>
> Full log at:
>
>   https://lava.sirena.org.uk/scheduler/job/1530197#L5119

Hi Mark,

Thanks for catching this!

After browsing through the provided logs it would seem like no device under the
AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is not being
compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.

Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?

Thanks,
Laurentiu

