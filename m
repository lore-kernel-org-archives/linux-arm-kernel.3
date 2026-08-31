Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FFFC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bmoP76gMT2BwTB0k454lDwNfisMmqxZAOhXk7e+A3o=; b=00SUiI+Y3wFsYmfIbWWPRO+Njv
	fkd4BLlwGFTwpajGDNj3CIqNzlXikDNWD07ScPM+y8KN7mw01cT8TNObhgXHNbS/m7qYEfwjuszMi
	JIDDQYc4i3RKdihUbr3j5o8zZjAL57EsMJpjtUHYFt7xXIo0Bd4sMIv4t6IWFA+/h7UNjPg4Tx+QT
	pudSBdGDbomWDCg45KOJ4N6pLrt11Z4VVUKOUg2boPPMJWo6+TeG9DGE9mhQqvPo+SU8vlNOZ8FoU
	OxDC3ZvHWbeGuDNTrzYUVcfByTc5bBpxDcJDLZWE7RnVQfU5oi38u4XSLDsZ8+wnBMehZAwRttB3Y
	Fp3IG38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10GB-00000009B6j-3Zhl;
	Mon, 31 Aug 2026 11:33:07 +0000
Received: from sender5-pp-f112.zoho.com ([165.173.182.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10G6-00000009B3q-1e8r;
	Mon, 31 Aug 2026 11:33:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788175966; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EleetKclAEvQ9L8pxV+F2QaLovXSAX6nfqp7L2Nqd9U8FpNH2/2TX8NZRUHw2KGe/lUdhE0DDlqn3y7qBKG7HfyC9P9FDqBV252NRxoGUUjU/5fQtbkW5W8RosfmAXhHo770nlMqGJpzFLY2Ox8M3syVApjt4Xqzs1Wq3pV1u44=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788175966; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1bmoP76gMT2BwTB0k454lDwNfisMmqxZAOhXk7e+A3o=; 
	b=QUEYz6uRfersySI4lzmZxIKqpG6P0kFTyuKqHiKcGzuzOEmyuY48CuG7VRKnkoAczXTTr1De1qBuK/lyaKiMH9rqjZ8p0shfQVDFJRYikUIX71Gwec89ifnmjmykg5ww8DvHsA11EuxUL7SBM58WWHfecoK3i0iO0FX9QUqEo7s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788175966;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1bmoP76gMT2BwTB0k454lDwNfisMmqxZAOhXk7e+A3o=;
	b=P0k80emAkoE/Zslcoz8ZEZZ/6Y62orx0DOwYdj4TWC9BSjP7pP/X7dKauvmGalyZ
	fFM7I8rAkBr5T96AjZlb7Is26uO8PthOcrfvQWed1wBJ3cVHZU9zazr//2XgQOhZcms
	WdUVwqVFOlZcVMozsgbEPIYT55Y9FMczq9B0flWM=
Received: by mx.zohomail.com with SMTPS id 1788175962298302.1922470156459;
	Mon, 31 Aug 2026 04:32:42 -0700 (PDT)
Message-ID: <7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com>
Date: Mon, 31 Aug 2026 13:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>, Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>
 <20260827-thundering-cream-saluki-dd05df@quoll>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260827-thundering-cream-saluki-dd05df@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043302_500582_61C76C8F 
X-CRM114-Status: GOOD (  19.23  )
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

Hi Krzysztof,

On 8/27/26 13:45, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
>> A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
>> and in some PHY blocks both work at the same time. The existing
>> PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
>> the transmitter or the receiver.
> 
> The consumer knows this already, no? Imagine consumer of the phy is some
> ISP receiving data over CSI for given port, thus consumer cannot
> transmit over that link.
> 
> All this seems redundant.

Indeed the consumer should know what to request. For example, the MIPI
CSI receivers should request the PHY_TYPE_CSI PHY. But I am not sure why
this should be redundant?! Can you elaborate? TBH I don't really
understand your remark.

>> Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
>> D-PHY or C-PHY and transmitter or receiver. They do not replace
>> PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
>> selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
>> binding.
>>
>> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
>> Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
>> Signed-off-by: Jason Yang <jason98166@gmail.com>
> 
> Where is any DTS using it? I did a search and no results of upstream
> posting.
> 
>> ---
>>  include/dt-bindings/phy/phy.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
>> index 979b5dfd8353..8ee3f88e6d80 100644
>> --- a/include/dt-bindings/phy/phy.h
>> +++ b/include/dt-bindings/phy/phy.h
>> @@ -24,6 +24,8 @@
>>  #define PHY_TYPE_CPHY		11
>>  #define PHY_TYPE_USXGMII	12
>>  #define PHY_TYPE_XAUI		13
>> +#define PHY_TYPE_DSI		14
>> +#define PHY_TYPE_CSI		15
> 
> DSI and CSI does not look like types of PHY...

Fair point. AFAIK both CSI and DSI are protocols on top of the physical
CPHY and DPHY communication. Maybe we should stick to
transmitter/receiver/RX/TX direction/.../something. Would work for me
too, my simple request is to *NOT* introduce the same magic for each
combo PHY block over and over again, but create something generic.

What about

    #define PHY_DIRECTION_RX	0
    #define PHY_DIRECTION_TX	1

or so?

This is pretty much what Jason had in v1, but 1) generic instead of
Rockchip-specific (if anything, it probably should be Samsung-specific)
and 2) switched the constants to match the state of the art in the
kernel better.

Best regards,
Michael




