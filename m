Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFB3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mT1rikS6b8kB2u/uSUaszdBIfsLkUe2Hiqjm+R1lo7o=; b=0iAg2IKuFxiE75rOWm6MWrzRJt
	xp1Vw+i4OQ8kyYuz4OmaJKkrhf25W+SrQDcjcEqPdl2q7qp7EHlq7EU7ZsdZ6wzBV/x7A7yDG1oRO
	FMrogCB1rFs32k7LsQ5yUIbnoJuMZPdo6N+IZKM6GOuZhc5V2IkHdUxERoHVtG0g9WQ1ef/RHlVVb
	pR5h9GOVOQmB6nLhF5r1wlzcd82hgHodt1PSgCWPUonzDPqoHLbLIQfnm+J2N8vuU+3bvn6kAxIhi
	yABivMBpPnfelecBbIHHLEf6jpkIMH5JAxWAO8VmLFSr8b+22uyYInynKGWxMUq7DXEn3OPS1WxoY
	zDS1mkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1xM-0000000FNCl-3lje;
	Wed, 15 Jul 2026 15:55:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1xK-0000000FNBy-0fYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:55:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cacf197759so37636525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784130929; x=1784735729; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT1rikS6b8kB2u/uSUaszdBIfsLkUe2Hiqjm+R1lo7o=;
        b=QoGYFGSNx5NskjTQcszPvwWSWMo4fWLvlkRxjpLSbeGAd1IPYGIJTZ0UHtfj3pphSZ
         7dGH+yEJlBqeIhmDMSOgsYAOoN5D2pv4F4l5vsgL/4JEryEa0tVVHgIj3mK2qYXaBz5k
         E1dWYWqXTuWzPLnir3dHjLO6wgsTSYWBbkZ9+btAd3b7OTdnhoj6fz7kblAeA0EUvnGe
         TEzNd2UPpCd17fe/eUP7t2whL9BqrGCVnrPHsqQQKF6UhCTiT8jUUQlYlqQzeoohnI3o
         g45+MpLI5Z5x4bUledwuVpE+o15joQw95QwwxP7QlVvfNXtnA1bguDdYnCgdNXaGCg8X
         I6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130929; x=1784735729;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mT1rikS6b8kB2u/uSUaszdBIfsLkUe2Hiqjm+R1lo7o=;
        b=eFJyNRlEWMkJEEz85jpO3HvNRGHAqRRSxRVtapi2gbpfi64ouERpOxnq4q4hahjkbR
         0oWk9IkLIt6gULX/4FeGSkZVh0/w6Xf97mHdPJzvaTKJL/Cz45TpUwZonS/CrK0bnHLA
         N9VnEITCtGVa7NLYQx+9mzoYxZtHuWVOzexGTKmdU3ntjf67xiHhYuprHwYvT+BEsC4i
         1hI53nFuwCMS8QmANk6nfmLOvRS+8TfDKdJjD7ALiSeC89+/qy39bp1ZY35s8YmAu+k8
         OJ8mcVeyOmqLAP5gWFZ7QfTqHozsTqbgiMr7/2d3X3k9YpsH4/CEk0DLwM767oWYYq48
         OV9A==
X-Forwarded-Encrypted: i=1; AHgh+RoF2Wf+/8LgX+TzxvUeecsoU4Vuan7/9H/NdcL10n/h597R9KISoO+D83UU1Pei4SA5330dYFBKfTtZ5KpRyFIu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0yJgpxX1y4tYcAakebbaPhBcMTAnN1/5gck4AHISosakN0WcZ
	PtDE0aoZW8S4zQLrguUspDH0HvbdQl2STsVBa2FtSR9laHkl/N8jnkYT
X-Gm-Gg: AfdE7ck+NOjGCW7TFf27vE7LkVQICcT8onOStst1S7Xu/MRc47bAiY5Eukme4NrtkEA
	oCz/wIlP8B/iwMXbilBp2aTQ339Seyg7nYzROjZiSN/GnxuEJnR51LazHryLHlbwY6yGco8hskb
	nE+Rf89l7iKnnbiAOM6M9qRuSNMWh3I86/obxrwBX51m2CV5OHmrJ/NU8NVQmVFDh5PXB+XpSHS
	5x63y0mbOZd2rs6QO//PaFDkLXr6C94yD6L1ygFGh55Ody3tm+wYpqCOmmo6SQHZoTlXtI2utnq
	O/JDHuTmEOPNWD45l/eOWXGyY81nytPZxv0sPBPTRe4w3UXoUlGRbrPJ3dHBfxXWV7Vbzjd+Mmd
	byllTeVpbf+SpAt3UlZqnEF4qhN2JMe44PJCbIZCGO4lIYOyv+hGrG1mT+6PavSUuTiukDfT+Sj
	7xaFGarMaLpf+RUWVlzGjUCjhXGtL71RfXwm/yYk2zklUYxgmta6LSvGdBFK8iBw==
X-Received: by 2002:a17:902:d990:b0:2cc:ffa6:4622 with SMTP id d9443c01a7336-2ce9f053471mr176948735ad.41.1784130928644;
        Wed, 15 Jul 2026 08:55:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm4637235ad.63.2026.07.15.08.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 08:55:27 -0700 (PDT)
Message-ID: <c2bbbd1a-a188-41f0-8225-65ca52ee3afe@roeck-us.net>
Date: Wed, 15 Jul 2026 08:55:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Initial Apple M3 Pro, Max and Ultra device trees
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Andi Shyti
 <andi.shyti@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_085530_212533_14606080 
X-CRM114-Status: GOOD (  21.26  )
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

On 7/15/26 02:11, Janne Grunau wrote:
> This series adds device trees for Apple silicon devices with M3 Pro, Max
> and Ultra SoCs. The M3 generation has fewer devices than their M1 and M2
> predecessors. The only non-laptop device is the M3 Ultra Mac Studio. The
> Laptops are the known 14 and 16-inch Macbook Pros now with M3 Pro and
> M3 Max SoCs. The M3 Max variant with fewer CPU and GPU cores has
> additionally only a 384-bit wide memory bus instead of 512-bit of the
> full M3 Max. It has a separate identifier (T6034) and so there are six
> laptop device trees.
> Another difference to M1 and M2 Pro/Max/Ultra is that the M3 Pro is
> distinct SoC design and not a smaller M3 Max. For this reason both M3
> Max variants and the M3 Ultra will use "apple,t6030" as compatible
> prefix. In the M1 and M2 generations Pro, Max and Ultra SoCs shared
> "apple,t6000" / "apple,t6020" as common prefix. There is currently no
> known difference but M3 Pro and M3 Max are not as closely related as
> previously.
> 
> This series adds the same level of hardware as the base M3 (T8122) has
> in v7.2-rc1. This includes CPU cores, interrupt controller, power
> states, watchdog, serial, pin controller, i2c and the boot framebuffer.
> This is intended as base so that support for additional hardware can be
> added to all M3 based devices at the same time.
> 
> Merge strategy:
> Since the dt-binding add new compatible strings without driver changes
> it would be preferred if the whole [1] series would be merged through
> apple-soc/arm-soc. This will help ensuring a warning free
> `make dtbs_check` for followup series with additional M3* hardware
> support I hope to send for this cycle.
> 
> This series will conflict with the M4 series [3] sent A couple of days
> ago. I would prefer if this could be merged first (in order of SoC
> release).
> 
> [1]: I see that the M4 watchdog change was already picked up by Guenter
>       in [2]
> 

Whatever one does with individual patches in such series seems to be
wrong. Are you saying that I should drop the M4 (t8132) patch from
the watchdog-next branch ?

Guenter


