Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A3CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6SmD/lRJtpl+jt1dK1UZV6pTcf74vgfYRGz8fZ0E+A=; b=Q8h5JaPjeKttFhcYeCoPq1TPz1
	ZkeNRa4V8HOkCBjK0eS4cC2IT8F4o6JAHacmb+ZXOMl7B17pb3jayJa27kEjA+efjtneH/Y3PDBdi
	KJkQ3d3qgkHRnAoUF2j5GGyykOY4ySNlefov36Hyer6D8YhsOvnEAaV/8/QuKx3qsvJ9yMSXn8k2b
	wNBPyLnZ9tTTen41PesX5PFrh06Y7WCRH4qywHB3Va/IDQ24aP63zEien1ujn22+X1zqEYL/CM4PO
	WRLaqCNQGdd8pet1GKWxRivk66gH35/dpNBfS4mQVydiE2hXqctwUwRuf4XHKnfrgPYBMj9FgJwW4
	9B4HFXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6tk-0000000AlkK-0nqN;
	Thu, 04 Sep 2025 10:08:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5oO-0000000AP5t-0z5r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:59:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840eTdI030324
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Sep 2025 08:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6SmD/lRJtpl+jt1dK1UZV6pTcf74vgfYRGz8fZ0E+A=; b=p1QR0R6FqrKgJvqz
	mH00+D1s/Cm6/E1qDhkfOnY7o/3dFYQBm73kQMw/Y6BVC5Sp7bcq+xo1jXmgz95x
	oCfcGPOS6YNJpAcUQIGIP4l9kmrARXRUQ1qOtUmrZAtc5WWBC5TyBgzpbPjJRipl
	+SyvQnZnaDP7Cv7SOYdTL2Ks/xPmhCSoSIMr/MJqJNpS4OPlV/0IV/mQcc6ViQXx
	8BPzYVGcRDsKwjHN7wwkbN5E2m0TCsT568h4u6RgnHoC7LMdaZeon48q395f2Oq+
	DOG/sbwFmDVQ9112RtUSfVaK3eiBSbfqeXbMb2wtP17qRNitoHvGLhQ8X6SbBldO
	1QbjkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpf18b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 08:59:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24b2336e513so12629855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 01:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976358; x=1757581158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6SmD/lRJtpl+jt1dK1UZV6pTcf74vgfYRGz8fZ0E+A=;
        b=aPu9gPM1497NMl1AA9dvUEhkCOSDg0sUh5hoe0hHjuYcbBxKgE5DILavqkUVOYHa3g
         R7Kbw1KAde0c6iSCiXJQbEHnU8ErhSZOT1PrVNXdWukcQmO+CCuSJNs53GxVglCMO4Sx
         mL0hbBTEO5Gy6xLgcm57XbQmSz4A5T4CbGhc2z7HKYjKj2aQgBfPvEzWWEqW+jTj6zQP
         m45/Sg/6FYsT0XcIPdHk3rvPSD8kul0LJp16KCgc18J0crg4/PbJgFuThj94YD+z2w/b
         Ou7H7byhZM4rksxuaXGDlT777RC4gHO4SpcqaXiwMd5JIlm3gN1AfkCt297q49x/dg/t
         lKIg==
X-Forwarded-Encrypted: i=1; AJvYcCUCPU53gscI5ZdqJCXclcAMtS8NhI63W2StAjZ1smhPMxKBXF0iZsZo9RTi8Bhrm6BdMoALJghVsPSRPJB/sn8E@lists.infradead.org
X-Gm-Message-State: AOJu0YwUZ/hZGT3rhgjsyrvdwLeTNNnb39jeZ/uNjSJwA0MTNEwShODu
	kRhhFcBpP6n2ocHJRufEH41Ze2XPoz6U4OO84NdjzjNSkBrDDR7w05zrKueN6jVJrpyquNX9LtK
	Kp1Pzw9DflVlGytkDuG3vPy8/PoyF7jEgzpqw5n3f2VCx4ACpIbLtXEDS7MHdiYbvAnVbFUjLFn
	LkBg==
X-Gm-Gg: ASbGncv0ctfWpKCUanMRd7WQOItUi7ivNYEYsTNErMpJQeQfifiFQjmeMFq513anLBQ
	nmFQrLZqUQaRn71aZ3i64OBSmol1Eb48KR36oo9BhEQh/8vWcK4SeCZ1Ls1CDOAf03Dx6lvQ81O
	LyblzoRXOFhxAjWmhh610sS5Ril+w9R82Lu9xH03lvylxrSZIabdCsH9hdbBGx1NoPERzFi1FeA
	DE/wy2Q7wvlVqj8iOi3jhUTnDZmV7ljY40miJ6MwKQ4qCNj7a5ggRON2pVG/Ia3ZxLcp/8Xw9Aa
	zVOhZnvZNlBBU7/hXtuyiSm8ZPaffRHs3MxIuXfP+Btk+k9DsNhfJbojgqO94fQ6k1U5Pv4tVuj
	LVgleuc9GDZ90icxKRbPiK381wcOK
X-Received: by 2002:a17:903:2309:b0:248:96f3:408c with SMTP id d9443c01a7336-24944b1cb74mr283245695ad.31.1756976357816;
        Thu, 04 Sep 2025 01:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxWuT4vPU835vv5tJ8tYhEIyfyj+itB0O3M9+Ms4yaueqkNroOnRQHh70sZZFhz9A9lgG84w==
X-Received: by 2002:a17:903:2309:b0:248:96f3:408c with SMTP id d9443c01a7336-24944b1cb74mr283245125ad.31.1756976357320;
        Thu, 04 Sep 2025 01:59:17 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b020a7cb5sm79081045ad.115.2025.09.04.01.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:59:16 -0700 (PDT)
Message-ID: <a2e3bcf2-80c9-4c8b-ad88-bd91c33137b5@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:59:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
 <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
 <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
 <1cef4224-1f0a-4c51-937d-66823a22dec3@oss.qualcomm.com>
 <961258a0-3cc6-4935-a305-80bb2c2c0597@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <961258a0-3cc6-4935-a305-80bb2c2c0597@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B-3RzK36bammHBrdhSY8u2VeWaUBruWf
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b954e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pVyM_Y0qywZFV96uxSUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: B-3RzK36bammHBrdhSY8u2VeWaUBruWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXxP20SrwHDtcJ
 87TuQTnp4xQ9HQr395jPyyB3rMyKW1SEc1QNPGAgmoZLaTSoirEz1lVJfY39Di1LYgDZC8kZ8dc
 HEsQCQcKUO6yq4DrbDi2MEgeTYoVy2xLAJ9j9y5uTlWBjQOPQR2lI32iHENEDDRN3k8vJlEXluQ
 q5DC7Qf4B7WhM0QyYSnZtWJh3QELHh5RI/e/CwdtZ6UmRiI8F4IicsIFAA26yuhxNUxCOwfwfnw
 99evqRTcABdiD5WyovG524WzW+d3akxT5S7ZEeDfYa6oK/JEjMZO41dvGuemuQUup2Oz0HbujPg
 LY6zHwF7hwEipa3E96PW8YSF5B72zYmIUQ45ttvWoeNFqiINWKXXletbT4bHNpmwsAlQQFbs7iz
 6lMMbotb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_015920_395410_E1F0D5F7 
X-CRM114-Status: GOOD (  27.06  )
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



On 9/4/2025 4:50 PM, Suzuki K Poulose wrote:
> On 04/09/2025 02:12, Jie Gan wrote:
>>
>>
>> On 9/3/2025 5:45 PM, Jie Gan wrote:
>>>
>>>
>>> On 9/3/2025 4:57 PM, Suzuki K Poulose wrote:
>>>> On 06/08/2025 09:09, Jie Gan wrote:
>>>>> Some TPDM devices support both CMB and DSB datasets, requiring
>>>>> the system to enable the port with both corresponding element sizes.
>>>>>
>>>>> Currently, the logic treats tpdm_read_element_size as successful if
>>>>> the CMB element size is retrieved correctly, regardless of whether
>>>>> the DSB element size is obtained. This behavior causes issues
>>>>> when parsing data from TPDM devices that depend on both element sizes.
>>>>>
>>>>> To address this, the function should explicitly fail if the DSB
>>>>> element size cannot be read correctly.
>>>>
>>>> But what is the device only has CMB ? Back when this was originally 
>>>
>>> We have CMB TPDM, DSB TPDM and CMB&&DSB TPDM.
>>>
>>>> merged, we raised this question and the answer was, "Only one is 
>>>> supported, not both." But this sounds like that is wrong.
>>>
>>> I think we may not answer the previous question clearly. But it 
>>> definitely has issue here.
>>>
>>>> Could we defer the "Warning" to the caller. i.e., Let the caller
>>>> figure out the if the DSB size is found and predicate that on the
>>>> DSB support on the TPDM.
>>>
>>> Understood, below codes will be added in the caller to check the error:
>>> if ((tpdm_data->dsb && !drvdata->dsb_esize) ||
>>>      (tpdm_data->cmb && !drvdata->cmb_esize))
>>>      goto err;
>>>
>>> Thanks,
>>> Jie
>>>
>>
>> Hi Suzuki,
>>
>> I've reviewed the logic here. It's not feasible for the caller to 
>> perform the check, since we first retrieve TPDM's drvdata, which adds 
>> complexity to the code. I believe it's better to handle this within 
>> the function itself.
>>
>> We are expecting the element_size for cmb if the condition is true, as 
>> well as dsb:
>> if (tpdm_data->dsb)
>> ...
>> should obtain a valid element size for dsb.
>> ...
>>
>> if (tpdm_data->cmb)
>> ...
>> should obtain a valid element size for cmb.
>> ...
>>
> 
> Ok, fair enough. Please resend the patch without the dependency on the 
> static TPDM patch. Given this is a fix, this could go in without waiting 
> for the new series.
> 

Hi Suzuki,

This patch has not dependency with the static TPDM patch series.

Actually, the static TPDM patch series depends on this fix patch because 
both modified same code snippet in function tpdm_read_element_size.

Thanks,
Jie

> Suzuki
> 
> 
> 
>> Thanks,
>> Jie
>>
>>>>
>>>> Suzuki
>>>>
>>>>>
>>>>> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB 
>>>>> element")
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>>>>>   1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/ 
>>>>> drivers/ hwtracing/coresight/coresight-tpda.c
>>>>> index 0633f04beb24..333b3cb23685 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>>> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct 
>>>>> tpda_drvdata *drvdata,
>>>>>       if (tpdm_data->dsb) {
>>>>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>>>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>>>>> +        if (rc)
>>>>> +            goto out;
>>>>>       }
>>>>>       if (tpdm_data->cmb) {
>>>>> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct 
>>>>> tpda_drvdata *drvdata,
>>>>>                   "qcom,cmb-element-bits", &drvdata->cmb_esize);
>>>>>       }
>>>>> +out:
>>>>>       if (rc)
>>>>>           dev_warn_once(&csdev->dev,
>>>>>               "Failed to read TPDM Element size: %d\n", rc);
>>>>
>>>>
>>>
>>
> 
> 


