Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA1EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2OXkEES7Yr0y5dN7s4KOrfkCNcFyfcQ2GugE0dZYS4=; b=EvAs+wdBZi1QwhnnPWE6Fnen+7
	s+rrPTQkVTBneXVu0XZovaL1vWCjg2V+2QjUefA+Q21gLcqp+6wZ9zOItyoPZ72NZ4yDMiMTpBTKS
	LKzTJzNFoRos9ZCovmOZspbxzsn1biLkgJ2TGh4tFKcjpfhzlxFAWsYCXcqkgigCEWUHgE/3/8cbV
	yVNHKrC0JOrqIFtTPvH1vpuDDK7mmkl29quQjIpZxyJV1QY5s6NjxBPYAHia+zoTbtBo13naKLhd3
	WN0JP7I+ibwotWFKGuGvxjQgdisr5L4HfVJutYhBWRdWqTVMmq/y0wFs+TnLXiDHLFvT8ucmg+59V
	0UHGhC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNUJ-00000003bFH-2m3a;
	Tue, 04 Mar 2025 08:18:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNSk-00000003ay7-28dO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 08:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Q2OXkEES7Yr0y5dN7s4KOrfkCNcFyfcQ2GugE0dZYS4=; b=oXfmN5J4PIoQwcwAmtqUZdmIUj
	mkldESDLWm7y3D6HRTzmvJFQHszn5ua12OBKEyxoX+148s8E0fkbJ76fx5nSyJBixQryOa7uoD/qg
	Yq/swhuaNuGkftdDM0Itl81QJuFLnLZWJViQSYg6BrB4I7F0bIfBS5xK7IhUMC/ktv347AR2c7Df1
	Cv4prursX1FweCHOhDkMoFBAfod2HvR2iTxQ/ngyTdPRQM3W4ntEvFHhzdvzBKpYgTMEsU75xWqLn
	TtNFlClbgSGMrpAvr1d3iY3POx3WnNjsWxsA8j4zK8VO7uJ5cR5Zzt0yICze3jCyKGWzTwl+XP1K2
	YhleaQdw==;
Received: from [198.47.19.245] (helo=fllvem-ot03.ext.ti.com)
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNSh-00000000QHl-0vph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:17:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5248GiLo2912962
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Mar 2025 02:16:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741076204;
	bh=Q2OXkEES7Yr0y5dN7s4KOrfkCNcFyfcQ2GugE0dZYS4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KOne0f1lM6G34zbctiUwbEARuKJv0K+91fthqeO66/t12qkvb6OXnnFyRptDnY3zl
	 cUOfMsL5NjMAQTmx27bp4+xXawY4OK8LZEa5imYwoFvfkI4+nGFvxvFTWbmiS6KROw
	 REQtOotz48bSTEBACyV23bn8cqtB3gf51+lU/8pg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5248GiUE096921;
	Tue, 4 Mar 2025 02:16:44 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 02:16:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 02:16:43 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5248GdYe043311;
	Tue, 4 Mar 2025 02:16:40 -0600
Message-ID: <33c38844-4fbe-469c-bb5f-06bdb7721114@ti.com>
Date: Tue, 4 Mar 2025 13:46:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Add ICSSG FW Stats
To: Jakub Kicinski <kuba@kernel.org>
CC: Meghana Malladi <m-malladi@ti.com>, Diogo Ivo <diogo.ivo@siemens.com>,
        Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
        "David
 S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>
References: <20250227093712.2130561-1-danishanwar@ti.com>
 <20250303172543.249a4fc2@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250303172543.249a4fc2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_081711_652346_2114FD13 
X-CRM114-Status: GOOD (  17.63  )
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



On 04/03/25 6:55 am, Jakub Kicinski wrote:
> On Thu, 27 Feb 2025 15:07:12 +0530 MD Danish Anwar wrote:
>> +	ICSSG_PA_STATS(FW_PREEMPT_BAD_FRAG),
>> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_ERR),
>> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_TX),
>> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_OK),
>> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_RX),
> 
> I presume frame preemption is implemented in silicon? If yes -
> what makes these "FW statistics"? Does the FW collect them from 

The statistics are maintained / updated by firmware and thus the name.

Preemption is implemented partially in both the hardware and firmware.
The STATE MACHINE for preemption is in the firmware. The decision to
when to PREEMEPT / ASSEMBLE a packet is made in firmware.

These preemption statistics are updated by the firmware based on the
action performed by the firmware. Driver can read these to know the
statistics of preemption. These stats will be able used by
ethtool_mm_stats once the support for Preemption is added in the driver.

> the device or the frames are for FW? 
> 
>> +	ICSSG_PA_STATS(FW_RX_EOF_SHORT_FRMERR),
>> +	ICSSG_PA_STATS(FW_RX_B0_DROP_EARLY_EOF),
>> +	ICSSG_PA_STATS(FW_TX_JUMBO_FRM_CUTOFF),
>> +	ICSSG_PA_STATS(FW_RX_EXP_FRAG_Q_DROP),
>> +	ICSSG_PA_STATS(FW_RX_FIFO_OVERRUN),
>> +	ICSSG_PA_STATS(FW_CUT_THR_PKT),
>> +	ICSSG_PA_STATS(FW_HOST_RX_PKT_CNT),
>> +	ICSSG_PA_STATS(FW_HOST_TX_PKT_CNT),
>> +	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_PRE_OVERFLOW),
>> +	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_EXP_OVERFLOW),
>>  };
>>  
>>  #endif /* __NET_TI_ICSSG_STATS_H */
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_switch_map.h b/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
>> index 424a7e945ea8..d30203a0978c 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_switch_map.h
>> @@ -231,4 +231,109 @@
>>  /* Start of 32 bits PA_STAT counters */
>>  #define PA_STAT_32b_START_OFFSET                           0x0080
>>  
>> +/* Diagnostic error counter which increments when RTU drops a locally injected
>> + * packet due to port disabled or rule violation.
>> + */
>> +#define FW_RTU_PKT_DROP		0x0088
>> +
>> +/* Tx Queue Overflow Counters */
>> +#define FW_Q0_OVERFLOW		0x0090
>> +#define FW_Q1_OVERFLOW		0x0098
>> +#define FW_Q2_OVERFLOW		0x00A0
>> +#define FW_Q3_OVERFLOW		0x00A8
>> +#define FW_Q4_OVERFLOW		0x00B0
>> +#define FW_Q5_OVERFLOW		0x00B8
>> +#define FW_Q6_OVERFLOW		0x00C0
>> +#define FW_Q7_OVERFLOW		0x00C8
>> +
>> +/* Incremented if a packet is dropped at PRU because of a rule violation */
>> +#define FW_DROPPED_PKT		0x00F8
> 
> Instead of adding comments here please add a file under
> Documentation/networking/device_drivers/ with the explanations.
> That's far more likely to be discovered by users, no?

Sure I will drop these MACRO comments and create a .rst file in
Documentation/networking/device_drivers/

One question though, should I create a table for the stats and it's
description or should I create a section for each stats?

Something like this,

FW_RTU_PKT_DROP
---------------
Diagnostic error counter which increments when RTU drops a locally
injected packet due to port being disabled or rule violation.

Please let me know what do you think.

-- 
Thanks and Regards,
Danish

