Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97551C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ese7NYKIqP4YMH14PHh8lmNgkBXMS5Kp6vJnbvuy/80=; b=FgaIltFvRkCXHknfjT9AYUeusv
	qo/55Mdr+Fju3LvmRmAffvJ/Heyp4QwB/4EDPAItmB2Hf+azTSceLTBl1pyXfDbQ81GZf+xUvcNFm
	+sY3P4Mk+xYL2f0qvfd1UwUCZl+T0i5zTH68YAc5bU9SZP0zkxvZ4vttjpteWRuWMSAyg70jVzI7y
	+qVoqdIaqjgMf2XSGaaivdDq6ud2tHDINjwLhZ26jzpviXF+to1CMeZv38dG70rs98b+VpDZ3yYvY
	6BVdp5MIeejRdnaqrHxpI1rH91xkYv2auQVCanvIOzu3eArY4EK3OzAbj+9lEkPHqGR8jW6P6cWK5
	kHaZ3ZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqcoY-0000000G1Dk-49fa;
	Sun, 02 Aug 2026 20:29:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqcoW-0000000G1DP-0oPG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:29:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8D90D1A137F;
	Sun,  2 Aug 2026 20:29:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 466906029B;
	Sun,  2 Aug 2026 20:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F5CB11C1786D;
	Sun,  2 Aug 2026 22:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785702571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ese7NYKIqP4YMH14PHh8lmNgkBXMS5Kp6vJnbvuy/80=;
	b=jOih4CbkXugJF6FC6RbTX5XB3kv6TO+ZxzBEzAb+mdJ3dJvGOBsZ1AHWNSmJn/W7Qn3tRG
	eswvecQAkpQxkjgvFNRsfxWsCnKK12ohDFrsfobUp+eZeLz3ik5ymkDomBYO6aHvr3KGuS
	IM0KzU9qCYkp+MDN89+xwfKTWS44KLTdqgNHoP6uH65FDZxCdxFPxbA6t0ehr8Cz6Wp+AT
	+h3xPNyXcYmX5BTwceeLv3wOUTMA9Slr3PnGlenxfjXyTwqZ+CCyBkWF1ODqShPSD5YGEL
	8absHHEBqga42R7Jm2pDx5/4e74/2X9W4LVHhcUFzE17aYx8frrKKrD4pA+klQ==
Message-ID: <5f2f0e3c-cc4e-4110-ad4c-180abba5356d@bootlin.com>
Date: Sun, 2 Aug 2026 22:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: ethtool: Address off-by-one
 when reading the coal rx-usecs
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
References: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
 <20260802114015.214212-3-maxime.chevallier@bootlin.com>
 <4e76d7c1-0052-4689-be7c-9c31dc24516a@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <4e76d7c1-0052-4689-be7c-9c31dc24516a@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_132940_418680_A51DDE4B 
X-CRM114-Status: UNSURE (   6.64  )
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

Hi Andrew,

On 8/2/26 17:05, Andrew Lunn wrote:
>> This does change the boundaries of accepted rx-usecs parameters, as the
>> previously accepted values were in the 16-246 us range, and now fall
>> into the 15-245 range on imx8mp.
> 
> With this change in place, what happens when trying to set 246?
> EINVAL?

Yes indeed :

# ethtool -C eth1 rx-usecs 246
netlink error: Invalid argument

Maxime

