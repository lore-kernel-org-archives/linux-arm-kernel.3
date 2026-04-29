Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FD7FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRmyBxIDO0E+txbpxwIshNW+RJbh4YPcRlsPsl41xh8=; b=gQs+qKFi7D4YOhrE4WaUoVAbHK
	WRBwcQs+YLZSWRz48eAG5bw8+UAe5mJ+Z9QFY9ELvytorUwkTN5NQ4QLW9f6/pTw7z6MFufUKSKoE
	l8w8mE3OX/CMwdOy9c2bARG05nqymCe60AY7gbG0/iW1Lw1BIs3g5cNAt2rvMLNlSubmKs2XYG/B9
	Q7GmOeHxQAPRqWfGuZZ/wZitpRLtgoysYfPVlktM+tM1MwCX0Oy9A1ibCErsFKvYtpv/7LGNkhu54
	15aJwutvISl9YMKne4MoC7KWF7erxgC4Ek8tu//tc5g7fEPwEcApQSPlD2f7XyGzelBVAJDyVacpc
	GOuaUx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0wB-00000003IkQ-3Uvu;
	Wed, 29 Apr 2026 09:10:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0w9-00000003Ijc-0g14
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:10:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qFK23067025
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRmyBxIDO0E+txbpxwIshNW+RJbh4YPcRlsPsl41xh8=; b=jZee+EyktKqMMdZF
	b/sH3FuIf5ZjpzfrClGocQkk4f+OPNoI31ytlltyYOk2MkDRfIBbSgor6CQFf5wW
	I0DEegIUMuQdAzrtuh+fccAsfyzMOCB35QdJUvgQ/SZZj9/gvU9OUlQz69RZtoCb
	OPCYF0y39ijNDpAeAXr4tk+UW+4Xdky/3r9KF53EbAqdrlQJpI34lKF2zZzxdwgi
	147jAe57LSFle4u0iS0yXAlsNbF2CHNnpwYTID3Vwn6b/TDcn5FOIBrhA/LnRUXH
	h0+66y0N0mjep+fca5YJq7CFBwEe44DuL5ifxwnlVmpeRegfYfbcUcIJVAKufORt
	sKikSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx9rcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:10:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so129549751cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453827; x=1778058627; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sRmyBxIDO0E+txbpxwIshNW+RJbh4YPcRlsPsl41xh8=;
        b=IcOKm40Bv+rvvNrlifbR/Xa11x39bpsUBMZe4POPDxILpZyQcCHGA6lNyLRe3BivXM
         ZaUruXKjb1A6jaqUEK0HUwl9al616v1HloPnlY/+fVDjwYGvIgtrGMWNx1XFzVp1u+6+
         g8T3f69poq/bynpHcB6h/tYJO0FhVmIiBwauU6E5TTRanq1i0sW+0Q56HFoIJMtiAl4H
         lvGnqFGV3STc4Zrh0uE/Vp9JuUxP2HwZ1CWQJNseQvDofJweTTL+Ap3+/z83N0AbxuhX
         Znk7j/MLhEWQnteAemgJ44GAJC3rTqSYSy5XDc5ZCp+ImUZxoj/TTT+X6L7QKZGud1PO
         SehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453827; x=1778058627;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRmyBxIDO0E+txbpxwIshNW+RJbh4YPcRlsPsl41xh8=;
        b=J6SITuynlGIHEQda55dYtzYCSS4wLneiZ6H6EMNM6eC7eFBbwXU2Hi1+UIl9XMG67i
         JGbzi5i5fNa2+gEAloMy44tkmYJyou8NzZ6hD/8XzNG6Dvyt8XtNB38k12k2toweA5f/
         WWScPxoOxlmIePTUSo/+wJVPqrYqdKJrj5kfHQ7NOqmGNAQonQtFnPGdr7EJe1NK9+AK
         1d1sxJH5jJkomym0WUsl2It3EtIE5f5HEqblDfyl8jqqrHKwGLXbWyR/GF4p04ssjCNu
         hNFsaTXGrBYp6mB9+W68JE7vF+OrR+Ktj4LcZM1Kq63aasodIfljMmkwcBkRLAED6TiQ
         F1qw==
X-Forwarded-Encrypted: i=1; AFNElJ/lnqorvriIHkBqvWwa4ETaaDJZN2DBntc0FiqUWEAE+85Bi9SPVukUpjV/67XQDf8quK4bsQofb2sfK/FyC4wK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6t/58t61rH1g5mzsAbcmRxnrCvJAVVeTW0lPIfkuYQjuj77Ih
	S5oZEzwDPErdc4gopTlatFoezXcRtsYAkmRywVl6f4gxsK3MGWd1LJ9s16ZLrO8+r95mjqNz26k
	0G1z9N6mMqcBwWEcJYW1Qb3YPzRAeqsBTmR9H3swlQbsJNS4rt09ltauKWfq7xbQ4pk3IfC6Uhz
	ydBQ==
X-Gm-Gg: AeBDiev8/6JUzQ9bHkpo6JvMFNcDuSliU1w3spjWHgMydZS7TJNSXe8lD0VtKsijIF1
	xwncELFfSFZVsAGywhnM4z8YBwA/glJp3FxthsvNzBktOFG7gLeSNs8UJ8EKVKWSZPeGyZAE2qD
	LZ3yDPg0LnQAxF3CVWZ9D1S0Nc0ZfLhMyoX348XZbgHhmTbwicPsy3xUrsV3K8Wbe3qoV74941A
	s3/RDA4rBHuR3eblO+zrc4dYvt3KkVMmEXfb1E0SMrX5icYx6cCdVpnV5nBOmVAg1ZxFWVdJD9K
	FSIRylIIiU9H8/mfosvw8BpP86SWAjWEWCBx1EYMTekfAdraG2T5OEiV5hfdBL4Y/P5xCRvW8H3
	nG1tlMwRF1OaWwpQoJT5npTI5gWJNrqh/9dMLFMc+W97ZA1BedgWg7WLVDQc=
X-Received: by 2002:a05:622a:1e89:b0:50d:cd5a:577b with SMTP id d75a77b69052e-51018a34651mr44472741cf.35.1777453827393;
        Wed, 29 Apr 2026 02:10:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1e89:b0:50d:cd5a:577b with SMTP id d75a77b69052e-51018a34651mr44472391cf.35.1777453826893;
        Wed, 29 Apr 2026 02:10:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc7a359sm64972395e9.10.2026.04.29.02.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:10:26 -0700 (PDT)
Message-ID: <4f2d364c-6e36-4678-b01d-e5d0924c9a78@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: Restrict drivers per ARM/ARM64
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-2-69ba540b3fe9@oss.qualcomm.com>
 <527a434e-5ac6-4a79-91e7-bf8bac4adb84@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <527a434e-5ac6-4a79-91e7-bf8bac4adb84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _UV92mZXLfFnjpQBQP_BmC0inUIn4vEF
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1cb04 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=m3SF6izIDSniu5dlxVkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MSBTYWx0ZWRfX8pVRsrqOEfFi
 1tKs+KzQ2M3az9KW7QqPnRG6Ix8yzxLkvwVi8udv02g13tWsz9eUOxhwOPdDibRuMP3mMiB4sX1
 jMDt3+a8qoY+2ikqEAvx4gUGG/llyHkT9e1u+f7cTEquqsiq+MqTXKJwDreQvZmwn23nD5kTFb/
 ZvH1fpz4p7sNibe/Ini0BGlD0YUs/yLZTnbsLcK1/J3hPpsVGWg+UA4tMZ5NK0P3pB2sM9p14v2
 5vEswSfnLdOpXYJvyLFKC1obEJSoPTms358h9oJlLp32XbWLsCx6HCvwQqB2JQK7Z/Lmo+QnXTx
 10ifJ9gV88Netn+IKo8feXGt+DOnxVrFZnvfpUi+1G+q72WfAfGGf4ADJZFC+eeHEj9J8wOa9eu
 AOnVN8ShgIkshRXuqT2/GQOeR4n/1DP+nR5zNY5vpyj4hJYdpWINqT1YLdzyCcJeX5yhYFF+ANd
 t699v8Fqns+A98F8S8g==
X-Proofpoint-ORIG-GUID: _UV92mZXLfFnjpQBQP_BmC0inUIn4vEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_021029_350305_5EDD5A09 
X-CRM114-Status: GOOD (  25.49  )
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

On 29/04/2026 11:03, Konrad Dybcio wrote:
> On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
>> There is no point to allow selecting core SoC drivers for Qualcomm ARMv7
>> SoCs when building ARM64 kernel, and vice versa.
>>
>> This makes kernel configuration more difficult as many do not remember
>> the Qualcomm SoCs model names/numbers and their properties like
>> architecture.  No features should be lost because:
>> 1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
>> 2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  drivers/soc/qcom/Kconfig | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 62ce1c67d684..9a050ba1dbcb 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -19,6 +19,7 @@ config QCOM_AOSS_QMP
>>  	tristate "Qualcomm AOSS Driver"
>>  	depends on MAILBOX
>>  	depends on COMMON_CLK && PM
>> +	depends on ARM64 || COMPILE_TEST
> 
> SDX65

Ack, although not in upstream DTS.

> 
>>  	select PM_GENERIC_DOMAINS
>>  	help
>>  	  This driver provides the means of communicating with and controlling
>> @@ -37,6 +38,7 @@ config QCOM_COMMAND_DB
>>  
>>  config QCOM_GENI_SE
>>  	tristate "QCOM GENI Serial Engine Driver"
>> +	depends on ARM64 || COMPILE_TEST
> 
> OK
> 
>>  	help
>>  	  This driver is used to manage Generic Interface (GENI) firmware based
>>  	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
>> @@ -45,6 +47,7 @@ config QCOM_GENI_SE
>>  
>>  config QCOM_GSBI
>>  	tristate "QCOM General Serial Bus Interface"
>> +	depends on ARM || COMPILE_TEST
> 
> OK
> 
>>  	select MFD_SYSCON
>>  	help
>>  	  Say y here to enable GSBI support.  The GSBI provides control
>> @@ -53,6 +56,7 @@ config QCOM_GSBI
>>  
>>  config QCOM_LLCC
>>  	tristate "Qualcomm Technologies, Inc. LLCC driver"
>> +	depends on ARM64 || COMPILE_TEST
> 
> SDX65

Ack

> 
>>  	select REGMAP_MMIO
>>  	help
>>  	  Qualcomm Technologies, Inc. platform specific
>> @@ -108,6 +112,7 @@ config QCOM_PMIC_GLINK
>>  	depends on DRM
>>  	depends on NET
>>  	depends on OF
>> +	depends on ARM64 || COMPILE_TEST
> 
> Probably OK?
> 
>>  	select AUXILIARY_BUS
>>  	select QCOM_PDR_HELPERS
>>  	select DRM_AUX_HPD_BRIDGE
>> @@ -242,6 +247,7 @@ config QCOM_APR
>>  	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
>>  	depends on RPMSG
>>  	depends on NET
>> +	depends on ARM64 || COMPILE_TEST
> 
> This I think goes back to <2012 SoCs

It could, but there is no upstream DTS in arm32. It is however in few
old like 8916 which might be running in arm32 mode, so I guess better to
drop it.

> 
>>  	select QCOM_PDR_HELPERS
>>  	help
>>  	  Enable APR IPC protocol support between
>> @@ -251,6 +257,7 @@ config QCOM_APR
>>  
>>  config QCOM_ICC_BWMON
>>  	tristate "QCOM Interconnect Bandwidth Monitor driver"
>> +	depends on ARM64 || COMPILE_TEST
> 
> This is OK currently, some arm32 targets have an older (unsupported today)
> BWMON, I don't know if they would be using the same driver or not

They would get their own compatible, thus driver would be changed.  The
depends here is for current driver.

> 
>>  	select PM_OPP
>>  	select REGMAP_MMIO
>>  	help
>> @@ -265,6 +272,7 @@ config QCOM_ICC_BWMON
>>  
>>  config QCOM_PBS
>>  	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
>> +	depends on ARM64 || COMPILE_TEST
> 
> MSM8909+PM660 exists and makes use of that

Well, not in upstream, but I get your point.

> 
> Konrad


Best regards,
Krzysztof

