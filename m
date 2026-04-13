Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2EAF531C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BedpZMXwITef0qZfNsBgP2xL4vUIvRtvUBOZ7w9v5dY=; b=sLIMp+/NcFvmfpHKd2Xm84qsrs
	WDKwTYcALDVwnOl17VrtAvmIT6OffhdvagFMHFRKqBb4pnPX+4cdLZZMCRTdPVDbfgvQq44LlBX8K
	zjnrZEBhpAjOjQvnVjtSNvhixKWN6Iiqe8MIcBWfvzQdd7RZVkpGBxGfqo1DM9uFocc+3WQQA1rFh
	rDqHhvPYKFDSJjCHEakZM/u1cme9OCIoXKieLUiUxgMfzZTxLaUtd1ZdHhEPwlRUAxMn6Fu2MKj5h
	wgbXxjBwcBSt+vTbyNUQEFoL2TlFw4rx0HquDzhCghDBEOwJMx5hgzuvWAsmLvrRwi3bAvPWT/Mik
	Dng/qavA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLm2-0000000GAoF-1EXq;
	Mon, 13 Apr 2026 18:12:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLm0-0000000GAnt-1tmW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:12:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DG4mab2459359
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BedpZMXwITef0qZfNsBgP2xL
	4vUIvRtvUBOZ7w9v5dY=; b=Va4+DI7euOKah4rylJBA1blv7r7Nghgd2cfthrea
	nG2Pdd2quhvGidQKWbbgMcHefCljwVxtPhRksF2D4p5acalYsRuM72kHEkcQIQrA
	SzDDQvva4J0BdqhAjR9s2O9q34BGEGzsCBNg1p9CqPgoNH9wbBXROz6pxoEMLbug
	+3YXLjFAhUZ3lzlE+u5qTiASywuWb584EvNS8pVi5rRSGeh8amlF5r4El/N2+gWa
	RemAspNddcCBb6kLR+pKlpkVmHgeo/f57U9E39UAAZbliNBRMGGqIx9FJzg/8QJJ
	eAvbzdcK1B7XWhUb3tGKg5OIZGmW4o1w0rbfjT09kaqo5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh3pq0er1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 18:12:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso126409451cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103955; x=1776708755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BedpZMXwITef0qZfNsBgP2xL4vUIvRtvUBOZ7w9v5dY=;
        b=D2c6Dxjno2IOEA7LeLFLmXM/CoxgXBB9Y8EK5d3ZuLXearmumVz8m7QJdWM4/+njhM
         9WYTjf8S9c7eyiO6TywnoL7rw1BrOofxWLdU9otig8WLu/wXAZbcwitIlCFN+PtUEqg7
         J/J5wbeoFZb05yogyRi38rHwsNRMewAswczy5hbEZbtcBhnnp0MbBAGPDWdMcZoUy5CH
         Z5m3rGkXghtl4B2+9PdBLZ0ETgLHb+YA52DScGawnGN6ySSRWnN4M2uirFHzFDPgJPOF
         GuzyqpC8mVzin/ZClQpPSaFZn9bIxBlV1Ga0WVOMCaMx3vsOgKig3/DpcPiZRK6cmzcy
         KLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103955; x=1776708755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BedpZMXwITef0qZfNsBgP2xL4vUIvRtvUBOZ7w9v5dY=;
        b=QN9Icops0UDlq0xWxhHpT31xz8B1vF5X57NeLeA1EXrextirLEm4uAgFVHQ5Ahd70F
         x5X3xMOjQcCl6io3cr21DJCVaTKpxftzA1qd64z7aXl8UInZ4dmHS4dVBEfN3JJiJ8yk
         s/OxwrSBZobw00IYlwzyui/f4hWKmDLKGvZjKM+eyl2lUVCWgBPdQ3duNBy02+whJZtT
         l7StmgqRhlj+DqiWommuxp6D01IZwAfLa1/9Sojl1pzfViKBCRcV4btrCvjAJW+bpsn+
         /EmAXSfnXjBx6FeTf+p/xS+4p8yq8zhmXcJvWLGfWq8SOMma3ELo74VImXe8ASvEENDP
         Fakg==
X-Forwarded-Encrypted: i=1; AFNElJ/wxs4vqMItVj8WdzEByCBY+VzR+vaN/WaH/HNk9wyvopvfXa+wFUeqsfmqGr7l6+MvCyLf+EfypbkFoRI4gIQq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Rn9hegfheb8+8aNIxCMAiuz4oq6cuWFi73gUc9YL2jvc5+BT
	8NRT9w0/temL+oAEqSNpd83RjorDF2tFAjB8EHgB1LIFx2yDU7wgumKffuEkfAd5jwml5vRR3PN
	uJwSpxcE5YGtcK70XvMi768gGsAH092KmRU8tc8SLVsNr1/7hcWU8liWdjHsnnhEJ7xNuc0iAG9
	+Neg==
X-Gm-Gg: AeBDieu9pGGXo9pJBrN8OuPowTEjsNeYILPaNtaeyg6X0591vKcrGdEoGswH3KKaItG
	HKJYZ9sc0WGkO1LBI3BwK8Xp9t7EjANMJe+eXoMik3Xdr0CA/NuQdvpAZpiMV98ra6ebBE/b59O
	Tz9Jvry3FZzPeX+2XV12YuVJ2fenRAvQ4jVxe2ICJ6UbAaNR/1rnLE6zOH8LB+8a+HWhvogNs+u
	seTJIcNlyJsdJ0aA/rUCxsP3lRF1fkAhUiCeOKikzz8vP9bQQfXJ+LpjLUiDidL2c9BqxMe1ykl
	EUOXuXvMn0ZPGcDg0YLGdjMrx7zmitbz2iTCKGN8Aq8CVAlYAvsGG0fcIp8oLtA6TK1+oWF9D5q
	rNSMv2stsZX7u3XCTMyNUlxKfyVL1Of91FknkztL+4exzB/1SdKz4MdyWfj/1JVnSgWYnFN94k2
	8g63jSoLEJ2wTi5RPOWeSBJR/koxXTUj9bfiMKHUZLNA9Rtg==
X-Received: by 2002:ac8:5a42:0:b0:50d:7384:a660 with SMTP id d75a77b69052e-50dd5a97333mr233249341cf.6.1776103954554;
        Mon, 13 Apr 2026 11:12:34 -0700 (PDT)
X-Received: by 2002:ac8:5a42:0:b0:50d:7384:a660 with SMTP id d75a77b69052e-50dd5a97333mr233248641cf.6.1776103953905;
        Mon, 13 Apr 2026 11:12:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541ddfsm28584361fa.27.2026.04.13.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:12:32 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:12:31 +0300
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
Subject: Re: [PATCH 05/10] drm/bridge: lontium-lt9611uxc: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <3wkifgya3irb6d7xwpjgd5pf5win7py6xqdrkgr2tzsgy22c6x@ajp7napy4f7o>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-5-acd01cd79a1f@bootlin.com>
 <rivgablnl6s7u54gyv77vr5pitlvvgzby7qnu4ryc4tttaqa7t@hztujmxw5njt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rivgablnl6s7u54gyv77vr5pitlvvgzby7qnu4ryc4tttaqa7t@hztujmxw5njt>
X-Proofpoint-GUID: RHOgKq5RP9fC5snZLPNSSFcReV5--SVW
X-Proofpoint-ORIG-GUID: RHOgKq5RP9fC5snZLPNSSFcReV5--SVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3OSBTYWx0ZWRfXxvHmvpKntygw
 hOQX7k2RMCxEdwzEZDXpnBfgSnZsqaDTxJ7cWRFMpH+BZqN9TFomo2bHyMKv6yVlnE1uZE0vChv
 M+f2gKYkV7DvSTAUYuzDjMnBlfjdmg123Ceb5k4g1rPyb8icIJq1gB/pAJ7zWfK8G/xGhsez9bi
 Vo6cVGcgamG2fGj4jwfpwweFT+5DxzzgKNdKPSWy63kte7T8GdahOnqoVzqc7MDJn6ZL10BASol
 IMcjCGuq8qiQerdmYi9X9WB62qsQYt8pF1MJ26glE+YaGDtHh7t0ga+NFiA1Y/BTSebuuBbsWfG
 cbFUjPK1dXRxpInkZNyu5zwqS5HaNJnMbo4YF8AVZIgtxMHw1A6S6gRPtlZHDrjRRfBUk6Rdtll
 rRIFzKbd9ALcOWly5DqyAViIKUQePP+745DiozBN2ysY5jCY8tqiK6Vpme3LuVt3InHGd1C3vnf
 ThJUv+97zT2r9BsBbRw==
X-Authority-Analysis: v=2.4 cv=Vv0Txe2n c=1 sm=1 tr=0 ts=69dd3213 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ypQp8mP0imzWzDNcvG8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111236_605834_2DD75C18 
X-CRM114-Status: GOOD (  19.29  )
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

On Mon, Apr 13, 2026 at 09:01:34PM +0300, Dmitry Baryshkov wrote:
> On Mon, Apr 13, 2026 at 03:58:37PM +0200, Luca Ceresoli wrote:
> > This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> > @panel parameter, thus using a reduced feature set of that function.
> > Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> > 
> > Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> > returned bridge, ensure it is put on removal. To achieve this, instead of
> > adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> > pointer which is automatically put when the bridge is eventually freed.
> 
> What if the driver's _probe fails between increasing this refcount and
> actually registering the bridge? There are enough possible cases. I
> think this also applies to other patches in the series (BTW, including
> the msm/hdmi, which I ack'ed).

And after reading the code, I missed that it's handled as a part of
bridge_alloc / __drm_bridge_free(). Please ignore the comment.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

