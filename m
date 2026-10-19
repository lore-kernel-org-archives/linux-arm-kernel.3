Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109F606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2FkyOEsq;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=gkhjrsVg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbjFjYksln6X5VCuok/GYUEp4Jt2bFAm9SetP90rGcM=; b=2FkyOEsq+7ndkzdPd4MksZ+wGM
	35nRtf8//Fd02E5YMwCTH8s2NwlvveCO5GFR8Hm3zTT6Byx6ijzsqiCD5HGTPaJDX7KS1I764rXGm
	R85HDLH2SSWMYmxc7vqNnxsJ00//qsO4qRALlGreXe8vQMo7k60EiXSgKSf8JA+DKoqCGyw4WyirN
	RC5K+doE03TfEo0Tac1Go65QQveEtIJWfnQMlTD+wz8XyDluV1ItDvruCZEjLAJoQ6bX+sHNKfdGJ
	MxvI/OKA8LixEiIKKKUUtpyfLYhGQalS3mp/R9/2v4509rR+4bJfbnTZ3nXsxOJspCS90+/MqgDZJ
	xewYb68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIynp-00000008d1Z-1AzD;
	Tue, 20 Oct 2026 01:38:09 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIynn-00000008d0D-1chb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:38:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E71FA108825;
	Tue, 20 Oct 2026 03:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792460281;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PbjFjYksln6X5VCuok/GYUEp4Jt2bFAm9SetP90rGcM=;
	b=gkhjrsVg8YdzKJiWw+oBJJoGOWMSaX2plJh2ECGP6pobGez/hDtH0UV4Rc2GlxMKP/fXbF
	mFRHOvJDQ5/kcprfkbErcvoAO2cidfW1VgzDUdVmsiwoKZq51M2pIyMSiB9+mFd5e2Y+XE
	zIrWXd21uoO8qiwXwxlMoS1cEEkqb5V7RipLdtD1smpxlx42HVcI2xhjn7frxAydftEr9K
	BRNUqGr0Hyai2/OODFby0KhwLg52WWQJ0Ndu4cZfDaERlK07618LcHO8wB2hrcFgrUvMa/
	vQkCTJEDpb9ssDuGPZeYe/7oi7OrMmtFkutPvii2Ku6bc20iYPHtQno+K7cwGw==
Message-ID: <fe920b05-6d89-4dc1-83d3-0664fbc2e00c@nabladev.com>
Date: Mon, 19 Oct 2026 18:10:18 +0200
X-Archived-By: <archiver.kernel.org>
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
 <661412ff-3942-4d1c-be6f-1ef6c54620fd@nabladev.com>
 <AS4PR04MB933821150913BDCF35C4827F88982@AS4PR04MB9338.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <AS4PR04MB933821150913BDCF35C4827F88982@AS4PR04MB9338.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_183807_648716_BA5D403F 
X-CRM114-Status: GOOD (  13.81  )
X-Spam-Score: -0.6 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/26 4:59 AM, Wei Fang wrote:

Hello Wei,

>>>>> +int enetc_mdio_update_mdc_div(struct mii_bus *bus) {
>>>>> +	struct enetc_mdio_priv *mdio_priv = bus->priv;
>>>>> +	struct device *dev = bus->parent;
>>>>> +	struct clk *enet_clk;
>>>>> +	u32 div, mdc_freq;
>>>>> +
>>>>> +	if (device_property_read_u32(dev, "clock-frequency", &mdc_freq))
>>>>> +		return 0;
>>>>> +
>>>>> +	enet_clk = devm_clk_get(dev, NULL);
>>>>> +	if (IS_ERR(enet_clk))
>>>>> +		return dev_err_probe(dev, PTR_ERR(enet_clk),
>>>>> +				     "Input clock unknown, not changing MDC
>>>> frequency\n");
>>>>
>>>> binding said clock is optional. If return failure here, it will block
>>>> existing dts, which have not clock property.
>>>>
>>>
>>> For EMDIO device, the clocks property is not added to
>>> fsl,enetc-mdio.yaml, I suppose this property should be added to the
>>> dt-binding doc if the clock is really needed here.
>>
>> Isn't this what 1/2 in this series does ? (maybe I misunderstood this
>> paragraph)
> 
> Sorry, my email filtered out the 1/2 patch, so I missed it.

No worries.

>>> For ENETC device, we already have a 'ref' clock in the enetc node, so
>>> devm_clk_get(dev, NULL) may get the 'ref' clock rather than the system
>>> clock of NETC.
>> Shouldn't the clock be described in the MDIO DT node ?
> 
> The enetc_mdio_read_* and enetc_mdio_write_* interfaces are not only
> used by EMDIO devices, the ENETCs and NETC switches also use them.
> NETC switches and ENETCs can access external PHYs or internal PCS/Serdes
> through their own port MDIO registers, instead of through EMDIO devices.
> 
> Your first patch only modified the EMDIO binding-doc, not the ENETC and
> switch binding-doc.
So I need to patch also 
Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml ? Any other 
binding document ?

Thank you for your help !

