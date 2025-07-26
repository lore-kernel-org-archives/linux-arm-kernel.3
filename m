Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2C3C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtYLr/SHernycwo/uLJDpSmWe/0fY0sBOUuxVsASxyo=; b=4yXuM7tFqVfbFdTjkbB5NBW6ZK
	ZluK5jc70GJhvKY6Wrd7gBL55AcruW9xl/o0cXjHRWQ0dYa/zlXk7UKvw8FfUYt3ZIhELOmujMhTA
	9XbOftXUjdP1Id/rhPPN3ZS+WVRCXWk2gsx0rwfh7c4+aYtwDR5dwyH4QUj9jCFbakEtTOu25OJ6l
	K5wUYO5/6lJIE0O010WREfFx1/5mz73B4+287tz/QsM7ZtqFQb/6PwMO/by4OH5h5lxTvyLUjXMtO
	1GJTF/GDk5SS6tUAmF0TBr9zbdCjfUnfBHWrX4ha358ylEMxzInMNAxeMbYXEpcpPraYXGH7wUrwq
	1tkg0Ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSiP-0000000AxEi-1m4Z;
	Sat, 26 Jul 2025 00:24:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSZB-0000000AwUh-2iRl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 00:15:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJICWk019524
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EtYLr/SHernycwo/uLJDpSmW
	e/0fY0sBOUuxVsASxyo=; b=YtUz99jy4hrPtvY31jcLkeAuD8BdeWHNdkfy6UYV
	2VbnSKPbS8S6BXSvbrAQAKy5QvUUbO/LgJeBEqDWq9NyYHtpzohVGT17gDrFYl04
	1II9/temRvO2Q1rcgeRtwpKpWOnAgndJpLjCLXO66x4hwpbHreCCJMb1KVprJ3l7
	zG9Y85rggGeq8SUG8GZYjNAApYZV75MJdaS3oOk0NIHKIjZMmvLwSsC7454HuQzY
	IsOdPnVtrsEbkrKGFGZlVmgiYuBd5TThQYdcSogkC1pVDcf39gYdQLNoQiUF8JUZ
	2sDXjdq/EgTAQov5j/LtyoeiBlnOJseAWEs31sIrAD7LgA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2wku89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:15:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70707a55da1so81147656d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 17:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488908; x=1754093708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtYLr/SHernycwo/uLJDpSmWe/0fY0sBOUuxVsASxyo=;
        b=wg+5QoydtQZYX3El0Hy4gaQaDaoDOgH+tX66CiD/2RZvSkBE6gGuu3LmP4TyPZca4C
         BZXXmoi9GmQcYfZTfOLEC4OtyUUPj9JWQmqK59N8PIggkswd9OyunlNHysUzIbHo3Nbh
         VqTUvzLq7Jz6vu4b+qXN2v2WOHAQ2jB6adY8vHdRe5bQo0JhMhl6ZjUoeQmd+k/Snh9M
         sV8X++11bFS6GIbcR7HN2u4vzSIDZLnx7VJmIwiI4xLM4BNPEwE3SNJcWiYrFWq/BNID
         l3zIQ4f4Cs+gugRTSyRmyJWUk/w2ot069QRrkXq85iC8Tl8UVF7KEFeroL6gouAReNXP
         is8g==
X-Forwarded-Encrypted: i=1; AJvYcCWc60se+gZ8p+WrpcbVTjHfphw7DEA70s0bl9hTABbMXia5Tuxx8/IuU0zaGG76HGual1AIc/KWVPgP/xbtaqXR@lists.infradead.org
X-Gm-Message-State: AOJu0Yye3VBm3vZdCo5lDeDwroUYxhKvKUBpCCi8JeB4VAc8N+hFao2O
	KKRcXQDqDmM4Wdf/EJ8wNvXtcBvM+i4mHvynYfwx+NoZ98DLyRK+Y5bPvaMK0V5lv3Lt3zm6vpV
	jOdprmnwQP49lMKNv7W94CKrKrsm+heG5nKfX93xA6yRXxnzWpxojYsVkHJXPQXCvkGkSD1S7jN
	Cr6A==
X-Gm-Gg: ASbGncvfj106CX+Gmm1xFQPhxhYjhse9gXpw/w8WD5cca7SU6M4k5b60zpre1FPV7zr
	NQtgApjDTQgdOM5w/kW4CSLywsl9vvlpTNIHvZhqAgezVcW7I8WRR3YoniPmlqVrTR/vwZ6VkZm
	Yi0TiZzqsmVHY00KLT+7asilbuGQc4VE7TrGANZqQLV6HLe1gMjJ6kLQatuojGW4hqO5Nh6RwOh
	CZAHSSLFEaclzfb1m1m9FsctlUGmeWrBsa0I/IBjG9zXxWov/ScrF69ZrKf4tcbGpkSq/bxfSZi
	vRUHkqgd+WHb8GT5Qzub6ugq5TWFLqALPnB0ZwgBQXa3nXOf3I2bGvz4r16VTELTLBGN9otsCGy
	DY5buYkvra+yqZtbZ74JmdY1opjU3I8kqazKJegphXKiaa7hvSIU3
X-Received: by 2002:a05:6214:76d:b0:700:fe38:6bd8 with SMTP id 6a1803df08f44-70720534e2fmr63158676d6.19.1753488907838;
        Fri, 25 Jul 2025 17:15:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA7feK2RtwupaGDRpvYsF4Rqy8R6n6ic8d0JslPO41UFKrxITuNTj+z6HJSoPo9gemAdVjoA==
X-Received: by 2002:a05:6214:76d:b0:700:fe38:6bd8 with SMTP id 6a1803df08f44-70720534e2fmr63157946d6.19.1753488907363;
        Fri, 25 Jul 2025 17:15:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316d99asm197710e87.31.2025.07.25.17.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:15:05 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:15:02 +0300
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
Subject: Re: [PATCH v3 05/14] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
Message-ID: <fkfivnqxpecqpqlk66nadp2lpmr6jxgudraiyu7skebb5qhnpd@i2jga7s4gqeh>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-6-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-6-damon.ding@rock-chips.com>
X-Proofpoint-GUID: t6g8zXuum6dQpdn8VRO2qAxZUrkA2Nnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX+Z8uiXSDra/w
 PA7+zvFwD386pi8k40HvTt8Zb3K/29QsJIrSND/hSdp9/UT0Jz+fnpE5I2ejZGaHg4hcUXVX47V
 W2aZbFCSvLMkd4MmWb7bbwLCsOa8NBJLGvLHYgG8BtnZUeij8wQoaGycGnMTxHVOWMIqzNyKFHn
 yKbHd6wNYWfDufpJm7Am+amYumnZTe81j+SIe6Rdq4tCqFImtxYUVNH94dkq/qKAsIMgkb18tZ+
 vQ6L9b+gqwX+jHEYcMGYX/NzqQ+hzpMjKMfsjy9B6x3QFZIdIMn+2ZIzCmbr7Wx0CP3cw7nvjKA
 T3b7EsHLlGdQfVNX2iaSr5szJaApFdN2wgsUIfukdEUI0/ap29vTBdqHi/SuJ4nwBUJbGsPvKhk
 b9g8QVxurMIza+1xE7fDLrnzTuZcBdI1s71U/y4ydrX+/Ldcx3ShDW08l8dZmssp0KPafhWv
X-Authority-Analysis: v=2.4 cv=d8b1yQjE c=1 sm=1 tr=0 ts=68841e0d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=r8lg0YXQRZsV-nIv6pAA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: t6g8zXuum6dQpdn8VRO2qAxZUrkA2Nnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=919 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_171509_686130_81C721E0 
X-CRM114-Status: GOOD (  15.04  )
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

On Thu, Jul 24, 2025 at 04:02:55PM +0800, Damon Ding wrote:
> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
> directly.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v3:
> - Fix the typographical error for &dp->plat_data.bridge.
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

