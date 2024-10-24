Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0925CE8E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wf2g1jKmKuGEGD90gcjJ+D3Suvt0meADVKnkeTAAty8=; b=DkzM1vyKkuKfo0se8S1La4Iy1V
	KYbJw9SsdcfwKjO3kKHMS3RD9LewUe2CwzmNhzLoKWlnbQ8z1XY3DxcmAFLel9tELNKVN7MyA2I7b
	UvpXBvbH5znoxtSDmEMp/X7mYIROnBHmKozEo6R/CLd0J85DspI75K5pOO43/d72frydUy5xPyhW2
	cU4oJLsN3WoySHceN21Mm60p8ZCRhX1gHnY6vpQs6ontLvtDL5HvTU1eF2mvUAy4IdzXFTYygUXRA
	sOXchS59Mh/3lGhrH1UNtd6zzcnUugd577Y/MXbrlle7RvlLM7em4J5KnGraru3tnM9bs4uPOOtRn
	fpwu1qIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3y3T-00000000YkN-1bJV;
	Thu, 24 Oct 2024 13:39:11 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3y0j-00000000Y5e-1ia9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:36:23 +0000
Message-ID: <6cd4d59d-b635-47a3-8207-c07a18603037@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729776978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wf2g1jKmKuGEGD90gcjJ+D3Suvt0meADVKnkeTAAty8=;
	b=SQzhPISO9aL3GFavgXIE7050rMHRPRmuAJ3mGuvOQ+2Ez/w/a6dHS2GZ3kyN/KScT0+qM0
	ofsmXgFBSnGggJ6baSLnbUNsrY2IjkFMzlnzpUkMHCGSooSA1ydnKQ8iVP/MT8LhP1qYEe
	ZEc9cu5NBsr6tXwn2cqqmQgZhF9/wrI=
Date: Thu, 24 Oct 2024 14:36:10 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 2/4] net: hsr: Add VLAN CTAG filter support
To: MD Danish Anwar <danishanwar@ti.com>, geliang@kernel.org,
 liuhangbin@gmail.com, dan.carpenter@linaro.org, jiri@resnulli.us,
 n.zhandarovich@fintech.ru, aleksander.lobakin@intel.com, lukma@denx.de,
 horms@kernel.org, jan.kiszka@siemens.com, diogo.ivo@siemens.com,
 shuah@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 m-malladi@ti.com
References: <20241024103056.3201071-1-danishanwar@ti.com>
 <20241024103056.3201071-3-danishanwar@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20241024103056.3201071-3-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_063622_178452_D76AE901 
X-CRM114-Status: GOOD (  26.07  )
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

On 24/10/2024 11:30, MD Danish Anwar wrote:
> From: Murali Karicheri <m-karicheri2@ti.com>
> 
> This patch adds support for VLAN ctag based filtering at slave devices.
> The slave ethernet device may be capable of filtering ethernet packets
> based on VLAN ID. This requires that when the VLAN interface is created
> over an HSR/PRP interface, it passes the VID information to the
> associated slave ethernet devices so that it updates the hardware
> filters to filter ethernet frames based on VID. This patch adds the
> required functions to propagate the vid information to the slave
> devices.
> 
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>   net/hsr/hsr_device.c | 71 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
> index 0ca47ebb01d3..ff586bdc2bde 100644
> --- a/net/hsr/hsr_device.c
> +++ b/net/hsr/hsr_device.c
> @@ -515,6 +515,68 @@ static void hsr_change_rx_flags(struct net_device *dev, int change)
>   	}
>   }
>   
> +static int hsr_ndo_vlan_rx_add_vid(struct net_device *dev,
> +				   __be16 proto, u16 vid)
> +{
> +	struct hsr_port *port;
> +	struct hsr_priv *hsr;
> +	int ret = 0;
> +
> +	hsr = netdev_priv(dev);
> +
> +	hsr_for_each_port(hsr, port) {
> +		if (port->type == HSR_PT_MASTER)
> +			continue;
> +
> +		ret = vlan_vid_add(port->dev, proto, vid);
> +		switch (port->type) {
> +		case HSR_PT_SLAVE_A:
> +			if (ret) {
> +				netdev_err(dev, "add vid failed for Slave-A\n");
> +				return ret;
> +			}
> +			break;
> +
> +		case HSR_PT_SLAVE_B:
> +			if (ret) {
> +				/* clean up Slave-A */
> +				netdev_err(dev, "add vid failed for Slave-B\n");
> +				vlan_vid_del(port->dev, proto, vid);
> +				return ret;
> +			}
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}

This function doesn't match with hsr_ndo_vlan_rx_kill_vid().
vlan_vid_add() can potentially be executed for port->type
equals to HSR_PT_INTERLINK, but the result will be ignored. And
the vlan_vid_del() will never happen in this case. Is it desired
behavior? Maybe it's better to synchronize add/del code and refactor
error path to avoid coping the code?

> +
> +static int hsr_ndo_vlan_rx_kill_vid(struct net_device *dev,
> +				    __be16 proto, u16 vid)
> +{
> +	struct hsr_port *port;
> +	struct hsr_priv *hsr;
> +
> +	hsr = netdev_priv(dev);
> +
> +	hsr_for_each_port(hsr, port) {
> +		if (port->type == HSR_PT_MASTER)
> +			continue;
> +		switch (port->type) {
> +		case HSR_PT_SLAVE_A:
> +		case HSR_PT_SLAVE_B:
> +			vlan_vid_del(port->dev, proto, vid);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct net_device_ops hsr_device_ops = {
>   	.ndo_change_mtu = hsr_dev_change_mtu,
>   	.ndo_open = hsr_dev_open,
> @@ -523,6 +585,8 @@ static const struct net_device_ops hsr_device_ops = {
>   	.ndo_change_rx_flags = hsr_change_rx_flags,
>   	.ndo_fix_features = hsr_fix_features,
>   	.ndo_set_rx_mode = hsr_set_rx_mode,
> +	.ndo_vlan_rx_add_vid = hsr_ndo_vlan_rx_add_vid,
> +	.ndo_vlan_rx_kill_vid = hsr_ndo_vlan_rx_kill_vid,
>   };
>   
>   static const struct device_type hsr_type = {
> @@ -569,7 +633,8 @@ void hsr_dev_setup(struct net_device *dev)
>   
>   	dev->hw_features = NETIF_F_SG | NETIF_F_FRAGLIST | NETIF_F_HIGHDMA |
>   			   NETIF_F_GSO_MASK | NETIF_F_HW_CSUM |
> -			   NETIF_F_HW_VLAN_CTAG_TX;
> +			   NETIF_F_HW_VLAN_CTAG_TX |
> +			   NETIF_F_HW_VLAN_CTAG_FILTER;
>   
>   	dev->features = dev->hw_features;
>   }
> @@ -647,6 +712,10 @@ int hsr_dev_finalize(struct net_device *hsr_dev, struct net_device *slave[2],
>   	    (slave[1]->features & NETIF_F_HW_HSR_FWD))
>   		hsr->fwd_offloaded = true;
>   
> +	if ((slave[0]->features & NETIF_F_HW_VLAN_CTAG_FILTER) &&
> +	    (slave[1]->features & NETIF_F_HW_VLAN_CTAG_FILTER))
> +		hsr_dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> +
>   	res = register_netdevice(hsr_dev);
>   	if (res)
>   		goto err_unregister;


