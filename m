Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A299BC44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/KGU8fNwt5eqUcntt5ioXwyLtN7rhmlKxUZdtI6FmY=; b=GfGZ3ZjkTkajy85VIbWmk6JLJQ
	Rr6S2LMt0Rt4Va/+24JWIKsP+wvEZzfHHE6zhyFYHsJx6fVD57aoJc6qQdGIMocQaTvsZ59MfYYSN
	JR9POuVGYb4Yo2vj2qPLiHiuxaOBKd/X0pNqJ7fkWIjzc02UzJiWj9f07N4ZCTOQnew1F30KJjOBS
	Q71wUFAaPP7WJiA2opDb7bzP+Yvuq3kFXqOMghFkRfb2QcXhbEf77e+3Bpl5nv+hinRNL/FWDujEW
	x0uHqSMHIYlkmGacd2r3mGoetjSEELbeG46cPv2A2QlYlT2pJ3MHEgf4vpmcauTlGFKXV0iiyBnTv
	hDhiSOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRWZ-0000000B5iW-3HQl;
	Wed, 22 Jul 2026 07:37:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRWW-0000000B5h0-02aG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:37:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53w4A3663225
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G/KGU8fNwt5eqUcntt5ioXwy
	LtN7rhmlKxUZdtI6FmY=; b=IWwNTUUF1zOkH8ZIN1PZ+hrxfZLo9aSUIxaRmtpG
	7a9V1zq4cTM1dFpL9WAkGEolqGTmwbegUfGGfZM3zwe6sa9Jc1Slf+Nat2RgyxFT
	q18NNq4nYB1socfTFwz/DR8IySyIdeXYdGhMBtR76a1LO1WkugdIrP8HmPiyrAHB
	WWQU1QwBAL1PotDQgTwpApu7+xXuqN58EnOBSU80bhBhUD7lD0EDN7/LFBIpcZzt
	uhB/GWFqeosK2TKHto26FXHBn2HfDy3q/+oY2sA8HfCCuMNvsD4vRjptNLBneRZh
	9mTq3bwB/xzleQonNho4iJXQigcho9LJz3BDLocmjEroLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2u26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:37:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso105826101cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784705866; x=1785310666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G/KGU8fNwt5eqUcntt5ioXwyLtN7rhmlKxUZdtI6FmY=;
        b=eAeruy6Aq13bGDbbY0bleEfm43naFXC5qKE9zebT/Jdk44vhpVrkN6Bpt5+9pUnXxY
         ZvyQd6bG7ghCSC1IiwW85FD43eTj5b3MxgmhcuTKUP10rJPr2kXm18MeWi3VMeqDoxUs
         hS9D10m8OWmDsy9Tz6S/KhzL5IJXPvd+o1m4vfpU+kBfiU+YO5eY+spB77raHW9TTSVF
         4ZxF9NlibVzeM1q/BP4CymdoxccSfNV94uuxyomzmbK2CjclVI36OXMVA7W3aAx7RUNU
         B37JTAeyR1VOY8fGMrIz8OfcP9fLrZWX/VQTdkwFMX4D82JK+1fE0XoJ6HQ9o9KD1t0u
         QDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784705866; x=1785310666;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/KGU8fNwt5eqUcntt5ioXwyLtN7rhmlKxUZdtI6FmY=;
        b=ea5np/kRCo8gfyloNzc5KCpD5aoL/2dnxhgOPd5bOaI0m1Zt20lqQaNOYbxw9x3OY2
         WxLZ7J/DTn9i4hZ484PLM15UggXvzfAumBXwDf6L+JMde1CJ9q60GEdkh01oJAczSaDw
         G0/bh0c4vatFuXfNQyjRsbClDGUgtEr49eczrF4ymHXSthHmUgNTIyHtWD7RYBVrlEwS
         bCGlxa0mQag27Brml/ArHyssPtjqn4to2kFF8Ld01wi3wUdnqz8GLx38qp58IiBEXIXb
         9kl3cCOuWAEdmy/H+XkEPlR7QskuHE4Z0rzSkdM3RsBGtf7MSa+KY/SVq/n+fQBaByM4
         dpvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlXyb6XfXmrf0judQp3NA8O2nSM/h8JZ5oWnn45r+RMp0+tz9hcn70F4CmtxnWi69Rt2yr/mXBvNXFCAkCWlhZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzapm3QzzYAq0TH4M552OhaPgMwbC9qFWp0GGuu2ZugSlf417rg
	TckBHMyvgWKxQ624CURolhRi3VEJJ5aBhp5bIx0Z/YM0AHHd1mtGbZ9yPmjk5MrCEaFUFXC5oz4
	5LSMpdGI4JkLCXbenJX2arJWa0tv/1zedXBMvw8qPWw+yFVkJJk9cQd5FHZBz9JkHqYJVnZ9wid
	/8nQ==
X-Gm-Gg: AR+sD10AaoaguHnUiaao0P1ieuj5ws/aKtHQu6liadN+tm6RFtgQe7yGVhtK6WPQato
	AERuHhnEXICuKHuQ5WoA58uFEpz6WMbKz8RE3RodRg2UAFhFMxgvVuzGGaQpJuQ+f+/yy/pU75d
	xvv+H1fkxhEiXDin4UO15QB1+qL9W+Bml8Y1DiM0rzm1dz1FVP1qSCedHZh2w4C1WUCcIwl6PKl
	k7d6k0WdYDvt7Qn9d4wby/7FZAkzdy17069iQlcW1bvwelsx+FHstl/UcvSb00iJRA/M0LAxAYt
	p/waL1WZwLLbHtjCttKuvvkLUjBlks0lvGDHedQyFpeTBTJTb3JRZ7rJ9i2I3WBncX+rMQdq1ev
	StyssYtOt/4p6fhMapYGX8L9RzrEu7nNEutolJeiXi7Iw9Sz29kS6+osE/6evEpTchp8qUSXry9
	TkQTNzYRPO7OjglA==
X-Received: by 2002:a05:622a:1a9f:b0:51c:a70:5ed with SMTP id d75a77b69052e-5213ad60752mr206410711cf.30.1784705866400;
        Wed, 22 Jul 2026 00:37:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9f:b0:51c:a70:5ed with SMTP id d75a77b69052e-5213ad60752mr206410531cf.30.1784705865990;
        Wed, 22 Jul 2026 00:37:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8bd17sm2985771fa.38.2026.07.22.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:37:45 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:37:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 06/30] drm/display: hdmi_state_helper: Plumb HDMI 2.0
 source scrambling capability
Message-ID: <xcnre3jnz2xshjvf76tzms72sk5w7koa4lz7rcqizmcysu3dtu@u2rptephae7s>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-6-445eb54ee1ed@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-6-445eb54ee1ed@collabora.com>
X-Proofpoint-GUID: TPDPIxusSqqIsVamLDEhrvlTRXOWzO6n
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a60734b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=oequfIBpm4CPOrf6xoIA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: TPDPIxusSqqIsVamLDEhrvlTRXOWzO6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3MCBTYWx0ZWRfXzaB5I5L+xKGU
 rwD3BTMiL+91Z831svXHmfbyKxrdRzW8LaxojYDjFeLgj885myE6pblA8Blnu6832zIkm5ZRNQs
 k2RHtCiAnMs56EPZl3jrRBcNcn8VkjS4G3tssJ/2UwQdY1RR50TJuuKPZrzGHOvykgKm751674c
 ef21axLKgf8ljjdjwfNOhh2E5ouXXfZVkFQErzWnazwjLkDVtDS26Hb8ML8XgOeM13Ju7Yn46dB
 6ZzPvwCEU1e8QMfDdD3dLw14M6wPH2pVUvr6axJN7r0NSMqfhRZ1zsVcR95MRyAFwSB7s7/sYp2
 odr0PxiCFZ2t4yuQ4tdMnkbsYn9VZLoF6Eg8OjPMBJYrT2CRejwYC5/rMcIk3LfXlDHQ/414c7I
 Nzti7pf/STBUy7VALtjAqO9FQ+SDyDJDd+7duIcQSz9FayP7e8wgguUYTVv40ppKezMzMZD4Hs2
 HPMNnVly0BlCtJrkpzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3MCBTYWx0ZWRfXxVoSQo6IFUwf
 EK7fa//MRIBvhUi67hnjPNcLskIAAfaMX2tI8pVgUjIwA/AvM2VZVSvZiMxJDlv8dywbu+FmlLP
 FCEGfrWfkLE83w4jUW2PsIvDyYMBy6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_003748_130112_C2844572 
X-CRM114-Status: GOOD (  17.36  )
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

On Tue, Jun 02, 2026 at 01:44:06AM +0300, Cristian Ciocaltea wrote:
> Toggle drm_connector_hdmi_state.scrambler_needed flag when the TMDS
> character rate exceeds 340 MHz and both the source and the sink advertise
> SCDC scrambling capability.  Drivers no longer need to open-code this
> check.
> 
> According to HDMI 2.0 spec, scrambling is only mandatory above 340 MHz;
> the optional sub-340 MHz scrambling path is intentionally not requested.
> 
> Once all drivers are converted to advertise the scrambler support, the
> unsupported HDMI 2.0 modes could be simply rejected.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

