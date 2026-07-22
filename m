Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A68C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pVGt7IjXnn3ZfLcIQiSgDsNCKR3N4V2SknmN7EXEzE=; b=j9FoBZa3slCEMVnkYyOgVRtueG
	zYSvyffD6+w/NkLfcl56Hq23wF5xlNhSwe+SDzB0ZoHXruUsuvq7/DG8awhPnhaiwijMdUJfd6uFj
	FjyQKV85hk9y4cercRZ87KmKx7lNm8M9PwVN7dS4+Rj5Y8goIb/hyZTbhi462cqvuHxLRvu0GG58i
	qjbaTfkw54tRTl14L3G1eYByKbvNSEeofiTtn+6ZOowMA2RRM5gPQ7oLh69OPfJ5NwFhftbiMTzAx
	KDQpOUjEiQObZD5F4Yp6XaKUgK+8BCYEdsUN52iaibwH4pBtepeaa5RfyYthj+Sp2QfM62UHlZjeJ
	REyUXnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQiX-0000000AzcC-3rm5;
	Wed, 22 Jul 2026 06:46:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQiV-0000000AzbV-0wtz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:46:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M61sYg984434
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2pVGt7IjXnn3ZfLcIQiSgDsN
	CKR3N4V2SknmN7EXEzE=; b=L83U3PKmLvgX3hsJ3k4qNf22c+2q44xkiEt/+AnD
	slZZhTJTFgQLQh4aCPYmqMJNkzVY3eyScylLAwGjKBbLu/1Gc0OWJ1SaxFUE+BBi
	EzTcy1D4QQPaJY13tI8crOcOBk7vXciwb7Ozgd0WDqnEsJ3RrAeW9pvWgFnEY6et
	Yide1HfRCT6TkCdVgDXJlza1+qqSrZ3UWOgplAh4XrWzmZ9bOD8ipuxvn5MEwOHT
	iDY/uhl0g5VNX5Cl2XYt32gVBq/2XMYB5Sg54djjnS2pDRavRHVX5oKMHEjd6JWb
	SYy4GZMKHe1F4cghI4KP++YmyjSl23sbigJ/czg15Z7GkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr8385am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:46:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso150861491cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702765; x=1785307565; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2pVGt7IjXnn3ZfLcIQiSgDsNCKR3N4V2SknmN7EXEzE=;
        b=QonVHzhFDpbTI9t+uQkxqKACc2uq3IKunollTIm7CA9cYsOTWLIijgF3S8eOs9UfQO
         ZIrXdxwXn8xqeuhmHSibhLhOlgZLweXNPMfWFvzLRxRdLKjJ+OrAde+++x+mYk776maF
         wKXn7h0bL4WNQVs9td+L54VsaXc85Bds/v3huwZi86tCzIAjNECuGDNn1VSt9RTGg+mU
         +x+9xW+OmuhMZfBTIyVOYtrv/wNCm2sSMpncwb059dwvCWs+qfuUoZGkn+IOEV6Cz3B5
         dqI3ayI9vbOILfNfLBrt9g8CI5EY57ajMng/PiuyKyT2j27kmPvzCmrnTbaXKZ/A3kfm
         IHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702765; x=1785307565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pVGt7IjXnn3ZfLcIQiSgDsNCKR3N4V2SknmN7EXEzE=;
        b=j5cCpU/b0jzXYS+KwM0/mov+SW/4FtATAFN6t/SNHJ40QtRgWW6u42A/ixacMlZ7M8
         WcXCv1IOgWfUkWDF8sQxEpVpfQxSejhOK4VZS8BeMMipuGU/abk/MbFM6an0PrDdSKqn
         Lqeav8PUCEeQ7Ng4ZcBGPyBbXUNCWdhhd6riQf2cmkPWWzOh9laMvEHLEX6UpNFYH1pb
         sm6lzTfOr10lqRdi6DJN6MTUCmPHErZwbOU2PF2ksK2Ji4Vq/XfezkN+8Ui+1rkITqj8
         1DEMXHx/YEKzLVO+fzPmkK8sjS8Gzz4fD9Pm0Xz0hzlCGFSTmMIG7ZH6Rsf4PZq+Y7bJ
         u3NA==
X-Forwarded-Encrypted: i=1; AHgh+RpxTeuKINNhJse5TPKmW1z26xRVWpmzUWHI97fIyl9U02IW98EUq0c9tiOwVZ6o4aurjli9mIbtIqnc1ED2Y8Qe@lists.infradead.org
X-Gm-Message-State: AOJu0YyLb3kyZ38J+lmvAznux9IPZ+9dvDNTZ4IMEMBXl+LPiLc1Eug5
	wktook3FvTKqC0XYPjjf14F9o3a2YRNr3/AdTNUnHD+4uIG4WqSijFvTDfr4CYFWi4lAE9c35/L
	S5O9Qa5/Rf86769H/CD5nKSmectJeZm/aVWERRZEMv/O4s7lrsmWRyYWm9r2bjsDzfDd/uKqTO9
	s4BxCWFGwZLg==
X-Gm-Gg: AR+sD11diijsVVs7gj3+pXVC9SG7ocoOUnmAvDa0yXhm5O4x6p3v03yieFDrNkEvej8
	jA5xc/7OCGZlVHMsCC7zlsc6CH6idzHSLPa+NoVThdnL8TMAeXtwlGH1LpwaNYxPIaPTm6PJRzz
	+IGttwXTJBLi1e5nrZLLwiun5tsPFPzDnljmmbn5M5aaVvX54tjgejszti3GMclZc6PeR+/FgtJ
	IB5HWiue5sVkgU0fXik38MgDWuVc4oNFdNNFywS/4WzmXW8hVQlxPICmmFdAx9pvaxRxgwePzK/
	G0q+3PG9OrCYLvHfDDPKRsVj5YCjRRfj34PLhSADESOg0hbD1wEsBKF2mcrAuBW/wqNGN716Q7w
	Nure3KDuemFzAjF3hNYG5dWtcI8fqcK7EkaEHyySXRYC8IeY7ixRkmVi0C0x8Q1rS14aF0a4lvy
	bXdo2l46xnuoYWyw==
X-Received: by 2002:ac8:5a12:0:b0:528:2c84:eab0 with SMTP id d75a77b69052e-5282c84fcbfmr8325331cf.33.1784702765294;
        Tue, 21 Jul 2026 23:46:05 -0700 (PDT)
X-Received: by 2002:ac8:5a12:0:b0:528:2c84:eab0 with SMTP id d75a77b69052e-5282c84fcbfmr8324961cf.33.1784702764683;
        Tue, 21 Jul 2026 23:46:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f4a728sm295475e87.75.2026.07.21.23.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:46:02 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:46:00 +0300
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
Subject: Re: [PATCH v8 02/39] drm/connector: Add caps-based HDMI connector
 init helper
Message-ID: <hbnni3gonklcmfmsgsup7lcusvnqcu5jivq7hhzrus2el5c55i@kvm75nfqyntf>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-2-d79890d00b6a@collabora.com>
 <i4tjtsf5rsckfcayo5nuhlger5wqxn3ujeaubm4g2fgrwvhzb2@hf4uhgq3ja5p>
 <ad75cf26-9437-47d0-864d-d71263401615@collabora.com>
 <20260707-illegal-tuna-of-force-1c06e3@houat>
 <737678ab-f082-4a0e-b453-f403ba141437@collabora.com>
 <80374deb-3246-413f-a043-66bcdb438ab1@collabora.com>
 <20260715-fair-opalescent-rhino-c6407b@houat>
 <45113534-94ad-4a0f-8014-c04e9ab67a26@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45113534-94ad-4a0f-8014-c04e9ab67a26@collabora.com>
X-Proofpoint-ORIG-GUID: Durm188WKpihHc6I_KdwnWLAdS9rh5-m
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60672e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=zWnJzIVKQ1Due3HqBpYA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Durm188WKpihHc6I_KdwnWLAdS9rh5-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX4j+DnwdFvAz7
 +rjNz7dGNFWFnna0RB3Awgz5GEfEu7+f4kfJ4N14lRZiP4UYFNGqO4VaqwvKGc1S1KrtJiv0Bbl
 p/t4q07hu032gdYIGuzaE7Uxh8MXufPkO0bWMJzh0HxmBPj8Fay3sUN+JeI72A7Qj1nX0f0LckI
 m0NG6N0UWrZg0Uo01rteLmEuauvMTe5mhQJTVDtViz9VUsIAG3+erwtvNNe/UT9ANB9GoDuebkC
 w/HsABkb/2EvXh9Zsz2cxLsP0isfz7+3AjGJo6+S7Y8xhAaUag7TD6XIwC+kwh70a2QxNXZ76d2
 Scy2Z+tkCWmL4MI6x0sr8GoaWr8BGGtp4neZlEsxGNrfYOXybZSXGh+0LomYjlB4jOEXwiZi5yQ
 sjHrcOrLtDwayBlDWw4RVZhTLLlfG1yNxEdA7TIZf81ZL6IuQHrouNUDL/14DsRbnYn7ruYd+N/
 Vd1PgjTM3HY47nZNNww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX8KHHVtrdJdpa
 qrzyoOh1N9A/KOFw1HWGDthFNTeeAC/n/Wh+mHOgwZD6ZmM67TmU+ylz3agzu0XSaUd5VOhjmjA
 Y76OBJfWhjN2b4Rk7nKGIUFO/j8KJ7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_234607_390711_90F555B3 
X-CRM114-Status: GOOD (  41.02  )
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

On Wed, Jul 15, 2026 at 01:34:19PM +0300, Cristian Ciocaltea wrote:
> On 7/15/26 11:50 AM, Maxime Ripard wrote:
> > On Fri, Jul 10, 2026 at 01:27:37PM +0300, Cristian Ciocaltea wrote:
> >> On 7/8/26 1:11 PM, Cristian Ciocaltea wrote:
> >>> Hi Maxime,
> >>>
> >>> On 7/7/26 7:10 PM, Maxime Ripard wrote:
> >>>> On Fri, Jul 03, 2026 at 10:31:55PM +0300, Cristian Ciocaltea wrote:
> >>>>> Hi Dmitry,
> >>>>>
> >>>>> Thanks for your quick review!
> >>>>>
> >>>>> On 7/3/26 5:05 PM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Jul 02, 2026 at 05:46:15PM +0300, Cristian Ciocaltea wrote:
> >>>>>>> In preparation for adding HDMI 2.x source capabilities, introduce struct
> >>>>>>> drm_connector_hdmi_caps and a new drmm_connector_hdmi_init_with_caps()
> >>>>>>> helper.
> >>>>>>>
> >>>>>>> The existing drmm_connector_hdmi_init() helper currently takes
> >>>>>>> individual capability arguments such as supported_formats and max_bpc.
> >>>>>>> Adding more HDMI-specific arguments to that function would not scale
> >>>>>>> well, so move those values into a dedicated capabilities structure and
> >>>>>>> implement the existing helper as a wrapper around the new caps-based
> >>>>>>> interface.
> >>>>>>
> >>>>>> I think, it was an intention of Maxime: make sure that every driver is
> >>>>>> forced to provide some values here. With the struct-based init it is
> >>>>>> easy to overlook or to ommit a value.
> >>>>>
> >>>>> Agreed that the struct-based init loses the compile-time guarantee that every
> >>>>> argument is explicitly provided - that's a real downside.  
> >>>>>
> >>>>> I'd argue it's recoverable, though: the init helper validates the mandatory
> >>>>> fields, so a driver that omits a required value gets rejected at init time
> >>>>> rather than silently misconfigured.  The "you must provide sane values" property
> >>>>> is expected to be preserved, just enforced at runtime instead of by the
> >>>>> compiler. 
> >>>>
> >>>> Yeah, I don't think we can win with C here. Rust might, but we're
> >>>> probably a long way from that.
> >>>>
> >>>>> The main motivation for the struct is scalability/maintainability as we add HDMI
> >>>>> 2.x capabilities: new fields go into the struct rather than growing the helper's
> >>>>> argument list, so existing callers don't need churny signature updates on every
> >>>>> extension.
> >>>>>
> >>>>> FWIW, in the previous revision we discussed addressing the concern with a
> >>>>> callback instead.  Sadly, I had to discard that approach, as it proved not
> >>>>> flexible enough, e.g. drm_bridge_connector_init() computes caps dynamically, and
> >>>>> would have required either stateful callbacks, or storing redundant/temporary
> >>>>> cap data in driver-private structures just to satisfy the callback.
> >>>>
> >>>> I just realized something reviewing your patch: we don't necessarily
> >>>> need an extra argument or a callback, we can just put these fields into
> >>>> drm_hdmi_connector_funcs directly, and then validate them in init.
> >>>
> >>> If I understand correctly, we should drop the drm_connector_hdmi_caps struct
> >>> introduced by this patch and move all its fields into drm_hdmi_connector_funcs.
> >>>
> >>> In that case, how should we proceed with drmm_connector_hdmi_init()? 
> >>
> >> Actually, this brings us to the callback issue: we cannot compute caps
> >> dynamically, as it only works with static data, since funcs is supposed to be
> >> immutable.
> > 
> > Does it? The core and helpers must consider it immutable but it doesn't
> > have to. drm_bridge_connector for example could totally allocate it and
> > dynamically create it based on the bridge capabilities.
> 
> If we take the VC4 case, is it fine to drop the const from the static
> drm_connector_hdmi_funcs to allow dynamically setting up supported_hdmi_ver and
> max_bpc in vc4_hdmi_connector_init()?
> 
> static struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
> 	.tmds_char_rate_valid	 = vc4_hdmi_connector_clock_valid,
> 	...
> }
> 
> static int vc4_hdmi_connector_init() 
> {
> 	...
>     
> 	if (vc4_hdmi->variant->supports_hdr)
> 		vc4_hdmi_hdmi_connector_funcs.max_bpc = 12;
> 
> 	if (vc4_hdmi->variant->max_pixel_clock >= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ)
> 		vc4_hdmi_hdmi_connector_funcs.supported_hdmi_ver = HDMI_VERSION_2_0;
> 	else if (vc4_hdmi->variant->max_pixel_clock >= HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
> 		vc4_hdmi_hdmi_connector_funcs.supported_hdmi_ver = HDMI_VERSION_1_3;
> 	...
> }

I'm sorry for the late response, I was OoO. Why do we want to put data
into the funcs part? My suggestion would be to put the data into the
drm_connector_hdmi itself.


Setting connector->hdmi.supported_hdmi_ver = HDMI_VERSION_1_4; is more
idiomatic than passing it through the funcs.

> 
> >> Moreover, we would end up with some redundancy, as most of these input fields,
> >> after validation, would be stored (altered or not) directly in
> >> drm_connector/drm_connector_hdmi structs.
> > 
> > I mean, part of the conversion would obviously be to remove the
> > redundant fields.
> 
> Ack.

-- 
With best wishes
Dmitry

