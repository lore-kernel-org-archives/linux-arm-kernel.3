Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEB7CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZMZTPvh9tMJLNdO7mYMSY3WuW2Rj56qTgdyt1nrogg=; b=ViZE+7zsgLutc01oYQaARKrAUb
	75b3LAFaGZly3COhifxZhJGZ7W3RXdqclIARxGtfKOHcQ8ngz+6rhLw8nlZ173XPbUYhUlMCXaUhZ
	dHrIdGMx2uFUbJWJIXhP3gqIX7/6zck1kKmyKmGeUiIDwgKlNjOs82kL7IdZuAb0vR3yw7dcrbiOJ
	YqMGXokfXl7cf9X1ZCrLcWqTbsnWA/XtySR+fgHYldZ7k5Z5T4Ri7Uwxtta5ATdwvgW3CaI4eTqlG
	tiVwPx3it8d+qnUNdZik6EL4AvP1j/NWXRJKevfgTKc8qHjLGGDBRqWWMx2Mb5gp40I51Xtr4XjWv
	hI6yaz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8IL-000000050PE-0u6w;
	Sat, 17 Oct 2026 17:34:09 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8II-000000050Og-12GY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:34:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D57DB105FB3;
	Sat, 17 Oct 2026 19:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792258444;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7ZMZTPvh9tMJLNdO7mYMSY3WuW2Rj56qTgdyt1nrogg=;
	b=JUi7yPBlYsym0othMpS5J+dTlNByXsPSEu0yY4K0tzee4Mt9vKkHtjALk4Ja3quKrwHpRh
	RgJqSt5ELaOBgXRZRS0gPjFgRJF1KwXPCRMzrVv0zXYULmKVTka5wtOtbm3aFb9p1SThEa
	4IBTpweRBmkOciJT6N8lDjHSoxwuthk1O3O8yfEBQs4Z1O1+uf1wucrSW58ruCmicU0k2J
	Wf+yJTTG0evga8/qKX6V02dmTc7LgNUVNjEMo9iS7vB3ukx+ClYxZkXpKevehAxUfujOMV
	ELmsH9+znF2F2K3wsV9+j63Rwlo9faZGEv7X0Dd7ewh9APWWWIKnN+52fUyByA==
Message-ID: <661412ff-3942-4d1c-be6f-1ef6c54620fd@nabladev.com>
Date: Sat, 17 Oct 2026 19:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,PATCH 2/2] enetc: Make eMDIO MDC rate configurable from
 DT
To: Wei Fang <wei.fang@nxp.com>, "Frank Li (OSS)" <frank.li@oss.nxp.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Frank Li <frank.li@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20261016193344.115518-1-marex@nabladev.com>
 <20261016193344.115518-2-marex@nabladev.com> <atKDNdxl0w65s8yQ@SMW015318>
 <DB9PR04MB933217F7ADCB6223A44DACA7889A2@DB9PR04MB9332.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <DB9PR04MB933217F7ADCB6223A44DACA7889A2@DB9PR04MB9332.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_103406_443702_9D3365CB 
X-CRM114-Status: UNSURE (   9.96  )
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

On 10/17/26 4:24 AM, Wei Fang wrote:

[...]

>>> +int enetc_mdio_update_mdc_div(struct mii_bus *bus)
>>> +{
>>> +	struct enetc_mdio_priv *mdio_priv = bus->priv;
>>> +	struct device *dev = bus->parent;
>>> +	struct clk *enet_clk;
>>> +	u32 div, mdc_freq;
>>> +
>>> +	if (device_property_read_u32(dev, "clock-frequency", &mdc_freq))
>>> +		return 0;
>>> +
>>> +	enet_clk = devm_clk_get(dev, NULL);
>>> +	if (IS_ERR(enet_clk))
>>> +		return dev_err_probe(dev, PTR_ERR(enet_clk),
>>> +				     "Input clock unknown, not changing MDC
>> frequency\n");
>>
>> binding said clock is optional. If return failure here, it will block
>> existing dts, which have not clock property.
>>
> 
> For EMDIO device, the clocks property is not added to
> fsl,enetc-mdio.yaml, I suppose this property should be added to the
> dt-binding doc if the clock is really needed here.

Isn't this what 1/2 in this series does ? (maybe I misunderstood this 
paragraph)

> For ENETC device, we already have a 'ref' clock in the enetc node,
> so devm_clk_get(dev, NULL) may get the 'ref' clock rather than the
> system clock of NETC.
Shouldn't the clock be described in the MDIO DT node ?

