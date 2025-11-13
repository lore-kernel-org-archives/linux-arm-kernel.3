Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58038CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRTlfmcA5G3RNmazWc6q+mJMqfQXqWOCzTyBT64u9rM=; b=ViUbWc1jJgqCZtC8uU3dPau6vK
	RKy80gJ18D+6BU1SCTSIycudAy9x/XDjzSnt9G/pOVLDvXdOjxlno3LUPZm2zgmvoZ2j6E+6PznEb
	iiPC99zmrd4FNgHbWW8C5laCkZgxLAyry79Z+YhTNjp5JxUED42h973Nj0lTRP8KHC+4Lty/Q2J2a
	9ONQKeetOl1wIbfyFTSydMeqcZrZAxk3vLngEdeY/sd9kwwkmffHNSlvU9bSDMYhNLvhUQbgVa02y
	4hrmTNTWDY6dMRRONnim2PLvN33EQvcZc6fu4ZDqI8jRbHV13Hw+Q7MFehwhjQSD08Zyg492zlqVi
	8b5Mxz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJX6M-0000000AWGV-3XNS;
	Thu, 13 Nov 2025 13:11:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJX6K-0000000AWFv-1cJc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 13:11:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADAHHV24097082
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 13:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DRTlfmcA5G3RNmazWc6q+mJMqfQXqWOCzTyBT64u9rM=; b=TOqMaBTsjWUqDCE5
	HDed8I/iW2bdO1rwLxiMq7m7eb87aqzdumHxxMdVgZ8/CEnauG+fKxWLkRNspXks
	bM24P6wv/5ylAbR/OnXEbcJZ7VUmCaFSW7XylRBDABE5A18wVpNvXt3wrVDCVYBu
	bBiUrn4EVnTECSgSiRVGXRESIrU8cF1oWGyYOiusBeGhnMk5aI4KyfDGHegM4eW9
	qrfjzvuYHqpAvZv0/1Mfbpr4+NOqgHVqaSKtdgRLuWHj+9sT73RLQusyIZ4BZrSu
	vOWUFz6snmp1LvuBpdCipRhcr+7aKiHKnr4DTFsv5QxC+Fv+9CLXTFzHj8P0D5gd
	LN+fBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4addetres6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 13:10:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6a906c52so2313321cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 05:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763039459; x=1763644259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRTlfmcA5G3RNmazWc6q+mJMqfQXqWOCzTyBT64u9rM=;
        b=KJJbcf2p6vkDuXIlw6RiMoXhnFAcs0zYPLgR3Et4wmAogWtdx47tUW+GbzEXxgq/G6
         eglnc5UYaevoI69QqiDWVdvx7bZ4vgypdkGUGyoQhjbeNQ9zkZUUuLlTsajcWUoMtBz0
         Ew+RDawWTIBf9BvYshgSzLaxuwaVb1daNZXgqSaFG8rbSY2rx0sN3pqZu2dRIvTCiqtG
         aHeDyIz4f4aop/MMccXjrJsQTkR78lLVIKm2TtWTATY0snQ53YWjqKR6ayIe+ugQlrRO
         TrkG0lMrRHiVWGMngBTIKAdaNBgRUsjgEeXwRZ5bdXSiGVq3bXGNnnrw+hnEH9QIZKsG
         azUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039459; x=1763644259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRTlfmcA5G3RNmazWc6q+mJMqfQXqWOCzTyBT64u9rM=;
        b=cTu4LcLhl+kA6rF/rNXU6ZzWrDAmT4dfTPC2JYaQ8GQobjO05r6hayBjec2myx2QzH
         u8SDC6Q4nOYpwrHhZidzKSOX+7UwPDPiVueN6rfbDRYBKkjYViHfEOVHTpv5ifaQvHSc
         JxKp0I8FjGWTlx4cbCjcnesi58oegMSEIIdvtkxGjeuUa9t+qoALi+dbXjrRrlmhcnbY
         3Vz4rwjfCz6cc3h1jcERBvx5o8WyAEJpGYsP5AbI0ZjeeC+mAIPPijdL3WILMZoE7h7T
         1YXF6v7dCiXsaNrbTk5plNwtt8pskU4DUYbDhw+zYJYy29nlBYZoAkU7ea7uelE+L1Jk
         2kcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBNksxHnVOTteiHNqLJhtAZ0dVdIzQWNAiW/wubo8aWHrX7mNn4dLjsh3w+8MhyKPeYtyh61dWHumL9wxInd6S@lists.infradead.org
X-Gm-Message-State: AOJu0Yye4GcZdHw4swo4TUplOUIS8zXurM/wewQ3dA8HCUX0Xyiwj6AN
	W0v4WTY6yvTGfbIKqi1flG3/Ac57B44ObzFojipTq/2yrIoXw3+uS1faQz3V0oF7vpQ0EEPKbOT
	gmBT5+cV3JWt2GKGitQLwMBW6M+++XPCvZk82RR0VrjugJgSOg20ks1ACPdGa7CFKUnLQ9Sd5K0
	KgBg==
X-Gm-Gg: ASbGncuLWhqZ3f9hn+TKqnRlelIHLgqe9hwP2TwxYbiXLSWF9T5lG3nVjGIAJUaW69k
	wwbDV6/d/WGx+iAplLNmAMLWM8FMlYb9I7RvAs/UgjGY+zqsjK+4r8qgeg+LTuq+RftA2S598tX
	P0MhLyjJp8AUcETVzM1HI0Yds1dILbmrN0qpE8fd1QOPzMCcqZ61PmUZMZvhfvJAM4pg46ch4Gq
	3eTFU0Nv6Jw1MmHbzW5aee9JS0ZlqYTzlAQ+3gOxk9wkZPBMp49u6Zk8ulTO5aMzZw7p4h3qku/
	NyEcrOrVb7AKVa3af/L7B2PsleMiItLBPnUJsemrSKTwDdVaulZgOxAOuwvNd5/IJGnVz/OCc8o
	rxEiP4EjevV++I4NFXp3FZCfdkAvOXVU14YsBlZZlnVKPAKwWQMPkt6Ee
X-Received: by 2002:a05:622a:316:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4eddbc3b368mr66675591cf.3.1763039458831;
        Thu, 13 Nov 2025 05:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFubAqHtUuJnDF+wjB0W9VlEiOIp1rA9oYXxjeZ4nxOglG6BzzsPMTiYzTMIQ8sTZ3z4gCpOw==
X-Received: by 2002:a05:622a:316:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4eddbc3b368mr66675131cf.3.1763039458247;
        Thu, 13 Nov 2025 05:10:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a498102sm1451965a12.24.2025.11.13.05.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:10:57 -0800 (PST)
Message-ID: <2a42b980-c037-4b08-85a0-07f5ca8dcc1e@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to
 catalogue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
 <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
 <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
 <kwf62e5l5n4pwfmetvhicupj7r6ow46dnlkkluyhl7s5wuazpw@q7vbdi7d6ul3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <kwf62e5l5n4pwfmetvhicupj7r6ow46dnlkkluyhl7s5wuazpw@q7vbdi7d6ul3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cWwwNHW8a8rwmxE_jiJxwBfkEeY5dGzg
X-Proofpoint-ORIG-GUID: cWwwNHW8a8rwmxE_jiJxwBfkEeY5dGzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5OSBTYWx0ZWRfXyo2c44+E9pj2
 cR6t64CP9ezSO2nPDw4SvSDZFb5hRIX+XQ7UMiZObXfV58heFU6JSqdTGJIo12V6J7vpvVggncX
 CfQcdxx+YqzVOPBc8oSBRB+9DprxjsGFXIs0vh7TLInS07bRuJn9f/BTKNCXtBuSBnzW02qvNY/
 W2Xzg42b6IBfPplr8q1z2siOrVCfBiBGGQx3jAyZvZGHj6iNJjd+PB8FnWkQ5gvHxrK6JlEHKTl
 SkB+Xg39qXD/GXxwCESgy5/5sEtHHD4qyumKalqbNXxfL4ptgERNVdhFIn2bDBaveUMv5yJivOX
 7y1wlVrIzCJhxVyfPR/0jpvuCzKrNEkHJqBiK2wMIR5pRG4Fs/csoM72jUZBjl1Vk3CB6iG8AwV
 qfTMYUWvf23qIv6FloNMAJPhUHZXpw==
X-Authority-Analysis: v=2.4 cv=QZNrf8bv c=1 sm=1 tr=0 ts=6915d8e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WG-851GjljAyzOMNImgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_051100_709825_36996AFD 
X-CRM114-Status: GOOD (  16.55  )
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

On 11/13/25 1:22 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 10:27:09AM +0100, Konrad Dybcio wrote:
>> On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
>>> On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
>>>> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
>>>>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>>>>>> In A6x family (which is a pretty big one), there are separate
>>>>>> adreno_func definitions for each sub-generations. To streamline the
>>>>>> identification of the correct struct for a gpu, move it to the
>>>>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> index 44df6410bce1..9007a0e82a59 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>>>>
>>>>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
>>>>
>>>> Could you point me to the holi's devicetree? Currently I see only a610
>>>> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
>>>
>>> I don't think upstream was ported to SM4350. SM6375 should need the same
>>> hook, but I don't know why Konrad didn't enable GPU on that platform.
>>
>> I'll try to fire up -next and confirm it hasn't bitrotten.
> 
> Maybe then a patch to enable it too?

I was hoping this would be implicitly obvious

Konrad

