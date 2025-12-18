Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86BCD6ACF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vm/z6fYkdn2JoQ1TCNbeRy8mA7MaOc+Zg3cU+fK6UQ=; b=aiucYuGfoSjL6OKIqXpsUKuSEU
	Z3rS9/NlX/RE0/MhL6MiyWUhPaXSfaA3a7BX4RRNAEip1RsDYggcEf1KxEpAepIc9CiO8ETdcfJyK
	nKrXDivhfBC2UrV9dp6plCKBJVcZyuH++kHFqT8PWPgakXZ7r/9De1Y951ZDmO9WBIxcwFbySLHvx
	043ibSqRn3t9PHNNt4DiMQyMwcrxwku838N2NAztIi+PiC4ZBh3xd5Czr857KF2Ze/Qshy0DMg8XU
	OWfBMzaZxciW4DyhZfHr2GmMK+3L2tx5v5Jl1AFh8DQRnKzlkJwZ/dvDmYNmC4DIhQUIezZit45UG
	UoFbXufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCiO-00000008OXG-1hQp;
	Thu, 18 Dec 2025 12:02:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCiL-00000008OWF-3CPN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:02:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI92SeY4189705
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 12:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vm/z6fYkdn2JoQ1TCNbeRy8mA7MaOc+Zg3cU+fK6UQ=; b=M4WcPmKsynq44HVC
	qzwxdxeLGtbtTx1v/L+iPu6krGaUVsWAcZ9heSuRjf9xH1wFTZvmq+ePxfbt6u/V
	TFipIrcMZAKSxIX7MSGivPRmU3KdGVMA90JM5BnlClmFPp21i9eO4BJzWYsFZHKS
	zRd3JloQxr1R9Y4/4717fOUj9Yu1zB8Qr7oTID3BqNWWjx1fV7IS0HFSDZtWDiqy
	pt7+sCmCDXOo9KwYVwBBl/43tMcSNN1Vp67W334a293BpHEEv2akCZwSTE74I/iH
	ilxOE9jd0G2s8KH+sPrX1uDyhwNNTEu91eVJTsZuA/rPlU1Oo4wYZGQoiP4ZOIt0
	+ZVB/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkhvbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 12:02:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f3564e2321so218931cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 04:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766059356; x=1766664156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Vm/z6fYkdn2JoQ1TCNbeRy8mA7MaOc+Zg3cU+fK6UQ=;
        b=iNyALt40evOnYh8svHsnypjD3SGXKSH/c11wxVjro97Kt6wJutwgbxY8maiC0HsMby
         xBodxMc252RaT3DD/aUWR6AkYXcp05143hSzdn0xc7EwjQ75Lqa+cUeksHA6QkeToy5w
         tpMdOKxsqSGx4+KX7ENr3gchJcqzjFxf9QEAL60OiW/YR5pu5gH+ZEkNHuabHNXEQSDd
         DQo+vjLsWOSMD0J4WFpttVyR7iKIMV4GIvthkVWRO4giX8IB2ZdTtxuBhOA94w9DP04F
         vF6NrjvvLMBO5zm9NNWcrz6JCJg1gkQtx+zSxkBXgUDZkP+/Hg54ZKnUqDYN0ZFcOyMa
         qT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059356; x=1766664156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Vm/z6fYkdn2JoQ1TCNbeRy8mA7MaOc+Zg3cU+fK6UQ=;
        b=E1ivPHltWHQzOeVHu+YxOvWIHlNYA6BLP9GI13WO5bonLFl3b+6/n8TpT0u+L9zxV3
         kq7tp+EjWErQbg7xMHmbeSpBNkZ8qSEsbEje0MYQxTy+Kv5sGfcoRV7V95wzdVhueLB2
         7Ury5KMSgGhr5ncdeQ4A39v7Ei0MWsBIdVI29vtf/XTpyFawM/MqDffirT3qO0MYrYx2
         Yn8FlpzBIFFbjIPA31ujK8Csxp0mwIb8ueaeM4gIysq9WJ3V3BFiKaxbXyHaa+OZjDiA
         QJ7SmbEoJTw03Wi2h96T+9JZLZV4zRWTrxajfW8f2yhiUxXZvqoqhBnCm+6jtZoMr7rM
         h2yg==
X-Forwarded-Encrypted: i=1; AJvYcCWBbHBKlqsYUBKwYXwou8W3yUJTULK+XgHy47e5MTSIpt9tQqcXzXzEeDaupfYeCL8ivjesoWJikm8qGj/Xushu@lists.infradead.org
X-Gm-Message-State: AOJu0YyFmsrdwTSOphcOmZ9XHbYa5VnihbrEFWfy3Ks4rKam/KO4j8qs
	8H+9yxvK1SAvOmMsX7f+p5HYc5Uh047JKuvyhRIjfJ4CHnnwSa+xw4K8lOeWXLfeqOvaFQGLxqD
	wDritGyDCE/Mpt4kzv+TppyDHrGoYgZrL9BPg/EG48kN0zdJfH3CsUb7IDyjau8fPpQyVVyhU7a
	k4iA==
X-Gm-Gg: AY/fxX4tUgmzdfhXHZobxkteHbcg1Wqr+h64Q14OYN7vmwrV2rpFF+xNIE3SQqa9GxA
	kcrg3DR4XcQ+qx+JOi6aAwb3IANS1w400Geo5TdxpSuuPQoLpVP4x3nD2ZEa+REUKxlteNb8WjW
	0YFiD+YNfzNhWV5lo9/jFN5cblEVL0ZJt7Nwz2aQDT+qKvDkIazEHEKvZnh9NGXIYo1V++jmTNm
	0LblSNUTXlZhKk7pgh4bjf+knPt6XKWszSx58MIAyPJscx8NLCnTHWiGuD9SDV0K0pvjG6LhbvN
	ylSvaEmeHbwvx5/cBYtrrDcXe293X1SAAccFB60AEPiV73k79CqBTcd5Ab4AbPwEmrJPaaWDDfz
	hk+K4duDl3sP6596ikmOnVmgSYrpkzXLCdoEexvsG+jIavjxr3rNA59IEwGDrCiMF2A==
X-Received: by 2002:ac8:7e84:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f36103f922mr18008271cf.2.1766059355746;
        Thu, 18 Dec 2025 04:02:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEjKaCrErxWCAcr66bGBT8jNIruLZAk0ai2nWX7kimbI6AaPHvw4PWGXD/l8FGMsK0GDByDA==
X-Received: by 2002:ac8:7e84:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f36103f922mr18007551cf.2.1766059355003;
        Thu, 18 Dec 2025 04:02:35 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8023466d66sm204110166b.34.2025.12.18.04.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:02:34 -0800 (PST)
Message-ID: <bfdb1125-3dcc-496e-8380-80ba669dfe20@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
 <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
 <02d7c0a9-0d24-4fd8-980a-da9d7307588a@oss.qualcomm.com>
 <9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9wx6T9WQj0XRg7q-Cn9mtEqm686ZCdnt
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6943ed5d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=Y1-X-kz94dDufzMKMX0A:9 a=UnacWq3ggp9slQcj:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5OSBTYWx0ZWRfX4EzxhwNkeUOA
 3Q9TGovWapGWbJhtfkUzjOVTzfbwh0+hzWJOq4s+Kfl8h2vP4PyO5vgJxPnih/1ZEKZ6sfud3CL
 phg6xEo2AQKk7AWu/5719OeRRKs5QQeeINxz5JuWWMfVOiiZWNGC9nLeqw0aGyBBwkoZ3dgIQqx
 R1wU8EJQKOregz7xi4oAJIIO6nHc32rFSuLFN07nRWzznpZVvBGDlnlxOBnPSJLtoeLIjXlvqi8
 D0Abk6LwxUbr4DE58v8rSAtpW+ASStFrqzFeVWP4FI7nXfTsxlZl8DG2NqfZl+HhgRgWEN9WCqm
 O0+7BKeeLpbVwHNAbpPBZA10HGYocdZKbHXEQiwFxQQuMDO45mMDQdM5ccPkRxXKAUN68FXIjbI
 XB0wKLX5orv1MaID9QqSTJdh7x32hA==
X-Proofpoint-GUID: 9wx6T9WQj0XRg7q-Cn9mtEqm686ZCdnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_040237_817604_56024C79 
X-CRM114-Status: GOOD (  30.42  )
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

On 11/27/25 12:14 PM, Bibek Kumar Patro wrote:
> 
> 
> On 11/12/2025 7:32 PM, Konrad Dybcio wrote:
>> On 11/11/25 3:02 PM, Charan Teja Kalla wrote:
>>>
>>>
>>> On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>>>>> +    { .compatible = "qcom,fastrpc-compute-cb",
>>>>> +            .data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>>> This will be globally applied to all smmu-v2 targets with fastrpc,
>>>> starting from MSM8996 ending at Kaanapali and everything inbetween
>>>>
>>>> Are these settings always valid?
>>> Oops, you are correct...this settings are not always applicable it seems.
>>>
>>> Example: lpass compute and cdsp compute node uses the
>>> "qcom,fastrpc-compute-cb", but it is for the later that ACTLR settings
>>> are valid.
>>>
>>> Then for these cases, should we be extending the actlr match array with
>>> additional compatible string and then add them in all the device nodes
>>> that require actlr setting? example:
>>>
>>> @@ -3119,7 +3119,8 @@ fastrpc {
>>>        compute-cb@1 {
>>> -         compatible = "qcom,fastrpc-compute-cb";
>>> +         compatible = "qcom,fastrpc-compute-cb",
>>> +                      "qcom,fastrpc-compute-cb-actlr";
>>
>> dt-bindings (and especially compatible strings) must not be altered solely
>> to work around a driver being suboptimal
>>
>> But because you reported that these settings can change both between
>> platforms and instances of the same devices on these platforms, we could
>> possibly reconsider adding ACTRL settings to the consumer device nodes
>> where they stray away from the otherwise seemingly reasonable baseline
>> we have in the driver so far..
>>
> 
> During initial discussion of ACTLR design phase, It was concluded that
> prefetch alike QoS settings are not hardware definitions, and device
> tree would not be the right place to store such configurable/tunable
> settings [1]. So it might be contradicting to add it in consumer nodes.
> 
> For fastrpc client, there are 2 hiccups:
> 1. For a particular SoC, Different SIDs of compute client are using the
>    same compatible  "qcom,fastrpc-compute-cb" but can have different
>    prefetch settings <refer table below> e.g. CDSP and ADSP have same
>    compat string "qcom,fastrpc-compute-cb" with different labels.
> 
> e.g.
> fastrpc {
>         compatible = "qcom,fastrpc";
>         qcom,glink-channels = "fastrpcglink-apps-dsp";
>         label = "adsp"; /*---different label: adsp---*/
>         compute-cb@3 {
>                 compatible = "qcom,fastrpc-compute-cb";
>                 reg = <3>;
>         /*---Prefetch Default---*/
>                 iommus = <&apps_smmu 0x1003 0x80>,
>                          <&apps_smmu 0x1063 0x0>;
>                 dma-coherent;
> fastrpc {
>         compatible = "qcom,fastrpc";
>         qcom,glink-channels = "fastrpcglink-apps-dsp";
>         label = "cdsp"; /*---Different Label: cdsp---*/
>         qcom,non-secure-domain;
>         #address-cells = <1>;
>         #size-cells = <0>;
>         compute-cb@1 {
>                 compatible = "qcom,fastrpc-compute-cb";
>                 reg = <1>;
>         /*---Prefetch DEEP----*/
>                 iommus = <&apps_smmu 0x1961 0x0>,
>                          <&apps_smmu 0x0c01 0x20>,
>                          <&apps_smmu 0x19c1 0x10>;
> 
> 2. Different SoCs having the same compatible string and same label but
>    different prefetch settings.
>    e.g:
>    in below table sm6550, sm8250 and sm8550
>    compat string = "qcom,fastrpc-compute-cb" and label = "cdsp"
>    but prefetch settings are different
> 
> As per my idea both the above cases could be resolved by compat string addition,
> case 1 : compatible = "qcom,fastrpc-compute-cb-cdsp";
> case 2 : compatible = "qcom,sm8550-fastrpc-compute-cb-cdsp"
> 
> This discrpeancy is not applicable for other clients, except fastrpc.
> One way both the above cases could be resolved by additional fastrpc
> compat string with below format:
> compatible = "qcom,<soc_name>-fastrpc-compute-cb-<label_name>"
> 
> e.g: "qcom,sm8550-fastrpc-compute-cb-cdsp", "qcom,sm6550-fastrpc-compute-cb-adsp"
> 
> This should handle both case 1 & case 2.
> 
> But as you mentioned previously this might need change alteration of DT bindings addition which might not be allowed or favoured always.
> 
> [1]: https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/
> 
>> Or we could introduce some more bespoke matching logic.
>>
>> I would like to know more about the scope of this issue, i.e. the matrix
>> of (soc, device, actlr_val) that needs special handling.
>>
> 
> +---------+-----------------------------------------------+----------+
> | SoC     | Description                                   | Prefetch |
> +---------+-----------------------------------------------+----------+
> | sc7180  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sc7280  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm6115  | qcom,fastrpc-compute-cb | label = cdsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm6125  | qcom,fastrpc-compute-cb (NA upstream)         |          |
> +---------+-----------------------------------------------+----------+
> | sm6350  | qcom,fastrpc-compute-cb | label = cdsp        | SHALLOW  |
> |         | qcom,fastrpc-compute-cb | label = adsp        | SHALLOW  |
> +---------+-----------------------------------------------+----------+
> | sm8250  | qcom,fastrpc-compute-cb | label = cdsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm8350  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm8450  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> |         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm8550  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+
> | sm8650  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
> |         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
> +---------+-----------------------------------------------+----------+

Thanks for the detailed explanation. It feel quite impossible to keep
track of all this in the current model.

On the other hand, the approach where a third OF cell is introduced
isn't my favorite thing in the world, and that seems to be the general
sentiment.

FWIW downstream solves this by carrying the list of <sid mask val> under
the SMMU node. Perhaps that could be reconsidered, either as a storage
for all the values, or as storage for non-default overrides.. Krzysztof,
Bjorn, opinions?

Konrad

