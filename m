Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE819C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=; b=VX2YmbNrQQcKaq0RgcdN8+DuQo
	ELV5UM4FYRQoEC/6Rrw2eqwYwzOAVbS5Wud+HuCgdo0Uxf990ccxZnnWpNWUz37vxXODPlQZO12cM
	y40oiU885UyT6SUF3DBPKfAxzit/X0SHne+rp2Vg1NnnlTe7P+Zv57d6MvQR7HT0ACRomVrBZBTtp
	ZfPUU8v7nOBvx2lfHDxaUk0YRdoeJMZ0JOFi95kWeg1UZxM7oUMw3weheZ6hkRMXPGGNXAgptZOqs
	FyKzpzybQTqWGL719YOeMOL5uMQLjRM4Kqph58rvTp/V+dPI1SBTSbKJ/S8BF1S+ljE/rJtC4OPzq
	YOlXsAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSd8x-0000000FuTK-264F;
	Fri, 20 Jun 2025 14:55:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSd6j-0000000FuGp-0fPV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 14:52:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDHdTp017879
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=; b=ZAJtHpAg5TytFv3W
	kvuEP7MlYXk08pMf7BPEgfge3rI6e1pJiKr99ASdea9Wguhu2WqaLVwo/hjsVtL6
	3dgUGZpz/CmqkHIg007vyaJ7HlUJ6R/Bo/Df7i0zzmZgjH2LHc8yzNCo+GdNTkny
	mn0iLXTk5buYeTmE5nZpfKBmadFdmNILbOOEp8XNX3eEEd1w64JjX5vndaZrlLlV
	UQInlFPbKPV1t+Nc2WT+3Dz7TAjHCoiZpzHzR1tTtT0xetNlcDAPOxVuQG2iJGyk
	RzcHwfFAGdEqnujpE0OrkBPgJQkxfSCd49PTSZwf0l6ZaXuDRJXwaqGntp6tRXIy
	igOgSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d0pchn22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:52:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so55704685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 07:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750431162; x=1751035962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=;
        b=pj7aIAAhmCVQglvQv7JALz1Sl4i3iqK6ARL0PKFVJiBhbac1d7TvaKH/wEJGIXCIN2
         ZpIYWJodmhmh92jl5teQdgLRKuXpRdvRCgKSvht6qJoerzOypU5pts1t0RUjU/lCNZkQ
         2ySdcjFjrP8C3hjbYX80K8f1LzWGmDWQ6PqtCgRdqauwX2du4BlpOJFccQ97UmSDnzl6
         ACq7UCmJteEbbw2lt+mAJN10PFgXCgRSbmM/KZ6kWCzqE5N8e1s0at9aelH0C5jfz34V
         X9JODnTSsH3dXFBwsnPhk0PE4OU3I6WIe4ZXcnhAKJ+yKzxJIr3XFqUnR+r4FrXFEVV/
         bCLw==
X-Gm-Message-State: AOJu0YwB4uC2Tl8w4ZGK2rsQ5PX5M/qweBJVZIrdnMncFu7aJ+/aloxy
	beDbQwFgnA6nxQxHIKxJS/aamem8ExbPZ9UHz52haJ1IoudmW2qKJINVqKsVk3DzKBMqWFYk+/+
	qWDYxF8Oabbq7uM6wLtTIoAxQpaKsDCNxnE0ow9cENTg8vofwRQdmg9zOetTrKs+8Ny4lUqMX/c
	fQkg==
X-Gm-Gg: ASbGnct8QF4waZIl8+C44hkkNh0yP8R+OsSfyRgjTdvd/PxYjU4aucPYxSxk36lhmlZ
	Byouh7Oms4IukqLNCVv4qRBG3/id0zNv7912z16M9r9ELpFHI8Zbnh5y6pQme+OxsnvV24B+2hU
	DoNYsIWU41aFRX8W6o+gcnNKlCcHRagGoqvmC5XUM0DCJfv72vE4qguazwbHhYwYRTJ4VgnDMb3
	Hw2z/qIZiHi/0faYF5euFwMI9L2M1ujWX3Gw/AQRlFfvWb2XM5ooKYyi2lDCwzadNUXDYnZRnT3
	hJScMFyeGlT8/031QbsECWdVPM9P3kFgNPvUpli7Rll9CqiXrIY7BM7pUNWQUn/B5AsTB8TrKEw
	wGLQ=
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d3f98d9073mr155713985a.4.1750431161613;
        Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWSbj3zLVYKtfz8K+lKDPK0MngK/y7uQ3TDDGuLOc5VoymNZIeGKtQmf1ZbkgF7OimM7IZMA==
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d3f98d9073mr155710185a.4.1750431161098;
        Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4ccbsm173800966b.70.2025.06.20.07.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:52:40 -0700 (PDT)
Message-ID: <e1b552c1-de9e-4c6d-9340-232427442620@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 16:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u2KBVvNKV8zpK7LIpN-ZX30ezoVzsatD
X-Authority-Analysis: v=2.4 cv=YKyfyQGx c=1 sm=1 tr=0 ts=685575bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=5RVeKMBEKdVlAG-YRsMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: u2KBVvNKV8zpK7LIpN-ZX30ezoVzsatD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX9ciqgsgO8VWx
 Rrmo5UaCh5lZy7F3f13Vjxyr5SZCPsixDqvfKsdteC5b1PRgKBk3xFnDl9xCA/wdWfP16EyMrqk
 U1nPyMXqwgOuQVpneiFfrOgiOruHXiajbWg9xzf14l019qe3qky1M60JpxfdsHJkpl8JJP8PcuI
 2C07PHopOgEwxUbKRNNTxPgm3DPTDy4ttPY+m+NfUXUt7s6G+ABKrnqnQ7Nxr+aEND0ldUyR2ki
 rsqBB3c6DIoSNCTteoxQh6jvChQ6YkiOOMLkdN6FyieGnZnDTTU5ubV5sS4WxQdrnmU/8j1I38v
 2/WDrbw0/TTjuXTGHA1VfFPB3WaBOoH7BWdIeHls7rnXMij2ZkK8yj0X8iAsvXVqYaj4C3KXBGs
 avy6Jwwrtdc4EI2wFkLIMzMSmNqCMV0MbnWrB2K71L+1xubE4eQwkEwoJIFWTBPffACOh3rN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=811 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_075245_211621_D82ADE7F 
X-CRM114-Status: GOOD (  10.55  )
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

On 6/20/25 8:54 AM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

