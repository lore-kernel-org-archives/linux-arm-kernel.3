Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAC3C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAmpgL5dNVrNQnJh+yD//pzzGZfsNROOX3umq9ugYFc=; b=ndxzcYWFZjecENpJ3zIjsIbQQv
	nbBWT3kThxojI/fu4jOsX36YfZ1MZRgr2KlNy4FhueXkNxEP7djMBPsQU8xNpufDRUvn1pUNHSYvN
	+2KkgoDTO1zfdjOcYoJxP13b9mokgb1Lh/ckb6S6ETJ9E+5w9ZEiDyb54SORMJ5JxUK8i6JSL+IGf
	vUQ+OOttRT6RaAdaKNhMsHSRP5d72WMmKsCp7S3YAhdfkfocykq+cu56/mp50k+AROzNcDmx4shm5
	a666RDHq6nNNyCWhJpcPZ4YPXhurTQUY6MZ1xGr5IAr+Vpr2B372NRF6gGFiZ0ru+CIjcy2itn0lr
	J7VA+5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gPw-0000000EjTM-0eXV;
	Thu, 10 Sep 2026 15:10:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gPt-0000000EjSM-2CPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:10:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DC077C653E5;
	Thu, 10 Sep 2026 15:10:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5CA355FA2F;
	Thu, 10 Sep 2026 15:10:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AAC911C799CC;
	Thu, 10 Sep 2026 17:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789053010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DAmpgL5dNVrNQnJh+yD//pzzGZfsNROOX3umq9ugYFc=;
	b=wCBtnoRqIjXEwv87TBg6OzGvf4AYIGWYUwYDwRdo3W/063xJ94d+OSKsgMGIimBrTafcT9
	7bBe8MvW0FcdG5b/Zat/CGay4ASlLq5dbaDpkz1FsUQmLU9g1ha+8K0R12FlyZBWPOU5Em
	6yRHGT9vo/CH14PdQ/sBhKP+vh9Z2rYyHJTD/DMHu/drBC07oSHyxyDwLPxlH7nv9X9QwJ
	rDZygzKwDpm9TrjENagEJDo129nx96Aq7IsQc+052w2rtxVb50VuHrUy85q3NvXIdaw6Tl
	730yhNgMdHGw3DHwokypk7Y2f+MIG63CJLaSBVqJbhZyIOIfMc0ix2BGKaXG0g==
Message-ID: <a8b81a01-b790-47e3-85e8-c8d82cc6273b@bootlin.com>
Date: Thu, 10 Sep 2026 17:09:55 +0200
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
 <2f268c9ff187ba59f69d37dd4e4ba99b@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <2f268c9ff187ba59f69d37dd4e4ba99b@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_081021_729307_877885AB 
X-CRM114-Status: GOOD (  19.62  )
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

Hi,

On 9/9/26 13:32, Nicolai Buchwitz wrote:
> Hi Maxime
> 
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
>>  .../stmicro/stmmac/stmmac_selftests.c         | 33 ++++++++++++++-----
>>  1 file changed, 25 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
>> index 6503678b646e..4564b9f29194 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> 
>> [...]
> 
>> -    memcpy(initial, &priv->xstats, sizeof(*initial));
>> -
>> +    /* Send a frame, then wait to enter LPI */
>>      ret = stmmac_test_mac_loopback(priv);
>>      if (ret)
>>          goto out_free_final;
>>
>> +    max_duration = usecs_to_jiffies(2 * priv->tx_lpi_timer);
>> +
>> +    memcpy(initial, &priv->xstats, sizeof(*initial));
> 
> Is the LPI entry already counted here? AFAIU with tx-lpi-timer=0 on dwmac4 the
> MAC goes directly into LPI after the frame, before stmmac_test_mac_loopback()
> returns. The loop below would time out although LPI is working.
> 
> Snapshot before the first frame, and take a second snapshot right before
> the second loopback for the exit check?
> 
>> [...]
> 
>> +    memcpy(final, &priv->xstats, sizeof(*final));
>>      if (final->irq_tx_path_exit_lpi_mode_n <=
>>          initial->irq_tx_path_exit_lpi_mode_n) {
>>          ret = -EINVAL;
> 
> nit: -ETIMEDOUT here as well, to match the entry check?

I ended up changing my mind and following you call here, V2 is incoming,
hopefully with all the patches this time :)

Maxime

> 
> Thanks
> Nicolai


