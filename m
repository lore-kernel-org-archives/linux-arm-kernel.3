Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA4F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9qLWgpjbDnzk8XgHlDYIL/wcQIT1V1yN9ePl+7ekJQ=; b=w4p1K8NYWC0U5ARGJN9HeLVtMo
	nSLjkmU4svJkggJh5hbJ4JccHkmTJYLVkQ2PWrwwxHPdfH2BhcdwbGOwRZIp2rcO1F0TmCSjB9exX
	GkywFfh2E95sexk+EASJG1LfYYnkmwarXaIBPbj8cKuaf92fOw5y5Lf9vWBNp3zoSdTdXb4N+kcsK
	w9uxUR5kPWAJk7CkYV8cXhTPdBos5BTBVZyfmX+RyPJulqYmgyzKyCfvxvwq+5GLhv97uAcagoC2H
	MTXMhwt3EcXRI+HjAC4RNLD40KjQvL8K4/AmDh5YOAvgSJ//Y0lnOC5xSLyLoJwr3JKdFME/ELzMn
	UZxPZrEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEne5-00000006s92-2Aoj;
	Mon, 20 Apr 2026 12:22:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEndz-00000006s73-09Oh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:22:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9K2m6787034
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 12:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d9qLWgpjbDnzk8XgHlDYIL/w
	cQIT1V1yN9ePl+7ekJQ=; b=pFm2CzEjU67veNp4ikkvqwTF3+41XmtO15IKPDro
	NDY6++5+hzKyTPyeSnqoMG0t56qJEqBLOqdCmtrjICL/OtPyWY+qKxdN+teD3Wjf
	lj24IRTlTRxPcu0JV+dMxkw6i+5R4QR3ToAYbfw3LGa9AjG2KArIojx+rF5f8Aj9
	PSl2zHEqjq4XmKubM/jFEr6AavEmg6UquQnm+6Dnh71icpvlTYrgVTw8XCgyisc4
	jAgr6KJoWrfRqdB4N4HJsGycvk0sp8stpRMKZY/9k/pvM0WstD4f8V9evEq1/0gC
	c2Gpgil84noEkTDnWqwIHV3EwAPvsNHz7KvYOVNHpcwl0Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhgkcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 12:22:26 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953f6e0f1e0so3289386241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776687745; x=1777292545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9qLWgpjbDnzk8XgHlDYIL/wcQIT1V1yN9ePl+7ekJQ=;
        b=CEoLH9kRmoS79YebLY8IFbQmVCoKuZorrESz6RVIp2EGfKiOvgU/V2+xiw2ky/PUuQ
         DiEcrC41YllW2vqfj4Djp1uHoqZI9gI+xGb7EZ0MjOVRkP38G7/H/QjGAJnQwrdZm/02
         s+InM8t1JmdEU2DrqxEbg1RoKplb2fqBmwLe+Wlj0T0wv+3N/XEHMVfIx+gDd2arPXfS
         Uzdz2iu2kILV5EPAtQ3Y6xQqvuRbZn5YRNhO88tAwADG68phuTglr1YiQjQhM8FtudLq
         x+LDdoMVZadq7mAvdLFZNRIMH4kkFWkdu+E6vIFExv2E5ew1B+10XaK/z8y6+g9YTHIK
         E1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776687745; x=1777292545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9qLWgpjbDnzk8XgHlDYIL/wcQIT1V1yN9ePl+7ekJQ=;
        b=F/CSSZ5jLdMcA9A2cvakKYrFrulWUR881cGSBM390iI552TIB4JQoIi5dkP7esHE0F
         GPsaIHya9MAIuWmsifMtaPiLOUR4Q30R5ysNKYy7O/rg+/ulS7gNeUSDReTdXo9Bt/94
         AqSbCZjpoim2q595QryAaEr0Ct9xb3uokd5mEFo+oLkHr8/rYSNqPgtmh8i+wBb2Y9rX
         oTiXXgPvD9RaFV0gSbux8XNe3qIwq6IUTOG5eKR0ghgEzHpM4mvIFGLjDO9hdPYvWdj8
         ydPahAGY7TorT+MpN5x+Asfn3S4F3+UzB9zEImM+GSeQGICxAc+m50jHBAS9iaPESub4
         erDw==
X-Forwarded-Encrypted: i=1; AFNElJ81TwURClsD709kOwCUZNSY0jhaPq7BKQqeMFucVkRtcTEsycRqT5AVDSeh2mTVAo4CfQuXUHSeMSvTO9farkL+@lists.infradead.org
X-Gm-Message-State: AOJu0YyikNh2R+/Jvlf44YBu8NtAPHlvy/paOdRTFP+QJBaT77dZVjUm
	1iAbNqsdLAr6KNr755NW3dSX7ha2ADYhw8LCxMuMx3iIsyzj6vvQQGBQiWGUXTJ36T7rALB+CVt
	kjXSx0E7sjdQWUDIYpLnw+rUybXHoKsAqiwzl6RS2X6eZPPERY9CCQsb6SSaAcDf4maL2FzxvaJ
	LqcQ==
X-Gm-Gg: AeBDievrGCTZuB6Nvv9vXovxc3qAJy3FBgyChmuwqvekj2M+pM6fypBDyO7CrTVsnKS
	JL07trxzMdSRk3Zl5G1dMdTRZHfZmsGqaFpTVOdBNYpi+MVrj/pNlsDAH3T7C6YCpAnbY8Um4m0
	FElrCUKJdJ/2E4jiRlh5rulRfpeqVde20Wer1yawC5hYoGJed4oyclRmw8IKomRalg1Cxt3DogJ
	5OsA4or17GC96+ij/ge++qSqfiHtqW4UHcKDmNSgwXeZytPRsYlatNmSOWbiSy6+MefVaz586ad
	MsISvDERBps5HExH7YRkvyGkV8Wbv6m2fquh7nGLHGBzcT0Lwcdo1vAcss1+SPOPgONVvMakCr6
	iY2hQtwWeUnNYC6LFN+iivghvDFJB0KLC3JjyFlkfGJhDsDTQ49yXWmLfu7kDF3f6/suzzpm6UY
	BTINoe0VNSG2p9grM5dYj+d4v6Sr8TOZqzUR2H7VT+uGxq5w==
X-Received: by 2002:a05:6102:605b:b0:607:7991:8edd with SMTP id ada2fe7eead31-616f69cf898mr5180339137.19.1776687745111;
        Mon, 20 Apr 2026 05:22:25 -0700 (PDT)
X-Received: by 2002:a05:6102:605b:b0:607:7991:8edd with SMTP id ada2fe7eead31-616f69cf898mr5180299137.19.1776687744603;
        Mon, 20 Apr 2026 05:22:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f07b3sm25155421fa.22.2026.04.20.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:22:23 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:22:21 +0300
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
Message-ID: <ugeikq47wb2b4vnowp3lyjmp3utyq533qczf2y3uc5dtjo7gpa@v7vclmntisob>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
 <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
 <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
 <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
 <f74ecd0a-3ff3-45b4-935e-44b89cd0c92d@ideasonboard.com>
 <v7h3a5pwx32dfcumc3diysylja6lhkhobyzemfthb6dsadcxnp@2kkidnsgov4e>
 <ac330f76-24dc-4f6b-aeaf-69176eb41298@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac330f76-24dc-4f6b-aeaf-69176eb41298@ideasonboard.com>
X-Proofpoint-ORIG-GUID: PAVk0s8MPZdMbRwVj1s4NYNHOag5R2sS
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e61a82 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=NVKd20UARjXkfPC9qNsA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: PAVk0s8MPZdMbRwVj1s4NYNHOag5R2sS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMSBTYWx0ZWRfXwhu4vVotTvuK
 kHeuZIi3Bu+K8s57I+XOZWxG79vN5VoSZTZTu2Ha9kdldnrNPCLQLIh/3mkJoyDxk1epAaOk1Ei
 SzHZLddUm+kNwPLxAiAqRTiw9RhZsY8120NvUf1c3/hc98uxBX2lapKgWNRCRBSeKe8ngcycvoI
 ysUWIqkiBGjVqpxsEGNSTL0RfoPiJAdwBO8cuOxJo3PaJGlC5KpCmAYUWfsXUnqdKRCwmq5I+uY
 wzf2dYHQQxsmhD7DcXyYtIBvnhiLM0vhgAcW1DRMnhqNCbDepBV/0bwl8FjhbSNr7Op1ScoG4HG
 rqOgJKwCp9sr3PrEcTvoxFrqjpeSHVEIKVef/n86oxW+BABcqmXYrQbybe32RQNaOun8Cog2iXS
 oURiOTgrw/35pxNOjqPH6HoX1xVTL5yUxt9zQY58C4MrgzTJ1xcQX8ijRuHyoMECDpZIMw50gOb
 sUkE+o7Rb6fxMDjQkhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_052227_084588_D62B5318 
X-CRM114-Status: GOOD (  59.03  )
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

On Mon, Apr 20, 2026 at 02:51:49PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/04/2026 14:45, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 02:01:57PM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 20/04/2026 12:50, Dmitry Baryshkov wrote:
> > > > On Mon, Apr 20, 2026 at 07:50:46AM +0300, Tomi Valkeinen wrote:
> > > > > Hi,
> > > > > 
> > > > > On 18/04/2026 01:32, Dmitry Baryshkov wrote:
> > > > > > On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On 16/04/2026 02:22, Dmitry Baryshkov wrote:
> > > > > > > > The DisplayPort standard defines a special kind of events called IRQ.
> > > > > > > > These events are used to notify DP Source about the events on the Sink
> > > > > > > > side. It is extremely important for DP MST handling, where the MST
> > > > > > > > events are reported through this IRQ.
> > > > > > > > 
> > > > > > > > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > > > > > > > events are ported through the bits in the AltMode VDOs.
> > > > > > > > 
> > > > > > > > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > > > > > > > events to the DisplayPort Sink drivers.
> > > > > > > > 
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >      drivers/gpu/drm/drm_connector.c          |  4 +++-
> > > > > > > >      drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
> > > > > > > >      include/drm/drm_connector.h              |  3 ++-
> > > > > > > >      3 files changed, 13 insertions(+), 6 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > > > > > index 47dc53c4a738..5fdacbd84bd7 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > > > > @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > > > > > >       * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > > > > > > >       * @connector_fwnode: fwnode_handle to report the event on
> > > > > > > >       * @status: hot plug detect logical state
> > > > > > > > + * @irq_hpd: HPD pulse detected
> > > > > > > >       *
> > > > > > > >       * On some hardware a hotplug event notification may come from outside the display
> > > > > > > >       * driver / device. An example of this is some USB Type-C setups where the hardware
> > > > > > > > @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > > > > > >       * a drm_connector reference through calling drm_connector_find_by_fwnode().
> > > > > > > >       */
> > > > > > > >      void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > > > > > > > -				     enum drm_connector_status status)
> > > > > > > > +				     enum drm_connector_status status,
> > > > > > > > +				     bool irq_hpd)
> > > > > > > I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
> > > > > > > with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
> > > > > > > 
> > > > > > > Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
> > > > > > > If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
> > > > > > > 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
> > > > > > > for both short and long ones (although in the kernel doc you just write "HPD
> > > > > > > pulse")... The kernel doc could be expanded a bit to make it clear what this
> > > > > > > flag indicates.
> > > > > > 
> > > > > > I attempted to stay away from defining a DP-specific flag, keeping it
> > > > > > generic enough. HDMI is pretty close (IMO) to requiring separate flag in
> > > > > 
> > > > > If it's not specifically the DP IRQ HPD, then we need to define what it
> > > > > means. I tried to think what it would mean with HDMI, but I didn't come up
> > > > > with anything.
> > > > 
> > > > I might be mistaken, but I had someting like HEAC HPD / EDID status
> > > > changes in mind (or HDCP-triggered HPD status changes). But here I
> > > > admit, I hadn't checked if it is actually applicable or not.
> > > 
> > > Possibly, I'm not familiar with those.
> > > 
> > > > Anyway, for e.g. DVI or VGA that means nothing. But, my point really is
> > > > to abstain from defining someting as DP-only in the top-level API.
> > > 
> > > I'm fine with that, but then it really has to be defined =).
> > > 
> > > > > > Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
> > > > > > in the VDO rather than a pulse.
> > > > > > 
> > > > > > Anyway, if irq_hpd doesn't sound precise enough, what about "bool
> > > > > > extra_irq"? This would convey that this is the extra hpd-related IRQ,
> > > > > > but it would also be obvious that it's not related to the HPD pin
> > > > > > itself.
> > > > > We'd still need to define what exactly it means. I think it might be better
> > > > > to just define it as the DP IRQ HPD, as then the meaning is clear.
> > > > > 
> > > > > Also, would an enum flags parameter be better than a bool parameter?
> > > > 
> > > > Maybe not enum, but u32 param. Then it can become:
> > > > 
> > > > @extra_status: additional type-specific information provided by the sink
> > > > without changing the HPD state
> > > > 
> > > > void drm_connector_oob_hotplug_event(..., u32 extra_status);
> > > > 
> > > > /* DP short HPD pulse or corresponding AltMode flag */
> > > > #define DRM_CONNECTOR_OOB_DP_IRQ_HPD BIT(0)
> > > > /* DP long HPD pulse, debounced XXX: do we need this? */
> > > > #define DRM_CONNECTOR_OOB_DP_REPLUG BIT(1)
> > > 
> > > Why is u32 better than enum? So that we could e.g. pass short values inside
> > > the extra_status?
> > 
> > No, my thought was to be able to define values specific to the
> > particular connector types and to be able to combine those values.
> > 
> > After sending the email I started thinking about the bridged and
> > corresponding notifications. There having overlapping values will not
> > work becasue bridges in the chanin don't easily know the final connector
> > type.
> 
> An enum can have overlapping values. I don't think there's much difference
> between u32 and an enum in C. I just like enum because 1) it groups the
> possible values in the header file, and 2) the function parameters can use
> the enum type, making it obvious what flags you are supposed to use there.
> 
> > I think you are correct here, it should be the enum. With the first
> > iteration defined as:
> > 
> > /**
> >   * enum drm_connector_status_extra - additional events sent by the sink
> >   * together or in replacement of the HPD status changes
> >   /
> > enum drm_connector_status_extra {
> >    /**
> >     * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
> >     * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
> >     */
> >    DRM_CONNECTOR_DP_IRQ_HPD = BIT(0),
> > };
> > 
> > /**
> >    * @extra_status: additional information provided by the sink without
> >    * changing the HPD state (or in addition to such a change). It is an
> >    * OR of the values defined in the drm_connector_status_extra enum.
> >    */
> > void drm_connector_oob_hotplug_event(..., u32 extra_status);
> 
> Looks good to me, except I'd use "enum drm_connector_status_extra" instead
> of u32 there in the function parameters.

I had bad feelings about passing OR or enum values as an enum value.
But then... I don't see values to OR. All expected events come one by
one. Let's drop that part too. Thanks for your comments!

> 
>  Tomi
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
With best wishes
Dmitry

