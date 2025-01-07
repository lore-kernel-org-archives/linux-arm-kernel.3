Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA90E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoFNOzzjOpsum/rm1+qrKK5OefFe08iV+YSKMqnMeos=; b=TLskJA6ZccNcjXJlm2KUA7nGAF
	H2nu/EgOsvlCM02Zgu7Utd9o/7/Pl0BsV8G2oI8uJykgavumaw7jC8yU3gQGyK5b3G0js3xIhuGfR
	AbWvaW7dMkMIMkFh/oFPLvXXpEh7erETkUq9NM+ssZ6Tn1QQZ6NImEE3Orn//IiAhkExfAAh+wLGm
	NuHCX7mZwlTQh88fiUqu4EDb9UrJLWsqP4NPMUESTOWbJqYrwK7OrhRH/MzQik/u2tZUssumLqqdD
	1N6anii4U+HDGKjGf/0aDG6gbOUAjLmU/EpNfq6CVAV/Htn8wp7McYRz5Zb8zDt1Q2ttEFcKf66uF
	LLk9cHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVEKK-000000061Pb-1sKX;
	Tue, 07 Jan 2025 18:29:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVEJ6-000000061Iy-2C8y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 18:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736274479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoFNOzzjOpsum/rm1+qrKK5OefFe08iV+YSKMqnMeos=;
	b=ATQO8z9QfrgQM48PS+DC6b+VmeshB5ZUbVCLain+tpU+xMJ9np8vPmZLSDXt6DtnwGJLW+
	YnrwQC5dj67Rl2EPAYEoYer/rJiF4Jzzjdv9b8lUd0ydF86ePSO2InYt8ZguSM7OxK3JFs
	AollriyGGtrKix5ErWWPew1SZBygOxM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-qwNwK-tmOhCfskHXZ1b3lw-1; Tue, 07 Jan 2025 13:27:58 -0500
X-MC-Unique: qwNwK-tmOhCfskHXZ1b3lw-1
X-Mimecast-MFC-AGG-ID: qwNwK-tmOhCfskHXZ1b3lw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4361c040ba8so49251165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 10:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736274477; x=1736879277;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoFNOzzjOpsum/rm1+qrKK5OefFe08iV+YSKMqnMeos=;
        b=l49B7IgBj3RKO87lstxg3Llubc9Nxx9WToNE0psBZHJVQMpHfncmiJ8J5f6PLIFwll
         +J/6CR1zFE9Fy+N7JWCWmxx3ItkwXJb0JPOb6EfBXEvZtnDQ+Cni3fh3v6O1fyp4hJ8B
         P1VyWR9z1NEdt54RQUJz0eIuFHJrk8/pMLp54hhkkSDYcn5cFjCrqgNoT46rwhgwZtsv
         +vPOHgp+rYV8e5O2RtMtARlFxcMf56CullaZr0QI0y8BG7FGDEZehlWhbUWze3mUKlBa
         ciKo5+FRGTdk6JqJboonNYrqsRZZFg8QXc6Hblh4NBG8aED+JU4zVo9fJb4aiUUMp1jH
         oaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6mQfwjUmv3ugviV5TUqbxDN+ymh7uDGoaVIMjHit3+OVHu6a4vHLc2UVObD0M+eGotjDqxf3hhUdfwR+cYx5x@lists.infradead.org
X-Gm-Message-State: AOJu0YwcsinJIkxqXc374UfTb7cLe7UUs6w3TKXDjrtSvtwyJ0jn0yXO
	6BldsBfc410OtFFr/RfNqlYGqPoA1/uigaH/eI7KnC5/hVHUdJ0jyi4K5WtXQC3iCTS0ozQWmeK
	fahMQCGIDCR7sLEJWCrM642z7jCUQujJIbscJ+z/tcJNBdq11PdcIuXT3KJaJcwKtZQbW6Ubi
X-Gm-Gg: ASbGncvKGiIjAyrBfBOcxsg+ACfcgilxOFo2qSl942Mzn1CZ4rnD+KB0HZ/yfzPYoND
	k9pzVwwgzWFA2Ms7YaC7v+wLLDAafAJLUWc5UxNPxOgfYghQaXrtwd9JiC4l7/QSrfmQogSqVze
	1lLnoD3fB4e9z994zEzCW6q5PxPc34G02QRKeqSrEuXgvrNFxZOr3g2x3OBkiWBFH9jj2Mxf3H6
	Ssd5qQcamA53LNeTo+VmoIBAJ4jOnf9bzjDz9Wwnmi8zgwCav7H4IKJAwr2J1lWbt4w1GWNVl0Z
	lQK764zP
X-Received: by 2002:a05:600c:1c0b:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-43668646750mr570729085e9.18.1736274476970;
        Tue, 07 Jan 2025 10:27:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/F4l7VI4VDRjy6QmIK4U6pdZNWV45Eu54IRB23uZDmpwLQvUEwYU50YAp9uyooOD3ts2jEQ==
X-Received: by 2002:a05:600c:1c0b:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-43668646750mr570728835e9.18.1736274476533;
        Tue, 07 Jan 2025 10:27:56 -0800 (PST)
Received: from [192.168.88.253] (146-241-2-244.dyn.eolo.it. [146.241.2.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1a1sm50411886f8f.69.2025.01.07.10.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 10:27:55 -0800 (PST)
Message-ID: <45fac9f0-b31a-495d-bd1b-ccf0fbe19653@redhat.com>
Date: Tue, 7 Jan 2025 19:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v3 2/3] net: ti: icssg-prueth: Add Multicast
 Filtering support for VLAN in MAC mode
To: MD Danish Anwar <danishanwar@ti.com>, Jeongjun Park
 <aha310510@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 Lukasz Majewski <lukma@denx.de>, Meghana Malladi <m-malladi@ti.com>,
 Diogo Ivo <diogo.ivo@siemens.com>, Simon Horman <horms@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Roger Quadros <rogerq@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>
References: <20250103092033.1533374-1-danishanwar@ti.com>
 <20250103092033.1533374-3-danishanwar@ti.com>
 <133b8da8-a2da-4bac-b0bb-7dcaebc219b9@redhat.com>
 <31a45fb4-acb6-4eb6-9ffb-ff1be798a064@ti.com>
In-Reply-To: <31a45fb4-acb6-4eb6-9ffb-ff1be798a064@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ALlpomZdDqtZ553_uHXo2-MpLH57J3RkYMk7SI8eJU0_1736274477
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_102800_649589_06A66E0E 
X-CRM114-Status: GOOD (  25.94  )
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

On 1/7/25 11:47 AM, MD Danish Anwar wrote:
> On 07/01/25 3:12 pm, Paolo Abeni wrote:
>> On 1/3/25 10:20 AM, MD Danish Anwar wrote:
>>> Add multicast filtering support for VLAN interfaces in dual EMAC mode
>>> for ICSSG driver.
>>>
>>> The driver uses vlan_for_each() API to get the list of available
>>> vlans. The driver then sync mc addr of vlan interface with a locally
>>> mainatined list emac->vlan_mcast_list[vid] using __hw_addr_sync_multiple()
>>> API.
>>>
>>> The driver then calls the sync / unsync callbacks and based on whether
>>> the ndev is vlan or not, driver passes appropriate vid to FDB helper
>>> functions.
>>>
>>> This commit also exports __hw_addr_sync_multiple() in order to use it
>>> from the ICSSG driver.
>>>
>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>> ---
>>>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 67 ++++++++++++++++----
>>>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  6 ++
>>>  include/linux/netdevice.h                    |  3 +
>>>  net/core/dev_addr_lists.c                    |  7 +-
>>>  4 files changed, 66 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>>> index 1663941e59e3..ed8b5a3184d6 100644
>>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>>> @@ -472,30 +472,44 @@ const struct icss_iep_clockops prueth_iep_clockops = {
>>>  
>>>  static int icssg_prueth_add_mcast(struct net_device *ndev, const u8 *addr)
>>>  {
>>> -	struct prueth_emac *emac = netdev_priv(ndev);
>>> -	int port_mask = BIT(emac->port_id);
>>> +	struct net_device *real_dev;
>>> +	struct prueth_emac *emac;
>>> +	int port_mask;
>>> +	u8 vlan_id;
>>>  
>>> -	port_mask |= icssg_fdb_lookup(emac, addr, 0);
>>> -	icssg_fdb_add_del(emac, addr, 0, port_mask, true);
>>> -	icssg_vtbl_modify(emac, 0, port_mask, port_mask, true);
>>> +	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_MAC;
>>> +	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
>>> +	emac = netdev_priv(real_dev);
>>> +
>>> +	port_mask = BIT(emac->port_id) | icssg_fdb_lookup(emac, addr, vlan_id);
>>> +	icssg_fdb_add_del(emac, addr, vlan_id, port_mask, true);
>>> +	icssg_vtbl_modify(emac, vlan_id, port_mask, port_mask, true);
>>>  
>>>  	return 0;
>>>  }
>>>  
>>>  static int icssg_prueth_del_mcast(struct net_device *ndev, const u8 *addr)
>>>  {
>>> -	struct prueth_emac *emac = netdev_priv(ndev);
>>> -	int port_mask = BIT(emac->port_id);
>>> +	struct net_device *real_dev;
>>> +	struct prueth_emac *emac;
>>>  	int other_port_mask;
>>> +	int port_mask;
>>> +	u8 vlan_id;
>>> +
>>> +	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_MAC;
>>> +	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
>>> +	emac = netdev_priv(real_dev);
>>>  
>>> -	other_port_mask = port_mask ^ icssg_fdb_lookup(emac, addr, 0);
>>> +	port_mask = BIT(emac->port_id);
>>> +	other_port_mask = port_mask ^ icssg_fdb_lookup(emac, addr, vlan_id);
>>>  
>>> -	icssg_fdb_add_del(emac, addr, 0, port_mask, false);
>>> -	icssg_vtbl_modify(emac, 0, port_mask, port_mask, false);
>>> +	icssg_fdb_add_del(emac, addr, vlan_id, port_mask, false);
>>> +	icssg_vtbl_modify(emac, vlan_id, port_mask, port_mask, false);
>>>  
>>>  	if (other_port_mask) {
>>> -		icssg_fdb_add_del(emac, addr, 0, other_port_mask, true);
>>> -		icssg_vtbl_modify(emac, 0, other_port_mask, other_port_mask, true);
>>> +		icssg_fdb_add_del(emac, addr, vlan_id, other_port_mask, true);
>>> +		icssg_vtbl_modify(emac, vlan_id, other_port_mask,
>>> +				  other_port_mask, true);
>>>  	}
>>>  
>>>  	return 0;
>>> @@ -531,6 +545,25 @@ static int icssg_prueth_hsr_del_mcast(struct net_device *ndev, const u8 *addr)
>>>  	return 0;
>>>  }
>>>  
>>> +static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
>>> +				   void *args)
>>> +{
>>> +	struct prueth_emac *emac = args;
>>> +
>>> +	if (!vdev || !vid)
>>> +		return 0;
>>> +
>>> +	netif_addr_lock_bh(vdev);
>>> +	__hw_addr_sync_multiple(&emac->vlan_mcast_list[vid], &vdev->mc,
>>> +				vdev->addr_len);
>>> +	netif_addr_unlock_bh(vdev);
>>
>> At this point, isn't emac->vlan_mcast_list[vid] == vdev->mc?
>>
>>> +
>>> +	__hw_addr_sync_dev(&emac->vlan_mcast_list[vid], vdev,
>>> +			   icssg_prueth_add_mcast, icssg_prueth_del_mcast);
>>
>> If so, can this function be reduced to just:
>>
>> 	__dev_mc_sync(vdev, icssg_prueth_add_mcast, icssg_prueth_del_mcast);
>>
>> ?
>>
> 
> I don't know but for some reason __dev_mc_sync() doesn't work here. My
> initial approach was to use __dev_mc_sync(vdev, sync, unsync) however it
> didn't work.
> 
> When I use __dev_mc_sync() and print the vlan_id in function
> icssg_prueth_add_mcast(). It always prints vlan_id as 0 implying
> __dev_mc_sync from here never gets called. Whereas when using
> __hw_addr_sync_dev() I see the appropriate vlan_id in
> icssg_prueth_add_mcast()

It look like the above needs more investigation, right? is
vlan_mcast_list[vid] different from vdev->mc? why? At very least you
need to provide a clear explaination of the above.

> Anyways, Even if I use __dev_mc_sync(), we will still need the export. I
> am exporting __hw_addr_sync_multiple() not __hw_addr_sync_dev(). The API
> being used by me `__hw_addr_sync_dev()` is already exported.

I fear there is a misunderstanding. I'm suggesting dropping
__hw_addr_sync_multiple() usage entirely. If that is not possible, a
clear and complete explaination of the reason/root cause must be provided.

Thanks,

Paolo


