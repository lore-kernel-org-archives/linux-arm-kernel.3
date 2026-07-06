Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2404CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=; b=cjZMKyVKoL3YgGFHX0mDfcWxuB
	tS3V/bhM8VjyMSBqpyadgJ4pmtFSRY0rI/NfL551Ij4c2RaNFdckBxXzWdMgUZs5GdFQWh3qa2rFw
	GcVKJXsT3Fypzha+2zRuHwTgUkV5WB/rSj01tihuZMsm6SToyi984/d1W7YqJnxhXs3JRBO2K3HUZ
	WCQvUnGWKmTKW4i1dc+5YAGqqcYLlH6LE+SoFqa+ygdMe2Ov19AEug2tTtBfjj3zgKDmpMwJDPIez
	kMdi/yjXXbEV9uFvtXaNe5ez1uG8GWn/dUX+Z40f9YBqCqwVHjGSlobX8LgYNmSo2MQmRFKHBjqsU
	gojKOXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghCu-0000000CJwg-3X4P;
	Mon, 06 Jul 2026 11:09:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghCs-0000000CJwA-3GCS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:09:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJWu316462
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 11:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=; b=pX48h7Tawms+LHRc
	QZc63peXyBM/dHemiteAjFnn/Dm2atMcCHHtHjAIGSpEwCzEX76VoWqNvieJ7rMj
	jhuLKOBhmpaOeHAlo947z/JyekqWGxbqJGELhYB7aQA33Ur3W4V81uTtJuQt6aUe
	/MxPQB6y04jxto9wPJ01Rgrks3cr9GydohIvzflZsmnyRbMnQw7jtzRkiFDuO2i0
	o4XEylXqicGHOBXUX7bspiKuK0uPsI9/0CDU3rDpVvoFSZJx8iBq2eX0+T5ex/dL
	cDQSYLJvAwrDYvPQOzv+bINABbftfw0HftfrJn7TStgNXU9IsFNkO1wHHqQxsbyO
	gqyJ+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7gx66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:09:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so7956121cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 04:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336185; x=1783940985; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=;
        b=UJjDRt6F2xxjrUpZI/CLxQj5amwTVfBIZvw+CFAOkAE51hVhWfJIiC3n94WK9RgwBO
         jg8EPvzyDrnyJm5GyieMHfeSsEiacuCfq2okjQ7d1+4prj0Ws4wtbPnbzP8gKBJtqKy0
         50le2pxJxN8t/Pqro/20jpwtbve6rlItwP7+wLVWxkkp1bwyA2Ki4sAVu5MGIsQeKAhY
         SZfzDKmP79b9XbVs+6VWo/SkPW2DIPJQAbv1rrmbtrwN50vImGj+/0Zd4zuuXKjXOSpo
         643EM4WUxm/PMDouMxKag9wQ6SZy5k0aBzBmh9z1GNVCTIVB97TrfvXojuMri+Xfeozk
         Rv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336185; x=1783940985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfCbzrTcTzIGJaYxsh7AivF35GEsErrQAAwwonLRtdM=;
        b=DHbjuyOubaHtcu6GXXFVUeZoboTFb2YjZdkmb2bSYBcEzlotmKgyGHrnq9QiGtl54j
         sGro/eh/OXF8ePeQPevSxjslRkU6+G6RGBW+tQExtlbSXugEVmuhdNVmzEnQKPNBjUzR
         5DrSs2FSi1HmTJrH5n2sZK1zVRJBRORHjKqUP7zwy7MoGcu74MA1IaviTZPDfqVtTym3
         ol+G3qUeTM43gtyjgAL2M0wu96Maq3mnkzlUcaeKYA7Ah6zwsYrDO+Ci4M7QXkhpT9hM
         5ai9wVc6LhtF2F9w97Gjy0XJAeueXRDNWXlQnajw9FhyRZ5g9aVRCVssO16ChgvLpy76
         vp/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6QoH1mK5dbdeGkcvWRO51d1lMHDiwozny1kWdR9WP4zKePx7D96Lz6VCt1aMQax1LeDGzbVXl/NURIAXcm0Yt@lists.infradead.org
X-Gm-Message-State: AOJu0YwDOEro8D0SQyVgPm3+i+GJz+S678KeXVU4AU9uf8Aw5kGRjYqt
	YCtOxPfr8KDz4TSO/NStuTyH7NIn2L9YtUYsRJN6NBEwVQx6KH/Mto6W79XxqLhh+pg6vU2XxeT
	+QsdHhRKPCDwPL3J9kEOgmKd3+Sjs+95UmCMQyFnWgS5H7eYOtGeqCmDthq1x5VfpPzcAj+k5UF
	Lb0g==
X-Gm-Gg: AfdE7clE92xh2EqVg2ab2i3d645uRJX85DzeItOVcbDJmHReAg7pLGM/VLgWeixjXyN
	OC92yC1KoT4pZf8+rktXyBnI0hENZ4NtHLyerNL8i6uFC6BpNOLsYsPFlKKjBSkQAjla8jexpR2
	wmAhKxIKTbamBILG8CxZyWZixqcdiFGI9I0sEe39yQSTVUfsA/8PQ8KYiJmNiS/KSKmv+wly2ZS
	OJ/CsDhqm/3qDuC6CUDyI07RbHCHQViZ3MuovVzQGUyv2xBiFghUMeXXO7map24OaFPnUBWclGW
	ZlVKNmzNuaTm9jW8cc03ogyW31/2kVvFhSak1n+PEdN3B+LDjQ6b7O2O4QThy7iUbTZjxzV6Xcp
	YxdmCkH9t69mhbk8UlPyKrblI/CFpzqBTNvU=
X-Received: by 2002:ac8:5d0a:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-51c4bdf1baamr92273071cf.5.1783336184818;
        Mon, 06 Jul 2026 04:09:44 -0700 (PDT)
X-Received: by 2002:ac8:5d0a:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-51c4bdf1baamr92272611cf.5.1783336184315;
        Mon, 06 Jul 2026 04:09:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4b52sm721233166b.47.2026.07.06.04.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:09:43 -0700 (PDT)
Message-ID: <13522517-8e40-436a-b6bd-5ed5f68f1da6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX+MpXVyI/bEXD
 QuxFqa3DTSpnHYGaBu3ft/GIm4hRph9ea5avs+DG5y7M042dAEoOzVaiH45DDaVnQNQtcBtWqR6
 QXK3hM6HCjZqiUrsx1vbG9zvLRCmzljSAirf5g1k6R5HMofX3ctHIaffvIhTywVTIUD/e2F2y3x
 +CLV4lzBqybh3uA8kPJYaOyABMfJMWby3bX7/ZCp9hXRW0lPkpJFgyo7ev8ZBzk9MA1ZymW0SbG
 Z4NcCYggdOACtAVkwNKQV2j5QKicGiP+x5F4uN2LsVkgfrqWwHi9Xu8gzGuwwuFMdYj60JgKDvm
 Pgq9mHBXoBAVnvgr5lRBPhj6VGRRsYm7NfA73OjV9/F2wSLPD/0Vdx1NRTqTx2xCaNqiGLEefht
 tc8wexFzFp+gKntkzTSvG84cZfHffaBe16am6w8rtY9p0NZ0e8vUTqsGZpcMHT/j+4qz4zRvcDL
 oxzHaEAqi0YFXgoTTyw==
X-Proofpoint-ORIG-GUID: 8fx2HEekU0L-DANQKwAwg5SBDGhg0rZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX+vplwWaDNM3V
 VVB7YuSH32vSjLfWazuMvmRynUWgvAAl9aU3RsxgxYKECJ1RUENWSuivKPggATq33j4M5UxaRSf
 nHQxWykbZTevY4h4B+mohlMm6Gicdyo=
X-Proofpoint-GUID: 8fx2HEekU0L-DANQKwAwg5SBDGhg0rZQ
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b8cf9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=mx_oZ8J27MAni7-wUjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_040946_929314_16542C12 
X-CRM114-Status: GOOD (  17.06  )
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

On 7/6/26 1:07 PM, Anna Maniscalco wrote:
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

'Generation' is very much an umbrella term that we can't put too
much trust in in the feature department, kgsl defines it in the
catalog, per-GPU. I think that's the right thing to do.

> 
>>
>>
>> [...]
>>
>>>           a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>> -                              sizeof(u32) * gpu->nr_rings,
>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
>> Should we rename nr_rings to something like nr_XXX_rings
>> where XXX is some uarch-generic (i.e. not SQE because we also
>> support pre-a6xx) name for the main number cruncher?
> Qualcom calls it GC so nr_gc_rings perhaps?

I'm not in the right part of Qualcomm to know, I'll let others comment

Konrad

