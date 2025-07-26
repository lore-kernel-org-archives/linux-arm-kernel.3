Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A984C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 00:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVtEWHvXvUc+qGfFc/OhqisrYtRe8clpA4PwpwpT79k=; b=1ZvaN7SLWN13GlnSi+AHqcn7Y/
	sxDUGnWTW1M1ol4Mbg8IAkvjRLcWbe91g3FIWqnpz5cmnP/nb9zU3G7KEds10futjR4HKk1nTjdSg
	qKF3P0+1LVyqI7/Bs+e+RSssfWKd8rwS5JDDrZ7RBRjDko48iD9cEQCOjzroQ5+4oeZOAOceUAvvi
	ZSD4FHO1Y0hewluO4ILqPuDxTP29bhmXtObjOD1apSDt5EBDnim6BsADqhO2a5jyG8qbT1M9LtGU0
	va9geLNXuJyEHkbty0GzhKUYKOV8XuqoyrpKfRt2CRHLlcameg4KpGam/qkuZo/TaY9pIotyJoeCA
	2+7PIWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSda-0000000Awrz-2JrA;
	Sat, 26 Jul 2025 00:19:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSYV-0000000AwMf-0uBL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 00:14:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q09tuY011694
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fVtEWHvXvUc+qGfFc/Ohqisr
	YtRe8clpA4PwpwpT79k=; b=c/Pg0FhZcPNLb4l+6MQw3GZodRoQJwCs+p0WPYs3
	E4EDW7a2S8tEI6QbhZK2/bP1jkrWrqQVZlxftkJ4GMKATN5tvnYAwM6GoWuhNcnz
	Pe2cjgsabm/NCyhtILNPbSqnlsBkRvUD172jyVcdFOyQw91a5gDmbjYlRbeDzQiK
	ZjunzAkUPbf3NVUlvbRY99+pn5IhRbCaAw6whsDUMAfsiM7nIT5hQ6VgC49Lw2fv
	vP7Tn7l5As55LNfW7T60MNTesDn7ByXWuSvES6zKUW+z4o+7mlEn9H+uQwEc52sG
	POS7p3tykbzveuFwypm8whHqLvxkRMAQIypWApAT34JXUg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484m7wg07e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:14:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70708748fbaso41814836d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 17:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488865; x=1754093665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVtEWHvXvUc+qGfFc/OhqisrYtRe8clpA4PwpwpT79k=;
        b=lXOgZwYu6IT8wjXz6NtiR+HBnPr8NFgFyIsttIWK+KXQ7LiPEom8ih9QcUNegi6Z6t
         jQJ2yJEyZdzz3H8OphQ5EcOhaB4fq1ghLv0f6qDobKKqpq3ii0QMLY3ef3XsAbIuSQK7
         VwR/syU5naGm04r0o86+81xsXO+TJvEpkZsWP8B72lfkXQRMu4hBaROUy0bejEkwhvXB
         W+OgV7b+MmZB8/SZgNF3nIDlKdGHJoOHPsh/39AE2Q9xMe1vUHeswoO9DSmwlyvCXj4Z
         RG0X1sE5xSeyDoslUS7fqj4bY6Ayt6g2KNmtn/1xhmifLVIGO/P1VyZ1rkAOYQlpOku+
         o/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9JYoyrc4YKilcwOgSMNiHLs9R+pRnmKtQzbD61rFpSSTzbaYk7PUxXvBf/wf1mDNyyQH6nf7/B3WWEOmKrCTV@lists.infradead.org
X-Gm-Message-State: AOJu0YwTKxudUDXiaU5o8nUvYAZtUCNHLaoGZaFSsqs1KB1eVR4U6Il/
	G33TdDeYOIG1KogIVxStYpsBB7PAE7lRNYM+puRCJk3kmFmxwiAaWTeDeCLS/MK9fCuWAi7jqe5
	gol0oXCX9FFhkXAwliXCiuLIhrl/4Giz4fxnZQo1qofl8kyIgxcM6r/yEdDMPXzKeGeTb0qJAR3
	AjXQ==
X-Gm-Gg: ASbGncu6ipInW4BH72BueJio+h8uz7imBk4TCPr1akj5Z4Irgy3bV/Fyu9QJdGHwAAU
	l3Z1mB87jD8M+jLoMH6dXngXs+4ClfuP1xhm21YF0K3hec/pqUKj42Y5h0hfC78pOlit3k9TLAO
	GhQIqb37R4rTs2QI3z/b3zgtnCOVSM1nSo0PlWZsumLJMTYwCUdIhaveXMCFAYZb3Ag5JOCN268
	8GpBtQtaSWHDP9eiOqyH1j1tzRcYUsNyTo5a0FCDc4PkFTtduK7ase6IFBSNIf4nkdSxpf+aLi/
	5pGkknbyvRpF5ICgbx9dhaXhBgqUy+lLeh//4I9gzZJ7l3ajAEHzheoc2nrnuA93TyWJIAX/Q/v
	vX6M8eTPsUaWDcg8U0a9bdNHLadKr4NA+G5Pa12WLJ3DMjWtQXFN/
X-Received: by 2002:a05:6214:519a:b0:702:afa1:b2d2 with SMTP id 6a1803df08f44-70720519109mr48479066d6.4.1753488864850;
        Fri, 25 Jul 2025 17:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8LMLBA6RRSlqAfWuEkNfbGOnD0mlhKsga/BysfgtQevo2p5uY8FU1lkB1NoIIU1STSJSTJw==
X-Received: by 2002:a05:6214:519a:b0:702:afa1:b2d2 with SMTP id 6a1803df08f44-70720519109mr48478786d6.4.1753488864339;
        Fri, 25 Jul 2025 17:14:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63391f37sm190687e87.170.2025.07.25.17.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:14:23 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:14:21 +0300
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
Subject: Re: [PATCH v3 07/14] drm/bridge: analogix_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
Message-ID: <b7szam2wjxhbwnz2bpnejyppek5ag6vxibw7wmlwzdajc46dnv@xh5lc5bymg3d>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-8-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: ANMCPjntpw4HWSBP7pyAZcBK9giqCPmq
X-Proofpoint-GUID: ANMCPjntpw4HWSBP7pyAZcBK9giqCPmq
X-Authority-Analysis: v=2.4 cv=F4tXdrhN c=1 sm=1 tr=0 ts=68841de2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=r8lg0YXQRZsV-nIv6pAA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX6y9n4A8m31jG
 2+jDpIWk02AOpuuWJHlEngI6wiOC9itF70sL+CQsT/RQzqMR7X66xvC+nmI3z5eQryujYDDXTuW
 fWllEE7xrHNhnI2O0iHnk9OBPXQ7cIhAeBTkjLOBnrsM5hH+KSN1YVACZSR2w37dwRQ/mWKYoKN
 hn737apsofnw3Ma9Kv3WL/ChdnguDsealvz+V67ZnzROWrkxBQgmr7nI1RRyB5pkNIo4kRfobC2
 82fx5nLOyxArnEQYEvseyE7xUpz0yKVZMVHXVjtxggMe3Vj/SlZYwiTWg0R2FmBaSx0NtAbemx6
 JUY+JatkoJdwjA2L2+SohecQKiOt/IMfInQVxqHuZxie2cLw9JCaM2OEI8nL6KfFACSbhnq6pA+
 ppuUz65NniV5URjScSDNRox9n9/mzj6rr7SesHk1bVAvbmkDtpSMm0HGDhX6Ky0RDTL5fotv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_171427_262297_700EA74C 
X-CRM114-Status: GOOD (  15.78  )
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

On Thu, Jul 24, 2025 at 04:02:57PM +0800, Damon Ding wrote:
> The &analogix_dp_plat_data.skip_connector related check can be replaced
> by &analogix_dp_plat_data.bridge.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v3:
> - Squash the Exynos side commit and the Analogix side commit together.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 1 -
>  include/drm/bridge/analogix_dp.h                   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

