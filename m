Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A50C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmpBs3Sc2Rd3g3al60wsjbWjXR4zflzMIihvsD8kR+8=; b=OOpyjvqpsBmutrsStg+dfzoi9s
	l8WUU4/4WykWkAA6t4b54dJRVnluU0JQqiXsCcxRS4YXAglkPHffXJ0RSusX9o7ggTzGeYYoMvg7H
	RUzPMw5o8nEgIXt19vT9RqL0bQV30p0WyxAdp04OoFouQw0dhEsnYySJDn7Nxb1wGE9G65vv4AEOA
	ajMK5ZgZy5xgxxwGn8gOt0l8biBGkDCe880b8Fz5MstXpkPz8H0KSSa6yHLgtoElXy8k+gl4Ii4cQ
	sm4lWP7CYccXYeIYfBOuSSUnpcDPrbE51h3Q1tQb/V/YskWl14zU/4TZ5rW3PZMai8zD0OAVn7p+Z
	TjmiFtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4llS-0000000FN3s-2Npy;
	Thu, 10 Sep 2026 20:52:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4llP-0000000FN3I-1OJT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 20:52:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B10E91A0125;
	Thu, 10 Sep 2026 20:52:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E0685FC38;
	Thu, 10 Sep 2026 20:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B70E811C78B21;
	Thu, 10 Sep 2026 22:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789073565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xmpBs3Sc2Rd3g3al60wsjbWjXR4zflzMIihvsD8kR+8=;
	b=YWJQ4XhALSRdp3ZCacqDTDWT1MXlCqIWaNVKZtMf8wNwnsvCs0w64wzfl+Fd1GM/5jLMCo
	zqf4YS6yVu7f44qgkulGPy0ZarkECYFmGeh5o4U7Ob7PCYgC9rheSM6TnSB/ws+u8B7iRG
	RB7TBdoaHjWyMDI5wulzm3wbfkU7NYM1LNZlPMuljsBBNNnT9L6RfPQt+CkZV/mwHbZKaI
	8iGy22dKG0r5b0cs711QIyEQ0JSKP59BkQkvuabwI5bseQtlzW0FTPWmYsXnL1/C/eifUO
	ZxEf/S9VyBPIUZ+OE+CkPsTJqOC0LX9RWA3H+6baBRmJwwPPiQw8RzYP1S+xvg==
Message-ID: <d62d2894-cec1-4538-b57a-cb228d89495d@bootlin.com>
Date: Thu, 10 Sep 2026 22:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/6] net: stmmac: selftests: Validate EEE based on
 the actual LPI timer value
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de,
 David Laight <david.laight.linux@gmail.com>
References: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
 <20260910151404.976753-3-maxime.chevallier@bootlin.com>
 <6af83ee5b9ddeeebcc6e4cc29989b856@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <6af83ee5b9ddeeebcc6e4cc29989b856@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135255_528910_B7C0A1E8 
X-CRM114-Status: GOOD (  11.66  )
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

Hi Nicolai,

On 9/10/26 20:50, Nicolai Buchwitz wrote:

>> +    max_duration = usecs_to_jiffies(2 * priv->tx_lpi_timer);
> 
> tx_lpi_timer comes direct from ethtool as an unvalidated u32. So if a (arguable privileged
> user) does 'ethtool --set-eee eth0 tx-lpi-timer 1000000000', the code will sleep ~2000 seconds
> under rtnl_lock. Tge old code capped it at 900 ms regardless of the timer.
> 
> Thus I think we should clamp it at some sane value. Feel free to keep my R-b with the clamp.

I was wondering if 802.3 said anything about the LPI timer value, but
Clause 78 says :

  78.1.2.1.3 When generated

  Specification of the time when this primitive is generated by the LPI
  client is out of the scope of this standard.

I'll clamp that as a safety precaution.

As a side-note, there are other limitations, that apply to both eee
and flow control. Even though we're in MAC loopback mode, the link
MUST be up for the selftests to run, and both EEE and Pause are
affected by the autoneg results, and this will affect the selftest
outcome.

I'll address that in another series though, but I'll send a V3 for the
clamping still :)

Thanks for taking a look,

Maxime


