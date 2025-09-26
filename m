Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21A4CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5iw9YhdKL6U7cNZ5d6DnDVFCM8BMpzQyf8d10H9FDs=; b=iTfVo1Ezekzfd4ktDpotkNa4bg
	B+VJNGX1El9XrG0YQhkJvui1o8dSVnYAI5VkUccfp+imWFfj1uWxTZNxaP4/sIXYjJsffBgHiVVw1
	veRk+sJ6a4Yk4Dh/E27HrXgyr/rAEmDH/uiZKMQlxhD25rK3ALHCYVcPNqln9QD35ugM41aMtfBEI
	2pTbJtnYkYGOARHd8esqCZgidGIy17BuX34ShimvXRQ6hpTAbmU+UMuQSCahphqMNCccJO5rh0Cf5
	wcxSAKRpB6FE9zL1fWGCk5IrxEIcyqXqByb8b+XKxeMmdeB0HFREdhVUatMoadLCCzEyOUOzEq9nl
	8mWXv+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26UH-00000000jUr-2ZhG;
	Fri, 26 Sep 2025 11:19:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26UF-00000000jTn-2thL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 11:19:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vq85021014
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 11:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5iw9YhdKL6U7cNZ5d6DnDVFCM8BMpzQyf8d10H9FDs=; b=VuRMzXKU+gnS18kS
	t5LtFfQUglj8gilOALItOfxuzM48Em5gZ1ZofU7Vvw0ZbxAqkRCovwih9HX8TQKu
	FaTxdCQ/LW87dRqmFEaweEukAdTFhSLOJ91kdKfNLVpGzcLYJg2NOF7XoeFKdS+O
	LDnPvlanG8tL1uXevx1Kx1uCB2+1adPFhvoxdl6m8PuluPpgKAz8Kh22+AZJcH9L
	1rRELJOCVp+TKbhxL6vVYPfPFORzEDnfOY/iL+2idFT5/+w4t7hn+8vrI/3J2qLo
	MNBycUZe9CkjCPw0pOiEqB610w3plVZ0jcext/idrT25EVFsgg0nYB+WaAPxbCIS
	t7uHYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qtn9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 11:19:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dc37a99897so3551011cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 04:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885578; x=1759490378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5iw9YhdKL6U7cNZ5d6DnDVFCM8BMpzQyf8d10H9FDs=;
        b=iPz+dJarcGcaFrK8bbZX6QbPY9maqaa7MS8gLM7fyjSRnbh+vvh0GEGDw9GIyNhPZP
         S5FPfXBfInep+bdr8S9rksgQgZlku08LaNHMQY6nuNjGLW9G0jrj6cLKhKXp6W9BleH6
         N4yN5h+f4J7sUOO3FssOIztmjmXNWqCQAxpTxHF4hY2kO4o3lA7LkXTrc6ExlbdrK9iP
         LLw7IHWmzbJtw7GNLsE2SAyqfMrZXxgfSDCMMnJ4SkniQjAxIejnglck/no7ZK46wrwn
         dN/hzoparI+bFnnsBM8ngHQudB9wznYv0vwloagCkGg6CwakBVGc10pmLQygk3MLYfAo
         K8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUQqv4RfHN/O0/I77AiHjGeUjf8yTcqVo0vFU7MNdA1vevXB0D5ePOOp3z4M0nzKCdvA1YVdCrbWujRMvS1chMV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7yaR661qptv7z02fuxNW7fuhtsTuGtWMYtF9Va222J3+DbUgc
	NQ/07a8O7CYJbyrCE+/vHkSCxroR7MA2/4U/lfjj4vxQ6+R8H8u3Fn7BmmlEpLQ24PVb7NTAeRN
	F0FE+wQpAp1/Mx6Xy4Yftce62cWp2oUoRPiS4PrksxB7d4kDHRGcurl6zbiH9MtTgBHr8CONPtr
	xTYA==
X-Gm-Gg: ASbGnctq0uu29TBKCQJeip9WivjWIlWjC/QFZ3nA3drB7uus/VbqcYqrVk0FW5QGtHW
	TOZ4r9gPjiDt0TANKQUiFOeg08Wye+HFp1CZbOW3jHtsAUerGPtnTaty+dOcKzl3tA22+KiCLxD
	DAPAQcFIrldi/AmssjJ5P0PWrtIB6hTxgvyuknLsmtzyzXmBNjm1vBdWfbpd91GMckXa9n32UIr
	4NCBAxTfFWN4ZVURiZka0oKKAVbdiQgmH4QISSujNPFBu8CcBj1Hr9hNNWkin5gE3Dag4vGOryj
	d59rQ8jBRsf2Mwo46gBXUvivxIRN/MKlxV3cWxaGlyhr32sACpakyKHNRjLdMYdOreL8pwgTTF8
	7J8HiYUOEBzMSbIoqq9nvNg==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id d75a77b69052e-4da488a2d68mr64828091cf.5.1758885577753;
        Fri, 26 Sep 2025 04:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLrcwSjz3KqiYGa3gmDGxvngYxxkxyuMkovjao2QxnzsDzIGy/cWZ23JNdN4fAp9j20t9gbw==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id d75a77b69052e-4da488a2d68mr64827771cf.5.1758885577245;
        Fri, 26 Sep 2025 04:19:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcde34sm352788666b.73.2025.09.26.04.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:19:36 -0700 (PDT)
Message-ID: <7f61ee13-c73f-4b5b-918d-288368ac2cdc@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
 <652595ef-ef79-4c36-9979-b536ca65e1de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <652595ef-ef79-4c36-9979-b536ca65e1de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AgnBT0NL6GA8kRgZnUT2lEDIT02q9gxz
X-Proofpoint-ORIG-GUID: AgnBT0NL6GA8kRgZnUT2lEDIT02q9gxz
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d676cb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=JnFwQ0sXLtjTzmeIXpcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4F1d/JGbQJOb
 AP630KLV391eNKTuYAi/19Lw30I5AnNgNwJ6q3J2FCY0MPaf5PfkReqFPiviyraZDuadEE2jeyG
 eCcfjghwHgX02e1CI8v+AjS1ZKdMT6tTTbik0KE9/HFLe7z6LKmYjf/QEk4FyF/uPDbtECnR9TR
 3laKwqYugXYMYxXvG1M+cNvaEw/Qz7+LBYPEs+ctcDW938BocLs+eC2uoWoEKm6YLvh1Ak6qxyq
 wW5Igg2nSyGxq8ZzihJ2vILpILvSpbismVxbqPa2SE/zc7yfVSPN717YXicx5iZxGR0jh/m6g3F
 mJpWymZiXjkU0TS3jjD9j7ZGmHlu/rjAzXdse40iPvB0XrHWjDIbtQTMUgfIuDF6/Ga/E9MnuSa
 LNTWaHjrhWAOtraPZKv9NqTiZEybcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_041939_737058_FF739F46 
X-CRM114-Status: GOOD (  17.91  )
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

On 9/26/25 1:18 PM, Konrad Dybcio wrote:
> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
>> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
>> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d87d47cc7ec3..f247aad55397 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -133,8 +133,8 @@ struct msm_dp_desc {
>>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>> -	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>> -	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> 
> Well, did you see what happens when you try to plug in a display
> to a controller on MDSS0 and MDSS1 at once now?
> 
> (memory corruption)

No, my bad. I misread the code

Konrad

