Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4599FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOQ/IaLXsfx6Sht3r5U6/qJt9L156EPgNgGctmn4sIo=; b=vMZGUIcABrvMvQI7m3J885c+Z6
	KAeoTh6rej7fX67+3IRBh6nQG8LfSbCn38VRVlqqb4A2aAvas9XvtwR1+ZxpEUOFcRzztlAO3iIeQ
	cO4DHjINtdqVE3NqnREIwoj02u6MLrLaTh2RYMHmymYRNboXqlbYXsj27eeLlo91tF1mK1k6gaQ7L
	he4p69TnFxfBnK6arpx8PCiSeFecl3IZNaM0wX9p3ewkvswAhGpq/s2Z031NYrKMsGaYlU80wLGBR
	8IYTq65jF0FcWe2voVd/nOifm2sKYHzRTvMzxncqDShMm3HI1h2HVSdJ1IhGnWy5Pf8woiNoFOyxp
	I7shwKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3D-0000000EZyx-3x61;
	Thu, 24 Apr 2025 16:03:47 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vDB-0000000DwEV-116d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:57:51 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZjvX26P6fz8x9g;
	Thu, 24 Apr 2025 19:54:10 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id F3DB41402C3;
	Thu, 24 Apr 2025 19:57:40 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 24 Apr 2025 19:57:39 +0800
CC: <yangyicong@hisilicon.com>, James Clark <james.clark@linaro.org>,
	<jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <caijingtao@huawei.com>, <xueshan2@huawei.com>,
	<prime.zeng@hisilicon.com>, <acme@kernel.org>, <namhyung@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <peterz@infradead.org>,
	<mingo@redhat.com>, <mark.rutland@arm.com>, <jolsa@kernel.org>,
	<john.g.garry@oracle.com>, <leo.yan@linux.dev>, <irogers@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 HiSilicon HIP12
To: Leo Yan <leo.yan@arm.com>
References: <20250408122809.37884-1-yangyicong@huawei.com>
 <89741897-6c8f-4b75-8ec3-675111ea60a1@linaro.org>
 <20250422102952.GD28953@e132581.arm.com>
 <ccb8ce65-8241-0670-25c8-f8245fbc5e22@huawei.com>
 <20250422132006.GG28953@e132581.arm.com>
 <0098923f-0982-8d08-3c4f-810170ca0b87@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <2fa27176-f820-a03f-033e-7da811643cff@huawei.com>
Date: Thu, 24 Apr 2025 19:57:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0098923f-0982-8d08-3c4f-810170ca0b87@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_045749_632327_3AE0F4C6 
X-CRM114-Status: GOOD (  23.59  )
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

Hi Leo,

On 2025/4/23 15:57, Yicong Yang wrote:
> On 2025/4/22 21:20, Leo Yan wrote:
>> On Tue, Apr 22, 2025 at 08:31:43PM +0800, Yicong Yang wrote:
>>
>> [...]
>>
>>>>>> +	case ARM_SPE_HISI_HIP_PEER_CLUSTER:
>>>>>> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
>>>>>> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
>>>>
>>>> Seems to me, a CPU has L3 cache, would the cluster has a higher level's
>>>> cache?
>>>
>>> In my case, the cluster CPUs share the L3 cache and there's several clusters.
>>> L3's the highest level cache in the system.
>>
>> If so, you might need to revise the cache levels for:
>>
>>   ARM_SPE_HISI_HIP_PEER_CPU
>>   ARM_SPE_HISI_HIP_PEER_CPU_HITM
>>
>> IIUC, cluster CPUs share L3 cache, and every CPU in a cluster has
>> L1/L2 cache, for PEER_CPU cases, the memory level should be L2.
>>
> 
> confirmed with our hardware people, should be L2 for these two data sources.
> I misunderstood here, thanks for pointing it out.
> 

I recalled why the handling is like this. considering 2 threads have potential false
sharing issues which are running on core0 thread0 and core 1 thread 0 in the same
cluster, we'll have some ARM_SPE_HISI_HIP_PEER_CPU_HITM samples to indicate the
cacheline contention. If the cache level is L2 then we cannot observe this by
`perf c2c report -d tot`, since L2 is not counted for HITM.

does it make sense to have below change to account L2 hitm for lcl_hitm? just like
we account L2 peer snoop for lcl_peer.

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 884d9aebce91..a384a866a562 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -680,7 +680,10 @@ do {                               \
                        if (lvl & P(LVL, LFB)) stats->ld_fbhit++;
                        if (lvl & P(LVL, L1 )) stats->ld_l1hit++;
                        if (lvl & P(LVL, L2)) {
-                               stats->ld_l2hit++;
+                               if (snoop & P(SNOOP, HITM))
+                                       HITM_INC(lcl_hitm);
+                               else
+                                       stats->ld_l2hit++;

                                if (snoopx & P(SNOOPX, PEER))
                                        PEER_INC(lcl_peer);


>> [...]
>>
>>>>>> +	case ARM_SPE_HISI_HIP_REMOTE_SOCKET:
>>>>>> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
>>>>>> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
>>>>>> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
>>>>>> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
>>>>>
>>>>> Hi Yicong,
>>>>>
>>>>> Is the mem_snoop setting missing from this one?
>>>>
>>>> The field 'mem_snoopx' is an extension to the field 'mem_snoop'.
>>>>
>>>> If the field 'mem_snoopx' is set, it is no need to set 'mem_snoop'.
>>>>
>>>
>>> they should not be mutal exclusive. mem_snoopx provides the information where
>>> the cacheline comes from while mem_snoop provides the status of the cacheline.
>>> if hardware supports we can gather both information from the data source, like
>>> above for ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM.
>>
>> My understanding is the PERF_MEM_SNOOPX_PEER flag was extended for
>> support Arm SPE.  Other snoop flags were original from x86 arch.
>>
>> I agreed that in some cases above, both the flags PERF_MEM_SNOOPX_PEER
>> and PERF_MEM_SNOOP_HITM can be set together, you can parse cache sharing
>> with different --display options:
>>
>>   perf c2c report --display tot    => based on HITM flags
>>   perf c2c report --display peer   => based on SNOOPX_PEER flag
>>
> 
> that's exactly what we want to support :)
> 
>>> for other cases if there's mem_snoopx information I think mem_snoop can be dropped,
>>> this won't make differeces. Checked c2c_decode_stats(), only PERF_MEM_SNOOP_HIT and
>>> PERF_MEM_SNOOP_HITM is useful when summarizing c2c statistics.
>>
>> It is about how to present accurate results.
>>
>> E.g., for REMOTE_SOCKET type, it is hard to say the data from remote
>> DRAM or any level's cache.  Since more hardware details are absent, this
>> is why I suggested not to set 'mem_snoop' for REMOTE_SOCKET.
>>
> 
> this makes sense. will drop mem_snoop if no indications from the data source.
> 
> Thanks.
> 
> .
> 

