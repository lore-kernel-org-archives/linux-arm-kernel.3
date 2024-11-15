Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77BDD6A223
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 01:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1B0+nAObDpl5MN88iMX9YaFpcbaMcfUiV7eJKN4fYM=; b=BUSpAMX6nHC4PjJjKyJuK8rwz5
	PNdmFJrMKsaIGi90G2isGbjgO++r47OGO3+38isCQ6M8RM57P+u/s8zZHq/VBd16W7DFRDFA6bR0T
	hvZCAimX2CDWV9enxcF+/WC+nzdlBesgOLzCUXDIjnM+3rZo9o8KPgRullmILGWfxK765gkFtq7v9
	iT68I8GyMHh6FYu9fYXJRB3PzwbguuQNaIZNak3tgl/F7BCHIGn/Sk1CD1oQX6NN2T1IzEbuW2rAz
	jH8TSkKsHvBdogMZa2TuSBlN7nwwkojZRTOE53WIkuAoYA2HLZ9cLc+rUu8//wbNbNRvHHp4xutZK
	Go3wiiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBlPy-00000001KuU-0L4K;
	Fri, 15 Nov 2024 01:46:38 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBlP2-00000001Kio-1dqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 01:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731635140; x=1763171140;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yJjdF32OY6zfb+mESQ3VGqFK0PLcIWDQ8VkuY/mylkw=;
  b=TK7AhXuGPZpK3yqyOL1ReC6ZG9xPGERO7z35JQ1Ynj93DUhxmGetAzXO
   avewthCcUEcumD6utgfgFYRVft8que6PEvDnqy5ktQ213h8i+hUhV13c0
   +IP8ZOQvQvFfnE0rmpOTAcwfrBR9d4R0aUMgKUfOysZuUWe7fSlSEfqKD
   TTP7cVMZN0+W2eeyKZHO/SMgiRXpkIMAUI8cXzdyh5jnM2QXiJS9023xA
   CBb687FLZUcDr16Q2gBfWLFtY/UcOp99zWWxkPHffBv1YDjxeZnqqjL2b
   Y7ubuC4KhqJAwr2BOhwOTeuVPiCAxJrYPnOQgyU3hndTnKj8l/1pxmLTi
   Q==;
X-CSE-ConnectionGUID: /t1B+Qq9QtyH1P6CDA1xeQ==
X-CSE-MsgGUID: kjDr3QQ/TvyVIyuaPfp47Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31028276"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="31028276"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 17:45:38 -0800
X-CSE-ConnectionGUID: ZSoy7dh8QXaberbAbMlhuA==
X-CSE-MsgGUID: PWUnzZUpRcCKkFqhTZne+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="89153074"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.75.68]) ([10.247.75.68])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 17:45:26 -0800
Message-ID: <fdac60cd-dd7d-4e7b-a65e-2c2a01f4f147@linux.intel.com>
Date: Fri, 15 Nov 2024 09:45:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 2/2] net: stmmac: set initial EEE policy
 configuration
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-3-yong.liang.choong@linux.intel.com>
 <a6cbf428-4672-4beb-8c55-e4d3ae684458@lunn.ch>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <a6cbf428-4672-4beb-8c55-e4d3ae684458@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_174540_497071_C65BC621 
X-CRM114-Status: GOOD (  13.58  )
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



On 14/11/2024 10:19 pm, Andrew Lunn wrote:
> On Thu, Nov 14, 2024 at 04:16:53PM +0800, Choong Yong Liang wrote:
>> Set the initial eee_cfg values to have 'ethtool --show-eee ' display
>> the initial EEE configuration.
>>
>> Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 7bf275f127c9..5fce52a9412e 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -1204,7 +1204,7 @@ static int stmmac_init_phy(struct net_device *dev)
>>   			netdev_err(priv->dev, "no phy at addr %d\n", addr);
>>   			return -ENODEV;
>>   		}
>> -
>> +		phy_support_eee(phydev);
>>   		ret = phylink_connect_phy(priv->phylink, phydev);
> 
> Is supporting EEE a synthesis option, or is it always available?
> 
> Some EEE code is guarded by:
> 
>          if (!priv->dma_cap.eee)
>                  return -EOPNOTSUPP;
> 
> 	Andrew

It's a synthesis option that should check priv->dma_cap.eee before setting 
EEE. I will update it in the next version.

