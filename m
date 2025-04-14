Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8161C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=; b=JlyDIGAt66OsqaLTNPHCL8SJy4
	OHPorN+Lz9HxdoMhQ3HymUL7dbokYbCqaw7r8lSQk8nTMjZJ/QXJ+nvlMjuFmO9yrOo3mN+NMoCtt
	OMDf3UYCxMQKFCF8/IBDC8NkPauFspmUuytPLbBMc1M+MhY0qIaXgl9ZNsonpVtOFLrPbP/N//Mn1
	AvYQV8B3urSK0jNeWRLQxGqeQjNqZqBZg2LKfYqqpwYpSKyQcuotvtqaDoiYmP61I+h1WCtjoDCyW
	mzmkjTFUCJMLG6eFP4H4QlI22ju0GUntXGuXRLOh1t5WnBnHA4b4bbXCfSmZsYV7fT3Lg4vSLMoYm
	H0dxEdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IJf-00000001piK-2eKI;
	Mon, 14 Apr 2025 11:49:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IAW-00000001nfO-1TSc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:40:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qqn011413
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=; b=b8ZlYgP0nO/bKyvG
	B0H3DK80AYm2/oG18ZJ0U99qoqONX15MY2fJGBOVGfpoCwpRxxyO67Q5G+Y1F5uT
	avl+sT/nNwTcg21E9hjhwJNA1N0009iEWfOffuuqFNKFL/H9ckoiEU6ssf0A2ny1
	FM+XYt/hx8dJ0VzRYdHMRCwAC9EJQ9tj6CfG0SnMAbpWY7FtK71bqWOtVyu5Bi9g
	dldORNiYnfdb+5OSA7WLziG4CXIy6n2VAG4CFRe+u8h6ra2ilPrnSIKk8XefejGJ
	kRpe4oat1/kgg2KtQ4yQUAeaqoN2ksNRUqO2Win5ctdRMzNZ7cuqRekyRrJAB0l3
	0fJvPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wcby8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:40:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so100956785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 04:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744630802; x=1745235602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=;
        b=T+7fkpyIoo/t6j4/XsOKKe975v6VaysBlXtZ6WSXuzMQHXtA6BQOCiH2gTcBygZeKQ
         HkhwqfERSfBhL3Fmj4WWOSYPSKcuD3ekF85XygBxUv/aHuobNtU3wprFA455rmqn0bFZ
         64WBOemwSKofITAFAJWdWMb9yGk2OweWbn6YbCrBswvLYEwQmmVD9gsvUDvh4LrvaDON
         ZBt11HdP1PI4yN0yandXoixsiBMbGmKG/X5v8HpT3Npfb1YujhR8nUAepztfenA5YzIJ
         GdS0+AkFQvi2kWdz6AS8X5c7xdztYK+jM+lzwyxVD9iZDU6AmZI3YL2qbmsS0FgXKW7M
         12dw==
X-Forwarded-Encrypted: i=1; AJvYcCUXf7INsE/MU7AECgggoEQBduA+QUneNQORFLQgkm5IPPYjGkuY20AUGCiwPDspzVg7prPfGOz9ndEETztOfh84@lists.infradead.org
X-Gm-Message-State: AOJu0YxHimHeiHrIqG4k2NUrfzwKzdCCopnw8DhT9g25BNjre/EytE86
	Oqz5PGsEF8u2+pMS+ekezY25LI0wSlZVN20wNvl0PPYHkKl2NF7xhGZ/ueSHTLaVZN7n22EflSn
	AnFGPk6wncK8etehErxeTHRANfPRofrvCg5aDh1GSW/T9OyQw26n719RJDJjg0G3SppmEco9vKw
	==
X-Gm-Gg: ASbGncvS630FMLRKXFhwMNgIBG0X+cuSTDwlKr4AEuRkynNQ16NIj7pPXercL/Nz+SA
	Fu4jpe7TUo3KwKpufHTM1XGDlSBU+NRs0sJK90Z0U9C3nVqkpSbpzZ8wEKQy6UI/XmK00lIqzU4
	U0E3dB3KhRaqeL/8nV2SfpR9aa+IwthHvxnwZAyxqNPoIyhrDsYbUClIptDvdgIn2i9rxZfrdvU
	5UwaG8KxoWvgxcWp5N5Nho8r3rmgYnPiOyiXu1vXr5R+j6zZVX698ZQ5AXSeUoEGWk/ESD0YZDo
	uLrIVQW1E+vzlRBrJ/sAuHDbo1Jp2Hncx1jjddlzKth/9jmbu4k6/9yc7VkgmvRzFQ==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6f283adc8e5mr73752106d6.1.1744630802098;
        Mon, 14 Apr 2025 04:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3E0L9e0/RIci+ADRrX4qrK6GQFhC+G2QaLdC4aN8GFac4k2hQr5Yh2rzqnOdAyJM+rcAvig==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6f283adc8e5mr73751686d6.1.1744630801548;
        Mon, 14 Apr 2025 04:40:01 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3569sm887225066b.3.2025.04.14.04.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 04:40:01 -0700 (PDT)
Message-ID: <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:39:56 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fcf413 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=wOxLtKptuZxHWs9q4SMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: R00fuNmwgntQQYYkOOYZ69zOUTqJDkxZ
X-Proofpoint-GUID: R00fuNmwgntQQYYkOOYZ69zOUTqJDkxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=737 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_044004_562239_9D1FE95B 
X-CRM114-Status: GOOD (  16.31  )
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

On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
>> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>>> controller. Link DP to the QMP Combo PHY.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> [...]
>>
>>> +			mdss_mdp: display-controller@ae01000 {
>>> +				compatible = "qcom,sar2130p-dpu";
>>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
>>
>> size = 0x3000
> 
> Existing platforms (including SM8650) use 0x2008 here. Would you like to
> change all the platforms and why?

The last register is base+0x2004 but the region is 0x3000-sized on 2130

[...]

>>> +
>>> +					opp-540000000 {
>>> +						opp-hz = /bits/ 64 <540000000>;
>>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					};
>> Weirdly enough the 540 rate isn't in the clock plan for the pclk
>> and so isn't 162
> 
> Nevertheless we need them for the DP to work.

I would assume one would like to have dp compliance, so perhaps they were
just not on the very page I looked at..

Konrad

