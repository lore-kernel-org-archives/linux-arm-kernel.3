Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D986FD6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdouFEOrCPjvUbFG8nWL4nevGsYtHhwmjnJ0/LBie9Y=; b=GRHTVQJjVjOtuJfEbg5zq1h+I/
	vwUaPXGXzJ/VuQ8YURySGHfbhY9Eh6hEUR0ZqOyL3IkIpEs88toMB5HKfyvdvnhuo1keDhmuW4n1j
	t6p08KNcVMn2vXmHzt4r8jRrkBI460bt85s188w7jmnu/YLKUsxySmngjpIYaoqonBVYuqTYrVh2k
	7A3BZr+njz2Qbtp4bCqnQkimYIQ/wiKmbZdvvXY3d1cW/5+pfExtABqsbaylBpmjA4jtGtnO+oOsD
	0yF09prIR94dD5yQmU3Yi/At0iydT75KqLoMFXr1ffVbSLxLqeRi30XwYeXgGnblMvIHe7edLWDTc
	kngPSsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIpG-00000008zgP-1NZd;
	Thu, 18 Dec 2025 18:34:10 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIpD-00000008zfz-439V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 18:34:09 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DBC2D14000B1;
	Thu, 18 Dec 2025 13:34:05 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 18 Dec 2025 13:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766082845;
	 x=1766169245; bh=cdouFEOrCPjvUbFG8nWL4nevGsYtHhwmjnJ0/LBie9Y=; b=
	dkcki0hmWQsGbAYxWik7uerrrukMUQZU2KYD3RuSCvsUhqB6C79x5uwOrshVWjrY
	mQk3FkvMFZsHsyzvL+1sg6NHxHe0ZBklRmkIDzO+x96Aprrrpdi4fFs7IffQRDTQ
	gK0tSPSjwdveR9y49lnZDbKKTM9Er511nheLpX9blAxpEWuv7kgSxE+bCduyMlPf
	SliTpctMoQD64ILSu7qjaWTaWmgDnOihSgssiuP8UCtuVWKb7XmJQo7LFaT+4r55
	staQMxZwt9ech8RjKyfjfWKSuKSYcQa80q6Usf647kMMUnXDRu5BXA5sWUPwdIhY
	qvYsOZimeBjC8SpYRatcAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766082845; x=
	1766169245; bh=cdouFEOrCPjvUbFG8nWL4nevGsYtHhwmjnJ0/LBie9Y=; b=Y
	vQrYqW+44Cj5gBN+GVjhOPOEsOz6vWtW9bxDZvv2Bo5Y88PCMJJlSHYnpWKdKpZQ
	TWyKBon/AahqG6BE3QH6LWM+/1MQvxqfkN64ThAKYfXaPHi50EgyRdRzc3Tu57CW
	b66664KkeiNDd+jMsi2/dQM9Dwn7ZK2ltI8F1PM59jL4DYY7QITjTivXqSsyo5Yf
	2DJkuRuPaNNDz4Mj2E7NvoLiHnRzSg66Cp397fSVAFohhk6C+igEXpBvSIXAnxf5
	D3ophywQd9IdbWYPoRdgYiUHWx9NSefbpPibvTfCuZ+gJXL+79itc0oYsWCYQZtL
	hu+crSlG+dS1UR3YhT3bQ==
X-ME-Sender: <xms:HUlEaWUVDsel0KlcF3YMKRRutSo5-PP-WTHp7F6c1xOqXYybd76S_w>
    <xme:HUlEaSIZclUOu9g0hoqRS08bG2Wdntjxw0kjXsZWvuingqGA6Jzg-ADDbERIA-yOf
    JBqnMXRlkm-WnOhhieyl4s7HWZy6Zc_ME_GEjMm0m-qZZxIChW3jjY>
X-ME-Received: <xmr:HUlEaevS_G0xtFGjZkkZbQic-HTbKLmH6znjn7mWnsks9fYoUK9U4R-nW4HP0nRTTpXSk0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomheptfgvsggvtggt
    rgcuvehrrghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvg
    hrnhepfeegtdetledvieffvdffteevhfeggfeuveegheffjefhvdelieejgfeitdehgeei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsg
    gvtggtrgessghsughiohdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtoheprghnughrvgif
    segtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopehtrghnrdhsih
    gvfigvrhhtsehhvghtiihnvghrrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggv
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkh
    gvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:HUlEaf1vqXWYGyVztb4bg_3bccL29zxHr04LN7Lx0Quj2usg3cUf6w>
    <xmx:HUlEaeONuTnfgntPUEyVeNF8Aal7ivurpoOPVb7IzjsmyuQ8fhIhoQ>
    <xmx:HUlEaXVw9HfkK3UVLcmqWN7gguA0hkyLCXzecVyRLEFS5M6DW_NBqg>
    <xmx:HUlEabafv35P00PVXcY5cgUNip6VBMVJnIaTZ5bd-GDsWNQd8SFQAQ>
    <xmx:HUlEaQ0x4Daogj9ujBrVRmhgqyM4zyz9yqjirYGmqQpbjvqNeGjqDzx6>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 13:34:03 -0500 (EST)
Message-ID: <4eff8506-8049-46e9-997e-a41edff32bbc@bsdio.com>
Date: Thu, 18 Dec 2025 11:34:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rebecca Cran <rebecca@bsdio.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8
 board
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Tan Siewert <tan.siewert@hetzner.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251218161816.38155-1-rebecca@bsdio.com>
 <20251218161816.38155-2-rebecca@bsdio.com>
 <5aa36c56-798a-40cc-b0b8-be3f7c92136f@kernel.org>
Content-Language: en-US
In-Reply-To: <5aa36c56-798a-40cc-b0b8-be3f7c92136f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_103408_159361_47364C9E 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
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

On 12/18/25 09:21, Krzysztof Kozlowski wrote:
> On 18/12/2025 17:18, Rebecca Cran wrote:
>> Document ASRock Rack ALTRAD8 (ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q)
>> compatibles.
>>
>> Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Tested-by: Tan Siewert <tan.siewert@hetzner.com>
> How was the binding tested?

I ran "make ARCH=arm CHECK_DTBS=y aspeed/aspeed-bmc-asrock-altrad8.dtb"
to check for errors

and have used the dts file in an ASRock Rack ALTRAD8UD-1L2T system with
Linux 6.12.61 running OpenBMC.


-- 
Rebecca Cran




