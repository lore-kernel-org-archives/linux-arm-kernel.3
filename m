Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C4CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 03:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3836b6mAV36z8mxrHeaeN6r7zCmcvBC77scS0xnU0js=; b=FKbfNYcV9ZPb7tVB4DevI43WYe
	7vU+bZdivu71mV2SdvIz/em815mQ4wpcC55oUZD6F9JIxhDjsRBIu9az7mGD9vXLXVd7a87M7kND2
	uT5gMknLI0HzwNcn6tB/JcWEu6TW3gkUDTr1Ls+sV+NnNocMjfhP6sSjBA9jE4Z9TejhldO9cVYWE
	bTYY3Lx0iSIM2MJsm0WW3srtUlqylraECv/bYW02PPi9Obu093yxhEwinNiiqVxRDVvEgvuBaZ+21
	4F6rsJGDyQ1icKRal+ki3DccmaqhNqp9GIcVrplomq6aUyUbsUATn4neepUxVJPKuMkQ6ApoqS5+T
	nRdloxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZQ1-0000000A0ng-2SsP;
	Thu, 13 Mar 2025 03:39:37 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZOL-0000000A0iM-21SK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 03:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1741837070; bh=qgutmQSJZQTykjOfEgpTzKzrAn+q9wCeu7RgQnJUaIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eOgH9qr9kfMgykVmloDw+pcglofhsqCzEhv2jUlYsT0iX9iUxDRxH/dp3xKpb3b9K
	 A+dEr4DllWkLLoica0oSjKuawSTJ7RaR00VYLeiLRi2TjltFxFW5M9GDeEQi7qtrv5
	 SkOdejjiQfI5oaeySRZH8qYGa3IU/z4asqtXVkIJswSDt4h4rzM2BH+9NK0zLdjGiq
	 fjwl+oDyrpzlEU8tJ9OZAZhaKIZ4BKwPo34aNEXZQzIfhS8OnrQu23ENPpiW9HfAlE
	 JqKtXKH2I5zXOOgMHjkr1n1ktkeUNZ2ykh5w1tuX/sTQcLfCfIQndyfGbLciKdTgXG
	 HBAcNbIk9VtJA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 3C9DF3A89CC;
	Thu, 13 Mar 2025 03:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1741837070; bh=qgutmQSJZQTykjOfEgpTzKzrAn+q9wCeu7RgQnJUaIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eOgH9qr9kfMgykVmloDw+pcglofhsqCzEhv2jUlYsT0iX9iUxDRxH/dp3xKpb3b9K
	 A+dEr4DllWkLLoica0oSjKuawSTJ7RaR00VYLeiLRi2TjltFxFW5M9GDeEQi7qtrv5
	 SkOdejjiQfI5oaeySRZH8qYGa3IU/z4asqtXVkIJswSDt4h4rzM2BH+9NK0zLdjGiq
	 fjwl+oDyrpzlEU8tJ9OZAZhaKIZ4BKwPo34aNEXZQzIfhS8OnrQu23ENPpiW9HfAlE
	 JqKtXKH2I5zXOOgMHjkr1n1ktkeUNZ2ykh5w1tuX/sTQcLfCfIQndyfGbLciKdTgXG
	 HBAcNbIk9VtJA==
Received: from [192.168.1.228] (74-111-126-194.sta.estpak.ee [194.126.111.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 4222A3A8968;
	Thu, 13 Mar 2025 03:37:48 +0000 (UTC)
Message-ID: <5b62671c-719a-44f2-b28e-878159859a01@mleia.com>
Date: Thu, 13 Mar 2025 05:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
Content-Language: ru-RU
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, piotr.wojtaszczyk@timesys.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
 <57ae63a2-544b-4241-a54d-8fa9917c1e44@mleia.com>
 <yvljnqnlka3ecw2n3hw2zgfszlldvbww3k7gq72dczmf6jwzfo@4vqnygxuzvk5>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <yvljnqnlka3ecw2n3hw2zgfszlldvbww3k7gq72dczmf6jwzfo@4vqnygxuzvk5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250313_033750_272654_1B152B05 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20250313_033750_272654_1B152B05': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_033750_272654_1B152B05 
X-CRM114-Status: GOOD (  10.83  )
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

Hi Uwe,

On 3/13/25 00:56, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Mar 12, 2025 at 07:59:21PM +0200, Vladimir Zapolskiy wrote:
>>> +  "#pwm-cells":
>>> +    const: 3
>>
>> It shall be 1.
> 
> No, 3 is the right choice.
> 

could you please elaborate?

I find that here the only configurable parameter is PWM period, so it
should be sufficient to have one cell only like in marvell,pxa-pwm.yaml
or google,cros-ec-pwm.yaml.

--
Best wishes,
Vladimir

