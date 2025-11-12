Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0715CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=; b=zkKVnHdfzPKAMwGfNW2+2hOPjH
	+VQaTgIKal6r0AW8riv1+CymJMs9nO/AoQ/jkVkffN/c1O56Qj9kzbscRS75nIOL9SeLAi5EeTUxF
	v1aymRD0acl35AxWNnOLlcYODE5z2n1rwyHMbEMQwjuBzi+DLRWKiDJF4PHNF/mXneHGGmvySYT/P
	LZ53sb2MGnPGqPXhnx3wrshmPqEB2hdW7IfPF8dHWmZPX1ABHCIWIEtY7cr8uQ3t91bpJL9d8TMc4
	+Keh8lAeVmFd35YoQG43tIYJRWVcweXY9x/y9mDaLcZZlTLB53iUlpNATChDZyYbanNqnhMDUcUt5
	7XuL+lXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ806-00000008YKG-2tq9;
	Wed, 12 Nov 2025 10:22:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ803-00000008YJm-2hhe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:22:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9T1UE4076895
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=; b=A3D2P2ImD5qeuGzo
	jpBbHoHhTWoTnBAVC6dE7Q74dffCYK3d80Avh5EWOL9OPMibphll25jw/a+c2fLK
	C5Xv6OpsbOgjUViRvORZ+CEajalz9Rufz8i3y5mJ2xlMsqWP4CYR0jS6FfxV65Z5
	d867ln9H65q5ZU2XS8q/+NvwyDNLhI9aTeuQXWh7xnlDZOaHMasR3hzUsIAjzWVE
	evSA5abf0Rm28Ey5jE+QIs1WuH5Y0eqCeH35kW5hDrm/kkpjf/WzOU/kUnT+0InI
	kNXy1SsstRtaRY8vrTCrNCkHCRaxLqzO05nSOfn6qD8vBhrVoyDKg2u63Tt/Z4Th
	9sFYBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acguahfkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:22:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaa289e0dso2531891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762942970; x=1763547770; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=;
        b=K8RHdN6HL6E1b3ab7Vwr2G6Htd3hHNjpbgNW/ido+20bM35x+kbvndW/zmWT5yRPrp
         d4/PMg7vY1vqIUdd4WP4ZBu9MMyfPG4ntw2l786nVWjmSpg66qIRoNuE+QuNFzDs6unH
         b1EXh2dWuRtbYLZ49BXfvF7YkGZm0TVE8O1g1krT8h/c3tup0KYuJ8PzZwkmCcsn92vK
         dvnizIocgzUD+GnaZRjuMpNigE/86r8m0Cer/ojeS+NYyt7x7NCcjfDTMgxuhg1gUKvh
         CC/NniGR2EbdrskSH/i2pBoveJFiZZXV2N4k8T7Jp2l+h9Jn5XeyU/P9Efo5zfkfjJVi
         97QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942970; x=1763547770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=;
        b=hH5FS9wxBrxWgjXFjgpRxUCqaDGdcAkT5C9OncfZkQVzR3dhDcnqpgA4Iq3j8wCYTi
         O273JIyVDQ7saMHvU3YLh4HRSwP1lLbQ4+hxpHmjw1K01hhaDJH/V1t9fqsrt5TuipnQ
         RWsN5cFM+oEEZz9r9aKkubgR/C77ypxBeKZY4lLy2YblyAyinSvAN7KwNUprbJo5PAPs
         pMFnWMpr/KOip+kgXv1KOPy9ceO+db9j14g3Ss0hLz1wcC5fYNw/tNDSwVDkDEWFbRlS
         3TLTFvv5YZIOF2A5j1oCaYSoSaJ5wm6gu1zcOze4UbSRK8rTtpx5AU1C0Kh3d99BaqQa
         oKIg==
X-Forwarded-Encrypted: i=1; AJvYcCWo3kHHLeit0GBo8HUM1u6nnpLAhZfcvU8ltmBIbBrIOOn08FOmYGEVPuzSCFcqjerIC7rzcI3ciDCcfreqhmDZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwFZcM0ZE3HzZmaAl4TQQvgFUJ6Ha5vGXTU+xZztsIMedPoeMv1
	R0RvXps1O859n94EuUqNZMIDyhxU1aEmYdA4Z5zBHdKpASAzEugJGkoV25V+JBy5WeGCw5BBcMj
	kZl6/WldUbsT51I48c7SDS2t65pNzpRoAvUw7QE+xp5C2SxLy3+gZlsTFkuj9xURh4C8gCPfHjj
	bH7Q==
X-Gm-Gg: ASbGnctS2rNrM1/UVjZrO8RfvRtrDqjC4rc94rdat9YOiIRUaCqw70bI4F1HS+5UJXy
	xoBR+MxascFcPXjZEgtoKAys0iSqtyj/A6Ky7Dx37lNKloMZRWFeMrcVe/z8l2GUUACRvZxh9ul
	oROhXNuZanaQoyT1qESo1uwSOK4TKYy2M1PSl0950X/hDLs/GgoaztcReBq9q/g/hys/cfPa0vZ
	Y3V7f/dqIXAQZMTmP9gyUjVRVeUg91p2iztoAhhja7UrPOGtDa5hz4coCbgIbQOtDOly3hJMpBP
	2ZR3TY07M115CZ+HV5iXbhaF669jZxtVw9f3aQ90chA6CXgfAn02KSB6hCOzq4EP1i+pl1w0x2J
	jjRkBLCi3/fKmezOFrY1pGumBq6E8T3XovARdwyNxTB7nfA97yctk6Ode
X-Received: by 2002:a05:622a:d0:b0:4ec:f53b:418e with SMTP id d75a77b69052e-4eddbc6bc3dmr20363011cf.2.1762942969366;
        Wed, 12 Nov 2025 02:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGebY4K7Namd6glwHLtMAZE0lf4hL9guGKfOfliFjM5eEuz55Nipc9SN3o1JFfip8JTUrox/Q==
X-Received: by 2002:a05:622a:d0:b0:4ec:f53b:418e with SMTP id d75a77b69052e-4eddbc6bc3dmr20362721cf.2.1762942968808;
        Wed, 12 Nov 2025 02:22:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f862bd0sm15744925a12.26.2025.11.12.02.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:22:48 -0800 (PST)
Message-ID: <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to
 catalogue
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
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: woeUgZ4euykHKdpnqdQNW3F8IEiznicW
X-Authority-Analysis: v=2.4 cv=ao2/yCZV c=1 sm=1 tr=0 ts=69145ffa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p7PcLuspDTVbkQel-sEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: woeUgZ4euykHKdpnqdQNW3F8IEiznicW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MyBTYWx0ZWRfXwrxwtHKO1n+R
 fk+JwEWhm7IBvZTuXq87giQ9hMI5UcA656S38tbtRS3RPAPpTL5QhLZRf00yWZ0/WakFd8GDg5G
 hviQpfUx7/vxVWF1rT2cbyd4LbOaHImxgglWT6u09RW6J3kOYi9uHzci8jrlNsoeIHoGBm0mrup
 OtVBvBER92+RWNbVqJDrXfACtR8xR6tDx3T3bVRXEb9vtV0VCxyYNwA4Wr1N0kDpIkwpReM457w
 qwwcvHOAMUo7vCtcZiJNzB186AEy7VVE3nRi1pkkXDZ2rh2Pq9jM1QpYpQhTEqyKtmvc4ImacWq
 kc+ZPtwkz8AVSZ/V4YZYyM2Zrf+9Wkn5o1ohG3Sp/CdrZEImKkitZIUEsCfQelX5/4ixPPnWMiM
 AfllaqZUtspu09yJTa22jePdRJVMHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022251_801981_81F8C20F 
X-CRM114-Status: GOOD (  14.12  )
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
> In A6x family (which is a pretty big one), there are separate
> adreno_func definitions for each sub-generations. To streamline the
> identification of the correct struct for a gpu, move it to the
> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]


> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 44df6410bce1..9007a0e82a59 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {

Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
instead

Konrad

