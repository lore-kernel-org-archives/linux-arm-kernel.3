Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89B2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDN/P01jWJPJ5QM/7LmOZ2v2J1xabNeKNPYeVf5XVEs=; b=HPYAOsF9ENFRiZTUihAlwxFoNQ
	AQaKRaOVsWINbVGRG5t8q/tq+xzF0uMAAotZCJHfp/Tt2pQLvLvVf/EZGsuuhd0j3YFlPrCDc+gvq
	wnn0QFNY/SBRflsaz4+ecKBvpuy43HxYcH/mMumOUv283VCXZlk44L7us6Gt8lp0JLIOG3He0zGbH
	HDr69eOlvHgak62n3epOIYM8OvZPcg7YWrQsmTUH9LUfBJru+jjNCI6J063Wx0NY2VzFN32G01QuX
	lTekMNpQJ+II2qogshAqgdt1rA0npVEvKU7oSsiS8q1aKQZzktMBbk+HdPXskrJFm8eZhu5vZayGa
	avareffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV79q-00000004RTq-1KxJ;
	Tue, 07 Jan 2025 10:49:58 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV77x-00000004QxL-2YVj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:48:05 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 507AlgBS2632561
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 04:47:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736246862;
	bh=qDN/P01jWJPJ5QM/7LmOZ2v2J1xabNeKNPYeVf5XVEs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sxz6WjWr6N23QQO76D37TFFVL+wbdeWvkfr4NLTzLILqrMlEdlszu0QlLrmhZh28A
	 xYwSy1BZROUFbxtR1JAM3QFjhLa+6a4tGRN/N4kcRX5dYtaT4sZkKim7inl1rGH3/7
	 gTvkx+1GaOsVhCc3ZoLLylZ4rzxMaeocPzDwBDfk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 507AlgT1080432
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jan 2025 04:47:42 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Jan 2025 04:47:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Jan 2025 04:47:41 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 507AlaUH004144;
	Tue, 7 Jan 2025 04:47:36 -0600
Message-ID: <31a45fb4-acb6-4eb6-9ffb-ff1be798a064@ti.com>
Date: Tue, 7 Jan 2025 16:17:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/3] net: ti: icssg-prueth: Add Multicast
 Filtering support for VLAN in MAC mode
To: Paolo Abeni <pabeni@redhat.com>, Jeongjun Park <aha310510@gmail.com>,
        Alexander Lobakin <aleksander.lobakin@intel.com>,
        Lukasz Majewski
	<lukma@denx.de>, Meghana Malladi <m-malladi@ti.com>,
        Diogo Ivo
	<diogo.ivo@siemens.com>, Simon Horman <horms@kernel.org>,
        Jakub Kicinski
	<kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Roger Quadros
	<rogerq@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
        Larysa Zaremba <larysa.zaremba@intel.com>
References: <20250103092033.1533374-1-danishanwar@ti.com>
 <20250103092033.1533374-3-danishanwar@ti.com>
 <133b8da8-a2da-4bac-b0bb-7dcaebc219b9@redhat.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <133b8da8-a2da-4bac-b0bb-7dcaebc219b9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_024801_818860_81E5572D 
X-CRM114-Status: GOOD (  27.45  )
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

Hi Paolo,

On 07/01/25 3:12 pm, Paolo Abeni wrote:
> On 1/3/25 10:20 AM, MD Danish Anwar wrote:
>> Add multicast filtering support for VLAN interfaces in dual EMAC mode
>> for ICSSG driver.
>>
>> The driver uses vlan_for_each() API to get the list of available
>> vlans. The driver then sync mc addr of vlan interface with a locally
>> mainatined list emac->vlan_mcast_list[vid] using __hw_addr_sync_multiple()
>> API.
>>
>> The driver then calls the sync / unsync callbacks and based on whether
>> the ndev is vlan or not, driver passes appropriate vid to FDB helper
>> functions.
>>
>> This commit also exports __hw_addr_sync_multiple() in order to use it
>> from the ICSSG driver.
>>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 67 ++++++++++++++++----
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  6 ++
>>  include/linux/netdevice.h                    |  3 +
>>  net/core/dev_addr_lists.c                    |  7 +-
>>  4 files changed, 66 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> index 1663941e59e3..ed8b5a3184d6 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> @@ -472,30 +472,44 @@ const struct icss_iep_clockops prueth_iep_clockops = {
>>  
>>  static int icssg_prueth_add_mcast(struct net_device *ndev, const u8 *addr)
>>  {
>> -	struct prueth_emac *emac = netdev_priv(ndev);
>> -	int port_mask = BIT(emac->port_id);
>> +	struct net_device *real_dev;
>> +	struct prueth_emac *emac;
>> +	int port_mask;
>> +	u8 vlan_id;
>>  
>> -	port_mask |= icssg_fdb_lookup(emac, addr, 0);
>> -	icssg_fdb_add_del(emac, addr, 0, port_mask, true);
>> -	icssg_vtbl_modify(emac, 0, port_mask, port_mask, true);
>> +	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_MAC;
>> +	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
>> +	emac = netdev_priv(real_dev);
>> +
>> +	port_mask = BIT(emac->port_id) | icssg_fdb_lookup(emac, addr, vlan_id);
>> +	icssg_fdb_add_del(emac, addr, vlan_id, port_mask, true);
>> +	icssg_vtbl_modify(emac, vlan_id, port_mask, port_mask, true);
>>  
>>  	return 0;
>>  }
>>  
>>  static int icssg_prueth_del_mcast(struct net_device *ndev, const u8 *addr)
>>  {
>> -	struct prueth_emac *emac = netdev_priv(ndev);
>> -	int port_mask = BIT(emac->port_id);
>> +	struct net_device *real_dev;
>> +	struct prueth_emac *emac;
>>  	int other_port_mask;
>> +	int port_mask;
>> +	u8 vlan_id;
>> +
>> +	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_MAC;
>> +	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
>> +	emac = netdev_priv(real_dev);
>>  
>> -	other_port_mask = port_mask ^ icssg_fdb_lookup(emac, addr, 0);
>> +	port_mask = BIT(emac->port_id);
>> +	other_port_mask = port_mask ^ icssg_fdb_lookup(emac, addr, vlan_id);
>>  
>> -	icssg_fdb_add_del(emac, addr, 0, port_mask, false);
>> -	icssg_vtbl_modify(emac, 0, port_mask, port_mask, false);
>> +	icssg_fdb_add_del(emac, addr, vlan_id, port_mask, false);
>> +	icssg_vtbl_modify(emac, vlan_id, port_mask, port_mask, false);
>>  
>>  	if (other_port_mask) {
>> -		icssg_fdb_add_del(emac, addr, 0, other_port_mask, true);
>> -		icssg_vtbl_modify(emac, 0, other_port_mask, other_port_mask, true);
>> +		icssg_fdb_add_del(emac, addr, vlan_id, other_port_mask, true);
>> +		icssg_vtbl_modify(emac, vlan_id, other_port_mask,
>> +				  other_port_mask, true);
>>  	}
>>  
>>  	return 0;
>> @@ -531,6 +545,25 @@ static int icssg_prueth_hsr_del_mcast(struct net_device *ndev, const u8 *addr)
>>  	return 0;
>>  }
>>  
>> +static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
>> +				   void *args)
>> +{
>> +	struct prueth_emac *emac = args;
>> +
>> +	if (!vdev || !vid)
>> +		return 0;
>> +
>> +	netif_addr_lock_bh(vdev);
>> +	__hw_addr_sync_multiple(&emac->vlan_mcast_list[vid], &vdev->mc,
>> +				vdev->addr_len);
>> +	netif_addr_unlock_bh(vdev);
> 
> At this point, isn't emac->vlan_mcast_list[vid] == vdev->mc?
> 
>> +
>> +	__hw_addr_sync_dev(&emac->vlan_mcast_list[vid], vdev,
>> +			   icssg_prueth_add_mcast, icssg_prueth_del_mcast);
> 
> If so, can this function be reduced to just:
> 
> 	__dev_mc_sync(vdev, icssg_prueth_add_mcast, icssg_prueth_del_mcast);
> 
> ?
> 

I don't know but for some reason __dev_mc_sync() doesn't work here. My
initial approach was to use __dev_mc_sync(vdev, sync, unsync) however it
didn't work.

When I use __dev_mc_sync() and print the vlan_id in function
icssg_prueth_add_mcast(). It always prints vlan_id as 0 implying
__dev_mc_sync from here never gets called. Whereas when using
__hw_addr_sync_dev() I see the appropriate vlan_id in
icssg_prueth_add_mcast()

Anyways, Even if I use __dev_mc_sync(), we will still need the export. I
am exporting __hw_addr_sync_multiple() not __hw_addr_sync_dev(). The API
being used by me `__hw_addr_sync_dev()` is already exported.

>> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
>> index 166e404f7c03..90716bd736f3 100644
>> --- a/net/core/dev_addr_lists.c
>> +++ b/net/core/dev_addr_lists.c
>> @@ -242,9 +242,9 @@ static void __hw_addr_unsync_one(struct netdev_hw_addr_list *to_list,
>>  	__hw_addr_del_entry(from_list, ha, false, false);
>>  }
>>  
>> -static int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
>> -				   struct netdev_hw_addr_list *from_list,
>> -				   int addr_len)
>> +int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
>> +			    struct netdev_hw_addr_list *from_list,
>> +			    int addr_len)
>>  {
>>  	int err = 0;
>>  	struct netdev_hw_addr *ha, *tmp;
>> @@ -260,6 +260,7 @@ static int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
>>  	}
>>  	return err;
>>  }
>> +EXPORT_SYMBOL(__hw_addr_sync_multiple);
> 
> I'm asking because this additional export looks suspect. How other
> drivers cope with similar situation?
> 

To avoid exporting I will need to use dev_mc_sync_multiple() which was
in fact suggested by Michal Swiatkowski in [1]. However that won't work
in this case as explained by me in the reply to Michal [2]

[1]
https://lore.kernel.org/all/Z2PLDqqrLdXhLtAF@mev-dev.igk.intel.com/#:~:text=Only%20question%2C%20why%20dev_mc_sync_multiple%20can%27t%20be%20used%20here%3F
[2]
https://lore.kernel.org/all/cb319ffd-ac67-42b3-9786-e8c9970086d2@ti.com/#:~:text=nice%20to%20have.%0A%3E-,I,-don%27t%20think%20that%27s

> Thanks!
> 
> Paolo
> 

-- 
Thanks and Regards,
Danish

