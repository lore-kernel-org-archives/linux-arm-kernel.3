Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DF0E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwivxpxVIYDF+4TpEnDi3wGOpGpoKj4iIBPxkHPp/HU=; b=4CatCkANHPOapS2o/fxxFJkWnD
	qqBOmNcyGp/Lz4jmigceEVqoLuch+7Z6weul92kCXjH8y5Js2pO1D0D92G+f2pXXLYWBz9UG2ODNz
	/nPmY3L08NRcdNqUov9BnLE84Lx24XKOKnbRvk4czTTQkiHR8vNYFhCBL24aUv7DCVZAbXHrdXygI
	4AHL87zQ8+/CVK1gYNIUW6mqmjISPW0m4aBjFz38Dp1NMYeBKjoafMkCEwZ/h67+oFk3+dvRNoZeR
	H3vHdVEt/BwJo15LieDGNmqN0uuh81R9WAI9mYxn55WIhJcRq0Q1ZCfX4yW8ieKMDRs/RYb9qvv7J
	uXlbCCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6gi-00000004JFj-2AJP;
	Tue, 07 Jan 2025 10:19:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV66e-00000004AlW-0F4v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736242954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwivxpxVIYDF+4TpEnDi3wGOpGpoKj4iIBPxkHPp/HU=;
	b=WMkLantrECi+3aYZ/cMWYI2YrEppF6c7LrNg1r7uXXBkYLNS3n19gW7EWwRcKeVJ5uMmlX
	xi6y7BdpsZSAt3z45/CBDosOIWCr9c+ppheB3qT02JGBPOJ+Ke6PJc8fJenogmXUG4s4tI
	9JpFPKImyxCxM+wnFHLQtMkXwgjNfYM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-1Y6NiJjuNfqL8_CtjVAJSw-1; Tue, 07 Jan 2025 04:42:32 -0500
X-MC-Unique: 1Y6NiJjuNfqL8_CtjVAJSw-1
X-Mimecast-MFC-AGG-ID: 1Y6NiJjuNfqL8_CtjVAJSw
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6e6cf6742so4293107785a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242952; x=1736847752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwivxpxVIYDF+4TpEnDi3wGOpGpoKj4iIBPxkHPp/HU=;
        b=ShRu+btEhGYuGHpz9CuVrFX48qNvInLUmSUfNMy5S30ymVKvycjHB62CksqH8Mkw2b
         VkEvJZdXCZsKY6zctKOxzO4hJlrxkS2xV1jLcKjv0txk0irBWhqYU03FFoaCFHAFU2wu
         Md9u+obomtbF9v/zckPYH6zep0l3ugK9B7N2FZ0n2gDqd/Bc+F9YL+felJmolZ5dIg/M
         AWj7ApUeYYgmF7t/x6DpkI7z2IE1TYIXORKd3x2ucWncrXGtykGZsLkiP3dI15HKtpll
         /g+G4mVnyna2VUT/NwtcFosCRVPooLabUyemlLQHQrf8Li2HRNQIGDv0pEPtO2lZ4K55
         wPnw==
X-Forwarded-Encrypted: i=1; AJvYcCW4ix4KDPeD7P3tAdhY3FBFC80zmYs01nVs2wnKRXHzRv+QtpPBzEctV3Q2F4BEicjP0joOD/FQvb2abznimkyR@lists.infradead.org
X-Gm-Message-State: AOJu0YwVWwObtV5blV3tgYZXYk+Y8tH6VWtkklDOJd+D222msppCHeW0
	g8WUCdec6i9YjxOQsHTKMCmR8Y6nY+Nely2/g+Vl+nQ0W57pBY8aowS3KWUFj667wkHceWpcOQJ
	+kUu4cbixQbeYl3mAugCpGMDVEs0zfg1A4mcD6n+cKIBSPQXHxSxLrK1/J3naqxWSr91vgAOb
X-Gm-Gg: ASbGnct64s9A7r1HxN0a7/21eUZTqFfxSZIMf4ZX1j76+2Tjmbc06DE1zj+TGnfe7+l
	3P2rDFyyLH4vPA80Yg1o2zlKj7/0ItVGHqHl4AMx6qKK2xHQggXjD2BIJlIUpv9/GPSDnIVPUSt
	e4YIQ3w5THCADOW4JYPBylXsYTvE//FvlGt1053dc96kfdL/2AYgTB69RRgYaZgM3x5frxzE8Ku
	KhZneQAU8/f32YKy2nOjHbLyrmWdh1msjHgi3beIQYGYuzxZ6V1SBSTSJqKbuHzUYB1hh3BeluN
	GckpwQ==
X-Received: by 2002:a05:620a:1b91:b0:7b6:c6f8:1d29 with SMTP id af79cd13be357-7b9ba7eaea9mr9969596785a.47.1736242952032;
        Tue, 07 Jan 2025 01:42:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoL4ryQ13tVszimld4P2XN/R8atx7/aOaPqZkrzZtIyUBTS11aRRGpCcA8MFJnXniJJtibCQ==
X-Received: by 2002:a05:620a:1b91:b0:7b6:c6f8:1d29 with SMTP id af79cd13be357-7b9ba7eaea9mr9969594385a.47.1736242951690;
        Tue, 07 Jan 2025 01:42:31 -0800 (PST)
Received: from [192.168.88.253] (146-241-73-5.dyn.eolo.it. [146.241.73.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac30d87bsm1578478885a.53.2025.01.07.01.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 01:42:31 -0800 (PST)
Message-ID: <133b8da8-a2da-4bac-b0bb-7dcaebc219b9@redhat.com>
Date: Tue, 7 Jan 2025 10:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250103092033.1533374-3-danishanwar@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RKmPPguRTyVKlBE-Oy8et93hWV6ypByzmHxn0GqxFDY_1736242952
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_014236_174591_B874E043 
X-CRM114-Status: GOOD (  26.05  )
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

On 1/3/25 10:20 AM, MD Danish Anwar wrote:
> Add multicast filtering support for VLAN interfaces in dual EMAC mode
> for ICSSG driver.
> 
> The driver uses vlan_for_each() API to get the list of available
> vlans. The driver then sync mc addr of vlan interface with a locally
> mainatined list emac->vlan_mcast_list[vid] using __hw_addr_sync_multiple()
> API.
> 
> The driver then calls the sync / unsync callbacks and based on whether
> the ndev is vlan or not, driver passes appropriate vid to FDB helper
> functions.
> 
> This commit also exports __hw_addr_sync_multiple() in order to use it
> from the ICSSG driver.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 67 ++++++++++++++++----
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  6 ++
>  include/linux/netdevice.h                    |  3 +
>  net/core/dev_addr_lists.c                    |  7 +-
>  4 files changed, 66 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 1663941e59e3..ed8b5a3184d6 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -472,30 +472,44 @@ const struct icss_iep_clockops prueth_iep_clockops = {
>  
>  static int icssg_prueth_add_mcast(struct net_device *ndev, const u8 *addr)
>  {
> -	struct prueth_emac *emac = netdev_priv(ndev);
> -	int port_mask = BIT(emac->port_id);
> +	struct net_device *real_dev;
> +	struct prueth_emac *emac;
> +	int port_mask;
> +	u8 vlan_id;
>  
> -	port_mask |= icssg_fdb_lookup(emac, addr, 0);
> -	icssg_fdb_add_del(emac, addr, 0, port_mask, true);
> -	icssg_vtbl_modify(emac, 0, port_mask, port_mask, true);
> +	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_MAC;
> +	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
> +	emac = netdev_priv(real_dev);
> +
> +	port_mask = BIT(emac->port_id) | icssg_fdb_lookup(emac, addr, vlan_id);
> +	icssg_fdb_add_del(emac, addr, vlan_id, port_mask, true);
> +	icssg_vtbl_modify(emac, vlan_id, port_mask, port_mask, true);
>  
>  	return 0;
>  }
>  
>  static int icssg_prueth_del_mcast(struct net_device *ndev, const u8 *addr)
>  {
> -	struct prueth_emac *emac = netdev_priv(ndev);
> -	int port_mask = BIT(emac->port_id);
> +	struct net_device *real_dev;
> +	struct prueth_emac *emac;
>  	int other_port_mask;
> +	int port_mask;
> +	u8 vlan_id;
> +
> +	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_MAC;
> +	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
> +	emac = netdev_priv(real_dev);
>  
> -	other_port_mask = port_mask ^ icssg_fdb_lookup(emac, addr, 0);
> +	port_mask = BIT(emac->port_id);
> +	other_port_mask = port_mask ^ icssg_fdb_lookup(emac, addr, vlan_id);
>  
> -	icssg_fdb_add_del(emac, addr, 0, port_mask, false);
> -	icssg_vtbl_modify(emac, 0, port_mask, port_mask, false);
> +	icssg_fdb_add_del(emac, addr, vlan_id, port_mask, false);
> +	icssg_vtbl_modify(emac, vlan_id, port_mask, port_mask, false);
>  
>  	if (other_port_mask) {
> -		icssg_fdb_add_del(emac, addr, 0, other_port_mask, true);
> -		icssg_vtbl_modify(emac, 0, other_port_mask, other_port_mask, true);
> +		icssg_fdb_add_del(emac, addr, vlan_id, other_port_mask, true);
> +		icssg_vtbl_modify(emac, vlan_id, other_port_mask,
> +				  other_port_mask, true);
>  	}
>  
>  	return 0;
> @@ -531,6 +545,25 @@ static int icssg_prueth_hsr_del_mcast(struct net_device *ndev, const u8 *addr)
>  	return 0;
>  }
>  
> +static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
> +				   void *args)
> +{
> +	struct prueth_emac *emac = args;
> +
> +	if (!vdev || !vid)
> +		return 0;
> +
> +	netif_addr_lock_bh(vdev);
> +	__hw_addr_sync_multiple(&emac->vlan_mcast_list[vid], &vdev->mc,
> +				vdev->addr_len);
> +	netif_addr_unlock_bh(vdev);

At this point, isn't emac->vlan_mcast_list[vid] == vdev->mc?

> +
> +	__hw_addr_sync_dev(&emac->vlan_mcast_list[vid], vdev,
> +			   icssg_prueth_add_mcast, icssg_prueth_del_mcast);

If so, can this function be reduced to just:

	__dev_mc_sync(vdev, icssg_prueth_add_mcast, icssg_prueth_del_mcast);

?

> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> index 166e404f7c03..90716bd736f3 100644
> --- a/net/core/dev_addr_lists.c
> +++ b/net/core/dev_addr_lists.c
> @@ -242,9 +242,9 @@ static void __hw_addr_unsync_one(struct netdev_hw_addr_list *to_list,
>  	__hw_addr_del_entry(from_list, ha, false, false);
>  }
>  
> -static int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
> -				   struct netdev_hw_addr_list *from_list,
> -				   int addr_len)
> +int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
> +			    struct netdev_hw_addr_list *from_list,
> +			    int addr_len)
>  {
>  	int err = 0;
>  	struct netdev_hw_addr *ha, *tmp;
> @@ -260,6 +260,7 @@ static int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
>  	}
>  	return err;
>  }
> +EXPORT_SYMBOL(__hw_addr_sync_multiple);

I'm asking because this additional export looks suspect. How other
drivers cope with similar situation?

Thanks!

Paolo


