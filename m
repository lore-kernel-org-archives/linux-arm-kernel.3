Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F84CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvCSjp0KOt/6f6FBApM09wUVTIiEbjk59DEEY4ZXJZM=; b=i3pnrloPwUfqJQToTyZUr4luPw
	HxnhgKSbHuhMpraCcwLoQKrHsXz5R54LvwZum2VfG0YNWgxbOr2Nfp87PCRt75r1xGsxvdzF9bPBX
	J96P3Mfs0mwHesxMPbv0E32VOlmCxNUi0Xgj6Tx4cgooUSaRS+q6yfdyjXMzyB7YG+t9ABbdD1S1u
	idBfopHJUfqWjprWz9jAd3iBx3wLkaLQcnC6XV6FeMsW8DU2ecAJtNCHJTAIfnAJtsyzo/sll10UB
	IHrJH1IxY6XfqK1dT82p6mwMUP7+7QGYt58MV8xb5fRjpNPXS7H0k6c0G2yE74+wE9IR55l6I6Mlz
	DqTdHKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUN2-0000000AGK4-03sQ;
	Thu, 13 Nov 2025 10:16:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUMx-0000000AGJ9-0NR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:16:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5S9Zs3440489
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvCSjp0KOt/6f6FBApM09wUVTIiEbjk59DEEY4ZXJZM=; b=f5DuOwsBWJ0oPJ+7
	++1/bYzbYnOZyBwTIJIWwqoyhNJ5WsFSghy5OJPBoG61kMMQiXlg1sGG0njxd/M3
	+I5c9QK50V1RukgWtcZFN60ZxIu7n1XRRJ1DUQJkkyoybnyq/cAFcWp1GD23r5qy
	scktDcFNQip6wHIfZtNU38GveonTYxyONtE+7Qk54yaxRQL4xquX//+7XP5JXfm1
	hyfNp5cYTkRppB/Svc81t+TC+VKy2695vxHIQSUm/RmaR2XjiDjOYzquZxNZTSCA
	Mcp2NOTcMjJnplxn4M6ro3fG9g2y+O5/9q4xjis1X5OEGp9zamXxJ+InSx+1mOZW
	dV7RsA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9788wgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:15:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8824bb12211so1994736d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 02:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763028957; x=1763633757; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvCSjp0KOt/6f6FBApM09wUVTIiEbjk59DEEY4ZXJZM=;
        b=dxtOQNHywP5cbrn9yZS4HMiSnrgJMpnlW4S7sd+3KxTrxGYgXC1RiOZ13T7yqNGqgH
         P7Oifl550035q6M5RPLDWDqVBIXn7R7LKe2nKxZkrZN8h185tZPsouXJIOtBh9KVYRaS
         l79KBBav0EOUp8s7x4dYZlkguebBAtbaxB2XRAS7o86W0GtQEpvxjVSuUDQtA0Vqrr9G
         LjJxCFocntKgo03qBgTgZU718AHzipO96IHkynC7XcooMjghDGeQS6566E4yU7XLVeGW
         L7v4i3Z+z5flM6Yl7UZuZVcyw4+Rj6PKu+Y+845UEB1D2uop7DnlQH5/teSzYOQs0eHh
         tDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763028957; x=1763633757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvCSjp0KOt/6f6FBApM09wUVTIiEbjk59DEEY4ZXJZM=;
        b=iRM+/40HRigD/riKNyhpj76o4RGDu1qu1toAX0FBOBsYKNMegLEwQuqC74BgXPgArG
         6pJJazfVa0GAX7tw6rv4HDmsAfSrLCXT4SY9TboKyfo37QLMDgGWMTRlTKm8e914gfxi
         0uIiEtAyE85pmlL2X0jqqWJ7cNXXHBh5B9fBeNkdSkOPzCMLkKtgtOBx6KzwxfHZBwkz
         u6XKwrV+/SHEhb+Xti6mLVTNu+hXV51Fqi/dXjTRhTV85FlH5KWDdyOmMffcj7Jd5Jj7
         NmI8lRNnB19p8u6J5cCqyzcEyjFBouWLIs50f5prqjPvgNg102urqhvExCHyQNbcRAgu
         hXow==
X-Forwarded-Encrypted: i=1; AJvYcCWKTFLEubawVt19PpHr0nvZCbIXE9EWZElmEEWI0pHzWTETAGpUfg1O6b3OboPz/rmvSwPDx1j9+I1QpYooecJS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3lWdDG38nlotpeLXHa/+wu30scyhLSwqo7knyXx2uqAgCNniz
	/esmbx76zX8mrCLb/cp2TFO4u6c0OKbS1vHjBdjZ2OUrhit34nt0wyiJKYFBLAC8QD4BfaGJFUH
	IzLFFfaVn239Evpyuqb/whvqQHewBtT7cRcSXQDf6sGMX2h5ARLU3z2CALPzNJ7NClld8tRoTe3
	EdKg==
X-Gm-Gg: ASbGnctBIRWvYSwIcYBynB1Q/mRWLYk3puBe2B2kPKVhMUPWyGFDzyDwgYE547MuBBN
	NL6ecFdwgfskHjvztXBQz3rfXQOEyQ3LoiQSGlkcca90vmZRp7iuaTx0H5MS2D3sevinMvW8mfB
	h48rE/NeUxUfmGp80aBNOqIVKD4CIax2ldSdMLxSziu475MjBAYRQXc+0Mv+FzJ2ls+DUNKYJro
	vQYE0dZcG6FVT4/BUZDOPwr8Ube29BBP4PP65cXpbXPXd2GPN40RoO62tpZKeDT6rD0qMYBAM82
	Sl/4FiRAO9bacXASFohN2iZxRQO1l5AzqyNi2Nt9TCqOjMEU1CxAd+IM85sQaNo/tj5iUsdE5Av
	Z/mWRn4ylJy9pdikVnUYwYxbkGWlMBxR5h26a9Z/n3T7WkwxggoeX8eRu
X-Received: by 2002:a05:622a:34e:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4eddbc813a2mr56580011cf.2.1763028957223;
        Thu, 13 Nov 2025 02:15:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYGGvlMlXA3tlMF/ZtGBm8iwPIdQWTrlzVZ71x0zfbAy4zIV6GAjpA4kAum7jiWgiDmmhH8w==
X-Received: by 2002:a05:622a:34e:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4eddbc813a2mr56579561cf.2.1763028956628;
        Thu, 13 Nov 2025 02:15:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8775sm1137866a12.5.2025.11.13.02.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 02:15:56 -0800 (PST)
Message-ID: <aff7043c-0029-433c-9340-22718909e583@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 11:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] drm/msm/adreno: Introduce A8x GPU Support
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
 <20251110-kaana-gpu-support-v2-13-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-13-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3NSBTYWx0ZWRfX3RXIngDCxs5o
 HGgggaMCcfGaKLqRSy+OOEnZy1Qhm0U0Q/ALOQDvPuZWyBGgAWHW4xFW5xDn2ZwAHS/sKdqMClV
 yEaR1NxQLFjxqC1b6WOKNO2E56Ag+Q0r+vhXa9QRv6d/UiPUqwlG9S54AFIwhmrZhSAQDffpxsZ
 WKsGOvR0E9eRXFIJkQZBqRdfo/xFF1SGg9VOqp0Tr60rVLGPzGQ3tTM6mO96LtWS8Cyctkg65R8
 5+ac7yFyHSuNA08TKzkJMQgSoNjgciJNfGRk7PSMii0QV9qUVah0q+ukOtUt+f59T//e/05BHM2
 E1VhhUaCNGJDLo7Hdsq8RRVP6vfRoHzDcMdXjAsSzcHqQSOi7VPRf8JIpdmDat3y9g6KJbvKzZ5
 WSPYJoiZmdxY3UaVS3x0SAjNIX5OeA==
X-Proofpoint-ORIG-GUID: ZDysHmF5G8k9tgwpe2nXtuJFtq26uVsD
X-Proofpoint-GUID: ZDysHmF5G8k9tgwpe2nXtuJFtq26uVsD
X-Authority-Analysis: v=2.4 cv=PIYCOPqC c=1 sm=1 tr=0 ts=6915afde cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WeZqmzoOQpb_IxObF4IA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_021559_258917_58AB80A0 
X-CRM114-Status: GOOD (  36.58  )
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
> A8x is the next generation of Adreno GPUs, featuring a significant
> hardware design change. A major update to the design is the introduction
> of Slice architecture. Slices are sort of mini-GPUs within the GPU which
> are more independent in processing Graphics and compute workloads. Also,
> in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
> with additional pipes.
> 
> From a software interface perspective, these changes have a significant
> impact on the KMD side. First, the GPU register space has been extensively
> reorganized. Second, to avoid  a register space explosion caused by the
> new slice architecture and additional pipes, many registers are now
> virtualized, instead of duplicated as in A7x. KMD must configure an
> aperture register with the appropriate slice and pipe ID before accessing
> these virtualized registers.
> 
> This patch adds only a skeleton support for the A8x family. An A8x GPU
> support will be added in an upcoming patch.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	u32 val;
> +
> +	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);

There's also a BIT(23) value here which is seemingly never set, but
perhaps may come in useful for the bigger GPU

> +
> +	if (a6xx_gpu->cached_aperture == val)
> +		return;
> +
> +	gpu_write(gpu, REG_A8XX_CP_APERTURE_CNTL_HOST, val);
> +
> +	a6xx_gpu->cached_aperture = val;
> +}
> +
> +static void a8xx_aperture_aquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)

"acquire"

> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
> +
> +	a8xx_aperture_slice_set(gpu, pipe, 0);

Maybe we can add "unsigned long flags[MAX_NUM_SLICES]" to a6xx_gpu
to make the API a little more ergonomic.. but maybe that's too much
IDK

[...]

> +	a6xx_gpu->slice_mask = a6xx_llc_read(a6xx_gpu,
> +			REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL) & GENMASK(3, 0);

Please define that field in the XML

[...]

> +}
> +
> +static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
> +{
> +	return ffs(a6xx_gpu->slice_mask) - 1;
> +}
> +
> +static inline bool _a8xx_check_idle(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	/* Check that the GMU is idle */
> +	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> +		return false;
> +
> +	/* Check that the CX master is idle */
> +	if (gpu_read(gpu, REG_A8XX_RBBM_STATUS) &
> +			~A8XX_RBBM_STATUS_CP_AHB_BUSY_CX_MASTER)
> +		return false;
> +
> +	return !(gpu_read(gpu, REG_A8XX_RBBM_INT_0_STATUS) &
> +		A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT);

Odd parenthesis-alignment (couple times in the file), checkpatch
usually mumbles at that

[...]

> +
> +void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	uint32_t wptr;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ring->preempt_lock, flags);
> +
> +	/* Copy the shadow to the actual register */
> +	ring->cur = ring->next;
> +
> +	/* Make sure to wrap wptr if we need to */
> +	wptr = get_wptr(ring);
> +
> +	/* Update HW if this is the current ring and we are not in preempt*/
> +	if (!a6xx_in_preempt(a6xx_gpu)) {
> +		if (a6xx_gpu->cur_ring == ring)
> +			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);

I think this should use _fenced too, but I guess the preempt detail
is just a harmless copypasta

[...]

> +static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	u32 val;
> +
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
> +			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
> +			state ? 0x110111 : 0);

a840 sets this, a830 sets 0x10111, please confirm which way x2 skews

> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
> +			state ? 0x55555 : 0);
> +
> +	gpu_write(gpu, REG_A8XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
> +	gpu_write(gpu, REG_A8XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);

!!state

[...]

> +static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
> +	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
> +	unsigned int pipe_id, i;
> +	unsigned long flags;
> +
> +	for (pipe_id = PIPE_NONE; pipe_id <= PIPE_DDE_BV; pipe_id++) {
> +		/* We don't have support for LPAC yet */
> +		if (pipe_id == PIPE_LPAC)
> +			continue;

This seems arbitrary - one because there are no defines targetting PIPE_LPAC
specifcally in the reg lists you shared and two because it would almost
certainly not hurt to configure these registers and otherwise not power up
the LPAC pipeline

> +
> +		a8xx_aperture_aquire(gpu, pipe_id, &flags);
> +
> +		for (i = 0; regs[i].offset; i++) {
> +			if (!(BIT(pipe_id) & regs[i].pipe))
> +				continue;
> +
> +			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
> +				*gmem_protect = regs[i].value;
> +
> +			gpu_write(gpu, regs[i].offset, regs[i].value);
> +		}
> +
> +		a8xx_aperture_release(gpu, flags);
> +	}
> +
> +	a8xx_aperture_clear(gpu);
> +}
> +
> +static int a8xx_cp_init(struct msm_gpu *gpu)
> +{
> +	struct msm_ringbuffer *ring = gpu->rb[0];
> +	u32 mask;
> +
> +	/* Disable concurrent binning before sending CP init */
> +	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> +	OUT_RING(ring, BIT(27));
> +
> +	OUT_PKT7(ring, CP_ME_INIT, 4);
> +
> +	/* Use multiple HW contexts */
> +	mask = BIT(0);
> +
> +	/* Enable error detection */
> +	mask |= BIT(1);
> +
> +	/* Set default reset state */
> +	mask |= BIT(3);
> +
> +	/* Disable save/restore of performance counters across preemption */
> +	mask |= BIT(6);
> +
> +	OUT_RING(ring, mask);
> +
> +	/* Enable multiple hardware contexts */
> +	OUT_RING(ring, 0x00000003);
> +
> +	/* Enable error detection */
> +	OUT_RING(ring, 0x20000000);
> +
> +	/* Operation mode mask */
> +	OUT_RING(ring, 0x00000002);

Should we include the pwrup reglist from the get-go too? I don't think
you used the ones you declared in patch 15 (or at least my ctrl-f can't
find the use of it)

[...]

> +#define A8XX_CP_INTERRUPT_STATUS_MASK_PIPE \
> +	(A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFRBWRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB1WRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB2WRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB3WRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFSDSWRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFMRBWRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFVSDWRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VSDPARITYERROR | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_ILLEGALINSTRUCTION | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_SMMUFAULT | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VBIFRESP | \

kgsl also enables VBIFRESTP(TYPE/READ/LIENT)

[...]

> +	/* Setup GMEM Range in UCHE */
> +	gmem_range_min = SZ_64M;

this doesn't seem to ever change, you can inline it

[...]

> +static void a8xx_dump(struct msm_gpu *gpu)
> +{
> +	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
> +			gpu_read(gpu, REG_A8XX_RBBM_STATUS));

This can be a single line

Konrad

