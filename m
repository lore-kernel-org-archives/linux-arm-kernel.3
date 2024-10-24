Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17AACE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lx0RGIhvjGwcm6FPAAxd+CivzPqBmE5HANWs11llh7w=; b=mT8U6M6Bk9/9kskyOD2pF1rwyI
	TJi5QTaxdW+9wqjU/iPixPTepOGoceezCcOdmbWIZWRjrGCCdywl3KhtYHEHant5IBLkEe3iGOVus
	Ud4ktCB4IgWTDG9sPA7XCJOn9KpDMLxffrxYpYGMjnYbgM3w0w7v6XnWhGbJWlJMEgzJ0ISzvUJvi
	xmM5IphcTtoOGBElcdUafl3onITckZ0a5e1DfDeMezaIyxHOQ6hP3uZtlCck0Gn9v3ZOXdqBjYU0l
	GDT41+8+lhUaXYdzrBp9d/T73BWVwiDavARuTfOJh7KDixWWZS0DXu5lY1k2io1kc0wPAfrgfWPHl
	/bfLrh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40jr-000000016DJ-15qO;
	Thu, 24 Oct 2024 16:31:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zUZ-00000000sGv-02Yk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 15:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Lx0RGIhvjGwcm6FPAAxd+CivzPqBmE5HANWs11llh7w=; b=DOyone490gZOqsNYpjPKvoy09A
	obGxgSSuU3D/hjauJLpa8qjG7eKJ8adTANqpCAogyIkGuUzotFIQqeIJDXRq2i8EMi1gTaaxp/A2o
	Orxsq7xbkRx5WVldcYVlnWBifY9naeF0WiFb17cHkycDoEymN+adH4Ik25DT1lNiX4IvEpa/b6bhF
	hPyTVpRyMlINSYj0QzJOFQKUG0Z2KPRVxTC7e9LM9jkEunUbfwRClIxnI4eMXQlfxXpHNRqrFSuiI
	5S94Poc+szvque3CxhSrvC+gWc5Sr6wAV/rcTCnLfcwiH+HVHtVTWio2eRdUo8gxyHGe87ORFlYDe
	+rUsh/ig==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zUU-00000008gpi-2FWM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:11:13 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49OFAcd0051743;
	Thu, 24 Oct 2024 10:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729782638;
	bh=Lx0RGIhvjGwcm6FPAAxd+CivzPqBmE5HANWs11llh7w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R6UGdaQO9DZCB7vWxWzLoZ+4H0Dy5Q55in+6fHw3vssJT7047rifKDXQsey2V2pTN
	 vQKh8/aFREz8Pw5Vrwg+VmzVHq9o7CCAdPZLNybMrbsuoINi0XaFiRlS5vVjn97eir
	 uy051Mx5xEtV4iVqoStmBVuXpOl8QDA4c0dVPU6M=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49OFAcfW032095
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2024 10:10:38 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 10:10:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 10:10:38 -0500
Received: from [10.249.129.69] ([10.249.129.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49OFATsf028284;
	Thu, 24 Oct 2024 10:10:30 -0500
Message-ID: <d8cf61e5-2c56-4c48-9cf3-fd54754c3816@ti.com>
Date: Thu, 24 Oct 2024 20:40:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/4] net: hsr: Add VLAN CTAG filter support
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        MD Danish Anwar
	<danishanwar@ti.com>, <geliang@kernel.org>,
        <liuhangbin@gmail.com>, <dan.carpenter@linaro.org>, <jiri@resnulli.us>,
        <n.zhandarovich@fintech.ru>, <aleksander.lobakin@intel.com>,
        <lukma@denx.de>, <horms@kernel.org>, <jan.kiszka@siemens.com>,
        <diogo.ivo@siemens.com>, <shuah@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <m-malladi@ti.com>
References: <20241024103056.3201071-1-danishanwar@ti.com>
 <20241024103056.3201071-3-danishanwar@ti.com>
 <6cd4d59d-b635-47a3-8207-c07a18603037@linux.dev>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <6cd4d59d-b635-47a3-8207-c07a18603037@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_161111_061643_D11179C4 
X-CRM114-Status: GOOD (  26.44  )
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

Hi Vadim,

On 10/24/2024 7:06 PM, Vadim Fedorenko wrote:
> On 24/10/2024 11:30, MD Danish Anwar wrote:
>> From: Murali Karicheri <m-karicheri2@ti.com>
>>
>> This patch adds support for VLAN ctag based filtering at slave devices.
>> The slave ethernet device may be capable of filtering ethernet packets
>> based on VLAN ID. This requires that when the VLAN interface is created
>> over an HSR/PRP interface, it passes the VID information to the
>> associated slave ethernet devices so that it updates the hardware
>> filters to filter ethernet frames based on VID. This patch adds the
>> required functions to propagate the vid information to the slave
>> devices.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>   net/hsr/hsr_device.c | 71 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 70 insertions(+), 1 deletion(-)
>>
>> diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
>> index 0ca47ebb01d3..ff586bdc2bde 100644
>> --- a/net/hsr/hsr_device.c
>> +++ b/net/hsr/hsr_device.c
>> @@ -515,6 +515,68 @@ static void hsr_change_rx_flags(struct net_device
>> *dev, int change)
>>       }
>>   }
>>   +static int hsr_ndo_vlan_rx_add_vid(struct net_device *dev,
>> +                   __be16 proto, u16 vid)
>> +{
>> +    struct hsr_port *port;
>> +    struct hsr_priv *hsr;
>> +    int ret = 0;
>> +
>> +    hsr = netdev_priv(dev);
>> +
>> +    hsr_for_each_port(hsr, port) {
>> +        if (port->type == HSR_PT_MASTER)
>> +            continue;
>> +
>> +        ret = vlan_vid_add(port->dev, proto, vid);
>> +        switch (port->type) {
>> +        case HSR_PT_SLAVE_A:
>> +            if (ret) {
>> +                netdev_err(dev, "add vid failed for Slave-A\n");
>> +                return ret;
>> +            }
>> +            break;
>> +
>> +        case HSR_PT_SLAVE_B:
>> +            if (ret) {
>> +                /* clean up Slave-A */
>> +                netdev_err(dev, "add vid failed for Slave-B\n");
>> +                vlan_vid_del(port->dev, proto, vid);
>> +                return ret;
>> +            }
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
> 
> This function doesn't match with hsr_ndo_vlan_rx_kill_vid().
> vlan_vid_add() can potentially be executed for port->type
> equals to HSR_PT_INTERLINK, but the result will be ignored. And
> the vlan_vid_del() will never happen in this case. Is it desired
> behavior? Maybe it's better to synchronize add/del code and refactor
> error path to avoid coping the code?
> 

The kill_vid / add_vid is not similar because during add_vid, if
vlan_vid_add() succeeds for one port but fails for other, we need to
delete it for the earlier port. We can only continue if vlan_vid_add()
succeeds for both ports. That's the reason the switch case handling of
add_vid can not match the same for kill_vid. Since cleanup of port is
needed, it's not possible to synchronize add/kill code

We only care about HSR_PT_SLAVE_A and HSR_PT_SLAVE_B here. So it's okay
to ignore HSR_PT_INTERLINK. It's a desired behaviour here.

>> +
>> +static int hsr_ndo_vlan_rx_kill_vid(struct net_device *dev,
>> +                    __be16 proto, u16 vid)
>> +{
>> +    struct hsr_port *port;
>> +    struct hsr_priv *hsr;
>> +
>> +    hsr = netdev_priv(dev);
>> +
>> +    hsr_for_each_port(hsr, port) {
>> +        if (port->type == HSR_PT_MASTER)
>> +            continue;
>> +        switch (port->type) {
>> +        case HSR_PT_SLAVE_A:
>> +        case HSR_PT_SLAVE_B:
>> +            vlan_vid_del(port->dev, proto, vid);
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct net_device_ops hsr_device_ops = {
>>       .ndo_change_mtu = hsr_dev_change_mtu,
>>       .ndo_open = hsr_dev_open,
>> @@ -523,6 +585,8 @@ static const struct net_device_ops hsr_device_ops = {
>>       .ndo_change_rx_flags = hsr_change_rx_flags,
>>       .ndo_fix_features = hsr_fix_features,
>>       .ndo_set_rx_mode = hsr_set_rx_mode,
>> +    .ndo_vlan_rx_add_vid = hsr_ndo_vlan_rx_add_vid,
>> +    .ndo_vlan_rx_kill_vid = hsr_ndo_vlan_rx_kill_vid,
>>   };
>>     static const struct device_type hsr_type = {
>> @@ -569,7 +633,8 @@ void hsr_dev_setup(struct net_device *dev)
>>         dev->hw_features = NETIF_F_SG | NETIF_F_FRAGLIST |
>> NETIF_F_HIGHDMA |
>>                  NETIF_F_GSO_MASK | NETIF_F_HW_CSUM |
>> -               NETIF_F_HW_VLAN_CTAG_TX;
>> +               NETIF_F_HW_VLAN_CTAG_TX |
>> +               NETIF_F_HW_VLAN_CTAG_FILTER;
>>         dev->features = dev->hw_features;
>>   }
>> @@ -647,6 +712,10 @@ int hsr_dev_finalize(struct net_device *hsr_dev,
>> struct net_device *slave[2],
>>           (slave[1]->features & NETIF_F_HW_HSR_FWD))
>>           hsr->fwd_offloaded = true;
>>   +    if ((slave[0]->features & NETIF_F_HW_VLAN_CTAG_FILTER) &&
>> +        (slave[1]->features & NETIF_F_HW_VLAN_CTAG_FILTER))
>> +        hsr_dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>> +
>>       res = register_netdevice(hsr_dev);
>>       if (res)
>>           goto err_unregister;
> 

-- 
Thanks and Regards,
Md Danish Anwar

