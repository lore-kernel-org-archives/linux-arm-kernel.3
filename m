Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00159CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouZiG8FF8rCLx+8FqKvK99eWw/YkoBy6dG2bF+fQFWQ=; b=3RzlNBa+6CeuTcG8CzmYBP3WLM
	xSacbKEKgKRuI/pPCzIgTNu6rnz+rBXg+0y3tveVbssyyE5I3Jg5/ee6f2Jko5MrmQmSKWktFExbl
	ODPV8ujwi2r6x4rTUlhhEczbYkWppI6MzeoqGf3YtMMsg6JLLKQzwWyTFil2yIoimblHDcE1Ol68m
	WDxFW+5ZKbWGCbR+yTu/ZchSY2KaVGcZfNsT2A2qYkd/gVdFO3inBukGlxuts6QJa427EWy27/tTC
	Jo4HQf/A+eL1fL4QG/wButom/l0hJoED++YrTq15I/ZCM+33X9NQWfqxgSyPVkRLrjS8BVsqrsmc5
	FaUKLuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZy0-0000000GRKR-2xbm;
	Thu, 27 Nov 2025 11:15:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZxx-0000000GRJV-2hLY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:15:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9JD9T1667742
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 11:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouZiG8FF8rCLx+8FqKvK99eWw/YkoBy6dG2bF+fQFWQ=; b=eEy8uYLcZqem5tvu
	3mkyJNaz7g5++SkXoqbmRQ1yLo1V0l7qNknXu+57tZzpW1kVjB1Ii74VJfbg4nMW
	hLOpiQLrNwin4CADnFkxz4WRDnogZ8IHpexd4EdZW1W7AZ8TcVn9R+Ir3JNE1QL1
	9rVeplvk5WZuH7Mf1nDWHGjmRCWSxJIxtNR1PremE2LW+FT2ZZonyPYqU0DE7Y2B
	YgmYUjsafFQN+t4tdu5oSSXO9VZjRWQEAjvtRfL6YvOOobwr1FzQJzYZsDa2ecOw
	Fv4pxSxVDE4y/g0H8osFl65cxLNreAKKo9nmkVaDeE9SEpEiB6Uh6kUzEZ5evbCE
	Xlnz7A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmukmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 11:15:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7baaf371585so1112087b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 03:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764242111; x=1764846911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ouZiG8FF8rCLx+8FqKvK99eWw/YkoBy6dG2bF+fQFWQ=;
        b=Oj3PHIBqyLubF5hdrzZKOeU8v0ntu5VsNdqrBTdV4Dk1gnb1WKQcGawrFUntEWnd1B
         3rUyzxgtWcJU6V/uLeQGb9m41fmO0OAGDsa4ohjoFkt7hLcHqAGqYPn8cjIRiB/L2Bj4
         y4MpQoS2dnHgPuOEwVfK69xpgWihEipl3eCAzevTH4qm2L87lHW7UasRITWTSE27jhth
         YUHY5IPGUGQQYm9sRx7iWCNHvySgo391k0W/gQIqTGzE2Mr8wt+Xa7mh0WTYKqW7X1z4
         PZV68GC+quuyjVEdhuK01CgNZkj0gBG4rx2gKUkbDAItgr21H6IWY7poxaKSuzm0I/1R
         EoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764242111; x=1764846911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouZiG8FF8rCLx+8FqKvK99eWw/YkoBy6dG2bF+fQFWQ=;
        b=ASchuhxAZlE5NWKFOPp8iVgZZHvXy/+udh4mwsZczNlYkypMdbbJXJXqK4EkJ/1Whb
         lo0+dxjchZHcCIHbuUV3wf5NPxth6bQP+sVOOd8mvN4cGMMLxGZa6Onr+rI1Sms19xks
         a6GmSW71Uw2CcJnCJUMHmQEiYKBcdUj66Nrs2yMB2DARQDfk4nga8xbOGwj6wlMoX28B
         4GcJ9Wtn4bL/oUwHg2nIZzZAOGqlWbNITSbftPCBmqp5i+r7RryDZXlGNHbY5fybLr6Y
         KLLtv29ycGRz8GjmBI+mpLPjoG4pmAWYqXj7iYJc8yTohspFFDiiDS55DcN/XwCF21cf
         eP3g==
X-Forwarded-Encrypted: i=1; AJvYcCWRGcHKnnBcPboegYrGQqrsI7ocQGrKYkCOji9l022HXSa8+LgeTcUUXVga/Ac8pMI/cD/a3wlLyAubnaJ9aERm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx79kIDbguklVXDt/ZNdT+9Jd5zRoyIcOSiGjxsSVKCE3seUqVU
	TVQie2Z6Vns70bndroatJAQwgXtiM98wmxmm5Fcs5N1OrBAoMy1qyPLwVpOZmXA22aKDIjZ7Zap
	DWfsPimzpPrSS2Rlzgz8aGsZ0W3alrkDHa9QYWw5zccVQ+kRxrdbK9SdiXOaIRWcU55oF5cF7aI
	BANw==
X-Gm-Gg: ASbGnctK3s0AEqWuA7QasLqiV/EWMjO47+bgb6IOUnszQdCxW3a4IsHyDXl88qYj58j
	RBcdxz4WK5jrnCTpzhPP0soK6d4HT+XdkQVtFQ1x6BzPPm7JjMdNlpdubpotxR1JFu0Fbsjuclu
	ltfMcftgbabkiVn+ZsG21ySTos303xCLnhN34sUmWeMnwgSBykwxc4PAQwiyoMFdUtxcuZ8VJNu
	WoQrQDvxuE+NzzwcsKa/sa6S8eemd0p277rHh1xl5GfhbPyvWKNVcqqj0Eh6HwR7/A7Fr8iTN6y
	9CsuCbFnk1wCdGxLYc7TbvOukzV6Gyq0osKz7jvNNrt1w2fL/bJw6vjwES9ZoGEZbzfc1T6FNuV
	h+jEEoZYmrnvbuWqsJFkR04cn8/UP2rMg8Uvo
X-Received: by 2002:a05:6a21:328f:b0:263:616e:b61d with SMTP id adf61e73a8af0-3613e56b300mr28425909637.23.1764242110678;
        Thu, 27 Nov 2025 03:15:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQMpXZfz/1tQ1M+zSZqz12+vq3ETE0Igc96Qyd9T1FJRvajJ/vF8AzDuqyu15xoKFLcakbBA==
X-Received: by 2002:a05:6a21:328f:b0:263:616e:b61d with SMTP id adf61e73a8af0-3613e56b300mr28425872637.23.1764242110078;
        Thu, 27 Nov 2025 03:15:10 -0800 (PST)
Received: from [10.218.29.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbde37d7sm1671813a12.13.2025.11.27.03.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:15:09 -0800 (PST)
Message-ID: <9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 16:44:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
 <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
 <02d7c0a9-0d24-4fd8-980a-da9d7307588a@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <02d7c0a9-0d24-4fd8-980a-da9d7307588a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=692832bf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=j0LsKdlxD3o4FQvCk1AA:9 a=UnacWq3ggp9slQcj:21 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MiBTYWx0ZWRfX9dWQO1EWBPT5
 TZhor5IQ2Ywesu6YF/0HxAc0ZNsjyBLiXlvpemlVgCC+aVIsxaUVbZKbKwFiMxER4nsndzAB6S+
 H93qtmHSqkvz43Czsm5W4Sz9c2EMoafZ6gMv2luiqva1V8zyN/HPayvFURTiPUYa1cgcakjj/nS
 LNQsQg1bOE3OncJQLtrpNHB+QSvvSsmq12jmjfwXGbIyXkjsnjxZuSckUYNiVE11wko9Bvx421+
 WcVSYxe/PSyiiEEFZX1xmGlaLZSZfhDHo3/2hsPim0QedWiCxGWcRc/111bfmG2Sq24DFsVHsjA
 quo/jfnkhcKfToNwSy9J091XDbUdmWzNiL4+ztPNSTGAmlxqgqvADtjlEzGENV34qelw0I/Bl14
 LxunO/uLFWVBKlkzDqFcNQFUkl33Lg==
X-Proofpoint-GUID: 650bn2CXSI0WE47fJ8DwZ8thtiGPPWSR
X-Proofpoint-ORIG-GUID: 650bn2CXSI0WE47fJ8DwZ8thtiGPPWSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_031513_734937_B77CC9FA 
X-CRM114-Status: GOOD (  23.82  )
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



On 11/12/2025 7:32 PM, Konrad Dybcio wrote:
> On 11/11/25 3:02 PM, Charan Teja Kalla wrote:
>>
>>
>> On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>>>> +	{ .compatible = "qcom,fastrpc-compute-cb",
>>>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>> This will be globally applied to all smmu-v2 targets with fastrpc,
>>> starting from MSM8996 ending at Kaanapali and everything inbetween
>>>
>>> Are these settings always valid?
>> Oops, you are correct...this settings are not always applicable it seems.
>>
>> Example: lpass compute and cdsp compute node uses the
>> "qcom,fastrpc-compute-cb", but it is for the later that ACTLR settings
>> are valid.
>>
>> Then for these cases, should we be extending the actlr match array with
>> additional compatible string and then add them in all the device nodes
>> that require actlr setting? example:
>>
>> @@ -3119,7 +3119,8 @@ fastrpc {
>>        compute-cb@1 {
>> -         compatible = "qcom,fastrpc-compute-cb";
>> +         compatible = "qcom,fastrpc-compute-cb",
>> +                      "qcom,fastrpc-compute-cb-actlr";
> 
> dt-bindings (and especially compatible strings) must not be altered solely
> to work around a driver being suboptimal
> 
> But because you reported that these settings can change both between
> platforms and instances of the same devices on these platforms, we could
> possibly reconsider adding ACTRL settings to the consumer device nodes
> where they stray away from the otherwise seemingly reasonable baseline
> we have in the driver so far..
> 

During initial discussion of ACTLR design phase, It was concluded that
prefetch alike QoS settings are not hardware definitions, and device
tree would not be the right place to store such configurable/tunable
settings [1]. So it might be contradicting to add it in consumer nodes.

For fastrpc client, there are 2 hiccups:
1. For a particular SoC, Different SIDs of compute client are using the
    same compatible  "qcom,fastrpc-compute-cb" but can have different
    prefetch settings <refer table below> e.g. CDSP and ADSP have same
    compat string "qcom,fastrpc-compute-cb" with different labels.

e.g.
fastrpc {
         compatible = "qcom,fastrpc";
         qcom,glink-channels = "fastrpcglink-apps-dsp";
         label = "adsp"; /*---different label: adsp---*/
         compute-cb@3 {
                 compatible = "qcom,fastrpc-compute-cb";
                 reg = <3>;
		/*---Prefetch Default---*/
                 iommus = <&apps_smmu 0x1003 0x80>,
                          <&apps_smmu 0x1063 0x0>;
                 dma-coherent;
fastrpc {
         compatible = "qcom,fastrpc";
         qcom,glink-channels = "fastrpcglink-apps-dsp";
         label = "cdsp"; /*---Different Label: cdsp---*/
         qcom,non-secure-domain;
         #address-cells = <1>;
         #size-cells = <0>;
         compute-cb@1 {
                 compatible = "qcom,fastrpc-compute-cb";
                 reg = <1>;
		/*---Prefetch DEEP----*/
                 iommus = <&apps_smmu 0x1961 0x0>,
                          <&apps_smmu 0x0c01 0x20>,
                          <&apps_smmu 0x19c1 0x10>;

2. Different SoCs having the same compatible string and same label but
    different prefetch settings.
    e.g:
    in below table sm6550, sm8250 and sm8550
    compat string = "qcom,fastrpc-compute-cb" and label = "cdsp"
    but prefetch settings are different

As per my idea both the above cases could be resolved by compat string 
addition,
case 1 : compatible = "qcom,fastrpc-compute-cb-cdsp";
case 2 : compatible = "qcom,sm8550-fastrpc-compute-cb-cdsp"

This discrpeancy is not applicable for other clients, except fastrpc.
One way both the above cases could be resolved by additional fastrpc
compat string with below format:
compatible = "qcom,<soc_name>-fastrpc-compute-cb-<label_name>"

e.g: "qcom,sm8550-fastrpc-compute-cb-cdsp", 
"qcom,sm6550-fastrpc-compute-cb-adsp"

This should handle both case 1 & case 2.

But as you mentioned previously this might need change alteration of DT 
bindings addition which might not be allowed or favoured always.

[1]: 
https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/

> Or we could introduce some more bespoke matching logic.
> 
> I would like to know more about the scope of this issue, i.e. the matrix
> of (soc, device, actlr_val) that needs special handling.
> 

+---------+-----------------------------------------------+----------+
| SoC     | Description                                   | Prefetch |
+---------+-----------------------------------------------+----------+
| sc7180  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sc7280  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm6115  | qcom,fastrpc-compute-cb | label = cdsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm6125  | qcom,fastrpc-compute-cb (NA upstream)         |          |
+---------+-----------------------------------------------+----------+
| sm6350  | qcom,fastrpc-compute-cb | label = cdsp        | SHALLOW  |
|         | qcom,fastrpc-compute-cb | label = adsp        | SHALLOW  |
+---------+-----------------------------------------------+----------+
| sm8250  | qcom,fastrpc-compute-cb | label = cdsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm8350  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm8450  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm8550  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm8650  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+

Thanks & regards,
Bibek

> Konrad


