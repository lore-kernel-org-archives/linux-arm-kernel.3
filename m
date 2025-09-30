Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CD2CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQIv8HbSGU/ItL07DFk6fn1pHIrebqBCTmh7KKahI5w=; b=TqjZpgQ6APPHuYzvdPkSjSK/m/
	OiyrlFkhISv+C0F05AbGRYHcANQmq9OJZ5zbkB+s/GmUgWsny5aKvh88BcF6QWC4T47rtF6niFFJA
	2hf48MU8C4ioXe0zx8ItIeZIW5UmizS5V7d5YD/oQNzxahtMSI0gPY07NMDkQ8YSfMIafjRZFniys
	EKtcNBNZIn8pPlUhRC7I72bH2DoVRsVwLXHca2jtdzNQhWTfRJx5qwJI+8ecmk9QovS+G7XDd+qk+
	oDql+Pm3k11ilKrr054cFrue7IiMc+xFRsX53QdvcUf169mBN4Uy14ZbK24wxfzElb1cOAYWN82KW
	iQyVxNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3h1Q-00000006BjK-0jQ4;
	Tue, 30 Sep 2025 20:32:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3h1O-00000006Bic-19Pk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:32:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UK8swG014639
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aQIv8HbSGU/ItL07DFk6fn1p
	HIrebqBCTmh7KKahI5w=; b=cOGafGbMemrEy2Yp9eUfawzJXf6Q3VhICbNjmOkF
	ZQlv89/gJcQ7aiAnGhnt7WtH9I94mOdfDhXrfWQ7cYlIKq8ZwyhqFIEP7gxNScp+
	HKS1hy/sLSced/c5RpJZFqqrGC/XYZ0lcT6/CYa5dktC2CdtUeLXlnMATvI+iqKG
	7a/vhWiA+zZuxZU/vUq+EP6h2Py0g/SttYNjLwE95YkMubbYblZz3b11AuSF2bdm
	gVPCIpzCK6b9PyUK/v9b0XNC0L8tbhuo81DoZb85/IJVoNsainh6NwDE9gJi6dp6
	/+mr7+cL+r5c6nDDV2XPfMl+/jyVqfLWLlRceevEMNtY/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr2c3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:32:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de4fb840abso7682161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264344; x=1759869144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQIv8HbSGU/ItL07DFk6fn1pHIrebqBCTmh7KKahI5w=;
        b=bMYIesVw3YjtgZppBk+2Kd4YEeOi9QgGofsRqepjzBchBj1ktgKxgR2lx48KY2T053
         5DhaKwdp1UDIN/wFtNnfM/0tdaRHUB8nG+lr7G06941ODlDyvAU8jsVmnPz90p5qQh56
         6Y01jNBZGSjQwgounApQDJ1xhSTmX1UYSk5Wjdrf4zFyxlEFYu3mtpLY6ebKDAI4Ac5q
         wyrSU7oPE6Np9rZLdczlyI6M24PYQB5YNCe1pKJMmECKyrGu0PGjGD7TPJCfmLdkOMHi
         jz9x5Q5Z7Jq8pSbA0y9KkkpEuA9Qlv9F6jiK4YFIPJsK+YZXBUzS1ZMrtu08R53Nw2f4
         pA4A==
X-Forwarded-Encrypted: i=1; AJvYcCUSTtzfaXcGsrxLKVjJy4yDHl6AIW3gIsNU+ItZ0pdoMwq4tHB9meAN+Qk9S9lIocXDoqsUImoToa6jKSxiZvAa@lists.infradead.org
X-Gm-Message-State: AOJu0YxFfw6Owt6s1gpn54i/JtIiLz1Q4yeJct0aiXYmhZTdYc6ce/Cb
	mHw4MF6wAQsHorOsHgDeZwOdTE1gA4FEOg+BFs73kOLPO2KQ38zWUtDfxHQKOlxrpVSQ9ow8mq6
	G7P/ULhnUL2ToCOfezO3Rh/5lygVkX1Vc7WeLbZsSxcZULcr78wqu1Vj2Nx169cDChW2oZ/HEpl
	Jh/g==
X-Gm-Gg: ASbGncuo4rMUkUFjW9vHgNbIq0WsVN9Nlb+3dPJ5ndpXfzf2yZk2uVE++/sIzjJYdv9
	k1PGvskQ48WckFoiGstAixwxR05d6N3OPFEBpj+Zq+8zoTXrYAoE35b4XiUDZNtaOfdX3n0Tpen
	ATa1fFOv4ZFZ74961384qDLRNwCqcbjOvzHXt53+x0m8Pl6LIu6FtfHqn0nzxIjQI8ipcKNhZNu
	KmrljoV9d+VN6U6wuMJXUq6bYmk9kDkObBzsX344N3ESMkIoLc733Iptvk7yiRe87uKU2N1QrPs
	LBjzZeFegxZ80rcGsqtjWsFNRdtkeLDfe/SIzG0yzKFyDhWeqGITuLoPMnd70J6HY+0GIfey7oN
	Mj0SuQvpZSzcCgYoesobkGNeeqq3igJ4GMlUsjLvUep/8OMzk64hoUdfnzg==
X-Received: by 2002:a05:622a:245:b0:4be:9bf7:74f6 with SMTP id d75a77b69052e-4e27d7c5f55mr67499211cf.4.1759264344570;
        Tue, 30 Sep 2025 13:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjMsa1KUO+Xb2y8JXrARVlbLY0nhFqxX54cw9WXubdWIf7Qf3oigc8c9WVQu/MUBv6yKFVYQ==
X-Received: by 2002:a05:622a:245:b0:4be:9bf7:74f6 with SMTP id d75a77b69052e-4e27d7c5f55mr67498601cf.4.1759264344072;
        Tue, 30 Sep 2025 13:32:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fab10sm5324346e87.45.2025.09.30.13.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:32:21 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:32:19 +0300
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
Subject: Re: [PATCH v6 16/18] drm/bridge: analogix_dp: Attach the next bridge
 in analogix_dp_bridge_attach()
Message-ID: <qqomsrix67lmx7rth7tg44bxjltw2d7s4dwojqd26duf45uf32@krpb756s6q6q>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
 <20250930094251.131314-3-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094251.131314-3-damon.ding@rock-chips.com>
X-Proofpoint-GUID: Y41F9j_65h8ZpJb_ANkrAq8H6cjSjTg2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX42RKGyw+mwgw
 lGaawvDvX+skahi82eGoP/nijboa77gzIW0p7fZIaNDrFx5y+bmJss46trcxVy0mbDMPboIi6MQ
 FxnhOB/pNvAXRqjLv+OQx+FwOQRi1H0n03FK3ilLjhGPYXSE7Yz1vxjmE1gXBnX6LdjG04r3BRs
 WXdiHL6tguYsQqvurhn7sQsnuNY9Idw1bVyC7/mu7oaZbqHvBLZR2zd4vuwx5Rl1zInvccelTi3
 z4l7fmdNU4lobbezTiPaQZB0b/i9zcPXUVfYMjxjKGaZt9HbDzal44EVndj32F1ls/TmpAaBGPQ
 E4HTbylL5AH7TSqcWTGbiJqw+5Leg13/7EM1YVuQd2tYt3WCMbPGNGUya761D+5JcuUrwGerBUy
 0oqD+IIVxziKKwvxE3C7TckvOBeLdQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc3e59 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=z1Cm9R5qtz1vL6CzoToA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: Y41F9j_65h8ZpJb_ANkrAq8H6cjSjTg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_133226_314783_91BE48DC 
X-CRM114-Status: GOOD (  18.07  )
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

On Tue, Sep 30, 2025 at 05:42:49PM +0800, Damon Ding wrote:
> Uniformly, move the next bridge attachment to the Analogix side
> rather than scattered on Rockchip and Exynos sides. It can also
> help get rid of the callback &analogix_dp_plat_data.attach() and
> make codes more concise.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v6:
> - Move the next bridge attachment to the Analogix side rather than
>   scattered on Rockchip and Exynos sides.
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c |  7 ++++---
>  drivers/gpu/drm/exynos/exynos_dp.c             | 18 ------------------
>  include/drm/bridge/analogix_dp.h               |  1 -
>  3 files changed, 4 insertions(+), 22 deletions(-)
> 

So, here is the rest of the series. In-Reply-To header is different for
some reason.

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

