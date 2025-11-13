Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C04CCD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=; b=e6cL/kcyDaaNqzbdTwlWhMg2Jz
	6uVa9aDnCEVRFrCl/uH4bGjzKm66Q4wTAKnjlbslbBSWCySLOpsJZq3fChzGTXVUTNmiY+FkfszwR
	m0VPHYLBAXNe/8BVQg+VHe8IZJa7NbKq03EmfLYiuqf7SzeJMwbErxDn+0n8s3bxtxQI3EAoB1WfY
	GXJ1DTM0SoHsOlDniAQunzZDpGroI/+hRPF6dDyPNiJWVov8Z0vDpj8s6PEWJYlXg1NvVXkDCDoBL
	BbHwSaVgj7nqbKdU6pLzk2dNRU7cuCumNjzx4m1PSlxAVkUlNJPSkwA8ewQ7uue+sUaGwFAveJ44R
	mZiWoc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJdUP-0000000B3K4-14Vc;
	Thu, 13 Nov 2025 20:00:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJdUM-0000000B3Hj-03bx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 20:00:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADDgdY13564112
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 20:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=; b=fuAxD8wcsAEwL5NV
	bh1wPbEpv+tKK62AaSEWu70KnScWrWuMyJUhri/6SUyYJmD2GISZk7hmQjrkZAIW
	bKcoENtov0aleRgOVMYAQ4JDtwgqewpHJ0XSY1NSKTu4HAPlNyjVCtjjguMSFGgx
	Dl+3aF/RDg6aysVhZW1VLTpk3CzGeybZYPnOit2k/Jd9mzdf84wifHdfltosinqb
	N8O4SuZaBpnlNEAa0SXtAkWRdqN9Ks65fzTVcjUmlyJRTdEDLF1yGAMAjWN+MnJ8
	YN+RVQZwBxSKx+YAXAlZcWkeG2oPDHRXnvJ05PBji5dMGfCYFjl1qjuG6Qx18FiK
	K9/mRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvjktr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 20:00:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1003457a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 12:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763064012; x=1763668812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=;
        b=XZaWUxwoJD6cWN7t05cpoDWoQ2njUhtuaFDliZSQ9WzB74hCI0ExJ4tFRqGnBhXWeh
         q6Sohaoq/ciO/yH1nsBIeq8sFI+n/4vfIptFd7Zk6eH+Kcan4nui9hI2VPj4o7OlNRz0
         Aqal8pUXejeYMxU6kTRW0CgGZhpE4MyP64Iac7z12iSmC5yY9/WJgAdl3AQUQNSL/My9
         z3TubHOmsDrKwVH4+ph5582SBDFr73qOrtkKrO639ZwsrmnHnYLrCimbVGXaKTiGjgLa
         nK3saNgfjv/qmKTCe3y7GHvDccwszA4Z1+y/KIktkcl5HzFtdQHO+A5PNgS/RzpanauY
         cgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064012; x=1763668812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=;
        b=BsQfyaFqXBqWi8Y4ExRm8Txl1EVO1zWYajHuM75+quVJjxmhkgDnkMMb7NiUBTPHBW
         1vF9BCVwcDqrwr6QyW3IDbG8NdAkJ/U9gvsjIGKe7+RSi09DSufORSzYVBelZFZINe8X
         wRpR1lFoP/JkXN7B0Tg+e+xqjHyF4x7IbWTcji7foM1Q+SjpMaX3teg89L13qCq/L/Q5
         oAHTK9n42u8GNjviJ6vjD4+n+saWiT0GSJCQ3q7vFvFf9UDs2oYODANpA/fIsolS++Va
         XEHs62OdberGIkv1mwPVqKT9SWIzzcb4ansfMm8TFxXGuJXcp5RNC4nplm3KyOTrOkAI
         IRXA==
X-Forwarded-Encrypted: i=1; AJvYcCVZFYzAc2TlntHxpyyPKJA9z4HduRcQWIGwbNQJnwkcwJCdJiscsrGRmSnxLXIQGgnbrOXOtCA7fe7xV5JZHEAo@lists.infradead.org
X-Gm-Message-State: AOJu0YzX4cUetLHd7UY7kOkxkXhyL4DCSBmR+alQV73S/oa+HEcqtyh1
	o75vAA3p3b1uiExEcbEpovZRbc6HaTQvkrI3koKOedWGXPLBgN5G3+EejYo4ISHdYecnyd1oXqI
	pLN+VbMZbsfEvo52+4JQlD621+cQRuARjj3DxyqgTiwwQ6D9CruE1kjVV4AkbhmJTPGOBPBVh/9
	TEvw==
X-Gm-Gg: ASbGncvP8MnpX7d0wtJI4EaioPSQK3oS2gajKoB7rBSYrl9FtOty735Hd88izMQwmeU
	7WE70Bi5UE3uhadRh0FBUs1Hy05mbm3FbrjUBNaXfo+oPj163DE/n3GaPQv2Q1u5kUFU45OV7Iv
	8DcwnUyX9O8mJpk2PY0eKrRIJ2bZaFUgcceDeSR2cI38RzidovY6/GKZWAC+bv3U1WPx/Mt9t6M
	l6AT0+KpR8Cfdzh/2ahm6hWP5nh+F2oblp7PAS1RufuUqI9R3TEsGUgK1jVCaGOZPaChsO4wN2v
	rptjKbG2+lvOenqq9+GT/KUjZb9iODJX5GGdIzkFxUBwTJRA9TsvjWQaqNOYgNkrhgAJV1KaPZG
	LpPN3Ff1pFIOkuQtUMyoRXA==
X-Received: by 2002:a05:6a20:5483:b0:353:1edd:f7a with SMTP id adf61e73a8af0-35ba30634a3mr896589637.59.1763064011775;
        Thu, 13 Nov 2025 12:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ3uM6rWYFMlAKzZmNJ84R9H/A3/jUV3dWp4GW6Y6VWrqLNpi1YOXm3417OaJPss+ncsmlsA==
X-Received: by 2002:a05:6a20:5483:b0:353:1edd:f7a with SMTP id adf61e73a8af0-35ba30634a3mr896525637.59.1763064011030;
        Thu, 13 Nov 2025 12:00:11 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37507fc7bsm2929570a12.23.2025.11.13.12.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 12:00:10 -0800 (PST)
Message-ID: <fcd703e5-d483-4369-8149-a25cc733bc2e@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 01:30:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] drm/msm/a8xx: Add support for A8x GMU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-10-bef18acd5e94@oss.qualcomm.com>
 <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=691638cd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMg4Ou186bfY0pTZoTsA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: AKZrSowB6HVFuCzh6DLndDHZlXRs0VHt
X-Proofpoint-GUID: AKZrSowB6HVFuCzh6DLndDHZlXRs0VHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1NiBTYWx0ZWRfX/7ZvkmIrfVt6
 xVrZHStBr//jHsY0b2P3ZHZflW+Tw7HiH5HxV6bz71hdZHvi8h+LUJgZAbMPELz7MMntmVXd4PS
 7Qe3InceTOPR1piFukNe12y1JWnJ0PDO7Yo7CN0DsseAziKLfnb5970huv7hShpCC+J8w0fGi6N
 tbL2rgzYWVU9DjMkC0fewsOienq1fKg0CtFY32StJPNX+11bc/iFOcYD9gmeThxo+Zgv1fWPmt/
 fyvsNXjIi8NPu/MWLcp4daqYAn6KAkAyJvXFDi77zq3I5XyICSyNc5yCtmwOMBF87emnvZuCRrz
 XYiw7EO0dwcSdRbqRogyqW8FlIRYvGNG2xSHfhppne9eIn7c/MyKdk3W/SVZcJJbBrwY3LZSs6v
 6fEx6m7YKmuL8Lr/mGEVzt9RkbM6Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_120014_068523_22EA3BD0 
X-CRM114-Status: GOOD (  20.66  )
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

On 11/13/2025 6:40 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> A8x GMU configuration are very similar to A7x. Unfortunately, there are
>> minor shuffling in the register offsets in the GMU CX register region.
>> Apart from that, there is a new HFI message support to pass table like
>> data. This patch adds support for  perf table using this new HFI
>> message.
>>
>> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
>> to simplify handling of MxG to MxA fallback along with the additional
>> calculations for the new dependency vote.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	/* Make sure there are no outstanding RPMh votes */
>> @@ -990,7 +1022,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>>  
>> -	if (!adreno_is_a740_family(adreno_gpu))
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
> 
> stray double \n above

Ack

> 
> [...]
> 
>>  	/* Check to see if we are doing a cold or warm boot */
>> -	if (adreno_is_a7xx(adreno_gpu)) {
>> +	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
>>  		status = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?
> 
> You skipped writing to this register above - can we count on it
> always being in the right state?

Warmboot is done differently in A8x. We can explore that later. This
fine for now.

> 
> Do we need to map VRB, or is that a topic for the future?

Yes.

-Akhil

> 
> Konrad


