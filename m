Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99F4C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCCjPypjfkl2FIovsFFHVjB/BzI3nlgvwJz5/NwbXsw=; b=rF64rB5zKxSmfm3PcY1NsTo7+W
	VMu0KrNQBZZW4X6GdaupoU3eJsGkqJzKdt3MIQGaiNjjkP4yqopmBlO0h4DOgettbdRG2aC5cB/K/
	NH1bY4OmU3nsub4AtYvR7rJVdYEFXv5KWCrmezACWX2fBiHb7CNQxrL54lRCOIHge4tboNcF0fVk4
	HUIyfAohH5mzQ5+QSh9h556U++4qM+0J9H5PVvbakdBtf0QrrONMb+9ZT6j7Jre3wp1cdX8mSkpjS
	YzqU7c/w54+fLkWpPddXx4PGS2IH32rw74Si8K55vAd6qYfLhVck5hX1+pNyno3perYM19FP+9nUQ
	vgcRySHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Pv-0000000Cdxt-35Tx;
	Wed, 15 Jan 2025 17:42:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7NS-0000000CdTY-3w8N;
	Wed, 15 Jan 2025 17:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B4575C5DA8;
	Wed, 15 Jan 2025 17:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48597C4CEE0;
	Wed, 15 Jan 2025 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736962825;
	bh=MnSQMXREVVBMVqqG4DNkPoiFHSbXoUAQ7+YSxlu2cok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=svJ45p4OZzWwWOCVuCmsBOLH/Sb0FwOy4O6Wp/nYfGoUPPMIu4eZ5AeCKRw09uHlp
	 EvOQeh7YceB+VBH+j4VkwK6PCfrLADM0+kATjPLjH7aCrzR0PAMZpFDYT80+5rN/KI
	 PnsupXJ14Gkmz1GrEPVem0zwAxnL1TuB7n4nFvfuDjEqXhzeC/ujVDdr2lQV1Y4Krq
	 c5zmA3nAPBk25FZ7Mu0Zv4qFKeQNdCCQrsNUzOhg17VhdcEwcC5/s9KNK8G1BbWH5e
	 QEVGA5UezKKiGKayItoNcXhtg6FCRgXsglzQd6JOrixy3ENiUZAh6D0jRRsWRcPnhA
	 wzQYoGNu+WDCA==
Message-ID: <3a853e1b-b5bf-4709-b8f6-e466e3e7375e@kernel.org>
Date: Wed, 15 Jan 2025 18:40:18 +0100
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
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <c02e856e-6ec5-49d0-8527-2647695a0174@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_094027_071712_DFB768D5 
X-CRM114-Status: GOOD (  19.86  )
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



On 15/01/2025 12.33, Yunsheng Lin wrote:
> On 2025/1/14 22:31, Jesper Dangaard Brouer wrote:
>>
>>
>> On 10/01/2025 14.06, Yunsheng Lin wrote:
>>> This patchset fix a possible time window problem for page_pool and
>>> the dma API misuse problem as mentioned in [1], and try to avoid the
>>> overhead of the fixing using some optimization.
>>>
>>>   From the below performance data, the overhead is not so obvious
>>> due to performance variations for time_bench_page_pool01_fast_path()
>>> and time_bench_page_pool02_ptr_ring, and there is about 20ns overhead
>>> for time_bench_page_pool03_slow() for fixing the bug.
>>>
>>
>> My benchmarking on x86_64 CPUs looks significantly different.
>>   - CPU: Intel(R) Xeon(R) CPU E5-1650 v4 @ 3.60GHz
>>
>> Benchmark (bench_page_pool_simple) results from before and after patchset:
>>
>> | Test name  | Cycles |       |    |Nanosec |        |       |      % |
>> | (tasklet_*)| Before | After |diff| Before |  After |  diff | change |
>> |------------+--------+-------+----+--------+--------+-------+--------|
>> | fast_path  |     19 |    24 |   5|  5.399 |  6.928 | 1.529 |   28.3 |
>> | ptr_ring   |     54 |    79 |  25| 15.090 | 21.976 | 6.886 |   45.6 |
>> | slow       |    238 |   299 |  61| 66.134 | 83.298 |17.164 |   26.0 |
>> #+TBLFM: $4=$3-$2::$7=$6-$5::$8=(($7/$5)*100);%.1f
>>
>> My above testing show a clear performance regressions across three
>> different page_pool operating modes.
> 
> I retested it on arm64 server patch by patch as the raw performance
> data in the attachment, it seems the result seemed similar as before.
> 
> Before this patchset:
>              fast_path              ptr_ring            slow
> 1.         31.171 ns               60.980 ns          164.917 ns
> 2.         28.824 ns               60.891 ns          170.241 ns
> 3.         14.236 ns               60.583 ns          164.355 ns
> 
> With patch 1-4:
> 4.         31.443 ns               53.242 ns          210.148 ns
> 5.         31.406 ns               53.270 ns          210.189 ns
> 
> With patch 1-5:
> 6.         26.163 ns               53.781 ns          189.450 ns
> 7.         26.189 ns               53.798 ns          189.466 ns
> 
> With patch 1-8:
> 8.         28.108 ns               68.199 ns          202.516 ns
> 9.         16.128 ns               55.904 ns          202.711 ns
> 
> I am not able to get hold of a x86 server yet, I might be able
> to get one during weekend.
> 
> Theoretically, patch 1-4 or 1-5 should not have much performance
> impact for fast_path and ptr_ring except for the rcu_lock mentioned
> in page_pool_napi_local(), so it would be good if patch 1-5 is also
> tested in your testlab with the rcu_lock removing in
> page_pool_napi_local().
> 

What are you saying?
  - (1) test patch 1-5
  - or (2) test patch 1-5 but revert patch 2 with page_pool_napi_local()

--Jesper

>>
>>
>> Data also available in:
>>   - https://github.com/xdp-project/xdp-project/blob/main/areas/mem/page_pool07_bench_DMA_fix.org
>>

