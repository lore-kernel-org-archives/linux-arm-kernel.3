Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31331CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmq91jkGvneoxWerkaeuBOohJIvM59ypbHsXw116sQI=; b=dNFF+iz5AmrLkwlNzalya/oS8Q
	d6GXywPIIuPaoR4dRtHpWywz1HgxCjkh/PqR+en/22SP4+H0yJRyJXoj1uiDB6Jc8YEhqBJ8dM7ZA
	6Q7HWAiLI5HXO+jdV/Q95Et0jdGabrBiNC/ulVuDuLHx2e9CRwNeiQCVK/Hc5lc/L5SiyWHQGmgWA
	4yD6UAd9kj3Ik1wIZO0uBZ1WQ2TcRAQstmRMC+1qDV7posuZ5gbo9EoE4y0YcukMMHA3+1w2ai1Rt
	0D8N4isAZq9obreK0/lzO9xi4DCu44svNI+xoYiGLiBZN1s87fPNI0F5CqTIONjjWcJxvCCXWMQUF
	dZjsK1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNyW-00000007qv5-2RPA;
	Wed, 24 Jun 2026 13:49:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNyU-00000007quf-3TDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:49:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANShW2501711
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmq91jkGvneoxWerkaeuBOohJIvM59ypbHsXw116sQI=; b=Q2+ubZB5zLNJ3dOv
	VXFh9X/7hoSGO1l1JdBxrUF/gifl7W6QphUEhXUr8DjvdHJz7ZqGzRspN7NsXxld
	j69LW9pb+XnacD+uchFMTsB6McekZ3ULqM8sbrG9kjKlMvbgdjAI+iEj7ay5I0la
	Mq0d8QG7QXSTjM+MlbuLTl5jOJTVDZ1Jp75zUF3aGf2dqUwbpta7XWY//ii12VGk
	E78v28XA19CmSpUNaT4ciJF1e17SrO3go3+q5iftE8n6z5wo3MkZFwKiRljlRhB2
	RhHVrt/VQbekpQrULtDSGOZflqCqUzg9AN2B2ffx2EmWO+QSftX71erse3iVguOo
	LQ0tbQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d450vtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 13:49:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453031c57cso1705019b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782308945; x=1782913745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmq91jkGvneoxWerkaeuBOohJIvM59ypbHsXw116sQI=;
        b=b6bGAi9TxkseSaGBt47KtyvDBkfcG5V2pq75ri4enGTbd/2HDyz2urTAs/pAGSdR0T
         PyRfU37tPxe+qQDi0Iq76CZP/2kKG5PzoO67doMThc6GOT4t4DIXtmnbxKSwyGsjd9Ra
         mbeRFT2yT40BTdqUZKDlWAZlUdqsizhQJdTpa01dk6WqfJVcDRzXUbVuiBHMs6YZJtTe
         hPhT6wvdEWHmoI/oOg+DMbkPslvA+pdKIcI48AurIw54zr8/RMi3lU8sgT2tjFhng5jc
         rjYxSUmcpFuPqIQIoogpOTmakvXBhyZvIx/Na14Sp9lzCcD92mZUb8B+q/NjPFgegs+V
         4rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308945; x=1782913745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmq91jkGvneoxWerkaeuBOohJIvM59ypbHsXw116sQI=;
        b=VFQiSj12d40MrasUMa7U2YLvrqzQwGJDJVsHqTUJeqPHMeV3lUtB5g8JyHAdzE5EPC
         hzldaQkPtAurjy79xo5weHVnxL1yV5B//Jvb9hGbffdUKqSxCQ6D2HRr0itkmOpEUp4G
         btoyrJucp0jv+l2TFGIr7SAsxdx3QGZGPIpnZCUDvuYQ1u5dsPkxZiu0mTyrsWHhrwLq
         Pa1t0QvV0m8pdiBHHgXOZqprIZ2EJ+XELzEQSBCzyuZRYnOWLfheZztep0Hf9kBV/r7M
         Fp6OZ43OX7l5J9qGUX9ocZUvbM3HCkYDxsoQ4qi1INC/4g9e6F2f16CtM++v+Owvswnx
         a6rA==
X-Forwarded-Encrypted: i=1; AFNElJ/ThkLVIQStQJM315hzN7thvSjLF6LmxUNwqNsD5KVn42lNFN+MQNxVqC75wqj0uNKw+Vs0pqSGO4Nrfh2O7LkQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/k5DacfqRWwc1iMF0Kd9NjClJDKzxIxtxTx51Lov18LwSMsNY
	M1VSWY8VGHX713mypy53VZl5bB2UfnrlZiFAb0gED+Eoi0o78/CbMUa5bVjZo89yt83m4lZMUeZ
	KlZLToZ6hmHI+MSjnmqhCwKNmLF+c547aD8CrcVa11EaIYCLniCe949SoykpigyhHwFHYrWfSVv
	azNQ==
X-Gm-Gg: AfdE7clSycNO8yNguntn8FQScAhbWTbkVJF5GFaG+kBvbFXlb5EGSNvlmB5WGTPeJFI
	u4NJlbuvZbKYKgP78Vst6fabYElJ4s9Q88LyjyhL4cyzbZqzLPMWTLQvYh+Ks5d8Sg4H8B2QJNC
	A8Fsdf5qbZCe+ZS6URRDOEnzOfDR5c4jq/qgnlFhQBZoeWLbI0gTAi6o4goVzVWonN1M1O2Z/Ke
	hsSE2LTqUoXSQpGmUDGTqK6OOPLuKLQm4yq4pOQwNUSgGXX4lloat2j01aGQ9kdTbV2PRSD8nfC
	vdkUu6ianR/ZbdFAFAM4sR/+TbcW7QhPKl8u6hJtRs9s1+HY83lXIbVNxWcag93kV6LK5RjPi/b
	IIDN6xw6+5vR2jwEsFHGYOMDfNYniKrFD4WG346uCavoxnArHwomhTxjA8cTjEZf4h08vsMtuvx
	LA
X-Received: by 2002:a05:6a00:2e9f:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-845a27b3f69mr4833573b3a.40.1782308944534;
        Wed, 24 Jun 2026 06:49:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9f:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-845a27b3f69mr4833511b3a.40.1782308943973;
        Wed, 24 Jun 2026 06:49:03 -0700 (PDT)
Received: from [10.133.33.213] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4127bd0sm2280981b3a.53.2026.06.24.06.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:49:03 -0700 (PDT)
Message-ID: <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 21:48:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExNSBTYWx0ZWRfX7LAI+hyOPJzq
 tDOjIkqpB2T0i4pQvTDTUZe/qqvaxPSpOKJgGFxptS+Tu8fL9pT0H68f6R2yoaWHklfpoEhpLq9
 awA84ae27w/lbXRoeTbrzyEhzKoLf2I=
X-Proofpoint-GUID: OH1Dble8EzE7mlcNq8vcuw0Hl931-CFV
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3be051 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=t96WpxVnkgGKFerJHPsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: OH1Dble8EzE7mlcNq8vcuw0Hl931-CFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExNSBTYWx0ZWRfX7Gfwutu6A3tM
 b8npsJdS3ju+/fe9R6IKZMCTiR4Akw3aO2vJHR77O/3GECSzU4dn5b8BPBBjVetXw5E7mtMpwXC
 /jxZUtxkBugs63L0/gpVtEi2pWpw9dAZp1c6MDP4okGtvNsUF7VsOUcu1A0WA4NIs1BFJdSaav5
 JGf7SOZw5EP+cuUYZpCf6X75NxzMgrkxSi0OuasFdpVRPeJtDbFDOg4vwmkEQ1+BvshP4qsBhd8
 E9vpPMXwFEvkUVX9C7zMW2uFuNlZjpyXAeLA47LddtXMqUbSHPQcTDy8+aJ45391+n0uObbkNfK
 +9Kg8TvkLgAlpRs08slSfoo0uPdMkHZDKQvXRIL+ziQv+iZsNpOjVlj5seH9QGhFh+/zCrFprZ6
 7Cu6W2/2py7X3eCj9Lqo9dyJxVnghA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_064906_896663_25AD0BA6 
X-CRM114-Status: GOOD (  15.97  )
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



On 6/24/2026 9:27 PM, Konrad Dybcio wrote:
> On 6/24/26 11:49 AM, Jie Gan wrote:
>> The AMBA bus attempts to read the CID/PID of a device before invoking
>> its probe function if the arm,primecell-periphid property is absent.
>> This causes a deferred probe issue for the TraceNoC device, as the
>> CID/PID cannot be read from the periphid register.
> 
> Why does it probe defer?
> 

For an AMBA device, the periphid is mandatory for probing. In the 
amba_match function, AMBA attempts to read the periphid from the CID/PID 
registers if the arm,primecell-periphid property is absent in the device 
tree. If this read fails, it returns -EPROBE_DEFER, and the probe 
ultimately fails.
Most AMBA devices expose valid CID/PID registers, so specifying 
arm,primecell-periphid in the device tree is usually unnecessary. 
However, for the TraceNoC device in this case, AMBA cannot reliably read 
the periphid from the corresponding registers.

> And is this required for all TNOC devices?

So far, the TNOC device has been added to sm8750, Glymur, and Kaanapali 
platforms, and all exhibit probe failures due to the same root cause.

I prefer to fix it on Kaanapali first.

Thanks,
Jie

> 
> Konrad


