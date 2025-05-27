Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C90EC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNzPqOcrIMLkbW6pqRkowgAwEnkW9pgS1P80rwoJM3g=; b=0sUrlbawQ9fp193SUBRJl1ws7a
	h1Fq1jrRuLsQ8+l+Pmug/FfPQG2J7+uXA0yBRzHyWBQ5EoZxeWxqLqzaQuyjMPkbDY0SDTPM83I0N
	eq/SoCsM8moQd/+XaGvKVA3ssRnqc4wqtnMHWiCCprqeyUWXbo8Ls9bAv5p+cDTX4PzLK2+4ozfgd
	hLTT1qO0mwqAX/neCxIQExA/ZnmdFJM4bo/udTlrs/RIKdCsynHMtcPDoZVjeVIeXgy99F3PI9ckp
	vXAEN9HvUIgswZEMQJeKMaFoZGEKMH/Z1VvGqO9ICC+rp1NVmqNbvw9M3yI3EKFTed0wEwQSof8tG
	dr7JUxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr1D-0000000APvU-3EXj;
	Tue, 27 May 2025 09:54:47 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqz5-0000000APmU-4Ahr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 09:52:37 +0000
Message-ID: <6147503e-1e73-42dc-a2b9-1b0cf26ca147@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748339554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zNzPqOcrIMLkbW6pqRkowgAwEnkW9pgS1P80rwoJM3g=;
	b=PG14+0f5KR1BMnGZAy6/w+as+/MDDALfjtqd2pISAmd/GyJsxozPgbxkP36Ulhp0xRYSQV
	HWL9XZg1J5r+JF4BVayfI9XukkXMpYtBoeYASJgpNuhHawLQJSIQ6WOHZbpRvChvCLljeh
	hy28I9XIT+OxVgBZb66LRh7ViM+zpyw=
Date: Tue, 27 May 2025 17:52:26 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: add explicit check and error on invalid PTP
 clock rate
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com>
 <8f1928e5-472e-4140-875c-6b5743be8fd3@linux.dev>
 <DA666WVCP2OB.300LVHEGH5V4Y@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <DA666WVCP2OB.300LVHEGH5V4Y@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_025236_175029_E090CBD1 
X-CRM114-Status: GOOD (  17.88  )
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


在 5/26/25 10:42 PM, Alexis Lothoré 写道:
> On Mon May 26, 2025 at 4:22 AM CEST, Yanteng Si wrote:
>> 在 5/23/25 7:46 PM, Alexis LothorÃ© 写道:
>>> While some platforms implementing dwmac open-code the clk_ptp_rate
>>> value, some others dynamically retrieve the value at runtime. If the
>>> retrieved value happens to be 0 for any reason, it will eventually
>>> propagate up to PTP initialization when bringing up the interface,
>>> leading to a divide by 0:
> [...]
>
>>   From your description, I cannot determine the scope
>> of "some platforms". My point is: if there are only
>> a few platforms, can we find a way to handle this in
>> the directory of the corresponding platform?
>  From what I can see, it can affect any platform using the stmmac driver as
> the platform driver (except maybe dwmac-qcom-ethqos.c, which enforces an
> open-coded clk_ptp_rate after the stmmac_probe_config_dt call that sets
> the clk_ptp_rate), if the platform declares a dedicated clk_ptp_ref clock.
> So I would rather say that it can affect most of the platforms.
>
> In my case, I have observed the issue with the dwmac-stm32.c driver, on an
> STM32MP157a-dk1 platform.
Okay!
>
>> And there need a Fixes tag.
> Ok, I'll add a relevant Fixes tag.

On this premise,


Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

>
> Alexis
>
>>> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index 918d7f2e8ba992208d7d6521a1e9dba01086058f..f68e3ece919cc88d0bf199a394bc7e44b5dee095 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -835,6 +835,11 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
>>>    	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
>>>    		return -EOPNOTSUPP;
>>>    
>>> +	if (!priv->plat->clk_ptp_rate) {
>>> +		netdev_err(priv->dev, "Invalid PTP clock rate");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>>    	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
>>>    	priv->systime_flags = systime_flags;
>>>    
>>>
>>> ---
>>> base-commit: e0e2f78243385e7188a57fcfceb6a19f723f1dff
>>> change-id: 20250522-stmmac_tstamp_div-f55112f06029
>>>
>>> Best regards,
>
>
>

