Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C70CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gB12q4lels2v+/8HXtt380TL8doTk8XmybcqxUT0jw=; b=U3dT3T21ldN41zooipN6mDK8nh
	s3ly4u3QY7gI0WBtYHJ7QYNpzOJwqUGg6j/mNzr/DlOkkSgsYc3qfKcx2NbgNljfpNq9AQbNwvWTu
	+WNhcft5rbbNaTGMOgO8VsvVxF4kaRF/dpGDAgn3+5XjZC7N2Szvbci2vg/g4Q2e71/9GeWxV2xDV
	Ab/ULgWG7Uy7naTQqBUiHSS+12JrWjoocCYm398L68D3RJentWnOMtniJUtqLBLaP0QvlrkgryHs3
	zjSoTK2bul44dLYDjXWbR1Oi4Qhz64SpWe+VsxNqkOtOzi/3SWqzaKXa+Gn3rSmWael46wsIrKJuZ
	/T/o2hXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Zh-00000002jg4-0Fhf;
	Wed, 13 May 2026 13:24:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Ze-00000002jew-2Ute
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:24:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jiTs3007654
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 13:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+gB12q4lels2v+/8HXtt380T
	L8doTk8XmybcqxUT0jw=; b=NeGVkM15eeCiWkOht6pvmZ5NQPKZLYdSr948zgvF
	4Tn9hdVbol1zz10PilAJ5xCyomiq+Ju/M3DC1p60yWnFbfGarjrVSiC1gcNoTx0t
	x8YgdMADFeXBNwsMD7GjsI8Ci8c2ddqFt30Ao4j+mCHTsQwA/zC2ZclCPrTiXZNI
	4nYMk7ApOFSlFHsWSbhIDmptURmnzSFWCwMLmskgkfEApEmDPGr5RoK2HnGB+xzl
	JcIk57evZjHf+S4DVS3E+CzewPqssWk735fyK0+yRZvjvgyn/ClamYXcMfffgToM
	2O3bp2bl0kq1JYW7v4+0iUh7WM1ZUKoW1XafHJLzb386dg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0grf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 13:24:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948b41f95deso9640740241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778678669; x=1779283469; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+gB12q4lels2v+/8HXtt380TL8doTk8XmybcqxUT0jw=;
        b=P//A9P+WHvSEbi/jD9WD2g5tre2lUw63CGzZwcW76a8TlrhkN+O2P7ACcCw/pHMnWO
         3vJ/hAO30mj7hEDatjUlc5twEYyfV/miJGw8joOcE/3dCOixKo+2XA6SHtIo1Jebo29W
         JX75nstVLaL6sje0GW3bXJK3YuqM9t2SUjQali5d2wPqrYBwZ1E4H1dUv0HboZEk1hVy
         4kBz2kh/TrQVEgeVxIA+LHSqYdq/ws6lQDOe6Z7VhEzcT7Hz4Hm/HSbwTsVGlwBXPqLx
         CVgmwvX944+Sw1jZpF9zLN9dI3XbnXB4/PwGNJMXR9+dQ92iKaJc2T7dSmQOvXqGaVLd
         4gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678669; x=1779283469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gB12q4lels2v+/8HXtt380TL8doTk8XmybcqxUT0jw=;
        b=ZJA39O/o1OJr5GSx516eVpVH1wfQymeOGQXv85JQ7fTZdE6ZVGZRLmYFaoLaLmdVli
         5F0Z8cIEgj1cvpPJibMQHpf6JvIV1GzV7kAO37rBys9FeTTBMbCM0Mi4Kl8PgzqSaPUp
         AmWi34bVVyi4ciUf/z04v6fgt+afwoeFeTOD/7Wlk06L9pI+BJqhkRQXd6JL1tpwri7H
         ntmLoeJ+AQOKvhfD5d6qsi2R60O3b2n6cxP94OleeBd4ZkfDhj65P68NU2dTdmsGSnx4
         JtL6NDNNtYeIqzX8CLt3ueHjhM9gh5Ei3vecSwephKGPdnOxf+w/wAGw7aBfZc/LQ/k8
         2kpg==
X-Forwarded-Encrypted: i=1; AFNElJ8eqQrc+njeulOh7dyMHj6QQRyT88TTTwykMblZ1cX8YIOctqkUp4yrklvaSFfioQAXV7rlJGl7TLFP3x0t13+4@lists.infradead.org
X-Gm-Message-State: AOJu0YxUIWt23W6He2NyXFzB4ZJ3oDjGplGlAWxi3WBfE5EkzpefhWaP
	T+21AfaQiTXPZ5t3KPwkdFMz8uImkQf3h1KxLhnZKQ6G0+k8kka46BP6TzYomEg4FSDs+FNMLo4
	fLLhVJgCpB6ZK/9HZi3N7KL8KEp1NsrbBN3G3Ee9hzP76DL/gA3wqiH7PkUHCTCzRBxy3y4pG6L
	BgVg==
X-Gm-Gg: Acq92OFkfqe8VqkT3jjBOeEShSBBWA1dM3w5dzE//aGLbI/BTCaiILDLtQv+zuN2v+O
	+IKgV9GOJ3/3SJE5WqgclPWwHY9dv0wqoZP8VK6tGmO+k3phRJXLzZ6FlzIQyX4WPuryWdxmbly
	zMuRj71s5LhnbfbaK5tr/VRWetu4VSE/+60aOxWmy/SpAXqxAT1/HAYzLhGA403QitbZ6G2F2Dh
	5rUHzLaY4B0R6VQ3RSVm/IWKebxzMq52V3mF+axQix9gZ+bzyynKI4zLhEfEb48YnT+ik7LLb0x
	8NTrU5b9xLDQzWiaE/EdoQR+v3BsPuzMtBWwcmSWliwuB3LJcwK89rgvxsuJlojFparXZ+++ZUz
	LbxGvNWKE0nzK9XNeHN+sv59Ze14i0GskBL0CMgPqYFUjZlDdT5WDlg3VG7N9eAPOMdBwpoBDY9
	o1JI+NcDbxQUNYlJQLovp4qW7okvtRXId6ZX0=
X-Received: by 2002:a05:6102:4a93:b0:632:d8d5:291b with SMTP id ada2fe7eead31-637ab380a9dmr1159468137.30.1778678668963;
        Wed, 13 May 2026 06:24:28 -0700 (PDT)
X-Received: by 2002:a05:6102:4a93:b0:632:d8d5:291b with SMTP id ada2fe7eead31-637ab380a9dmr1159429137.30.1778678668490;
        Wed, 13 May 2026 06:24:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6290cfdsm40679791fa.42.2026.05.13.06.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:24:26 -0700 (PDT)
Date: Wed, 13 May 2026 16:24:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <abncnrwznp65m2lmnmzpf4ftde4mqxyfpvlqgzsoxrizet54de@z6yqjvkbenws>
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
 <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-3-f61c9e498b3f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-3-f61c9e498b3f@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzNyBTYWx0ZWRfX2PcmQ7C+gxWG
 nFwIJ17VXh3LUwc1Y28WmVbVDI+EZtOaKjzxmakrMwwBByoqnPsgRGJugS7e9KQKVXolv1msGR/
 10QmaJjyEEglWbr9Bz1E2oN1TODwqQqBte4AaWK1Fy9Z8n3u9zmrsFfvi18XJXAPCXlDEjTdoOP
 /xXComn6Z46g3w50wjb31SEZUcLpVl1GP9FmUFCHnIAG7ZItKnakQQ8CXQbDJZ0+WDHaFk9xSZ8
 vs1+tbRagndU5tvdny4eLtRXCySsHGSAoSGhkI5SE1KnNzOfbPnkeNFC913Sxss82MiOLg8JC0x
 yeIzlmmKeN6PWbBCO2g3UQSAR9/glX7LlWzDhlwhuJRmcQsS02fFXDppWRncJ6FLOAZmA5VC5gW
 T5FZ/rkKR5FJsaPhLwGbTgOn1Jm1HkUlukNAXN3F+EKTl3AtG6Ie3hVde3jSKwg8PVQgx9R7Ijc
 K+HBNoVwIc4IxlMUm0A==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a047b8d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=yWMTck8D_P2mmUstWnwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: -14NKtqOdqpsGe_6iVHJTqsjT4IG7a-P
X-Proofpoint-GUID: -14NKtqOdqpsGe_6iVHJTqsjT4IG7a-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_062430_747746_CE2B90CE 
X-CRM114-Status: GOOD (  19.68  )
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

On Mon, May 11, 2026 at 06:40:07PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v6:
> - move assignment of next_bridge earlier (avoid access before assignment)
> 
> Changes in v5:
> - simplify error management code flow
> 
> Changes in v4:
> - ensure next_bridge is put on later probe failures
> 
> Changes in v3:
> - fix ERR_PTR deref when -ENODEV is returned
> 
> - move assignment of next_bridge earlier (avoid access before assignment)
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 70 +++++++++++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Ack to merge this through the drm-misc tree

-- 
With best wishes
Dmitry

