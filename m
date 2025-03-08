Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E227C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrHqPe4qI/nAbruW3F2vRPvWp4Qoww7mexetKwU+H74=; b=N+J3J8Gabery7OWdrAnjc6ulb/
	e7DHpm6+kC5EuVX7MFNF0FJBdXiGmqwMwSlKAlsIQy0bCk10ZM97QAZJRvkVyxwkzd/0ufClgET1F
	WD5rYWawdPWTheIRJNfxQprpYVm/gcuZsQZjBP5pMdP/cagewWDdxU73s5szdqUwXF/bM7xkNnCAV
	Ex/Z7w97Zwmig+nqRJ/heQWvZdNVp0qiZzxuoQ5x57QZf+ze5u8eR6NdA0+VCQToMNKKTDP90kXKo
	srApE5rzAzDX5DzBxrSdPwW+Vh8Ihpg2d8UDb9vuyQyGxaKK5Q1lJYSdmgD2bmJY/kSnS70vvS7Ts
	zvnOsveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtXz-0000000GcnH-3wFs;
	Sat, 08 Mar 2025 12:44:55 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtNM-0000000GbB6-3tEf;
	Sat, 08 Mar 2025 12:33:58 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-22334203781so72269775ad.0;
        Sat, 08 Mar 2025 04:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741437236; x=1742042036; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrHqPe4qI/nAbruW3F2vRPvWp4Qoww7mexetKwU+H74=;
        b=iLWHr8xzFUpDtyNQ/C5plHsex9LFt2BBTJvZtP1EcCrNnSctIZ8bUZr+B4b1DMtYsp
         oWyIoV1t7wMdAHjFA6Nb4LWfpnb1Z1LOOCOC5YYppfcSRMCFUCigfcrJBPDaTL9vA7kg
         iSWj50LQgtDyfuXUKyPjGGGcz08a+AIwPgaTGld37YBaL2+e3EVLTYU1Aeo5LuRwyK/z
         WGU4DnaGoDu7hs/eJuMgEO3hAuybJa8qLmcf99V7oIl5VV52wwOLEDuKXis47sfmqEnC
         zk6P1BPtePJI4sp9A7lMcslEUA++buK+hZ27e/L8GerOu6gzUFut+J9TLHv5NBmIDY3v
         k4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741437236; x=1742042036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xrHqPe4qI/nAbruW3F2vRPvWp4Qoww7mexetKwU+H74=;
        b=cWKwo6MfS1+QQ37eWIG6+TnyZrznV/i8hrtK8Jq18CbKDXll2iIXy5I1+7p/20TF1J
         aEtyvraOtWukTMmMfdwj2N/UdIIlRF3bpvHN5vKmsiOrupx48mOodh4ZUNJpHjbYsC1Y
         vTuRxd2ZDvhhO07Kp91/ZtZkokXSj3p6966hTtncOwDQpFZp4NwuTfHY92Z4s5hcik9g
         VDjAwZY8eL4hYf6t8IZUzqzQ5S7eI9L0fI0WMQscvwlap3GQLpDhi7YGvhET6A24BsBt
         xKIE0mCCnLiwWaOUzUCMer/b1eVf6G0YopowNLmHYlQ3TFsNgHbrQNVcjMXYCtZ9AGJ+
         S0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3T7YnWM20cAZN4O2g/WS/6XNAW03ojqz+rxGMksAqn/mkl4b9Ed41l9fPZcEaKVgtd1VeMCi3n1/wnI/s6Y8=@lists.infradead.org, AJvYcCWUlrXFf2+0pUFEN9MaYM0FSWcW1Jb7F4WPO/qUyk3R16B8M/K+kgMeSwX/0YVeM9JIUxba2gsqsGG1r+xDIwPL@lists.infradead.org
X-Gm-Message-State: AOJu0YxBU68I5qgV3q/P096TjEzrZM1cAWyRcLbkMpMyNXAO8HO/vNrb
	9qxxHQraZViwJP/nw8BThTQQVMEgdIBv2CQcqQsQa06Nj09/J5XR
X-Gm-Gg: ASbGncsuGE8fiHwlPayeq0SMaE9T6KcTqd9RU2EAzyHl0J/4wYYLC8T9gAy5bE1hZ6X
	xvKlj0dFBOb8VBC1i0ef6mqV0WfTz0mZ8eXHsttFmMEk/e9jp+d1Rx5jXKYfwS1LeTRbpj3MJRm
	XVlrNS3URs2bd765M7IJVZBkhfXtaWe+5Xvf9p2G4ept3aTbA4q80zBDAFdYSymosqo/gwK1fjI
	FPUQeJrMYLXzOiuStOsZfOXDz04WlJtPGg++JSY573yDGThVLbcA8zbhu0kpEhSBsgIuVo39wpj
	7p8jyuSQVG3+F3FumpZ+hQJrY3qFcfxwkCNuTpBhWDOgBoVW25xxRy46JCn1K1LbbrkJlg/YXpb
	tVAhBmhbFRx41FArBmDupEIYLXdE2GbTx
X-Google-Smtp-Source: AGHT+IEq4oVqwhl+HcBlEEt5O5mLwczA0MCHU/VL6TVKG4WcVGMzJn/E2qe19p7uaCmDiiGmZcFF6w==
X-Received: by 2002:a05:6a00:816:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-736bbf4af5dmr6123665b3a.2.1741437235636;
        Sat, 08 Mar 2025 04:33:55 -0800 (PST)
Received: from ?IPV6:2409:8a55:301b:e120:9c19:1482:d401:437c? ([2409:8a55:301b:e120:9c19:1482:d401:437c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698450244sm4918282b3a.80.2025.03.08.04.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 04:33:55 -0800 (PST)
Message-ID: <40b33879-509a-4c4a-873b-b5d3573b6e14@gmail.com>
Date: Sat, 8 Mar 2025 20:33:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 0/4] fix the DMA API misuse problem for
 page_pool
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com
Cc: zhangkun09@huawei.com, liuyonglong@huawei.com, fanghaiqing@huawei.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Gaurav Batra <gbatra@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, IOMMU <iommu@lists.linux.dev>,
 MM <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>
References: <20250307092356.638242-1-linyunsheng@huawei.com>
 <87v7slvsed.fsf@toke.dk>
Content-Language: en-US
From: Yunsheng Lin <yunshenglin0825@gmail.com>
In-Reply-To: <87v7slvsed.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_043356_968677_B9A3CFF9 
X-CRM114-Status: GOOD (  18.61  )
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

On 3/7/2025 10:15 PM, Toke Høiland-Jørgensen wrote:

...

> 
> You are making this incredibly complicated. You've basically implemented
> a whole new slab allocator for those page_pool_item objects, and you're
> tracking every page handed out by the page pool instead of just the ones
> that are DMA-mapped. None of this is needed.
 > > I took a stab at implementing the xarray-based tracking first suggested
> by Mina[0]:

I did discuss Mina' suggestion with Ilias below in case you didn't
notice:
https://lore.kernel.org/all/0ef315df-e8e9-41e8-9ba8-dcb69492c616@huawei.com/

Anyway, It is great that you take the effort to actually implement
the idea to have some more concrete comparison here.

> 
> https://git.kernel.org/toke/c/e87e0edf9520
> 
> And, well, it's 50 lines of extra code, none of which are in the fast
> path.

I wonder what is the overhead for the xarray idea regarding the
time_bench_page_pool03_slow() testcase before we begin to discuss
if xarray idea is indeed possible.

> 
> Jesper has kindly helped with testing that it works for normal packet
> processing, but I haven't yet verified that it resolves the original
> crash. Will post the patch to the list once I have verified this (help
> welcome!).

RFC seems like a good way to show and discuss the basic idea.

I only took a glance at git code above, it seems reusing the
_pp_mapping_pad for pp_dma_index seems like a wrong direction
as mentioned in discussion with Ilias above as the field might
be used when a page is mmap'ed to user space, and reusing that
field in 'struct page' seems to disable the tcp_zerocopy feature,
see the below commit from Eric:
https://github.com/torvalds/linux/commit/577e4432f3ac810049cb7e6b71f4d96ec7c6e894

Also, I am not sure if a page_pool owned page can be spliced into the fs
subsystem yet, but if it does, I am not sure how is reusing the
page->mapping possible if that page is called in __filemap_add_folio()?

https://elixir.bootlin.com/linux/v6.14-rc5/source/mm/filemap.c#L882

> 
> -Toke
> 
> [0] https://lore.kernel.org/all/CAHS8izPg7B5DwKfSuzz-iOop_YRbk3Sd6Y4rX7KBG9DcVJcyWg@mail.gmail.com/
> 
> 


