Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AB2C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPujkJTOGc0TWj04uUMCHTdnNQgumaeuC61sBKnEmUw=; b=jnN4IeFmpGX2MsiSgVBFLjU77J
	2uCIWoOAr477IQRrSNciUl4NpN7yYxxDygqHRQlnaeX9FiTHBvfl0F1XM4DHQBz71J0zBm/S/JG2U
	+GWTQyo0mFjxEsW+hvhufEIXBsUcT4uKG2J1vsglcuZ6//q7zs3IrTsdlGXNxwQu0jFuDIByiC+jz
	dJEsaCYQr9i6ufUgD4TjPaeWo7QYedcmDWJaoDqUjYkl3qu4bwF2j9mLqvrJhcROWeR7N6MzKfLry
	+u6pfjv28W7G6+jbG8FfTqvbfuayLmju1u4LkdpB8quUMhou1/sW2ucZZ9qMhfKxjylwBJ7oR2TMl
	1dlkqY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSVo-0000000CLPb-04mP;
	Mon, 10 Aug 2026 16:06:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSVk-0000000CLNi-0zrv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:06:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWGFO2090636
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 16:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mPujkJTOGc0TWj04uUMCHTdn
	NQgumaeuC61sBKnEmUw=; b=i1NhVVUeZGJGLT8al0W51NbX1Ojh2Qui6aK1blgY
	nf5Hemwv+rLSF9HlTgPlTtzK17bJBtvOcfZZ0YPauxCuPGO/jMG4NuAY9ZoLs/mM
	zIkZqDbeYAdlR9w6vN75ApPo9EXklL9N5vmqwz6aPd0JGo9m6rzQ/rj3q0/+3cf5
	RQU+WXKePt8GryifKZjNFwxXOlAJY+M0vEx6HUq1EFiv//d4uBmNLKbjnBwQuL98
	zE0lxPhVZNKaLiCEOoJy4ewYYTX/ebf+d9c4mCKHzeJQBhWd3mGKVDEG7omg8vck
	U1C7RLiN8fMswq5+ZS+gMtEh1NbzTIEtAitvXNjzAeaAMw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59tjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 16:05:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf90475eb9so312754e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786377958; x=1786982758; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mPujkJTOGc0TWj04uUMCHTdnNQgumaeuC61sBKnEmUw=;
        b=LZO8H7sIYduLUovgayI3uN8wmKZFVBWadcAuQ0rY5yt5nnrjoKur4mtVOGRpvZV+s9
         xbSBLPA0BQLquHW08NyWBDV0l+HyHSlc/HBvfsxYLBKr85CNQW3tUhaymNW49vjDAnVU
         TSqZPB5qQUmefKMHNrgIckKfx9EEhDlp6MStpG2+WcQODse8p9m/nPS7VAv0zhT5wuKO
         sBqAnPW148BhwaTLkBZAcSnMaVdwclPhrX4dg/7PWYWsjM+lBawTaiavL+1Xogq8mr+i
         HnwIW63WPZQc5YhW4W37YSn/BBUiYvESNAJ5bKvE1xi5GjVJ0KFg8/Syo1Pa4FyNCzj/
         vN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786377958; x=1786982758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPujkJTOGc0TWj04uUMCHTdnNQgumaeuC61sBKnEmUw=;
        b=KJf+9tGF4LAePWr51SwTo8Tasv7AYmResS0RtBdCdxTsLSk6RvCFa8/iAta1ooD1Nt
         fsXwwqmeHGmy9OrQFyHe2aWu1XXAqfb0d8Sasx1yuuUgYaEyOt/ybyqie2+ckWmTyjHf
         1IpljGx517qB0YaCIx077ihU1hP/5iE2FXqUH1S5bdUo8Dh+BUnaOzBvqUdswY88snUs
         ANdQVfq6s/r2Ml6OIEUTtRaMQsWbfMjxj8IetLf885oLdFMArFR6I2+fo64T4Q/Xr3Me
         RI5OLGXjCfZc4esAuYY8HiB9vU3mN0Jc1YYsXFVJwNL9ve03joTLxXHMoLnScgPrl57s
         1lcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqwww/JYpe6SENDdE29DZrGwT8JPDtGMghMPhu4oQf3Rin5efBMr1/CtsB0OVtSIBab7l48QteQ8B+B2IgS45pt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/sEm0kdna5SmUMXj3ZH8JwYVl66lvA8gx46BBQa/6eyn4UKKl
	4cBxULpuyYKN2taT692wY/MuIrZ6sAyi7yBF0Zsb4yNTA1rnjaRGr/oBUUnhGjPGN/VAf+tuKFU
	a5b9LZbPAj20GYLx1TyPsrZE+BrqUYiXk6nO05rQOLQqgsVrGiBJMqLgXfSFC+BVw3ksMupyYm4
	KfuQ==
X-Gm-Gg: AR+sD12IyDr4UhxabQmAXD8EjeEgspX3UwIsKwjmIhIqeUng9owOYmX7RvUGeUgpYZZ
	Axtvfd8+vHtJdU+duwAinUczGCoy8lZlYM8ivmFJUjraB46rbMk+5OQ11kBRpCP7X4GO7yBSZEm
	UZVWElnlQUDeQiWJYbRDsUL2q0EjcFNz1cxwCNk8y6iYD2JK1x5r7pD4X8rWfQ5tzs1Sb8k0Iu1
	MVISC2749Lc6zvo+LMDd++HPjTAYIvFFW3yh2pcXErjKXoqtoVSYsDFMsCJ6EN8uJ7TMe6RrkYr
	ORHb5VYdz3WdLZve+9R0iLLAE5w7F4ruO65C8/xaCZxnEuTnoTXwi40qF+dHEkiacS7pBfde+oD
	b3mIUFH6uYUH+W8T8z/f54DmQ4pdTM7kxRpS3R3JUUnVHH8ZL6ga8OemiuYK/gOatEIR04iHZNt
	YOOdDo6ycNI9nwjg==
X-Received: by 2002:a05:6102:4b07:b0:760:418c:8a9f with SMTP id ada2fe7eead31-768e8c52790mr739656137.13.1786377958191;
        Mon, 10 Aug 2026 09:05:58 -0700 (PDT)
X-Received: by 2002:a05:6102:4b07:b0:760:418c:8a9f with SMTP id ada2fe7eead31-768e8c52790mr739648137.13.1786377957798;
        Mon, 10 Aug 2026 09:05:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1c38sm2066473e87.12.2026.08.10.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:05:56 -0700 (PDT)
Date: Mon, 10 Aug 2026 19:05:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v9 1/2] drm: add <linux/pm_runtime.h> where missing
Message-ID: <gfhkrmgrdmqf2zmfdoqnmc3a7ifcwxdyoiqptg65nigdwvmwvv@4pt57y73ucrb>
References: <20260810131314.452865-1-vladimir.oltean@nxp.com>
 <20260810131314.452865-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810131314.452865-2-vladimir.oltean@nxp.com>
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79f6e7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=8AirrxEcAAAA:8
 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=pGLkceISAAAA:8 a=hD80L64hAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8
 a=xt7DZbCNmi909WKh4bIA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-ORIG-GUID: GqdlTgkiXRKv8XRAZlovhPNxWMWCkUoW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzOCBTYWx0ZWRfX0bXd14FL0CXh
 LX1r4xcRthtyCNfsLS+f5iBzryl/78Mxv8Mhpyx65AluPUo11HNWqYwgSn1k6IMhCkDVbVwNl9Z
 E4utvVF9SNPWoAEKIsHbIrdaqBJxRxM=
X-Proofpoint-GUID: GqdlTgkiXRKv8XRAZlovhPNxWMWCkUoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzOCBTYWx0ZWRfX+fme4SVT03ni
 8gkZoMtWz9HbAsR1itnE6i9qLXBWXjpWwlJt8Aeo9mhjHoH9xnA1W5WrT28Qsx9VZvQIGeacqM2
 RXFgh+A44UKoWySRIEM3EHWa6uPOcG4eikp3lnJkEplkzR873u+8WtzWIN7IibxgFEjKkQjCZSX
 JYAprx+WYBv9/o+VVffCkbxKTWbBA46Yse683YJMWUqMeGKutxNlcGXfRK9j/csPRMdmAGYMEOY
 Ux55v+NfGTGym3bIzWi8LGivWrIlUgbAe+XHMMv6DTx9DM+0gdpBLI/ben0/7+g3p0v1qReJGE/
 I4O03QXY25J7LxlcGZ4UBdYGdT249uy6xlyskp6XC+pZ9B/OW7iy0rMfFSZobMXFZbO7yWNfIqd
 Slr3/vfat+q6TaZs/WSlZ2aWXcfdxk+5x2GscNeqSQ2nIocj7t8vwSjorEIyap6g+On41EBi6R4
 niPqIKjFNJjigeTIJag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_090600_279302_1A59436D 
X-CRM114-Status: GOOD (  18.26  )
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

On Mon, Aug 10, 2026 at 04:13:13PM +0300, Vladimir Oltean wrote:
> Multiple DRM bridge drivers use runtime PM operations without
> including the proper header, instead relying on transitive inclusion
> by <linux/phy/phy.h>.
> 
> The PHY subsystem wants to get rid of headers it provides for no reason,
> so modify these drivers to include what they need directly.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> 
> v1->v9: none
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  | 1 +
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 1 +
>  drivers/gpu/drm/bridge/nwl-dsi.c                    | 1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c               | 1 +
>  drivers/gpu/drm/msm/dp/dp_aux.c                     | 1 +
>  drivers/gpu/drm/rockchip/cdn-dp-core.c              | 1 +
>  6 files changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

