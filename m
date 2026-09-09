Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEC0C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hSPgxCn/ZUJvH2rUgbxv1Y3vIU11P7lvbOo9zrImYM=; b=L1FLy0x0HvAKFXsDyW2FYsFSrU
	HHSZTWRcBZ9BE1OiGp3yuFrq4R2cBN1tUgkVuPp1gzIvyiXR/SNFxOHmlRA3xgsJ10ehBDZez5N5V
	wu0WcX6PdeDGMz7E7Qb3pGRFOyEfXrQ4i488vj0JxCpA3Rrco035Pt9S3hl6KLTWLZuAGb7gcfeUi
	+EB0tMwv8Fq27NVUnIwB894/atPv3qVVKOSp+AB1v/qOZiS/58wy2JQrmxiFfQqfIP7SPTqW6DcSF
	I+Xm/5gaaqV8/qkafQ/7OnOb+xyxrCoa0c5E12yJ9PA1exDIEWXNvNNR4AzwoqX9mi+MpMmx3kEqA
	xOjp5hPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HY4-0000000Bg4U-1lkd;
	Wed, 09 Sep 2026 12:37:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HXx-0000000Bg2o-2rGm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:37:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 585334E415B1;
	Wed,  9 Sep 2026 12:36:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21BA760448;
	Wed,  9 Sep 2026 12:36:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A071A11C7AF5C;
	Wed,  9 Sep 2026 14:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788957410; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5hSPgxCn/ZUJvH2rUgbxv1Y3vIU11P7lvbOo9zrImYM=;
	b=OhJqggxpTs7+mr88LdRjgSy8IUEUo7w9T4+Ri9PNp0fVsUEybhEwVLl+t20/sLoIPz5BTo
	5in5bGXCXtswxPMEgnYZD98V1PJJedA9VrBCIpaWQ11MjqNSDYPvKgubPLFJ+q80PWsS9U
	RQrr79ivkn9KhcJXrKxKTsxgGs8t1PkBv1TPt9u01akvjolH5uLGhXpYcUMLByeeR+WCsY
	kyQrrhyH9A8FrnejSgVMFxQbSoJ9zCkL/wxwr9ceBtxxJ0iASiuAiA/inzx0L31NwG0uBy
	vxpVzTZn9Mqop1Ftb3k2JpIcXHGq0kqc6iEtmb9UHsOPcRjEe/qsmNvPxeAo6w==
Message-ID: <eb8cf1f7-a272-47bb-b504-a91b8a9a2608@bootlin.com>
Date: Wed, 9 Sep 2026 14:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/6] net: stmmac: selftests: Validate EEE based on the
 actual LPI timer value
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
References: <20260909074740.1247762-1-maxime.chevallier@bootlin.com>
 <20260909074740.1247762-3-maxime.chevallier@bootlin.com>
 <00bfad8f52784677c6042ccd6c3fd6ed@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <00bfad8f52784677c6042ccd6c3fd6ed@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_053701_916454_265090BC 
X-CRM114-Status: GOOD (  13.98  )
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



On 9/9/26 13:40, Nicolai Buchwitz wrote:
> On 9.9.2026 09:47, Maxime Chevallier wrote:
>> The EEE selftest is a 2-step test :
>>  - It validates that we enter in LPI mode with the
>>    irq_tx_path_in_lpi_mode_n counter
>>  - It then validates that we exit LPI when sending a frame, with the
>>    irq_tx_path_exit_lpi_mode_n counter.
>>
>> The current state of the test lacks 2 main things :
>>
>>  - We don't know exactly when was the previous frame sent (it's from the
>>    previous selftest)
>>
>>  - The timeout is hardcoded, while the LPI is entered after a
>>    user-configurable delay. On top of that, the timeout loop uses a
>>    pre-decrement iterator (--retries) that actually only iterate nine
>>    times, so 900ms while the default LPI value is 1 second.
>>
>> Let's therefore make it more deterministic :
>>
>>  - Send a frame at the beginning of the test
>>  - Wait for more than the lpi timer value, we timeout after about twice
>>    the value,
>>  - Then send another frame, and verify that we do go out of LPI, also
>>    with a timeout.
>>
>> Note that the test's goal isn't to validate the LPI timer value itself,
>> only that we enter/leave LPI mode.
>>
>> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
> 
>> [...]
> 
> Forget to mention in my last comment:
> The series seems to be broken. I can't find patch 3 and also the cover
> letter is missing on lore and my inbox?

Huh that's strange indeed, it's on lkml but not netdev@ ?

https://lore.kernel.org/lkml/20260909074740.1247762-1-maxime.chevallier@bootlin.com/

meh I'll resend if need be

Maxime

> 
> Nicolai


