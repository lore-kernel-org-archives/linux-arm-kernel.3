Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297ABCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWTdo+5hh7NJLBSq727BtkQgikxX1L8tZgXBZ8gCACs=; b=OCuvLFHYlerU1cGAtOKcISDzI4
	lJ5l052IUIKR8MM8bG9Rc23AlHil4Hw/nDM/hpq4gjEsRJk4GyHQRwRTvd1RMAfqJAApNdcFjddLi
	iIKj7m38YVSc1l4gnPpDQfUPYPi5y8CghNG+t3UrA14owe+RYqAYgd4jHg3bXMn3ZFvHxxnqQWJWJ
	jINlJsWC+ODGH9COaGgrAQc13dlGxGYJCJAAV8h/5XzUKjGdRgtponQb6LSlmsMqszcC73KHlZSLJ
	yJ/P7nAtLsWKIunr9ZlSqPcYiUdY9YKXlxFVMyirUKSvt5LewPblzWkdHeDK+50c2wnWCPubRcenW
	g16aPEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGddX-0000000Dn3p-3pe9;
	Wed, 05 Nov 2025 13:33:19 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGddU-0000000Dn3G-1mXK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:33:18 +0000
Message-ID: <f28ee997-ed08-4123-83ab-3496e88ed815@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762349592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWTdo+5hh7NJLBSq727BtkQgikxX1L8tZgXBZ8gCACs=;
	b=lZEwQFVw9yNQ9sk2uxKkuOyaETin+DkFDuEXGq5+e4abmbd20pBco6LsT84eYK1xLwQhgv
	J6VVRJ69UlEhfF8dutp0qviMGTPx5DCc5P4OLZ9rDfraoxiNLb3dqNZaMXkZxzJyfGxGDX
	kkTbe5Cit9WwwD6xAiC01i99DgisL0A=
Date: Wed, 5 Nov 2025 13:33:08 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 1/7] bnx2x: convert to use ndo_hwtstamp
 callbacks
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manish Chopra <manishc@marvell.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
 <20251103150952.3538205-2-vadim.fedorenko@linux.dev>
 <20251104173737.3f655692@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20251104173737.3f655692@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_053317_149367_EC3AE6BB 
X-CRM114-Status: GOOD (  10.84  )
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

On 05/11/2025 01:37, Jakub Kicinski wrote:
> On Mon,  3 Nov 2025 15:09:46 +0000 Vadim Fedorenko wrote:
>> -static int bnx2x_hwtstamp_ioctl(struct bnx2x *bp, struct ifreq *ifr)
>> +static int bnx2x_hwtstamp_set(struct net_device *dev,
>> +			      struct kernel_hwtstamp_config *config,
>> +			      struct netlink_ext_ack *extack)
>>   {
>> -	struct hwtstamp_config config;
>> +	struct bnx2x *bp = netdev_priv(dev);
>>   	int rc;
>>   
>> -	DP(BNX2X_MSG_PTP, "HWTSTAMP IOCTL called\n");
>> -
>> -	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
>> -		return -EFAULT;
>> +	DP(BNX2X_MSG_PTP, "HWTSTAMP SET called\n");
>>   
>>   	DP(BNX2X_MSG_PTP, "Requested tx_type: %d, requested rx_filters = %d\n",
>> -	   config.tx_type, config.rx_filter);
>> +	   config->tx_type, config->rx_filter);
>>   
>>   	bp->hwtstamp_ioctl_called = true;
>> -	bp->tx_type = config.tx_type;
>> -	bp->rx_filter = config.rx_filter;
>> +	bp->tx_type = config->tx_type;
>> +	bp->rx_filter = config->rx_filter;
>>   
>>   	rc = bnx2x_configure_ptp_filters(bp);
> 
> bnx2x_configure_ptp_filters() may return -ERANGE if settings were not applied.
> This may already be semi-broken but with the get in place we will make
> it even worse.

Ah, you mean in case of -ERANGE we will still have new filter
configuration set in bp object? It's easy to fix, but it will be
some kind of change of behavior. If it's acceptable, I'm happy to send 
v3 of the patchset.>
>>   	if (rc)
>>   		return rc;
>>   
>> -	config.rx_filter = bp->rx_filter;
>> +	config->rx_filter = bp->rx_filter;
>> +
>> +	return 0;
>> +}
>>   
>> -	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ?
>> -		-EFAULT : 0;
>> +static int bnx2x_hwtstamp_get(struct net_device *dev,
>> +			      struct kernel_hwtstamp_config *config)
>> +{
>> +	struct bnx2x *bp = netdev_priv(dev);
>> +
>> +	config->rx_filter = bp->rx_filter;
>> +	config->tx_type = bp->tx_type;
>> +
>> +	return 0;
>>   }


