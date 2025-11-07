Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941CDCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlRhBZqorFZqB/TdkjrtDsQ0Px8y+7ZRm0vx8Oecj9Y=; b=1ovdT7eqQhQkYsA56/5ga6Prtd
	er1Q8cpR4iIUbK+VS3lDLsN/SWv3Oqb5dL7/XWGuzbyd1p2vazgmZ0iPdoumh7oS9Zg5rmLo6dSIP
	ZMB+4KtPR0Tb5duH36glCZo+4cE+DQe0lrXxbPrwbXu603fyQD0cV0ryKk5EoUiwRX5iSZniFZcXh
	3dsCuF5kCyogTmFgwbfoYIoQKBXuadxDUGc2AkzCMNwNNW0ylw9Ywiusgu4hjwcuan66yzkz0lmEy
	Bt7U1XHmSVKeutqEVyoLQL8w4qWdfWBxq6p5SiwyBjePDJtKpQaekcgLuoQo24kmEAA9wh/i9kghR
	NWqiaJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRPV-00000000Xd4-2Aj2;
	Fri, 07 Nov 2025 18:42:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRPQ-00000000XaW-3kxS;
	Fri, 07 Nov 2025 18:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762540921;
	bh=QurK2/aeYYaTshySUtEliqovujqE6ttMkDCo9FMWluk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eJxS1HR/gSikwNVeEpl1avVNjIn7ZGA5CTTYUp2tru/xqQnyTn0H3l11WaYOyugVm
	 +RbdSUs6PSlOPKSYLA0/iLT+ftjhNzx0D4/qIkVqCykXfPtjI7NdPlL0ekn1tF4Rhw
	 OMp49kkjL8hTafEWwJnuSBP+fWL2jyYRY6HnXojFl466kwGFzqmeWCGK8Ado7+SMss
	 642WgG6YFCbEEZDrMOHAIFkMQSBTqkV3dmpEwXCG1RQOGhlcUTVksZiyU4iGqQWD3c
	 tcZ5lzNIroWcWn84WINhOEpiSRiSISmIZ8Jhs0wd3iv9v1LTZdtLVMSZwAWEmOO9pb
	 bDpj0p60CljWw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4814D17E108B;
	Fri,  7 Nov 2025 19:42:00 +0100 (CET)
Message-ID: <074cd08e-0412-49f9-8dd9-b1f96eb11717@collabora.com>
Date: Fri, 7 Nov 2025 19:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/18] media: rockchip: add a driver for the rockchip
 camera interface
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aQ4tJg8r_j4NyKhv@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_104205_125171_06BCFE16 
X-CRM114-Status: GOOD (  16.81  )
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

Hi Sakari,

On 11/7/25 18:32, Sakari Ailus wrote:
> Hi Michael,
> 
> On Fri, Oct 24, 2025 at 02:51:29PM +0200, Michael Riesch via B4 Relay wrote:
>> Habidere,
>>
>> This series introduces support for the Rockchip Camera Interface (CIF),
>> which is featured in many Rockchip SoCs in different variations.
>> For example, the PX30 Video Input Processor (VIP) is able to receive
>> video data via the Digital Video Port (DVP, a parallel data interface)
>> and transfer it into system memory using a double-buffering mechanism
>> called ping-pong mode.
>> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
>> DVP and a MIPI CSI-2 receiver that can receive video data independently
>> (both using the ping-pong scheme).
>> The different variants may have additional features, such as scaling
>> and/or cropping.
>> Finally, the RK3588 VICAP unit constitutes an essential piece of the
>> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
>> units, and a data path multiplexer (to scaler units, to ISP, ...).
> 
> I understand both RK3568 and RK3588 include an ISP. Do you have insight on
> how would this work, should the support for the ISP be added later on?
> 

Short answer: Yes and yes.

Long answer:

The patch series at hand adds support for the PX30 VIP and the RK3568
VICAP. I cannot really say something about the PX30, but on the RK3568
VICAP and ISP are orthogonal (the ISP features its own MIPI CSI-2
receiver, different from that introduced in this series). Thus, ISP
support can be introduced anytime (whenever someone is motivated ;-)).

Once this patch series is merged, I'll push out changes that introduce
support for the RK3588 VICAP. We can discuss the integration of any
RK3588 ISP in this scope then -- and there may be some things to discuss
as there the VICAP and the ISP(s) are directly connected by means of a
MUX unit in the VICAP.

Alright?

Best regards,
Michael


