Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CC3C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLFbiiOA9hEJI7vkwFsRphphL8SnhgkIS0i8wm35ID4=; b=cEX8+Br29pfXWwnb1yCAvTPM4c
	j15eJyLdl9ZMeXORV6aACdi2Oy2xV3CaT8XKW2VK9LPfwUZeBGAiTa/t+ejkWL7NX7tNgYG5yOdWf
	xFjgOF9uOnPhKpsTg/050VmC88PKqXeHZbmYQ0wp7b9rht24945WdY14a/1F4tH9EExfz990P68jE
	IIKcgdKVs3AQjgbiFsBOhjqWPCVg0vU2UXi1vSoHbiBcQ/aapdHMrBwIo1Lrq9VO7DVuBDZTagZxv
	gAB11sBbOEXMguqB7bsfDmsf19tjaw0z1xCkQz0Sn7BIAYKISxbYIepCaIUYsOs1qY05/RatyXrT6
	rIyxE+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRZy-0000000B6NZ-2Bro;
	Wed, 22 Jul 2026 07:41:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRZw-0000000B6Mj-3vIS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:41:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M7CFF5131653
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uLFbiiOA9hEJI7vkwFsRphph
	L8SnhgkIS0i8wm35ID4=; b=SOQpXtqwFMu5V9C3aTPrHdER1uzedC5+uDvQYAh4
	FxKZOkchklDcFHMhVpoi8FOwHXJGWIpxAwAHCPuTFU8QlGGaAyHZsjpJ+keJVK3T
	hU8FKCFRs7tGPeU4JzrSay36wf7VEfzCXZLXMCf9sWKZF/3h6wR7DWMVW/oY/Q6i
	DOQVOxVmTLvmncTVkrPao0YlX3InJJlzw0UJ3XJlas8YCCi5/E2uiWZnbPwymnnk
	xMJMKNpUviWzB2lVsWcNHI0Ygua2jbNK1B9KpDiD79jc3T1lwe6+x0QILYDmxU7Q
	JaYAc2cp7KdmQljaVy7uWqk6tbP+gVHlGtCqE4/430G9Zg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs92845j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:41:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso128964831cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784706079; x=1785310879; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uLFbiiOA9hEJI7vkwFsRphphL8SnhgkIS0i8wm35ID4=;
        b=O1c7QH2y8TS61oGvAH4MJdbXhjN5R+R474fBfRQVGH4INx66tN0SkGsx94SIbqNhBP
         CeymJNhRNZOL+RUZfjSHSBdDwhN+4IOJyl1ySfTgrdOydQSOBjZnvNLI1OupPNh6LJHq
         lSumuIpvc4+a0Vm7s7OLqI8vGqLq2zyoOo25CiU/94LeWvzO7CB0DXuYHGB/7oGblE31
         /LNQTy3Qk8siJcGBG1jwRA4p5nmiCy/0C9R+OZJaob9HTsAJYYzY7x/H7WghqwAjIXpq
         iyXcIdQqW3l9YfHIGcWW+6CDxu7g7hPg2oUS0XUDsiC8uC0EVngCga570Zgi8YI0TkY7
         lBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706079; x=1785310879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLFbiiOA9hEJI7vkwFsRphphL8SnhgkIS0i8wm35ID4=;
        b=ebzVNrWDw6U+7NSEikv3PhJN53/O/QOQlte9GCnV2bBDAa3AZJLKRRcvf5Lev/oS5u
         iiPQ//79YnYkKCsH+EuSTYGe8pJYj4xckHUws/nASJpjm75ZBXhcGld/1JsXXUFlDk3X
         BE0m2urnF9OMQjyRKXw08wpYBf1g1qEEnqFxcEzU9gOO0JhysJIlhY8140EBPjwpV97U
         v3GRTMoyXhiBksz3Tyk2QhRBrN4saZAc0aI5pwqYSnpQTKDZJ/MZV2ej1zn1LAG5teOu
         4LJZvC7W3mhIi+IPzJ9Ps05JKDsDx9+CMOddsqBSDSN7vEArIK9UqCN06b31qRWyyqDM
         ubcg==
X-Forwarded-Encrypted: i=1; AHgh+RpPABWIFPZiNsMC2horRGLRGrDOL4h9QaqJ7bz9LCgu5CgtrVzlUTh97wLsC913jRNmj+LIv5pqIfhOuCHqoHxM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg7a4a0ejxspn0qQFBT5SmRL0sTy/eqcdCsuByrzJsXP2TW0Xy
	L4MlBWMKiUZKcHqGN+IKyJSzhX4Wl8qLcVmZJI80ne7bjxLjllNkrcoDORGtrBJKz2xnsMmtRp8
	em+7fWEN7UJc7lqK5brcXBR1C6mOW2q2qjKRKLFUAYXMNNK8VwgPeCq4H55JpNdQjLDhGLb4SUZ
	o/nQ==
X-Gm-Gg: AR+sD104FsNWMuLdiub7y6DNvq8YEqOGOx/118IwUubh+qm+xcZx3k+m41zvQZ+mnAn
	d64SgGX0Llk+GySPlRAnKr1lBlOLgaPkdt8hC+HbTvrx2YSeV5egnujfolC5oSCi6AWQJB8ofWg
	9MnJqHO4p8zs9GEP37diYYJmwv/Infi582xOu0eqPJX3pUxrlycnMbINh68clfEZ/KOQ78YdTnv
	fUtEgTGgBjG3Ic1GmDV6q1trzzppmDfAKzmtO1YclhqBrIAi9jBBIWQEqGrv6vBPMgeK33kJkDD
	ZehlOnL8ywUZCQNzHkOEtg0dJKkYjn1AWSKrNWVX9HDUwPePE9EtkvlijnVIW1mhWgVx4Tp+vMC
	9Af/Gs4Md99/8ELxxfGShAtSNWTRw3pVM94faA0vhHXeGy+b/FxZyKWL3kfVL3NS/1aJvrrKN3Q
	KIi8MF7jG6sbP++A==
X-Received: by 2002:a05:622a:1c05:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-527a660bb36mr30506101cf.12.1784706079415;
        Wed, 22 Jul 2026 00:41:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1c05:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-527a660bb36mr30505661cf.12.1784706078842;
        Wed, 22 Jul 2026 00:41:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c0a9sm339473e87.17.2026.07.22.00.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:41:17 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:41:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
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
Subject: Re: [PATCH v7 11/30] drm/display: bridge_connector: Wire up HDMI 2.0
 scrambler callbacks
Message-ID: <qi6aoyz262qog65qq6vj4jgnidp7bbx3x3w5f6v2ibq4a4i7xp@n3cepguql4k6>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-11-445eb54ee1ed@collabora.com>
 <20260612-attractive-dashing-mule-309598@houat>
 <b14af457-0799-43cc-80b5-7ffff5901f24@collabora.com>
 <20260619-rough-jolly-poodle-bb7aed@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-rough-jolly-poodle-bb7aed@houat>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3MCBTYWx0ZWRfX9nfDMcWsDcIp
 NWPA9yu+R8EcTJkybG0oTi/POm+hqjNhsKw5ZdgNRmi6qkxyBGO/ysm+Z7DYVBAnZSRrr/e45sx
 0M5cKOLglaaK0HzRjSPbAJ46V+RGvvE=
X-Proofpoint-ORIG-GUID: OkALS0eAM2FwjlFe9Sc-O9Vwn1AYSwel
X-Proofpoint-GUID: OkALS0eAM2FwjlFe9Sc-O9Vwn1AYSwel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3MCBTYWx0ZWRfX/lxuAYKZLu2E
 dDMM0BpzPI8I17+ev/nJn4OUqjk16xyUTAb8dqS7zn0aBUc+lxxNpgBK1/f96eVAuG0zOFW1NxR
 S+KZJWyz63I5QihYd+6UrgddNXoZChT+cUFoYUZcYWje1lO1rSVCgISShI41NhTvDYKZYYQ0q4e
 MkED0T6X7JJ642G3BWI1DGDnJaAUzkbuCXSd+0DYXo7MPkoboEiH/6xfV0RpBlwCd6Ens+UvaA3
 OVjzoku3JaluvDwRX37W7FQgkDZaf/JpQAF5GZemi24f+LCng0ah9QQBn+oDPTWWbzTN95m0Ub7
 L+xA+SGzpzJiRTTE5/gT8iAGNAOcZ0l+YcctZQExTLHIqb7Q8TpAvv2o75PBYcDUpOQ4JU4ZcwW
 9JCXa6Iwtb6mJ/1MxfLC5SECyO6Ot2bJD0CZI9ccYcVaDmJNWLMdTXMHhfT4zzM2bQOXcNXGv4r
 m5AgbCmqOlHRSKKD2bw==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a607420 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8
 a=hD-RnQd9uO-P1XsdC_MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_004120_975879_E6EAF4F1 
X-CRM114-Status: GOOD (  41.52  )
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

On Fri, Jun 19, 2026 at 03:58:43PM +0200, Maxime Ripard wrote:
> On Fri, Jun 12, 2026 at 11:42:06PM +0300, Cristian Ciocaltea wrote:
> > On 6/12/26 11:52 AM, Maxime Ripard wrote:
> > > On Tue, Jun 02, 2026 at 01:44:11AM +0300, Cristian Ciocaltea wrote:
> > >> Connect the bridge connector's .scrambler_{enable|disable} callbacks to
> > >> the underlying bridge's .hdmi_scrambler_{enable|disable} funcs when
> > >> DRM_BRIDGE_OP_HDMI_SCRAMBLER is advertised.
> > >>
> > >> This completes the bridge connector plumbing so that the SCDC
> > >> scrambling helpers can control source-side scrambling through the
> > >> bridge chain.
> > >>
> > >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > >> ---
> > >>  drivers/gpu/drm/display/drm_bridge_connector.c | 41 +++++++++++++++++++++++++-
> > >>  1 file changed, 40 insertions(+), 1 deletion(-)
> > >>
> > > 
> > > I think we're taking this backwards. The scrambler support isn't
> > > optional: either the controller supports HDMI < 2.0, and then it doesn't
> > > exist, or it supports >= 2.0 and then it's mandatory.
> > > 
> > > You're considering it optional here, when it's never actually optional
> > > (unlike YUV420 for example)
> > > 
> > > I still think we should list, somehow, the capabilities of the
> > > controller to the helpers, like max tmds rate supported, formats, etc.
> > > We've so far put everything as an argument to drmm_connector_hdmi_init
> > > but it becomes a bit overloaded, and I wonder if introducing a callback
> > > wouldn't solve this, kind of like what we have for planes and formats.
> > 
> > 
> > What about introducing something like:
> > 
> > struct drm_connector_hdmi_caps {
> >     ...
> >     unsigned int supported_formats;
> >     enum hdmi_version supported_hdmi_ver;
> > };
> > 
> > struct drm_connector_hdmi_funcs {
> >     ...
> >     int (*get_caps)(struct drm_connector *connector,
> >                     struct drm_connector_hdmi_caps *caps);
> >     ...
> > };
> > 
> > int drmm_connector_hdmi_init(struct drm_device *dev, ...)
> > {
> >     ...
> >     if (hdmi_funcs->get_caps) {
> >         struct drm_connector_hdmi_caps caps = { };
> > 
> >         ret = hdmi_funcs->get_caps(connector, &caps);
> >         if (ret)
> >             return ret;
> > 
> >         connector->hdmi.supported_formats  = caps.supported_formats;
> >         ...
> >         if (caps.supported_hdmi_ver > HDMI_2_0)
> >             connector->hdmi.frl_supported = true;
> >         else if (caps.supported_hdmi_ver == HDMI_2_0)
> >             connector->hdmi.scrambler_supported = true;
> >     }
> >     ...
> > }
> 
> That's what I initially had in mind, but it feels a bit over-the-top
> when looking at it. I think I'd really like something that drivers
> cannot forget about, screw up and/or mess with, so for example report
> HDMI 2.1 but force disable FRL support, or report HDMI 1.4 but support
> YUV420.
> 
> Adding more arguments to drm_connector_hdmi_init could work I guess, but
> it won't scale to everything we need. Expecting the callers to fill
> drm_connector_hdmi won't work either. So I somewhat think a get_caps
> like we discussed is the less bad solution, but I'm definitely open to
> suggestions.

Works for me. Then we can migrate some of the drm_connector_hdmi_init
args to the caps too.

> 
> > Not sure if max_tmds_char_rate should be listed as a capability, as we already
> > have the .tmds_char_rate_valid() callback.
> 
> I guess it would make sense to move it there and consolidate
> atomic_check / mode_valid checks, but I don't think it should be a
> prerequisite for this patch either.
> 
> Maxime



-- 
With best wishes
Dmitry

