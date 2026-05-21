Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1E1CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=; b=LBRd11ci/ECnwKDzbnLFCSP24b
	Ds/7CVTB9RK3NafHp9+S5ao33M31uNqguycBbNmugeqH0qG1hiXmqZXZWK5nRqDJw/2fsi7OTAk5q
	NQYfIzZj4yv8OlmNWyhrLMM/VSs6icuyRevHjrzdECMejB7o6xILwojQDJiAuMpgairJMLjvHV2VV
	h8JhB1yMVQUjd9ISCifiqviqA59gaVzyMTp7MCYB/7lBU9NVY8gYnNHNrCRa7R9bGu3bDZHzRrnaB
	2a8AKqBRa81vXq6JrhRVBn937ZR9mt9NhxtgcQ/ysP78XnmIsv3zwikC3AIFMRiyWUZoETkh/5g79
	8QvCg+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ29R-00000007gHR-0atN;
	Thu, 21 May 2026 12:05:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ29N-00000007gGV-40Jz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:05:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMbk3555993
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pGY+j87eohBlWubIX+vUu3zL
	xCM+uB8O9JAB1ecXkdM=; b=ESUcJTqfqAtQySEKLKp7KIRCaL9t+erTOvTDfYVG
	fOBbLyDU9ErXoWLj4r4aG9s0cSsb8zoRyM1JEXHKMO58+5AlNlIqYhVm4fJDnyg1
	cl2sJsIct0JQnB6xtZiA/nkLgshpE2ZJ2d8TMb2iE+jiPVc88/YLy+/uMALyWJcO
	EFiCMzn/yB2f4Oj7+vhyZdRM7OScqDwli9yLV5lCf6V/2L0HFXQP/129g+4Vwob2
	zmgClDrJK6DrYqqGGbrsnUTeIGoXHc4aGqrFVjT2e248jtLQepcXVGsiUmf9Vdb9
	yl1pamahY+nuPtJOIFtAZJqeEnapAvzxGfzSceLlDVUI8g==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6md2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:05:17 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6963482e03dso7620849eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365116; x=1779969916; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=;
        b=jJm+G+TtAr5609AWpiUfxF03XrDjj+HCuadDaY2GflNhgW7BrWCoI5CDAG6XC7I7np
         w13+aiYSf3sqEZZ0Hh2itK5GjGkOKSLjPm9+ft6qz9kHIOiJlm4YyUrYDzKkXNZlmUmX
         A0dK6eaTj4Puf27VLzRIYLso+W0KEAvTq92hLaOF76rx7qWdZg1C/SV1CE3caEiEmLBj
         iILd8j8aPUL+abkhtOg9NMbEvuY2j4NIxd9z/8PA5dEVHnEAUhiYoUJRWv6FJSlziGnD
         Mp0c8Ea4Dpon2cPJbLH7mGREb9Id05lUDzg/GRGIxMoGMTTXGtbYj7Cv6kOEL+hGzLSM
         YChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365116; x=1779969916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=;
        b=k+BnuF0URjxSubwsss2BcxY5fxdR3g0zvAR8Ft6wUjdp40HVnYmrDHLFHTZrVngCkr
         LmndI8vgq3hgAsYRKZO5F2FqCOyFH/2hqm//hNTwXLdtMlNGo3Cr+LCLmS1f5Z5aMzou
         BYrTTHgbep67bTWDOLuyjj02x/KoQ38o/3ls5VyG7qLe1i/oQvN2OeXleluHT4tft4cJ
         ROhbUVQZRoJ5ZszWh4XAn/fU6Aqfy413MNbrMxxQHWP2ZcYE23PteQdx0CgFWe3E+dvK
         JfBF/znLF3bfbV0WJdiKSGOgv6eAQvH8ihEHs75gbLYU8oEkny0dRzxEP+hLPS7pS+VM
         KrIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+K3yxnvFb7KlHlzj7oTsT+6zHstoDKFMw8Vd+k0P7tipecQXCysml68T/BARDSAJhaouuluR2KPdA3sl4U+np8@lists.infradead.org
X-Gm-Message-State: AOJu0YzlwcDyb68nrHHjGigLjug0wNlrVZwSCbIuBvWkH8kIPlS97XuE
	tTeMQ8VmPSNhXNh16ZPqO83X/FVQDW/sTFq4e2d7J1qFh7BZIsKE1LBo0clas/eBP1oqxPSYcqQ
	UQ1aBlFNTYkO+KEZPKFh/KBP+iiAuDB+X+8KSZGwe6UsUhszC9G0AGpQt3h7U6sFSzWPc+QPo50
	+P8g==
X-Gm-Gg: Acq92OEW/mdKjt79fAJ9WntPedk8abOnzoTVbiA70kpyvvDgvKm43h/GjW2AuGDoQGK
	2mSd5k9vfRn5CN2YCaV4o6a39FC0EoXDjsz/xKjqVt7fpID/WUaEEIj6sMH8/XWN8tqtdB0y5W0
	BA8dGcQP6m2YHw9fA1s5HrMIJl21NJqpXmJr6pWdE+6YFFmCWygqvjZ9f6rvGLgD8gjFKBVQlxR
	QJRr3EYCV2lDFS+j7m5oC9BVjtqjFXF90uE3lq6HeiWUvbRMfnMUqEcv5LAaQehdhNo33NBcGgA
	D3aEMUyuyZWZz0oKAp6OU6wftY7V+WrznS9mRBoI3paKuwQbFGYsJDP9eGeb4/lVUHI6LQxzW9g
	Z/hZVbRQ8bRqO2eKHTLgC5EK6e/8q9vkhEZaOR7oXGkhqh11noLYLIfmb3vXFD9K6S6TZXrO8qN
	dK/r+vrHag4kVYjN1xX6X2zg4o8RRGgolXc0Q=
X-Received: by 2002:a05:6820:1348:b0:69b:bf80:2db5 with SMTP id 006d021491bc7-69d6ef409f7mr999589eaf.52.1779365116338;
        Thu, 21 May 2026 05:05:16 -0700 (PDT)
X-Received: by 2002:a05:6820:1348:b0:69b:bf80:2db5 with SMTP id 006d021491bc7-69d6ef409f7mr999560eaf.52.1779365115873;
        Thu, 21 May 2026 05:05:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d0a107afsm2201901fa.16.2026.05.21.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:05:14 -0700 (PDT)
Date: Thu, 21 May 2026 15:05:11 +0300
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <vpd5hyote5wspmlpad64kf5peoy5g7wv6c7xjn6ammcmjtai7r@q2tarmr5aoqn>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
 <20260521-funny-astonishing-mackerel-cc5a01@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-funny-astonishing-mackerel-cc5a01@penduick>
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ef4fd cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mRF-X4ptvIx_UuOgb7IA:9 a=CjuIK1q_8ugA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: k-dZiVuSJnzA8oQqj7FmmtE-eMa2tSlS
X-Proofpoint-GUID: k-dZiVuSJnzA8oQqj7FmmtE-eMa2tSlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMCBTYWx0ZWRfXwFh3/mFnen0E
 1tjueU8c+7cHvWAjolT0saRjdnFVlpYUpg604JSSA3ujz09k7cu88zqDFrcglBq6bCRFiND6gwP
 A6Bvm8aUuPAi48BAwanvmHyTshTEeQ9cEqOzwGSTDesZphiIKTyIBiPykD+5OagaO+LBGuubwLj
 BWjnt4QNAdaoVIrmWmKzlAK/R3nX5SkvM6pnmN27wU/gp869L2cSDAY8H/DcEgLOXrrdsPsKMhg
 W9xU7E5xPRrcbaCsF1ewwHuvUmZCyGSoQTnAGU8aDXsUSkO1m9GqiTfaXKkfq0e2JJ22MoTOcA6
 wWr+X3c2zAbuRfW83O5IdQKFGlwvq+WaxDie75KMUHRirycJ6vcX50duSNwevgfJfWeM0FibUgj
 5McgP2G70wQYo9K/SW/deTnxg0lnuTiZ0gIaGK639lYnwYxPJcEM/dme0VCTQrlNZNrQ3WQCnS3
 NpTc/WSU4LvyNwVyEsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_050518_305299_2A23AA5C 
X-CRM114-Status: GOOD (  33.70  )
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

On Thu, May 21, 2026 at 09:47:29AM +0200, Maxime Ripard wrote:
> On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of events called IRQ.
> > These events are used to notify DP Source about the events on the Sink
> > side. It is extremely important for DP MST handling, where the MST
> > events are reported through this IRQ.
> > 
> > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > events are ported through the bits in the AltMode VDOs.
> > 
> > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > events to the DisplayPort Sink drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c          |  5 ++++-
> >  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
> >  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
> >  3 files changed, 33 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 47dc53c4a738..edee9daccd51 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> >   * @status: hot plug detect logical state
> > + * @extra_status: additional information provided by the sink without changing
> > + * the HPD state (or in addition to such a change).
> >   *
> >   * On some hardware a hotplug event notification may come from outside the display
> >   * driver / device. An example of this is some USB Type-C setups where the hardware
> > @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> >  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +				     enum drm_connector_status status,
> > +				     enum drm_connector_status_extra extra_status)
> >  {
> >  	struct drm_connector *connector;
> >  
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > index 35d9c3086990..7182a8e2e710 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> >  	} else {
> >  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> >  						hpd ? connector_status_connected :
> > -						      connector_status_disconnected);
> > +						      connector_status_disconnected,
> > +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> > +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
> 
> Since the extra status itself, and what the options mean, are DP specific, do we really want to
> extend drm_connector_oob_hotplug_event()? I think I'd prefer to have a DP specific variant, with its
> own set of parameters.

I can try arguing that drm_connector_oob_hotplug_event() is DP-specific,
there are no other users for it, only the DP AltMode driver.

Anyway, do you just mean new API here or new API and a new connector
callback?

-- 
With best wishes
Dmitry

