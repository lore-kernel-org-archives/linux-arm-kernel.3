Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE48C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAOBRVsjJlHCM4CdITK2XpsGlU7ZTqgOAiQblGZfMuM=; b=X0yQszlM2RyIzuFWxQRl+3qNT6
	JoLVVNcu45vBqq1kmN3fmxRKjfNksC8QGx0x3RCBh3xoKcIZsrQ18A1bnOnJAM1nFpM/q5qx0SvmF
	YXqdsCeUgIEw583CABo8JbRKHjJyctbhnK0cC0PJqufJ5bLLP2mLH9jvw2hb5x9ifKiSuCErga8QT
	O56kfNcGtwugyRe1sDCNLJlBizw179I1TudpLWRpmfKGsMvneMqHWVpMECuShcE1vZYzCqlmSfR0Q
	DpJp79y1Rv0mDNZfPgK+4MIw5dKBKALrLgwJ9Nr+kZMWKpopc35rZlaOFw9jHCRZGaTsdNSVfxaJI
	erhzR/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mt-0000000481O-0K3M;
	Tue, 08 Apr 2025 13:14:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27jd-00000003wX2-1DIi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 12:07:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Bh2Yn032609
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Apr 2025 12:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NAOBRVsjJlHCM4CdITK2XpsG
	lU7ZTqgOAiQblGZfMuM=; b=lqaKm3UaJkGn/9imxJ44ZTO0g34+ZC0rt9Box9zs
	kbLzG8ygIFFJqC1cGFGMuA7PSRNKTWRi44hoN/Le03qLh8KdaQx2u3ZLbNsnC5Xm
	Ut8RmiyYtVAJUSR790WSHIc8lf6BfdVyI/z7By0j64549PQfHFDGE3Tj3TEY0nvH
	5g47J7MlDY2RNbLUbhvBtkUznFGNTK6uceO/r523upDptkuadMDfBs3NY/zrLj5L
	yXYNAUoztzv9ZcEyNbZqrGdrKpUJEjf7aCbNBvUYFEQY1eFFKfQl2kCfKNxKistO
	hJ4+lMQaygnkkMeMRS7tHBekwbEOF/NJ+DCG+wWY5h6Fpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkfjs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 12:07:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e28d0cc0so983523085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 05:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114039; x=1744718839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAOBRVsjJlHCM4CdITK2XpsGlU7ZTqgOAiQblGZfMuM=;
        b=Ai5mYHi2186Loe7VnozbQE7/EASTOGfwIThF7phjBygMMVIPLvMmeuzAmpq9CNm79g
         eyQDh/2BTSyTUP/QG3MVxuzQWDngQAKrGoRgArp49N5Lwum6ky0lCv9SRPMukYM6R+Yy
         6u2ju+qTlGA2Eg55wJeFnGfwawIoVaDL5ekdUmu1JrzEFZh5bgbclkeuu2A8xkh33PWP
         Jf/7LRdr+/vp2ejFWindOmphaGQGm0skmA/1S+RokhOxuHKebeT75u+V2QyKoTZbaR0P
         KG7WYU8e2/BcwyDaF4dab1JSJmjCp9lgobGYkEOLeoDEsW/AsSRDvv9OhtnITtmMotdy
         4dgg==
X-Forwarded-Encrypted: i=1; AJvYcCUNYePUqyhkH1Wss++6bnALA3iSbizPy52ouGqRL1VLZSPRjAUGv4BaO0lley0eDQUdhabsY0E39XeN2ooY2WDn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+wUR3LyBtsv6pjGWbhAFUofy1MOICNGXYM53DMI+7CR+XpGKr
	uVhWITCEeZt43657G49ey16LbKfUESn7GVyX2x8Qtiq+KODt0vplebAJsrt6EvOo9MMcGdxG5E3
	02UPR7ifpYpLyDFGm0DUomD+1YaD7Ui4hizCtIrrrqqJZ5NWu02EhONbcppHrNTOOLEtA6LpVkg
	==
X-Gm-Gg: ASbGnct+j4R3t04azAsj71oJEqS08GQpux0yo0Ys6bjqzLMOKVi7tVV/UuD+xXa6gdD
	Bi+Fh9bDWVb0S0CzZZfv8ULUZlGeJkmtcIvAgA4Dlv1aPF4E4loWA8RfNIhL1JyHSG22nsWG8tz
	uFLbcxF6tzxswMjYlrMm6JVVHeDjEqMxtmS0SBUElV3qH8RPAyx9xzLCYmu5Tpr5sMPtCTXsq8G
	tNyNadbLlum766mAn+GxD79Me5hIvrqEiqDbKK1ETPgzCzOv6uiMwe5o7W4bLarj+nWxCUmruhG
	6MR/+Ark95Mpjkj+nXHI+AvtgjE2FfoAyqryTguAVdIld4Jl8ElMagCDF0RM9ILItSxRiWNB0Gj
	3JYo=
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062274885a.23.1744114039173;
        Tue, 08 Apr 2025 05:07:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOm+0STm+ulEUG2g1OSycLPEpwZd6FwOx4lE88yO8te3gseQuW/5R7Tv5qddqxIae781y5XQ==
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062266785a.23.1744114038665;
        Tue, 08 Apr 2025 05:07:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0312454csm19167511fa.14.2025.04.08.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <63airbm25ly5svkym5fuahnlli76kshtq566zjjdswdhoatk2o@wi4uyz5xrnt4>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: -bZNqOno2BS_Bh9uzyIOMbVN1gyl1UwA
X-Proofpoint-ORIG-GUID: -bZNqOno2BS_Bh9uzyIOMbVN1gyl1UwA
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f51178 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=v-JOCnpjkiGUajTo4vQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=836 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_050721_449293_006C82D4 
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

On Mon, Apr 07, 2025 at 04:23:22PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

