Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D086C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEYszsMZ3+ElcqGm4ka7SjfhYKXmqGiGIARsMrr7wZE=; b=wVdG303iK4w/ji
	VHj7SLg8MCSKrMFC0sp//JvODKzlJdd2xZULNpN7+Xb7pENYlqjeL6OMOqQYHAed1ZAS9eCpT1cQT
	+oSfipA4kG7qv9/T8w59tOtBoXgB3E1izolorMCJyT/kphtO3lil8yuTwQuLT5u0uQfK0Fkd2XBFF
	BJULw56y2l+Jiu5Bee7kgdUO4uj+PiDlzs5LpYP5VWogOdF/2UkQMaJfuLeAlxSBCv7022X+NA/nW
	xykeovIggKUxBntuPtkm73OpctaRzAx/t1tgAM6tiNdq1HInPmhynGUXNnzGalXimGCkx8/R/5ZAD
	6JOlR39aI2IH6ySZU0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUdh-00000003tAT-3uPb;
	Thu, 31 Jul 2025 14:52:13 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTyH-00000003mhy-1gT1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AEYszsMZ3+ElcqGm4ka7SjfhYKXmqGiGIARsMrr7wZE=; b=Z7R0qlobHPqcaH7XSk/3mlL4L8
	LSo1tDA8vZlnV5pNvbq/V7PuDp50b3/PLIx4C6K6aLYRLjG8eo4zSy2iq6AzNtjO/ZN1RHmzPoluE
	v8mdrKmniRV3RShGzFP9EejDsK7oVgvdc3zIznNYyMdYvYV0b+Uq39DsmcFHLlknv0ETr4d26zXvn
	jO28sEV1tXLyyiHhv7juBA3rnPokLfteUH5frKOmT0F5lp9xRvrqUQkaXbrpi0V+dH2TvYZCY+fhN
	ZSbwqlRVBznv7vdKmKGCxngYapV2i2ftdGyLQjfn47SYTlXK/9+kXBU5UDBc8o8G6Eypt310Nqeuy
	i9SvQ38A==;
Received: from [122.175.9.182] (port=13399 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uhTxX-0000000EGTY-3yKC;
	Thu, 31 Jul 2025 10:08:40 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id DFBE91781F30;
	Thu, 31 Jul 2025 19:38:29 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id BCB3E1783F55;
	Thu, 31 Jul 2025 19:38:29 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6AURxpk8PQ31; Thu, 31 Jul 2025 19:38:29 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 676801781F30;
	Thu, 31 Jul 2025 19:38:29 +0530 (IST)
Date: Thu, 31 Jul 2025 19:38:29 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Message-ID: <1271782907.78002.1753970909117.JavaMail.zimbra@couthit.local>
In-Reply-To: <3502ed81-7d97-4a01-806f-5c5ae307b6af@oracle.com>
References: <20250724072535.3062604-1-parvathi@couthit.com> <20250724091122.3064350-6-parvathi@couthit.com> <3502ed81-7d97-4a01-806f-5c5ae307b6af@oracle.com>
Subject: Re: [PATCH net-next v12 5/5] net: ti: prueth: Adds IEP support for
 PRUETH on AM33x, AM43x and AM57x SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds IEP support for PRUETH on AM33x, AM43x and AM57x SOCs
Thread-Index: a5kfM/1JYdqAkU1Z+JlX9yQuLFXrSQ==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070925_480252_D4B0B549 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On 7/24/2025 2:40 PM, Parvathi Pudi wrote:
>> Added API hooks for IEP module (legacy 32-bit model) to support
>> timestamping requests from application.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> ---
>>   drivers/net/ethernet/ti/icssg/icss_iep.c      | 103 ++++++++++++++++++
>>   drivers/net/ethernet/ti/icssm/icssm_prueth.c  |  72 +++++++++++-
>>   drivers/net/ethernet/ti/icssm/icssm_prueth.h  |   2 +
>>   .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 +++++++++++++++
>>   4 files changed, 260 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
>> 
>> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> index 2a1c43316f46..59aca63e2fe5 100644
>> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> @@ -968,11 +968,114 @@ static const struct icss_iep_plat_data
>> am654_icss_iep_plat_data = {
>>   	.config = &am654_icss_iep_regmap_config,
>>   };
>>   
>> +static const struct icss_iep_plat_data am57xx_icss_iep_plat_data = {
>> +	.flags = ICSS_IEP_64BIT_COUNTER_SUPPORT |
>> +		 ICSS_IEP_SLOW_COMPEN_REG_SUPPORT,
>> +	.reg_offs = {
>> +		[ICSS_IEP_GLOBAL_CFG_REG] = 0x00,
>> +		[ICSS_IEP_COMPEN_REG] = 0x08,
>> +		[ICSS_IEP_SLOW_COMPEN_REG] = 0x0C,
> 
> using both uppercase and lowercase hex
> 

Sure, We will check and address this.

>> +		[ICSS_IEP_COUNT_REG0] = 0x10,
>> +		[ICSS_IEP_COUNT_REG1] = 0x14,
>> +		[ICSS_IEP_CAPTURE_CFG_REG] = 0x18,
>> +		[ICSS_IEP_CAPTURE_STAT_REG] = 0x1c,
>> +
>> +		[ICSS_IEP_CAP6_RISE_REG0] = 0x50,
>> +		[ICSS_IEP_CAP6_RISE_REG1] = 0x54,
>> +
>> +		[ICSS_IEP_CAP7_RISE_REG0] = 0x60,
>> +		[ICSS_IEP_CAP7_RISE_REG1] = 0x64,
>> +
>> +		[ICSS_IEP_CMP_CFG_REG] = 0x70,
>> +		[ICSS_IEP_CMP_STAT_REG] = 0x74,
>> +		[ICSS_IEP_CMP0_REG0] = 0x78,
>> +		[ICSS_IEP_CMP0_REG1] = 0x7c,
>> +		[ICSS_IEP_CMP1_REG0] = 0x80,
>> +		[ICSS_IEP_CMP1_REG1] = 0x84,
>> +
>> +		[ICSS_IEP_CMP8_REG0] = 0xc0,
>> +		[ICSS_IEP_CMP8_REG1] = 0xc4,
>> +		[ICSS_IEP_SYNC_CTRL_REG] = 0x180,
>> +		[ICSS_IEP_SYNC0_STAT_REG] = 0x188,
>> +		[ICSS_IEP_SYNC1_STAT_REG] = 0x18c,
>> +		[ICSS_IEP_SYNC_PWIDTH_REG] = 0x190,
>> +		[ICSS_IEP_SYNC0_PERIOD_REG] = 0x194,
>> +		[ICSS_IEP_SYNC1_DELAY_REG] = 0x198,
>> +		[ICSS_IEP_SYNC_START_REG] = 0x19c,
>> +	},
>> +	.config = &am654_icss_iep_regmap_config,
>> +};
>> +
>> +static bool am335x_icss_iep_valid_reg(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case ICSS_IEP_GLOBAL_CFG_REG ... ICSS_IEP_CAPTURE_STAT_REG:
>> +	case ICSS_IEP_CAP6_RISE_REG0:
>> +	case ICSS_IEP_CMP_CFG_REG ... ICSS_IEP_CMP0_REG0:
>> +	case ICSS_IEP_CMP8_REG0 ... ICSS_IEP_SYNC_START_REG:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +
>> +	return false;
> 
> Redundant code after default return
> 

Sure, We will address this.

>> +}
>> +
> [clip]
>>   
>> @@ -1434,12 +1490,19 @@ static int icssm_prueth_probe(struct platform_device
>> *pdev)
>>   		}
>>   	}
>>   
>> +	prueth->iep = icss_iep_get(np);
>> +	if (IS_ERR(prueth->iep)) {
>> +		ret = PTR_ERR(prueth->iep);
>> +		dev_err(dev, "unable to get IEP\n");
>> +		goto netdev_exit;
>> +	}
>> +
>>   	/* register the network devices */
>>   	if (eth0_node) {
>>   		ret = register_netdev(prueth->emac[PRUETH_MAC0]->ndev);
>>   		if (ret) {
>>   			dev_err(dev, "can't register netdev for port MII0");
>> -			goto netdev_exit;
>> +			goto iep_put;
>>   		}
>>   
>>   		prueth->registered_netdevs[PRUETH_MAC0] =
>> @@ -1473,6 +1536,9 @@ static int icssm_prueth_probe(struct platform_device
>> *pdev)
>>   		unregister_netdev(prueth->registered_netdevs[i]);
>>   	}
>>   
>> +iep_put:
>> +	icss_iep_put(prueth->iep);
> 
> prueth->iep = NULL; avoid potential use-after-free
> 

Sure, We will check and address this.


Thanks and Regards,
Parvathi.

