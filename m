Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0607CC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDnz042JhVx8TouMwH/GponpahIwHIiyB0UKPpUXJhA=; b=QolGmPSJ56uolTOmwItYm6QRIz
	CAPeVW+FwOvWDxUnXJUNJ55vo5TAXsXu+M02gCwJ3OGaNP3hrbouwqkcMhlLjT0kKxmKYVat93sep
	Tqxh8UNAja4bXgu2XmBtWaau+oKS+56kUkKwiG8+p44BtHXRDd+JLW2jOaNSn6DGXc9HhsP7kqu9B
	t61EbLCw2PZsvRCfrZdC8gZj6v4zwHfhCqi8ZKTiwptiQwoDVumleiI2z1MGUDAhprHxitFdB1m5x
	smRavhkz1L4zrXiM5zqLKFDCgSG8CvkAdeHWJWt2W005BavQ4YaalTHoQb8PhJvfkKuUdo8RHikve
	1/M9ZyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XyI-0000000EOrC-2yGK;
	Fri, 18 Sep 2026 12:45:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XyE-0000000EOqq-3Cs1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:45:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A46FC58470;
	Fri, 18 Sep 2026 12:46:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6718860649;
	Fri, 18 Sep 2026 12:45:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8411110328E57;
	Fri, 18 Sep 2026 14:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789735534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wDnz042JhVx8TouMwH/GponpahIwHIiyB0UKPpUXJhA=;
	b=meBchw49EU3xYhJ2R+QquSCXhUZhoes8nlbjSzVB+TRW9BDqkMcAIzkt7zkR3aylnWG62l
	oePWdC51PtWnOwkOOT8oKe57qmJqDqkCKcZh528nSwchgU4a8YN4KI+v+/JmMuRpuaDwPy
	E2r7s5g5hDvOYsl+iapbu9v1lF+xdb9ErqBX4CrqhfkKQH+TtYM2XQSEhq54G//LXFFr/O
	t+R7rRJf11mzaF2Pd0I7175KWvgQYWbm3xYThqxJl4PnVbbmJWKepTfvr+4AQuuZbPUD+p
	nRhotCmyam8ZPHAby10qIsjAKFO09pGUbrxmrdI788XtveRAHzOLobph5sYUFQ==
Message-ID: <fd937877-306e-48c1-8b14-e8dc62986420@bootlin.com>
Date: Fri, 18 Sep 2026 14:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 5/7] net: stmmac: dwmac4: Use the correct bufzise
 when the len is exactly 8K
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
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
 <20260917215339.2022523-6-maxime.chevallier@bootlin.com>
 <4b3c26c482ac1d26f39b53fea072e4d1@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <4b3c26c482ac1d26f39b53fea072e4d1@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_054538_986319_24ED564B 
X-CRM114-Status: GOOD (  16.90  )
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



On 9/18/26 14:25, Nicolai Buchwitz wrote:
> Hi Maxime
> 
> On 17.9.2026 23:53, Maxime Chevallier wrote:
>> DMA bufsize selection isn't made on the MTU but the actual frame length,
>> so including the L2 header. On DWMAC4, if the len is exactly BUF_SIZE_8KiB,
>> the next larger size is incorrectly selected.
>>
>> Lets fix the comparison and while at it, rename the parameter from len
>> to mtu.
> 
> Isn't it "[...] from mtu to len"?

:(

Bah, if respin is required I'll fix this

>>
>> Fixes: c3efed5ad1b0 ("net: stmmac: Enable dwmac4 jumbo frame more than 8KiB").
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 4 ++--
>>  drivers/net/ethernet/stmicro/stmmac/hwif.h         | 2 +-
>>  drivers/net/ethernet/stmicro/stmmac/ring_mode.c    | 4 ++--
>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
>> index 2994df41ec2c..c6a8f8d73501 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
>> @@ -474,11 +474,11 @@ static void dwmac4_set_sarc(struct dma_desc *p, u32 sarc_type)
>>                        sarc_type));
>>  }
>>
>> -static int set_16kib_bfsize(int mtu)
>> +static int set_16kib_bfsize(int len)
>>  {
>>      int ret = 0;
>>
>> -    if (unlikely(mtu >= BUF_SIZE_8KiB))
>> +    if (unlikely(len > BUF_SIZE_8KiB))
> 
> Should we drop set_16kib_bfsize() instead?
> 
> After 6/7 it looks to me like the same test as the first branch of
> stmmac_set_bfsize(). The caller ends up there anyway when it returns 0
> and chain_mode_ops doesn't have it at all.

True yeah :) however maybe we can wait for this to be merged and have the
cleanup in net-next ?

Sashiko is getting crazy with the "pre-existing issues" everytime we touch
stmmac, cleanups are long overdue and this could be included in there :(

Maxime



