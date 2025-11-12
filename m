Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB10CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=; b=HfycsF6T8yPkR00iNvZ3Ui2DfI
	gAteLh4VmsqtD9WRy0a6KQkYTktYylIGqIFiMkzSXySIeBla0vBrCPhzp4Vqgp0Dz6uTZAaBv3K94
	rj5fycZhhSr0Vvvut/Nas178eAfep9E8x2VrszszKt5lKpZWXsQUZVoYi7wmul8zxNFmL63SErBtw
	eTnNIO+4pRpl6Wd+kcdspU+Y+LwpIkc4XKrFYKhe8voLR9+TOWc1867350QTBkztLMY0eFwz498+0
	M3+KNQiA4GSK38SzQU1fUiy0hx4gxRY0lxFiwz9WKOU/NAKNKmb6PLzFuwms54OZBkK6nN+eOdN3G
	AZa3YExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7vZ-00000008XxZ-1mLn;
	Wed, 12 Nov 2025 10:18:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7vX-00000008XxA-0dcq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:18:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC7CWod3502408
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=; b=XHG/U/xgXOWnwci/
	cbr10cJY9Vt1KgKxrd5wTZGGN7zmOyK3bgcF4K16kGw2s+flbPOVsa5yuY+U9C71
	GUdBTbMP0/9VrCf6+FqRxann05mQXG1D6YLuLAQXMEIFZSf0AUa5FG+JoX3RiyAB
	RR2hEBqBi1jo18d4cxDgheO984q1tR9tsiBCi6yksRqG1uO2QaOVtW+GxTpRASn+
	Rwl5DE0SBlnvtnEfMDP1pKUdc8H4naeKgABrfuOEZOvelQhB6UKWgk69l3UKWmIF
	/z5QGbCOmHcBTIBO7rx0gkghX2PaWhX3rGTitX/HYNfaSywUOHYw6jsPsXOxVZwS
	PykLqQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acdcc21xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:18:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-882414eeb90so2020826d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762942689; x=1763547489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=;
        b=RfeQZp581s2TEgN1o1oo1GpECHUxRc+1jG2uIenEPs9nA70Ge36rrvXFL12/vZiDjO
         sd8e/oWZhtrY0WUBf463ZQQmnwoMiMxSbw0BFdl2zi59npy1J8V7a1BKGgnk3xO+ZYtS
         Mt6VlTgtKPE8mbqE0xElDKtTuicDOoGINB/5gwwaQjPPMWgC5M7R+zC1BH+woXBRNE69
         UqKviC73BXAYGRnTtrcqt0CVdA3bkoiMyaEEUc/TqaGSzMbdoMDMHe0y/2QMTEg5WeGh
         49lsTOFew0tLI91LyjW3MAFoBTNLYU15SjS2vhWtxAgIQ0feMxGqU/G+lH6FFaDMAM6B
         TO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942689; x=1763547489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=;
        b=svbr2XDn+L86WpUhks7kRnyN/HJYt4a/bFx+QYqLy1JjwvZ+cAwW1FupyvkZ/TFCow
         Iy33hR8grJE9j7FDxokta0Y3b+JP9ZMXVLU9egzSRmYRHPYVXFtI8N6z6XnzrX2lcqtF
         0wy/ayLrmGHX2GdU7sS9uSmnkfPiYfkp3pMcaVDphqd442oK/s4In4IoQXPpvE0xp/K6
         57J1fQ8sJmpse2Y/ivPAKxbbpf/d2zWUDIly7MDom+rkLkJ0d8yVtaSeUl9H1fw2WSHg
         TAdxV/W/LP5sIRvx3lHxg/MSmd2ZpUFHgy0tD2RVC/cW5TXX7WYqdqBbwk2mb94r8LC4
         EeqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8SaoxvpPHPMfmI1ExTER+3xMpAmZqXj9mZCVdsDU0WihZX7AVJPcvH0f2w/yzKXI3qXDyxZryLgZszVikMi1v@lists.infradead.org
X-Gm-Message-State: AOJu0YxJPZWTFGNCtWf1IWBBGKSUsH+Muyx0spIknfB37uGEityehgm6
	u8V7MdoCd0CBtrznK26JKwyQF3xjXNCtqZFwZAHtrtaKJkfh4eTgQBLal7+/PZf/HgNy7MqH0qm
	2/Ne+Z/EDnLjeu0KYz+/674fnf4puirw+TLWubpkXTtiv2VydarxWfbbZN5PrfsnBhYlIhAVFeX
	7k7Q==
X-Gm-Gg: ASbGnctF9iEPndklUU9938cnL43T83JoPox1R/SC7qVX/RibYLAHtHXcgt8L4y//csG
	Sajh2PEId7/UL7HS2JyvYbHJK/y+zBSDpJZI8a0eU4nv14Y2Ig9qp00Mg997lq4zMW+VJ57OEa2
	K8ISragftwHJNe4dKNyzoNIQ46K++YTG6lw/q39fEc9Gy3oJfbe8LFR/2SxZICQjgrdH2wUfM8P
	310hi4bL4652sxVaeHWCYzxgEpsDQoaXHhTn6qeSBF8Os9x/gbg34sSyATLgkuyqSEJ+XS0ze18
	Iin3XkM42LTb6nSVuGoz/fn18whPICjabgrKY8AeHn6np7p9dI1VnuACFck4VZQlFWz/JKTZOtN
	5OpkCXFQCez0Dspn2jHUA8fCLA2uAw2xZ5JnP3HpZp57va5DUTSgjbrOz
X-Received: by 2002:a05:622a:2cd:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ede41f17b2mr892361cf.0.1762942689294;
        Wed, 12 Nov 2025 02:18:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYtQ29X5tXvxSDaU/JA+AKkzXH/dnj2dUKb+nxLC9dFOdNM6v1tgVxXnY84nYUEM2+bTg7cQ==
X-Received: by 2002:a05:622a:2cd:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ede41f17b2mr892001cf.0.1762942688856;
        Wed, 12 Nov 2025 02:18:08 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eb6sm15397422a12.14.2025.11.12.02.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:18:08 -0800 (PST)
Message-ID: <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
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
 <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jzn7gJlx-vhJoJ3uLSa-9lvLcLP1vYUR
X-Proofpoint-ORIG-GUID: jzn7gJlx-vhJoJ3uLSa-9lvLcLP1vYUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MiBTYWx0ZWRfX4Vc+wqp84cnL
 rEkbwZaaLZIcAULdvBdoJfLMt2NkVoghJaOUML/NDCSwkjLfCQqi5J6gqhOdZUmEyRMkEFXZPy+
 wnnN16XJT2kcjKdVb7RiJ9E+83Md2r8kwhPBw3fsZRYoCKCSS+c50fX0OZjVmXI/1bIuVASQ9tH
 IZ5UZfLfIl+o2wPEpecAckBYYMOba/rif98xqC4BfCTBleSAMSa4hwnsxKojLzQ0cBVDTx8PYFJ
 rbdPntwgi5Hn2WYUSZczWZn9sfLOUa54/vRTPg3o1FtmOIYKa0Xkj7VzMEU2nRC676YQl2Z5mfw
 FAYyiWDnk3k6IH/WipIuYa0+SMdhwKRLTSHaVds7Zcw0Q1F9lE2LM38Pey560nSFN5qf2fN8iod
 OYUS561Y/lmCRl+s5U+/MtOHLeWJDg==
X-Authority-Analysis: v=2.4 cv=L/0QguT8 c=1 sm=1 tr=0 ts=69145ee2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B6ldIsYNqgrP1okBzpgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_021811_206630_C47FDF38 
X-CRM114-Status: GOOD (  20.91  )
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
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match the recommendation. Also, downstream does this
> w/a after moving the fence to allow mode. So do the same.

It does so for _notify_slumber(), but not for _pwrctl_suspend() in kgsl,
but in my understanding, making sure the bus arbiter doesn't gate access
first makes more sense

> 
> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 4e6dc16e4a4c..605bb55de8d5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>  	 * in the power down sequence not being fully executed. That in turn can
>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>  	 */
> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
> +				adreno_is_7c3(adreno_gpu)))
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));

Arghhh copypasta, thanks for catching this!

Konrad

