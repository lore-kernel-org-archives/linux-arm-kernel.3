Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE19C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 02:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpGhqUpVQqb/n6saMxotWbAoMDKWAg1M5PagdsTso4A=; b=plgbfecTEjL3HGuKKyK1LGtSes
	dTthwJE3dGz8yclHnwNL21sqByTyqQYVK831EAMrSu8U8prl6ndk8GlP7ZTYFyt4f1BrnX22tGl5I
	nrA3SGsEXD2F24Bhvue0Wo4NtH+AN7cNwZ41B90ywgdRho1fbu+7pM8xAMBenn0fP7W2E3ZpfBLia
	pzLSUfl+CiqPJjeBKxV8r5glZH3l84K2eFPxmvf+/uCU0OEtTbFkIk78YIoTxRf+PwZqz+ZBVHtdd
	ZU1Jfs0f/N/n0mcUzGQ2wyZaWnRosNmTwmcDsRcQcWvpDs7c6LdvPOCEaFZXWq0VdcWUosxNjNz7S
	Rb6lqxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fPA-00000008Bui-1zkp;
	Wed, 16 Sep 2026 02:29:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fP7-00000008BuF-3QkG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 02:29:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYsdY1668879
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpGhqUpVQqb/n6saMxotWbAoMDKWAg1M5PagdsTso4A=; b=kqdl1V1OM+OqHvIp
	BVmWXlPgbEtCr/1GUwUhfXnLte557DAPHtvtUxyS9fZhTvr42JuKaV91Um1NJbPc
	w5GT3qinYQDDWEBp0k326JGua63HInJdsnFlQO/S0g4TKUp38zKn8JSzktRzDzLK
	FBgVjBJWiDNasWFEl3q8mGVAfiYZVtfqQ8JV+WTohjqxlmNn/tAHLZ6hAEsJFjND
	6i7Qk4GunShob3BaYnlRYoL6GjVd/duPOd08jeODrLwBKPUkQUuhNGkoekl0MWUg
	h6W0ejzZNmtZtrBaNSKMHuAfCaOcSNcbmnHsTlbsMuCvRwuGPmxBFosuTx60eB4A
	mc91Hg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc3fab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:29:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8696b921ac0so8283378b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 19:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789525785; x=1790130585; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpGhqUpVQqb/n6saMxotWbAoMDKWAg1M5PagdsTso4A=;
        b=CPHx/HFreDD8yQFzLu+d/NZopMbrHHEuIrJA078zNb/FX9Ho+Qs48L9cfYn1qOg72t
         uJyoDmw2gj853R/BhIHbr/2BXxrOiyFaM791Btqks5dYFwPDpDHOvp/0WSHf40YM/NYu
         C6hE8upCfWSjN4lxbyNXJcJabSwiXisxirMyjNdlpZKx0AdTCUa17kbTzugpRSsBp4xA
         WtpVgMz2aQw9Kuv6fdtGX+nkBuIVRTf0qF4WhUU6Ugpr7EXZ1XUrjTeF9+EX6zbtt9Fi
         Y2cnzdPQyogN7IpVUcPdWBW4YupYa46PzGTNrNn/3oNkGIbLw8QNIVHoqzhmUWbMWtPg
         g4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525785; x=1790130585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpGhqUpVQqb/n6saMxotWbAoMDKWAg1M5PagdsTso4A=;
        b=WEPrKaJH79e/chQF2/bOUSd4rajenzq4isfSRAjpzWth+scys9Ngl83xWcB47q+X6a
         3fQP5/VUmLV3UuGqOHYlbe4TXaynLBJ64mY4ggStfKkfcCCCTi0fi5werJExijJIskpp
         pD+TtVUEEi4KZ1Wf6LTybNRQVPx3Df/swIuFrDGB57j4pSafwhlxkuUD4rZWrPt45fru
         0L5AQ6tqO46dV4ONneDtKSyj8fbkAZOGayki+xb8EyPMkB5tt676q7N0ovCux/ZXCYMg
         3zT5tVnnerbH6S5TKgUpCJL4dlPKeRwgDNCmIi5zbUqUYyDGNSQW6ge4cwfy0eMgS2Dy
         8I+A==
X-Forwarded-Encrypted: i=1; AKwUvBxlcDQFFogGJgn7b51rtBa0969HmVZecah7xiuBuf7rB/uYr18PwEACIQti8WRX3O+BpaQbiqLVMYPCDNe+PAXU@lists.infradead.org
X-Gm-Message-State: AFuF++msSLrTvAMxsyHlzzXHWKcwxESQoLFpogxxWrceeKLuDINsIPbG
	3tYFAtuAqXsQkQLToKaFU/uXARkOEmQWC69jF4FO6bZzPhKfv7LI18xiCbhqrBurg9/cUlOa/GL
	fkRVJBc2pLyxhLuvUDnT60psA6J6U/8ciP2txMhf/AiWadUppf0j7s7+xwvtqNrRTwk+SJrLUyU
	hcvQ==
X-Gm-Gg: AYBFou2DXTnqIpJdQ6jQC1IFLLYnspC+A5VKPwwB+RmLvuEwcFCi+Qy2pZ5dkLyp90L
	YeA+S75R59X2XV5HF+pI0z+pUzq6PZ0VS/kJXZfUEtjbl1JLT22C3zvSCCQ3bKxwpkMp0WE4qiw
	nG0sCH7Ic+HreaCLKR0GTLyb2M1T/c0WpqYq2PoS/tzOzIuzIiscVfULWKrF5MWxieTkynLGiGK
	Ojws6tKSENJNOYGLq9TLP7Va4R+KFsdw7ziz01wQ5sWII2Y4ZqIEtYztFdv5bcnAbGy/56xxkFH
	RoakOTGK+I1QCFCbHveyqbfQke/0hfYgEZQpKJOW6b0GkGEG1TE9Z+gF91G78+3rEZQqszJA/Hx
	9vqLfyYERHR6AOgFeLGqw5Vkp6BA7ZH2UvCMUaoewAXTGcVePaKlD2MLi6YELPnXA
X-Received: by 2002:a05:6a00:3698:b0:857:72f8:dc97 with SMTP id d2e1a72fcca58-8723b394555mr1364743b3a.24.1789525784538;
        Tue, 15 Sep 2026 19:29:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:3698:b0:857:72f8:dc97 with SMTP id d2e1a72fcca58-8723b394555mr1364691b3a.24.1789525784087;
        Tue, 15 Sep 2026 19:29:44 -0700 (PDT)
Received: from [10.133.33.134] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872024e6a39sm411715b3a.56.2026.09.15.19.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 19:29:43 -0700 (PDT)
Message-ID: <305e37ca-c576-4ded-b4ff-1f4eea3cb712@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:29:35 +0800
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
 <a340505d-9495-4f68-8ed1-c7e8772c28e4@oss.qualcomm.com>
 <e8a33eea-c54d-471c-9936-41762453feb7@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <e8a33eea-c54d-471c-9936-41762453feb7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAzMyBTYWx0ZWRfXxtrZe27L4DkG
 kUsgTuvcNN3/ttnKhxYDw8FDJnwXi8NV22au6so2SnOerLnIwM/bhYagcbcN4dM0AK3RGcEnw2U
 67Z3INNNe0dLeAvLCV+K46XedrzOJ8M=
X-Proofpoint-GUID: 7T_yI2-qKoNCILxzw97q45Ck7hEqqSnL
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aa9ff19 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=brJ-6TMN6zN7E94x2iYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 7T_yI2-qKoNCILxzw97q45Ck7hEqqSnL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAzMyBTYWx0ZWRfX0pa59ymwgr0k
 y+Yk7+Jp15MqHQn+ouUHK7lMLbrL2IFZugcn540IPokT3/KU7XTD++BuxS1GeblewrgbDhIjoGl
 uypUt4KkVrRglTm9Y0JoePeuhq3Xb7wbC8hk9dgA1QxH4YEQHr4U+hEjpz8HrzfwHJspd2OD9uo
 ALb+PtW1w+hNlK9n3Fv/7wkgjlb3l9s71SSzTm3N/A2bw7LwU2GmhU5qc/m49gmUORqWm4HUsuc
 qny1th7upXlkXgGGNxwr23fhAcutk9lz2junPrSH1FQXbL+xYfBXFLLlLrLsPMEROS3RIFLye/0
 kxDNrF4ZeCh9ZuCFRw1epAwHxzroyFabRj0QallQr521CwNjqYcJcfEkVopMhQIJCtfgGfckJ/O
 LoXjQ8AbUcKT/W/5WNz20nejMFpMQzvlKD9o6ydH17LsfptqHbu58VGNigjPl2n4QdyE7tYl3G7
 zOeAnMqLPHW/u8EP+sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_192945_866323_E5413E6D 
X-CRM114-Status: GOOD (  47.08  )
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



On 9/15/2026 3:59 PM, Andre Przywara wrote:
> Hi Yin,
> 
> thanks for the reply!
> 
> On 9/15/26 08:49, Yin Li wrote:
>>
>>
>> On 9/14/2026 8:26 PM, Andre Przywara wrote:
>>> Hi,
>>>
>>> On 9/14/26 11:37, Yin Li wrote:
>>>> From: James Morse <james.morse@arm.com>
>>>>
>>>> The MPAM driver identifies caches by id for use with resctrl. It
>>>> needs to know the cache-id when probe-ing, but the value isn't set
>>>> in cacheinfo until device_initcall(). Even after device_initcall(),
>>>> the cache-id is only available if at least one CPU associated with
>>>> the cache is online.
>>>>
>>>> Instead of making the driver wait, expose the code that generates the
>>>> cache-id. The parts of the MPAM driver that run early can use this to
>>>> set up the resctrl structures before cacheinfo is ready in
>>>> device_initcall().
>>>>
>>>> Signed-off-by: James Morse <james.morse@arm.com>
>>>> [ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; 
>>>> guard the
>>>>    cache_of_calculate_id() declaration with CONFIG_OF to prevent build
>>>>    errors when CONFIG_OF is not set ]
>>>
>>> You can shorten that part in square brackets: doing adjustments due 
>>> to rebasing is surely implied, and you can shorten the rest, like:
>>> [ Yin Li: guard cache_of_calculate_id() prototype ]
>>>
>>> Speaking of which ...
>>>
>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>> ---
>>>>   drivers/base/cacheinfo.c  | 17 ++++++++++++-----
>>>>   include/linux/cacheinfo.h |  3 +++
>>>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>>>> index 9f9c72727a05..f75e7f64038b 100644
>>>> --- a/drivers/base/cacheinfo.c
>>>> +++ b/drivers/base/cacheinfo.c
>>>> @@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node 
>>>> *cpu,
>>>>   #define arch_compact_of_hwid(_x)    (_x)
>>>>   #endif
>>>> -static void cache_of_set_id(struct cacheinfo *this_leaf,
>>>> -                struct device_node *cache_node)
>>>> +u32 cache_of_calculate_id(struct device_node *cache_node)
>>>>   {
>>>>       struct device_node *cpu;
>>>>       u32 min_id = ~0;
>>>> @@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo 
>>>> *this_leaf,
>>>>           id = arch_compact_of_hwid(id);
>>>>           if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>>>               of_node_put(cpu);
>>>> -            return;
>>>> +            return ~0;
>>>>           }
>>>>           if (match_cache_node(cpu, cache_node))
>>>>               min_id = min(min_id, id);
>>>>       }
>>>> -    if (min_id != ~0) {
>>>> -        this_leaf->id = min_id;
>>>> +    return min_id;
>>>> +}
>>>> +
>>>> +static void cache_of_set_id(struct cacheinfo *this_leaf,
>>>> +                struct device_node *cache_node)
>>>> +{
>>>> +    u32 id = cache_of_calculate_id(cache_node);
>>>> +
>>>> +    if (id != ~0) {
>>>> +        this_leaf->id = id;
>>>>           this_leaf->attributes |= CACHE_ID;
>>>>       }
>>>>   }
>>>> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
>>>> index fc879ac4cc4f..c33bb3c8bd63 100644
>>>> --- a/include/linux/cacheinfo.h
>>>> +++ b/include/linux/cacheinfo.h
>>>> @@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
>>>>   #endif
>>>>   const struct attribute_group *cache_get_priv_group(struct 
>>>> cacheinfo *this_leaf);
>>>> +#ifdef CONFIG_OF
>>>
>>> Why is that, exactly? First IIUC it's quite uncommon to use #ifdef 
>>> guards around prototypes (unless they are stubbed without the symbol 
>>> defined). Using types protected by those symbols if certainly another 
>>> reason, and it looks like this would be the case here, but I had no 
>>> trouble building the kernel for x86, where CONFIG_OF is not defined.
>>> So can you share a .config example (or give a hint) as to where this 
>>> fails building?
>>> And if it does, wouldn't it be better to always include <linux/of.h> 
>>> in that file instead? I think I see a similar pattern elsewhere 
>>> (rfkill- gpio.c, sound/ac97/bus.c).
>>>
>>
>> Hi Andre,
>>
>> On the #ifdef CONFIG_OF: I also verified that removing the guard doesn't
>> break the build. However, since the implementation in cacheinfo.c is
>> itself guarded by #ifdef CONFIG_OF, exposing the prototype
>> unconditionally could cause a link error on CONFIG_OF=n builds if called
> 
> How so? Just exposing a prototype wouldn't be a problem, as long as you 
> don't try to call that function. And that would be caught by the linker, 
> and then you have a different problem anyway (the caller).
> 
> The only reason to protect the prototype would be if a type used in the 
> parameters is not defined. And on the face of it "struct device_node" is 
> an OF specific type, declared in include/linux/of.h, but as mentioned, I 
> can't produce a compiler error, and even if so, would prefer to include 
> of.h instead.
> 

Hi Andre,

Thanks for the review.

I'll drop the #ifdef guard in the next version.

Just to clarify: MPAM depends on ARM64, which selects OF, so CONFIG_OF 
is always set in any configuration that enables MPAM. I had kept the 
guard as a precaution for potential callers outside that dependency 
chain, though I take your point that this would be a caller-side issue 
rather than something to address in the header.


>> from outside the ARM64/MPAM path. A more idiomatic approach might be to
>> use a stub to keep the header consistent with the implementation:
>>
>>    #ifdef CONFIG_OF
>>    u32 cache_of_calculate_id(struct device_node *np);
>>    #else
>>    static inline u32 cache_of_calculate_id(struct device_node *np)
>>    {
>>        return ~0U;
>>    }
>>    #endif
>>
>> Would that work for you?
> 
> That's not necessary and doesn't solve the problem: the struct 
> device_node would be present in both branches, so that doesn't help. And 
> given there are no preprocessor protections for OF or ACPI in the whole 
> of mpam_devices.c, that's a non-issue, I'd say.
> 
>> Otherwise I'm happy to just drop the guard in
>> the next version.
> 
> So can you say whether you have a .config that does not build? Or was 
> that issue just pointed out by some picky AI review tool?
> Otherwise I would drop the guards, and wait for the kernel test robot or 
> Arnd's infamous randconfig builds to show up the exact problem.
> 

For context: I did experiment with wrapping all the OF-specific code in
mpam_devices.c with #ifdef CONFIG_OF, but dropped it for the same reason
— the MPAM driver depends on ARM64 which selects OF. I then kept only 
the header guard as a precaution for potential external users, but as 
you point out, that's not necessary either.

Thanks,
Yin

> Cheers,
> Andre
> 
>>>
>>>> +u32 cache_of_calculate_id(struct device_node *np);
>>>> +#endif
>>>>   /*
>>>>    * Get the cacheinfo structure for the cache associated with @cpu at
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin


