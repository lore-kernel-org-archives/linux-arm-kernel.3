Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACDAF531C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG6p1MFp+26v87RPXmsW7BAV+LfDZF1OPvLL93JOuM0=; b=KsdS8Knsf54UXcZOf0Yku63DzO
	FE0EkDMaCVmvtfZrIAKiiE/4PAV7tXaj6/USPDDyXZ4bqnz8Zzj0saGGEQjm1BY2ZhHpfeUFurT4z
	op4WqdwlXyoMQqMnYobL1Z+HN8mgTyu3yC2vYajnXUs5bJQ4M7p2EqmCQ00y2R+1AG8lIwu3s070D
	YJAqUUgl1+CCp/duKr5vHHl67cpaoOmggtfBJ8zS+ElscLqSjHN3kzOiQ7Yrj3/+WpCRS07KhqPnL
	nqOOtc5vMdZPBt04rdlXdctVSjcd+HBaBiFvwKjqpOrJYykGvbFV+BAvsnih47fDd8Go1lqqAwtps
	lSxGgj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLdp-0000000GAKd-2507;
	Mon, 13 Apr 2026 18:04:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLdn-0000000GAK9-2BT6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:04:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEJK1t3539284
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uG6p1MFp+26v87RPXmsW7BAV
	+LfDZF1OPvLL93JOuM0=; b=olBy1O2OMOlg59z38ME2FspkMia97BPsNpQAcUFA
	IVsJNTWZGxEWFER43A/2wB8v/RLuaowc9ryQia13ZkzfaKtA7SIWJBBFPiKQnssQ
	fhiZosocLqiMn/iQ96JenS3iwW7e7L4mS17msFVvwue8U0NeYaaxysy17K7tzktx
	EqgOZ4qzq98P/okV1scwWMVq7FMjS/w9003qg4uR9mJMDFW/Sp4jBSvd4f9qo4T9
	l8kInOABbVzccqcotJ20RLO8X+yHYRA51pQBNSwZ2dS6OERlC8kahwcWYWSz6HG4
	nhnfJ3mpMh/XOzXkgS1AMBrIRgVwALfs1bWlugv5dFmpcQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh258rsu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:04:06 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46ee4a74741so3562872b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103446; x=1776708246; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uG6p1MFp+26v87RPXmsW7BAV+LfDZF1OPvLL93JOuM0=;
        b=hDIxog6gKLg1MVwTR8vjVFr4vkgK/xVZHEepkaOhBMFP95zheOuO3FAMwZN6LF0G/G
         pGABvbt/x9c80ac3FwEuBSha6+liUfL4fM0tkER1hskjiXmMOv3qfJ15xskyKZ7cIYXA
         zQNK0PSNLgJV51pMaccs6o5hvfNHKEfBFyZhaqLCCWLmV68QpZYoWAAmLQXy6M76USdj
         ox+C7QzYwl7Riy7x/Qotxc9G8E/4lyueh7lxcNuaCal3AJduzz9sOt8qBtFqdrCqFeIj
         E3lFP+Jh8NEsHogu9tq+IFhD4MiaVjGTB8KLu5wGh6xEaxr1KqQoa94MiJyS5PmgQIL2
         JoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103446; x=1776708246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uG6p1MFp+26v87RPXmsW7BAV+LfDZF1OPvLL93JOuM0=;
        b=i+D9kkQakK0N3qNTOE3r6g6tjh4CdSTqEa6lnLB+wpeiko/OUr4W9wE4GB3DOt98XD
         mgZf60vLGoJ3/5sO/WyiOGoIst4Vk/JuM+ILmEgli65OleQTPCjQ82iC8jJDl4c6qjzF
         05d6RWHHswaZ0dS9u3t0Q5SYIVSxOgZ/irPfPc7DkJ4I/8e0hpDz6GMCyuwMjCIfNboY
         NzsYNCe1QpEWhgSZ0ky4ul8qHqGyfYtQobUVuQ/xluAHvtir0jbY9aDGdjlstPRa/hpv
         XUqDKlm52EHtTnGnaG/1w5sBMAU3WncGQwbqeIVmAqqssnHi8ggigZVZeJFLitzUnX6K
         CcpQ==
X-Forwarded-Encrypted: i=1; AFNElJ83WbBhTpXrIS5J1aSpKIgiG8I0Jmt9ITxvXGXEDIhWPJpez+y/aZuytfT3ZdiEKI5iNbbSqddSj0R1isZmge0K@lists.infradead.org
X-Gm-Message-State: AOJu0YxItJTx0vY0VPJe/HA5gSEIrQ/CJCCkFPqwUyycQ8PrI398Vosn
	ANYwDelIGmqDUvr2HD+G6zY/bCZWHX3o0TzLTeqUk1zJIXyWa4WiOvQfpVZXLWH5SHK/wSA2goA
	sbwnWZGVUB1amuzBfzChsS+kkcn2sLBBbnl24/UaNYGAcoxVE/c8gwcNfV91rGluR404p25LNl7
	C/kA==
X-Gm-Gg: AeBDiesMC7yFlfBx4L8CDRO6KMZaIHQrPiq11aSAKzR8NycrwMgHYl084nltDIox6Vj
	MQ4wQjQohsqtXoH33ynSA4DY0b3w5OGhmvOlDmhd2JCcBbRqh18hdH1JiHztouJNu3nWTuRAn+E
	3VvYd5cGLAaG9FLE9pB1TcpQ8uspsBQWdmqmSzOFmgq8lYEnAMm7Gth3R8BzvxoW/ZrJJX7Umh7
	LRrh7scu0SIASlgqu2vNsd+9tTn3/zB2ch8Rws5+FW6jzYsifRr2WFRIRtQSFrPi7arN7syh91u
	CrujFMR+48NyVysVIO2vtJRIq2+Lp54YPXRn94fKUIoZpevrsfaUKquiQuGy0SYRnF5EMxOEQdv
	+6mlyY8a/tbiwV7dvUFKG/srEdje+IOrqi73Cgjzwr1XNA+Pls4C62dpACz8WIn9sGUBj4zwvRr
	yu/lFzL0oq/EXtnCZCQSvQi2qYkLORkv/K+FOge4Lp13nJYg==
X-Received: by 2002:a05:6808:67c5:b0:467:462b:ab0 with SMTP id 5614622812f47-4789e42be12mr7589011b6e.2.1776103445636;
        Mon, 13 Apr 2026 11:04:05 -0700 (PDT)
X-Received: by 2002:a05:6808:67c5:b0:467:462b:ab0 with SMTP id 5614622812f47-4789e42be12mr7588959b6e.2.1776103445107;
        Mon, 13 Apr 2026 11:04:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee865e7sm2765700e87.10.2026.04.13.11.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:04:03 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:04:01 +0300
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
Subject: Re: [PATCH 10/10] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
Message-ID: <nligqvm3lq6n556onglmb345arxztd4pc6fboo4yrs3bfu27eu@uiyu2xklnexb>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-10-acd01cd79a1f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-10-acd01cd79a1f@bootlin.com>
X-Proofpoint-GUID: -WAt0DVoG1TfRHuU7lQ--Ap89cwcFJ7R
X-Authority-Analysis: v=2.4 cv=Vo4Txe2n c=1 sm=1 tr=0 ts=69dd3016 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=ihHiGccrl-12bfV6lMsA:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: -WAt0DVoG1TfRHuU7lQ--Ap89cwcFJ7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NyBTYWx0ZWRfX3eZhGP4OZETh
 q0VpuY6tBSjvcJYIN2IdSpKhV0FP0xE81eUc+hsvZKp824igFyK6iH2LtBc0qSFXa3K+zmpYAaj
 4icoYwcdTCzn5yuvcGJs3dKqKxQIRbANNNisFDzIma1209njJN/I53WiV9CXArEKOHiXK5LAioc
 0D0smtsjpAT+F2+4gEcIZVGUNyJrqXTmt3NbNNc0WaQRKckdyDALLmmnOSNnpmvnP8jXbyDGQmo
 lAV/n/Bs77fcdju+wqvRVC3mMHunHD5IYX8DLLM70v3CLZU6nBxjP9nOGX2vvb0nxMCBaoBK9gs
 o/c28edEn+kMtLCViJ7i3mCyLwRwzy7jbLc/ZEMEuJBEQqdZhaZ7tIwbhI6Xt64SSp+TMJVao7N
 99I8yf8AlPC/qN8TLT2HJQF+QARR+5QV/p1ciey0FfMdatxzq4RLP49+/lKfWqltumtQ0SgqRsG
 XGLAuD9n/8RoEc3N7ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_110407_701523_063C6C03 
X-CRM114-Status: GOOD (  17.35  )
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

On Mon, Apr 13, 2026 at 03:58:42PM +0200, Luca Ceresoli wrote:
> Up to now drm_of_find_panel_or_bridge() can be called with a bridge pointer
> only, a panel pointer only, or both a bridge and a panel pointers. The
> logic to handle all the three cases is somewhat complex to read however.
> 
> Now all bridge-only callers have been converted to
> of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
> refcounting. So forbid new bridge-only users by mandating a non-NULL panel
> pointer in the docs and in the sanity checks along with a warning.

Are there remaining users which still use either the bridge or the
panel? Would it be possible / better to drop the two-arg version?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_of.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 

-- 
With best wishes
Dmitry

