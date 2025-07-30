Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51752C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9x/2NmBAyKmjbcpba0SHjkvYUhTVea6LU5Wnmf6NNM=; b=VUFAcT7/UxWU68nOufy38IjgUS
	SyaYQI84fo1i56hiKE9E4FJJCdvP1UoS1AAhNuf3SQb9bS8qo4etcNkDKuQt9hol7vKywHwdo+Y9L
	DS6e1u+pcZUwyLAf9c/k39Ds5/7DOFAFtsz1ZJ8kS9TVVHjLM5BjyUtMl3uErbu3lTmNPF51tW8AG
	UrGd1xhQivLu2m2HjO8TkObjzwT3B4YZuGNoc+u4mPezXgWf5gxOdEbxgZlKr+fm6sz04D4J04Pl3
	VKIg3pMX5Nb+y4INlLz0CofKKWkZxrGvFRP303QRgnc7GGSlgeXtRSH5OOFRCtgajBXMw1P7p/Y01
	b5+bJajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Yo-00000001htv-0YU9;
	Wed, 30 Jul 2025 14:13:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7J5-00000001fWo-393C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:57:25 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-3b783ea5014so2391073f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 06:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753883842; x=1754488642; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9x/2NmBAyKmjbcpba0SHjkvYUhTVea6LU5Wnmf6NNM=;
        b=jEYo/LNnZh5/Fjkf/TXahtxwsQbwHwphMXirCVu2MCGaLrXLJhY6lmQiRlMJchYEwL
         +4QyPhwneVZ60lUSq1LeCXAM8Vg8egBUPjk6jJh7ENk3F6T99qDdqUsoI1xu9oEMH8nF
         LmGTAhMrLGexmF+rQoZKWFueMRLjag3aLQqRTao/ThIZFgwXAU1YN5748qKonbgJT6Bg
         D/Tz+rhEb1G6NBetrDQtyZ8XiFLSNG7A+kjs6KoF1gXLW0lzSODapaPqDjfn8OBsX8RQ
         JdRwV6FpHyKvkcLknM6+Soqxb3qMXjtbvAnDgulGwt/k3amT5pi61kDCXnYlhaVKmvXL
         kLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753883842; x=1754488642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9x/2NmBAyKmjbcpba0SHjkvYUhTVea6LU5Wnmf6NNM=;
        b=ufs5wkRXYprdIJEErEdgWzthrzfZXBp4cu9PwTXqjIgfx0eGyWFFsIxPBR24Sd6vNX
         WjKrRwmFhBY/z/aBP5pZOo+7RcywNvjF9JaCR0ZQ6qEPzpU1x/ljpapS3I1uU0/uyOWB
         jDgUTX1/4SOaJr06tTKiDlYlytKAq1LmvCpkZtCcIuDpZpMrzONFZh1yvs4nZZopsu06
         GyL7sKfw8s7BXoGh9r6wgLHgQCRD9kTTtoJJjR+2kBu/25UiuDyEMXvrH1AzpF1gqYEB
         YhoGq+XDUbeSjta/3lBzmhCtgTTIhPVdPWg+UrsGxjtVXceW8AT9xebwN3Lz6MUtDgZe
         ILgQ==
X-Gm-Message-State: AOJu0Yz25llK21S1lTGXYl+DhlqxwcLdlG6G/jKrtqqB3T5mTaqhDofD
	zb/JTkJpqTaFnFE8DDSWAT+37v/MCFNnLHmtY3jUjYMWZ1Kq13Cs0VWMN3WsXRamm6Y=
X-Gm-Gg: ASbGnctcpsnqHaBnFf0eV0L67iCrbmjBivxQH3hp11NIebFHE2JYqDTgktG67du8NG5
	ROoiIMyCzCz6+GHhucl6BJjBE5SdapYfz5WMDVUQ6yoMUmmcnlB6mI4nBxm7Roi2G1Qd3Erjxy6
	2IwHdvjtQJrHuFiAraoQ3d6slclZOUTuhZ/YhETf1PlsgPPRzNFriUIGBRqU7EZAdrdaH6vxKBn
	YowWfL7sK2vwleeKcSew58hkK1DIq2OGNSEMjT1E35hQ9KenogaE5Dk8sIT7CAhZq1EE5BWltX2
	e+mfdV4JTc0DRHLZxwqcLl5pm/EIewNi3FTN+8v/PAxxnnh83DvQEOTNAUcPW5iOsZ3I0ND+JE1
	qkc5daWZLZF6dE+YKtUTfg2TwTx7geA==
X-Google-Smtp-Source: AGHT+IH3yb9aRgK/Q+bZ6pcZQPnb/X5dHJrsLz/8jaoiHMtgM6iMNWm/RCtsBVpSGygJWiFCkMusNg==
X-Received: by 2002:a05:6000:1886:b0:3b7:9a31:2a10 with SMTP id ffacd0b85a97d-3b79a312c5bmr433785f8f.41.1753883841744;
        Wed, 30 Jul 2025 06:57:21 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b795bf9719sm2807959f8f.63.2025.07.30.06.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:57:21 -0700 (PDT)
Message-ID: <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
Date: Wed, 30 Jul 2025 16:57:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_065723_801026_A2083C6B 
X-CRM114-Status: GOOD (  15.84  )
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

Hello,

On 7/30/25 16:52, David Hildenbrand wrote:
> On 24.07.25 15:55, Eugen Hristev wrote:
>> Annotate vital static information into kmemdump:
>>   - node_data
>>
>> Information on these variables is stored into dedicated kmemdump section.
>>
>> Register dynamic information into kmemdump:
>>   - dynamic node data for each node
>>
>> This information is being allocated for each node, as physical address,
>> so call kmemdump_phys_alloc_size that will allocate an unique kmemdump
>> uid, and register the virtual address.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>   mm/numa.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/numa.c b/mm/numa.c
>> index 7d5e06fe5bd4..88cada571171 100644
>> --- a/mm/numa.c
>> +++ b/mm/numa.c
>> @@ -4,9 +4,11 @@
>>   #include <linux/printk.h>
>>   #include <linux/numa.h>
>>   #include <linux/numa_memblks.h>
>> +#include <linux/kmemdump.h>
>>   
>>   struct pglist_data *node_data[MAX_NUMNODES];
>>   EXPORT_SYMBOL(node_data);
>> +KMEMDUMP_VAR_CORE(node_data, MAX_NUMNODES * sizeof(struct pglist_data));
>>   
>>   /* Allocate NODE_DATA for a node on the local memory */
>>   void __init alloc_node_data(int nid)
>> @@ -16,7 +18,8 @@ void __init alloc_node_data(int nid)
>>   	int tnid;
>>   
>>   	/* Allocate node data.  Try node-local memory and then any node. */
>> -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
>> +	nd_pa = kmemdump_phys_alloc_size(nd_size, memblock_phys_alloc_try_nid,
>> +					 nd_size, SMP_CACHE_BYTES, nid);
> 
> Do we really want to wrap memblock allocations in such a way? :/
> 
> Gah, no, no no.
> 
> Can't we pass that as some magical flag, or just ... register *after* 
> allocating?
> 

Thanks for looking into my patch.

Yes, registering after is also an option. Initially this is how I
designed the kmemdump API, I also had in mind to add a flag, but, after
discussing with Thomas Gleixner, he came up with the macro wrapper idea
here:
https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
Do you think we can continue that discussion , or maybe start it here ?

Eugen

