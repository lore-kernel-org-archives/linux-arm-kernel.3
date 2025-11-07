Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E89CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 20:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+ptj3KtMlGTVAlWzrh2l2YW/byGwnknekSHbj13/DE=; b=FKsMWSJDOwAkj9f6FuCrLzjlWT
	ALqCuqhLNk7o1WpHYGSRGZYeyhliaauIxOVzPfFeR5XLB+2KhTS+v9d1hlOB2YESPBdNy3BNG64Wq
	9u7+d+8dFLCLam/UEAH8EzJQGJN50Bfd3B2qwcZ7VyRYyijkA42C8pEhWYMhQ9L5tH2QepfLDpepg
	FPa3sw2CdSs6LV6nu95jxpYsS2o6ME+q+tFnv44gf1e/hHrAuQ50Qn3HvqhWvVOX9Kta+PnzdJCqJ
	/6avH4gf29AKa/PPmGG/83Tw+hFBPKEh+LKV9IKF+8J+Nj6ozf1kWo4KD6ahZ93O6JjnwUlmCV3k+
	GpBdWNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTQv-000000011oB-3Aqg;
	Fri, 07 Nov 2025 20:51:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTQs-000000011n9-1aOL;
	Fri, 07 Nov 2025 20:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762548699;
	bh=8UovAiOWTROIXZYM+ZVGV+MUbMteVqZyd+P1kJY5714=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PwpJW9oOEFMqTwZPZKr4AcwLhrUGSHyEZdZloMFfJkZNeWHxC8gLE8fZCEmqhK62c
	 A2cl0V710LDQdQM54axRs5ZpzuEz1uk0ruczX5ImU0ybiDx9oo5En6YUz+qu0KKO1A
	 6gxkjEiCF0oPIFCMoCNOfTqOTNlfcbQY9kzTPqnS29cuOVJ70XYrDrEFhPbln5A9YU
	 BBjLgTbdxX96s6FDW0aaaxXLjfBIGM+lcoVijXj9E6j/BtdEJP9F3sU0etd/00P7O7
	 efPwYzWpT37DH9qhvqetbqsF5Z9HgOFWshuslCWI8BcD/4ivTKMytg1tFRM64hSWIy
	 AySk/Fmm926Vg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C3BC17E12D5;
	Fri,  7 Nov 2025 21:51:38 +0100 (CET)
Message-ID: <13c43edb-9592-4779-a39a-7856bb0f964d@collabora.com>
Date: Fri, 7 Nov 2025 21:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/18] media: rockchip: add a driver for the rockchip
 camera interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Chen-Yu Tsai <wens@csie.org>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
 <aQ4tJg8r_j4NyKhv@kekkonen.localdomain>
 <074cd08e-0412-49f9-8dd9-b1f96eb11717@collabora.com>
 <20251107185441.GG5558@pendragon.ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251107185441.GG5558@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_125142_601299_3A27B68B 
X-CRM114-Status: GOOD (  23.04  )
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

Hi Laurent,

On 11/7/25 19:54, Laurent Pinchart wrote:
> On Fri, Nov 07, 2025 at 07:41:59PM +0100, Michael Riesch wrote:
>> On 11/7/25 18:32, Sakari Ailus wrote:
>>> On Fri, Oct 24, 2025 at 02:51:29PM +0200, Michael Riesch via B4 Relay wrote:
>>>> Habidere,
>>>>
>>>> This series introduces support for the Rockchip Camera Interface (CIF),
>>>> which is featured in many Rockchip SoCs in different variations.
>>>> For example, the PX30 Video Input Processor (VIP) is able to receive
>>>> video data via the Digital Video Port (DVP, a parallel data interface)
>>>> and transfer it into system memory using a double-buffering mechanism
>>>> called ping-pong mode.
>>>> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
>>>> DVP and a MIPI CSI-2 receiver that can receive video data independently
>>>> (both using the ping-pong scheme).
>>>> The different variants may have additional features, such as scaling
>>>> and/or cropping.
>>>> Finally, the RK3588 VICAP unit constitutes an essential piece of the
>>>> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
>>>> units, and a data path multiplexer (to scaler units, to ISP, ...).
>>>
>>> I understand both RK3568 and RK3588 include an ISP. Do you have insight on
>>> how would this work, should the support for the ISP be added later on?
>>
>> Short answer: Yes and yes.
>>
>> Long answer:
>>
>> The patch series at hand adds support for the PX30 VIP and the RK3568
>> VICAP. I cannot really say something about the PX30, but on the RK3568
>> VICAP and ISP are orthogonal (the ISP features its own MIPI CSI-2
>> receiver, different from that introduced in this series). Thus, ISP
>> support can be introduced anytime (whenever someone is motivated ;-)).
> 
> Won't they both be connected to the same sensor though, and probably the
> same D-PHY in the SoC ? They don't seem entirely separate to me.

The MIPI CSI-2 DPHY is shared, indeed. Thus, they *maybe technically
could be* connected to the same sensor, but I don't know whether that
works and fail to see why anyone would to such a thing (if it is about
raw capture, the MIPI CSI-2 receiver in the ISP can do that on its own).

The DPHY can be operated in split mode, with two lanes for VICAP and two
lanes for ISP. This is not implemented yet, but can be done at a later
stage on PHY level (not media related). In this case, ISP and VICAP can
receive data from different subdevices via CSI-2.

BTW the ISP is able to process the data captured by VICAP, but
apparently this includes a RAM round trip (VICAP captures to memory, ISP
operates in mem2mem mode).

> A block diagram that shows connections between the CSI-2 pins, D-PHY,
> CSI-2 receivers, VICAP and ISP could help.
> 
>> Once this patch series is merged, I'll push out changes that introduce
>> support for the RK3588 VICAP. We can discuss the integration of any
>> RK3588 ISP in this scope then -- and there may be some things to discuss
>> as there the VICAP and the ISP(s) are directly connected by means of a
>> MUX unit in the VICAP.
>>
>> Alright?
> 

Best regards,
Michael



