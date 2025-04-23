Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1033C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7GhWK6kKuqT1AfaJL9LLciofIseDj2asA74IRsngcA=; b=ulWhcXvP2ZfvmiaFmTZbZu+X91
	wCKVfSMCa6ljIQYrMV0DCxxcwP7TtkbZp+dZGeHAx5Xhvycs6DOGiO5NC5Rk21LmDTeyZo4prHdbj
	/ypSWIyK0NKlpgaPPfHEcbmpQ9/3m3qB/EFWGi0qVpDxEqInioR7x4PafxArTl01cu/hrlJUG2s3N
	Wp3RkYvhVgePCPbNDKXfDmcGWug7DpIvHTLg0KH8iqj/AFgT5kH+/nvLi9Wu3+X5AvOhb7qJwp04A
	eS/C0csU4XGoADg1Y5Av7+8h4Z+dwi3w/PQPm/6zEVPDnnuirMCsnJvmBHdggFHqFrASb4wXqKfu2
	NEN3Y/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vqa-00000009pXs-1o1R;
	Wed, 23 Apr 2025 08:52:48 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Uzb-00000009bMj-3laJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:58:05 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZjBLj3YJ7z27hTJ;
	Wed, 23 Apr 2025 15:58:37 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 47CEB1800B2;
	Wed, 23 Apr 2025 15:57:54 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 23 Apr 2025 15:57:53 +0800
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
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <0098923f-0982-8d08-3c4f-810170ca0b87@huawei.com>
Date: Wed, 23 Apr 2025 15:57:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250422132006.GG28953@e132581.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_005804_269776_128B0435 
X-CRM114-Status: GOOD (  22.15  )
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

On 2025/4/22 21:20, Leo Yan wrote:
> On Tue, Apr 22, 2025 at 08:31:43PM +0800, Yicong Yang wrote:
> 
> [...]
> 
>>>>> +	case ARM_SPE_HISI_HIP_PEER_CLUSTER:
>>>>> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
>>>>> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
>>>
>>> Seems to me, a CPU has L3 cache, would the cluster has a higher level's
>>> cache?
>>
>> In my case, the cluster CPUs share the L3 cache and there's several clusters.
>> L3's the highest level cache in the system.
> 
> If so, you might need to revise the cache levels for:
> 
>   ARM_SPE_HISI_HIP_PEER_CPU
>   ARM_SPE_HISI_HIP_PEER_CPU_HITM
> 
> IIUC, cluster CPUs share L3 cache, and every CPU in a cluster has
> L1/L2 cache, for PEER_CPU cases, the memory level should be L2.
> 

confirmed with our hardware people, should be L2 for these two data sources.
I misunderstood here, thanks for pointing it out.

> [...]
> 
>>>>> +	case ARM_SPE_HISI_HIP_REMOTE_SOCKET:
>>>>> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
>>>>> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
>>>>> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
>>>>> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
>>>>
>>>> Hi Yicong,
>>>>
>>>> Is the mem_snoop setting missing from this one?
>>>
>>> The field 'mem_snoopx' is an extension to the field 'mem_snoop'.
>>>
>>> If the field 'mem_snoopx' is set, it is no need to set 'mem_snoop'.
>>>
>>
>> they should not be mutal exclusive. mem_snoopx provides the information where
>> the cacheline comes from while mem_snoop provides the status of the cacheline.
>> if hardware supports we can gather both information from the data source, like
>> above for ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM.
> 
> My understanding is the PERF_MEM_SNOOPX_PEER flag was extended for
> support Arm SPE.  Other snoop flags were original from x86 arch.
> 
> I agreed that in some cases above, both the flags PERF_MEM_SNOOPX_PEER
> and PERF_MEM_SNOOP_HITM can be set together, you can parse cache sharing
> with different --display options:
> 
>   perf c2c report --display tot    => based on HITM flags
>   perf c2c report --display peer   => based on SNOOPX_PEER flag
> 

that's exactly what we want to support :)

>> for other cases if there's mem_snoopx information I think mem_snoop can be dropped,
>> this won't make differeces. Checked c2c_decode_stats(), only PERF_MEM_SNOOP_HIT and
>> PERF_MEM_SNOOP_HITM is useful when summarizing c2c statistics.
> 
> It is about how to present accurate results.
> 
> E.g., for REMOTE_SOCKET type, it is hard to say the data from remote
> DRAM or any level's cache.  Since more hardware details are absent, this
> is why I suggested not to set 'mem_snoop' for REMOTE_SOCKET.
> 

this makes sense. will drop mem_snoop if no indications from the data source.

Thanks.


