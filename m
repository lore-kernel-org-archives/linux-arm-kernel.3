Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5FFF99C69
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSEGKQzB1WAe4mG6RsOQMGtvhysGI/AKv3U5JbVIAVQ=; b=QXhKexvKhEk+iIM0PJDeiQzmX6
	AS3vVWMxL2iGmhJwED66U5ZqULfZIoX2PEL81WDgAnHg0LtcN/jXBG3j7ynRfm+u6WQOJ303cWk8d
	6USa3E6KhHrFTxVPZ7olu1uuRHFPJgCxZpp/0Z2ctrRFKjdzm9lVA0c9KfOaFAikhTgrkONy/aNXt
	KlXfsR/tuuqJP5jm0Ff+VsAN97BGcuPtgE5tbGT2M9j8iP43io4FtJDVjdHxVw99jgPaKfkaNXFCw
	uPkiKBpm5F/++YbOvya4cuzUXKVnvKsxSpzjZJEEn+t80NTAUiZBJgyzvddLQgbYtjmp171cMXTYc
	jnGx0FAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDrkK-00000004WuV-3E7r;
	Fri, 17 Apr 2026 22:33:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDrkH-00000004Wtn-3tYF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 22:33:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4Gpb4068652
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 22:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TSEGKQzB1WAe4mG6RsOQMGtv
	hysGI/AKv3U5JbVIAVQ=; b=oXzhYDK1rSLLAp2XIHAVvLo4AVqqKnlswar189HN
	e+rnzd4BME96QgsFztG5BU63Zk4j9KXEQIVcmjKW62Fgday+sRMm+JAzN6ghiRE3
	qGy7XqnmhAb+dW6JF6f8mBCHJhY6uOzwvjvwHmQ2fvZThDOhhdt5pHzfFGvSFGk0
	S2+qFTh9QuNk9UzDeBYPyuGuCTkFUKp+RFM7tLZIN4r1X7e8M318vOz97z/C4u1h
	aUSUQedy+DVpgc6grFsf6oIw83sKg8qamfYAzbPTY3uivt3TAVkJvqtDjR0q0oQn
	DVCMtAKCPXWR2gl8TLA/hrybVLumaootglztDdTC2Vp1OA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu2ggj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 22:33:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9d52ad9aso24266801cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776465183; x=1777069983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSEGKQzB1WAe4mG6RsOQMGtvhysGI/AKv3U5JbVIAVQ=;
        b=bcJoPFC8Mut719dpZIk3JYGNzWkzNzGBgiFQ47bwuqXNDysZIiSZOZF48LWfQfgPoE
         opI4AxY69mQRR65SwcUsosY8hqWBaHCQPxBZBOOdjajUQIFFYSUSftYJ3Qs9smE5l6gj
         4zgltY8HJNzoJhQ3iNGfRQLUNuohLTEsH2SQoKUO8IYB+s5fSlFhPvrLpMs09etaEQyo
         Jdx4o+nhR46Gg9CJIT9AFhcae3vtPezUzqXrbR+8DDPa/7PjrDzwWjJpz44R2edYEht0
         N/G3YsWW9TeD+2vYNqbWEdzLDJ0Rkc2HHCGhlKdLppWxkKgS7i2yhQut+alEY+pFu+4W
         2FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776465183; x=1777069983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSEGKQzB1WAe4mG6RsOQMGtvhysGI/AKv3U5JbVIAVQ=;
        b=SINzVAidrTvh2qst3CHSVbWH54WAiTcIDAavZ44U5MXt3IieCcaWqhGRV43yaPJB5Z
         Z0+z29c1UlJjRa5fR3T+Cb6SdDtfLSpEjMBqYbWb9INQUMWCgDPd48hWqEEzqTx7cElJ
         oRoiKdWyvKpD6pVjsstSUi6FupO2QNLnaEjlqkXFK2soCDKbRRzKfBnhndQk8qY0W5qL
         4PVUt3QhgKA7uTQbn9GTnvmcgd9cS87KufWgssLGebLGnw1UAl6jiok4hnoFTMVEfBU6
         FfP8kaT67M+RFKBxl5uzd6n50qdDhpPZjpQEGY+VZ/gkqij7S99Hpbn3fdY2K1BH/ZKj
         k5Ow==
X-Forwarded-Encrypted: i=1; AFNElJ9cpIsPvfE4KHNviaFOl3HruxxGeM9NM6/4U7ROOFLpn8hq/ZFgXySn+3zR/7M6CDNODTLk2ug0Yft2o7RrFhpW@lists.infradead.org
X-Gm-Message-State: AOJu0YxyD/+9VnavSRvLgVBbydyJ1zIHnZWEJCgAAwXrTPjSpYHrmZ7U
	273CNEXo4LvGDF1H4KBFijRE6V6cuIgdraet2Vm0xKvzXaHNpKmmHZG0ynLA5DprCy0HvXJPQIb
	LraS5RpPLHmN4LNbI+B1EsgYEjL6EGQfqssMeEW9hj6evDRONW+gxp2OVr/LEZDXb44WEEZoJdH
	j7zw==
X-Gm-Gg: AeBDievftaDzL8L9Tu1i9r78/u8+rwxZzQ10GlRG8yfU7TA30u6oAb26axCFprAqAnR
	SoZYu3Ue3m8GsM3fbYfo4E418G2um2CcqV1tu9RA8mWdBVFHc8hAxmj5dWAsl7hdUqL+PNzdUsy
	xrll0/Qwc9jtzLaEUl+KaEBWfGFFMwQZiTlBQRb1kadOosbIuRhnoVXDBi9kM951KkEi4utpH15
	io/6wQ68+kWWqOO+GT2XbnxBv0ly6CINhvVno+/R6WWGxRum2v9IQjHlJjVAtDo6Sxhef0F2jF2
	gz6UBEcvh2iTDEscStIEDdTYacz6AnKqR8Fcww3Vg0Hd43F4kQ+91/TSjNfkQqxTdxP8/eNvBoT
	695nYGTr0aVfJE4WCMpQ9/X1pPf4y1XVIXJV1Rptk0iRqQeFMheU1QnAx6uOSsnF2G6QqoaRpFy
	Ti3ddvODRobED0uQckddfsGECpcax17XGnkcY4AQ2LlKvQnw==
X-Received: by 2002:a05:622a:345:b0:50d:82ca:7c9c with SMTP id d75a77b69052e-50e3693d29amr70717821cf.14.1776465182686;
        Fri, 17 Apr 2026 15:33:02 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:50d:82ca:7c9c with SMTP id d75a77b69052e-50e3693d29amr70717191cf.14.1776465182179;
        Fri, 17 Apr 2026 15:33:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc297sm770798e87.18.2026.04.17.15.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:33:01 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e2b51f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VTJl8P6_mujMtk0GPeUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JT4eZqGEgowtU6aDG5et47Giot09liuY
X-Proofpoint-ORIG-GUID: JT4eZqGEgowtU6aDG5et47Giot09liuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIyNiBTYWx0ZWRfX4ezi0km73eOx
 kbUTYvzprraiG9BKIWYwC987F/CpLQnjRjwtjPYTF4JffY1QVIUxaPDGwGXtIj0ljyy+vLcUuIa
 3h5DzoPfiUqORT9+MvQTi0HTwLsEbklqSAQ9o2DLbWXJul/vL00Q2HsPLYLCxHRuMYUOQnHJ/wr
 4Fkq4emknRYPruwqEts4slKUW1zHuKJ/oABVZbVEO9fXurfpwfO4aB/Bt/bd8coQItpctkYj91W
 cYsleKO7znT4dBxLft+DzDJEucFi502cOQXhhOnwsD0ehGWnkOGAPJMkuUi8IAC4Do7LIUV04ou
 2GsX/bXF0zMn68LFdPR3z5suXZLdJ9wOimcUNdgcYXgYqx9m0rZTVs8rJGJ3aNtz6uahe+G5CKR
 wmwoFVou/UdSS7nY+GE+CyEZnjnpSPHJ5KqNFjELNjp7Sy64LE4bYNF0CGm7JDKHi0bhZTJMxL6
 Aq82zMtXVMvfOr4b/ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_153306_143117_7DA880C5 
X-CRM114-Status: GOOD (  34.81  )
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

On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 16/04/2026 02:22, Dmitry Baryshkov wrote:
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
> >   drivers/gpu/drm/drm_connector.c          |  4 +++-
> >   drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
> >   include/drm/drm_connector.h              |  3 ++-
> >   3 files changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 47dc53c4a738..5fdacbd84bd7 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >    * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >    * @connector_fwnode: fwnode_handle to report the event on
> >    * @status: hot plug detect logical state
> > + * @irq_hpd: HPD pulse detected
> >    *
> >    * On some hardware a hotplug event notification may come from outside the display
> >    * driver / device. An example of this is some USB Type-C setups where the hardware
> > @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >    * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >    */
> >   void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +				     enum drm_connector_status status,
> > +				     bool irq_hpd)
> I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
> with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
> 
> Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
> If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
> 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
> for both short and long ones (although in the kernel doc you just write "HPD
> pulse")... The kernel doc could be expanded a bit to make it clear what this
> flag indicates.

I attempted to stay away from defining a DP-specific flag, keeping it
generic enough. HDMI is pretty close (IMO) to requiring separate flag in
Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
in the VDO rather than a pulse.

Anyway, if irq_hpd doesn't sound precise enough, what about "bool
extra_irq"? This would convey that this is the extra hpd-related IRQ,
but it would also be obvious that it's not related to the HPD pin
itself.


-- 
With best wishes
Dmitry

