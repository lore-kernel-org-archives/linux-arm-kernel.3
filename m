Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA74C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 20:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=; b=il4/D49IFQzz++zGMk5AR4A3Eg
	Vq1+h5rnK6Gs+E/6YGTWDtRzelTiIK2rJnZ27E+DJSsG9Z6CBuRztM2huwM7E1mPxvj5aW0KmwStg
	e08Wjk4e6r5pwUPOBXR/XcG7NqiI34hxLEsubvMiyfGHwKZMkAIx4L2bqtODxtP5hG2eYANQIwL1m
	rAN8EgUOIugXxrTn7PRs9B2wJEHUFIhj98KgX1FCHet50ZevX6yqfeKINPUs6vd1HWNUpv9BqgyjU
	mXsdKX79JJ5TTNZGo3d8O/rA/V2qFsR2VZ9ZU7cvoQHG1C5N+UB6dN3v8F0Ea9M0ikJPSHRA7WTLW
	rpoRkvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpa9-0000000DX1C-3p6w;
	Mon, 06 Jul 2026 20:06:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpa8-0000000DX0m-0P11
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 20:06:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8KR833190
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 20:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=; b=A2+sA/pflXJxmGj9
	59ZriII2fhNp2WN0kzFToRm19PyG1ZzN3ZtAxwpUgIULN/i4b8olLkZucYfJgs9n
	sOH3W3gsdYm1pifuiPBorvFjOIT4YWzjDMPX5chFwUGIKJMYF/vipp7Bj3PlW9Ab
	Wd9+U4wfP23RFtxGBNJCzF/hErbix8L3deUOtvXK9tTCd/1NLObqo/xJ6rrsYGnp
	W0OfZyGPiohlFIowqWLlfwjN7wjQJXAdzAEDDe3OASOZm6ojJHPUiDrWHaiQJNqV
	mkfgSG4xC3pHLYsBvRTUTfOb9S/M6dND7ItLTZnSwktZgkxMrSPgpu8BwcVVWywr
	aAwSCw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jm2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 20:06:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so172604a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783368379; x=1783973179; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=;
        b=AqsQGyNwOwlJ5MhyYxO+CjC7hRBBB6tsD+R5a+gdT4myZ6e6PH5KpEP7klFKG3PDIN
         0ZUHAzoENxoqsEjcATLFOMHtSxNS10p4Gc7N1R/wer7Lk0+InNpJn/sszQh0QtUqZHmZ
         Ib0gXsqidIkyqBpAbxeQFH7gIWX1Kb/BGPZdfxEbB+CeBfFhFsNLujHl+ywk/RyLJLwq
         xWRovq94fi8Thuur5aT5bbkjgFE7DxgbPKjOoiTtzxp6QzFm0j1ijYeXVzTaTU/w/P8G
         UoBOGMIo5Ii0n0OGVIUUbp4RU2UD9OWyngNxfFXIgF77IpIK+tSHK2dgnIg6/Hl2rZPu
         oQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368379; x=1783973179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=;
        b=JjjTIrDrHjDuBBTipbgiWetXFDoJ5SlOmLXra57ilo271gAoW6YVfCwE1SjUTHdo9Z
         ObBlg76BXGLGuH/Hdw6VWCTu3EHCt+Y3L5V+ZDTN/Ntc3wbD7veKQW8LaHnodpQrlNY+
         tNIMK+z5ls+tARmtgyy7Irjp6oTlJ0GSSASRtWvlzVz//1K7T9W+I4NS+1g/+u82hF6d
         A990w87gwW1TaS75GtTA77c2mqzXSW7OC2jRb/oEmD2aBGFdtLZQyhlAZxAraNqiVD16
         q+kjwSOUQUR0tzum3j31nozTurNPz4OLiu/GmrL4rAN9azi0qRCzklPxSVQjU+cVf8kL
         w2JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4ykrUo+O/AovfTiF0kDS5HyKLOWgGcB7hOmf6hBmTv4Ouak/su76HTfly5bNXLzkPV03rZwE9WQyKNGxbILz9@lists.infradead.org
X-Gm-Message-State: AOJu0YwYUWGR1bx+Vq/wLKyjiFQVfZlCiJGaoq3PUmGK7nQbDyl1Bejy
	VtlSoLPBS1S4MlpjUWdhYUeQT4l5zj2FaXKrgmnIzx0vXJ4TgHEi2bxiTWPbw3SpNgeQ+vOgRSb
	dTnahRNli9gt7RTR+m8BNCzq9WsFIDrKaRxXNaXbW9Y6RTTyfFcSGL/4chi/WMS3iiFjzjWZA2q
	uZRQ==
X-Gm-Gg: AfdE7ckvKVFB3Q3A3MwrcgzcTffcuag8wQavuW+2IcvhdOExyO/NwZsIgeWmnTTJmqW
	KpBWKb5aWWI9O1IAexlBolO9D2cdpZxy7jNFk3ABHxVhTaGjugDW9qKgbF99bH4da5unmvI6j6E
	3MfGgxNg8pbFIJUxjCiOXuJkFrmiRkpVNmOiCTLI6K3Oi3XQSIKF0ho+yoUb7s0QlW7Q5WlWZLP
	tllT7O2xwFvLsBFPod2YMj+X8rlAiSTIvOT75PeiF3yGAmc8nJhu6qBvPNN+Ovxb2r5GAWs2H28
	wgNqgcsXmmYz/dKkKG1CvSuCQj4hYh3UZwYR5VRpmHBY0vZWfQsYpTcyHFjcKX0dHn54db4QMxP
	kTYVBFDHbcSXqTPlG2TkP57nlPZAbM/MKTWE=
X-Received: by 2002:a17:90b:2888:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-38112066822mr17984604a91.1.1783368378705;
        Mon, 06 Jul 2026 13:06:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2888:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-38112066822mr17984531a91.1.1783368377972;
        Mon, 06 Jul 2026 13:06:17 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5982sm47949eec.5.2026.07.06.13.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 13:06:17 -0700 (PDT)
Message-ID: <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 01:36:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
 <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c0abb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZaZH7ke036cbytEKeQwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIwMiBTYWx0ZWRfX619y5Ftcquio
 EN+9xiBumU5zgxBH29sQPxdVCEMlVXFJW74s1QVeLKJl1nH+DLyRxnn8GhV9OcGeoyTL/2n/ZeX
 K8dlWu0ezoSI6ArfdI2wWSf8yhAJnIhllZdCRK9+UERu3zLbEIbdtL1eRo7iA0eBfqW2LZqTOG3
 enPf801gr1YlcwNZ2YczqSPrr1npU3s8pZAvonDC6FUAMVBZ2JkkmU/rj46qbR7thz75dk3UpI2
 5F98O4v+czptzh8+/VWPxIXIvfxz+NxbnvpSovBt+tUylX1QC+jgRLQiqHtL+MSc7xKSulq4uDW
 yTrhGz5M9KePHBj9NvmReTN775KyxcvyTwK7GwhNE8lrizwQ6C+bnNlm0alpb23+NRFVorf3qLC
 UedN7NzfmodbRItGESdSGES9NWz9IKRdmm2Y30Y5SyhrM1GmMq5CWvSJqmzsmsaGigPszdfde5q
 y6ZRPf239miJDjdckdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIwMiBTYWx0ZWRfX17SZFUC5OLtF
 h7bnj30b+8w/ZyzAGnwsMlVXol0FbHtMwjxwIQgkCZrgJbGRshBS+8pBHTUWQUjpadsg8YvtD6c
 sKtjkH2HbC9oA5X5VjOAOXxxu2SwRco=
X-Proofpoint-GUID: t49t6kgpSHeB4q2hgGzHwVmqCIQJzThE
X-Proofpoint-ORIG-GUID: t49t6kgpSHeB4q2hgGzHwVmqCIQJzThE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_130620_146525_CCFE02E1 
X-CRM114-Status: GOOD (  18.08  )
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

On 7/6/2026 3:07 PM, Konrad Dybcio wrote:
> On 7/5/26 10:00 AM, Akhil P Oommen wrote:
>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>> A8x family. It is based on the new slice architecture with 3 slices,
>> higher GMEM/caches etc.
>>
>> There is some re-arrangement in the reglist to properly cover maximum
>> register region. Other than this, the DT description is mostly similar
>> to the existing chipsets except the OPP tables.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			qcom,gmu = <&gmu>;
>> +			#cooling-cells = <2>;
>> +
>> +			nvmem-cells = <&gpu_speed_bin>;
>> +			nvmem-cell-names = "speed_bin";
> 
> This looks good to me, but I thought that on a8x, we're supposed to use
> the freq limiting register in CX_MISC - is either of them preferred?
> Or are they just hardwired to the same thing by chance

I believe the other register would work, but I don't have a fused hw to
test. OTOH, this is what is commercialized.

Btw, the CX_MISC register is not present in all A8x GPUs, for eg: Pakala.

-Akhil.

> 
> Konrad


