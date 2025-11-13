Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D38ACD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=; b=Emmf5zkGhAlTtquw0p5VgSStfe
	9w8ltHSc56tku03BAC7iJwxA9PeU2L80Pm+WpfCexPFzSjoAyd8f0ggBS8ZO/h8joKHPEKv9mEnJh
	jdekqOalDcABZ9iJSsePxXJbtOnP1R8e7iDcjC6m+uFK8hCLqBjOhTLC1nxQeWg1otxnuF3eFDTJ/
	Es4VjG/+QPZiTUHIiuM6HGTzoLmUeoNDlekmGcKMz00MsDZBVDC49ODzkAwTrsKoCR5agise5rNWp
	ri+WFsAjwL1vSNyAfPgOCrku7dHXBjQOIQtb9Mguqz6BFS7xisB6CQPvMFhelAYn6Cb8HHN/cvr0W
	8HxyEQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTbs-0000000ABfQ-0A4f;
	Thu, 13 Nov 2025 09:27:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTbp-0000000ABe8-11ID
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:27:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD4wZum3336785
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=; b=DZ2znY/dexHHqMHq
	9UkWyfkyA6sxniXfSVzQ3mjIGhqO9rwCQKTW75wPB3nlkpUsS0OtYu8UxJQXenRk
	pcC/7jHqrzkDz1W3+4SVTQy5RvEhR1a1BLews3b1dTMnuu5k0dQ020YVVJy2DVN5
	sZMi3oF9NrfocKv5ItoZdY74rweVMQxLL2DnVYQHV/b9nofgv98w5BqsQjFYHz4L
	iDylQbuQi84kF6BdGMY6P+BalSzQ5+T0zJ6ubsI91moQLfbQiSMla/AmjbyqcdGf
	5NG/PtPFaRkLM+oxZm3TV4c2B5cWISuXHS5uwwv0W++sQfpde37Bk9ymdiBQgomD
	05IFsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad8sa0ts1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:27:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8906754b823so20869885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 01:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763026035; x=1763630835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=;
        b=bRh6vysMXEOMcsfM8QDRzizUmULTNWOBn14LW/LY37TX5Q2U4D4k/eRvtHBb+dymIE
         mAeQYc62Wz5q2qDcQlLSkfJUidp5fLHeAIY78HY8Xk4Q9fnRJKNSvo2KIuZRXM5M/Saw
         VmipY+PKr++ZN2Nt0AnKJxwLsGtQY5Grk8o+5uF1dMpip+CCI+FsjalscJf/HIoqc+s9
         bU2MUCDwO1QW2Vh4aoJMk0IWwq8eIUwlZ3+e8uqUHOMnAoOvVLhwlpIHYTwc0cPu9gnE
         bo/YZB38mYjCQiVrt4yk/pvRtajCJQ6PPzjW2RDhcNxGdBXwqTbYSwc10XxyyN5Q6BO8
         oAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026035; x=1763630835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=;
        b=DD+p/LGfXv5lmj+derHhUbz7bHVabQjlJzyEmIshuYrh/tWIP62GS0JbAauGoGYa6U
         9EAsDdd+g2NOSZB++tlcnOS/gsyYWO6gWGXHcnfOTbcgouMKbhsBUx2eGNv3wDzlWFrb
         vRB3gWLwXHZPQlo3Oo8rflviZ0CRLoe2USTMqw2CMV3fnTjIBQiGylgvv+AJ4ObWFe3K
         +Rc0c2fdnXU6YUBa0UzywHPmCBI7n8EVQVWbLPnVIrL2zUJSSubv9XaecofhOJFSJVPa
         YVY2U2VUgVmebmeZZAb/G7BIIPID3dIKkqTm63PFaiKgFIkMP0ubUBMWM3CAGGwkfbAG
         kR5w==
X-Forwarded-Encrypted: i=1; AJvYcCXAUeo40iOMTmCsapuw0076atVbuhQFUZi27XNjvbCO9B+maxFwNYRWljhggelMJdoqLSOcZeRAwsa8H/3Y+0Cv@lists.infradead.org
X-Gm-Message-State: AOJu0YzI1dVUErfBGQKwJIc7suNI5w2EKEqWXSUDZRahEmgIUI59Ep9b
	FBJ+1uVAB/eQGnQdkfTKycrXj1i7uPMPdKqj92GXUK1UlwOowRK8hQdoNmvqEOCsUa0UscYZHKy
	XzpKy6d9plxbqpWPflax0E/imDYoB6fSWqQ5NXCUsPEp950YQ61HzCpb27JYGwi0yNQBUFphaWU
	LYhw==
X-Gm-Gg: ASbGncsXutdJY6l+FDWh0ckDtjL71dioxK2NyglJAU7llL8rXQpCuqkL7lBWwCCYvKV
	jrXh41bLC61h3z2OL96GHwfEW9VCESXtH65m7ukzTi79NyYg1Z14Zz9+VIgbCi3+lwAoiJmmL1v
	poj6aSVGmR4UUVV5qpNwsJhUTvxnQJaa4X9SmZeper+PqmPf8kJJUiwkgBwhBndKcfytsuwHH3S
	L08OOeDMuXcBLCR1Ej4VPmy9nfn6ewnEEloQ8jGClsdKZ0p078Z9H//UcnMu1POU1Fmc00A35hF
	W+FqZiOUWqhRzo8OBf5oz3XB8UNDlHkgnYtsSdL6n5NU+Gpu0MISUyVDer8tH87vFP9UDgq3b4J
	wUtUq6bc6t3GdoJsnfUA/+7hw7ra/Tbbatw1kPqajQxUKgbZJsNOTohx7
X-Received: by 2002:ac8:57d6:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4eddbd957bemr55093331cf.11.1763026034636;
        Thu, 13 Nov 2025 01:27:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoZxoEy/JmKlmxIOPZpqL8nflJ1JnawU4oD4ovv9bKA6hPgIGxSwD69qSzkbCaaUf89Ywfyg==
X-Received: by 2002:ac8:57d6:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4eddbd957bemr55092921cf.11.1763026034164;
        Thu, 13 Nov 2025 01:27:14 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm1028106a12.34.2025.11.13.01.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:27:13 -0800 (PST)
Message-ID: <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to
 catalogue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qNmJYkXBMb6FW1Svc999wzmckCTnnrNu
X-Proofpoint-ORIG-GUID: qNmJYkXBMb6FW1Svc999wzmckCTnnrNu
X-Authority-Analysis: v=2.4 cv=dcGNHHXe c=1 sm=1 tr=0 ts=6915a473 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pBDOg7y053Z06RvWvLkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OCBTYWx0ZWRfX08wdnaA31K93
 oS5OVFGsKC248ixyOqlIUf2d/36WGDUMQIWObb6CA4UOD5hol+QHT0X9OwjOckwu9FmD+I3pMch
 wTcvLsUrnDtMOCaEoXTdahCVm0Ce1ODH8oA12w2eQvJ2TCPNWbxj54UsogJ8PMAQh0sROl06xa/
 x8RpK/GBJFEnnZYAGNO8TJq63HxASkNf0XIhrbJRLPGFxmbsCvuuLsq6X+OJlDKtIq7hJnV3os4
 wU8KuMUaj+dGYPsw+8DxtQzd0oglncGBNkfP0udby2XgDXMpUiJ7YYWrdRKg7qQ3SanM6T7Pjhr
 J+T4+68q3seROc9OtIS1cXI5hh2/Q98+faI7atmCnn5r3HV4S2UPLM0m5QK3GH7qEWvU1nm0wGh
 LdJNhDISxj2tDk98Dmj1fwWZ2aAVag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_012717_410942_71EB3076 
X-CRM114-Status: GOOD (  16.17  )
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

On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
>> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
>>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>>>> In A6x family (which is a pretty big one), there are separate
>>>> adreno_func definitions for each sub-generations. To streamline the
>>>> identification of the correct struct for a gpu, move it to the
>>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 44df6410bce1..9007a0e82a59 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>>
>>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
>>
>> Could you point me to the holi's devicetree? Currently I see only a610
>> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
> 
> I don't think upstream was ported to SM4350. SM6375 should need the same
> hook, but I don't know why Konrad didn't enable GPU on that platform.

I'll try to fire up -next and confirm it hasn't bitrotten.

Konrad

