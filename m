Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC531CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIDTlMFsrNFSupa3j2HpAaCjj/tHU19+vRKipgxflMY=; b=elz64smsB2xgsmm/1+UDJaMXrE
	tVl/GjLIIKKkjlG1uQPK+qNKL+Ktcevdv43C/xJfxvvmT+jptGNOwY7Ccoq1VBh5C0vknJOztTuxB
	N1lwfXBpQisAq7RRU72Za3tVw/cTK7aA9QB0r3UP4XzDFfxlxRpGpqm74gsBu+zyMhB07kGY2+LYu
	q6LT0tM3nyjGiRiNrHV70HWiNTx2zUBBAp7S4mTYkxpTKnQ3FqMuwTaecnto/NNgUpzYaRC3RpA+h
	vU2118dPBubFWUWdQs08PInTFDQqt0+aeAa13wLXsGocQoiXHac6B4G+mITCMLbN1oXeGcIdlMhg1
	IXSk2cqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hTh-0000000GwVj-2eyD;
	Tue, 14 Oct 2025 16:02:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hTd-0000000GwUg-2JR1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 16:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RIDTlMFsrNFSupa3j2HpAaCjj/tHU19+vRKipgxflMY=; b=XkNjyYS7nV5Isp6NLnRGBBiMR/
	wQX6iMKtLL5AghM/m3RLpMNNpgTIBd+LSrj1Ak3Zml2PmzCtl9SsvwzqYIX1HnFXnMEKD1W658s6q
	GOH4sP1s5bSO95CpekygbGnzTWo/6+9rMggdCSXAgbbUhJ7pT+bhNUapeQsoQNozpphz0B5mX67tK
	+3xkRJSuzSvWCVPInJf5cf5iGlR7OZHmwiKkkD71zh9rztH3q8Ka1ja0vY1DOQPcaHHYTKbO/FyCD
	GhI5H2lGqCKB7BKO6at/Pehlv6+dq66cSmOP4deMSrZoA7Aisxv4WIjQVw0VXKHj4yd7x9tS7xeJZ
	yL4+c0KA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hTZ-00000005IR7-3oS7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 16:02:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFD1bb008997
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 16:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RIDTlMFsrNFSupa3j2HpAaCj
	j/tHU19+vRKipgxflMY=; b=D8d+RoYv2SKec5D8jKbm7NuvfVXZqqaa/GwmQ6aE
	sUgom710S9UPY91JnZdhu3MV9uSMm7AezppNgUxr0sD0+wKthsX8t/xVCYuuO9HB
	c/ao4tPKCqAN9pH5EkcXtF2/HDyp5mUDgg10c9t/lS45bDxmoVTu6fM9j1gF/3h3
	wgZLO5bjaX3fUvnyvjtLsxeQEyGkgI1seNX8Mv/sq3Di5lY44x4IaY+IXGbpLnUn
	d05SqnZ7V9IPxRJpmkcyFgUPztYt7C3c/wh+CK0fs2c2r6YfaZg60K5bhz5GxMsd
	0JvL1tSl/fTL7+enHjFpn3JGDeFi+43/fL3dB5L4oLLzCg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5h5u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 16:02:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-8f7f2a191ccso51190241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 09:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760457728; x=1761062528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIDTlMFsrNFSupa3j2HpAaCjj/tHU19+vRKipgxflMY=;
        b=GzLdWbikHkCkzSAgo9MTYjXG5xLOyNel+7Zx2NFRKBGpqWcsu5hX2wUNX4TyBmlgPm
         mbLNOtk+/xWfUNz+EsMTYoHlBaBXo9kjCkqvKJIRK0xN/y5S707Ts2Fl7sO6Nwgq9yqy
         0ZL4hfaS9/fBY17kNf7hPP8evmSEgmHZRCg6HmSQozq68rRlXAgE3Mf5+NAFogKEM1Mq
         pYcihnRO8UnOIRD5az5UUFVRJZMR+QzpKgbxiYW4J8+6y9iztGWmcb++GP5rxw8ZXNFU
         ZYsAGwGrwyn2YYpOlrOr8z+FaXbCB/G1XvuzUWsm136FTXq21RegnQNUPsjAeqxyntK0
         xN0A==
X-Forwarded-Encrypted: i=1; AJvYcCVEOaqMWgh7COcDsVFww5HTnXX6U9wThyaMmE56xGydmtwyH59iCbtpk1x9vzFTbt9iIJYzmj5wFl4llV75E2R6@lists.infradead.org
X-Gm-Message-State: AOJu0YxAbf3uWXpLio6r+dwaijTNVEEMRd7uOEXiCskc4hihI3tLdYP9
	eubStjORBhwncjZ/RGBp0DwJP6yAazaDmw5mPaguxUbUgzxQOHMtBs8X9b7I3ab4TrKBAEMlIaC
	xVw8am072vVLmhzBtoTBGukYzXE9O1GTOj0VQY7IAi4bd9pOTgjtOmnCniOGdOB6SHOd/yBFp1b
	nQMA==
X-Gm-Gg: ASbGncttfnHb2uOnSG+VMgmQGTHmURXdEKidr8xoWcTydPYsvXi31P/4L1hDoZUggHD
	Y9B1EXTXPOiEiRuNGYdQ23ESA9j2qot0XnuUODC92E6T6zenjPEFwcy6v9Ebf4yC0i5BdeVE+Sz
	F8yQd58aukIgwfLXEmb1h4fxEyRVBROSfAjvYQm/wjG9i52JZkO4NU++3E71Q1J1j0cSRUBsFF1
	Nag/k8BKkPb6nbg3fl4HNVbOmQLZYBHa1QTio/qZs8SSfaONKuD+dN3C2nlvveIjK+BUAxTdtYL
	AMkJUXKKgQHncv9MpWThkgEelrBE1eqWS9EHhJPMsRjc3OQaHmqVaNZm10WDdue8+DYXfrlHDhS
	stScI6BrWcMY3HJrlrxRolZ+bNfmW9P96TNFsyEFlBS17+aQNjrwp
X-Received: by 2002:a05:6122:e1db:b0:554:e726:7818 with SMTP id 71dfb90a1353d-554e726a88bmr2893402e0c.2.1760457727459;
        Tue, 14 Oct 2025 09:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiPVWLHJ62y1HXmozGHeu5tMGTb4MD+todBa4lunYFYoGko1Yp2FhdNfFEHzjjvK5KiwAUsg==
X-Received: by 2002:a05:6122:e1db:b0:554:e726:7818 with SMTP id 71dfb90a1353d-554e726a88bmr2893311e0c.2.1760457726794;
        Tue, 14 Oct 2025 09:02:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591c8779e8dsm60095e87.10.2025.10.14.09.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 09:02:05 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:02:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <ez6y7q4lgbwt7kpnlpausjpznckr3yyejrwtxm7o6qw6wlhqoj@6iypzdhfthzy>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
 <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
 <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
X-Proofpoint-GUID: cYBVvDq7Tk0ayn2HgFbFG_Lfm7q-6Rn_
X-Proofpoint-ORIG-GUID: cYBVvDq7Tk0ayn2HgFbFG_Lfm7q-6Rn_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX/sl4UX8zU/rB
 eFHkXxy2IWYFfHujJpDs8yz8lCmTods2IITyDNMtJWpoxmnKoH1QNHcnRCYXotxlZOAsGKUys51
 wpQqemBuGYKZPRZgHizVPmc3b051/M2Ta6SWIkpXLeX9fynFY/2yMkFWO9xjQJs7FX6reKsJCmL
 unHT4gYCPvkruEaTWSQw3j5GCGjyw4FaFavCqfKSLo1DCnU/+DOKroUbAVTmxuUB7Ipp68A67uy
 ivuaeiVex/gIL5Hk6jSZi+WtxzC6UsXVHMhI+2t7gp/vDrYcNV7LuqMW/RcqJQ2U8cI5y7DEOVh
 rDdY3o8L/YpYqI0fz5aNp7C3equgFCvYaVxwr8T6/+d/Op+C2iqX+FVic8JfitoMTZsuyPmPtjC
 GwYecvthCHBy+/PuGcp4/cBwbZ/4sQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee7400 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=6RWEyACVIll58Qch3D4A:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_170214_296311_9C5B0614 
X-CRM114-Status: GOOD (  56.36  )
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

On Tue, Oct 14, 2025 at 02:43:58PM +0200, Maxime Ripard wrote:
> On Fri, Oct 03, 2025 at 06:41:58PM +0300, Dmitry Baryshkov wrote:
> > On 03/10/2025 17:23, Maxime Ripard wrote:
> > > On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > > > > As we will be getting more and more features, some of the InfoFrames
> > > > > > or data packets will be 'good to have, but not required'.
> > > > > 
> > > > > And drivers would be free to ignore those.
> > > > > 
> > > > > > > So, no, sorry. That's still a no for me. Please stop sending that patch
> > > > > > 
> > > > > > Oops :-)
> > > > > > 
> > > > > > > unless we have a discussion about it and you convince me that it's
> > > > > > > actually something that we'd need.
> > > > > > 
> > > > > > My main concern is that the drivers should not opt-out of the features.
> > > > > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> > > > > > (yes, stupid examples), it should not be required to go through all the
> > > > > > drivers, making sure that they disable those. Instead the DRM framework
> > > > > > should be able to make decisions like:
> > > > > > 
> > > > > > - The driver supports SPD and the VSDB defines SPD, enable this
> > > > > >    InfoFrame (BTW, this needs to be done anyway, we should not be sending
> > > > > >    SPD if it's not defined in VSDB, if I read it correctly).
> > > > > > 
> > > > > > - The driver hints that the pixel data has only 10 meaninful bits of
> > > > > >    data per component (e.g. out of 12 for DeepColor 36), the Sink has
> > > > > >    HF-VSDB, send HF-VSIF.
> > > > > > 
> > > > > > - The driver has enabled 3D stereo mode, but it doesn't declare support
> > > > > >    for HF-VSIF. Send only H14b-VSIF.
> > > > > > 
> > > > > > Similarly (no, I don't have these on my TODO list, these are just
> > > > > > examples):
> > > > > > - The driver defines support for NTSC VBI, register a VBI device.
> > > > > > 
> > > > > > - The driver defines support for ISRC packets, register ISRC-related
> > > > > >    properties.
> > > > > > 
> > > > > > - The driver defines support for MPEG Source InfoFrame, provide a way
> > > > > >    for media players to report frame type and bit rate.
> > > > > > 
> > > > > > - The driver provides limited support for Extended HDR DM InfoFrames,
> > > > > >    select the correct frame type according to driver capabilities.
> > > > > > 
> > > > > > Without the 'supported' information we should change atomic_check()
> > > > > > functions to set infoframe->set to false for all unsupported InfoFrames
> > > > > > _and_ go through all the drivers again each time we add support for a
> > > > > > feature (e.g. after adding HF-VSIF support).
> > > > > 
> > > > >  From what you described here, I think we share a similar goal and have
> > > > > somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> > > > > we just disagree on the trade-offs and ideal solution :)
> > > > > 
> > > > > I agree that we need to sanity check the drivers, and I don't want to go
> > > > > back to the situation we had before where drivers could just ignore
> > > > > infoframes and take the easy way out.
> > > > > 
> > > > > It should be hard, and easy to catch during review.
> > > > > 
> > > > > I don't think bitflag are a solution because, to me, it kind of fails
> > > > > both.
> > > > > 
> > > > > What if, just like the debugfs discussion, we split write_infoframe into
> > > > > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > > > > write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> > > > > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> > > > > 
> > > > > How does that sound?
> > > > 
> > > > I'd say, I really like the single function to be called for writing the
> > > > infoframes. It makes it much harder for drivers to misbehave or to skip
> > > > something.
> > > 
> > >  From a driver PoV, I believe we should still have that single function
> > > indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> > > job to fan out and call the multiple callbacks, not the drivers.
> > 
> > I like this idea, however it stops at the drm_bridge_connector abstraction.
> > The only way to handle this I can foresee is to make individual bridges
> > provide struct drm_connector_hdmi_funcs implementation (which I'm fine with)
> > and store void *data or struct drm_bridge *hdmi_bridge somewhere inside
> > struct drm_connector_hdmi in order to let bridge drivers find their data.
> 
> Does it change anything? The last HDMI bridge should implement all the
> infoframes it supports. I don't think we should take care of one bridge
> with one infoframe type and some other with another?

Note: I wrote about the _data_. So far the connector's write_infoframe /
clear_infoframe callbacks get drm_connector as an arg. The fact that
there is a drm_bridge which implements a callback is hidden well inside
drm_bridge_connector (and only it knows the bridge_hdmi pointer).
Otherwise, the bridge, trying to implement drm_connector_hdmi_funcs has
no way to go from drm_connector to drm_bridge.

The only possible solution would be to introduce something like
drm_connector_hdmi::data (either void* or drm_bridge*) and use it
internally. But for me this looks like a bit loose abstraction. Though,
if it looks good from your POV, I agree, it would solve enough of
issues.

-- 
With best wishes
Dmitry

