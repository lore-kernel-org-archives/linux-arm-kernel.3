Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14115C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 00:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE2/Fwxxcl0azqiRllzegxykv0hgN5pToHfBcyE+fWQ=; b=pon9zhgu9E9aSxFjP0+rThB6AI
	KHDd0AcomzxVmX6Y6d8BxQx83xM08Q/hxQXY5btUioJYL265O1kv3VJHT4pmdq6xO93RN4W2Dy+jl
	hBmMhKXD4YnksFMFdz0eFKCj3KsD2HiyIAWOfIbxbME+jGPEjVBZ5Ali/6YC0fzfHGhzoYfY711bh
	Y5sC5SqJ9sl2WBCjVnuRTR+9S2YxUuziqhgl7ygFNtuVhdCSu8PZB4NTdtmt9+WtrKqU/F5zcNBDM
	A7FVswCjYkc8kc3407hw1VFu6z/Yd1iuQhGm+0YvUDwvnx6TeHDF4mQOXry7XQQtSRfTY2zKy4k5V
	osXCWl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3oo-0000000AcUw-24oD;
	Thu, 20 Mar 2025 00:31:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3lT-0000000AcC2-2Ecb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 00:28:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JJ5jbm023324
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 00:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XE2/Fwxxcl0azqiRllzegxykv0hgN5pToHfBcyE+fWQ=; b=Gi5o91E48NR2x7Tw
	xh5PIn0J2Hjw655pGzhxI5BLxc1BUgPTK3n8wuqxcro/+Yy8nrg4RFWd2fmzB7G/
	Z0CWLlM7owdqJ0zppJ+kiNR6xa5Svz4OovR/kDU19Bl7GPqtVDoDwEJFQ9fmvxdj
	FNINQ9TYmBBT5cAlrPBAvHCnCwjYHNKXhajQpvqKencIHIwQI54bZPh2LaUv6WwN
	AiTQUCvJfUkg06+/blzrTlMOmsCsYiF9mCd7VtYhYRkPWF2oWRpbq52cfGgnkO7J
	z96/2vrFDC97EMyraQlQ3rwUFFB5EJUu0Gj5kcnNupL0u5FqXtlbciU1YD/ecfmA
	gfW8wA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf0mtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 00:28:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242ce15cc3so2167955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 17:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742430481; x=1743035281;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XE2/Fwxxcl0azqiRllzegxykv0hgN5pToHfBcyE+fWQ=;
        b=RaVVJz/ES0XfYUalydDxKnmA9C3IjYrlMyeA8Ez0GuEpRAV5xYAI8q9CJ7POyM/8Fy
         CQwbtkLs80v0uigVVV2ksZM4Suec9GfM1Jt7134GzfsYp6FdVoijtAJ668S/vkhkzr6j
         wdSoZbzZeHIak4XZz2uNV9a1NUYQzRbvlKhP0vwwtJl6249fLFS+DChRRPXYlC3IMt7r
         Zg/RJPT2CHZaC68o7+ep9tZkPJVoLStLtoblgr8OxXlj0bJ/VVfLzWA5IP632rye6fZn
         dFG0xAOcZxG6gaZd8vdH0MN+0Jbu9bwM+X57xyjF077WUY7nz4SCdf3o8/nESAMrYu0I
         IXtg==
X-Forwarded-Encrypted: i=1; AJvYcCW/2tfHMPTaQjmgSb0dgcKLzCUpi70EhFhO+1xj4zUsyTDGjpyIGqsbj2mwDlubcHWG0NxaAFz6/+jlD8RmPsIS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw13txJXaxgoYY234Chw34+OUtVX8hXbujJHsjJujU79upb+JVZ
	Jb1Vww4FvLBU1x8vA2SbMnGBbojexPIuL8akPoS+VGu+Lae9pynp8xTcbZ2C7+wcYz+YS7wzfp4
	C6R4kdY9vl0P8VX9HfAm31AMJbyaH6sI78DaSfpGf9a3i8E0MD+FLDLaH7VT0LytJQS9HQ8ohJg
	==
X-Gm-Gg: ASbGncvdhWHSXqJLA1EoQCy2L5M/P4tKGxmUloAGU4xoM8nGpiLVV+oCw47kIc/Ij4q
	TQVTD3fh+Iq+Uj4QUdx10z+i15bXc2QjCHRVixshRBWjIxQ8/sBr6cnGaWONlwdoKF/FcHQGkHk
	jxzyO85GhWJuydVI5myfewsfE6mzp6buM4ejbE4lRMXEP53x19die65NLbgau0gO0Wk1tCWsvKq
	R9AI52winoIjSljtwxRCBvZ96ieQ5otdQ5Jkwj6DVbWJNGWrqB7H5g2Vxb0pcBhBjM4/4+OYXwb
	v+NP0S4UtS8o8NmP0tF+8VFspWjMMY30FzydpBLPrI8moreSuwDeWQI9QRkHvvt9pyVX0189/p2
	XkHsTKPkG
X-Received: by 2002:a05:6a00:ac8:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7377a819aafmr1767621b3a.4.1742430480668;
        Wed, 19 Mar 2025 17:28:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERxS36qq0gHwG7e5rOv7rVLk2KqVI4Lx0Mv3+xfovrUKccTrIzWTB5jZrqZEoaUgnyNp+YFg==
X-Received: by 2002:a05:6a00:ac8:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7377a819aafmr1767582b3a.4.1742430480192;
        Wed, 19 Mar 2025 17:28:00 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711695b4bsm12765612b3a.149.2025.03.19.17.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 17:27:59 -0700 (PDT)
Message-ID: <fe56b19d-6ec0-4b0e-a47d-9e4dc8d798a5@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 17:27:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        arm <arm@kernel.org>, soc@kernel.org,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chukun Pan <amadeus@jmu.edu.cn>,
        Stephan Gerhold
 <stephan.gerhold@linaro.org>,
        Aleksandrs Vinarskis
 <alex.vinarskis@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, Pengyu Luo <mitltlatltl@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Nikita Travkin <nikita@trvn.ru>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Cheng Jiang <quic_chejiang@quicinc.com>,
        Janaki Ramaiah Thota <quic_janathot@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Lijuan Gao
 <quic_lijuang@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Mark Kettenis <kettenis@openbsd.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rakesh Kota <quic_kotarake@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Wojciech Slenska <wojciech.slenska@gmail.com>
References: <20250317215921.2031880-1-andersson@kernel.org>
 <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fYKU5wRNKp-J4F0DuCO-Jf5gEgAW3wM1
X-Proofpoint-ORIG-GUID: fYKU5wRNKp-J4F0DuCO-Jf5gEgAW3wM1
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67db6112 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=vUPx26DLuOswfgBSqJMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_08,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_172803_710318_055D5F14 
X-CRM114-Status: GOOD (  16.04  )
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

On 3/19/2025 2:10 PM, Arnd Bergmann wrote:
> On Mon, Mar 17, 2025, at 22:59, Bjorn Andersson wrote:
>>
>> Krzysztof Kozlowski (17):
>>       arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: 
>> sa8775p: add QCrypto nodes"
>>       arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: 
>> qcs8300: add QCrypto nodes"
>>       arm64: dts: qcom: x1e80100-slim7x: Drop incorrect 
>> qcom,ath12k-calibration-variant
>>       arm64: dts: qcom: msm8998: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sc7180: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sdm845: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sm6115: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sm8150-hdk: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: qcm6490: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sa8775p-ride: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sc8280xp: Switch to undeprecated 
>> qcom,calibration-variant
>>       arm64: dts: qcom: sm8250-elish: Switch to undeprecated 
>> qcom,calibration-variant
> 
> This seeems to remove the properties that the drivers expect
> even in 6.14-rc7, so the branch is currently broken and I'll
> skip it for 6.15. Let's see how we should handle this properly
> in the next cycle, since it's too late now to fix it.
> 
>       Arnd
> 

The driver changes are in wireless-next.
+Johannes will you issue a wireless-next => net-next PR this week?

Seems like there should be a way to orchestrate these into v6.15.

/jeff



