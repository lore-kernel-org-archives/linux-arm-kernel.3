Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE263C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxLfze/zTU8C+QNrMs305310NbgxbagwueNtXuKqL/E=; b=wb1kbyx3b5qruz8zGN9zNCgsS7
	wB2a9O+aHsLH+tCeklgJQL0tfxSdpkE5B+peTYpbL16EoPdrPuO0kFkHaKVS45LS9CwAjY+BtkYh2
	zxtphOOLZXgKNq954R+7lEVh5WBmLEt0aV8XNaZvBhbtuYWsnso1azEjNkWeMakVZAQcSYBsYtyxp
	sksEBABp5lmiIb4TbWgYdYxFha/DC8v/5mldK3S3W38nHr+MFZlo642lcMGyJb/hiWV+dIRt1Clc0
	CDFB+q70r73jLDqtmbdie1MgoBAo3Ea3eUW6SS5i2aFehQMFwyatN1BPbF/B0d4F5e/rg7NLBKH1G
	rvTFMRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NH0-0000000CloY-0hnT;
	Thu, 17 Apr 2025 11:19:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NAv-0000000CkZB-3PaW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 11:12:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lFvq030253
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 11:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxLfze/zTU8C+QNrMs305310NbgxbagwueNtXuKqL/E=; b=adcDkBd6wQd9KwXu
	Y5qcUyfKvzgCP77H6O5zK0SV93bKBEX5htjINmUWG/bw9UlxjHHMf1diagE82Jl+
	nzmjGhh4kFl1k7kNcMa1PoD7Ep3nos1gibHRpcBjOztQSAKz3iT2SXW6ebuCwVxO
	4i6d6K8fuAERCOiGwVYnJa4+QoRJCLd/aGFnaoQx267Dvyqercxlb5PsZlWC6r9R
	16fND/5wGGvmnZ1sIFuJS81Ai6iYr3MO8tJyPcfiPd3JfZq9E0+c1d5qRRQWrBef
	qxnTBx/crw9bXR+CCdw51hD/5G68rnzn/9ygQ24oemKZ7nbFx754P58AIIR7jRU/
	JegZiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69xp1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 11:12:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476a4a83106so778461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 04:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888376; x=1745493176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxLfze/zTU8C+QNrMs305310NbgxbagwueNtXuKqL/E=;
        b=qhTd9iI4nWiT8vfOQeOYjw+Mz4xsCUdG4vmTrX3pal7jjbCH/LDJ3V4LiQEWxOCBkv
         u08+R0a98nb25MlabMHBd8HFRIaB/x5ix7SNSl873Nok5DPeDmn63G8aU0ctvn1cdeXZ
         d5ruS1/fbl0vIbO3eJjae7kPfMsX5rOcBL/R+mEFicTzSt5+XZuLLGKmw8jQiyz2xWCm
         iXRt/3mz5X+pGBbkfbR/2PB/Mp5D5ZT3NlMaZXB98I9qybZrKEk9mktCtjV8JHaRoSRP
         mqDRyKTcSzrimG8DDELOX0o2LM0SLAAzjXAqUvjszzpSFJbzOEVmtBUgUNZ1DME7tBP7
         aGGw==
X-Forwarded-Encrypted: i=1; AJvYcCWy1r5CrmeTC5bzmHtltCmTIQk0SVcVBgPaeJAJ7GxFH4mF9AUhjpbxWQ/6qGNKmqaBKH8ORk9ptx0/L5tUw3Va@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9l7sEDoCgGyJGakGUPdaFq0aiNaCCpv1bh8gUeX1XWs8bdtn/
	SX0CeDcNUXsUgSaTbBOiQ27i/1YeBuJK00B+3lRWk8EzDkuNGk0Zqi55TQ8hwVrzEJ0P0iXUCNC
	bOPnGHgTjCY/VNgfg0AvbUCUAAShwcuU0ZNKikISAfnBGdtkV192v0WyP4W4w6CfWbBwkir6w0g
	==
X-Gm-Gg: ASbGncuvfxNxek3jjYl3O/SMfe66b1SmCmhLUOLRIhf1jr0CDE7Cw+su1LcaQo8g8oJ
	IlE51CW3SiITs15GwkyMzseNkVKJe1ia7vIm4GJih5RBeAY10VHqG1sdPVxVC6j+5KIftHcRKSc
	3tA+hUs5UkMbzx7PDe2VIqKh9DdrU8GZMZN3MD21u+hTP/I+ZgnJyHlaCmizgIGMAf2K2ZvhQoo
	0fra7NBadKA7gUFz2vkRGi1A6KIAbjx2OxvR21VRlsZD7ZBtctricsiKqz6uGCVSh07DIh+6jmj
	VfvTEfZh7FT4dHqQ+yVt61ByCzyWa98egO5Kl84X5bqGCXKV4HO8tRl9uc1RgFbhvg==
X-Received: by 2002:a05:622a:19a0:b0:474:e7de:8595 with SMTP id d75a77b69052e-47ad8159564mr27694991cf.14.1744888375715;
        Thu, 17 Apr 2025 04:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPBxjpffnmkirnLBBB0Y2hOG9UcPArMHvszmAnlUI030yse54CdKoXRd2cuVM3FD9w0+N0bA==
X-Received: by 2002:a05:622a:19a0:b0:474:e7de:8595 with SMTP id d75a77b69052e-47ad8159564mr27694831cf.14.1744888375327;
        Thu, 17 Apr 2025 04:12:55 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f527df0sm10099976a12.71.2025.04.17.04.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:12:54 -0700 (PDT)
Message-ID: <7b559f03-f131-435e-95de-b5faee37b4d5@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 13:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller:
 describe SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-arboreal-turkey-of-acumen-e1e3da@shite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-arboreal-turkey-of-acumen-e1e3da@shite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fYtPoi3sLQ_ZuBH3beIqQvVXSpxxymiq
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=6800e238 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=hUMovHauaXhaw1qFzIsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fYtPoi3sLQ_ZuBH3beIqQvVXSpxxymiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=814 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_041257_985192_3AA855EA 
X-CRM114-Status: GOOD (  11.43  )
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

On 4/17/25 8:03 AM, Krzysztof Kozlowski wrote:
> On Thu, Apr 17, 2025 at 02:16:31AM GMT, Dmitry Baryshkov wrote:
>> From: Dmitry Baryshkov <lumag@kernel.org>
>>
>> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Addresses do not match. You re-authored the commit, so now everywhere is
> mess.

It's git's fault with replacing the linaro address based on .mailmap

Konrad

