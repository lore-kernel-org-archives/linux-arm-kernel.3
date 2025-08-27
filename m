Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9A5CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 00:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMabvnMiY6aI3QTnrZr9pq+NRKVIz1RxP9V/JHunYhU=; b=svhQ3grdfjbBnlCwVdh05CGQCj
	+5UuycUPVkgrP+uyhPcS6VfSk+4Sk2ES1PXizKRmO4cEgbFf/6cJzLXqspEshorFzyUwQEd/pSfVU
	y5C3IuFe11giMqpJZGJOGfU15TflPAvA+COhYs6FIHEPmwDs5DL8kKppiaTtW4ZQ/7069j0h6nDTx
	6+p8/cgHoF7CdCGl6YmvKK6ivJ6sCXEGhSUWAP3RWxkkzw/q37jL1SUOyo1wFZkZWLup8ua/mx4TO
	GCzCKEgO4u3HJLWNH6URUuVi0+jTw8lKJXEbFN3ZehHckWyEHXk6HSmWnhPw61DEicUUC8ygTDhze
	hxruVTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQQV-0000000HLbY-2zDg;
	Thu, 28 Aug 2025 00:23:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urOZg-0000000H5j6-1KKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 22:25:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGf6Ie031265
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 22:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wMabvnMiY6aI3QTnrZr9pq+N
	RKVIz1RxP9V/JHunYhU=; b=gS4ZBzmCgDeh85coVTvtc5oGJFI2VEr0B4boNmF1
	O3qPXL7qBbiAVuTr52jGhMBV2zit0RdQ5BLv12Fl+ToaZkvNk+/1F0xHIdrwbb1J
	wmQxWz6cVISIN9+voNHKu43ytyrWMVYcVBM+BS0zM8uBNyiBQvJhoLQgZ5chaMi0
	kNfVSdHggJV6j0kxpQnGhrU+rHeMZL+IDFphUzlfQdbC2LQ8TKO68RRBFZkn+mPM
	vvZN+NnKqUQIHRSN5Yg5A6scSFSLnHBxfQFuoaKEnc5sx9unDcsxRS0YWurBvaQK
	AtnOt25Q1gVPh0lff1ALoiyTYRPbFDQNtm0WgE6pb8HW2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615p187-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 22:24:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109bc5ecaso8890551cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 15:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333498; x=1756938298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMabvnMiY6aI3QTnrZr9pq+NRKVIz1RxP9V/JHunYhU=;
        b=ZP08raxi70YFKzsWxk1VUQv90ofibDDNLxHJ190JfiaYncrvnXJZlXMC+HXAxlOKRn
         yEGNygPex7Muaq4cZ3q0Hz9k/dSri2DQjnJ0XgSexleJlFbfAWAfKUCdDXRdRae6Rzbu
         frFRkMjZhIPnu5RpcaJgzS1VYPuaQit0XHMjNWUvluInH02M90LK9z7dNQXEybl86+lQ
         lZp0BIhM2TTXSFVTxep1e2ctvhkVpXhYDZLy9CQPSpNzP9BsQL6dMQnFDqFQsYFg4qLV
         A9vkqbdWhBPAY/UPho967AuUWgyFiOCBgBufXpzkcHtlpzFmKI6ZdGfK1ljXg4l8cAUr
         1ioA==
X-Forwarded-Encrypted: i=1; AJvYcCU2DCRpoARnCx21dIdukTkd4g7iO0EU1YtlffroUPc+CUhB8gQF8/ahmD8uR19KmPiWwioJElZCju2EJR0Dq3Cl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe3uZz1s7t1twwSPLKjLsNhcrf9nE7M2x+Fielf/+Oe1NdG8Cj
	U5EoBo0TXNb+lHIfJUjUupKQEZuBGjjakIHykERc2AHudSnn17+vV/YqJtTqIcIqTS0TqjgMnn0
	rh7K7MeoiHi+/EGF8H1yO733CcTNoS9/7cPe/Ri2HkFdG1PLa5r18FBXUzegC4n3aWhPh0wpasQ
	BbcA==
X-Gm-Gg: ASbGncs413pMVnbdZ1uwkYedo3cJ7xso9BACMJWPxGlQJtf/03aTwtTCfNvr+DLoD2o
	uxDJBlvCSulBcH+gg+hGPt2WffWfqYZBjA63n6Hov4XoPFwMW5JI9NGkoL5qoKos3FxaSHyRoV1
	sRz1jGW1wvlw1Xls1Mj33DO+pQ4ILBoKkgbXLvDMzqqaIwwYnbR6PNP+Z+/Hp/kFdOlWL3T+Efa
	2xq2YLqWjyyBASbdZ81ea9ABnLdEG3nt1mMXtPW2d9QclPj3+e4fAoFMjqKnfffvbMCpi8Taqce
	/3Ne0npApwWeYz3PBeNFY3u07q7gO9OmILimKjVuvyHeefjVgoDaHnK9Jlf4HS01XWr6m/fu2dC
	9A/OpRtd8pTeG1aorJdlge/NL4CDIIp7OQbkrO7VHk+pR4+iHt2EY
X-Received: by 2002:a05:622a:5e1b:b0:4b2:b6dd:3f62 with SMTP id d75a77b69052e-4b2b6dd4850mr141574661cf.15.1756333498279;
        Wed, 27 Aug 2025 15:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWL5d3fRji5RjCf7oZDMHi6+hAavouE1mTTu18gEHtzIXVQqcCSxTkltVNvjDodB9v6M14nQ==
X-Received: by 2002:a05:622a:5e1b:b0:4b2:b6dd:3f62 with SMTP id d75a77b69052e-4b2b6dd4850mr141574451cf.15.1756333497748;
        Wed, 27 Aug 2025 15:24:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35ca6af5sm2954613e87.138.2025.08.27.15.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:24:56 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:24:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Message-ID: <bochli5u37mhc6eup7h2oz3yeignofbbj4k5nrvm2k7zf6f4ov@t2sje4gmveqa>
References: <20250822063959.692098-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX/RDWU7HjwdEh
 5IlsuqXj+WuEpVwtwO/S/ofTSbqblXFDb7mZtLz/FfJu7m090bxPjqMvQzcPDwj+gzG316WPl8B
 EJQyJVsM4o72WhaKDhHPrFSotbpKI9087Bhg9e8zJC+O5BaKpGFuD3he9m93tn9c9ULWSQi90Uu
 swxcADjEKr2OuHJs7uHEr13H2+FPSSZxG7FeKrLvBm6Cl9uBRjkDUZSRX91RdaGq2hf0RkRWmFE
 SnkZQe6cw/+V0BchzgBOo59I7Uhql0B3TtZf4Vd2ii9CoEA1MORIXOka/1+gw0u7cfDNeEA1eHu
 ykvWzFKLSa1H0CjhdSc5DitcX9nsO907QjK7mU4l8Dr2ijWLg3KuucMZzRHIpK++Frat9cPPWfz
 I+NGfXqp
X-Proofpoint-GUID: L_mWrxMVSHvtRfS2nECr3Vc5P6dHNvu3
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68af85bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=IMEu-sUR2OXSz8FBHAsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: L_mWrxMVSHvtRfS2nECr3Vc5P6dHNvu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_152500_530997_1E34FE97 
X-CRM114-Status: GOOD (  26.70  )
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

On Fri, Aug 22, 2025 at 02:39:44PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
> 
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
> 
> The current version of this patch series only supports basic display outputs.
> I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C
> mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen and Piotr.
> HDCP and audio features remain unimplemented.
> For RK3588, it's only support SST, while in the upcoming RK3576, it can support
> MST output.
> 

[skipped changelog]

> 
> Andy Yan (10):
>   dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
>   drm/bridge: synopsys: Add DW DPTX Controller support library
>   drm/rockchip: Add RK3588 DPTX output support
>   MAINTAINERS: Add entry for DW DPTX Controller bridge

I tried pushing patches 1-4, but got the following error:

dim: ERROR: 5a68dcf5837a ("MAINTAINERS: Add entry for DW DPTX Controller bridge"): Mandatory Maintainer Acked-by missing., aborting

I'm not sure how to handle MAINTAINERS changes (or whether it's fine for
me or not), so I will probably push patches 1-3 in a few days, if nobody
beats me (or unless somebody points out a correct process for
MAINTAINERS changes).

>   dt-bindings: display: simple-bridge: Add ra620 compatible
>   drm/bridge: simple-bridge: Add support for radxa ra620
>   arm64: dts: rockchip: Add DP0 for rk3588
>   arm64: dts: rockchip: Add DP1 for rk3588
>   arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
>   arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
> 
>  .../display/bridge/simple-bridge.yaml         |    1 +
>  .../display/rockchip/rockchip,dw-dp.yaml      |  150 ++
>  MAINTAINERS                                   |    8 +
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   30 +
>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   30 +
>  .../boot/dts/rockchip/rk3588-rock-5-itx.dts   |   59 +
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   37 +
>  drivers/gpu/drm/bridge/simple-bridge.c        |    5 +
>  drivers/gpu/drm/bridge/synopsys/Kconfig       |    7 +
>  drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 2095 +++++++++++++++++
>  drivers/gpu/drm/rockchip/Kconfig              |    9 +
>  drivers/gpu/drm/rockchip/Makefile             |    1 +
>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c     |  150 ++
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
>  include/drm/bridge/dw_dp.h                    |   20 +
>  17 files changed, 2605 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
>  create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
>  create mode 100644 include/drm/bridge/dw_dp.h
> 
> -- 
> 2.43.0
> 
> base-commit: 18b8261b84ad5462d7261617fbfa49d85d396fd9
> branch: rk3588-dp-upstream-v7
> 

-- 
With best wishes
Dmitry

