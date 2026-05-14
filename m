Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CFCCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=; b=oJNmRuBlEacRPouVDSz/xwyUvb
	o2dyG2Gh/2z2Pl79xqz9jKp29b30nYPb+bgzomk93c6l/JEHfBwLwU1PvrlaXE6hEsJz6cnBGYD8G
	HTojjlWVJq/mmXmtMmy3CQJu9SJfrgXOdDDKy7JT3Guj/91IZUf0FnIS8ELDa+mmUQnKlLmK0ceV9
	nY9Ma0BcXrXy+lf9C3HBx0ttrkyoX94KhwvHfYEj4ol9uugVPbekOhjtxH9vjeN5k9OGAjslPCYkQ
	urNguCNBW/vK+kUNzIDQzxH9IQFbT8s9ecstHqcPtwXStHpjHukpzoFteBivpOYbiRP8m06XVyLpT
	kWVloljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPre-00000004kYk-26On;
	Thu, 14 May 2026 06:48:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPrc-00000004kYA-0bW5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:48:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E35KsE1096439
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 06:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=; b=BxFwvY9dmeolgFNT
	rxtfCdlUKx0M67AilD/55CfJDr/7/jIa/LJgMnmnuiUC3HdG1PbTeFJVsq1ej0F4
	v0r6Joo67UxwLAsVyF9vrnBnwahlb4+QJ3a4T9UX9k0Jz4BhoB3Skk4UdGmNIaVm
	llflerEmcXADzX7fiTolPXIkHPmWE72n/uA9RtOzI66mcaP2lws9fTQEiDbsw2nH
	WjctpSSSDZ6x+gXfPJ0wS56FreTRM9USM4ZoGFnvhPn+qVQyr6ypsNaId1O/oIab
	Z8u2UpDSIqz9F8cIPRvIQaNrDu1ne316JJtUCP98BIqP5yRbhs1DW7FnNiLhhXsz
	EPQ41g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bgm3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 06:48:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8292e18166so2395801a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741285; x=1779346085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=;
        b=h9Aay3JLAAWE7N3B3hPFAL9OU+1FuOyTIJA/1Lm85EW7H6w1fSMSCcu9+HQj5xTIIo
         dcE0rlv5d/EfrT8N8B3Gon4WDUCiPkxwCXGTb5j+yZ2ntDWrFHWmO2EFUGcKLPJgoraz
         3OhN2wZGL+NW51a7V6eiciM0eTMWXtfuPrIKXFguX/hCCMgvuZ482+0PSHP5xJGMo46/
         2jnMXm+UFjWBMX9FZkG6REbwF5Q3ubeQOs+maHKWYgxxGQCfwPxymiximzAsc2EW4owr
         7PsL+GUdREYMt++z6OoNYekH3Yz1DoWCPD4lBwk3eg/IyjBBcnth0p3ynaVcrxaOO5ft
         ZczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741285; x=1779346085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=;
        b=qFtqUiR6IR97pEy1VH/2rYTI7ERxvEIR0qbD3IOF15wWuzQQ15hW0uwmNy/k9TpxHu
         ZLlLtN1Mn9+m3eq6j6iMjukZQBg9VkuQh08wrtSsLDA+TkR5oT2DoRQ0tXu25vlqqvar
         apLD8uGW9lIhjdW9MtYWSN0AFvPUCNzdVdRZlYhULtFOcbjyyZTh2JVAx8CjH7EUQnjH
         l1TeFrmd9r2kMG+woR9GszQIBIoFNn6zkAD9WbnrDpl1jBp4LsCq4q6xnPn4fydVh8DT
         v1whHM6s5bh33sUCaE7NN1BVXwOs0t1YDwTGtmPVIzES4ltMQ56yrZ26fbmmLaPuf+bc
         GaIA==
X-Forwarded-Encrypted: i=1; AFNElJ8Oj/ZTRll27ZuwMepej9dLpstzWQ1iMIEbbKkencIEwiE6MuPzk7rM6ltdLj6Hy+FdFPF/T4BgUHSMwmiGfexh@lists.infradead.org
X-Gm-Message-State: AOJu0YwlDrWaX51XF8Ju7j5hgPlyL1Zf2nV6nTeVmmPLEHKQgxZc9pxU
	ixgcuUKPtpBqAgKQm3uj0SDvGk1AUR83BNVqWLZUJ6GaOWLRsi5SeCWo7bWFeFD0d9nqypZ5wOM
	wotim12tjH8a9m6UJh2K3G0XJq2ieGJvCIZ11Qi2ZJedH+vCGYKndERJdolY3WOiea4WnwTmlFf
	SGGg==
X-Gm-Gg: Acq92OFNNaNWF4mK/l79LUmZlC0tdYeH3nmCg6GU6fNoqBJwAQpU7RUME+cBVjWlQ8U
	1lQHwRAH7ta5PQXD07u49IW9kjeYMonaZ0jP1DswrrJyfeGgtze6L4nCPivXCPbMSfA8rOW7UrJ
	A0rWSmeKOOtCBFC6Mrwq1jQfd8rJQYOp43lV2IdwYIc1HGDURItN9RXOxdk3tOTfREdKR6C+13U
	sF1Lx7P/VsF468ukA1pYEfTRWtQUBECWwaDScb4r/Wjujittbwgdb8PBck2syL3+hlATL9SVnMr
	yi+1U4quD+nCexvg9d5F+ol8GuDWTHIaOlxPYO0tSqg0erkfHThuHU3ooFeeidpiJltT7UXxyGt
	WNnBQHGQUz9vB7PIJ9LWVPlSIoUIvEBmvSctKTLYmm3GPzxWQKDI=
X-Received: by 2002:a05:6a21:33a0:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3af80681dcdmr7390036637.18.1778741284455;
        Wed, 13 May 2026 23:48:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a0:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3af80681dcdmr7389962637.18.1778741283620;
        Wed, 13 May 2026 23:48:03 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196660f9sm1952912b3a.10.2026.05.13.23.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:48:03 -0700 (PDT)
Message-ID: <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:17:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2PPFglrXKTTmk1HV2vaV9d9PLyMqvWi9
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a057025 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oeV5rHmN1k-fxemBOLwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NSBTYWx0ZWRfX3ddcQeYNNX69
 d3Fanj1CYzOdVGEXZ88A8p8F/Ho/xswmkWGToZx0fjGXKyGgRXn0IBRTob4aGGAveiUfn9KiJ43
 BDftT5s+PV8EYBzS1zWcHmHokHqC7bbizri/x/5S0/B1d6evfi6pOemsGMnGCm1KKLkyoz4m0LX
 nV1qlEcIqeFAWXYbo/Ep2dyoAO+AzSwFEH4Ao6HTFoud4bEHsyigJ0WM0QZHI5jA4osgzIa6cMs
 IjzItmecJOaxoupV0ege7qztitjP9/lAMCi5sHXD0bbIe7a1mce6cDFvXvLHuk8As3Ic9kHuwf4
 KUMxIce885hhdX9xTOcXXBYixD24ky8/uSmYbexKYTfmm/p0GBKsDBg4SaeN6wJ0VMxCQlteVg0
 9rmDvkhoRo3hL9VgKg2p9yx712W74hmUZSzDpGZRiefCFvksMzjwptbPc1Hn7y2ZWGMfzUC3EoN
 sJz55FFrRZJn+sus45w==
X-Proofpoint-GUID: 2PPFglrXKTTmk1HV2vaV9d9PLyMqvWi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_234808_303918_069F5629 
X-CRM114-Status: GOOD (  18.12  )
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



On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
>> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed
>> when reaching 105°C.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>>   1 file changed, 135 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index c57aea44218e..5089416ec32c 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -26,6 +26,7 @@
>>   #include <dt-bindings/soc/qcom,gpr.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>   
>>   #include "kaanapali-ipcc.h"
>>   
>> @@ -7045,13 +7046,15 @@ nsphmx-3-critical {
>>   		};
>>   
>>   		gpuss-0-thermal {
>> +			polling-delay-passive = <200>;
> 
> Other DT files use 10 for GPU thermal zones polling interval.
> 

Sure, let me update.

>> +
>>   			thermal-sensors = <&tsens5 0>;
>>   
>>   			trips {
>> -				gpuss-0-hot {
>> -					temperature = <120000>;
>> +				gpuss_0_alert0: gpuss-0-alert0 {
>> +					temperature = <105000>;
>>   					hysteresis = <5000>;
>> -					type = "hot";
>> +					type = "passive";
>>   				};
> 
> Why don't we keep both passive and hot trip points?
> 

Need guidance here, we are keeping passive at low temp so still hot trip 
is needed for such cases.

>>   
>>   				gpuss-0-critical {
>>
> 


