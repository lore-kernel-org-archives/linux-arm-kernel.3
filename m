Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4DDCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juZD7qPlFNPrZBo5nIhRej6WrFZIUY5prg9h7+Bs/nA=; b=Iuh0Ko9LOSMsFo1wD/83fk8781
	EEziX2NHI8OFGWm/2Tn/M6gwJTH1MGY80MQKmubFzvEVlAwmgF5+8ztG9jw82bYRrA766xEq6nQn7
	mqv5IPFzM5yM54Te0L8ThbVLJvAoFayA8oG1zSiQ5YLixdXj9Gh/+mRozxy15tHr8PPsq+8qcvuTx
	92hMfjc/eg2hlR5e9hOyHPVYtxrck7wxNtrEyGoXDYBwtbVlJRCmGjKgu9jcUqwx1hAplD+FpXjBv
	qQgwimZNBYdCLNspaVH9pvVqjK6uNaTNjmx/z95XB3Wn9liPKbAQJTZ3qEknRf3Bls07Z5xvQjQY0
	GX4EgX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bHo-0000000FkXz-217f;
	Tue, 14 Oct 2025 09:25:40 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bHl-0000000FkXE-3Gcl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:25:39 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59E9PTNW1114817;
	Tue, 14 Oct 2025 04:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760433929;
	bh=juZD7qPlFNPrZBo5nIhRej6WrFZIUY5prg9h7+Bs/nA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=azZNFzNkYdWFRBvfHbXBKWRfdXruCNPaS08gn7i/xOLsiGUeV9wAHVLW4J7/LKYfp
	 1Od47Qd1vJS9m2ONmm0iviys3MDm9qJd91bnjLkCl57MbyyjD+Khz7fWoXNtxWysdt
	 l9PhgTKqCVBcd87QH6d5MsQJkD5ClEKWS3KniTlE=
Received: from DLEE205.ent.ti.com (dlee205.ent.ti.com [157.170.170.85])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59E9PTBA3906283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 04:25:29 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 04:25:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 04:25:29 -0500
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59E9PPQB3335218;
	Tue, 14 Oct 2025 04:25:26 -0500
Message-ID: <c8821c7e-b551-4a1b-9bb1-33d0eb05eb4c@ti.com>
Date: Tue, 14 Oct 2025 14:55:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix fdb hash size
 configuration
To: Simon Horman <horms@kernel.org>
CC: <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20251013085925.1391999-1-m-malladi@ti.com>
 <aOzqMj1TbzJCZrRk@horms.kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <aOzqMj1TbzJCZrRk@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_022537_990926_FD02A3E3 
X-CRM114-Status: GOOD (  26.23  )
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

Hi Simon,

On 10/13/25 17:31, Simon Horman wrote:
> On Mon, Oct 13, 2025 at 02:29:25PM +0530, Meghana Malladi wrote:
>> The ICSSG driver does the initial FDB configuration which
>> includes setting the control registers. Other run time
>> management like learning is managed by the PRU's. The default
>> FDB hash size used by the firmware is 512 slots which is not
>> aligned with the driver's configuration. Update the driver
>> FDB config to fix it.
>>
>> Fixes: abd5576b9c57f ("net: ti: icssg-prueth: Add support for ICSSG switch firmware")
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>
>> Please refer trm [1] 6.4.14.12.17 section
>> on how the FDB config register gets configured.
>>
>> [1]: https://www.ti.com/lit/pdf/spruim2
> 
> Thanks for the link!
> And thanks to TI for publishing this document.
> 
>>
>>   drivers/net/ethernet/ti/icssg/icssg_config.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c
>> index da53eb04b0a4..3f8237c17d09 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_config.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
>> @@ -66,6 +66,9 @@
>>   #define FDB_GEN_CFG1		0x60
>>   #define SMEM_VLAN_OFFSET	8
>>   #define SMEM_VLAN_OFFSET_MASK	GENMASK(25, 8)
>> +#define FDB_HASH_SIZE_MASK	GENMASK(6, 3)
>> +#define FDB_HASH_SIZE_SHIFT	3
>> +#define FDB_HASH_SIZE		3
> 
> I am slightly confused about this.
> 
> The patch description says "The default FDB hash size used by the firmware
> is 512 slots which is not aligned with the driver's configuration."
> And above FDB_HASH_SIZE is 3, which is the value that the driver will
> now set hash size to.
> 
> But table 6-1404 (on page 4049) of [1] describes 3 as setting
> the FDB hash size to 512 slots. I would have expected a different
> value based on my understanding of the patch description.
> 

Yes you are right. But if you re-check the same table 6-1404, there is
a reset field for FDB_HAS_SIZE which is 4, meaning 1024 slots.
Currently the driver is not updating this reset value from 4(1024 slots) 
to 3(512 slots), which is why the driver is not aligned with the 
firmware. This patch fixes this by updating the reset value to 512 slots.

Let me know if the commit message is not clear enough to convey this 
correctly. I will update it accordingly.

>>   
>>   #define FDB_GEN_CFG2		0x64
>>   #define FDB_VLAN_EN		BIT(6)
>> @@ -463,6 +466,8 @@ void icssg_init_emac_mode(struct prueth *prueth)
>>   	/* Set VLAN TABLE address base */
>>   	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, SMEM_VLAN_OFFSET_MASK,
>>   			   addr <<  SMEM_VLAN_OFFSET);
>> +	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, FDB_HASH_SIZE_MASK,
>> +			   FDB_HASH_SIZE << FDB_HASH_SIZE_SHIFT);
>>   	/* Set enable VLAN aware mode, and FDBs for all PRUs */
>>   	regmap_write(prueth->miig_rt, FDB_GEN_CFG2, (FDB_PRU0_EN | FDB_PRU1_EN | FDB_HOST_EN));
>>   	prueth->vlan_tbl = (struct prueth_vlan_tbl __force *)(prueth->shram.va +
>> @@ -484,6 +489,8 @@ void icssg_init_fw_offload_mode(struct prueth *prueth)
>>   	/* Set VLAN TABLE address base */
>>   	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, SMEM_VLAN_OFFSET_MASK,
>>   			   addr <<  SMEM_VLAN_OFFSET);
>> +	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, FDB_HASH_SIZE_MASK,
>> +			   FDB_HASH_SIZE << FDB_HASH_SIZE_SHIFT);
>>   	/* Set enable VLAN aware mode, and FDBs for all PRUs */
>>   	regmap_write(prueth->miig_rt, FDB_GEN_CFG2, FDB_EN_ALL);
>>   	prueth->vlan_tbl = (struct prueth_vlan_tbl __force *)(prueth->shram.va +
>>
>> base-commit: 68a052239fc4b351e961f698b824f7654a346091
>> -- 
>> 2.43.0
>>


