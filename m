Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB52CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5sl3ZNZwJRriIGWPQB/a/CtxB1WoaSGeN5QScEiQ7Q=; b=jFugxhx1e1gviMhx2++et8lAVV
	EGYu6uHrMxmBK+JWYBDMxoNYPDBeDSQyb4p9hstJ4EEwkX48iGyo4KVA+rkXuCjXpMZUUjbMpbEmT
	4dxBjmuSXoXVN0GkNesdoHq9weM7N6Y5Gp45sQXE56OTsmgpz2xQN//xKQ8p0xC9LtPSSXS88Oh6H
	WJ8fKw6qFvgI1jbz0Rxlj2VWQjUjlQS/SlMP0tN9O3Toay4RUwodmIWq32she8AaIX903q91sCr7I
	uXVN3UAYrTHuzxUE47Mw2ihOQZHmvc+RXCisLHZLQ0hFdh+r7ueQJcHHNQKAo4iv/Z4LgT+eOG6sR
	JvuRwMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gyl-00000006BNt-2TbW;
	Tue, 30 Sep 2025 20:29:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gyi-00000006BMh-3WEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:29:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBQh46015470
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R5sl3ZNZwJRriIGWPQB/a/Ct
	xB1WoaSGeN5QScEiQ7Q=; b=o5LOIFdVBZ//v/2E1TnvIcqUjzye/Ka5ijY8xeC0
	d9YkC/9/1wv4SoPLu4fEQ0ZW1lZln041JrDY8SwcqEguun2K84mIpjGkPm7JkD7v
	zjCVofucFtUpNFoX33CWX21J4ED2mYM8MHunzDINF63/Rbi8Sz1Z/letyLi34kQL
	t6dSAeW3005RM/Q9mur/Fg4XuhGi6fa1fTXYw4ygq/8axfnxp+9bTI6CnKXIOnQx
	Wnk8uIyreZgUPFfe9wgn4hsqEbVhMbJSqUBcHtLj4/8EdPE12sPGoqHGfRFtqKR4
	EDhz5ZYVUf46AOpEPYCN7YccyVCzqeVUb6SP7Ni0pR4QbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr2bvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:29:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e0e7caf22eso78598611cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264179; x=1759868979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5sl3ZNZwJRriIGWPQB/a/CtxB1WoaSGeN5QScEiQ7Q=;
        b=uKRIyfCN73hje2jX/Iac4rnexF0hUMJF+Mo7C+PtztXNaaoi7EfHWW9U1gInl/8HY9
         W+8J2QhNHTzizWSQmoFgmeu3nhEtkQXLpZ73+70MZsckd9KShyWvCAl8ezSMnGLBH9cZ
         MOt6qApRbZQiQJLxNID4t1o/ASdaf9XD6UJXpQpxUe0vZOm2xrkQzHWxZZKb/bWY9T22
         Svc1h5SHj5x8q0NJh74sC6JUn2QK0W7Pw4tMRK+xePxWFb9831W9XnKgsXzSQf1i1+Tk
         97gdagADHlMIetE8Om8b2bGYib8vS5KYvQcVvd1R+NVPT2413St4EqcO+ExMzj/OgU1j
         MOFA==
X-Forwarded-Encrypted: i=1; AJvYcCXODuDp2+3IHK6sRhAeCQWWlN1KBiR6xbUMvkvwoR+nDu/r2YhqBT6vKZmAKhwX1Ldj5h8kasZOFLL9ObhiGudm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfnb+/lO5xch0QYvZQMU2qbKU/fd/MMnqGLASt6W9Q8d0MScVT
	iZTwSZpifMLXg6pNYbhWWQPeAs/b5oeeE6Dl84MTIkKO6OiMybkyBbIO+aedkfbLdhZZiz/ZEb/
	3yJX7KZpmcHWOVXKC02H74Mdp4zNPuH2wg5lJSXm2DwkCFGC+qRBxruedDY39fMvgV3+rHUo50z
	Wb5w==
X-Gm-Gg: ASbGnctlkVCi327vQGy7WbJsF7pSwT6aOu+8cbS17s95EkfkkxWchvum0dcfMKCylg/
	AZTb+JFIhDS1jm6SG2p3gHXXPbNZvwV5aIrvxKESX7BS+09P/r0kQRZzhNAJga5/NPo+Tt1otKv
	t/h10ImSUGJiaiOtGu+OrvhryLQzF7W/lf6suifpmGRCZj+kc960sIG7dHiMeSWf5Xk8qe4y/6Z
	bZNWkBIVrfn8knjPy/Mf4dodHP73XCWCB0rSx5tYnwY2kg4lp6IHod0HFutrmrsAwudMMNQ/MAy
	g4GY+GdVAlrmgHFdlHiQKLI4xZdxqvoS+4G3oGjpoM5yaNJlQZZE8Pklv5mVlI+Nkamthb6MtDn
	EuYiJP6kU0wUn2eY95ROLIjeidmjTdfsxcWDFRFbRVQSsyXhncaDosSetIQ==
X-Received: by 2002:a05:622a:58c3:b0:4b5:ffc4:d87b with SMTP id d75a77b69052e-4e41e25672cmr12692831cf.63.1759264178855;
        Tue, 30 Sep 2025 13:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWqYNQ5DcdbJzz/fom5G6oGKnCTXV+GrXUnR7tUKQp7CbjCVYz/Y9aUaVBAEusZAM09X6HlA==
X-Received: by 2002:a05:622a:58c3:b0:4b5:ffc4:d87b with SMTP id d75a77b69052e-4e41e25672cmr12692511cf.63.1759264178263;
        Tue, 30 Sep 2025 13:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665671csm5160974e87.75.2025.09.30.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:29:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:29:35 +0300
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
Subject: Re: [PATCH v6 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Message-ID: <hvakijaevs7ucwvlnf6x6aqj5k465g2rc3ba7zexjmamy7mxg6@gnyhlf5jj3wn>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-1-damon.ding@rock-chips.com>
X-Proofpoint-GUID: tEXbZYs8i29KEulgEpD9sNyqQ140mlVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXwx5BV2pCDLf5
 gqBpPQjBRfgEcQ8I4dLFZndCQEAHLXseIrG41gwPf5I/2o9KHwPEgXKNbOVLNdoUh+lzRzXVeQh
 nuW1qhqMi+GFOOX7MaxhuDDZLocFb0G3UvdOQ/blca+HTUQOymdCnv9zNnyW6X+m7whS7sOBssQ
 WMe+byQYi4paJbk4CwSkMm6zyhmpVmkppGIjejgi5kBojR2naUTBbG+qVdsLwcuS8ps8+eEoJkp
 3d1YHvbQL6XpYI5XKiXlw+FiVCSv1sN8K5+pg1EZKUx6Vy7afkEKgO0RKNAwyyBmVdelBbm4rA5
 y2Rfd7G9a4SDqoOEOUauI+/R9KYGBx1SXNuv8tZEja1zrWQO3kSfmWqiSshhUUGIDhjMMLgXV+w
 rz1v/IRZYjn554hWnpX9x8KXj+ZHaQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc3db4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=6YOL-LhRVAKcL1tHTEcA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tEXbZYs8i29KEulgEpD9sNyqQ140mlVB
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
X-CRM114-CacheID: sfid-20250930_132940_887263_9C85B861 
X-CRM114-Status: GOOD (  15.39  )
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

On Tue, Sep 30, 2025 at 05:09:02PM +0800, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3 is to add a new parameter to store the point of next bridge.
> PATCH 4 is to make legacy bridge driver more universal.
> PATCH 5-10 are preparations for apply drm_bridge_connector helper.
> PATCH 11 is to ensure last bridge determines OP_EDID/OP_MODES capabilities.
> PATCH 12 is to apply the drm_bridge_connector helper.
> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
> PATCH 16 is to attach the next bridge on Analogix side uniformly.
> PATCH 17-18 are to apply the panel_bridge helper.

Note, only patches 1-13 made it to the list:

https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/#related


-- 
With best wishes
Dmitry

