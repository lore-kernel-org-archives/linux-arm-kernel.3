Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC01E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rOUVlJtZ8uljbYcwOtBufLmiKSlIWfZvWmApMuUFrM=; b=EUpkCPghK7F/BwFcbUpZXK9jRq
	3j1Y7cQzaSjHAS1tzHf6SYVn7fmt1kklWZizSjuYrX7cbrh7yBX8+4gPYL5Fa4+fOJqmwTGZqRlbt
	1Sd+dca89OgzJbXmlBkoWpP+/evpHopq3s43mxMfzkDAdgg7TU8a44r/apbZ6zxS4uJeyqA7oqMpX
	mE3TDM7iEKo0QC/mEjU3R7s5Xh1I8Uz/4FU9GTo34NVjMPhZ9ypkQKlyGJspUKa8MNahnf0s4DA5+
	BwHgytHMboYaD5Ofkl64Y2+xZTzPf+0dCooiOFtYXOolFMWmv7GSbXUA1FPCcXR/FU36tdQoSTAmR
	48k+a5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAIN-000000057qE-3Xqh;
	Tue, 07 Jan 2025 14:10:59 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAA4-000000055hy-4ANJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:02:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 507E1w6I016352;
	Tue, 7 Jan 2025 08:01:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736258518;
	bh=2rOUVlJtZ8uljbYcwOtBufLmiKSlIWfZvWmApMuUFrM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=T3CXUnR0gYOTdLBETqJF9pSz61jcO3F0K7B9XT+gbyJ7bGVi+MWA7BpgBYJmwC6a6
	 oQcUUqnsgsXSu5B776R8QcSrmccqgG9bALfzl4I6C5nacV0V9BZbxFsB9gSN4Yl7bj
	 xcZkc3+jrUzezQHy39T5+6xSQuozYDUtIU4ZLXl0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 507E1wqk054341
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jan 2025 08:01:58 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Jan 2025 08:01:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Jan 2025 08:01:57 -0600
Received: from [10.249.129.69] ([10.249.129.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 507E1oVJ078399;
	Tue, 7 Jan 2025 08:01:51 -0600
Message-ID: <5cc13a7f-b3f9-42d5-b9e2-7da5cb54af5b@ti.com>
Date: Tue, 7 Jan 2025 19:31:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/3] net: ti: icssg-prueth: Add Support for
 Multicast filtering with VLAN in HSR mode
To: Roger Quadros <rogerq@kernel.org>, MD Danish Anwar <danishanwar@ti.com>,
        Jeongjun Park <aha310510@gmail.com>,
        Alexander Lobakin
	<aleksander.lobakin@intel.com>,
        Lukasz Majewski <lukma@denx.de>, Meghana
 Malladi <m-malladi@ti.com>,
        Diogo Ivo <diogo.ivo@siemens.com>, Simon Horman
	<horms@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
        Larysa Zaremba <larysa.zaremba@intel.com>
References: <20250103092033.1533374-1-danishanwar@ti.com>
 <20250103092033.1533374-4-danishanwar@ti.com>
 <31bb8a3e-5a1c-4c94-8c33-c0dfd6d643fb@kernel.org>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <31bb8a3e-5a1c-4c94-8c33-c0dfd6d643fb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060225_122256_BEA2FBE6 
X-CRM114-Status: GOOD (  19.81  )
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



On 1/7/2025 6:53 PM, Roger Quadros wrote:
> 
> 
> On 03/01/2025 11:20, MD Danish Anwar wrote:
>> Add multicast filtering support for VLAN interfaces in HSR offload mode
>> for ICSSG driver.
>>
>> The driver calls vlan_for_each() API on the hsr device's ndev to get the
>> list of available vlans for the hsr device. The driver then sync mc addr of
>> vlan interface with a locally mainatined list emac->vlan_mcast_list[vid]
>> using __hw_addr_sync_multiple() API.
>>
>> The driver then calls the sync / unsync callbacks.
>>
>> In the sync / unsync call back, driver checks if the vdev's real dev is
>> hsr device or not. If the real dev is hsr device, driver gets the per
>> port device using hsr_get_port_ndev() and then driver passes appropriate
>> vid to FDB helper functions.
>>
>> This commit makes below changes in the hsr files.
>> - Move enum hsr_port_type from net/hsr/hsr_main.h to include/linux/if_hsr.h
>>   so that the enum can be accessed by drivers using hsr.
>> - Create hsr_get_port_ndev() API that can be used to get the ndev
>>   pointer to the slave port from ndev pointer to the hsr net device.
>> - Export hsr_get_port_ndev() API so that the API can be accessed by
>>   drivers using hsr.
>>
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 83 +++++++++++++++-----
>>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  2 +
>>  include/linux/if_hsr.h                       | 18 +++++
>>  net/hsr/hsr_device.c                         | 13 +++
>>  net/hsr/hsr_main.h                           |  9 ---
> 
> Should we be splitting hsr core changes into separate patch first,
> then followed by a patch with icssg driver changes?
> 

I wanted to make sure that the changes to hsr core are done with the
driver change so that any one looking at the commit can understand why
these changes are done.

If we split the changes and someone looks at the commit modifying hsr
core, they will not be able to understand why this is done. We will be
creating and exporting API hsr_get_port_ndev() but there will be no
caller for this.

>>  5 files changed, 97 insertions(+), 28 deletions(-)
> 

-- 
Thanks and Regards,
Md Danish Anwar


