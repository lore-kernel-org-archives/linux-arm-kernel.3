Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D97EED628
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taD8t+CRYZkYr8f56OzWxn0Ld4xi2x2xvqJmet4VYKk=; b=OMtAeINoREnATx5Pa3SsKDgbza
	bMcVQOejGuFoFkyticYTWjp4fZn08DUw0yQ+Edo9Ef62fQLEVmzv5AOxfzSbEcE0lrthqtT5SVSXr
	Y7R5ezUVVscOQba/7GhoHtQ7gzRjzcQ4fIlT7OvM1UREv6LMs62YLfKimMZTEUPcXR7XPh/iFgBsq
	D6t/ntRyf4mfenzKebYcFVZw/Do8yWKk7ZctRvMLLhbPydO/mzhzgnrn3GrPGGB213SurofDDgNs9
	BYjmynSJLsGCfuxNMm9d9J4dEkUmi5wT8kg+MarzWY4Xp6S3w1zfOXs67aUmADJgbc4NQ9CwNfMdT
	KhJqchzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhEn-00000008RY9-0tH1;
	Fri, 02 Jan 2026 15:38:49 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhEl-00000008RXn-061U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:38:48 +0000
Message-ID: <883a21af-750c-49df-88c6-47bd642e03d4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767368320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=taD8t+CRYZkYr8f56OzWxn0Ld4xi2x2xvqJmet4VYKk=;
	b=J2c9SRA/ZhbRgjOYPehVBB39V1rco1clZMAUidT4LuwgHuP8gvVpBo+rR3q/m91jrmXejR
	VkeWIS/+7E64XyXQfUsgt7kCFxlA4wd/JurUBVXSVh0WqktjV3xAXihcoQl/6qwP39dXq9
	P9PAoRpEfFR5S4QDwFvEBJ/EU7V1kV8=
Date: Fri, 2 Jan 2026 23:38:25 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 1/4] bpf: tailcall: Introduce
 bpf_arch_tail_call_prologue_offset
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 davem@davemloft.net, dsahern@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, akpm@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kernel-patches-bot@fb.com, martin.lau@kernel.org,
 clm@meta.com, ihor.solodrai@linux.dev
References: <20260102150032.53106-2-leon.hwang@linux.dev>
 <45f1e1978b7dc28e522dcc0a72954d892b37a85220749bd027c7395edb01d991@mail.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <45f1e1978b7dc28e522dcc0a72954d892b37a85220749bd027c7395edb01d991@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_073847_227214_CC4C4E4C 
X-CRM114-Status: GOOD (  11.81  )
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



On 2026/1/2 23:21, bot+bpf-ci@kernel.org wrote:
>> diff --git a/kernel/bpf/arraymap.c b/kernel/bpf/arraymap.c
>> index 1eeb31c5b317..beedd1281c22 100644
>> --- a/kernel/bpf/arraymap.c
>> +++ b/kernel/bpf/arraymap.c
>> @@ -127,6 +127,9 @@ static struct bpf_map *array_map_alloc(union bpf_attr *attr)
>>  			array_size += (u64) max_entries * elem_size;
>>  		}
>>  	}
>> +	if (attr->map_type == BPF_MAP_TYPE_PROG_ARRAY && bpf_arch_tail_call_prologue_offset())
>> +		/* Store tailcall targets */
>> +		array_size += (u64) max_entries * sizeof(void *);
> 
> Should array_map_mem_usage() also account for this additional space?
> Currently array_map_mem_usage() handles special cases for percpu arrays
> and mmapable arrays, but has no corresponding check for PROG_ARRAY maps
> when bpf_arch_tail_call_prologue_offset() is non-zero. This would cause
> the reported memory usage to be lower than the actual allocation when
> an architecture implements this function (e.g., x86_64 and arm64 in the
> subsequent patches of this series).
> 
> [ ... ]
> 

You are right, array_map_mem_usage() needs to stay in sync with the
allocation logic to avoid under-reporting memory.

I will include this fix in the next revision after I’ve collected more
feedback.

Thanks,
Leon


