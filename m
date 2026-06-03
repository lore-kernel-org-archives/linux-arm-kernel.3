Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C14CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 23:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYQm4k/RnCbtoz4G4uzh93rP8MS0q/z/Jb8qOX/3f6w=; b=LqgIe4x++93cYqEdUwJwELeqOw
	wEi+GEknmq/dODbIGpyMSKjA35yko0loV6jftzpoBXQBgQRPU3KhsT+m/rNCoGwmK0vUYYRAjd9q2
	AqmtNf21YQOZrtzAdDXbCxlpphcTbcDJRrCGaeJWLO66HMa7RMV08lz/MOP33ek9B055Nr5EBH4kj
	p9h/+EGhwm7jVpGCHUCUGE0sy0uRPR815Sh0rGOuqN3LrMwVzKU8zFkYpeQw2zOj2Fqz2iSGuJ8yK
	xzwvajdWaEAKWarCYZZgWtmiBkySqSPpjwLCJfEWOJZ4msz65e3eUTobKbP9iw4sKKw06/lAL/0DI
	oNHXHEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuiN-0000000Fv7Z-0Zxb;
	Wed, 03 Jun 2026 23:09:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuiJ-0000000Fv73-3cn8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 23:09:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JnsKc2076176
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 23:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zYQm4k/RnCbtoz4G4uzh93rP
	8MS0q/z/Jb8qOX/3f6w=; b=JyZjPCpXDV/KRX+EmGw+f9M406g2NvLbqEMngBRQ
	XxhNUldIZ8AF+mA8uAsG9nvLfvLwoFFNgP6g97jeOqhN53SaR8EyrUipQV8B75Hd
	zch5jVCBwykJTXc8GKuEREalMTM1awlQKjGE3pv34P04rIUV76BMXhhuvCZhKbUZ
	bT/QXthdYD81vitEM1c2tzPnl536tuqRprIutirK5QgytWMQQHGS6ksQVYp6PPop
	1a/NfAhqgh6kIU6m58Uip/TpKwCjMY9RbsUQFWtp+CT9QlNFi8suBGkbnKhXGBPb
	nfuJYYql8Fya0DY10Wz3cUjKPQZ1z51ilXCpkAi9rkHHsg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev1c1ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 23:09:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd65ab97aso138723137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 16:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528170; x=1781132970; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zYQm4k/RnCbtoz4G4uzh93rP8MS0q/z/Jb8qOX/3f6w=;
        b=MeRJ94pRK07d0glcA0SSnAviJih+dhdEY29TbdKiaY+J1xTviadT0XJDjzK2tma9On
         lCQkQh1Uw0Q6GwxzFXybOtgX3TJSZizTUnh94w5A46KAWKk/O7OM6ye3KvnUJ8NcE/X+
         CzxrUR+ouvFc4AHGQXDvP1QK0HhdjQ4X6VAdXL2aNogtH1oNur6neglqcc0thF4AifPX
         tMuRh9kalbknEfpG1I0PejdKet8GXzd7ddjbRcuXmW7AzvF0Y/TxQ0F5X9X4oYeTw/bg
         hF73d0XBr1LqbvFRIFjeF2VkfA1T5IVzZqstyi6U3ZE44hruo9EQ0AuQuDc6jZF4qFpK
         0ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528170; x=1781132970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYQm4k/RnCbtoz4G4uzh93rP8MS0q/z/Jb8qOX/3f6w=;
        b=n/LrjWoVhOnS7xMs9Lq/O5Elkq1Vb7zRwDcy/YLoaosGEUCMTZur7rQT6VSc+M7gPF
         N1FO7TQXCOomXkX3d12NkDxwdIwtSg6kEJ2biZLkNE/38h6nsmxAwcZM8lWX4k2CONyt
         aHxvn3bQaGaQWfHPMvEYUDj8Hq5l2yvV0zvOXF5sKewRxVehwJ0pU+uWizri+43fdZRC
         3ADhiJrw9Ll7yqffkiDPpiJB233DdhJHMRJDy89gwoE+b1RG2T1z56mqxPvrBS3gqF/i
         F4CjFZrCpb9+2hvnaG1UucL+7jIAxLdHCYHHzxvu900NrOUHfwKnYMF1UE42NPmPrhRp
         VPUA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ce1qWHmduhdsuC5v07p2u0TQPNdekIE+Y4rrnVUPrS4tQmxdrD6UKugkAemevUsMRtyQ2QAEFOeH+Twtzf9ZU@lists.infradead.org
X-Gm-Message-State: AOJu0YwP0eTrq/DgL06SwTrorej3SDDSStoY6oAknLZkTiRpr7XWhqDf
	lYNeUyo8uc40/Uk3CSEsUEDFAWuyIBdoOo1B00P6ZcGD+ZEkVY0mgcPI4vF4hpzuzQdHQLYEecr
	GK96oRI2Jb5vpkQwgjaDgYPTsDnBIm09UuJHdRqy22bxG+YuSGz999XZdYL3qembwV5YWHcb8to
	Uzxw==
X-Gm-Gg: Acq92OFfmvGsrA5evvF1Qh2qxczZ3s+pfPisv0PvdGKPm/IO3iXEc02EFiSTLBGKzTw
	bAZKDu/d0nPWVk8dRB0a/U1H2XWPZvP9mS66XK3wJ3ZuMg/eircAK1H6A1oel3f0LW0F4VKaHWz
	RUIg9yrLCqFn7y3UAYXtjtODjR85D9ZoAFtBsg922yd5b5dV3Et1VYK852ofUKO50Ie+g4gKWrE
	k/l47nB1wZJgr+BNQDd+oqDuhZlOXs4A0OeLt1blVANzZBi4R3o2tbFoXhfD2WOwsp6A46DCbGQ
	iZYlXUN1+M1Y/Q3RQ/eynOur/X6DXvRxV5P7GXTFENZUrkBJ2Gl/jxrJt6p2J+puUtV0m1WuzcP
	AToBEmlbYO+Gd4gFOPbJg/6uAU6JC9ZV4gZksP/nrvNpgm+7fQW5t01auxpCAnzAMQcaE6yx8+J
	PR+EBLk0ax9/uFQqBgmB47MPQnyYMUtdH1eVk+i1VX10Kqaw==
X-Received: by 2002:a05:6102:f12:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-6ec4710d8d3mr3972148137.18.1780528170158;
        Wed, 03 Jun 2026 16:09:30 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-6ec4710d8d3mr3972124137.18.1780528169804;
        Wed, 03 Jun 2026 16:09:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9862fesm871133e87.57.2026.06.03.16.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:09:27 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:09:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] drm/msm/mdss: Add Shikra support
Message-ID: <jw4pps5xn2a6onu6fvb66cyd5jrvw2akx7zu7rtk4ejddu7czl@lmsxmbnryjyc>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-2-aeac1b94faa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-2-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y-ZESN0jkO4y9RmRb0gzclmCVCX1QowS
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a20b42a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fWyEoBxJXmLHvYXwyp0A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: Y-ZESN0jkO4y9RmRb0gzclmCVCX1QowS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfXyMG0YIfp7nlc
 T30YVTfrlB2WtUerLmIaK5XnQliPmgBd1vX4tAdIgmSH1jiuc89CD2TuFlV21MJBejLGM8HYrO4
 hqh4v7oIy4tMBaod5JCamkPmpe0W1pAQDtCxbGiOdbypJYDalKL8mlsNYNhsqmVZ1wfR9GUN1Et
 SnFCeV6FMtY2oJcsmHjAamdr4lSK61EDCqF0FImHbTw81lMohOyE3yAwC+zdaBCZZ++fMNCuyoF
 taHfLtOhYz9GCZZ9YID42ba9o3XbknSeIPU1bm8pDewdq+JnSYGdrjRqwi8/V0lct+fe/R0ouZc
 nlmEYFu2Y46HH12TCKJCgRIN4uj93VYJ+X9XQwKS27NcmJ/G0VVFnZ/TEXCuaHy9EhZdic4Af0e
 c2alkR2ATyTq1isPzw2gX3sbz4XpZlAZALSI3NkD/g7jeygVExUnsa7D+I486djKfZYPgSPJH/0
 GPVFkdOXZkyLbv8enjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_160932_042670_349210C9 
X-CRM114-Status: GOOD (  16.47  )
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

On Wed, Jun 03, 2026 at 08:29:27PM +0530, Nabige Aala wrote:
> Add Mobile Display Subsystem (MDSS) support for the Shikra platform.
> Shikra uses the same MDSS and DPU 6.5 hardware as QCM2290, so it
> reuses the same AHB clock rate configuration (data_76k8) and DPU
> catalog. Register qcom,shikra-dpu in the DPU KMS match table pointing
> to dpu_qcm2290_cfg.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>  drivers/gpu/drm/msm/msm_mdss.c          | 1 +
>  2 files changed, 2 insertions(+)
> 

This points out that the previous comment was correct. Drop this patch
and use compat strings.

-- 
With best wishes
Dmitry

