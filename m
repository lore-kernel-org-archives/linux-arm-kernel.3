Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E46CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 18:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=; b=rwP00QC/kWOPoHHaPv7sJbhatI
	3TjJGZi+jleGcaXGNha6DXoMAMdSfyxaQcW9lVzfCPh+XDycCH7bERj/3R2DduFpLDaAI4mQQS2jA
	WWaPFf1zr+mhschAyJy5RXBB+rfBt/VkoQrNxveP6EnPmuqGE5M73odAotLt1dpk3jkSxUDo4wR1R
	IQF9uj86knRJOAYGqG7KbGJCzXmEnP3Ybby+a8b+gY2gGaeRtgiVmxHFVEzsWyKqioiGEeKMIAir6
	cmRZxxNnlsb7B51bHMVD7P7Yp7WtEoVKmlTTSpdtfmWJ3vQXVYFA983tBpGftE1VtYSrU9qJWq5vi
	jgbgft6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY70f-0000000BQK9-2BNF;
	Fri, 12 Jun 2026 18:53:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY70d-0000000BQJ9-1ygv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 18:53:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGUSxW055514
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 18:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v3/Hm6Xq7WCrgTyuR+mYm99o
	byQyGcdOpmpb0F6ke1c=; b=QyzaGnikY7lvP+gYNtF5B5gsq2WmUJGU6b/iEyc8
	SM60hoYQ877RExS0N7DGLbXtTL5/6KRJJw7ZeGH5x87tjPexRkoTotluUY0BnFoF
	HkMji3P7vnUoJFsacAa7h3IxAfTGy3w+v0t6lhiq0m2CPW7jNKXBP9dy8oZQAYes
	/x7yvsuAm61BlmQgJFdUBuRG9rWEKgjMq6Ve3gPdCoUfGxiYeVrB/2byyKH95qPH
	2lgtErJZxVrg9WL1eI0Tx9nasXDLeiH+aWXhjUscB+gmB6mXz9YnPbeuLzbPtaHi
	OJTYOJiWMIh/LNLvFxLza8JV0OnU+OYW/dSj20tJKJptdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uv8ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 18:53:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158f2c4b55so204805885a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781290418; x=1781895218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=;
        b=aDSCw3z9p0L+tF/kdinPTzhlsNMjMouQ5bcaN/+ZB4GO0c4Wcjw+gWndkOZxxzFrHM
         Qnoxyaoo//FfcVRKYIz1CViRWcy1Zr7+5l2c3NEMaYEjF/YAYq7CqD6QVv9JNzHZJw4D
         nQbAMCfoHdig7lMb5xuAb/vQpvLfOGYYizHbRE2saqyrQuApGCRCswaPxNelIK9SoGBF
         MIycQGsLOhU2+oQYYAp9IHrgS6euLjLSaoAnG6MWG2+74KWYPxKQg6S70/R7WNMswEHE
         Bdi7oq8dIGXLpHIhQJukGxE4nlhvu0OWq0yRFfo/K4R1233s8kmD87ukdtxipseIb/w0
         A02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290418; x=1781895218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=;
        b=GM3Po7CJlgMY/YYa4zmRHoL58XuBnwjmVpZ26XrObK6tiuaP7o4iw4igDUpqUMChCL
         VsMtw0oOUAVd4JP4QBgg+xWDKswZ55CR8m7W5Xp70Kz7DjIZ5CVe0cUFnxlQzBvwQ5M7
         C+Aq1iR5Yho+flU8M5iNh7u9OAFcTX5M6vxbSnCyi/qzfoEtqOoN1dGktCV8TyxURSOQ
         9dMuayCvCsFsAwMhowR9LBf10XQ/YFDqu+Osza+8YaZ/SB+L4VgX1Pp4LjEBryiaqlgU
         Jul5ys8Zb3C+eA5RZGRj3l4nq+ow22J+6f0ZumT3WusBcdBqsYanR1IXWlo0q8Z6a2Uw
         H4yA==
X-Forwarded-Encrypted: i=1; AFNElJ+lxMz8gXzSnZ9lPbWSRk7s/LczIuRMgiI6/UXRpVnaaF+BX6oo6RCr3yS+0WrL7TJZAnI81vcAbBYo4pyXeyTi@lists.infradead.org
X-Gm-Message-State: AOJu0YwcH018vOKZSbHozYpBB3uo2Vm8EdyLCzxpxl9l731xjId2eG6a
	PeRdKYu7gkMkWpzeiWQ72ICp88S9ne5ArVe6Y36CAgGKc4BJXXPL63DKx4sr/J0Md0fS0cchS4c
	uwLWplrzTzYrCLYVjq3NmcCkWdCYJN6cuaO+Wtx1PdSUrIlR83bSGdHzD2faT4YGToMum0shk9C
	qk/w==
X-Gm-Gg: Acq92OHzqM2g/R7Nr9KVJ7KAvlmkZmgkc3xkQ0Uuut30IVw5PP/Q/ftLCyhExhyHBPi
	FceVSlYCxg6OaWu8NhFYdp9SBZmWrM4qH8H7P1wveyfc0xOK+C4em+oPc9uomIgcJLjDhgxXcH3
	vaGF17ATJJ/iJ1QtK5SywFrdYwEQEumn8TsDsGNdvWY+nFVxGtRWXRZwqzQS08XbgFH7/AQveqx
	wLYFY1yfWINUsMxJR2AIvZt64oq0oC0SPhhgAhOkHO+jMYSOpImYpNBFSLGTHso7jUHXd37scDp
	V/Olo1el90unnAgKrIjxVjlAwVZXKtDP0ZAi5DKOI+e1HrLEBUXIyPIoCkqRDWjnGOb42w8ggk+
	npR10pb/ndsweozLgqpZNZBRo5g0JiR8xtJ0TbepuMJi9c7BaGMpxzSTctfISHONY75ZAjuuKEx
	LffdUrg6QZEMw5GUdaPjiM8KOVaTf42Q9atEI=
X-Received: by 2002:a05:620a:17a8:b0:910:db3a:7bdb with SMTP id af79cd13be357-9161bc8d778mr559909985a.32.1781290417469;
        Fri, 12 Jun 2026 11:53:37 -0700 (PDT)
X-Received: by 2002:a05:620a:17a8:b0:910:db3a:7bdb with SMTP id af79cd13be357-9161bc8d778mr559899485a.32.1781290416844;
        Fri, 12 Jun 2026 11:53:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1absm726479e87.59.2026.06.12.11.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:53:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 21:53:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/8] drm/connector: report out-of-band IRQ_HPD events
Message-ID: <hxto2g32oyfy2tlihdgpjy7bwkhxp2cdw7qnf2rvpl7g7jczen@5js56gor3z6t>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
 <20260608-hpd-irq-events-v4-1-30b62b335487@oss.qualcomm.com>
 <20260609-bouncy-tomato-dalmatian-70ccee@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-bouncy-tomato-dalmatian-70ccee@houat>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3NiBTYWx0ZWRfX9+/5phLPKxxo
 n3jbOUsfifPzCUSh2su29TvFtEedU4Z9IeQqp7X4p4/2JBWrfYeM/WS8poUVEVsKvfIWGJmmYAf
 bvixYmYMMjrPcU6B1eS0AWEvIdYxLDQ=
X-Proofpoint-GUID: XrhhYVUt5fbNbqFiJs5gN5SgOJla3TDn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3NiBTYWx0ZWRfX02Eqt9VA8AA6
 +IbvEEiKCGqUutzjKbt9hL7B9L1+y3vGLqrluYtCQE4iEHFSRi8/OR2CtCCNfjM1C9hwRHANM/R
 +ASahyZBl8dJvFdP+I4URA9bXxxPYMnWE8/OqAwF5H6ABwg5GYm2lqWytXfsmHqw7s+TMeH3nzA
 v/JG84TUNiAw7DKXv2yNq/N81Bw9uAHv8LDBxAPrZbMhAxpGj3uCqWju8ZNOe/GkPjIUDF44KbO
 8ir92LxmC7IAiolVHSeGm7Kiu8HXNCZEha4svizdBUsr2rHB/YPYHOPYD52/2l3a06trjnc6D72
 1iHHh34MCEafwsme3lNnFE7NfVCTqiwpO/l8jk1UbTi2x5CYcg8x2wnHRGWAdODC0vyHMKM81IM
 FZ9RsJo48artJxOxzkd+SZK4ir2+dkcdPe3waMTv52D7N+TAZl8JESokMj7CIGv12ZyrTmjrp3m
 gkp9YcN48+ZQhzA3mqA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c55b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=Qs5g3gW-Ea0FhcstOt0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XrhhYVUt5fbNbqFiJs5gN5SgOJla3TDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_115339_633912_FB750D7F 
X-CRM114-Status: GOOD (  34.72  )
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

On Tue, Jun 09, 2026 at 03:20:01PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jun 08, 2026 at 12:33:02AM +0300, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of events called IRQ.
> > These events are used to notify DP Source about the events on the Sink
> > side. It is extremely important for DP MST handling, where the MST
> > events are reported through this IRQ.
> > 
> > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > events are reported through the bits in the AltMode VDOs.
> > 
> > Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
> > and extend its interface to report IRQ events to the DisplayPort Sink
> > drivers.
> > 
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
> >  drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++--------
> >  include/drm/drm_connector.h              | 21 +++++++++++++++++++--
> >  3 files changed, 46 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 3fa4d2082cd7..bb128dd0263a 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3502,20 +3502,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >  }
> >  
> >  /**
> > - * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > + * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> >   * @status: hot plug detect logical state
> > + * @extra_status: additional information provided by the sink without changing
> > + * the HPD state (or in addition to such a change).
> >   *
> > - * On some hardware a hotplug event notification may come from outside the display
> > - * driver / device. An example of this is some USB Type-C setups where the hardware
> > - * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
> > - * status bit to the GPU's DP HPD pin.
> > + * In some cases when DisplayPort signals are being routed through the USB
> > + * Type-C port the hotplug event notifications come from outside of the display
> > + * driver / device. In this case hardware muxes the DisplayPort data and
> > + * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
> > + * pin.
> >   *
> >   * This function can be used to report these out-of-band events after obtaining
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> > -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
> > +				 enum drm_connector_status status,
> > +				 enum drm_connector_status_extra extra_status)
> 
> Thanks for the renaming, but I think we can also rename
> drm_connector_status_extra to something a bit more descriptive now?
> drm_connector_dp_oob_event? status?

I did not want to introduce a DP-specific interface, keeping the HDMI
eARC HPD in mind. But... Let's get it nice for DP first and handle eARC
if the need arives.

-- 
With best wishes
Dmitry

