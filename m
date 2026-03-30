Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7429FF493A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 04:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=; b=1L56pkDz9zg+U7yRq2QQejn172
	Q6vDSrodufU2WUcSuuSlpdgd22bTaeqRhR62IGyKfraTnlNHhrZ5XQteoAddEDMbcmGZ9+1COC/LY
	X8+BOD9pNt4TrTShN+0CVVL10o91OQZPT3ZrQzzVOBoEaE6jYbi94WQ4LGGiAj0OOUAOoystMlTE/
	58hMQMPmA/ecAhbHe7zVyBnf77O4ciUDZBHirS7FXWuc32g5+S4KPy5dIU4XVT/Mm8xjY+Q7BDABb
	pS3yH6izufTR4mvCclMm5LVIefmF0s3LEvsJ9Fo3kSAlEdHnIjT1XZdnw6tWD0j1ariz2RpEKtkzy
	Q+qsW2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w74NI-0000000AbgB-2dWP;
	Mon, 30 Mar 2026 04:37:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w74NH-0000000Abfp-0YKX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 04:37:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TLnoo21936710
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 04:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=; b=l3AIVOdaeuqvAbrn
	jmOETSQtw3pc7zEzrUjosRdYNE54eGeczZ/dLO48795/ALofesO/z2bIdBQ3Inio
	FVJ/CYnmrqaH25gIOo4n+KoT3jAYFMeTWhUvstHJDi7O/nH6myjN0faCfGfBebvP
	aEjODpG1eWOIwok/s/YmH/Ve3HNM9HoloEtxxyC+2feikcxjG3xBbUWWZOko/a+X
	PTRiQyLlzIyIh9FDYFZ9gUAxM/cpjTA2kBizrvPuiuODBQ9V9lQG85onPjUcAZyF
	kjGf2Q4UpWXBKvlL1qFNZI17I5Qoy8424cS5c+fbXWgPO+XIYZwX5WfJdFO+TpjB
	viei0g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqmjch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 04:37:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so5191589a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 21:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845433; x=1775450233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=;
        b=Ag1BCkaGzEpVesUyTdSbh2scfoYq4pA7ueiQ1RA4XRa28icD/yhOEPjvx2LWAVz8yy
         FowvGJfGTkhGVCd0PcnHXa2Bp4HQz/ZFa36YAyKXC9AX2vziUoVFk4+fJC8MK7akGwQd
         yGEzmjM1ANfufyDTkvOL3FHTTH9oUa+FygLBACaMGyeogw1a+B1iJT8uHIITZ/YEqOQ/
         UqLJsS3qTSZ66Fex2tTkWvXYZQqc8ckgxm2o1fcrJpPY0RjRnGxCPlesswyRX9fX+9ul
         Tnrb68IU/4IU/QmCuanJAfeJUKNxq17NgjOGlQAo9bNuRG+jVy6wwDX8qjr8yBFmnY9a
         mdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845433; x=1775450233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=;
        b=ZUtuHFfEb55D4+bYDKNpnP5G/oHd4iUYHfQlFVT0o01GYusLM1RCztuh2LPhmXpp1E
         FWTR3m6FahCTN2O+ckfO/HdHJJ8B6cuJVqKsk2Kdj5gDYyMr9bNWicJ+UZLRbuAAYq3+
         +0quUMq5MzB4yf6I3jNuaRgIus9gicuQ6zdPZREWN6xDlmaVxoHKk5VQ2rQHxCt9y4/1
         DGsogC6hFhrEtjRpt+eBthXVoCYgUmZk03+TuUSM7nXja8CNABf0KHVyHd3jkCTCx4I7
         k6IRYhPpgSVJ/lfmV5/LaY+xU1kCSoPskOhwEfL6gjsSoFfLrxpDifGKBNQmMCZg9qrc
         6bnw==
X-Forwarded-Encrypted: i=1; AJvYcCWaszneYVBaYfkBNBYNiA4fbgHEnuqpnfIiSrvoZMpHOAhqN7anIIrHvNfLsGquQ2y5ZX7giPQfSJyLLxO8B9cy@lists.infradead.org
X-Gm-Message-State: AOJu0YxyEfYYKBglwgH11pVThULQDwykfv6DqRQEoD8yPc43tFMd6Ja2
	RFauYtjbUqFX6xx34CqX0kNOUyoZsGoj1WQCdUTEw0RAT1ZoM/qiFzDv9U7MWSM0w/4MtaLSsQR
	N8qzh7t+TfdEFcZx7m/kmSgeOmy6ifmHxIYI/5vv/zgspgKUWMY2YKLeXrjeSSkthPJBpPefNDn
	3Kgg==
X-Gm-Gg: ATEYQzxK+3ESF1cPaOlKYOn4c1aEBMSyk2KZT8Csnvl84GqdxML0Y6c0K6moF2x2nBZ
	iLlD8tYV96HhnNQgW58Fkh264xhur518663Zt7UA1rciwJAenXPv27TDEb1pabscd1p6LNAbEcY
	KQ6+D/Nuz/Y783NqRa2xfkNW1UxUDnFD313//bZv/suk2sY6uT9T6UC0DU/D47/B8fSP9PbMYHs
	R7u95OI5KLA1tL5UtSVXZmQovF0q7LKKSH0C+T1YsaE28s6EUSNsOzh+peK/gLMBiuYp8PQZJ/0
	+2Jwi2Jq5RbPK3iStfovjZN7yz+a036KF9KtCEyQqiiZNP4BROCUHur9qTFGqrJhDdnHDoprdBg
	Afdh8Zg+JXvnzx9ogFNECmr5UiaiBhBodCcNANvQDfojE694=
X-Received: by 2002:a17:903:22d2:b0:2ae:fc60:2650 with SMTP id d9443c01a7336-2b0cdcef360mr115992545ad.39.1774845433493;
        Sun, 29 Mar 2026 21:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:22d2:b0:2ae:fc60:2650 with SMTP id d9443c01a7336-2b0cdcef360mr115992265ad.39.1774845433016;
        Sun, 29 Mar 2026 21:37:13 -0700 (PDT)
Received: from [10.64.23.4] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm78132115ad.19.2026.03.29.21.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:37:12 -0700 (PDT)
Message-ID: <ad81de07-c65f-4571-a309-a58e8ca57acb@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:36:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
 <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
In-Reply-To: <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qwQ3Lh5Vo3mPsIMCI6Gpae_6LMpj7VKa
X-Proofpoint-GUID: qwQ3Lh5Vo3mPsIMCI6Gpae_6LMpj7VKa
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c9fdfa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lJRIEu0nk555g-v5qOYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfXybGvY0CwmO4C
 KVqLxSsCsVBizpsioXg8qjnoRq1xh/ISmVh69wnyoV7EvR8YTH03tuMk/z1LRnOoj1jIFQOtXSd
 iE30U6CVXmM4Yeh5FvANQwvvfl8nBePCSN7G5P89j1U1ZBmDXQJqHGdZmVM1H96asQb917dQwbd
 o2bwfJi5Mddw8WMx270eQQkCQLojvf6/HyIQTaB8Z2nFYD22aOzH6bPv8jxPidlwVQBCHntyL9K
 CxmnijWS6pfkYjBTEo6QzG4eCyPkyO4KCfJdXYCPIR8sZKtdRUmHBctUvrjPgk5FuJvt1/zVv8e
 7ea7rRp/G7kzXXtlFybgeL2EduKCGDREsAzwong/+4gZZY/jXWgNFsoqY5tA28cDYKIkRRYtRxZ
 Xz8n/BW+2GP02b7cK1IBreEZniT2CiTImZtWamX3YwHw/qudabz5Y8ZFs6DP/k/pzUTilbfNtP3
 SQdkl5cqiTalhY1Hq9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_213715_174299_D7F4EA44 
X-CRM114-Status: GOOD (  17.43  )
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


在 2026/3/29 19:08, Dmitry Baryshkov 写道:
> On Fri, Mar 27, 2026 at 04:31:01PM +0800, Canfeng Zhuang wrote:
>> The monaco-evk mezzanine connector supports a robot expansion board that
>> requires UART6, which is currently disabled. This prevents the expansion
>> board from exchanging data and control commands.
>>
>> Enable UART6 and assign the serial2 alias to provide stable device
>> enumeration for the expansion board.
>>
>> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> index 565418b86b2a..0b26861eac02 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> @@ -21,6 +21,7 @@ aliases {
>>  		ethernet0 = &ethernet0;
>>  		i2c1 = &i2c1;
>>  		serial0 = &uart7;
>> +		serial2 = &uart6;
> 
> What happened to serial1?
> 
>>  	};
>>  
>>  	chosen {
> 

serial1 is used for Bluetooth.

Bluetooth support has not been merged yet because it depends on the ongoing 
M.2 solution. Once the M.2 solution is finalized and merged, the 
Bluetooth-related DTS will be updated accordingly.

The relevant M.2 work is tracked here:
https://lore.kernel.org/all/20260317-pci-m2-e-v6-9-9c898f108d3d@oss.qualcomm.com/

The initial Bluetooth DTS work can be found here:
https://lore.kernel.org/all/20251113130519.2647081-1-wei.deng@oss.qualcomm.com/

Canfeng

