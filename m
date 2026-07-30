Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C652BC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLMzAM2jhcBcjvUbjDVz8nPB2UWdb+PQz/+bnXZY5Sk=; b=yjvRIjJ/ta0cXBiJP/7f7MJpDb
	Iepj/1skh6tHyyQ+mML91m1obu9NOYulyn5VtWD/zBKn8+mqRecDSzck5YfFiEPSh3Wc/0Dd0TcbD
	8i+o5DWhqDKdc0zo1KtM+HrtfqzBEEwpYRPZpvFuyAB2RUyKT44C8sP/TOfAXUmv6vITzIAcAUCqv
	yUpPS7JV/8JBpbO9LyzdxzBgM+rCVFeiPeKCVJ2eqodyu2bCi+anwgadTTDN5H/4+vfVyJw2m5VXF
	Kh84iZAfqip31ZmDyrC5d5EmE0X3uDuA4gHBwPOXv0Peruvq40Yr8OfCylGAaRNcqbA9xwzFARwL1
	wvlPOwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQP8-0000000AXB1-49JX;
	Thu, 30 Jul 2026 13:02:30 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQP6-0000000AX9z-0Gn0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:02:29 +0000
Message-ID: <48631703-cbd9-45ba-b079-c4d94f4cf405@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785416543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zLMzAM2jhcBcjvUbjDVz8nPB2UWdb+PQz/+bnXZY5Sk=;
	b=wBl8/CeKE7+AeEZjGa6VWejw62/EHMA7eEQYOJ3nVvQ7kjaSGESyyQG4pdczMaWLVPNOEK
	9xfo2BxYDy2gNs0som1K/KVC7F/IghOggkT8Ca0xYfBzDMDke2F+sXTlfEgHe7FUlq8DS1
	RqCo+bpdLqximLeWFkxfXBw9iZoZVPI=
Date: Thu, 30 Jul 2026 14:02:19 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next 6/7] net: dsa: netc: add PTP two-step
 timestamping support
To: Wei Fang <wei.fang@nxp.com>, "Wei Fang (OSS)" <wei.fang@oss.nxp.com>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "olteanv@gmail.com" <olteanv@gmail.com>
Cc: "chleroy@kernel.org" <chleroy@kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-7-wei.fang@oss.nxp.com>
 <59ecaa4e-f111-4dd4-914a-7704990ac58e@linux.dev>
 <GV2PR04MB11739A4EDB782AB83B60968D988C92@GV2PR04MB11739.eurprd04.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <GV2PR04MB11739A4EDB782AB83B60968D988C92@GV2PR04MB11739.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_060228_309896_A78DED7F 
X-CRM114-Status: GOOD (  15.42  )
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

On 30/07/2026 02:31, Wei Fang wrote:
>>> +int netc_get_ts_info(struct dsa_switch *ds, int port,
>>> +		     struct kernel_ethtool_ts_info *info)
>>> +{
>>> +	struct netc_switch *priv = ds->priv;
>>> +
>>> +	info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
>>> +				SOF_TIMESTAMPING_RX_SOFTWARE |
>>> +				SOF_TIMESTAMPING_SOFTWARE;
>>
>> SOF_TIMESTAMPING_RX_SOFTWARE and SOF_TIMESTAMPING_SOFTWARE
>> are available
>> by default, no need to add them.
> 
> Yes, you are right, I will remove them.
> 
>>
>> the code doesn't have skb_tx_timestamp() calls, I wonder how is
>> SOF_TIMESTAMPING_TX_SOFTWARE implemented?
> 
> The switch and the conduit port (ENETC) are integrated into the NETC IP,
> so the switch can only connect to the ENETC MAC. And the ENETC driver
> calls skb_tx_timestamp() unconditionally, so I thought
> SOF_TIMESTAMPING_TX_SOFTWARE can be added. I checked the existing
> DSA drivers and found no drivers set this flag, maybe I should remove this
> flag as well. Thanks.

well, you have the hardware, you can actually check if enetc driver 
provides it for you

> 
>>
>>> +
>>> +	info->phc_index = netc_get_phc_index(priv);
>>> +	if (info->phc_index < 0)
>>> +		return 0;
>>> +
>>> +	info->so_timestamping |= SOF_TIMESTAMPING_TX_HARDWARE |
>>> +				 SOF_TIMESTAMPING_RX_HARDWARE |
>>> +				 SOF_TIMESTAMPING_RAW_HARDWARE;
>>> +
>>> +	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
>>> +
>>> +	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
>>> +			   BIT(HWTSTAMP_FILTER_PTP_V2_EVENT) |
>>> +			   BIT(HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
>>> +			   BIT(HWTSTAMP_FILTER_PTP_V2_L4_EVENT);
>>> +
>>> +	return 0;
>>> +}
>>
> 


