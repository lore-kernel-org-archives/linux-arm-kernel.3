Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B060CD4849
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWMyaNg51yAfSqWuMQm6DsWh4pCeuwKPEWjNwRpWJFc=; b=xDAoRSxq0ulXJ0NnrFX+R9GrUc
	xRtQmWNsXVhvJgFEZW4oq1TdmPUW0yGE34ff+FrlrDyasbXaBGbanmODPkAKiwUd1D2SjlpMMSydn
	w1RMnQxwpH53enHdPxz3GvLlfHnoq7rmJwk7j3nCpII6G9E4tDrtMXmRXhdxdzTkkmfBJxC6+i9Ru
	8rL6djqEQhZHvyX9ImzPmndu23VlXMGbrQldDjLoIf4mgDTGkQxx1gXx08uXiiAT1hbjCeIfNDFUH
	JGPMUmeUMpum14zd4qex81qkrK5goo0DidoUTQpClEjPMnmFbvGG9bLxdzux1SQEopOsnq6IpvN25
	EskIFcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJI4G-00000009W74-1V1P;
	Wed, 12 Nov 2025 21:07:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJI4D-00000009W6d-48NR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 21:07:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACG8SXx510656
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWMyaNg51yAfSqWuMQm6DsWh4pCeuwKPEWjNwRpWJFc=; b=dvvDkzDVzUeQRl9f
	VrapumChgiXe5wG4wMkNAAmc2X+v0HRLKhYGwECmwLn5SDxIJ/dG/L89sSSR45qP
	ws/IZSe+6bPavyd8gMfbInM3Vv7+zndUAV5zTFh9Y6OpkBqTNSRsaRRbYP5cduFh
	CWIGmuBHr6CPR6DZ9CP5ozuz6ll0/H859hD/xnRJFd/1ZpqZYXtlIFIachq2RHSu
	sKXNp8q1MWPTPRoWierLXH2yOCmctffd4K/7zW9wQSi6Q25dXAYbl/036hXGPNTS
	6DEQYSJcnphMTKRTv5QBoptmROh+jLflb8MXJeXYwixIjZT1LANQj0T8y7PtViCw
	gIt9tw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdgj96s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:07:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b895b520a2so96178b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 13:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762981668; x=1763586468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWMyaNg51yAfSqWuMQm6DsWh4pCeuwKPEWjNwRpWJFc=;
        b=Wopk12xhHX5fdN/LA+1Jy3n4ue5AHoZo5m05sTqGvx3mA0a9qwM8heQS6p+seA3Ve5
         vjlLV+sunyBERtWxxzXO6hwo4X4vCEEs8df8GoOZDba2ujFEv6kjvFmE3SJB2F/z51tO
         jMxNMw63FnbW3OJ+1tacLo4sws3izyF1xoQSQIniw2c/0/VMOO0dasXLbOXrF/taVCLq
         PzzJt/T2/6l+IK8GAH5KhvQ8khbFomnwqgTvBxxDQZPD5U7omtBdTBM+ugDZmBM6HOk4
         q6DcelS+LWuhLAnxnamuLfetZWg7DlRiTgPCtebAY+ZysVwf46ufdGNpLn68sIUfsity
         P2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762981668; x=1763586468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWMyaNg51yAfSqWuMQm6DsWh4pCeuwKPEWjNwRpWJFc=;
        b=LUu8F4yjnXT1QsL/QG4vKHnWteVCgmEv5Ngdq6j+4siNzsy2wske1oZQ4j30dcDHBj
         Qus5QICVkdklJdTOXgx8gmLCq2P2aWlvb6s6EyyZ8EemGV82/8Rs0XjGNAybu4coSGXf
         S+E77zKKCMdbPmIBH5gd/pLFResp5tida/v0SeXZhyQfa1Ap1nN1OniFXsOUDn8VvT+1
         nBFt138N2DqFfZQ5ktrCyVm2blCBJFJwOa2+0+MWyKls59/aNJ7QEImNRmyzgr5mUfec
         pKgh9IJoX77/Yo0P58/jqBRC6I+VwnggYsXfC8Wuo9+v8pianD71aT0H3E2vVLX0ZCyO
         YSKg==
X-Forwarded-Encrypted: i=1; AJvYcCXD12ggc2A8MQ9R0Ebdj3/MPO2QSuffaqNvP8d/sSa/xD/4cPw0310kUY1O2NIQNCMEgWgkIcTCxuYZDdUASJTV@lists.infradead.org
X-Gm-Message-State: AOJu0YzxN4BQbxuZiGaOnFJuS3Q7XUm5XZ8Wf7eqfPz1F92SczKd659j
	GmF+s2irulXvHJjWM1N9WvbWr/Kkrxk6XGQAK3ZX0x/WfJ85SOmkS/4caSl/cu3LRlVBGs2MVN9
	jHm6+zkzlYr9DgSRh9l0AoH7C2F/eHK0f/QLMmCKZV8l5F9GDyiHwpQq5UzD+T8uGB24cKJDdnN
	gaiA==
X-Gm-Gg: ASbGncs31M4bpqmmRXTh2nXfGt+kAYei03yvohO1WLgfwl/xZ4dAoME9g4Y1uQ+GI+l
	7Yglg7ZeEDBuDpAe+LTm3rhBFIkzjTkHl6gRqWdy6LG/HDEYrXbKFxobKwpE2wrh7cSq1uiXIN4
	e6ZlyUaxs2ES4DHQUYjKx+nEkstWuuAwn5dV62NeGStsg3vJTg07c9zlgNji2ZYTbdF6Ms77mLO
	DFppYvECfCxuNJ5FGxtcuG7Jg34RsqeiaGZH9POaCGQTBUZE3rbuljS+0i/Er169xhBAz6aosyM
	23LvgQHXJOHtEDHKnt7xFGiwN97zXSn59VJx1wQRPvLr0QHktKuPIj3MdODfYWj2AJotc/Pa2iF
	yQpSFVb7TNjImlz9uBVW3kA==
X-Received: by 2002:a05:6a00:9508:b0:77f:416e:de8e with SMTP id d2e1a72fcca58-7b7a4edebdbmr4669560b3a.26.1762981667629;
        Wed, 12 Nov 2025 13:07:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKzD5r9VfuhnSBaFB/wMVsbTr573DGBz89wF4dbIOOszP4AA+4sdkCrWHfyRuslYFgh/6AuQ==
X-Received: by 2002:a05:6a00:9508:b0:77f:416e:de8e with SMTP id d2e1a72fcca58-7b7a4edebdbmr4669532b3a.26.1762981667046;
        Wed, 12 Nov 2025 13:07:47 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c0874bsm19343016b3a.16.2025.11.12.13.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 13:07:46 -0800 (PST)
Message-ID: <7ece2feb-79ab-478e-936b-607cfda22707@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 02:37:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] drm/msm/a8xx: Add support for Adreno X2-85 GPU
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
 <20251110-kaana-gpu-support-v2-17-bef18acd5e94@oss.qualcomm.com>
 <f9aafd73-fe4a-4399-a0c8-0da1c109283a@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <f9aafd73-fe4a-4399-a0c8-0da1c109283a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=6914f724 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wj3I1jakp0zn3Am71_UA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: f6eLi1Z6iWuGq6Bx5-e6-h6c0vq0i52a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3MSBTYWx0ZWRfX84RJXeaoVMPG
 tYcqVsH6We2xtdM00zYHuLoXdoU8pBVzQrHs0+rC+ZdVyFGjpfOSrGIN8cqZk1oh2FpmcM1Oba9
 r+JmnGnWEpmbrziapmdWAWsfQBlV4lI3AHkEQbyq3t2L834O8AXemfM2qR2WsABLbdHGeLG0G0X
 fu2KRxoic8LmuabzJ7ciACVL8bgHkididq2/6Js9qCbiVgFUtRxpcPkJqYkCu84kuggDHyEtQxj
 pbQSpwpjL2XYjlftab6bFB2wbxxIGab0U/M9azSjRob4R5Hs48jQHznVdF3Mb1cZ9VgxUWCJCbt
 G/1XYZjUBktPVVSC+PK5AWjpJi0ihdo4YxrzRl9CwTmsEanG7RClQ4nL+vX02SdHgYo5KbEdwxm
 0Xsr4HlUsUhVf8q7vBdlobx3Akb4Tw==
X-Proofpoint-ORIG-GUID: f6eLi1Z6iWuGq6Bx5-e6-h6c0vq0i52a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_130750_035693_9FB3D86C 
X-CRM114-Status: GOOD (  32.72  )
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

On 11/12/2025 8:11 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
>> series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
>> on the new A8x slice architecture and features up to 4 slices. Due to
>> the wider 12 channel DDR support, there is higher DDR bandwidth available
>> than previous generation to improve performance.
>>
>> Add a new entry in the catalog along with the necessary register
>> configurations to enable support for it.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 131 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   3 +
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 ++
>>  3 files changed, 139 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index fa3ae725f389..2e5b0573c212 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1625,6 +1625,108 @@ static const struct adreno_info a7xx_gpus[] = {
>>  };
>>  DECLARE_ADRENO_GPULIST(a7xx);
>>  
>> +static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
> 
> It's certainly not the same silicon, but a830 sets a bunch more regs
> here and has a lot more comments in kgsl. Could you check if any of
> these settings are required/beneficial?

This list will see more updates.

> 
> 
>> +static const u32 x285_protect_regs[] = {
>> +	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
> 
> In case anyone asks, there are simply no registers before 0x8<<2
> 
>> +	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
>> +	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
>> +	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
>> +	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
>> +	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
>> +	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
>> +	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
>> +	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
>> +	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
>> +	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
>> +	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
>> +	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
>> +	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
>> +	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
>> +	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
>> +	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
> 
> 830 has start=0x03cc6 len=0x1fff but that must be a bug unless a lot of
> registers have shifted from there.. I see there's perf counters so perhaps
> perfetto-proofing?
> 
>> +	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
>> +	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
>> +	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
>> +	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
>> +	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
>> +	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
>> +	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
>> +	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
>> +	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
> 
> 830 has len=4 here, with len=6 you can't write to GEN8_SP_NC_MODE_CNTL_2
> which I think may be useful for UMD
On A8x, all non-ctxt register configurations are moved to KMD.

> 
>> +	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
>> +	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
>> +	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
>> +	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
>> +	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> 
> This carveout differs slightly vs 830 but I think that's mandated
> 
>> +	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
>> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
>> +	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
>> +	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
>> +	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
> 
> This differs vs a830 but it's kgsl that has a harmless? logic bug:
> 
> { GEN8_CP_PROTECT_REG_GLOBAL + 40, 0x1f400, 0x1f877, 1 },
> { GEN8_CP_PROTECT_REG_GLOBAL + 41, 0x1f878, 0x1ffff, 0 },
> { GEN8_CP_PROTECT_REG_GLOBAL + 42, 0x1f930, 0x1fc59, 1 },
> 
> (0x1f930 is overwritten)

I think this overlay is intentional to save a protect register.
Otherwise, we need to use 3 Protect registers to describe this range.

> 
>> +	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
>> +	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
>> +	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
>> +	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
>> +	A6XX_PROTECT_NORDWR(0x27882, 0x000a),
> 
> These 2 seem to have been changed vs 830 for counters (all good)
We are not opening up the perfcounters to UMD for A8x at the moment. We
should think about the UABI for perfcounter before that.

> 
>> +	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
>> +};
>> +
>> +DECLARE_ADRENO_PROTECT(x285_protect, 64);
>> +
>>  static const uint32_t a840_pwrup_reglist_regs[] = {
>>  	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
>>  	REG_A7XX_SP_READ_SEL,
>> @@ -1809,6 +1911,35 @@ static const struct adreno_reglist a840_gbif[] = {
>>  
>>  static const struct adreno_info a8xx_gpus[] = {
>>  	{
>> +		.chip_ids = ADRENO_CHIP_IDS(0x44070041),
>> +		.family = ADRENO_8XX_GEN1,
>> +		.fw = {
>> +			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
>> +			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
>> +		},
>> +		.gmem = 21 * SZ_1M,
>> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> +			  ADRENO_QUIRK_HAS_HW_APRIV,
> 
> No preemption and IFPC - I supopose the smart thing to do before we
> know things are stable

Right.

> 
>> +		.funcs = &a8xx_gpu_funcs,
>> +		.a6xx = &(const struct a6xx_info) {
>> +			.protect = &x285_protect,
>> +			.nonctxt_reglist = x285_nonctxt_regs,
>> +			.gbif_cx = a840_gbif,
>> +			.gmu_chipid = 0x8010100,
> 
> Is this the chip id for the final revision silicon?

Yes. For v2.

> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index ad140b0d641d..d283d0b55623 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -175,6 +175,9 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>  	u32 val;
>>  
>> +	if (adreno_is_x285(adreno_gpu))
>> +		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);
> 
> kgsl sets this only when turning on hwcg (bool state in this func) and
> on a830 family - should we turn this into an A8XX_GEN1 check?

X285 is not strictly Gen1 or Gen2. HW development is not really linear.
I might update it to GEN2 in future when we add more a8x features. Not sure.

We can revisit this when we add A830 GPU.

-Akhil.
 >
> Konrad


