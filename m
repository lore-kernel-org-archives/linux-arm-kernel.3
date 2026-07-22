Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04CDC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HIgg+cAUIBu82rEBIKTHLC0oAMQkhK8PpibsSCULDI=; b=BNsZTRTNOpqH9J1khm0I1QmU65
	YUFuCqajOkAqmLXnWuBpPTWA0Jf7j2oI5H4ppZDyAoD2KwUZHsIKj3vrueV50oLiduzcrZ24nyEaj
	PEdkN6VTGY3zztexTiq5FJa6O/JU+GlWe0TWYkhtX+J0sE36BPgiAXzUbZw6KMozatOeUJ4/tJtex
	6ICmXDMkjjdXSDnRkOu1VX6lGP9nMCs8GjDR5gP80AMM1364KoZmCSM1tmsDkp0k6kM4OmppdiSay
	Uigpxv+K/2TQWuIxX6Sa4YiyeLwtXIXTLgwqAbzhU/tIMDSYaJGxPdxygU1Q6yPN3oQHs1dPiWhnn
	+Ns1Q6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQjp-0000000Azpe-2kOu;
	Wed, 22 Jul 2026 06:47:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQjl-0000000Aznv-1SjJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:47:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M545M83663354
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4HIgg+cAUIBu82rEBIKTHLC0
	oAMQkhK8PpibsSCULDI=; b=RVv4zsQ14AR8ddWCZC62vuMvCiMr9+pZAnOfQy8T
	m8KgZQGXsw7XWXHl54mAkKhUSFPcmxLelpEIC2hO2dzUiqaPKNSqhuMb47JCnwkY
	jP/M5Yf3T6DG3QRP/i9w0/Y62bPMVGH7HTLjrUi3+coETR0OHFlaqyZc6I5HctlT
	jk49fh3VWaLszWgBEBAY8UjtDAVw7aTWkZCOsbvUXz06a6ROLdT91e6XYcY+HqDY
	JMUsL6znu/a+1LJJdT1aYt0G9gv6UizBCJa+WlREq37htnqiS2ADK43PrBmYpgSF
	LK/0armdjZMTHiIexOxDsPaMQlwdEVLTTk4r/MMcYzc5GQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2m2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:47:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-520a00c7a03so154887901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 23:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702844; x=1785307644; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4HIgg+cAUIBu82rEBIKTHLC0oAMQkhK8PpibsSCULDI=;
        b=BJ3eWFbujmrOySj7UYV7Qqmmqu8Fhs0BV+Xc9LWhZl8MVrpnOkO7YUOHwvO5nlp5cD
         /hQ3Qgc2tNJgHHcMt492ggPIp4PGuBv8zR6Y6RISfI/nitYDhx1HenUPACxtDnoHLNlh
         sWO6Nm5JHP0NEFdfzVxomBuvBr8t44iqOD9DlGe4/s4cn4BUxVN+5g8yDGsJZYLPgEJU
         mPvp6QF1Bpmc2sYr0gv/hVXJnrlmUdTev/M5jGntPYdzGY9H+1cwhz3z5SiEsrau6yqw
         NmHr6iNPD75ru7vvbdhS4ktoaCeo+4IollopxO/S1vClf32IS0bK7CnfGX4CTZvXCRIN
         gAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702844; x=1785307644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HIgg+cAUIBu82rEBIKTHLC0oAMQkhK8PpibsSCULDI=;
        b=HqNLDiu7d+10maxCiXMHKCi2ZC1OSbD/zVeoDbu5EbwV425qbc97mMQWwRFstwmC5o
         zahXmOroHrzvOv7pE5GSQgaM4werlyugIdJr1rhKeoKb/ytZ7U+tmSO6whqnKHMD42ZU
         5CNeD8Ztwhi+HJRqFGCib6yImzRRTjbWr9riSfHdtw7Kn+B/1ZrppYJ2YXy7laDvz+R0
         gmxNSLs+w8yrfuCXRZ0SSeMtWspxNjkShcYFDgAGmzwCD36WRR5MfiqsMOfKfFdSknY8
         BG3DKy3QAyd/eLPdi8Hf2BjHdb6eYj/ezUFeXynBqSjhk/CHsj06AvkkZh0YUeT9rT+f
         OOJg==
X-Forwarded-Encrypted: i=1; AHgh+RoIBX3PyH3neOp1/3JUtc1UU1Xb1P9VkCGwCBkyIOKauHGMnX8yU0Jzl5mxzfpFBbDgKFaZrnPGQuOEyLOJBW/d@lists.infradead.org
X-Gm-Message-State: AOJu0YyRQkBtz8I8wD0mZAaDgMVMs1ndeZmeK07UT8BAThAzlB4L+MzQ
	1Slq1C4VxF5QHJiajdKC3m9Zww+UpxPJyc8k+JyI2XKkT79ly+sZztc8AY/cmHI66JKVXMR8IqA
	VH1pKsKYppIniHoq46VZmuo3onHhh4qBTrGSSkSpFpYqNU5spAPFugFId5jaC+ixlO1FGKAWFso
	umyw==
X-Gm-Gg: AR+sD10ky9q7Belp18sXE4Kqnj+/zz/frPkFvSSqhvS7ivH16PQuNpZlpqam42Fja2X
	Qjjz7gpRl67NlTOEzQXyS/XanHq0vLvtoyuTo84F5SPpStLa3lrqe8TqYDRXAu+Bm0FhvdvJTbU
	xOnCA/G3jSpUXYJHn4JjTYOLBoz9y201gkoUkllrsIICekYvl0GruFR6zN3S26sb0KhYGIfGMwH
	Lk4JhwwyLG40kjJOa07cAq9ykqqoUUaDVd/c8cSOHmoB62jFepgzH9Y7Ek3wJ2ZceuncLHzppK5
	AH48ACy/GGsKy0EDU/baWchoDWxjCn7VVa06WPB9/CpiStpgksl9VlY7rkhsX8oKQBhSOWKKjmy
	Fb0vTCAX71H+BoW52+On9HaqTJ7ktH+oa4x8AofqzXFu8boqUYllz9Rrd9WBiOfFq3XHiFS4nNx
	da1LI0eZui1t1gnw==
X-Received: by 2002:ac8:5c88:0:b0:517:a7ff:935f with SMTP id d75a77b69052e-5213c8e343cmr223366601cf.9.1784702843667;
        Tue, 21 Jul 2026 23:47:23 -0700 (PDT)
X-Received: by 2002:ac8:5c88:0:b0:517:a7ff:935f with SMTP id d75a77b69052e-5213c8e343cmr223366211cf.9.1784702843171;
        Tue, 21 Jul 2026 23:47:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68883dbsm2999371fa.2.2026.07.21.23.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:47:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:47:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Subject: Re: [PATCH v8 03/39] drm/display: bridge_connector: Pass HDMI
 capabilities through caps struct
Message-ID: <zp7qqyaiir2npq3kzf23kqu26y3cr2fa7bdqtqnca2xggd3fvw@f4plbn6lzqng>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-3-d79890d00b6a@collabora.com>
 <eqnr2hfclbdkry2jqe2kuufss5kus6qpjblewq35upnjwlhxhl@4awqxpwrnxk2>
 <f74ffd53-5776-4fae-a6fe-eeace5c3fc5f@collabora.com>
 <20260708-bold-ruby-potoo-c6c949@houat>
 <dfe104fb-a132-4871-9dc0-52c157a2f08c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfe104fb-a132-4871-9dc0-52c157a2f08c@collabora.com>
X-Proofpoint-GUID: M55YD8QgeXFlF-_r3itQX4qyO0LbUvtR
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a60677c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=agHu-2L6Iul8mJwuYagA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: M55YD8QgeXFlF-_r3itQX4qyO0LbUvtR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MSBTYWx0ZWRfX2zCqC4UxbgJe
 R4xujT7zB4HHwsr6wczmwWkO0+VUPRzq4OiR9drGrnQsi0XGOjW4W3vXIdTuxmMNuvu66dzMWx0
 ERFuUlH+P86Z/YCYHZpkJju7d8t8U2xokq+EgUSUmE+PY8riinG2D6SLoDH/hfKWFY9Ho82ZKTh
 H7RIjx+pHdv8r+Aa2eTwr853EO5bIEV4lI4QCQueiKjrTQdOZuA1fmdtL7FsSry4SY4ubpCZvRQ
 PMRRXDjB2gsxnzlH2ACx37Q/Go5qzUlNBt+TZsPU18JSKWBxOE90cpnzjfzNWFKA/vl5LYjvto9
 HLTUjW7jr5HmtrZCQlT+k9i9A1V0jNR/1n1GDoDBwbaV9wtGFlwNfqpt/B07k16eImxbHtZYYvJ
 JMTFLIU800Y8tpMaKm3uktpUQqz2I3G1FQMch0gFEwAHTA3vUl5e3Q2uTWQ8IezlhFxI+AOpNk3
 Or0YbjmGgsX8Cj2Ax3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MSBTYWx0ZWRfX3zce3Tz5VDHd
 zOgnrGnlHMCN6N2+U8+eTOudzWKBwT7C9DcZAXdxa4zLYm3OBy6ARwAy2rmCsEJ/0WxcDfbqoTd
 +pReNzHtqgGs66mD8BpzknNzYTcZNM8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_234725_455756_62D93381 
X-CRM114-Status: GOOD (  24.69  )
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

On Wed, Jul 08, 2026 at 01:19:23PM +0300, Cristian Ciocaltea wrote:
> On 7/8/26 9:46 AM, Maxime Ripard wrote:
> > On Fri, Jul 03, 2026 at 10:55:09PM +0300, Cristian Ciocaltea wrote:
> >> On 7/3/26 5:19 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jul 02, 2026 at 05:46:16PM +0300, Cristian Ciocaltea wrote:
> >>>> Switch drm_bridge_connector_init() to
> >>>> drmm_connector_hdmi_init_with_caps(), collecting the bridge's HDMI
> >>>> properties into a stack drm_connector_hdmi_caps so future HDMI 2.x
> >>>> capabilities can be plumbed without growing the argument list.
> >>>>
> >>>> Introduce struct drm_bridge::supported_hdmi_ver to let bridges declare
> >>>> the HDMI specification version they are conformant with, and forward it
> >>>> to the connector layer through the new caps struct so HDMI 2.x features
> >>>> can be gated on real source capability rather than guesswork.
> >>>
> >>> And it's left uninitialized by the bridges, which doesn't mean anything.
> >>> If you don't want to touch all bridge drivers in one commit, please
> >>> provide some migration path and hopefully get rid of it by the end of
> >>> the series. 
> >>
> >> Sure, one question though: at the end of the migration, would it be fine to
> >> stick with drmm_connector_hdmi_init_with_caps() and just drop
> >> drmm_connector_hdmi_init()?  Otherwise I'll rename it back.
> > 
> > Absolutely, it doesn't make any sense to keep both variants.
> 
> I was referring to whether option 3 might be the preferred choice in the context
> of the earlier patch discussion.

Plesae exuse my ignorance, what is option 3?

-- 
With best wishes
Dmitry

