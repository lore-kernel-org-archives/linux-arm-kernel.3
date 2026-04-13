Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199B7F531C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKO27PWzOXPgZeFys90Xta2AcRn+O+syI4x+EowrjHE=; b=ZhQPfwa0UMwih8+DUmm6lcbc3u
	miUJXRv//SW+tvIdZB5Xmln6q/v60lUOmT9f88i3kzKaJKjnofV8VM/6opVYjUpL+8h9592du6+4X
	ys6sYJ5GymyifZHUZd6U5H0AhNmf7uN9JpqenyLkYkGUT0FYVJX2JNxA9C6vBvl/km249Cbbm+q66
	SPO0sKra4KZv1YPalRCIgoBxSuW62kZ/fmwjVP5k7PInM2LbGuygbHaJoJfWWc+LEXRO8ztXMaHoL
	39wa8TGmhXA7d/0XKYf77+Q/Ad1DZtu3COCx91Y1S5XvTj3tbhP4Ut2eC7hvlB29Hi9jygwlaNqgZ
	sVIhlUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLr1-0000000GBID-0Edd;
	Mon, 13 Apr 2026 18:17:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLqy-0000000GBHp-1a7j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:17:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC7cUa2186212
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CKO27PWzOXPgZeFys90Xta2A
	cRn+O+syI4x+EowrjHE=; b=JTEXXUJA6IL0hyec6XzDL2EEL8O26sMo5Pa8/mAL
	RvJdS/YjDSS8+rCzn9T8yvmIZj7LRVNWdyveGZJSW4hZQZfsa9uWcysN9Mfpl80O
	eu4jUxSDx6VZSUVyGG2ateyEqk7DNLP9gO6v30J5BChvWXobgP/Q64gR4sLZl4V2
	jxmmLdZeGzfBTeTWPTngqe34KKa5ta46EKAn7jvLmZmnk2lW8ByAklizA4Q6l4Qd
	RWBe2xubr7RBh9zPldXzoGVlAsTw3YzvxfOeauKyayStBO5LFMgpfHU5KGi7T3na
	iWkSxRy2Df9TD8uwkIo4lXuNPOswwGWBHQ4rdPW57RXv9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hhbc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:17:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so70010871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776104262; x=1776709062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CKO27PWzOXPgZeFys90Xta2AcRn+O+syI4x+EowrjHE=;
        b=dvkLQRxY3zuLiaVC3jh4QtVmti1UWuhXHXNJ7JfIUFNG8kmHiohvHUJkFZrwNKam4x
         lIOHDQCYP2zQEhoqmSRN0Xbp2S6KkQjcpBJ9eMrP1zrPsCvhLjGlrPUF9RLCKvDXBZIS
         J1XAU6C9BVDDMxzR8TY0i3SlD8drTHqVxR1nrB8DgSq1lA1fu9XxxIVNxXn/A225RR+q
         Q322/8Oo397Vb7m4LHcnhyeNlvN7JCu8jh1F6Q17X/oRjnovrrNN7kVw29X0EUkql1Yn
         1/9q3uWPO09CcIscFgKIFyr1AVPid1bxDoPD23qmYVHmObmRrDPFIn/dWIg/sR/jEGoj
         FTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104262; x=1776709062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKO27PWzOXPgZeFys90Xta2AcRn+O+syI4x+EowrjHE=;
        b=HEXF2rTMCCYp9gZoWkvGan+kY8B2lzKR5vC/EOyZYP2ygAnS2jtj/5bXeG3XeSY9M2
         jeOydWddZS5Y7KHRXexL/Tb601xC94MTGHTnmJRf7HZwgpJc78vyy7AlRWptuBeMQIqP
         OSqY9gOGgYlrRkd7+61wl7t2FDKw9h5KZxvMRfCKGGYJHd+DYkpyCjtlI1el6frgV3EJ
         1XpMldqCcZh67w/LsUdJ3CFRiTVofmFjYn5GfxMT+kTgK8c5WmNP0THg40RhMO4BNcVr
         pdpi7S8DMlGhNbcZZGXXppesUnsndaanJ4o1L74FEHHaUVTCpAiaLGF8DpJjz1Ed4YMO
         6n8g==
X-Forwarded-Encrypted: i=1; AFNElJ+zlvuABkRLQwoO/27OYVEqbDSkEhZiGKi1rrDYwm+33UPGoRheiagbXUOyp45W5yF5HanAdYcZWBF74ZDRtKl8@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ3Eiu/6T5gesroZa52X41YFQFN8s5hP0srDrD7QcS9bVshThb
	Fc0eSPwJvgLyelwaViAC8d71kSEMeaKynCmT4f/4YcYycqgHdyBQVRF1OHbQTP40EeeOatI0lIu
	jn9u0Vk6YnglP42t5psYo/R3rCqF+3IFqpS4i0mTBoHCsJjqb/Xpd4NlFsLzSDxxLHTZB8JCkTo
	WtCQ==
X-Gm-Gg: AeBDies0V1dK7gdbypydOMaYxIK2+kd7tq14Gas/dLO1dL8H9mZiLDAOmAHVvpbr++t
	V/fyoVF+Q/VtydDquNGGt2quyxP63iQmPFhvkDebAqLROyK8Rf+x9IOH4CcpqYFQC2/fDn9LDVP
	cT/zL/woOSNubpcxHa/cgYsQbnaWwGRcigW62mP9g4qUQsTvXD46Ll+Vzkb64hTdobatoj7kqct
	oMvdecisgkIPFwu9HGI2nqAhgKLxdNyPPvSurGHMhBeb/xEg4/TlPiyJd8QooPQsa15YlTHMoCd
	R2BX+YjiNQz3SsqV/NtwSg6EKcCBsYLwo1orvjnaW8/1juKFXL/zmjFgN5FEDzJiSZQPdg/eHyp
	4F0WP3eCKKqGfyMKy75pqV35R5eHpjdUpaK3hseF4W1O/QntBptvel2Dluuvv374a6Ba8kIkM6e
	p1fj/IFhN5wUDj89R9TeSf/8sBcDkSrnMhvt54bEqRdPBcBg==
X-Received: by 2002:a05:622a:d1b:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50dd5c1383amr209571831cf.46.1776104262224;
        Mon, 13 Apr 2026 11:17:42 -0700 (PDT)
X-Received: by 2002:a05:622a:d1b:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50dd5c1383amr209571031cf.46.1776104261646;
        Mon, 13 Apr 2026 11:17:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86778sm2672353e87.16.2026.04.13.11.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:17:40 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:17:38 +0300
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
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
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
Subject: Re: [PATCH 07/10] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <kcvbx7glrazf6mr7bcb2agj6pdqxdqnrcsujg3y4x5drmhqlbd@pfdb6zcnlwju>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-7-acd01cd79a1f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-7-acd01cd79a1f@bootlin.com>
X-Proofpoint-ORIG-GUID: h66IC6MS1KBWUeHGslPeBmml-kdlOYog
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MCBTYWx0ZWRfX/d9brT7QMbnZ
 4LwNyxc78ZD+obYUe8dfvVjglOptZ0luY5Jep7++cP77t8kkRa7x8fQcAcsiMUb2tJdeITVGKcs
 F7pL8kQFKBgJLgs9iJAhTWC4PQUSC2NKokSd2MA16qLga9LlR+i2bkk8jSg9AYCMUmFvuKC3Zi7
 jJyqJTT+k28Pwxc6Ip6F36U3O7Q/7hUcuk210ce9HQ1MCxuTVYqj17yPbu47IKwqFRk6r7WZDpt
 n/g8IMv8fWFYckij21LT62m2r52fUIgSUAPJUvheiCmNs3pwGCjnMWGcV5VPO3ZJ7zR8uStEaj9
 zWQmQTtGY5wI+2J2oFlpPfbpcL/hXwr8qDVXNo0iEWuTHAAziHP0v7JfWlrle6C9GE+5u2q6tkE
 Mud9hYFWrzjQ7z9vxkIpU6wxckkwyAy3OFZ5sPeoWnuZPp+qgzy7t1NY8F+JGS/BrasafkW4H21
 6lipuXbNINhmbyorYFg==
X-Proofpoint-GUID: h66IC6MS1KBWUeHGslPeBmml-kdlOYog
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dd3347 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=sqxsbOWVCbAVHG9YZwUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111744_428200_0755810B 
X-CRM114-Status: GOOD (  18.03  )
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

On Mon, Apr 13, 2026 at 03:58:39PM +0200, Luca Ceresoli wrote:
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
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 -
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 8 ++++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

