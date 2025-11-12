Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DB2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UD4Gbr1H+DyzPCYqHbTvNAKVexCnZ/nezzgxwkeMezY=; b=x08m6DVOKRDD/PhwyfK7Kk+VOZ
	MU3twdQZeT1oLKHEuWBjVILHDD5gpc2+qe06Mhz3ovjivNj7xxyXqjmXzCOCLarDjiXU6H8CQo6N3
	6Tv6v2egtUAim158wU9GRUoL48bgZr6iAta05kpIyLGNr7Ud6JgL+eaMk87tkeKrB96uRx5ChBBLq
	HanSbWxqNj0XW8SiIx0m4Lo4T900vfl+c+YY7sgJOR2HCX3Y6oCsNOIBFMhmCJNgikMytFxwLNGlI
	v598lYaAhRqAmDmFPlF/VcfRfufIglI9Ok/tUROWua3GXWauhQLM1sCWyKb67Ks4n5nmLbUpTB2pc
	ZRhSgXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC2R-00000008y1o-0Dph;
	Wed, 12 Nov 2025 14:41:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC27-00000008xae-0f3u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:41:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACDsCnu1314289
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 14:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UD4Gbr1H+DyzPCYqHbTvNAKVexCnZ/nezzgxwkeMezY=; b=bmUxz52/Iw9SLV8Q
	cDUdlkCUELernVB3ZD4vXVxAzAyfyjHPRV4xCAJlngjnNUtOc6Byq2KNxi/tStqf
	CUjtiJ4fgX8eoTQr8IhP2KGRNEbmNq9E0TB84wQeSeq/XADx+e2QFXlfG84dcuKP
	S59yKXRaZnAY8alRrsu5X6zO7UPeoknhBNj1DtSAvUVoynzuEYF1Uho/cnPF5fpr
	8g9KVjP22Xq1igkVAhGzApngqZH3YVbgg743xPFI5G9v4SD0h47Xd6ujpigal5he
	jsAHEPMCgLDJXPhTBBNZvtId/HyXLidtmdlWv/KeeBvaA2aD2zBv3FQT65VSG2Nz
	My7pdw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuhg04xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 14:41:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so2651291cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762958473; x=1763563273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UD4Gbr1H+DyzPCYqHbTvNAKVexCnZ/nezzgxwkeMezY=;
        b=jA+kdSokpIUmbvpcR7aD9g14QYfqfVNKWLfvKc5EbefuDxVb+vlVhNJhotrP5FUhWZ
         6YOn2efeIwWiHYejwadtwDemVCzYapQDh+/vdyr1nCGb9qPdJICC+d63HXpIJXY8cDFQ
         32DLTCbX/W+itpkXraCXwTNe/u7dYW78au5uhnTi4fWNQpts2HCo7tLbpoNKxTmARQdk
         WKBFcvhGokMm9AT9gWNPPO/pRnGRtaXObTwZ6RNGiFMR72CzX/60oy3shIV9DEn1wBrl
         4NpPU85SCxM4qAAR4bP7Ve96xLrsVVevsPam4hClns89zura5FUTWMNCTFwQNFh7nD0j
         pyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958473; x=1763563273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UD4Gbr1H+DyzPCYqHbTvNAKVexCnZ/nezzgxwkeMezY=;
        b=CjHQG0X+MPuC8WBc7Tj7srXjvczOcNwXxQk6MZ478luM6hSNmYon3WyZUKmyO+JtmW
         dQ46rYiHKmHfWalQGZCAwXFOpG+PcZ9p4tIqiDDVgrDyEFvas19qb6tuuZPObUsNGLbo
         BsJiTuUEhBzAoW9PJgPoSqCcX1KcODOxQpL4uQfw/0WwmvlDdlM4Drn23rBWJeqV22ed
         I6MSuhpc+xMNiOrSkqj9JK5O/j9Ag4Jyq3532BICVd2Ijxb/GtxjAzngJiJZp46eXTVD
         +9CFX3qmtDvnAYW3UCvz1dEWqAEgz8BivsiA5gE0ktbY2fAtyf0lP6gmVQnUN6GdGojO
         2I8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqAKHVGRAEjf3Clb9bctsE7Qr9AP/YG1fVznm6xDrxXcyTUoDzescwwbXP+7T/CuNN10AhF3g+q2HebZ2H0Nwd@lists.infradead.org
X-Gm-Message-State: AOJu0YzduKasAOLTN5T+kTn3LEZP/iletcIGHcfvdz1IwUV/Pg69ZA64
	tO83+sOYNZaHWgPWzcI3zBG4jyL+ovEmXQse2bA/9GCzN8WTxiODdf3h4FNHtZnbKkIjzx6MqLB
	C3qZsfQaBqSxdLZZBQ1kuyW2JehPMN3ldGwYFcecHfSi7hG6ZkqWvPb7UGchHkbkJk+Upg4Dysx
	/X/Q==
X-Gm-Gg: ASbGncsxBFh3/c4692/eK4UpiGOhUuEiGdB/GBG/4gHyDBM3Y20yq0P179xWil0XG6U
	M+6ptEZ7/E/Lv8tvN3bSfYAdwXGot5yfmE2hJJwrcQdAItIyYxkOW0mLlV5KB1LutwFKiJaa5VT
	vGfVBzMcTT/AFqF3vIVgXy6eIFSewWP6XGkMdu01TSsX64dCXp2qwwM9wY4bg+7uuhFv2tWFOro
	NATCQ0obxuhEN3vWQC1HtYi/8+M74P1DGvgLbiUbVk5MIDAlzZFsnm9J6r64ipjipImI8blNi+M
	5e+f2m0f2QPrxpZimVr+Tj9zqYShyJFGLcQJ1RGtuNVAZmdWyOQ6C7IlUQe1lEzTaRLP1RXd7OM
	kh2Rt8IgZDdg/L8GAQJpk0H8hHGQjeCP3WUklseYitPSigHktec+4TwxS
X-Received: by 2002:a05:622a:728c:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ede2dceb1emr8250621cf.0.1762958473410;
        Wed, 12 Nov 2025 06:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXNVu4MbvjBQmXxL3FDdcuNjCm2cJCAQ1jZODPaFYu8y34KljTh9u/VDha9brFuHl1b+1Ffg==
X-Received: by 2002:a05:622a:728c:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ede2dceb1emr8250331cf.0.1762958472880;
        Wed, 12 Nov 2025 06:41:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64169852018sm9952464a12.16.2025.11.12.06.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:41:12 -0800 (PST)
Message-ID: <f9aafd73-fe4a-4399-a0c8-0da1c109283a@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 15:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] drm/msm/a8xx: Add support for Adreno X2-85 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-17-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-17-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NbnrFmD4 c=1 sm=1 tr=0 ts=69149c8a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BrXyDZ9iCYK2Fy0JuVIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1lCz2PS_FIbnlPM_mHzYjvhrOXEYbxy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExOSBTYWx0ZWRfX/SpQ1K5i6n8G
 q9xYDDXmM/m1Uhs2CYQH5iWXNR0t9fkoVV0v+fv8iAyn5RI8scKDS5PDHahjJfenAUrrge0IcAO
 jxZD8QCRxKe47toB+eWSFL/gDimCBClYxg0dpf5Fa5ds2EI2BGMAJOEw3RZLEMG3s2AdDjPS0iW
 Qrqi/1n3r6r4Ghrni3rKYj/7Xb5xo/Dl/Y10TU/xrjROZExK1S7oqfy68+9FtVgSSBTsuIetoD6
 mLn6zgS498rgCLJW8+CCpsMHRPrT37+1LsrtW0jHjUu5HH9QTFRGuiktACMotux/4ES3nB+0Bje
 SguFrzPQhlcCtBl4a3r976KzCQwwggy3b0E3NKkZRrlqNYK67biwlymWQ0v34Utt/kpLoh0L/KE
 Mer4g7LHE9rEqWEJmrqJCqnWTjy4fg==
X-Proofpoint-ORIG-GUID: 1lCz2PS_FIbnlPM_mHzYjvhrOXEYbxy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_064115_262076_11C1F230 
X-CRM114-Status: GOOD (  28.19  )
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
> series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
> on the new A8x slice architecture and features up to 4 slices. Due to
> the wider 12 channel DDR support, there is higher DDR bandwidth available
> than previous generation to improve performance.
> 
> Add a new entry in the catalog along with the necessary register
> configurations to enable support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 131 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   3 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 ++
>  3 files changed, 139 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index fa3ae725f389..2e5b0573c212 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1625,6 +1625,108 @@ static const struct adreno_info a7xx_gpus[] = {
>  };
>  DECLARE_ADRENO_GPULIST(a7xx);
>  
> +static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {

It's certainly not the same silicon, but a830 sets a bunch more regs
here and has a lot more comments in kgsl. Could you check if any of
these settings are required/beneficial?


> +static const u32 x285_protect_regs[] = {
> +	A6XX_PROTECT_RDONLY(0x00008, 0x039b),

In case anyone asks, there are simply no registers before 0x8<<2

> +	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> +	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> +	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> +	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> +	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> +	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> +	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> +	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> +	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> +	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> +	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> +	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> +	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> +	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> +	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),

830 has start=0x03cc6 len=0x1fff but that must be a bug unless a lot of
registers have shifted from there.. I see there's perf counters so perhaps
perfetto-proofing?

> +	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> +	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> +	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> +	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> +	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),

830 has len=4 here, with len=6 you can't write to GEN8_SP_NC_MODE_CNTL_2
which I think may be useful for UMD

> +	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> +	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
> +	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
> +	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
> +	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),

This carveout differs slightly vs 830 but I think that's mandated

> +	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> +	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> +	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> +	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),

This differs vs a830 but it's kgsl that has a harmless? logic bug:

{ GEN8_CP_PROTECT_REG_GLOBAL + 40, 0x1f400, 0x1f877, 1 },
{ GEN8_CP_PROTECT_REG_GLOBAL + 41, 0x1f878, 0x1ffff, 0 },
{ GEN8_CP_PROTECT_REG_GLOBAL + 42, 0x1f930, 0x1fc59, 1 },

(0x1f930 is overwritten)

> +	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> +	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> +	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
> +	A6XX_PROTECT_NORDWR(0x27882, 0x000a),

These 2 seem to have been changed vs 830 for counters (all good)

> +	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
> +};
> +
> +DECLARE_ADRENO_PROTECT(x285_protect, 64);
> +
>  static const uint32_t a840_pwrup_reglist_regs[] = {
>  	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
>  	REG_A7XX_SP_READ_SEL,
> @@ -1809,6 +1911,35 @@ static const struct adreno_reglist a840_gbif[] = {
>  
>  static const struct adreno_info a8xx_gpus[] = {
>  	{
> +		.chip_ids = ADRENO_CHIP_IDS(0x44070041),
> +		.family = ADRENO_8XX_GEN1,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
> +		},
> +		.gmem = 21 * SZ_1M,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			  ADRENO_QUIRK_HAS_HW_APRIV,

No preemption and IFPC - I supopose the smart thing to do before we
know things are stable

> +		.funcs = &a8xx_gpu_funcs,
> +		.a6xx = &(const struct a6xx_info) {
> +			.protect = &x285_protect,
> +			.nonctxt_reglist = x285_nonctxt_regs,
> +			.gbif_cx = a840_gbif,
> +			.gmu_chipid = 0x8010100,

Is this the chip id for the final revision silicon?

[...]

> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index ad140b0d641d..d283d0b55623 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -175,6 +175,9 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	u32 val;
>  
> +	if (adreno_is_x285(adreno_gpu))
> +		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);

kgsl sets this only when turning on hwcg (bool state in this func) and
on a830 family - should we turn this into an A8XX_GEN1 check?

Konrad

