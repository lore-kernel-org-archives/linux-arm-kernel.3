Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4057AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbouPgm0agqCXksCDmZHeVO+0y6FRGzW0Of6wTqd3II=; b=I1D0NgHmHHejJdIL6ZS9VT+KMd
	Ks7dIQXSw0Vpr9MdodeZ2vqY7DwikDPG/zFk5vygrIr2Hrv48/1fvauM4EWN4PXtgbPRdQ/HnNluE
	AtVXgBilZONUVJUnmRJVRYDbaLeeMwl/rMRzqVmYTB5dM/cFdFO5f/GnrGpFMacfJ2oa++60+JDvg
	cKPeTkZDQNmQVdR7EqVxpoY5vQC8RbrQP7rsbhO+hPgS+P8+7aKh3kjNpkqqXk8IWY2x/rmmY972s
	qi07BsXvzON3Ha8pYLS7L3Lq3G2VI4l+oZiiivT5DERO1UMVyaMA61+yvUS8DTiA55tk3pdI+dZ9j
	/6PzUe3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiErY-00000007tmL-2nYj;
	Wed, 12 Feb 2025 15:41:20 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEq8-00000007tV4-1SLe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:39:53 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-471bd1a0c0dso106531cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 07:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739374791; x=1739979591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HbouPgm0agqCXksCDmZHeVO+0y6FRGzW0Of6wTqd3II=;
        b=JVo00nvMq3Q1FclYecaRmTpog58IN2aiTKzlJ+hgVA7jaT8WriUyTQzZAW7iH+sg5+
         ofI+uRpsTDjyDYb0tyOvARA7IWPw6LOO5+TMi/fXhjWTnZ9Aogg3lc5Z+vR68RDCJX1q
         37t3XNgzcJHbKyw3tVw+wzQX+KT/nC1RyK4GdQNnRxQo940yddmuc0lvidB6Z9FaeTnw
         B5K+jVx6Zcyw6BSYvkyyaePUrAwFgE4c3mvlOdYgNtFMKExl2AvaP32e/+EPQqhD9jdt
         wBYtXe9PIVNRFo7iWBHUV8UsQ0qwMnQWHEDxvXOVyq2NPVORNy/L+nukABF7GZhJvGyC
         hAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374791; x=1739979591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbouPgm0agqCXksCDmZHeVO+0y6FRGzW0Of6wTqd3II=;
        b=b8ee9R3fTuqQ5Qw/r/HS3UOLz8abJ8XZ70EsTvVpMkT6PudV7T/DYG6mcurZ7gclnW
         rv/5lZA08UGcpjTjDYeVQstkYS9diHkzNrz0OLtKl1N6Le0qSS5C7yxFulVZ16BdmGHR
         O0OyZCfEcfqQ1hF4Ck1A9J8/cdXO6f13BUDqjuYkfmd0F0eCDZb1Wa1DhznXyQ2Z/pMf
         lB9XzQrOMOpJRxQAhBfIxEKIvjApvmffUEn+4HE2fWGCLSzAWf448GVh5KWfUGIlK+zA
         gnfhhDPD+XGZKCJw7m1F7azYw8EHyhzG0PrSMrSawGnXq8JRXX71wJkBHIjnmky+MTod
         uGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1t+02BDIejl/U/IvSSL8qROuh32E12waYB6LH26xJFqyF1fS/zODHm4qa56Ti5FmPBEH92/PJx/kwiW7+7wf4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8M6D8Wv4+bTD0UT7BRMDYfVwp0CUlx75BxfyleESacz3SD8WT
	zj8eocGcSNZ1nNGpb2YCLa0bnfnzDz51mwL0l8FH3l0fYbc7UphB
X-Gm-Gg: ASbGncsCFV2MqwjGshHWXZq0kKCFqQClXbxJGX8sRERAZqJz4hw8djOjar2DcqhLQD6
	zfB03QFVZZTiOhKMiPV5tF+8nhbKODxLN3LPOlQmMzApdn6JsncVQInjHFvV7h+a1OkfhVMaT6p
	M7gnvjBhgfFmqMLBZtUsRH4a9Q7pu6oLlGOmeJXGgRUTC204oN0vViSquZro2Zdd1VeCLj4akT3
	HocbYRy68KfPdXYYA9DNcY9xUaJFEn5CuBXALwUPKAK1fKXbu+Usygoiwp/ICBJX+jU08g/hONl
	ST9ooVbsjBSWnyMKxkR8la43kRJ4LuzNXEIcMKY64OfJGqbiBqy66hmyNR//f8oLC6o=
X-Google-Smtp-Source: AGHT+IF+MmctVYs07ml0PNL3TjoY/lXXGyUEn0qQZbuTuskppxtwfI/b18sBj2L2nJE1T1LQBrflrg==
X-Received: by 2002:ac8:59ce:0:b0:467:6bbf:c1ab with SMTP id d75a77b69052e-471afdf1d29mr22021761cf.3.1739374790839;
        Wed, 12 Feb 2025 07:39:50 -0800 (PST)
Received: from [192.168.1.201] (pool-108-28-192-105.washdc.fios.verizon.net. [108.28.192.105])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471492a90bcsm76580671cf.31.2025.02.12.07.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:39:50 -0800 (PST)
Message-ID: <c927247b-e39c-8511-d95c-77fb23b82808@gmail.com>
Date: Wed, 12 Feb 2025 10:39:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port representation
Content-Language: en-US
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=c3=b2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
 <8349c217-f0ef-3629-6a70-f35d36636635@gmail.com>
 <20250210095542.721bf967@fedora-1.home>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20250210095542.721bf967@fedora-1.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_073952_394481_609B46D2 
X-CRM114-Status: GOOD (  41.17  )
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

Hi Maxime,

On 2/10/25 03:55, Maxime Chevallier wrote:
> Hi Sean,
> 
> On Fri, 7 Feb 2025 21:14:32 -0500
> Sean Anderson <seanga2@gmail.com> wrote:
> 
>> Hi Maxime,
>>
>> On 2/7/25 17:36, Maxime Chevallier wrote:
>>> Hello everyone,
>>>
>>> This series follows the 2 RFC that were sent a few weeks ago :
>>> RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
>>> RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/
>>>
>>> The goal of this series is to introduce an internal way of representing
>>> the "outputs" of ethernet devices, for now only focusing on PHYs.
>>>
>>> This allows laying the groundwork for multi-port devices support (both 1
>>> PHY 2 ports, or more exotic setups with 2 PHYs in parallel, or MII
>>> multiplexers).
>>>
>>> Compared to the RFCs, this series tries to properly support SFP,
>>> especially PHY-driven SFPs through special phy_ports named "serdes"
>>> ports. They have the particularity of outputing a generic interface,
>>> that feeds into another component (usually, an SFP cage and therefore an
>>> SFP module).
>>>
>>> This allows getting a fairly generic PHY-driven SFP support (MAC-driven
>>> SFP is handled by phylink).
>>>
>>> This series doesn't address PHY-less interfaces (bare MAC devices, MACs
>>> with embedded PHYs not driven by phylink, or MAC connected to optical
>>> SFPs) to stay within the 15 patches limit, nor does it include the uAPI
>>> part that exposes these ports to userspace.
>>>
>>> I've kept the cover short, much more details can be found in the RFC
>>> covers.
>>>
>>> Thanks everyone,
>>>
>>> Maxime
>>
>> Forgive me for my ignorance, but why have a new ethtool interface instead of
>> extending ethtool_link_settings.port? It's a rather ancient interface, but it
>> seems to be tackling the exact same problem as you are trying to address. Older
>> NICs used to have several physical connectors (e.g. BNC, MII, twisted-pair) but
>> only one could be used at once. This seems directly analogous to a PHY that
>> supports multiple "port"s but not all at once. In fact, the only missing
>> connector type seems to be PORT_BACKPLANE.
>>
>> I can think of a few reasons why you wouldn't use PORT_*:
>>
>> - It describes the NIC and not the PHY, and perhaps there is too much impedance
>>     mismatch?
>> - There is too much legacy in userspace (or in the kernel) to use that API in
>>     this way?
>> - You need more flexibility?
> 
> So there are multiple reasons that make the PORT_* field limited :
> 
>   - We can't gracefully handle multi-port PHYs for complex scenarios
> where we could say "I'm currently using the Copper port, but does the
> Fiber port has link ?"
> 
>   - As you mention in your first argument, what I'd like to try to do is
> come-up with a "generic" representation of outgoing NIC interfaces. The
> final use-cases I'd like to cover are multi-port NICs, allowing
> userspace to control which physical interfaces are available, and which
> t use. Looking at the hardware, this can be implemented in multiple
> ways :
> 
>             ___ Copper
>            /
>   MAC - PHY
>            \__ SFP
> 
> Here, a single PHY has 2 media-side interfaces, and we'd like to select
> the one to use. That's fairly common now, there are quite a number of
> PHYs that support this : mv33x3310, VSC8552, mv88x2222 only to name a
> few. But there are other, more uncommon topologies that exist :
> 
>                             ____ SGMII PHY -- Copper
>                            /
>   MAC - SGMII/1000BaseX MUX
>                            \____ SFP
> 
> Here, we also have 2 media-side ports, but they are driver through
> different entities : The Copper port sits behind a single-port PHY,
> that is itself behind a *MII MUX, that's also connected to an SFP. Here
> the port selection is done at the MUX level
> 
> Finally, I've been working on supporting devices whith another topology
> (actually, what started this whole work) :
> 
>              ___ PHY
>             /
>   MAC --MUX |
>             \__ PHY
> 
> Here both PHYs are on the same *MII bus, with some physical,
> gpio-driven MUX, and we have 2 PORT_TP on the same NIC. That design is
> used for link redundancy, if one PHY loses the link, we switch to the
> other one (that hopefully has link).
> 
> All these cases have different drivers involved in the MUX'ing (phy
> driver itself, intermediate MUX in-between...), so the end-goal would
> be to expose to userspace info about the media interfaces themselves.
> 
> This phy_port object would be what we expose to userspace. One missing
> step in this series is adding control on the ports (netlink API,
> enabling/disabling logic for ports) but that far exceeds the 15 patches
> limitation :)
> 
> Sorry if all of that was blurry, I did make so good of a job linking to
> all previous discussions on the topic, I'll address that for the next
> round.

Thanks for the detailed explanation, especially regarding PHY redundancy.
Could you add it to a commit message (or even better to Documentation/)?

--Sean

