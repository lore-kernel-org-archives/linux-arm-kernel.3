Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6DFC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xr51EjeNPpVhvkrX+j2KA7sh6coRP73TE02mljTkxnU=; b=kWV1Z+q8qRAEV+vzrSnVDHdisd
	kiNCfEbOiOq7Fxw1y1YTIzABsjB3emtwxgl1LKBi917GucRP+6NRExrofxji63AXKUBtnSyXqFi++
	4DHMUFx+w5cMtgcQ+FhLryobmOywuq2jTz/S848jGJTtpDrarnSKN1IHJh641xVAPda3HhnFsBRhz
	jzqdoJFZktZINfSMq1L9k4M9I3YS/LLRCWjYhYwxG4QWD9u+wzMgBO7JvjZvM3yBwq3uXsYDwTHWs
	c7hdJFmMA9UNm86eO8DrRqedDCubLv++EyBispMBRNRj+J1TQ67gklvQBWFwxC14F6NrQ2F3/2r43
	1V00RABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nao-0000000C6fx-1sMq;
	Tue, 01 Sep 2026 12:27:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nal-0000000C6fY-3ibO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:27:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8DCE54E4146F;
	Tue,  1 Sep 2026 12:27:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50B286053C;
	Tue,  1 Sep 2026 12:27:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A52211C7926B;
	Tue,  1 Sep 2026 14:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788265667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Xr51EjeNPpVhvkrX+j2KA7sh6coRP73TE02mljTkxnU=;
	b=v8//1kYrmgBcaY6YVc8sDaF69kyfH4N9WEwUhY/Wo+1HXLtYKSqrB/9+Ul2nYL6KKpt6US
	fqBzJ7WqTU6KPYB0g1slSVgS40NG95FD3gwRQ3bwEAkBTEEZNfbcRrebLA06ZQ0F4HKtYN
	wyyfMqyHwBUkRkHy3hGPoAZ/nxie3rleG+4aWVVKu2QValCJHKxS6fH5GaSTqjY8KLYM/x
	Y43ew5raxQ16WVeXs4YqhJCeqhC/csYuDmno1pUkctQX6eyuLUn37plP1UL45LiUuqcSu3
	ATy7I2LgRdyL+SAL/FJi8RPAcw6nljrXCAS4tW5u3cttrHARFq/KUnsEkKr32A==
Message-ID: <6f395b75-d5ed-4536-9f9b-9de2f56dd9fb@bootlin.com>
Date: Tue, 1 Sep 2026 14:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac4: Use the full perfect
 filter ability for UC filter
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-3-maxime.chevallier@bootlin.com>
 <285c8969-2f0d-46de-b098-60ff10f30cf6@lunn.ch>
 <493afde2-8603-41e8-b6ce-f8e399c53275@bootlin.com>
 <c7819431-d33d-4e9c-ab36-be55b94d29f4@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <c7819431-d33d-4e9c-ab36-be55b94d29f4@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_052756_113990_B6E67232 
X-CRM114-Status: GOOD (  16.45  )
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



On 9/1/26 14:21, Andrew Lunn wrote:
> On Tue, Sep 01, 2026 at 08:37:20AM +0200, Maxime Chevallier wrote:
>> Hi,
>>
>> On 9/1/26 02:12, Andrew Lunn wrote:
>>> On Mon, Aug 31, 2026 at 09:01:20AM +0200, Maxime Chevallier wrote:
>>>> Contrary to dwmac1000 that gets its number of perfect filter entries
>>>> through the 'snps,perfect-filter-entries' property, dwmac4 allows
>>>> reading the filter size from the HW features registers.
>>>
>>> Does dwmac4 take any notice of "snps,perfect-filter-entries"? Should
>>> it be marked deprecated?
>>
>> It's only used on :
>>
>>   "st,spear600-gmac"
>>   "snps,dwmac-3.50a"
>>   "snps,dwmac-3.70a"
>>   "snps,dwmac-3.72a"
>>   "snps,dwmac"
>>
>> So, dwmac1000.
>>
>> I'd say, we can definitely deprecate on IPs that don't match these.
>>
>> Interestingly, there are _some_ dwmac4 devicetrees out there that use
>> this property. It achieves nothing, and even worse, doesn't match what
>> the HW reports :
>>
>> In arch/riscv/boot/dts/starfive/jh7110.dtsi for example :
>>
>> gmac1: ethernet@16040000 {                                            
>> 	compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
>> 	[...]
>> 	snps,perfect-filter-entries = <256>;
>> }
> 
> So another thing for the TODO list, extend the YAML description to
> make properties conditional on the IP core version, so the validator
> tools will pick this up.

Looks like it yes. I'm starting to wonder if we should  maintain this kind
 of TODO list in the kdoc. I know these types of lists have a nasty
tendancy of falling into disrepair, but this could help.

Maxime

> 
> 	Andrew


