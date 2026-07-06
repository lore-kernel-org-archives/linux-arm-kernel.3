Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C6DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=; b=4nmPADWeEAUWzL4O05au/C820h
	+9eKQ7leh3PHM2jS2jfmsE0rw4I28l5BByByjfVR6F5tbia73TIXEi1lcLHcgDhkFYa+bMVaUuExH
	+PQqDtCazoyaLtRgRZtSysf+7UeP1XaGDgukQGE6HnAUKeUoEO8F7pD415GiygRVtqbJU3ruL/9sF
	ZN0HvP5SrNz0Vx8Nr6a7P+QDCBLoMlbkdOW0HefLNFh0KAN6UYSnf11RG3vXgo4qr4v1bZ+VUU0Jp
	6659C2rDHwcUeXe6he8dJ9mlcLX0Sk/OW1QcoDlQQNv6Y/qE1Ea6XBCyIisK53cm16oiFR8tqGK4j
	kBHS7bpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrIf-0000000DgiM-37T9;
	Mon, 06 Jul 2026 21:56:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrId-0000000Dgi1-305V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:56:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE4ER1428809
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=; b=aSlxawR/BBrrsLrp
	S3V4J3GgdBLFVH5XsOppLOymMo59D1CcyK+MsnVve7Xg8I93VdIAqy/Rb+2vPqjr
	qo4uc1b5gPUwyAagrMaFTdRWnCjyA8JXRU+Ip7WGUxq8dXhqxZ8ljDUCSvgRBZHc
	v3HN1fyYz/aBTB9jd9QYwx229j5YIT9hrUHTIniakWSL5de1l5DDGqjbFPPB0Usy
	ctjuHWEBvMsAIi3PIFQrGdnIRUWKEPo82upPFGkhkapz+jPJK/YB7Mutu7vmLS2J
	uXtkmaiJcgYuLaMCiV4VSNSLtKM1svV0ILMYxrVktt+/zD+eGP7+rwJulfaj8iG+
	vbvbfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxupsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:56:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so37631a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374982; x=1783979782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=;
        b=gHnAnpzJ3G2UFuVKJfKrKbhko680oLMWHP2cOSx7aa2e3xZGszOsWdF3wOfv59e4tw
         XxnnwKhqg/FI99O2uIEsH1EUNQry40KuLR7TMqww8ogjUthDETv0Q3GVqF9NTbukEK3r
         34pHFc6HPPCYMFvbBiJQmUSS6HE9yc9A9sgONrTC0gOy7YTbTapJ3qkF2zyXaS0rJmTd
         iUMqdqkM0YZPAqu/LvmTgF+4NC4cVkrU0+NcSe88BaVFKUUjlXc34yC1A+cISHktE0D/
         jB6EOtYzsfpmDiWRpZvZXHEO4zildEqFa7AecXdWNC9+noE0SQYsuCtCeV6C+3DzYRdt
         ImJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374982; x=1783979782;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=;
        b=InhGFk/8ZvYpBNm5EdGvmqSy0aNBcZ8IVvLOceqmA2harLIuwfOYB0G9uuZtaDJmig
         o/lYjjbmFTfZ7VfpgOMHO4a6QQ6TTx6hbdyXztUxq9fQelWU7oN8bfjKVZmdufWQIPOE
         XzsOyYNM3F8bwuaS8Nhs3xlNtO3cFQFU0Q+ubZ3ptMTdHZMsPjaDUD6tzZ63iuTZ5Fox
         9+pnvncIULLq5/kY70VQWb1l7LjHq9jDVwI4d5MWtMYvSLTSHwotuPKpE6vbSsuzG2s+
         VaESHwHSOXBcZH6I0QEBJIvQys7XR98r3jongsoND50iwqQ5fSANNJwVPPqvDjDJ7GdY
         A9Ug==
X-Forwarded-Encrypted: i=1; AHgh+Rq9W7J8NIwL+GFA8UBX/D+2oldjje3OUWNnLOXiDZ4d21ZcEUftBUWbsJXiP0vVfAdd/0W9zu2aBhXNSzgsHKOj@lists.infradead.org
X-Gm-Message-State: AOJu0YxphpXJe9dadqcpZY4FTFtjAfvNbMEOTSuLXPFeEy8by8wJQrnL
	plfIJbXfX+VZDEXm/kjoPJbgznJLZrt3QN4qTRLdL+y5OIcK/TNH9qMzn1zRm+PsdDIQTBhX+6a
	4LaSBAMtrCkexAahHVTgQHDcRllfiP88rIKf0VP33OKyD9rDkueX2geN2Yu4gnCvR8JjHSC+GoG
	NllQ==
X-Gm-Gg: AfdE7cmdhwGL9BffH8xmuJ8lLATCkW7tGo2DnprhTMehTWk9O2fDPI0PBkT4MPs8mdi
	NiwS+8PL77YnH2Hkqys6Va/dqLZ0MiTJq+fgeis55poU7O9IcP9dgldy3uTUwaPCuQeqKnZTVn4
	hZpeq+le7PuKL85I3icwJ5pNscMoy9gJKWZGcWn2s86gFMqCzuU6NIKmYOiZLqcHPm3+tNRHMtt
	08koOUpDbZM7rdOCayuTjO4wKcNQ8tPdebKaDd3hJd9TfATB9dClKUeNwEh+o0Gt4HJ8d/iPM4/
	1eFLz5gV9FeNzm3JeQqleWTcuRiv3YR7MeYd1Jqb+8NOFula73gjJz5cEcKap/qdjFnIcKM/GnE
	iLylVnD1C4IUrjMJohpgNF9+krEQiJS3+mAo=
X-Received: by 2002:a17:90b:3a48:b0:37f:ee3a:12a with SMTP id 98e67ed59e1d1-387d6b978a7mr102078a91.2.1783374982393;
        Mon, 06 Jul 2026 14:56:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:37f:ee3a:12a with SMTP id 98e67ed59e1d1-387d6b978a7mr102043a91.2.1783374981910;
        Mon, 06 Jul 2026 14:56:21 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311748394acsm762251eec.8.2026.07.06.14.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 14:56:21 -0700 (PDT)
Message-ID: <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 03:26:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
 <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e9ygSFc2PMZnjjrrkGDarWbF9W6mhWND
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4c2487 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=mx_oZ8J27MAni7-wUjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyMSBTYWx0ZWRfX4iUCTqsM/8DY
 uxGiimrlCQu7STvnZzbeex5KZSKDoMLzS8JfhGb89VLnn0fgBnu2/qR3Kr3/K5JqcDkCEQXs6jT
 xH32TI9dpzGEa4YodLeEPv8tG+RX1O8=
X-Proofpoint-GUID: e9ygSFc2PMZnjjrrkGDarWbF9W6mhWND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyMSBTYWx0ZWRfXz/WGYFdXvso2
 sbr2+ft2ABagvXjpHamAwHJKJOpvvf/SOxuXv+IKzcPpFJ1CT+WE4BitPo5ZR1e2fArxkYXFuRS
 NaXyA2vAfNOaHyRfkkuPhzofZm83NoaxH6Tgo7Vams9csFPrfPV3/Nrmz7Muox8LDe0B8mxFzI1
 NfCrBYab7hqPIZXnwDbwelnNPAQmze4nplBHFoUX6fZwIkd6qIdtG1Bd2dpA49mxVZ3BpvspUPX
 ErmAQb2NqaqaupaMIPgHa45Huls+ROwFCRHvksX0lh7gEiLd6dQsuaFWZ8pGT88MJ1rAHAlTWX5
 BFaZVdLOk75JdCsJIOXL6yP9wCsPfx7al2ZXnvxyl7Au6C3Pgvbg5j6eM0+f9lBUFShPd3XvxG8
 xkjnKWvuaNUEBUwjJVgJ7O+uszN6hCZRQfDR/8lOdb86N+H/L3WmgzDYpu2e2D5BghHJE8lcuO1
 CJNdVeVrpB/SyEzQbGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_145623_781386_84A95DD4 
X-CRM114-Status: GOOD (  16.92  )
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

On 7/6/2026 4:37 PM, Anna Maniscalco wrote:
> On 7/6/26 10:44 AM, Konrad Dybcio wrote:
>> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>>> Program all the register needed to start up LPAC and send initialization
>>> sequence.
>>>
>>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>>
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>> I believe some/all of these writes need to be guarded by if (has_lpac),
>> as many GPUs lack these registers and there may be side effects on
>> others
> 
> That's correct yeah. I'm not sure what has_lpac should be though.
> 
> Something we add to catalog? Or checking if it is a gen that has LPAC?

We can introduce a new QUIRK (ADRENO_QUIRK_LPAC?).

> 
>>
>>
>> [...]
>>
>>>           a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>> -                              sizeof(u32) * gpu->nr_rings,
>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu-
>>> >lpac_rb),
>> Should we rename nr_rings to something like nr_XXX_rings
>> where XXX is some uarch-generic (i.e. not SQE because we also
>> support pre-a6xx) name for the main number cruncher?
> Qualcom calls it GC so nr_gc_rings perhaps?

How about nr_gfx_rings as those rings can handle graphics workload?

-Akhil.

>>
>> Konrad
> 
> 
> Best regards,


