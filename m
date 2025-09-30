Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E2ACAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUh15XTlHhQ6Q1q/DhGrQFrryiPIaucH02PqHMC1azU=; b=JQAjGU0yJ4U/UIEZjiDDe4f6YE
	CBkL+HGMNncsdQT7VnAzxFVtOo2u4DC/H1o/yVVeug8IG01pj+fjauLAYfuN1HJa7wXj+72/Q+m69
	kZO9TQQgSibnRbaCeWuVKTCQUu44LXn7WS/Vbv7WyO/9s6dFQ6FpnLLfLOZF9Y827AMkPhRxU/IF5
	i4BB3eOnzdO+Jmu5wq8SJ1lJ/nP9JU7Ola9jgtiLEF3vVKs7treo+AhUQw+cLTbNlq1DtJp/sOdy7
	FeUFz1BNvpVxXMv2Q0zUvos0aJlqL3VGtm4ekhg5POlXejb4+LWVFUsGLkpngoSSkaj5avlENe0OY
	FdletzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gfy-000000068nw-1xQy;
	Tue, 30 Sep 2025 20:10:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gfw-000000068nG-0vkN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:10:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCDoMw012468
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HUh15XTlHhQ6Q1q/DhGrQFrr
	yiPIaucH02PqHMC1azU=; b=ffJrJ0PSTxvIAskznd1HN89PYvrtK1jPtX4SKcyO
	n9M360aQdp97l/HD2LB0hM7I3AIBClvyVjFNX4Pe/4gDkw4p9PlD04eunPSwsfaU
	bBZ2YMmmJnJdJ/GcYahlQn8cIUTUvbx1ueAUfOYhx8IYeK88/xQZh9o48wuAIdXR
	ijxVM3znvZbccrA6V9xUPuFJsIrCrN59afxk7F0fEZttLODdeHJQTFWQBJf6Bxa5
	gtEUZJv9MH7ZwXBQq/ay7K9XBo1P0u8OSz4pSDBjqaBB/TGe9u3vSOB94F4KoOj+
	jyc8+qidoq5LZ/0oKAzmhM9or2F0L1OrF6O3XA/5b+R9VA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a62bqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:10:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de35879e7dso102834241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263014; x=1759867814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUh15XTlHhQ6Q1q/DhGrQFrryiPIaucH02PqHMC1azU=;
        b=rLr0WMe08clu6Ev9EEkhjqGtmdlhPkTdZF1v06iviAc+pRRrevTQUX3FRiQ9GcuZZ2
         F2w22xgf28wmUy1UXxRZmE4MOpChewExQxxy8mVzc36sr3F2t5lE7EALLVU+f6MY9pPJ
         T4WB6I3MtA6mJWU9UH2NY7e+7cXqwqtk9Jbc3nq9r28ALFOwxF5eNj92rSvWLXX3k89t
         bfBeeJZ0aCR9YKeRDQkWXESjfeGastuUrKQxjNkT38WR3Hfxlw44bMnBnNsY46LzbB1C
         08+gKxK0jFLKuWKDZXqhEx+7BwnGzezffPuAsyquL8yxBo2Rl7WpCrIXODP5s2trjBMD
         OfWg==
X-Forwarded-Encrypted: i=1; AJvYcCXxLZc52WdJ0/mfWpFE44ZgOYvFahHesoJb6abNGKUVN5Or8j5LbKWEvzVHO/NpUxMsw8LpeLPIP9PfHaEVjeLd@lists.infradead.org
X-Gm-Message-State: AOJu0YzyPsYhBSVKXGeWe8eC1hpnb7DN/iOOy8zKSVXeBfgec1tSGw2l
	bdXmCoxrHRXJ6e3+rmPznq/ywfvoN7ITg6i5wtf7QvbZWXyRpwCswxd1nm1Twp06co9mqVCdlTX
	gtmMJKukb4FkuGVspjW0H34aUQCC7Gz3pbgI4HXSDOSbVW8AZha1Uq2AXBUOQaolIilh1w5I4Nt
	GVww==
X-Gm-Gg: ASbGncub16dGCRiEFmdhR7Q0jlywhFxaLvGZAzQgupmpXzE1kY4owC35FoqRTabP/63
	IG/J1b36anETk2HmK0WO2cYFKVgO7DRsAmuZ1STDgQQXKvUajDp3q4+ppMryJJ3z6YQTjb4XALP
	h7iyf1hwqCBCQU9Y1YD9YMcIlZzkMmL7B4FZFrqy6Q3Fa1wV1CQwCrf8Vbs7wXZ3ApaporJ+njR
	DavYvWQdfvQGqfl4hmSVLvZ37+jHQIE1G4G+uOcE1Bgcdkz2X5HlvZtnN4SpsQVcnuV1y67x0eM
	KPHMT8dHfXbIINotKeM+Yfj0cmE7hgy3zWcNu/XYDHb4nPs4nvYAF/4GVRpWSewf4RRLcLPOpGQ
	/gww8h9XPSfdWPjRUIwtLfd62Z008Qxg1bXiy9JxT914a6/KXExYr6XQBtA==
X-Received: by 2002:a05:622a:3c6:b0:4b2:f4e5:8eb1 with SMTP id d75a77b69052e-4e41eb14998mr12847691cf.55.1759263014249;
        Tue, 30 Sep 2025 13:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkOHi3Cw4K9bHAEsEdXynVuyKt+2OCerw8APvAAWKM2bNTs+Ga5p28b3x5snKdH664Kuc9Vw==
X-Received: by 2002:a05:622a:3c6:b0:4b2:f4e5:8eb1 with SMTP id d75a77b69052e-4e41eb14998mr12847201cf.55.1759263013780;
        Tue, 30 Sep 2025 13:10:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586b0c1f9d4sm2610582e87.49.2025.09.30.13.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:10:12 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:10:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 04/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Message-ID: <x2fpm4rb7ermb2tyjefdwwbvwvzt6uosd45ad7ku3tp3yqkmqc@bayzgz3jsqkp>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-5-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dc3927 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=_9FxbLpkiinsEApfcMMA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: mZyBBrmtGBWykLFghGBGBoHCkTDZipMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX9qp42vwD3EK8
 J4goY3OYE7j55HHFAWpnN0UAABLRPJ/RlbOpCdqGbCKgMIIcd8atvDpLCgTUA1aQJgXiRgNdPgG
 VxWL90vnJBAc3tvwAOv18gKNcZFCOxth9/FBsOwR5E4TCLYxxC6/gbLzQf4o7Rqytqm7UdxkI2I
 c7N2WOy0u8chYUnfoqjpHf2soLtAmDyMC1tLzPk01uqLpdVxnx4cHmngGjzClqu9x/qgPJrHBaQ
 bnRN3JqvUKPrrVj3Tfwuv3I4LLf2iZwtBB2/5hiF1Q/hYTeIEib9yQiTXEoMHO04uXUrRjzeo+9
 90JKxDdJWyDP9E6CyXjSvr+kGDrmE0Co5gSRdKzBMKJg8KBu9YDkFirKUhguZllpj8yrccJP+hu
 AMtKZWXOrBVa9y6Ep37I4BVMofcX1g==
X-Proofpoint-ORIG-GUID: mZyBBrmtGBWykLFghGBGBoHCkTDZipMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_131016_387664_F8146651 
X-CRM114-Status: GOOD (  21.37  )
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

On Tue, Sep 30, 2025 at 05:09:06PM +0800, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
> 
> Additionally, a new API drm_bridge_is_legacy() is added to identify
> the legacy bridge, allowing specialized handling for such cases.

Why do you need special handling for it?

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig                | 10 ++
>  drivers/gpu/drm/bridge/Makefile               |  1 +
>  drivers/gpu/drm/bridge/imx/Kconfig            | 10 --
>  drivers/gpu/drm/bridge/imx/Makefile           |  1 -
>  .../gpu/drm/bridge/imx/imx-legacy-bridge.c    | 91 -----------------
>  drivers/gpu/drm/bridge/legacy-bridge.c        | 99 +++++++++++++++++++
>  drivers/gpu/drm/imx/ipuv3/Kconfig             |  4 +-
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  6 +-
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c  |  4 +-
>  include/drm/bridge/imx.h                      | 17 ----
>  include/drm/bridge/legacy-bridge.h            | 18 ++++
>  11 files changed, 135 insertions(+), 126 deletions(-)
>  delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
>  create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
>  delete mode 100644 include/drm/bridge/imx.h
>  create mode 100644 include/drm/bridge/legacy-bridge.h

I'm slightly concerned with the name of 'legacy drm bridge', It was fine
for 'i.MX legacy', but now it might be a bit of overkill. Maybe
something like drm_display_mode or drm_of_display_mode bridge?

-- 
With best wishes
Dmitry

