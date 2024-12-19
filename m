Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B961FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsnH79CaQlp66NWw62f+jHDtlXUygpjnPNoSMN2nv0A=; b=o1zkrPVX0LZMIMNGNdlUfS6V1e
	eNeQ1lfSaxy1N9pSs+S6/PP/oH8bbopd0vDxtuwvUj7GUITQJFMFpz4ODxOTrQSLJXe8GOpZPSCiT
	lx5bL1Zz+oBJH4VOPu0rFKFQH+Vsky/9BwXG6rIg8s7IvZCfAP7n+pevLopRUZezMawT9Fyy7nwq/
	HE2ibuuuDsvzdw+o559/4Yntx5s1255SfPVgxWNDdzhf3LGC4XQ00B1wvH8lvQ+A4wxB4ECGUZ0yj
	rHC81sw7RfJTwOTDo9iGUnKcKcAUEKMOIAHFLy5nvB21NAye+/cC1h5K436KcYdjvDQzZ5eF6k7sM
	NgEv0nUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCip-00000001OWf-1om4;
	Thu, 19 Dec 2024 09:21:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOChh-00000001O6X-48QV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 09:20:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ9K3ce048749;
	Thu, 19 Dec 2024 03:20:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734600003;
	bh=gsnH79CaQlp66NWw62f+jHDtlXUygpjnPNoSMN2nv0A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Lhlr1qX/N2FQtNADzobSMU+l/B3Y3Py9OZRf7FtwVDYsmtTA+WuPxrFZrf51irXOI
	 vZGIRKTJ76aggF38GfC+n9FaeY8ZKuAkr+XTLnAHX6i4trwoymgSl940ntHRaJsez7
	 xzpJB2GAz96fN0JICjCat3c82zEYE4PKO5e8MIuc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJ9K2jD002828
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 03:20:02 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 03:20:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 03:20:01 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ9JtfB023256;
	Thu, 19 Dec 2024 03:19:56 -0600
Message-ID: <06886be4-5f35-4785-bc63-a5c84887adfb@ti.com>
Date: Thu, 19 Dec 2024 14:49:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] net: ti: icssg-prueth: Add VLAN support in
 EMAC mode
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
CC: <aleksander.lobakin@intel.com>, <lukma@denx.de>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <rdunlap@infradead.org>,
        <schnelle@linux.ibm.com>, <vladimir.oltean@nxp.com>,
        <horms@kernel.org>, <rogerq@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20241216100044.577489-1-danishanwar@ti.com>
 <20241216100044.577489-3-danishanwar@ti.com>
 <Z2PE5m8R5lM4/YRT@mev-dev.igk.intel.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <Z2PE5m8R5lM4/YRT@mev-dev.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_012022_110786_5B74780F 
X-CRM114-Status: GOOD (  13.57  )
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



On 19/12/24 12:32 pm, Michal Swiatkowski wrote:
> On Mon, Dec 16, 2024 at 03:30:42PM +0530, MD Danish Anwar wrote:
>> Add support for vlan filtering in dual EMAC mode.
>>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 29 +++++++++-----------
>>  1 file changed, 13 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> index c568c84a032b..e031bccf31dc 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> @@ -822,19 +822,18 @@ static int emac_ndo_vlan_rx_add_vid(struct net_device *ndev,
>>  {
>>  	struct prueth_emac *emac = netdev_priv(ndev);
>>  	struct prueth *prueth = emac->prueth;
>> +	int port_mask = BIT(emac->port_id);
>>  	int untag_mask = 0;
>> -	int port_mask;
>>  
>> -	if (prueth->is_hsr_offload_mode) {
>> -		port_mask = BIT(PRUETH_PORT_HOST) | BIT(emac->port_id);
>> -		untag_mask = 0;
>> +	if (prueth->is_hsr_offload_mode)
>> +		port_mask |= BIT(PRUETH_PORT_HOST);
>>  
>> -		netdev_dbg(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
>> -			   vid, port_mask, untag_mask);
>> +	netdev_err(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
>> +		   vid, port_mask, untag_mask);
>> +
>> +	icssg_vtbl_modify(emac, vid, port_mask, untag_mask, true);
>> +	icssg_set_pvid(emac->prueth, vid, emac->port_id);
>>  
>> -		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, true);
>> -		icssg_set_pvid(emac->prueth, vid, emac->port_id);
>> -	}
>>  	return 0;
>>  }
>>  
>> @@ -843,18 +842,16 @@ static int emac_ndo_vlan_rx_del_vid(struct net_device *ndev,
>>  {
>>  	struct prueth_emac *emac = netdev_priv(ndev);
>>  	struct prueth *prueth = emac->prueth;
>> +	int port_mask = BIT(emac->port_id);
>>  	int untag_mask = 0;
>> -	int port_mask;
>>  
>> -	if (prueth->is_hsr_offload_mode) {
>> +	if (prueth->is_hsr_offload_mode)
>>  		port_mask = BIT(PRUETH_PORT_HOST);
>> -		untag_mask = 0;
>>  
>> -		netdev_dbg(emac->ndev, "VID del vid:%u port_mask:%X untag_mask  %X\n",
>> -			   vid, port_mask, untag_mask);
>> +	netdev_err(emac->ndev, "VID del vid:%u port_mask:%X untag_mask  %X\n",
>> +		   vid, port_mask, untag_mask);
> Why error? It doesn't look like error path, previously there was
> netdev_dbg (made more sense in my opinion)
> 

My bad. It should be netdev_dbg(). I'll change it in v2. Thanks

>> +	icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
>>  
>> -		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
>> -	}
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.34.1

-- 
Thanks and Regards,
Danish

