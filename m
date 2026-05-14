Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88617CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=; b=ns31vnW7aduKLs+QgcotpKFZV2
	AT+uQYoWwz7Xk/amZWYW6vNlXcNLcJWmwgOT3ANv40jhKW5eIXXP81y62+9QhqgsraaLJ8pwOBYBO
	lS76a7tgXCutRZAV0ewlU/T++ASiHUBXkgzYYvWuvMgIrZ8tz4hJRyeVyJebVoIVxQMTjl09g+Bfv
	lwZKwKVN83M3ShQmExuRKCOSgl+c8mNmpvRXeqQwb0Ju9iJvQNe8SH/RcvdTyParIRb4TQYSJvvn6
	wLm2+WuBUTDkPYMWmYqai4ed02/i7OI5yGDpPw7zCTiZQ2aPXnIV6UfbB+a3/XgoOhQCYg04sz+4q
	KSIpJOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVQ8-00000005Uj5-431S;
	Thu, 14 May 2026 12:44:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVQ6-00000005Uhs-0dxh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:44:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeR9W2713167
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=; b=P9O0CrniShmq3Pj3
	iA3WD2SZI1Hycq79Apgxw1n9nuht/0Fgw+utcmQggHJkn2eiqsVoJY1qSiV5zEgb
	LLF1lBFVB2vtjBwsIpDrIvlCv5tL+5Vsw3HWBAn/9v3pMn+NiOKf6m31VUtp2qDb
	XR6oSmqq5fhg+QpNWHXbrEB9LlYmmpVEi4pvP9NfiBRCjyuGC/pzUXOYPklNnAj9
	p5Bwce3oS79TsLxZnX5MZUjSVz3AuXSpKb0eg70Z1a85XSHCMDNWJ7TzVR0al0DY
	PvkY099ekYKVzFO+8YtJPwF2lfxAAVa/TVTMD91m9C90j/40wPOiABA6llH9PS7l
	QUB8Tw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v899g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:44:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-633526aac65so305411137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762644; x=1779367444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=;
        b=WvyBCMTzj9h2pk6UXszvsfJMrRERS3UP1luoGIAtTRs2SemUnIQzoiZpxsEqTyQIK+
         VDqoGQF7k9Amz6sgGUhxShw+n2sbNRvOHJpdcV+CrysuRvl2pghN2va6eIAHngfrpfh6
         eSGjLX99o52jjSHUqCDSVr4pLUWp4hXGIZkhj0OlSaLo60uFRbSBCinul3Q1OMI7OQc/
         FdhZ6wbJhM6SM3Q3wloIqohdtnQRp/x6R2UTMiTbpmjhmY30FE1c3yzQjOSnzjX2YIzo
         NCY6EnanLgOUoEgPEeE1WvEXR/AP2UUWvnJbhVdjw8uUpEQBmhgxtFUCZubA2t/8wC+K
         LMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762644; x=1779367444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=;
        b=VFYWMXOu66G6jYoddaTr72qrdXYISw8ARz3Zks5+fAcXqB2uWIUXMwmUnxiGJ5zVNj
         5jtLgBGTRGoDv1zK46T+wIDn7uoDo6QZeo2bMMG+FgIWSr60+zt3MT16FKolTlAAvo+Q
         5jYEVrKu7bT7U6RcF59nDyeA7serETmk+qfcja8U6L1hTW+PMc/YJZRknjZrDOh7SWXY
         OMFJODHg9bvxXYCGCl8ftUbDCnwZ5tjKnjEEP97Di6CEoYjR4uZD5sLGhCNdunu99PUm
         l2uoCPoa2o+vHdGpNRGvGuIlhqQwgFbyIznRmxXrormfjB4b/JVzYVcbOMXQISV7yoBi
         iMJg==
X-Forwarded-Encrypted: i=1; AFNElJ87dus9mCXtUWpbXFndDQbtiOyBYjx4C/19PW525KKfXhPi7W3aSLCVlmBNvGB1jEjtLHx893gHM6CEtRhYrjxz@lists.infradead.org
X-Gm-Message-State: AOJu0YzCUNJTAoOTd+yx/dVAUdkindItB195bfysQO8oRYrDcePmMC1P
	U1/2IcvcPLHkU45YvMRUg/PxAZujn7ag0+Mv74kFXvLDSreF/OUbKZp1eK94aUFoFPZg2C948LS
	QM4NraVnsDSWaMST3tQ2v31Aq1EBS3Bc5U5G461lgu+0bbNXPxQlTxdp1vYSHOjV75uSwqG0Vqj
	1czg==
X-Gm-Gg: Acq92OGi30o93qJGPAHIFFh5JWnmBOPI9Tuy6qDQWlfLFcimPy25kOAMqT27c7iO7/L
	gCcz3lBTCcMjhBCuL2NmktmlQQAT9/EA3s4EQsRIN8B0niJRybgOjPyVZKsJRW1nnN1D/KLCspc
	Hvrqp/r7BLU9P1ijpmz+CeZvqpFI8FLox73b7OXEsXE/l9+ZAr5EPjAFxlMxrMREL1QNzkR8hbV
	cRpY+df42eZoa3wPW5DL9JJ2s+oDLRKmfkuClWJvNPLeV+pHYndjjGQcWctO7Kzi0YWpRQYhBzB
	H0SHa3jretMi+I/TH9FBvsdQaELJiSQ6Fds7hgXuXuiGKJXUTS7VEyXd69vH6/pJVrsrYlcn0sC
	2ls17GgbkIlvDhqTTNp7a2uL7OrNvRVtDQTMuWlFPdry+sLOyTId1cWNz2NraBe6Z0gXTfUX5p9
	KTzb6Nl4e+Op2FgA==
X-Received: by 2002:a05:6102:308e:b0:631:3ccc:42df with SMTP id ada2fe7eead31-637750e0095mr1201535137.3.1778762644563;
        Thu, 14 May 2026 05:44:04 -0700 (PDT)
X-Received: by 2002:a05:6102:308e:b0:631:3ccc:42df with SMTP id ada2fe7eead31-637750e0095mr1201528137.3.1778762644167;
        Thu, 14 May 2026 05:44:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c24178sm87039266b.15.2026.05.14.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:44:03 -0700 (PDT)
Message-ID: <f0cd7431-acc3-4468-a2ce-7e44a915472f@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: kaanapali: Add qfprom node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNyBTYWx0ZWRfXzOHMNF9YaO3/
 0vviMlIzf7NOBniOI/RhKdBhgzm4m2DWt4790ngj/EFPfy4D61I+sDQPIgKRFL3sJG3dff7XVZG
 baIwgQtl03wb3YbDUGj95kOgqgb03fIN1a+aqw/o5tLP8SFCA4uAV22uNk+1xdcM+a59w6mLnEo
 EIbalH6qLU7WAuS1RgHXlfeORY/QzZ4WOgdNk54TP4KYY+r8f+MxWhATemwbnH6V8bt5o3jjLeC
 17qA1aG2rvJZmWz+ZlagASElzK6548HlYmQCrs1e+PQ0Q+EsmBHTd2UtxF676ikWh8BNFHtaoaS
 sQZdlezbLlAF7zjFkkSKfDqmJwbaYJrPzoNPktqqmpknac5jsz4lpzUYL97vqqURAynbiiqOvwc
 MGNy6hZIciL6+q3kAEyeJu3cVvTJEQdegQgyUVO9emcbn9lzYdlQJurXSKV2ptIif2J918QYefV
 nFVtfEY0qq5zth+bRdg==
X-Proofpoint-GUID: t0b4iG_W63G6tR9gCZKVRt8Au2tql5Ak
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05c395 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_Tv7ClR51sp9MY50WFAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: t0b4iG_W63G6tR9gCZKVRt8Au2tql5Ak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_054406_201746_CD26F3DC 
X-CRM114-Status: GOOD (  10.40  )
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

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the qfprom node and gpu related subnodes on Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

