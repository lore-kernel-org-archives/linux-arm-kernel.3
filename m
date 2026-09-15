Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85FCC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 06:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nc4AZwLTj1I7GRxfu534U6zn9icG3vx3KriT4jFrAs=; b=tkQu1+E7mLO/AAgaP3doIGoVSx
	JoPOyqyudZd/rHcwAcB6Y7d4uYKV9NB2P11SaHAq+K+dAltUhyhOWgi+qSUclKeWYPdA8VmNrMM4U
	+hdUz/ZtsqSbgYV/wabgCnfBfnNRA61Pk/EXb7wZBQatEPI7A7KGxL56FJSJ0PCk82uZPDjnw4z4+
	jx0zGnEi5wRNg9GknArCPiwZkWCwOVhjyGUvb8xi2/iQfoUij1xa3RNDbo5JoWL9Qjnmu+yywZt+k
	nA4EUHYwr/cBcvbgkuQjpnltDUhSDuy8mSYpNC3AHeF+hOaKwb2c28Ek8h66exhrtvJXCL09MDYzH
	xvARj+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MzD-00000005NoY-3fsZ;
	Tue, 15 Sep 2026 06:49:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Mz9-00000005Nnk-3ujT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 06:49:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZcFL3824031
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 06:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Nc4AZwLTj1I7GRxfu534U6zn9icG3vx3KriT4jFrAs=; b=gNmVBalgTx95N20z
	ls/kWo9gIk+XQ8zgF73UzVRMFd2JS8yeeHmAPH1mQuIEROmJ+dupukvO539fHm2D
	eiTrm/TfwukpsAbuSH3+KCaypBEgXxxPBAbhtxi0cw2UDvefnmycL37aaoTP2oFo
	yHxW/p3DORQoaFFvAyfXD37WaAVLe7qZwthRCbNHRkWa42Ecuxvvjrttt3VudYuk
	MEowVnZvfpcxlco8L9+CqZ1s77K3hFLiJy5BrecSs5pv9Ywjua3I5XMzth6CSy8w
	Iu8UGtMC1eIaq/u+Y+uLnf7pKVRq+TyqR79/MpPyAFn5NYE2fjHWjLN9FMPITvAM
	2ynUAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41tvp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 06:49:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7164488a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 23:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789454982; x=1790059782; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Nc4AZwLTj1I7GRxfu534U6zn9icG3vx3KriT4jFrAs=;
        b=i+ecZJlESto8NwQ/NtjcTCA5Q671NcsKtFFlsPVIDANgLHqvPPDrf94sXq0xxWED9w
         uCFpNRXyuUDf/RWtyuhq7VWPr3xp7y23BqLFroihwGwatjqc9o08oPMg8WaTqpxA6uYZ
         Mn2uXrfMXi8LX8GNJWqBjdAX6rzJxaGPXg8TziUX5hK8Ognr6aSbDkv6z3EWRYrqzQal
         fhcyGh9A/fUa/9655gM+y3gE7QV4jHs5mWC4hS9+noDBcW35ThXRsZdtb8Ep7yOXCxB8
         rcjMY/SnKNRES7mPzz38Dt+VfNNF0XpYakAzH2CP9rkJh6qWUG23kQkCjIA6g/S7EE3m
         BWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454982; x=1790059782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Nc4AZwLTj1I7GRxfu534U6zn9icG3vx3KriT4jFrAs=;
        b=Apn9PNXAsqxr3WF6iZ7yvMS0mMmYJlkOLcOBnncJ7OS1VWyJKXCSVKkcLu+ChuQmCm
         X32j+Tp4xmqhuFZgnl2JA1yUKPlM4mR2D50OE1kCy4uUBMWyLLFEbpzhQL7y05EURJCQ
         0oVcDkxrfWR8IQFBxZJzNvzVMStlT/Et6JEp1SJYf4RFe+Dknn+7GXKCARyp56MAS2mt
         +gxV93nQZGiBOj4bt1v1G7T9AH+qqQIJldQ7tnvLtelpF00cXFlf+n5ImPyIPXM3M4wT
         U0UtmCmkaS3NFEpRQP1ZV7RSOWkt81f1e52T6Zmj4U3TrbSVhKBvHSU/SHBHQjBaYRzF
         wimQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGr2mYtbJZJnh8QlCF5DZwceesayit0zjSh2fQRlntbmQQduppNIBTTF+7UL9NYOa2M/RECEWBsSN5je4uFa1U@lists.infradead.org
X-Gm-Message-State: AFuF++nDG9sh1bIS4rZ4+G9Oh6OGx4FNHd4wygD4rjmcQwkHtPsuP4oT
	7njdZvv08HGfpzNsPsdDp3oIWomRLBx7PLyQq2qFksZGo5VpOYWjUWV9P4ycghNGIOVh296HsRd
	ch59Pd/IqNZVpaXjIQB24vpf7P0bwp1xpUloDJ4B+aYnM2aCBofbBt5vqXBdMzjZuHIRcb0/bXd
	whcw==
X-Gm-Gg: AYBFou3S147RRCNSpe0c8UfgAkDFRQXM3f5QrMo4qtsiz9bmueDdiMZu2YLBUy0t4rP
	OADyTV4t6Q42U32gpYBDXl7dgWA9IMp3XrZugpFMeG17zgayTt1yB7q+6bLW5wS1QbHBTgavWJG
	ryVrY60agmC4X1kpHuEspLjNpzBzWw0nULfMqvj8qciUrA5LLiXxFr49F4h+JRYjgB16LVQWgyj
	/U5GYPf8iidV26mxfAw0z1kc+A17X88C4nH1k8J6gL4yb+LzK4dfRc2dpDSMtNcj2z5R6hp+OfM
	wjpigyYbjmnzxEc74XiPdM+SeGSS4jB1DfA2UrVWZV/5sQQQ85gBnAtEJuR5XYRDqqkXuSh2hip
	nUPV+njJRRDzt/tLnRU5Cnu1aIKQQF8hJjM2zQla6MUJXX6qynsnl9QosxAKr0Eg=
X-Received: by 2002:a05:6a20:a120:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3db404b735amr13965329637.3.1789454981778;
        Mon, 14 Sep 2026 23:49:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:a120:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3db404b735amr13965269637.3.1789454981337;
        Mon, 14 Sep 2026 23:49:41 -0700 (PDT)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6529a71sm6207225a12.5.2026.09.14.23.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:49:40 -0700 (PDT)
Message-ID: <a340505d-9495-4f68-8ed1-c7e8772c28e4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:49:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
 <317682e8-63e7-4047-9106-deea7bf96388@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <317682e8-63e7-4047-9106-deea7bf96388@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX9VjD233g81jd
 Xz3gHhiUYU/Nbzt7A1SAfNlyuwxhVI6zclC5LexG+2dq5ceSQiPq6AU/DTNZJNMjZPOtMbgn2ZH
 tSgUDIzPDWQ6VeWee8NfvbAvwqY39bJI8FaXnt0pmBpRB26gGQwglfWwuqnBqRwQ2itWcp/j1/6
 rei/x34PxHu0dba7vsLkn73pE4EpSxqMGC9Yw5Ay1XNDDS5gK06S2K48RRU/He1qpqKIat0gRQT
 HeyPdjq4rrgCs/cnY5/kuRvWm/qErjuQ+8ZMXOVnb6ih6MYK1nDsL73dhnqKdWv6P3xIimYtHxC
 Wro4kdVFA99UUHn47Giq+7Y4PGHLOiAsFKSZ+yUfaSMrMtbD1aWAICtujYoc38Br4m8lFF8Wh7x
 UoTN87WI0t+zahjwq1Kt/C4pQJiUGbV+PWZWiJax/sD6Iprkrq9Ec6GB5QERkmZ5BuDTui2OipX
 tuEi1WH4cZoaj41+JiA==
X-Proofpoint-GUID: TlNb28wbWbhSG1ARLpfog966J9IW7Osh
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8ea86 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=oVi2SUvWo6HSE3DLJdEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: TlNb28wbWbhSG1ARLpfog966J9IW7Osh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX/M8tdCaanjG8
 a9MJGaFAOEbgBHy0FVA7OHXa/WOCwdUz+obWkukTdUNGt24SM/8xlIbp3ry3K3zWFUeHHXl1VrS
 NiYK5abwlSpBKRaFuvY1G5wkYFuHSok=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_234943_989364_31DFF44C 
X-CRM114-Status: GOOD (  36.27  )
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



On 9/14/2026 8:26 PM, Andre Przywara wrote:
> Hi,
> 
> On 9/14/26 11:37, Yin Li wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> The MPAM driver identifies caches by id for use with resctrl. It
>> needs to know the cache-id when probe-ing, but the value isn't set
>> in cacheinfo until device_initcall(). Even after device_initcall(),
>> the cache-id is only available if at least one CPU associated with
>> the cache is online.
>>
>> Instead of making the driver wait, expose the code that generates the
>> cache-id. The parts of the MPAM driver that run early can use this to
>> set up the resctrl structures before cacheinfo is ready in
>> device_initcall().
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> [ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; guard the
>>    cache_of_calculate_id() declaration with CONFIG_OF to prevent build
>>    errors when CONFIG_OF is not set ]
> 
> You can shorten that part in square brackets: doing adjustments due to 
> rebasing is surely implied, and you can shorten the rest, like:
> [ Yin Li: guard cache_of_calculate_id() prototype ]
> 
> Speaking of which ...
> 
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/base/cacheinfo.c  | 17 ++++++++++++-----
>>   include/linux/cacheinfo.h |  3 +++
>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>> index 9f9c72727a05..f75e7f64038b 100644
>> --- a/drivers/base/cacheinfo.c
>> +++ b/drivers/base/cacheinfo.c
>> @@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node *cpu,
>>   #define arch_compact_of_hwid(_x)    (_x)
>>   #endif
>> -static void cache_of_set_id(struct cacheinfo *this_leaf,
>> -                struct device_node *cache_node)
>> +u32 cache_of_calculate_id(struct device_node *cache_node)
>>   {
>>       struct device_node *cpu;
>>       u32 min_id = ~0;
>> @@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo 
>> *this_leaf,
>>           id = arch_compact_of_hwid(id);
>>           if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>               of_node_put(cpu);
>> -            return;
>> +            return ~0;
>>           }
>>           if (match_cache_node(cpu, cache_node))
>>               min_id = min(min_id, id);
>>       }
>> -    if (min_id != ~0) {
>> -        this_leaf->id = min_id;
>> +    return min_id;
>> +}
>> +
>> +static void cache_of_set_id(struct cacheinfo *this_leaf,
>> +                struct device_node *cache_node)
>> +{
>> +    u32 id = cache_of_calculate_id(cache_node);
>> +
>> +    if (id != ~0) {
>> +        this_leaf->id = id;
>>           this_leaf->attributes |= CACHE_ID;
>>       }
>>   }
>> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
>> index fc879ac4cc4f..c33bb3c8bd63 100644
>> --- a/include/linux/cacheinfo.h
>> +++ b/include/linux/cacheinfo.h
>> @@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
>>   #endif
>>   const struct attribute_group *cache_get_priv_group(struct cacheinfo 
>> *this_leaf);
>> +#ifdef CONFIG_OF
> 
> Why is that, exactly? First IIUC it's quite uncommon to use #ifdef 
> guards around prototypes (unless they are stubbed without the symbol 
> defined). Using types protected by those symbols if certainly another 
> reason, and it looks like this would be the case here, but I had no 
> trouble building the kernel for x86, where CONFIG_OF is not defined.
> So can you share a .config example (or give a hint) as to where this 
> fails building?
> And if it does, wouldn't it be better to always include <linux/of.h> in 
> that file instead? I think I see a similar pattern elsewhere (rfkill- 
> gpio.c, sound/ac97/bus.c).
> 

Hi Andre,

On the #ifdef CONFIG_OF: I also verified that removing the guard doesn't
break the build. However, since the implementation in cacheinfo.c is
itself guarded by #ifdef CONFIG_OF, exposing the prototype
unconditionally could cause a link error on CONFIG_OF=n builds if called
from outside the ARM64/MPAM path. A more idiomatic approach might be to
use a stub to keep the header consistent with the implementation:

   #ifdef CONFIG_OF
   u32 cache_of_calculate_id(struct device_node *np);
   #else
   static inline u32 cache_of_calculate_id(struct device_node *np)
   {
       return ~0U;
   }
   #endif

Would that work for you? Otherwise I'm happy to just drop the guard in
the next version.

Thanks,
Yin


> Cheers,
> Andre
> 
> 
>> +u32 cache_of_calculate_id(struct device_node *np);
>> +#endif
>>   /*
>>    * Get the cacheinfo structure for the cache associated with @cpu at
>>
> 

-- 
Thx and BRs,
Yin


