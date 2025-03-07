Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA2BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o06VURZdv6TpTGBcJJyPYbkacPk57jeEgcFoNnbN4aE=; b=n21qCQAP87dhL5QF0hFQewA7u8
	X5TcOde6Gm/Fi3ESMOScUijDBOIB6lMaK5yE8J1h+WnkUnSL4cDzbXsyR2mC8RFukF1XTF7BOOePH
	3PCwsp8HDPn4RO/7/do0fjhsA8E5gk4hWPF7qTx6ZWQfJNU9rHxtkkU4dRPx4YQeCcxC2OOOhEd3M
	CHOvBj+3qDYv+AqbxTp7OLlDhafIgPhy3Lyo2Yx/wGgOEFY47M5zAnLWJGBJl+tlMcIOEpyG+/FMj
	tVjM1mxl/iHcQfk58pK2TtkwXBZoJGxXk9+ZdgRyUKPDO6bxHRh4c1gb3HmLaOzfjJQG/XB4UfYYs
	L96dm7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV6v-0000000DuM7-0Lkz;
	Fri, 07 Mar 2025 10:39:21 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUym-0000000DslL-206W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:30:57 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527AUlJJ243303
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 04:30:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741343447;
	bh=o06VURZdv6TpTGBcJJyPYbkacPk57jeEgcFoNnbN4aE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KGumB7H4cAQuFzdLuZycJZSpzg4QLD+dAHTuVBw8wXFNQprMsQ6eDC1tUtMpvhhb3
	 4yo1Mfqb25UBTSJsBbPGMMIxW/zK5kLtIyv1S6n6mSYX9agzI58VKgMGEsvlls8dRy
	 s9UzPLM1SjLU/JUpCgSeR5VofbJ+/CiONUvr/mTc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 527AUlqh015612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Mar 2025 04:30:47 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 04:30:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 04:30:46 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527AUf4v015736;
	Fri, 7 Mar 2025 04:30:42 -0600
Message-ID: <3931a391-3967-4260-a104-4eb313810c0d@ti.com>
Date: Fri, 7 Mar 2025 16:00:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Add ICSSG FW Stats
To: Jakub Kicinski <kuba@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Meghana Malladi <m-malladi@ti.com>,
        Diogo Ivo <diogo.ivo@siemens.com>, Lee Trager <lee@trager.us>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Roger Quadros <rogerq@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Simon Horman <horms@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>
References: <20250305111608.520042-1-danishanwar@ti.com>
 <20250306165513.541ff46e@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250306165513.541ff46e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_023056_694450_C075933D 
X-CRM114-Status: GOOD (  25.42  )
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

Hi Jakub

On 07/03/25 6:25 am, Jakub Kicinski wrote:
> On Wed, 5 Mar 2025 16:46:08 +0530 MD Danish Anwar wrote:
>> + - ``FW_RTU_PKT_DROP``: Diagnostic error counter which increments when RTU drops a locally injected packet due to port being disabled or rule violation.
>> + - ``FW_Q0_OVERFLOW``: TX overflow counter for queue0
>> + - ``FW_Q1_OVERFLOW``: TX overflow counter for queue1
>> + - ``FW_Q2_OVERFLOW``: TX overflow counter for queue2
>> + - ``FW_Q3_OVERFLOW``: TX overflow counter for queue3
>> + - ``FW_Q4_OVERFLOW``: TX overflow counter for queue4
>> + - ``FW_Q5_OVERFLOW``: TX overflow counter for queue5
>> + - ``FW_Q6_OVERFLOW``: TX overflow counter for queue6
>> + - ``FW_Q7_OVERFLOW``: TX overflow counter for queue7
> ...
> 
> Thanks for the docs, it looks good. Now, do all of these get included
> in the standard stats returned by icssg_ndo_get_stats64 ?
> That's the primary source of information for the user regarding packet
> loss.

No, these are not reported via icssg_ndo_get_stats64.

.ndo_get_stats64 populates stats that are part of `struct
rtnl_link_stats64`. icssg_ndo_get_stats64 populates those stats wherever
applicable. These firmware stats are not same as the ones defined in
`icssg_ndo_get_stats64` hence they are not populated. They are not
standard stats, they will be dumped by `ethtool -S`. Wherever there is a
standard stats, I will make sure it gets dumped from the standard
interface instead of `ethtool -S`

Only below stats are included in the standard stats returned by
icssg_ndo_get_stats64
- rx_packets
- rx_bytes
- tx_packets
- tx_bytes
- rx_crc_errors
- rx_over_errors
- rx_multicast_frames

> 
>>  	if (prueth->pa_stats) {
>>  		for (i = 0; i < ARRAY_SIZE(icssg_all_pa_stats); i++) {
>> -			reg = ICSSG_FW_STATS_BASE +
>> -			      icssg_all_pa_stats[i].offset *
>> -			      PRUETH_NUM_MACS + slice * sizeof(u32);
>> +			reg = icssg_all_pa_stats[i].offset +
>> +			      slice * sizeof(u32);
>>  			regmap_read(prueth->pa_stats, reg, &val);
>>  			emac->pa_stats[i] += val;
> 
> This gets called by icssg_ndo_get_stats64() which is under RCU 

Yes, this does get called by icssg_ndo_get_stats64(). Apart from that
there is a workqueue (`icssg_stats_work_handler`) that calls this API
periodically and updates the emac->stats and emac->pa_stats arrays.

> protection and nothing else. I don't see any locking here, and

There is no locking here. I don't think this is related to the patch.
The API emac_update_hardware_stats() updates all the stats supported by
ICSSG not just standard stats.

> I hope the regmap doesn't sleep. cat /proc/net/dev to test.
> You probably need to send some fixes to net.

I checked cat /proc/net/dev and the stats shown there are not related to
the stats I am introducing in this series.

The fix could be to add a lock in this function, but we have close to 90
stats and this function is called not only from icssg_ndo_get_stats64()
but from emac_get_ethtool_stats(). The function also gets called
periodically (Every 25 Seconds for 1G Link). I think every time locking
90 regmap_reads() could result in performance degradation.

I only see couple of drivers acquiring spin lock before reading the
stats for .ndo_get_stats64. Most of the drivers are not using any lock.

I did some testing and did not see any discrepancy in the stats `cat
/proc/net/dev` without the lock.

Furthermore, the fix is independent of this patch. I can send out a
separate fix to net to add cpu locks to this function. But I don't think
there is any change needed in this patch.

Let me know what should be done here.

-- 
Thanks and Regards,
Danish

