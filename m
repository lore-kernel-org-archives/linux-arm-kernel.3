Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51789CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 05:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=; b=Tc9+/l5ATKFMbAVw16ERPtY4T8
	zFajbD5PXNR71HqtPlKBkwkX5JQmu+ZDaTWGtlRvELeAVNo1iWGhS50ndSlLK+LLGv1eQW3fGmCva
	OzozS3HMT5oEI7JicG2fWjVOm1lJNdZDInZn9vLbZVObDNi75AO3f7IC+ZZRmNLBVrTDTJlvOu+pz
	CGZUjtF3MYSO9enKMPmdYUPWtSpgPqqk/qopBTCrGX9uHx/2igRwx4o1ZwFMAnuXOJHZgRpAcqVnv
	OFq1Ur9OpR0MTjsl1w/Fc3CSxlReWtk6GdQHKovNGHHYnmaFFXdyKM0BTNBVVdtoG/WcxcC0uYML8
	bwp2UR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZ6g-00000003X0R-1FnM;
	Wed, 20 May 2026 05:04:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZ6d-00000003WzY-3gfQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 05:04:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JLxunU1725548
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 05:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=; b=AGxCSdIdhznPmytD
	r5V/e9lDrCuH3/0gRJtb8HQ1SX6d/D4TTxqd452zKW/4bVNVhKdIOtWoTy7rkUtz
	oaHp51iBf5NigPanwjK9HgCS1hdYtLEI9UqckFlx/NNqSrCGnFInTO6ibecveqO8
	by2G3adovXR4GpPtgBxlOAlBCIQNRTTOrWK0Kr1FrGr4Hr+cmXpnt1mDNd8jfAm5
	qThdm3DxJPNVxI8uZV/X+ZlYS64CfDduc/Cps0PSv3bvVO6u9PrbDFSLQbHgcsvV
	ei7VuDKkJjQP7E0DGy/2l/GoktWqN2/s+cHPdy68a/MxslOAhMj3ikC6biXtdyQQ
	sv3Q7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qk1av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 05:04:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba0c548e6aso8865985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779253470; x=1779858270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=;
        b=SvwB9vGPhPH28rcSd/eXE/KV1+RC/KcZjy4PE5tgKts1xvmA+ob9s0k+zfVm3eHm/t
         qE++TuTGfOAg0t2jH+c5d2K7yGws8zukVXnA7Qh+K2Y0KAMr8BUN55dirYVuoast2FMU
         mv/Q5PxRoHr//W4Jckk2NKUp9JOxgbYKW5efJsILCuNZp4yemCG7ewHnPUUe4gmWvzHG
         5krSBpW9fqpz2rnu6Lj/drb+W3BtPTIxyPSPJ4W03hX0xDTedcnNQI6ahJiphE5DuKfj
         wBjqJQBlWL4M9U0Gy3CW5vPkwnGc3V/jHxZX9oY05Niz/9Wk05fJXpybQyTs9PmYvLwg
         J65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779253470; x=1779858270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=;
        b=dVEeraX4l/082ch4shvvAAx/5+QVm6Ox34VBDyOwPbsWBonGARke5u9Jniz3cUlBp5
         UjqpXIiGez51iaPQSJZy5jAXVGWJNtiQAfLVPspsBJLYcCvbOwetqOx/i391OXr0G0qI
         2GBxvQcna4b8TX6wJl3Bu6/qMohZE4jLQna4izynjwjzQyc3ipy+HbOucqjJuf45VuiY
         cOD2NspCjMBDUeCLPr4+dI/aQz/aosavD7vuIRjrwbN6waoR7pE/lJIW1rPFqok/vZov
         YQjX+FBm4oBAnEZkGGhlvtNRAJBz5HffmH0I/cMq2CeEYIx6M10+IT3l+pzOocBQqUex
         zYIA==
X-Forwarded-Encrypted: i=1; AFNElJ9wZH1rEWEPr22IVyfNBNtE5ZPkfomifRV0jT83jfg4oo0+mrGXtjkeH99piiro9dXn2Uuq9dW13KoOmeOj8eNx@lists.infradead.org
X-Gm-Message-State: AOJu0YwAIvZ0+yKJFBWPcGt6jxq1O4i2XczL9ek3i/cE55PP8eEh1NTE
	W57UVemV0GHFcQafUOaIrOWrQPSCHnRWbLRdFJUZLhsA3i7dv8EeXdI1t7CjfWBL379TttPo7Vk
	AQMqJLqmh/6BDb9YnPI6Xp+qPMNVBCCBiKvNLe3ueaT7YNHpXQ5JHINrn/Pg7VCq0k2o0laLA9G
	hnjA==
X-Gm-Gg: Acq92OEo5SMpm1js4npen2O86q7vt2/UExc+o2Ec//oau8iIjgGBg3dQ6Omor+NgG4X
	Iqv0xC7lO4t383ey4+UNvgPO8vkwVrsDPd2Kx9Yv57XYA5dCbCjRxWA9P+1RuG8Hif4w8aNT/Bd
	2F7d8ioMHAj+uJlDTFYh25/NFli7rHsDGB0WHMYL3jXR/OFWkLIKYt1fDnRBOKv7a018s+v61Aa
	HE3Jm+u3soAT079u6WRLby2G3BBB4A6dpu0hdfMOdWdnJom661T9+bmE041arUKhnNV31y/+Au5
	yEhLmMDNYaqWbjLXN2kBamRelKcLxQ0ztEyj13KukqgqKMh0hAEK0uTu3CvrsdYbL8FY/kueBHx
	ita4dzWUbpVuRCdlxGXCt5ewU7ut0ll85OjLWV2yJ4mJvUpywhQ58V73637EhBgIIlavXphSNN6
	HApd+WtQ==
X-Received: by 2002:a17:903:3c6e:b0:2bc:cb8f:c286 with SMTP id d9443c01a7336-2bd7e8cfe0cmr139206375ad.7.1779253470283;
        Tue, 19 May 2026 22:04:30 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2bc:cb8f:c286 with SMTP id d9443c01a7336-2bd7e8cfe0cmr139206045ad.7.1779253469796;
        Tue, 19 May 2026 22:04:29 -0700 (PDT)
Received: from ?IPV6:2406:b400:b5:60e5:312a:8741:b738:744? ([2406:b400:b5:60e5:312a:8741:b738:744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f287sm270216785ad.24.2026.05.19.22.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 22:04:29 -0700 (PDT)
Message-ID: <55470717-3e9e-4548-b12a-8e2a2e1f6c63@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:34:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
 <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA0NiBTYWx0ZWRfX5UqqqabUcUfx
 0fUJz9T/iBiVFJiEh147cKrNcmrTQmUUm8nBp2p0J92yk1coh2IdwAz/WkIzeqGdOvR29ZRQaO+
 dYz4yT44E9ImahZFpdr8H64Zwk88UI52hRAumrjce9m80jZtkjuNoFtmr17mqNn1+JFq4a+Oho/
 wzOwVxXw6W55TJijpqIE0Mvu4X6WBML5/RG/koR2YJAs71wOz9ydRD7IcRKBAvukVtQCU/3ARF9
 41fYt91UgUAL4nqUXdVYBkHdmT7WxVaWHJc6u72lx+p3QIPiNcdYUTE7uYP4xU83wExYukzo2qU
 ZVC+ATZRU8IC4HGxDTUxbKQByrcWSXEvlPrmWw/AmeB5LQGnRV9D2KFB5KDhKbnBQ480/5FiXrR
 LrHJiK+KZAQ1YwaoljpoMBFvXjhSDP+i7t2WGSwysHvISHm4nBzu3j/rppyUJPtx4zXd6Lin+vA
 a8IYEy2hdvewoqW+8Ug==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d40df cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8C-fUGBXRnHmYMWNGq8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 5Sfa1TcvEGy_fxs7r-_aQaiONPBzkSCS
X-Proofpoint-ORIG-GUID: 5Sfa1TcvEGy_fxs7r-_aQaiONPBzkSCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_220431_927100_F2453EC2 
X-CRM114-Status: GOOD (  17.95  )
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



On 5/12/2026 4:58 PM, Konrad Dybcio wrote:
> On 5/5/26 2:23 PM, Umang Chheda wrote:
>> Add AEST RAS error source nodes for the Monaco SoC.
>>
>> The DT describes a processor error source covering all CPU cores and a
>> shared L3 cache error source for the cluster. These nodes model the
>> hardware error reporting blocks and associated interrupts as required
>> by the Arm AEST specification.
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 7b1d57460f1e..8e43ceed7d84 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>> +#include <dt-bindings/arm/aest.h>
>>  #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>> @@ -29,6 +30,46 @@ / {
>>  	#address-cells = <2>;
>>  	#size-cells = <2>;
>>  
>> +	aest {
>> +		compatible = "arm,aest";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
> 
> These 3 properties aren't necessary if none of the subnodes have a
> 'reg' property
Ack

> 
> Konrad

Thanks,
Umang

