Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58A3C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 00:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTGcg8JogZ8+3e2c1J28j27/pKoaqY9rvoZ/CTXAvIA=; b=0gCvY1tir2PrRM0YXRR8OnzGqP
	Se5FzUabK8NnEb54+avVeE02tlWVcerj1hJ2HzaUu+RT+grbhhLdhY7BQDNmaBDb05rnsQt6S3dgt
	+uB+VAWSHy6vbrVd06fHN6GEO/g9oaE+sfvXzY6eWSW6o1jzzRQqmjBZPicdwOAVaKR4Nb8ZNFwUW
	mhK14mfSuybLAO2uIAhNe2e4rmscFnvFK2dYtp1xOMsnoUsoGCyTa1qQ41nMT1Qc+jU4Id5C3N/0J
	xnAaDqo8HKuPXa1U4Uj9j/MwRLqmU4Tm5eY7DvTd1fQnuB2rxI6V2NwnrTtl0xGQKSEq1+QTg6fJW
	thNyOJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSfz-0000000Ax2m-2Wlq;
	Sat, 26 Jul 2025 00:22:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSYm-0000000AwQC-1mx6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 00:14:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PId2EU026969
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CTGcg8JogZ8+3e2c1J28j27/
	pKoaqY9rvoZ/CTXAvIA=; b=WQIrZPLebG37A2p/sAaV1c+nhCPLOEZ7dKd/z8Wc
	1EWqTW2Dz1/JkNdJ/nCiPKnFh+PmSQpBnc1k8kRzygJXo7V8ICN5XTBWNsfXWlNM
	+FVL5Exg4RjvNzbJGVJjC8pWr4B0KXC0bIJs8Xms3O1OBi3j/oh3PiKlnCaMwbaH
	YTWlWvjdgaUtEWO8HHhmyMwsKcVPr+Ey8b4iyE7Z9/uffJa+F9TdUyhLRAfFgqHC
	nZxLN8TKMrteknF+bwg2wtMg7kpADmN+c6doR8bKUja2yay1ysDov89fq2vJeE5X
	mKhZ/Lz4qMRy99m+IS26LwS4s37nq+L04LIc3aOco0Gw7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u3uw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:14:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e350915d2aso877856985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 17:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488882; x=1754093682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTGcg8JogZ8+3e2c1J28j27/pKoaqY9rvoZ/CTXAvIA=;
        b=vFnU35bSAhgbQctWfKf/ayHZnGAMxAIjAGe74wplpNSvLaW+BhoxA3fP5TuZ3XDIxA
         gq15blzjqpkJ1PziTb8sLD558gpuO/HcvBkCikRQJhY4svC+3VsGobuONwqEYGKVULXf
         xMnE58gq4etKuEdk5XdnS9hibsTxoa0F3trpqXx+vRcEPtmzWNkRuA7NNeZQrW9ep5Zm
         TayNuMALUGJwmRgrSwrMG0E5YiU1XnUMQMT0lyrkS1trw38uS71PbijJQTyDOI1/wAQn
         cvrqAeUEZkixL9HfSRfKivlR25LIRy23wEYLHL5Ad1A/ZHxxbi/9mdJd+V3winDkPGdr
         MvjA==
X-Forwarded-Encrypted: i=1; AJvYcCU2bU/oyzXgYjAGCBIXE+gy1OLJTfwUOCDoVWjMFMglswHf11NDb1RTYN+GPYzYIR82kYGYsjHMBS7octGcYXJB@lists.infradead.org
X-Gm-Message-State: AOJu0YxV6peWgthOU3yx1XmFK1f+jbLMJjNShkV7GYRwXc/ROr3frbre
	nq1SM4satl8HxjoxQUWgsYd7PyKUMQlIw6Hn4LR3XD8bV3RSLZIQhmA/RyrPjhoFa0J2YfFZCVm
	Twy4bb/7m5gkL6D1AVgaYD/hEOsI85nTiZ/XI9/Sie9NkoaqTTLBHIO6mVkqqJ8mSaxUFtufjoD
	ZM6Q==
X-Gm-Gg: ASbGncsKa45DvaYidcnKs5Lg6p5N1cLOgng5bf5pp/wK9bAbcqouAH9Og+kMdQFPxpH
	BDi/qXw7+ST1o1xzBqDnhVWbz7KPtSthq3s4CxjxT/f3CV0ghmjWCO+5ztBbysTkY2061+urUoy
	QW6KohFnGoeXpAf6Y3x1QjUKq0nFq7Sds3bnmLFSmRwIBc6JTmvuBh1v5juC52GGkftrFoaLyo4
	Ibv3jXtAHQr+FvjeZRsj52q8situtuQ04a7i3CTbJBVTmjxUo1mf+ilzFjck2LhwWLRZGy4C6Vf
	TlQw6LmuxL8iMc7tI0RyW60NcCIBdYT7PM6WOE1v7yxOIUF1aEkiatZps9IBmdEVzMv4CQgFpaA
	0xBAjkO05rILcPUQNRwAUQixFtzj60Wea4NgRHMv++luumBM2CFS3
X-Received: by 2002:a05:6214:1c41:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-707205a701fmr50123186d6.30.1753488882394;
        Fri, 25 Jul 2025 17:14:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdQpwGUCkqR1lOUKTKaqZouyRm9icTapQyzE9JidQYLs6U2H/kr9H1AePaGwZvW49Mwo6Dww==
X-Received: by 2002:a05:6214:1c41:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-707205a701fmr50122636d6.30.1753488881831;
        Fri, 25 Jul 2025 17:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6337568csm188598e87.129.2025.07.25.17.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:14:39 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:14:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 06/14] drm/bridge: exynos_dp: Remove unused
 &exynos_dp_device.connector
Message-ID: <ovlz5hotvqyn4gnrmidfq3aafq6tkjjpnpgt43yterf2cd73ys@dkarreyoctbh>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-7-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-7-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX91Gz5DW/dbyK
 U4mosvS606M9ZMJ5fx4IE5uzt4wg6FW1XNH3lZQRslRLBA6k7fg9nCihu27txs3ovTmmcuWklWj
 n0oVPPnZhohePaum3I4XsEtNIwtEo8nOksRkjL0AxOJrOo9t8jNvCyM9UUw/eNWQD8B2SZLa+8N
 gUAfRVZ0cgGkYysfkpS9LnvR6J2UvKH2b4cCYqjYB8LY71zDpDDgHr464o3AifS39TvKK7lDV82
 lcl2oOpk99JAD1ogh6uz4p3w9CA0tMoRl5Xi17x6SsB0CpG7ForWJvZnbkJ9zVAb1FJIbTrIbNQ
 66aU3Xo99oB870GkzlMcbKaz3QbnE5WNk6+qAWwpF9gyz/dQX2RhEBNOTKIYlYIgEa26gVKmEiE
 xIDR2QT1bbatQxOzKRkITzTJDzNVbrUHS79AVB+YCt3fvWoEN8fVVhCXzwNjDuOVl3q9A53a
X-Proofpoint-ORIG-GUID: eg8WEDiG60ihKs4rd5dIeSixnAGjCfCw
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=68841df3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=xX9fryL7oNgbU_NKkWoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: eg8WEDiG60ihKs4rd5dIeSixnAGjCfCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=779 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_171444_462833_F787E6DA 
X-CRM114-Status: GOOD (  14.54  )
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

On Thu, Jul 24, 2025 at 04:02:56PM +0800, Damon Ding wrote:
> The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
> but never used. It should make sense to remove it.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

