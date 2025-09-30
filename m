Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FD8CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWB5st6dCk5SY60IEgGtzAA+H2jR/8jDg8gNG+7YCGs=; b=vUl8V2E4oGLua/DuMW1uNKvaZa
	cip+EoKZeOBhkLuePM3pTAHpW5GhInPAOSEeuGg+cMxoBeQsp0e6j+3y6fkCn1+sQ86rTF2buLovS
	KsOtOEcGED7UU4FpoTHULWZKiZZ+pwdtIPO1BvuEw9gwIZrAOs8g1a/CocdpZmQSzX57AoxQJ11Pa
	M3hfdVYg11uskWR50uw8nJ3nUtVnTPpd2iou2EryQWWPf+zw3vGxWW+B2b60FR/wV+b10kR9G4GZN
	swafSJQWwpp6fTF23Rpkdb1uvUVXYa3jbFfWmX3nfifBgY1aCKD5OMG+gtxAF/377rYbmHXn4QHsm
	/+ksIQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UUw-00000004RqD-1BIJ;
	Tue, 30 Sep 2025 07:10:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UUt-00000004Rpj-3gPp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:10:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4I2eg027978
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mWB5st6dCk5SY60IEgGtzAA+
	H2jR/8jDg8gNG+7YCGs=; b=kMRR12IS8enm8CrZ8x9ZiNOF+G75w47cVG7mJiT0
	4MJCbnIMoifsmQJF6Qw1/CexJ1LSiBRaQp9oqReXZnznbu9/QH112t/NEIx+Krud
	5vN+2sk+w002UwpGj8tjqEZgh/c96L4wMX3RZ8Jwj8fCSpfnC5/ZZQX7ymP00+X8
	4VWnT5zGFBv2d7SVA9PiTWaA4ENPUYV/KhGo9XBZqbAQq78ZG2h2OwQK1UaYGDUY
	NRs9rGVEq4wiN9orST9RFK3banvnqwa1y2Pdd0qgyaXPNfQhj0/Hvd+q1GVuiaCF
	TZ9wz+TV2siD6SMBEZ68Gs2AbLvGi/p1X8n25Cr184U9Kw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf1k1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:10:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de23c3b40aso102198341cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216201; x=1759821001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWB5st6dCk5SY60IEgGtzAA+H2jR/8jDg8gNG+7YCGs=;
        b=eXGwHyAQyzCTjSajE1LQAKS0Mg8MhmIuiwtMWjManL8swsA3TrjjowfTTKQ0Xt1jVh
         iGi2qDXjICGgNBkrJATxvMLfM4oZ8qCCPUN003/mT++U9gfMU+8KBOnP4XZ6GN/hLUXt
         Py5OIchDfsGAbtTRPw1Byk14EcOuaXCP8U5IY3oWve8KcVpoS2HRH4vryQjs6QcjIuUr
         0dtgdmpwf9hYD5MrrMqQJdwV5YHkvlHdqcXDYjys/YWpNHegodLBPY4RzDNW7BEbsiuC
         43com+xGENZf88gwC6KB9JR1alhxniNIcVd2KTJhUB630XyMfsBDQyMUXGDSrbDjQ3EG
         HJrw==
X-Forwarded-Encrypted: i=1; AJvYcCUk+hrryB4tzrIT8ZakiTdh3VXdACnGSx8mJFaJty7AghuDMpfsPw2EQ3BKYfZFAaCX2fWmMrrLxouUP8vYdWBu@lists.infradead.org
X-Gm-Message-State: AOJu0YztMy2k7Dm/0j+Jj2uqPVaa7UbS2ljvNQuxyaUJOO9oiZPqUPfE
	61fs4SdDRhzS35rRYxaHZjc6MpeeB7nlSbQj3ah8qRh/gF30gLwyF5qvj90bdvIn4eKLHNM9Y7s
	RsfQXjOtD0lnZwoCJz9Cw+6o8amhWDcwhM0uF0NAQjoE7o+3DB3Xh0HEU4/MZMI0e7NvDFCzPsc
	h+5g==
X-Gm-Gg: ASbGnct8ACRpjoTL39tIrfGEBaNwzP3Qut2j5FTXyJYpUVlcY6HnmcZ9zkp3GUDhC0o
	v006EK/pbVfjUlDII1qnSbxbeRiFwhppN7SPu5iS+RPwCPVa8hX9J43RnaXZPCE4S3ljisb+OJJ
	CaHzAP3YGyG/+/JYyWT6HQGSwNDjLDmwpEbjPaA3NHSyWuUgvHA9XS1TjCu0wlx9aVul6PtmPdg
	wtXdQRgCSod2+GO8YYDQjqLpSJ7bIgTAeCRXeSd2L3bx8bcRwFOA5oyCt+2j1NNaQ4J2rZ6dvT1
	CxLKo8oJORLLcj95f6Lxth9KS4Ja+6NdYr/rTKfNGUWEfc70wk0AJ29iowWfRX0j157eMxqwGS0
	dA3r649Q3BDjw1En5a+Ai+vxv+Wb43bU96Q4sSBjhvMq/69UpXO0FCOqWsw==
X-Received: by 2002:ac8:7d10:0:b0:4c9:3d38:1107 with SMTP id d75a77b69052e-4da4b13ee9amr205820071cf.48.1759216200603;
        Tue, 30 Sep 2025 00:10:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqfXjb8BDoz0OLkhbqOSkOjFYvwz8YqZOgVTFVVpG1nTKdQgXBzxVthwYLzYpdiitvJ/C4Vg==
X-Received: by 2002:ac8:7d10:0:b0:4c9:3d38:1107 with SMTP id d75a77b69052e-4da4b13ee9amr205819771cf.48.1759216200128;
        Tue, 30 Sep 2025 00:10:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7710256sm31171981fa.45.2025.09.30.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:09:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:09:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/17] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: t-UDRBlYOggSaXK5ZHCWn96PKCcQtoNt
X-Proofpoint-GUID: t-UDRBlYOggSaXK5ZHCWn96PKCcQtoNt
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db8249 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KsGV-J2CeG6-G7wVncMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX3QDF+sQ40o+w
 0KefOR5AfY5X5XOQ7lod2YJ52hSK5v282JUb7iv3ShkhhkxCbIP5BqPguQtUuGj284DtXYI67jL
 AOYRSmLTS1YQ5JeWy9cSWI8l6brc3RHwGpu2BJWZSHeHzzabnDSBHzb+ORGGWBRuWBP5fJ+5+WF
 kTfY6qa0LggsCWR8IZWICi1wtsOMMv8gZ+cC0z1TX4nelYQ3stgyNc6bGRNy6BDOYLTvh119//D
 bhX59rdC5o0bz79nPHKOKcs9//2DvTJ8x4jUbMO9MMXjgAo39qXNqKbiej0xiIEpYs0oIidg8SQ
 gq8uM5TzhB7rqcsg+MKgTxUUILmjkIhG0LcfSVr641LECeLOgxgwZ7EC88vdNgJ1lZ8gXCOrzJr
 50Em1OWQbDHhZhCY0VrAyqRwflzjIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_001004_037892_28BE99FC 
X-CRM114-Status: GOOD (  19.22  )
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

On Tue, Sep 30, 2025 at 11:18:11AM +0530, Akhil P Oommen wrote:
> In A6x family (which is a pretty big one), there are separate
> adreno_func definitions for each sub-generations. To streamline the
> identification of the correct struct for a gpu, move it to the
> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   8 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  14 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 +++----
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   8 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  18 +--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  50 +++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 209 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
>  12 files changed, 275 insertions(+), 262 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..af3e4cceadd11d4e0ec4ba75f75e405af276cb7e 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> @@ -8,6 +8,8 @@
>  
>  #include "adreno_gpu.h"
>  
> +extern const struct adreno_gpu_funcs a2xx_gpu_funcs;

Please move these definitions to aNxx_gpu.h (a2xx_gpu.h, etc). LGTM
otherwise.

-- 
With best wishes
Dmitry

