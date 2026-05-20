Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D5ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6WtI20SOErt1sjmYgu/syjd2xP4m+G1yTbwc4/ASSY=; b=MXHMm1UwXElgRNGKB0yIS5YRvx
	tcjeSFdFWAUWESIYHVskjrxAVXzkYX2i6VaOrFEA+/MmuiVCqRlglkV6FEalrZUc/N0BGeqdBHzm0
	KohGSBV7pA8DgQCGJ46Vqpo907T/OedOdnIerPQrkymfPZ63821QI7XzWD0h/J9NFWTdPCWu79GIz
	yeFfJB6MF78BdAUEc3Nk3nQIZWWB4F6foDfiWoxtoIKjv2aFzPc4dwx4xTAlQktjrft6qmxvM/sxo
	3sF8YpdqR2Tg74CPYywY8WhmD9gqBNc+pYMrFfPnVwKO3y+yITt5+uAyQUKEjlh22e+HLQ7BiZRA1
	NUM32U4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdvb-00000004IKW-3PE4;
	Wed, 20 May 2026 10:13:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdvZ-00000004IIX-1Wx2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:13:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7gdF6341575
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6WtI20SOErt1sjmYgu/syjd2xP4m+G1yTbwc4/ASSY=; b=TaTOPc9O6oQGrnGP
	Cx8o8usfGK4YXWUv3vb+YrOcbNKFLMaVzqQ7m6Nghdb5lT/oNAFTddvy0hD/Yxe4
	0uGHHeV9/JZvzMRk8wqhAfvaSkaviIJezUp2Yz2+EsUEHVPv53Tq3pzXiJJwkGSs
	ha76AKW5gjZC+HgZW99BvQZWnqSHaQ0mqp8ky9psRsWH0l1Je/f4ZjAubmj/+kUa
	Vv/XmiWJ7bmphU0RDGP77I5TZ1oHOz1f+yJmty/FJBTo5exhuVejQWkuinsI6+9Q
	ATszw5lZA+f3AkHRSIjcmXo2kgQCjd1y1FpTaMuYbapEheCUA6aiTwC3cmZp84YQ
	he1Oaw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vc6wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 10:13:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so4731796a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 03:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779272003; x=1779876803; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6WtI20SOErt1sjmYgu/syjd2xP4m+G1yTbwc4/ASSY=;
        b=ajujA3sbMZADBX4rNDO8Rkv1quMfet3gkqs9VZ+s43U5PTmG3c7//bsEIyGsFgMXlC
         SHRmDdPpf8yjARkzfSIsDdEkORAim8FDUlGa0FAo2ekTTHJ5vPg9iRM6/yljs8krYZiS
         Lbrb6UeYXUXQHqi3xR1IycpQMatJMbBNO/xHQ+qAIiQVV4BffjV2OHWkIMwVFi/PiP5t
         PalE08fIlPtEUyCo7rthGKubABsFYXhMKhQgs/RzS8OEUm9sICL+rIa5CXbb2OVno9ny
         unDlM/99Fk2mMErKRqgkBrtJ/DrhU2Oi0o4Pd0OhMynEpUeANdl7Um4aISnkg3KmjbVa
         F3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779272003; x=1779876803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6WtI20SOErt1sjmYgu/syjd2xP4m+G1yTbwc4/ASSY=;
        b=LKR7NDmXWQKTI2vg/h4XwSOoL2e3N2rhiDUUFg7JRxMfoUiXYRRIF/8UNp16JBF7RU
         5M+XbL/llnUM0aoZHZRhq7WSMRQW2Iwc0nqhQcv5gBA0OxwRtcxVhZly1yedh2qj1+kX
         zKptLwUPr+8/rJ74o0PrHJlHXsTSHYwCtb6u3E03ytCBO8on61vnld9+SpHaZ4clW5Zr
         2PLlSuVmwjkYegRpyB/5buziUPEMhH3mxOrOyHg6x5ZwXfwwu/6t1CSuXdoWIiiDUtuI
         xt72eqUcavEHAkO29bfLu8ChlVzpdtCPvatVNMaSpi/ZgbNbmjTqsJYEDTMBFqYwUNn4
         AM2g==
X-Forwarded-Encrypted: i=1; AFNElJ8jNAI43RoMP+5BjDNxgpXM5Z+0tlY3Uo5hr9w64T58V5f3uD8EyrU0TlFrc6fkRtOApKCGC7lo+KgE1IrTnuEa@lists.infradead.org
X-Gm-Message-State: AOJu0YytI+reVcqB/fQvZJQ7NoVsLK0D1lrHXFkGFgdVq4vj8qA/o95G
	gQiNDy0zpwjDG6V+43mzmD66VcKiumpng11BAjnBFddRFEXgDPFmfos2CeiRKD2pgN6z8yGuU63
	4CfnD5A47xB2zfEoags/zgkskCyZwG7fKdjJoq9G62qh04CDLkhSNk9oLY+LFsU+D6E79XGkuaB
	5Pqg==
X-Gm-Gg: Acq92OGp/lqWruT0eYXNoF2I3piWEIDm18SDd4yXVRIkJjLoPDkRYlwC7a5T5ysR5l9
	vcjJH+l51awWNQnWRKuIgDDvEq5J2aZkNjnM9aNHFOBbyC+IwBm8yyfZPXh1QJCH/60Fqp6VTtV
	8yXzRhmHXjK4xUJ+jDAUxZDhqNpTYiMK1LsmdeLMrNGll7m6QY5AsJsJOQP4GnvgM8GelzexiEu
	CtF3ENUqb/HZotJ3+XvVnz8fQfwnymlTfzq8EOOU0CqS7vtli9+Ryfk1Dyoq2Hf4idPivi1NWzc
	IeQSpIWMLdtdnRkG2Ygtz0rB1hfrEXglyBFfyDFU8cGD6kWs2HWLVALigDyXAjGkFwEADJ7uO1D
	8T4/geYJ0Ljh3Bzv52UWoX5RkvB3q77ZDz9h3jq8jdmwRz7NksLV7SHBCOUWZOOFY7wzyUVjSOh
	EdZio+YxbbIh+SPZiYaC8LhQ==
X-Received: by 2002:a17:90b:58e4:b0:366:755:6fee with SMTP id 98e67ed59e1d1-369519ea265mr21405568a91.12.1779272003032;
        Wed, 20 May 2026 03:13:23 -0700 (PDT)
X-Received: by 2002:a17:90b:58e4:b0:366:755:6fee with SMTP id 98e67ed59e1d1-369519ea265mr21405531a91.12.1779272002567;
        Wed, 20 May 2026 03:13:22 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c5f0eb2bsm9113668a91.7.2026.05.20.03.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:13:22 -0700 (PDT)
Message-ID: <c819c469-0ac4-49d7-aff2-d3863a44e35d@oss.qualcomm.com>
Date: Wed, 20 May 2026 18:13:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Mike Leach <Mike.Leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suzuki Poulose <Suzuki.Poulose@arm.com>, Leo Yan <Leo.Yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nd <nd@arm.com>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <f347bad3-4a11-4f65-b35f-f59c6360ac5b@linaro.org>
 <5b3785a1-0f53-4b61-bc18-880091c2ce12@oss.qualcomm.com>
 <dea28a56-a5d8-46ef-a782-a95073714377@linaro.org>
 <PAVPR08MB9674C4C58210122F3A6E07AB8C012@PAVPR08MB9674.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <PAVPR08MB9674C4C58210122F3A6E07AB8C012@PAVPR08MB9674.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mEfZhAoOGjLHMS-pUKI9tiMX81XDXpDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5OCBTYWx0ZWRfX5wVT3/opJv86
 STvw003iospBDI6kwmBoNykiwcr7TlaqlxymYU4AcFQfEv5n9RHK9ZyEgcsGkcBWFQX+THN8xc0
 fmavvuCZxWuSy/BSc4imOBRoPiItnsZJBpbU7v+9KfhJupgzelGRM2/8QjlRjQEK/PLJcpxoruD
 zgJw+t4QaLPqga4pkzUMhUJtVRnC0CEZjj03SnQxeE4EMP8tKsD5AGiJeg4eLF986I1F1Ne//1S
 lwvyZqTMIAUXgXUBYcGzZulibpn0rkqnyYUA/iYBmTEzbAHvU8CzqXs0+hmz8r//Heo0MKxEZKE
 qutOtUZkz3ioZm152RhWVPu8jDuMPg72I2UTbKnCOyLAMZxT++PZv6grOQr2VTUgli3CE8sZrY9
 5hl4ac9sAfOr04z7Nnc1uDVBtrJfDsfOjR/mQ5E+XB3pRWzzrfxqDNe7Jl8dz7pWNaNdvIczx3T
 RyMlYXiV07N67wjx68g==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d8944 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8
 a=BYRlHehqVJN5VeUu3RcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: mEfZhAoOGjLHMS-pUKI9tiMX81XDXpDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_031325_530816_98D319DC 
X-CRM114-Status: GOOD (  32.51  )
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



On 5/20/2026 5:27 PM, Mike Leach wrote:
> 
> 
>> -----Original Message-----
>> From: James Clark <james.clark@linaro.org>
>> Sent: Wednesday, May 20, 2026 9:38 AM
>> To: Jie Gan <jie.gan@oss.qualcomm.com>
>> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; Suzuki Poulose <Suzuki.Poulose@arm.com>; Mike
>> Leach <Mike.Leach@arm.com>; Leo Yan <Leo.Yan@arm.com>; Alexander
>> Shishkin <alexander.shishkin@linux.intel.com>; Mathieu Poirier
>> <mathieu.poirier@linaro.org>; Tingwei Zhang
>> <tingwei.zhang@oss.qualcomm.com>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>
>> Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
>>
>>
>>
>> On 20/05/2026 2:55 am, Jie Gan wrote:
>>>
>>>
>>> On 5/19/2026 9:57 PM, James Clark wrote:
>>>>
>>>>
>>>> On 13/05/2026 2:32 am, Jie Gan wrote:
>>>>> Two related leaks when _coresight_build_path() encounters an error after
>>>>> coresight_grab_device() has already incremented the pm_runtime,
>> module,
>>>>> and device references for a node:
>>>>>
>>>>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>>>>      after coresight_grab_device() succeeds, coresight_drop_device() was
>>>>>      never called, permanently leaking all three references.
>>>>>
>>>>> 2. In coresight_build_path(), on failure the partial path was freed with
>>>>>      kfree(path) instead of coresight_release_path(path).  kfree() only
>>>>>      frees the coresight_path struct itself; it does not iterate
>>>>> path_list
>>>>>      to call coresight_drop_device() and kfree() for each coresight_node
>>>>>      already added by deeper recursive calls, leaking both the
>>>>> pm_runtime,
>>>>>      module, and device references and the node memory for every element
>>>>>      on the partial path.
>>>>>
>>>>> Fix both by adding coresight_drop_device() in the OOM unwind of
>>>>> _coresight_build_path(), and replacing kfree(path) with
>>>>> coresight_release_path(path) in coresight_build_path().
>>>>>
>>>>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in
>>>>> coresight_grab_device()")
>>>>> Fixes: b3e94405941e ("coresight: associating path with session rather
>>>>> than tracer")
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/
>>>>> hwtracing/coresight/coresight-core.c
>>>>> index 46f247f73cf6..c1354ea8e11d 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct
>>>>> coresight_device *csdev,
>>>>>            return ret;
>>>>>        node = kzalloc_obj(struct coresight_node);
>>>>> -    if (!node)
>>>>> +    if (!node) {
>>>>> +        coresight_drop_device(csdev);
>>>>>            return -ENOMEM;
>>>>> +    }
>>>>>        node->csdev = csdev;
>>>>>        list_add(&node->link, &path->path_list);
>>>>> @@ -851,7 +853,7 @@ struct coresight_path
>>>>> *coresight_build_path(struct coresight_device *source,
>>>>>        rc = _coresight_build_path(source, source, sink, path);
>>>>>        if (rc) {
>>>>> -        kfree(path);
>>>>> +        coresight_release_path(path);
>>>>>            return ERR_PTR(rc);
>>>>>        }
>>>>>
>>>>> ---
>>>>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>>>>> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
>>>>>
>>>>> Best regards,
>>>>
>>>> Looks good to me, but sashiko is complaining: https://sashiko.dev/#/
>>>> patchset/20260513-fix-memory-leak-issue-
>>>> v1-1-49822d7bc7d4%40oss.qualcomm.com
>>>>
>>>> I'm trying to understand why it's saying that, but I think the
>>>> scenario is that if there are multiple correct paths to a sink, when
>>>> one path partially fails and a second path succeeds you could get a
>>>> path_list with some garbage entries in it.
>>>
>>> I think the coresight_release_path is added to address this situation.
>>> We suffered the path partially failure, and we need release all nodes
>>> already added to the path.
>>>
>>
>> It wouldn't call coresight_release_path() in this case though. If one
>> path ends up building to success but a parallel path partially failed
>> then _coresight_build_path() still returns success. During the search it
>> would have still added the nodes from the partially failed path to the
>> path_list. This is only an issue if there are multiple correct paths.
>>

The point here is there are multiple routes from the same source device 
to the same sink device, am right?

I have no experience on this scenario. So with the scenario, the 
build_path may succeeded in one route and failed in another route, but 
finally, the _coresight_build_path still returns success, is that correct?

>>>>
>>>> That's kind of a different and existing issue to the one you've fixed,
>>>> and assumes that multiple paths to one sink are possible, which I'm
>>>> not sure is supported?
>>>
>>> Each path is unique. We only deal with the issue path for balancing the
>>> reference count.
>>>
>>> Thanks,
>>> Jie
>>>
>>
>> I'm not exactly sure what you mean by unique, but the same source and
>> sink could potentially be connected through two different sets of links.
>>
> 
> Multiple paths between a source and sink are not permitted under the CoreSight spec.
> 

As Mike mentioned, my understanding is that a source device is only 
allowed to be added to one valid path—this is what I mean by “unique.”

Thanks,
Jie

> If such a system was to be built - then a fix would need to be in the declaration of connections - e.g. miss one path out in the device tree for example. Not up to the Coresight drivers to handle out of specification hardware.
> 
> Mike
> 
> 
>>>>
>>>> It might be as easy as breaking the loop early for any return value
>>>> other than -ENODEV, but I'll leave it to you to decide whether to do
>>>> that here or not.
>>>>
>>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>>>
>>>
> 


