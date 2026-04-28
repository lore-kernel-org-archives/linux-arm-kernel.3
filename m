Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228AEFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQLZEedAb88z0FcldXX3/tkr8XsiZzoWRGMmS0yjlBs=; b=OAUdyiMsFs5ny/X8YrmkBp0W7L
	8TA94vYmuYMvJdTpOgoumA5OzK4aHSq9AHfUhp+Df3TveY26+0V97nLleIV7hVKFYxXq++XmhjjSg
	NEtDowru2anQUvbdiABSPx75r7pMNkbo1GauhkyoQ7otXD0XiUrZGFEbPet/FFQyNg/xPALIt6niP
	kdP2MOPKzTEn8/tzsQtrtQZOgatog+uG1I95zW6bAs1tYodHilux+o0gmn0yN0RHqCIA12hGvSGnH
	hEkUXJrRpg0TSir1NE+JAl5gioBViZ8p5XR3tnkvf7Sg4DG0x6KTVP40n66jC0P17bxF4lxcLvpyd
	E+smcvLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgfb-00000001Lxm-42Ru;
	Tue, 28 Apr 2026 11:32:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgfa-00000001LxL-1PXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:32:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA4Afg3275594
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sQLZEedAb88z0FcldXX3/tkr
	8XsiZzoWRGMmS0yjlBs=; b=RM+Eq6m7LyVwq0YUZuHQ2FBEIgoNu2tiFFFHljeF
	KqsPixmYhdlCEE3aiHrjNx2kGP5ch/DO8HY3H5IQyLWd0COR3qpRiD2YkqdTOcFg
	EvZeThsp0jMwDgoua6sPpeKfStnhBlKOL0lBmmlZPjK+i/kKinLW046qFN8mfoKr
	dGGvDQKPVk5DbDEsBeKaX/apdXKjo131DgFSymWZeS0pEl6faCoPM8o3bFJzLdnE
	JmpB6ywQ6haJDg2YXthgkQBs0eQeLkNH5W6a10QvdZYhuamMZr1QHz0ivuqBfzsJ
	UObWZkjZPhKzuKWEoevovO33o7mZDZcK+C2mrQ0inajBgg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjg9nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:32:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-610169771d7so13030277137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375920; x=1777980720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQLZEedAb88z0FcldXX3/tkr8XsiZzoWRGMmS0yjlBs=;
        b=VMGvskWN/fhvFbrcHivZ4XfWVfXBBDodAGScgA/6ZmieN6UOOOG9ZTFaKfGxWPlOOD
         gxFecYZ/D5bIR7KIE6/WiJf3No6sxx85Fd591ZitxO+29W8rl2nJtwPqIZjA3YJnvmgZ
         e/lqBAr1E434eVnGKsealar1R9jHhHDk2AyA1HDqyDROOidWEA2WMIHLZ5N1PfKHxZav
         SYFFAuA3SGifyUNfPO4K/qvJ6qibVkB4I6FFBCIA65Ma1C0mCv4w3xtr074+/tCWMVx5
         BeN5bvEeaAPn2/HkaORnkiNRE/U5SEDcIwxRDZtGJw3gBLMz2r+aNMlMOpFlivy7mUZk
         3/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375920; x=1777980720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQLZEedAb88z0FcldXX3/tkr8XsiZzoWRGMmS0yjlBs=;
        b=YbvJBq1kAQwWUu4GJD+0IxwqHywb3P8gmbSbl5E3Gvb50e9h8yDlpA+X3Vu1FbRgne
         J8+dMfwd6WgqvTX9RfPhCfPWmyAP4+YTIEeox6Zq9XIS7RBUAwwkJOa64jrd1FQlCH42
         Rg++gqlnojMpLDG4bvEByDrkRRW4/EnrdGaO5HdgnZVrTWMsnY/A6OAHmf2Ya5b034uT
         Mo4yOvSS3k0zmyugb8JUR77Fk9fVoKBPjwiWq+zw1erdW3dG4OBxLL9rim/jRF2ohCfF
         ulmIRikfjKkW88hbiDi6WQAhUNRK0UHW+x5VK6Ld6AzbazfXT643N0tTeNDEM9wg+l0m
         XFZw==
X-Forwarded-Encrypted: i=1; AFNElJ8qENEGQQR8Gcdb9JM6SnnRTp9TvRKrqZMmbcfxF2ZMwYWs+lJ/j1WvvUKhsj0mRvLs7V3mkbAwXaJsQ/vj0UIH@lists.infradead.org
X-Gm-Message-State: AOJu0YyLcTs/gEdE6ZDauDLXLeLemprORyEt0utV8WgYmN6ssVIwzrvW
	qvlw2o8+iLBEtD0pLSkSOk8UxHbOk+OQL0qHFVEgFhC4NDTQYVgJolKbduxSnaHLPy5ZVPY/dLi
	wHLZn6BkzJ0YZjLV8CBXogpM5blFi10jaVX+COZRe6gvnPyLQJZC/fRH2R6v+lqgan2jjOyXoBX
	KsmQ==
X-Gm-Gg: AeBDies2fofvVwepvQcn5mlHPpV9pWamaWkfzhuV590Xw0AjFEWcX330NPzWkuftXSA
	5XghAPornptusHBmp487rrllVesonPtFlahz+BR2k6gvPvvwzYJrswJ1egXrG9KDEexrbM7XZxq
	koUoUgitlPN8dbfZj/SzZ7PNW+adZra6h1K8xn57JDSrs+AL9zs7NzdI7SZJ+PhFvf0sXaMdxxq
	QF0k8aZuuQBStFm8ZzSPeXuvyPh8p/i7Brxwp7i23HhqDiCsGYLeJX2BOiDheqmqXqa01eaS2VL
	Oh0g9BNIOg8xuFmv+Iq2s/Etu9CLXiPCaV1jFg9xyNx3kNLuwBLDspPClCVexBcMIuLRGgVgp3b
	3U9FbTk4q4toeqgpzUmRi1vbDGCuAUjRnwpAjhRLm0FMtSSUMwRPFVbkBkA9Edwb5rs6un8lyKO
	dmxuLHCuqNzb897y2eviwk8UEvyHrRniQjK6r3c+hKdDnjkw==
X-Received: by 2002:a05:6102:d90:b0:604:f29d:84be with SMTP id ada2fe7eead31-62808d611a0mr987282137.3.1777375920165;
        Tue, 28 Apr 2026 04:32:00 -0700 (PDT)
X-Received: by 2002:a05:6102:d90:b0:604:f29d:84be with SMTP id ada2fe7eead31-62808d611a0mr987259137.3.1777375919640;
        Tue, 28 Apr 2026 04:31:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f591370sm6515701fa.39.2026.04.28.04.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:31:58 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:31:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 06/11] drm/bridge: lontium-lt9611uxc: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <55zrfwf7cy5p5qyyw4wpevbb6k5fgmyj3o7sg5ztc6iklvaa6n@6al7kqhpdvso>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-6-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-6-4300744a1c47@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfXzeUV6wo39ToO
 E0iTIRu4bjrBQOF6Y47yknSTTfxEtbJw/+E2KzSxuw6SY84XtZT1s9ezYih1EGn7fnfqsLLTXX3
 +TrAwEwEIgAMwrqv3gtaayENvqZW6Vfd5PQj4K+dlaUaisG7khzL5MRTDbFIDSQu2R8WL4Ik41N
 BbmqSjpXCsZiFcIusx6VnyX8vwQL7PJ31z3mtdyrFSOYWKP/3ttAwnBOgzW0cKRHbsdoczx0oAb
 ifZQRpgXsHcbo1IiUM3gzWuz66ApCh7jAL3DCVzRCJVB+VTfFvD1CGGR/LU1fp+LO24pPaf1pvv
 7gias4e1gq0ERIyIIF/w/2M+2KVafq7MmAh6dl2cYyh+iQwkZUDArAusmERUcbXLODgqmHH/9ov
 I71P9f+fZrlDEb/iKNha/at7QQqgur+Br8mtiilmo+dk5GcGH3UgGeLxGkTD9hS1HRCSpQvmK6j
 1nE/aO+sAoMiKhhhzDA==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f09ab0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=8NnIfHsthi2a-_wE1lAA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: KuWj7NnOLIGsc8V1yoJTQm_rkCuRTk6Y
X-Proofpoint-ORIG-GUID: KuWj7NnOLIGsc8V1yoJTQm_rkCuRTk6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_043202_491027_74EDBD96 
X-CRM114-Status: GOOD (  18.08  )
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

On Tue, Apr 28, 2026 at 11:15:52AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

