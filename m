Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F40C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTIGg+kC61P58j186QXClRnLU812M4zddHYS5CcqKJU=; b=pFLco7j2snVqU4uHKxWjmLXe1z
	n0WWnPKqZLq3aPF2q6WJyD4F+shRbADb/gVWR1GJVtXcgONtN/gqTUpvbcqnO1fnmqWUrN/KFE7od
	3R5k3PUbY4ek+IC/vWbkG3/p2DSMOD9QAGSvt4FWSTSE+J+WFDP4B6AhUM8fPLCJZu2mYQs73R7zg
	vv2rPA1zviQ+W4OVR1yVBzn5dR3xEC1mxA2vFSphuY+p0w7jdkwbxJ4T5bVGq8mGLvU6eH3YWgv3C
	WLQa5LIrk0pY7BtSCaoIxMxQGQ18EqZ7EJ8ebVKBuFZi2gstf8Hqyy/43zag3A0CwK3FPRr35NukS
	D7GYwyFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufdkC-0000000BR2M-1Aky;
	Sat, 26 Jul 2025 12:11:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufdeW-0000000BQVY-2I7K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 12:05:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q90Qda008352
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 12:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DTIGg+kC61P58j186QXClRnL
	U812M4zddHYS5CcqKJU=; b=BHP6I2YAIqdJi7tJv2nQQJe7Is0zZkqGNEQjjuOH
	1wYHb08R2f91VnkqBvY9h0/mlhFa5BbA361u9hL4nV+TUfqSIU32qKfbxRZKaa8v
	55TP8DPqemAB8XZVDM1cBoWQOxk7LoSWKCjDXAsI58KUbKJ3RO1tsxNFt8uhFr/A
	f6/hLa+1ij3bXOx/31nxb69vRQ/AUPMDBtwKqmVkEeAp+NgTs/JuImttIqr1shJz
	oLgNwoDaFYQe1o/a66mX6KaTcPu7ibLA+qr/AOz5Q33gtRsY+zZwaDnQWn/LJQIQ
	0dKthinJR0wxwQDvb98XnzwfwBa8qn8sM8MzyaUFDilOEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytrnra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 12:05:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabd295d12so58159436d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 05:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753531523; x=1754136323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTIGg+kC61P58j186QXClRnLU812M4zddHYS5CcqKJU=;
        b=qdg1yL9bA+cYO7vC9EVFYyMeGgVDfH28W10Tfc47WWU5yVM9XIFXTlzHibolEYwTji
         R/qdHzrRw+Ssj4KILDlVlgQmf0lEg4SYRxM8vURyP1eB0ZNOPu3hyIH99hDzghVnQcQt
         /arodq1i5UMpLjletdFNm9ct4NI4dMMnHPIBw2DbpfQUwf4nKm0gdlEuUiUJ2RoibrbW
         87QTUFbimUfQTw/hQmCLwsuhaMN7scaHCk1RoIOrUKEt32z7CGXGzUYyuHyvSsVS581L
         qW7jQ+VnxLhBa4XRVV273cFqZl+gdl/U+WjBSC/naADgDx6rJOWnxamLuQbN6sTrM/aM
         DSwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhhknDUD4M1OYNihmKna1KQsVzZ8u18zaE7IfIy5NkfxEPNMaC9rdnQUlM4r7nCoTrDL6EWdE+x4FYcIg1y5sg@lists.infradead.org
X-Gm-Message-State: AOJu0YwnOSCUez8gkta6xIlcfSlyzbhJLokhi+upxSsCKycMKiynG+Uf
	/a6UfREthycAzJBKQeu4ljggbYJ7smJ8rfrzWRLzEgPBNwCa87bLm+nIQOLwx9RMkinxdl2us1Z
	AASSfWSp7x5LOO68sypVv/RzHU0/pBm9kct+wCPKolvvrqm54nVuRNkd73Ls1i8ecSEzIaiS8M/
	FzLA==
X-Gm-Gg: ASbGnctEskunzACpU2mCpSWtpmzG7dTXcmDU9TyyDGPVGCHAnEuq9XeuM/LFN3dv4RP
	qE4xqxPtBVZ+QYY22RmV2yUfI0LegxSJrhq5Xv0Qlp/Q7Cj7ZluTHOjlmGWwMhcGrWK96TDSoh8
	mygK15J4wNHLw/MuGfYOAfDUp414103WGU5LfpetAPDaW9DxRiEg+NH58LL+whlYHmMhN04qU3a
	XaJ/a/ONRj918BUpuSOuHTzWkW0KpBvNmSRQoCe9GqQS0iHnfyUr6j+mT+uzQO/MQFD26/B2f3m
	hzNA3iXTSUe+ATM+yHKecyuVDWaivGrbRj++rOBMyXkS80dOOGqoCGDikGHJ1nJObw2A4k6jNEm
	BKADG13fpr8Ok/+Tf4ksYFY4uDVVF89aD/9ZNOPA0K6drenLzcdlS
X-Received: by 2002:a05:6214:29ee:b0:707:14d5:ee74 with SMTP id 6a1803df08f44-707204b2a68mr71727756d6.3.1753531522540;
        Sat, 26 Jul 2025 05:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqLS1jVGgdye44ecBKfrqDjWtpGZOfSZrTK9StpLefqH75rrfs9TCl1Ca6g9vIQ221L1XPHA==
X-Received: by 2002:a05:6214:29ee:b0:707:14d5:ee74 with SMTP id 6a1803df08f44-707204b2a68mr71727076d6.3.1753531521882;
        Sat, 26 Jul 2025 05:05:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6337f3d5sm406862e87.165.2025.07.26.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 05:05:19 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:05:16 +0300
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
Subject: Re: [PATCH v3 11/14] drm/exynos: exynos_dp: Apply
 analogix_dp_find_panel_or_bridge()
Message-ID: <lhzh32ji4gy44kh6ymobbyp6xdwkx5hwfwdhdx3fy25vaeigin@6ofhouk6nd4h>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-12-damon.ding@rock-chips.com>
X-Proofpoint-GUID: e4BsLz4dJkHFT7DQbkwCQhF6EGe6GWvV
X-Proofpoint-ORIG-GUID: e4BsLz4dJkHFT7DQbkwCQhF6EGe6GWvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfX2iPaBce5zv4t
 RpIvxpegA6cOLUld3KkIS9CkyGWZtDolDuaOb9kt/OFNNCAY/+nTZkvBpyFRilkUjtxoQpuHuNz
 c97vBt+DSfiX5iEAwPVc4wmb/ua85UBnnSOqcMF8kvAjeN8TxJl3AYA9f8FhS7n63b69uYb2joQ
 LKMdSF5POWYe6euD3fWpAgJBYhdCb97BxmEmWoAeqSzZ7Bfn5yAkZqiVuc+YX2cLkG1eJUIjTvr
 Jk0zNeyPzToDNS68u+zPrP6iPvjuIstlBoywijnNBMjfMc1AJ5WuyqYgQXUWeNlW1pqdsrXEZ7y
 +xWvle2Uw/9YfkIM8QMC34h1H97wLuy/4MaATfa6X1088ihZcan5kdvdp0gq8mhvNSQXA0PHHYL
 ah8VMGFWYgd+z7+YnflnSFD3YwRY69J3ApyhGLqbWa/LY+WCAXwgvQhW1lICLy9D9P8T7Eom
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6884c484 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=xX9fryL7oNgbU_NKkWoA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=745 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_050524_590473_189D1304 
X-CRM114-Status: GOOD (  13.23  )
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

On Thu, Jul 24, 2025 at 04:03:01PM +0800, Damon Ding wrote:
> Apply analogix_dp_find_panel_or_bridge() in order to move the
> panel/bridge parsing from Exynos side to the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

