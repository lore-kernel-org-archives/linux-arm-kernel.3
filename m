Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3664EA71AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 23:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XuBQKvXNK5+webbjEv2fpeV1So3IXoLTLJe+5+zXCM=; b=NHdKrBCBZMMA+i17xau0pfGuBt
	FW/R51HO8yizAl/LJFOoeNLWWhQt0lLL2IiF5razgpRf2XNAF+aMiwHuOQ28JqN92I/YQzNddBFFa
	A44FnIDfLBXBxRRryh/j6POx1AfSv0tN3fQUIE37AJ0iLR0S7wwXwdGxnF3v3bxvs8HvPNaNkSono
	HxHDacZCJbqFIHY2UjOzaP+KsE076kWJ5sm0VMj7AUYt1oP7/87hYjT5q507YlNpjdRmSgdMP04Wb
	ervvbaSr+knxLtOYp64dbmtp9rpqwyeeBRo7qJYCrByMdz4ogB3DJEhtOuKQtvWZj9Fsf6Zq5W+kU
	IioCh7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEbOT-00000006BxU-3aHN;
	Sun, 19 Apr 2026 23:17:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEbOP-00000006BwY-0PkP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 23:17:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48896199cbaso26150245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776640650; x=1777245450; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XuBQKvXNK5+webbjEv2fpeV1So3IXoLTLJe+5+zXCM=;
        b=p7XN2UN7vLbpf6RddkhU3kCSyOk+xS63DD1reE3Gv32Wu/5beL9Dv/quyX5ZG86dwH
         gzZ+HoZfK05Ar625yqFdFIxq3sdv5mleA2t0XOLglHYySbLEEgIFyN+zWKXKa1MCWYdm
         uSbxuNRdlcVRG4f7R6cyrTXdK5s2kiEuV1/uZ8VazJtN/xoExcovR3CivvbdNyF09i2U
         35gAGopP6GfLkh+NNcmlYzr2Fvn8OSgNdSvB9W09/C8g/0bLHBe4fb5+F8OIAaxhsbUx
         THbzECLCmrG/JBEeybvvZy/YRqQ0St6cKdGx88VzTP0XjUK2w5ejR5y0LgLNyO4SyhMY
         6qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776640650; x=1777245450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XuBQKvXNK5+webbjEv2fpeV1So3IXoLTLJe+5+zXCM=;
        b=pg1yLDtDk74p8N6FEKDiiaLmPdhD2zGMfd735yM7O6tsEG4LzNXwbZcsz5k31qHycP
         NYIhqI4T4jG15v5kx1O/CN2g64yq3X1O3Lk+q0vjHV+gxfbol1vLKdtg2Qv765btJoKW
         TxYkNgnKN9RCxn8WNJg2O+decQOWJAblJn3anex7VDQyVlktpEFX6wJN6HtEX0/DYGWW
         m8u6WqJrAan4YLI1Pb2y5Sc+KJtKkpj0H/SdPa0i21vYFaLGQpHJRhrhaYmBIgeGfFXj
         /V7CNSUn1U1p/uHHprz32na6POOWkv7igtHCHLvGTdw+SuKzIM+NceC8d2yvL4oevD+2
         BJdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+W6P0cxRzmnaSnqowv05QmnMyyhV2OeJJV2gFEi7jGtR/ZCIESb6wnmjqqwo3j3HVQPHxEwT0fQllDtrQ0W7+G@lists.infradead.org
X-Gm-Message-State: AOJu0Yykoz1r9XLHUDqPci0S5AJZHZE8oKrk4rrHORqdOXZEVRV5aAEG
	GCA34Oa+7D0qFyCLj/Cr8zsnzn77xCyN0qm07vsTPmkaoCpt2DHZReQV0s9as4xvtL8=
X-Gm-Gg: AeBDiev1g4W2y8vxTlsZEWdd/dnIp+ABPCzr0tI3td4trOMbusWON/T8uqsH9K2R+AN
	wxOG5eEnsxUPv1nONLc0hn9Ukm5iJzPmv33teLUXUQUqLNf1MZ2mQ0z8lXLGdKUo96A5TopXWfA
	k7rV6kdimbbn+pR2s/pVE8J3TI4yoS06VW3PUs89YKdcTmTQcyabCNq5dDpd9LMOfrgKpytdNUy
	hT3awVcKxasjrEoW1i6QFd+0O/JHDD13atSSEaJ7dY/TeC+34wYLbBvakuqf93qNLpWzgqEGt2o
	graxqU/rSG5fOxWxqr1ijqNUmvBWY8wOydoBPLK6Pgoe7ewzwjbXMNx/K4pg8KsLqXb/nKhMONt
	VZ9brAOOakLs31LJusK6R9Vg2XB78Iu7ItDjDfBxGL8uxwI4yfC+4IE08gfUTO6K8xpvXLWdSxe
	7plmp/OHgaDKWCePFv4Qe4dp8u3o6tz94HgxA=
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488fb74dffemr121458935e9.9.1776640650424;
        Sun, 19 Apr 2026 16:17:30 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.218.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm296195175e9.4.2026.04.19.16.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 16:17:30 -0700 (PDT)
Message-ID: <463ab3cf-2ef2-4ba1-9f3b-7dfad523d91e@baylibre.com>
Date: Mon, 20 Apr 2026 01:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 02/11] ASoC: meson: aiu-encoder-i2s: use gx_iface
 and gx_stream structures
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
 <58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk>
 <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_161733_465597_98818E93 
X-CRM114-Status: GOOD (  20.80  )
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


On 4/15/26 16:28, Jerome Brunet wrote:

> 
> Huh interresting, I had not thought of that. Valerio and I discussed the
> clock part a lot for this rework. It is the crux since since the
> interface and clock setting lives in the AIU subsys but serves both the
> AIU and AUDIN subsys.
> 
> Valerio maybe you could keep function above just to set the rate, but
> enabling the clocks through a DAPM supply widget ? This is kind of what
> the AXG is doing.
> 
> what do you think ?
> 
> (actually in the AXG the each formatter widget call CCF
> clk_prepare_enable() but a supply widget poking the register would do
> the same thing)
> 

Hi Jerome,

thanks for your review and suggestion.
I took some time to investigate it and I think I have a different 
proposal that reduces the amount of changes compared to the current 
implementation, but gets to the same result.

The thing is in "axg-tdm-interface.c" MCLK is enabled/disabled using 
"set_bias_level()" callback which works fine because in that case the 
interface driver is also a standalone component. On the GX platform the 
interface is a DAI which is part of the AIU component, so this callback 
isn't available. To get the same behavior I would need to add a new DAPM 
widget in "aiu_cpu_dapm_widgets[]" and then add it to both 
"aiu_cpu_dapm_routes[]" both in "aiu.c" and in the device-tree for AUDIN.

What if instead I add the "prepare()" callback to 
"aiu_encoder_i2s_dai_ops" and enable MCLK and I2S clock divider there? 
This would match "hw_free()" calls and it would be a change only 
internal to "aiu-encoder-i2s.c".
To support this I will:
- remove calls to "gx_stream_set_cont_clocks" which are arguably not 
very useful for the GX platform;
- use the "clk_enabled" field of "struct gx_stream" (unused after 
removal of "gx_stream_set_cont_clocks" calls) to track the status of 
MCLK and enable/disable it only when necessary (ex: prevent multiple 
calls to "prepare" to enable MCLK multiple times, etc);
- keep using "snd_soc_dai_active" in "hw_free" to know when to disable 
the I2S clock divider. Or perhaps I can rely on "clk_enabled" also for 
this one so that I can manage these 2 clocks uniformly.

Is this an acceptable alternative approach for you?

-- 
Valerio


