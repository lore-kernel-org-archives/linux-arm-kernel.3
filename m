Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637C0C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 03:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSJK5l1XEbWtgCR1VGoo0OE9b5AL7+ONChxVba323TI=; b=KthzIW+MmGDKzuGdAAFYf4p7Uz
	YuQKT0fK+zNjdAlo948ouiuh18sd+3wscBxVDwkx3wfrpzeofnSuX06nfuqp0usS+9hO61BU+0kCy
	CFzOXVPUFGvh85qrkUtMCUAmN++bfqzfCLBi1QQVqFz3EidUptXwo61fFhBWooeBJfdcYkYkzP7S2
	pv7BIHHSYYcOUImvDtRRV5I6LyUJfyhyUeeYAJ1yG7jKt3D8JNl2W+dIgzj7j25n7O4Z71EjZod7+
	gSxzqdVlvKY4IwNhId5Y79pAUdcjMvmondj2IB5MPxsq0pY/phHVMlUsG2PsALVcl/r27DKQJy/oW
	+QScUdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Zkb-00000009uXv-23mY;
	Thu, 24 Sep 2026 03:03:57 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZkY-00000009uXa-3HG8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 03:03:56 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso1002716a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 20:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790219033; x=1790823833; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSJK5l1XEbWtgCR1VGoo0OE9b5AL7+ONChxVba323TI=;
        b=I0RdoDdfKn/P7p99aC3xxX1aOBy9WHvkgePHcSf/Bl0hZWSigv9mxnafFbU99POVWP
         oMVFQ1VwQwPY0BSBLbtqkO4mHWhQaffd8NbPL9N1u5+Zolb3qUD/Lxnjw8jjJuGkAfQF
         XaF2Vj4iZiE6AY9Wl1apf0qljO0gCW7RWRiGBWJ52sRHk4MvFDvHhL5sV9NyAhqbNczV
         vp5WGK5HKLqVMhgollfCfZXO2spQSCDQ6dbldhNW/1LxAJ6RQZOHNggzLyQi9KNRnCBh
         M18h10eCz3Zex4A2aDqe9Ei+IjuJvfvipVEnWWmt9ZMeoKC2WSdJdHekHQ8kJuYNwXKQ
         K/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790219033; x=1790823833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSJK5l1XEbWtgCR1VGoo0OE9b5AL7+ONChxVba323TI=;
        b=2vrV4qJ4uhpuZ9T4w1/9nbuzEdRZ/UtIGSPYiHbRaITxKV6V2Albs0n08XgnyyHwMC
         RaO3KERZRjeCDpSwFd4QJFiiyyzIc6wkqX936zi4+cKGoUVriauQ3Y1SFlHVzx1AHl3F
         H5rumcSrQ2VJ19wemmfdpJRUwJZW/cjhYu6gTf+PEi89TJJW4fmjThnwBVgEFKZu6OlJ
         8etsyxUVPUspunUn9c+cb82Z2MDcmWWUxQVzNT+5R2xi00xDMKN6bfNy2sKJL9FnZoby
         eNhA0SZc4suKzMIVfG0IXxiAkwnBYDkTTKxpQo4ISeelRWnRIxO8eZuxt0+ccPc4B1/F
         NS1g==
X-Gm-Message-State: AFuF++k35PiF7Ng9XU9GNM9m6XCaNcQXDcsun091KN4r1FpUotSJWIKt
	VuiZvn0uO4aJjA7wlgwi8dIgli8AcjjADLt0S0EFMBPHIAlZ7Nfjsiia
X-Gm-Gg: AYBFou296KPDW4KJfwKKMob0WLd9UGiQO6yWOz1UExTYO4qU8YkV+agYrXb0Ni2DpJH
	sKp52nRGkpjS96QrteeFrKFLvrT4rWXPvLtLwyQGgvyUnXUmX9lGss9ZTWt95fpYqX+jAm3uDdS
	I3S9qEe0xUXTWawVKxH/Mg1cId+/fu5+TloaIxvOnBkfv2XtWplSFxfHlQ43NxTCieTZ4OHfE/5
	qIxxOPJcEr6q/LTZY5o7piW54fTBDiYplEJJYzDJ3NfxLqHzET58R22+AJJOsKVnJiK3//taGEV
	SsLoihsTzTf0eu7Vy3VvXWglQzKHp/eAIsi1v/w4nLgbYs2jXHgqaS07CgCXVboGiihHqeM4zpn
	quUDRxvBvAQwenO24p1/X/wSgCpeC4j2SIsp0QX/ivLskUuysd9adXx+ilLZayYEiWe5vREtl8L
	lYITuuDnTSXqFwUedDlgeNqUad3CAifp7Rll+endTTw8EX+KPScZF3qT5Gw5UAcbxeEOQPeX4gE
	fqzb+vA2A4Ptg22JhcqOa9+B5n1AoHloLwJM8g74gx4rfr/mA==
X-Received: by 2002:a17:90b:51c1:b0:39e:6c68:c77b with SMTP id 98e67ed59e1d1-3a098e078b8mr910792a91.49.1790219033463;
        Wed, 23 Sep 2026 20:03:53 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09738f98asm2082693a91.15.2026.09.23.20.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 20:03:53 -0700 (PDT)
Message-ID: <d53cc934-965a-4ae8-a6cf-298c5a587e5d@gmail.com>
Date: Thu, 24 Sep 2026 11:03:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton
 MA35D1 SPI controller
To: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-2-cwweng.linux@gmail.com>
 <005e8cd7-811f-4304-bac3-e0c531958922@kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <005e8cd7-811f-4304-bac3-e0c531958922@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_200354_911547_E94733BA 
X-CRM114-Status: GOOD (  14.82  )
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



Krzysztof Kozlowski 於 2026/9/23 下午 08:35 寫道:
> On 23/09/2026 06:19, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a Devicetree binding for the SPI controller found in the
>> Nuvoton MA35D1 SoC.
> 
> I could swear I saw it last days... I did check and indeed. There is
> qspi which is almost the same binding. Why this cannot be in the same
> file? What are the differences justifying duplicating files?
> 
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for pointing this out.

The MA35D1 SPI and QSPI controllers are separate hardware IPs. QSPI
additionally supports dual/quad/DTR transfers and a target-mode timeout
function, while the SPI controller does not.

However, these differences do not require different Devicetree
properties. The register resource, clock, reset, interrupt and native
chip-select descriptions are otherwise the same, so I agree that they
should share one binding.

There is currently one driver-related difference: the existing QSPI
driver does not yet support GPIO chip selects, while the new SPI driver
does. I will therefore keep the QSPI cs-gpios restriction in the shared
schema for now using a compatible-specific conditional.

We also plan to add GPIO chip-select support to the QSPI driver in a
follow-up patch. Once that support is added, the QSPI-specific
cs-gpios restriction can be removed and both compatibles can use the
same schema constraints.

I will merge the SPI and QSPI bindings in v2.

Thanks,
Chi-Wen


