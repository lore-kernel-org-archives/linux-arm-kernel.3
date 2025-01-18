Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A68C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FOLWoiBdOZIbz+rGO7a7GwSxpk27LE1qCoksXK33CE=; b=PIpwCm/bh0rXx/tEI46kGZmWr4
	mYpADgxHNWjYMXYMweeElJFtiP9duUsc/oVxc3IZWCX14TusbVPP7UGW5d/K2iGFjCLL8lL4MXRSS
	wxg5L2L8j7Z4fCTJZQdTqOzRJz6QiXdmWC/kfH3cwO7TPQK+jhrlE2W5IW7ZRPXSB8b9RrOssiRpR
	HSfmYIJpCxFbytOa+dGZkHW/fMdFSbe0wLk/EPXLiiUCBKfE3nmBHcC2VsoX5Qo88Yt1lnF0EG2Xf
	gkQuYSFcr5LQl4IsJH0/PffkORBYFDtYqagidP62m0VCYpOeGIBCRzvCHD0t1jH1R1rVhWgEWlFIK
	yRmjKYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ3pl-00000001zbd-0Ihn;
	Sat, 18 Jan 2025 08:05:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ3oU-00000001zSx-1W4L;
	Sat, 18 Jan 2025 08:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6CCBA4043E;
	Sat, 18 Jan 2025 08:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B24DC4CED1;
	Sat, 18 Jan 2025 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737187452;
	bh=X8xl+FikvEsefyJsKMCnT/zbfddcbexbuTDnIId5TZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jwwr4yFvVLsCkvAYidGgHqdk1SqnXor04i9X94Db2qJ0QhORGpQHZOZkOPmZ0GQtJ
	 97no8YhrF+z3OTjQ1lxCNFIVYAjcGr8mU7o6rOF0vKBZ4er/XmYA+kcxB1nNqYB5xi
	 I4C2VEEVFterxQ3SKCBXurdH9MFkI3wJEd4w52mAp4+2zxpjHpAqcxGouwiJC8tXqr
	 cAmuba8ya9Vapi35c8+kl1peNietydCSD5VpLFVteL1O30Vd+ZhbSsCzExQc5RQRQH
	 zyCh1DkSlCRZ1x9ehDtdukIbZ4w4vxBXMukSP8LJ8AQkZHSGVcSYl5qh1n/eyyJkBJ
	 PJtjuFWuoRbIw==
Message-ID: <e0096465-a941-4a1e-9cad-8f5906a31554@kernel.org>
Date: Sat, 18 Jan 2025 09:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 0/8] fix two bugs related to page_pool
To: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com
Cc: zhangkun09@huawei.com, liuyonglong@huawei.com, fanghaiqing@huawei.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, IOMMU <iommu@lists.linux.dev>,
 MM <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250110130703.3814407-1-linyunsheng@huawei.com>
 <3c8e4f86-87e2-470d-84d8-86c70b3e2fcc@kernel.org>
 <c02e856e-6ec5-49d0-8527-2647695a0174@huawei.com>
 <3a853e1b-b5bf-4709-b8f6-e466e3e7375e@kernel.org>
 <1bef4a35-efaa-4083-8ed5-8818fe285db5@huawei.com>
 <f558df7a-d983-4fc5-8358-faf251994d23@kernel.org>
 <304b542d-514d-4269-ae11-b2e214659483@huawei.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <304b542d-514d-4269-ae11-b2e214659483@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_000414_535571_00831C6C 
X-CRM114-Status: GOOD (  10.39  )
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



On 17/01/2025 12.35, Yunsheng Lin wrote:
> On 2025/1/17 2:02, Jesper Dangaard Brouer wrote:
> 
>>
>> Benchmark (bench_page_pool_simple) results from before and after
>> patchset with patches 1-5m and rcu lock removal as requested.
>>
>> | Test name  |Cycles |   1-5 |    | Nanosec |    1-5 |        |      % |
>> | (tasklet_*)|Before | After |diff|  Before |  After |   diff | change |
>> |------------+-------+-------+----+---------+--------+--------+--------|
>> | fast_path  |    19 |    19 |   0|   5.399 |  5.492 |  0.093 |    1.7 |
>> | ptr_ring   |    54 |    57 |   3|  15.090 | 15.849 |  0.759 |    5.0 |
>> | slow       |   238 |   284 |  46|  66.134 | 78.909 | 12.775 |   19.3 |
>> #+TBLFM: $4=$3-$2::$7=$6-$5::$8=(($7/$5)*100);%.1f
>>
>> This test with patches 1-5 looks much better regarding performance.
> 
> Thanks for the testing.
> 
> Is there any notiable performance variation during different test running
> for the same built kernel in your machine?
> 

My machine have quite stable performance for this benchmark.


>> https://github.com/xdp-project/xdp-project/blob/main/areas/mem/page_pool07_bench_DMA_fix.org#e5-1650-pp01-dma-fix-v7-p1-5

Like documented in above link. I have also increased the loops count for
the test to get it more stable, given this will be measured over a
longer period.

  modprobe bench_page_pool_simple loops=100000000


>> Kernel:
>>   - 6.13.0-rc6-pp01-DMA-fix-v7-p1-5+ #5 SMP PREEMPT_DYNAMIC Thu Jan 16 18:06:53 CET 2025 x86_64 GNU/Linux
>>
>> Machine: Intel(R) Xeon(R) CPU E5-1650 v4 @ 3.60GHz
>>
>> modprobe bench_page_pool_simple loops=100000000
>>
>> Raw data:
>> [  187.309423] bench_page_pool_simple: time_bench_page_pool01_fast_path(): Cannot use page_pool fast-path
>> [  187.872849] time_bench: Type:no-softirq-page_pool01 Per elem: 19 cycles(tsc) 5.539 ns (step:0) - (measurement period time:0.553906443 sec time_interval:553906443) - (invoke count:100000000 tsc_interval:1994123064)
>> [  187.892023] bench_page_pool_simple: time_bench_page_pool02_ptr_ring(): Cannot use page_pool fast-path
>> [  189.611070] time_bench: Type:no-softirq-page_pool02 Per elem: 61 cycles(tsc) 17.095 ns (step:0) - (measurement period time:1.709580367 sec time_interval:1709580367) - (invoke count:100000000 tsc_interval:6154679394)
>> [  189.630414] bench_page_pool_simple: time_bench_page_pool03_slow(): Cannot use page_pool fast-path
>> [  197.222387] time_bench: Type:no-softirq-page_pool03 Per elem: 272 cycles(tsc) 75.826 ns (step:0) - (measurement period time:7.582681388 sec time_interval:7582681388) - (invoke count:100000000 tsc_interval:27298499214)
>> [  197.241926] bench_page_pool_simple: pp_tasklet_handler(): in_serving_softirq fast-path
>> [  197.249968] bench_page_pool_simple: time_bench_page_pool01_fast_path(): in_serving_softirq fast-path
>> [  197.808470] time_bench: Type:tasklet_page_pool01_fast_path Per elem: 19 cycles(tsc) 5.492 ns (step:0) - (measurement period time:0.549225541 sec time_interval:549225541) - (invoke count:100000000 tsc_interval:1977272238)
>> [  197.828174] bench_page_pool_simple: time_bench_page_pool02_ptr_ring(): in_serving_softirq fast-path
>> [  199.422305] time_bench: Type:tasklet_page_pool02_ptr_ring Per elem: 57 cycles(tsc) 15.849 ns (step:0) - (measurement period time:1.584920736 sec time_interval:1584920736) - (invoke count:100000000 tsc_interval:5705890830)
>> [  199.442087] bench_page_pool_simple: time_bench_page_pool03_slow(): in_serving_softirq fast-path
>> [  207.342120] time_bench: Type:tasklet_page_pool03_slow Per elem: 284 cycles(tsc) 78.909 ns (step:0) - (measurement period time:7.890955151 sec time_interval:7890955151) - (invoke count:100000000 tsc_interval:28408319289)
>>

