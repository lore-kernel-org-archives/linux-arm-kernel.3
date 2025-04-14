Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2024AC369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lDMoGbLTkfpV9XPmY4UE7cjKyAc0EvO1VXR+z/uwKo=; b=39wd/kqGRhJtP7HHRsLznLaKi4
	sW6Y/+almRQI7oGV6amD86pYIxeuJBKZct49AZHhZNwAMxqeW/IFB2umtgzi7egmAL+YmmGQD4VIi
	N9b0I0YFc7u2XqnUl80suQBaiPkpwmvOmhl45D+E4YtVwaJXirvKqaF7fSQJ05EiU+9Qand8ht/u9
	5fqkNZBYAWmw/Gpya4Wt3J3ZZzaneR7lA/AeXuKEIeYtbqMR7HOWThzB1EcDQaevxkFMugwNsCIWq
	5o1CZMzy/k2KOU+D0jylzspP3uz7IWM2kIwwco7SG5HmvzsxjtN/qcFadS0QlONU8rjbNqY1GmO+4
	0/gdjMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Jfg-000000025Fx-2bGb;
	Mon, 14 Apr 2025 13:16:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JXD-000000023hG-1IiI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:07:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99nQa015732
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 13:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2lDMoGbLTkfpV9XPmY4UE7cjKyAc0EvO1VXR+z/uwKo=; b=VcSosi47HmKEE9fd
	TAKwP7IleGAq85XwKdpf7SEqMk3nFF3HRFKNZYb0zOx7D7scBTCM4+O0Gqu7CPs6
	LVgDK/quX6mxxfrOOhzc+MUxlx/HtZtGwCrsHfdKA+7xNZOtaWk9LIqtl628skQL
	jzFxNYtKCoNlV8MFHYaXknULyKRfE6CQKUhynqsdTdVkv28y+EIbJOcCibXbEoB9
	lBWQUOMAeMmBXyruLjYrGg6fEM5qIF1M7uFopExABEcUi0qkC6QHnWxICluET0y4
	lOeDTJin7+Y0WNdcS64OE2Wt/XRiLzbrNPNbmmVPrv8mJNq6Cdoy3l3GWY7AWrnD
	aBgxCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6cmr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 13:07:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso100349485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 06:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744636052; x=1745240852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2lDMoGbLTkfpV9XPmY4UE7cjKyAc0EvO1VXR+z/uwKo=;
        b=ewgyeYXffGKP82YVLEl5fqRTphCr+G729kEAkcW1mO7f4Emm3hOfPz9UkzQFM2cUnr
         6bMmQNmH+nwqsM8eUVLXFMB/2uG6mqs8M3ea0voedwYRY7SriWhxPEUfvIOgaXoDkhhp
         Q4uilqZSNdS9FESzuWwAraHOXPbDRbVTRJ6lPNjKpHu1A185XqGisrXXfYBZ4l44fRcP
         abRb0aLRxQMTn2nHN3nbNqGTxyFGF9NM4F0KY0aqHa5CbjE6NkWWvSIhSmLG/sqfqc4Y
         FvctQgmqPRxmgBLdThzWRTHk51Qx9a2FMAaLcgKHFo8SDm5nlfxdFX9acMABKOCa4niT
         xn/w==
X-Forwarded-Encrypted: i=1; AJvYcCVhkOIKVGG4l64S70rQZag9FGYxS4r/H4r7j1ulbi8sjEZ4UwCg2yaneBkM4s6a9Jt1tb02oyE9S1uXC1vWjNK4@lists.infradead.org
X-Gm-Message-State: AOJu0YztYl5/rnKUiVL12D9CDNonvjrrs7VwjFnaEEUb1oMdaE+RhAgh
	TucqE/oic/hseAnxK65mc684uMLlrzb5Nh8flFLjCWqfx3bhkdGfzvxwn9VFdJndHUFNOhsN7SZ
	TZGvRmzcn0VEY6Y/2FPbLbG0g4Ij2dr4FrQxRCqeh0dz96mwLVZhrDNAll+ZjxuCBeNgZbl7/Xg
	==
X-Gm-Gg: ASbGncvnpJKslb7eioiJLZlSAO/Zl9OpfoG0I/t4K+vv4jI5/jP/G+90EyTRNw9Hl5A
	UQd+Fb4I89WJA12EDl3ONynUoQ7kLsJhNs8+q2GM/1qZcw0UTG7L5Q8bQD1ExwbboQBA5p0lnj5
	YdouugsfQNE3oHWOomB6nJiZ6CsmqjDlSRAoIORnQXyWjZUtN9iVHNTwRFAesHCUIL50iABEPOZ
	jQnrUU5FPIAloqT1OwaT2tG4d8n4Jj2ZSTJELqpBVdLXuoorB1DBKvBNzfOsdAsfv346uUO1r/Z
	6+UMRTqklzx4zcmoKjPZPqaBLUwvSoGczEsrnIhpK107ihcSFspsy0HflCzEvGtdzA==
X-Received: by 2002:a05:620a:c55:b0:7c3:d752:f256 with SMTP id af79cd13be357-7c7b19a73d9mr526925885a.7.1744636052503;
        Mon, 14 Apr 2025 06:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkjyPRb5zjVxNYkQFuXETFI2mifPtUz3VVZ8CZhW5cBCjg9CtZG+TWolnSrPbDxliiMbxdEQ==
X-Received: by 2002:a05:620a:c55:b0:7c3:d752:f256 with SMTP id af79cd13be357-7c7b19a73d9mr526922685a.7.1744636051876;
        Mon, 14 Apr 2025 06:07:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f459a32596sm302607a12.65.2025.04.14.06.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:07:31 -0700 (PDT)
Message-ID: <5b7bd3a6-532d-416c-aa64-8523c54d87b6@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
 <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
 <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jaAPzsY0c-vIhKeEhGtBnXvqUgY0dgGm
X-Proofpoint-GUID: jaAPzsY0c-vIhKeEhGtBnXvqUgY0dgGm
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fd0895 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ivjB2eyK2o-HjyQSxY8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=769 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_060735_360972_1BC360EB 
X-CRM114-Status: GOOD (  17.55  )
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

On 4/14/25 2:14 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 01:39:56PM +0200, Konrad Dybcio wrote:
>> On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
>>>> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
>>>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>>>>> controller. Link DP to the QMP Combo PHY.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +			mdss_mdp: display-controller@ae01000 {
>>>>> +				compatible = "qcom,sar2130p-dpu";
>>>>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>>>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
>>>>
>>>> size = 0x3000
>>>
>>> Existing platforms (including SM8650) use 0x2008 here. Would you like to
>>> change all the platforms and why?
>>
>> The last register is base+0x2004 but the region is 0x3000-sized on 2130
> 
> As I wrote, this still applies to other existing platforms. I think up
> to now we were using a mixture of 'last actual register' and 'documented
> space size' with VBIF using the former one. Should we switch all
> platforms to use the latter one for this region? In such a case I'll
> update this one and all other platforms. Otherwise I'd prefer uniformity
> and still use 0x2008 here like other platforms do.

Let's stick to allocated region sizes (i.e. 0x3000 here)

Konrad

