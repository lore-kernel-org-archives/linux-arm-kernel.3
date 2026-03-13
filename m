Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6AA107BCE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 21:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pMrp7QFPYIlbrLMp+HZgW7atJSL3fSFR1EuK/IswdM=; b=bKyPH07PRn2sOIpnJbptP19+FJ
	MGYhQ8vwT+pjXHsh8Q+rRAYwLtyePGjOHdnC3Zk4tEH6NvWZB1x6PJk88AOxkefo+pflF+H5BlNag
	qP/SVpLMTCfhNiNxoAM7+EqFHjtO63AhiyVzqlI+m3lXmI4afu5SdzmK5HXGQIbqTetcAoElYWe9q
	G3ogEnAGXfLLNls6t7Gq0HD2gY/tVGNt10AfLt0ixupCDWzKQ3ZRvt5rJQIlmo76jR75j22xWjhw8
	s0OfXzSkNttFmPp3BlgaB+givZZiEhaSC24YxBYWx3+sFUFQYYDuoNRLUZ+5eefCOiuJ+lWVkE5t9
	4EoLSCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ABj-00000001Dv8-1mO9;
	Fri, 13 Mar 2026 21:36:55 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ABh-00000001Dui-1F8f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 21:36:54 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 93B8E1400105;
	Fri, 13 Mar 2026 17:36:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 13 Mar 2026 17:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773437809;
	 x=1773524209; bh=7pMrp7QFPYIlbrLMp+HZgW7atJSL3fSFR1EuK/IswdM=; b=
	cAo6k1+5+nosN1sCm0enMvd9CKWn6pa8U0HG4Y5VjJSVTTxW+7HPe5iEM+d6ll6g
	ozZNArgiQcDkG7u6r+Xt8K2Z55ju3OTbFNr9npCQsl1LfLaM45zfX1G4irXruLKR
	l4wDEy/L4OZ+QVf5z/dQoplIZEZeq0tcqlxExlljfYZTPt0sl21mlBDZu3XaFoeB
	soAzufFuk8lSQWxsiiIuk/ZB0bBufiYlIaCp/XZ16XDvhfAhoX6+lDd0iTjb1XBD
	qc6pRCSfqbVLwiuNXRIEbzJhVqUUn18msQ1gHfGPODXH4axhbmkX5xEAjnbN/U4k
	/YfIAR0RNFRiGjlkLuHYjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773437809; x=
	1773524209; bh=7pMrp7QFPYIlbrLMp+HZgW7atJSL3fSFR1EuK/IswdM=; b=P
	Fowjt9YS6Do1BVQbtcb2RXAG7+rbWHr3QS+aW3NffjVzDlTpZfLKfcITI3YF63S0
	SFkTpPyQW/GmwcdfccV/XW26pkXpGslazgt6UyUpTMFC90pEVv14i48+KmXQgpYw
	romgTAc2XNbCj7AOXsvsf6jymyBG9TGY1JaSJCGeSP23zFp25UnLjGOhDq9i4V3L
	QU/tdpOyry67C9oDTuelEb91ylGKCC89iTMSLc7z8KCsKDFf+dyjFGQ/p5XMxGm6
	EFhG9D5h7puaY2A9LzsML6wXNP1wmAFJ7kEnXuIqIIrRVr+V/AhNcSdIbTSlAlVu
	w367Sr6oUMm8vy1btMMWw==
X-ME-Sender: <xms:b4O0aRvQFjGyv9GOyunRSo1Ojn3of9HvevxGrX8bR4yatcqbN3vQ8w>
    <xme:b4O0aVSxIYRJRAjMWGRiEfdkTrjrQxxXJE94b6KFHdJU7RJNUmmtgnN8Rh9vqy5aw
    7uZF0UsuHmAW8pmwrhzptoneA0Z6OJGow5_4hHEjzoUzkEb-0vwL8Iz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvledtjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehrhigrnhgptghhvghnsegrshhpvggvughtvggthhdrtghomhdprh
    gtphhtthhopeihhhgptghhuhhnghesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthht
    oheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtth
    hopehmrggtihgvjhdrlhgrfihnihgtiigrkhesihhnthgvlhdrtghomhdprhgtphhtthho
    pehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkod
    gutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:b4O0aZ4G5qt_rgvhSsT7ELLuZk7BoC5vWKCjem0FYTXw7sLxAqchmA>
    <xmx:b4O0aS2Ez0EwiYmU6TtfsuajpwORU-Cp7H43_tMSajUfKYpw9S4RKA>
    <xmx:b4O0aWlReRj-L7JI3fYRjfYubNEU7_VbW205DdpNNZDBFHC7IaPn1g>
    <xmx:b4O0aYjYPajBz2aaXL0UPH0ACExr6HF7034Rq5-qYClkG0QLs3OytA>
    <xmx:cYO0ac4FpKHz4EEFh5AoSYjRVz8gUgjh4aZvLe0PZujSvqH99efjQEmM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 15C76700065; Fri, 13 Mar 2026 17:36:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A224H4bSXjB-
Date: Fri, 13 Mar 2026 22:36:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, aspeedyh <yh_chung@aspeedtech.com>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 maciej.lawniczak@intel.com, "Mark Brown" <broonie@kernel.org>
Message-Id: <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
In-Reply-To: <20260313-energy-casket-ca8adc1f1fd1@spud>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_143653_767368_E91E1A86 
X-CRM114-Status: GOOD (  18.59  )
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

On Fri, Mar 13, 2026, at 17:24, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
>> This series adds initial support for the eSPI controller found on ASPEED
>> AST2600 BMC SoCs.
>> 
>> The series introduces a eSPI controller framework for ASPEED SoCs under
>> drivers/soc/aspeed/, adds AST2600-specific controller support for
>> peripheral and flash channels, defines the corresponding devicetree 
>> binding, and adds the AST2600 eSPI controller node to the SoC dtsi.
>> 
>> The driver is intended to support host-BMC communication over the BMC-side
>> eSPI slave controller present on AST2600 systems.
>
> This all seems to be in the wrong places entirely, shouldn't an eSPI
> driver and bindings go in the spi subsystem?

From an initial reading, my impression is that patches 1, 2, 3 and 7
should be modified to use the normal SPI interfaces to implement
an spi target driver, possibly a combined host/target driver.
Reworking this should be fairly straightforward because the interfaces
to the SPI core are well documented.

It is possible that the hardware can only be used to provide espi
device emulation. From what I could see in the code, there is
not much special in there, but I'm not that familiar with SPI

Patches 4, 5 and 6 in consequently would need to be reworked so
these can implement the TAFS spec independent of the SPI controller,
and can be shared e.g. with other OpenBMC targets using the same
module and the same user interface. None of this should be aspeed
specific. 

There is a good chance that both the user interface and the placing
of the code will need a more debate, but I would suggest first trying
to move everything over to use the SPI subsystem but leave other
parts untouched for the moment.

> FSL's appears to be there.

I think this is just a similarly named device: Freescale/NXP's eSPI
device driver is unrelated to the Intel eSPI spec but rather implements
a normal SPI driver the same way that eDMA and eSDHC are Freescale's
implementation of dmaengine and SDHCI drivers.

    Arnd

