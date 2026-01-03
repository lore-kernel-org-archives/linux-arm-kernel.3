Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD1FFC6160
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 06:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByoD4jWST79BUe/fxqijcSiTeboyFHDF95yg254b5r0=; b=2MP7jGyd6VoxcTCV1uSPQINAf5
	+KHwVvyqnIq/iaBfwuKmcwxddOzcqGZpD/esRUjPzjZnmDvekLSqxLU1EXvtxyeEIXtbMusM0RNZD
	XECeKQpdp1Y3P+wJvTwOCQzisPLNy905417Td1gY7v4g/Y58h426RSst1hTnScrIwousvxoFu6fsk
	KwDgCGjde021aP7RPQzuhHaYgq6oKvzCRbbzZoE7JNDiGmsricW185GpPI+pe7agTkheoPtdnty6J
	eAZD6WIfYT0jLhabxiu4S0rSZwuKSKdnyq7pHITcYt8BKxRfpEHay5ciDkjhtbWAS8ZV5Aah+YXEK
	ZMbYlo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbvGt-0000000925I-1lsf;
	Sat, 03 Jan 2026 06:37:55 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbvGr-0000000924q-0isv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 06:37:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so14267360b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 22:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767422272; x=1768027072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByoD4jWST79BUe/fxqijcSiTeboyFHDF95yg254b5r0=;
        b=TnnCupTGPYKBHhPtzgD0E9hoz4oxdPJruQ6qTtjtwYFfqiFvvgM3KSl9olIsNl2pvx
         MF3JnoKk270+8awAqR28xMeqlSJ2khZn6e2QUYDyqd2g/m8qPM/PWUJBnfA/+7RtOcOB
         poL6qcEUXtqkcw6GWMBJlUcZgaaJ0ii0U+bWkatt8XnV1v8F+5pevxxKYchy8GA5lZRQ
         SNngHU1R/0hoTtKEUYA1IuspiQpBkz+JjPsnazyCZ7IIR/BdV6Fqnypi9CEaJnO0mnTj
         bzA6RtCmOwAAL9Vk51zIW4JOUM/WBNwMKLfzuBqGvcYgIxdsSRsbImi0yT6utu1Mr3d1
         5PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767422272; x=1768027072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByoD4jWST79BUe/fxqijcSiTeboyFHDF95yg254b5r0=;
        b=Ggz9GUT4lWo6OYKE7GdomESEyfmDwMWE9PN7sUp2ReU6Nq/iEQjCYeb0Exov1pV7HU
         88C82M3AR9+0FJbY1rzSLXj2fPspUBZ2mH6kWEfD5UY105CWmavS0Ya0oWP2PgHzRxVx
         HX59OgNEYAsyLiDESV2ry0hExQSc1+qAfV4v7VfeUs+q2gVU38pZi/RG+Lb6wS6/+jSo
         nWPOFGdgU5/dpvumZW+p0i2AZD9aaCZl3fdBum9l+/6p3klsjpakz54Gw1UgvMnT60lm
         bTjXRvcVai6SURhLrBVxp/3QzyGgfOqlP65aNQT+N6FUQDJuBAyvcLqVRJiJSaHrHS3T
         wgkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVppgLSxff24Zxcr8jYyeuEWWmdSVOl3pvuwpNveoBiMDbuRC9/HVE8OBpOISEHEmdDaUinyBcnSPEFMe8t8qi+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi300QC578RYNlCFVvIswYzQk5VUBzjDF4j1wClSmfRYTLykdh
	kZu2KWWp8NupqzA5NzzP1oeBVfqdels+5LF6eZ4LNDe3/eVUbcw+++0q36WnVdDkmZ4=
X-Gm-Gg: AY/fxX7qkw7kYAocHmBNLUui+Cq8loW4VdcEiG7d4ojJfgZCgrn4+Ke9dm7omecLUV5
	REYfBIO0U4kpV1tdCARf/do912jN0lhI5hbZ4KD1/kRZ6+FIk/4JM1xcd1jfRYDI6+eI0DiKKtZ
	OIpzBy6b6FSEGXV49f1h9Gtw6v80uC7+DVaGXU63QmLtSfA2iLjj7Mr3sNMWR4UI9Ly7BQPJe4S
	W+22Yh/LgruabVi4xR5XKlLSKGZK9ZPaJdjOQqpkDE930GLGJX6MJfb5yM/7DL0yhC3WLSJkWod
	FC3Q5bPJiqzIo4cSLgBFLTMNMRUZTMRrN10nOc8xPec7o5g4JoTpRdDA88bInMv0rALg+KGuVx3
	uC9dWcKuk4DRts7gNSKz4rpgZBM3m3UijdIXxzWZ/M4sgClT/58OUDIGQ1W//p6A8EV1+WfHavw
	EffPwujvsqC6pp0txFxuhtS9TIVhRjVQjRkEPHjfSmHrDvBfbw2IFm9lavRqUKXJzh
X-Google-Smtp-Source: AGHT+IHOn/shxgu6O9AbZYxbJun3BCH+nZYMReTx1ZUY3Ku/Rcc6T4HDI4a+cvUWlCqKmwFxIHrgIA==
X-Received: by 2002:a05:6a20:12c6:b0:366:14ac:e205 with SMTP id adf61e73a8af0-376aa8ffdb4mr41042704637.67.1767422272279;
        Fri, 02 Jan 2026 22:37:52 -0800 (PST)
Received: from ?IPV6:2405:6e00:642:d187:9f0f:f4ff:8fd1:e7bf? ([2405:6e00:642:d187:9f0f:f4ff:8fd1:e7bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961c130sm36229897a12.3.2026.01.02.22.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 22:37:51 -0800 (PST)
Message-ID: <8c7fcd35-3b29-4621-b4e1-df0c88a00cba@linaro.org>
Date: Sat, 3 Jan 2026 08:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] mm/numa: Register information into meminspect
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-20-eugen.hristev@linaro.org>
 <aVImhhgEsHInebeh@kernel.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aVImhhgEsHInebeh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_223753_217361_07E96971 
X-CRM114-Status: GOOD (  13.43  )
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



On 12/29/25 08:58, Mike Rapoport wrote:
> Hi Eugen,
> 
> On Wed, Nov 19, 2025 at 05:44:20PM +0200, Eugen Hristev wrote:
>> Register dynamic information into meminspect:
>>  - dynamic node data for each node
>>
>> This information is being allocated for each node, as physical address,
>> so call memblock_mark_inspect that will mark the block accordingly.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>  mm/numa.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/numa.c b/mm/numa.c
>> index 7d5e06fe5bd4..379065dd633e 100644
>> --- a/mm/numa.c
>> +++ b/mm/numa.c
>> @@ -4,6 +4,7 @@
>>  #include <linux/printk.h>
>>  #include <linux/numa.h>
>>  #include <linux/numa_memblks.h>
>> +#include <linux/meminspect.h>
>>  
>>  struct pglist_data *node_data[MAX_NUMNODES];
>>  EXPORT_SYMBOL(node_data);
>> @@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
>>  	if (!nd_pa)
>>  		panic("Cannot allocate %zu bytes for node %d data\n",
>>  		      nd_size, nid);
>> +	memblock_mark_inspect(nd_pa, nd_size);
> 
> Won't plain meminspect_register_pa() work here?

Yes it would work, but as explained in the other email, it would not go
through memblock API.
We can continue the discussion there

> 
>>  	/* report and initialize */
>>  	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
>> -- 
>> 2.43.0
>>
> 


