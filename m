Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4320CF5581E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSEOlty1w4G0PIvTT1dv0PCaahtC4/jkfebraYruQdc=; b=hL6nx3qXT16oI+Y7Zi7gu2UDPd
	slVE/zt89GxxQAlloigLgX9i4arYyFGK4euafnAVR8PvuUMGqbvR+UVi9vNanizX341sfQ86X9ONF
	hU34AUQOOzwi+R1AuufgIIV+r8+TMyRMu/HOaHtRfsLNdeHXgIX72m0cmZ61kgTDHVEnSc7xB0JRl
	CN4ve62nL8iCH8V2n26q/D53wjMUY9nVl7TkukBJECjj/ChUxm1I/VSxk5+vOc8YSjjK0CbW0IDcD
	Yt3yct4rMJTRfoZs1MlgbqkkJ3lFs+++Oayk8pv9UAGEAIyKcTQ63vwQl5/1c6HYmZ7NYgxLQ1Gwi
	qAvK3/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEn4f-00000006oRP-1yEy;
	Mon, 20 Apr 2026 11:45:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEn4c-00000006oQh-1bYj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 11:45:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97Riv084485
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 11:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OSEOlty1w4G0PIvTT1dv0PCa
	ahtC4/jkfebraYruQdc=; b=f+Ng/SPgYV0/VApKl6YYyO9YGSHsU3z0Q2RBtC+P
	UiZtdEPyRFWDNAsoNaf2b8tsnDdpDuSWf3WCsSVIn+MgaHepaX4JPbXmDJXw1XSz
	XS3us1ReB/tHS0hAgv4Dffl3nCK954nXS81UtTBk+UpJ0TZq3OI/49HhGKfXUd2x
	f6t3ON+5D3vaxgEbTe1TpLcelu442HeuCsaiiBQsK0Nrz77SMXUzP4Lo5ptaIXhM
	ODldoxylvSvlTVmas16TrTI/rmmaR6nHaUXWDznUbPhs3W3vjWXl18Tm2YBALshy
	VumfoIKgMCrWt14FCsvZ0pHI0Zzf2Jgwbm4mCsVZCaPXSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81ghd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 11:45:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so61967191cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776685552; x=1777290352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OSEOlty1w4G0PIvTT1dv0PCaahtC4/jkfebraYruQdc=;
        b=eJbbBrzB5AAY3Wu7sg/Hj+OH1TeHxejyEt+oFOURi0XDy406STZ3BWcBFQGE7jMCNR
         QjU52Gb3o1/fALNkCEqTztdZmrwaAWA4JDrX0fssS8wE5+LtT8kkYgXbg70xhBjADlxw
         8YX1giZL4EVR2pG6WDXz9f0UnA+rbydYb2sEIkZ4KI3+6Jpoy7Kg8L12jP4viWhbeY8D
         sxkFm8Bg47JPPYp7eHKH1Mta2offNFtE9zvZE4MaS0EG1Re+JwiIh2BdvujJnaUhj3qN
         wbKXIysO4MofhFeOrDHqTyrIyNHL7F7sDFuc90S8+pkNm4o+sXlvBAJwDPFDCUNT/zn8
         FtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685552; x=1777290352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSEOlty1w4G0PIvTT1dv0PCaahtC4/jkfebraYruQdc=;
        b=jFkP/wL3RL3LVQela0FzNmZQFl9jV+ZERqDFQ5+v8PGUEzsn74Vq1tCGHkbsO9LuJK
         gnQpufrWh52c8HLPMptVFBKbh/p1CCjIOrkfKj+vIKtaj1Q0wKhEt2PTpc32hgsTiuIS
         vg5U5jV0Q29aE3UYhAdW81wdF28El1BxVNnWtHi/YyGbn6B5y7qugfbQdrk5cRkVO6od
         ZYHTA4usAmL74Z9lXuAbFylyfg1AM8nGtvI8tNtRWMdhLoMG82tawDdLKCBFHp0wrmRH
         qrOyXAtt+T8rTenvzpO2oVjBti5euFyxJ23DjmrSZVYEYkKf7YhqMCKkLzQ8Y3J0ntU3
         sVxg==
X-Forwarded-Encrypted: i=1; AFNElJ9VRIbq5VbYDaNkrKgPVrjpNgOTfNq6A9VbRPUT5CPDlDzB6fot3rD8BAhwTb33euGRWgdt4HkZQWkPiUUJJ/Tl@lists.infradead.org
X-Gm-Message-State: AOJu0YxPh19cbKAOvEwYXHoX0rvM+iI/rZ4P5tGmQHQD9TvZKHAORLb+
	Ec1samN2UQ+pt5bJD8Wgm+cK1HGx2PYY+URFPT80YnS5kYTxd8tiTLAoTHwu3jq9/x9Ujt5IBhT
	P19pH91WryqbkwFG19YfqvRqDKycxyDPkz80lLWKdgjqAFbAcuEnc5Tcf9YyxgtayFnWm0bLJ0e
	vL/Q==
X-Gm-Gg: AeBDietcWZQruk9xebM7ID9iLiQ+95Fbs9BCqnlRHeF32xuAZWvP5mGpXL+eb2W2Qmb
	uDczyxRbHyvacMGCXxv68Ksr+1u/n2zsRamDrX+FlPsmwTBYxLaHLD8qx/eMN0Sfos6++QwEgE9
	5LYtlFFQcOZ4TG1KrlYuxANOdWlZpQUeK9FZmejjVE8gsXXO+lX/6W8+/iCYvQIuLmc/u3gjxHj
	UEOLSUcocxQR5kD/G9qMtT2t4eK/4FMwq6oZerlZ6sv7qZgtJR/GqzZQyfd2ybHi4FfVFXOzB81
	FRC9DX98w6JiAZRtJrRvpqEbC8o3Ay8JptN9FlYY3xWaFX/Vd+TaGNKn8FB2RnKTYY2LZbQ0r5P
	mcMsyTFL0JiW+slq3h/MPWzUI/QkG02fjb76nzP/auOBIEpI0KaIKJCj1uYU8t9b6yRG8KNBIgD
	pucQyACnm5MjJSGxxSEGwGocCElCwz5KTojwwA8C7hr4MtKA==
X-Received: by 2002:a05:622a:ce:b0:50b:3895:c22f with SMTP id d75a77b69052e-50e36b4ec02mr195511031cf.26.1776685551916;
        Mon, 20 Apr 2026 04:45:51 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:50b:3895:c22f with SMTP id d75a77b69052e-50e36b4ec02mr195510191cf.26.1776685551248;
        Mon, 20 Apr 2026 04:45:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7b22sm2874049e87.62.2026.04.20.04.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:45:50 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:45:48 +0300
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
Message-ID: <v7h3a5pwx32dfcumc3diysylja6lhkhobyzemfthb6dsadcxnp@2kkidnsgov4e>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
 <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
 <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
 <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
 <f74ecd0a-3ff3-45b4-935e-44b89cd0c92d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74ecd0a-3ff3-45b4-935e-44b89cd0c92d@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExNSBTYWx0ZWRfX+Tv7emS/Gf4f
 ToN2m2UJORHwI7Hbkg6qDM2p5xKxnO1NdT1dbj7KBiph+gYvM9/E3vhgYA4N4fP3uB/ohcb2FE1
 AYOPB3nGtqfkP9apvVY/a1Zw5ihTWjzTUOFO3AUzc9JJRATnyOMILaTITIP8hOrOFFHWA0l/DD9
 RDaDUo20td1chvNvLH9y3csxppj5fTulRca7J9Lv5joGbC/T/ZEGh6uIMFgQnvyDniszoTEq5D2
 veLZzhqFP5iUVDvKpdbCAn8USuv5xFey9NEG7ou0tT7LVvIU5v7xtJj1Ahh5vpZpO5NbmroORCU
 Bl+bArr7KJoNYJjH9FjybNjurCwg65rcAI/iA5QFYpHD87SNfCGOq+jqp4Y2AQEbXc//0uALBmV
 QZMJL6nhHlu3Yh1wDgRj0Ome1DKjuQJNQzW3MYk9qQNaDgTS0b5SupIrleLoKKyRE48SlbvE3Y5
 MXE6/cVTIDQIwyTwAow==
X-Proofpoint-GUID: Usi1hgmkgsACgDSJ3zwvPrAe3QLzaBsz
X-Proofpoint-ORIG-GUID: Usi1hgmkgsACgDSJ3zwvPrAe3QLzaBsz
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e611f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hvn8mZBs_W1j6JFEFtEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_044554_536464_C19828A5 
X-CRM114-Status: GOOD (  60.67  )
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

On Mon, Apr 20, 2026 at 02:01:57PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/04/2026 12:50, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 07:50:46AM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 18/04/2026 01:32, Dmitry Baryshkov wrote:
> > > > On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
> > > > > Hi,
> > > > > 
> > > > > On 16/04/2026 02:22, Dmitry Baryshkov wrote:
> > > > > > The DisplayPort standard defines a special kind of events called IRQ.
> > > > > > These events are used to notify DP Source about the events on the Sink
> > > > > > side. It is extremely important for DP MST handling, where the MST
> > > > > > events are reported through this IRQ.
> > > > > > 
> > > > > > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > > > > > events are ported through the bits in the AltMode VDOs.
> > > > > > 
> > > > > > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > > > > > events to the DisplayPort Sink drivers.
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/drm_connector.c          |  4 +++-
> > > > > >     drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
> > > > > >     include/drm/drm_connector.h              |  3 ++-
> > > > > >     3 files changed, 13 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > > > index 47dc53c4a738..5fdacbd84bd7 100644
> > > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > > @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > > > >      * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > > > > >      * @connector_fwnode: fwnode_handle to report the event on
> > > > > >      * @status: hot plug detect logical state
> > > > > > + * @irq_hpd: HPD pulse detected
> > > > > >      *
> > > > > >      * On some hardware a hotplug event notification may come from outside the display
> > > > > >      * driver / device. An example of this is some USB Type-C setups where the hardware
> > > > > > @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > > > >      * a drm_connector reference through calling drm_connector_find_by_fwnode().
> > > > > >      */
> > > > > >     void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > > > > > -				     enum drm_connector_status status)
> > > > > > +				     enum drm_connector_status status,
> > > > > > +				     bool irq_hpd)
> > > > > I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
> > > > > with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
> > > > > 
> > > > > Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
> > > > > If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
> > > > > 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
> > > > > for both short and long ones (although in the kernel doc you just write "HPD
> > > > > pulse")... The kernel doc could be expanded a bit to make it clear what this
> > > > > flag indicates.
> > > > 
> > > > I attempted to stay away from defining a DP-specific flag, keeping it
> > > > generic enough. HDMI is pretty close (IMO) to requiring separate flag in
> > > 
> > > If it's not specifically the DP IRQ HPD, then we need to define what it
> > > means. I tried to think what it would mean with HDMI, but I didn't come up
> > > with anything.
> > 
> > I might be mistaken, but I had someting like HEAC HPD / EDID status
> > changes in mind (or HDCP-triggered HPD status changes). But here I
> > admit, I hadn't checked if it is actually applicable or not.
> 
> Possibly, I'm not familiar with those.
> 
> > Anyway, for e.g. DVI or VGA that means nothing. But, my point really is
> > to abstain from defining someting as DP-only in the top-level API.
> 
> I'm fine with that, but then it really has to be defined =).
> 
> > > > Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
> > > > in the VDO rather than a pulse.
> > > > 
> > > > Anyway, if irq_hpd doesn't sound precise enough, what about "bool
> > > > extra_irq"? This would convey that this is the extra hpd-related IRQ,
> > > > but it would also be obvious that it's not related to the HPD pin
> > > > itself.
> > > We'd still need to define what exactly it means. I think it might be better
> > > to just define it as the DP IRQ HPD, as then the meaning is clear.
> > > 
> > > Also, would an enum flags parameter be better than a bool parameter?
> > 
> > Maybe not enum, but u32 param. Then it can become:
> > 
> > @extra_status: additional type-specific information provided by the sink
> > without changing the HPD state
> > 
> > void drm_connector_oob_hotplug_event(..., u32 extra_status);
> > 
> > /* DP short HPD pulse or corresponding AltMode flag */
> > #define DRM_CONNECTOR_OOB_DP_IRQ_HPD BIT(0)
> > /* DP long HPD pulse, debounced XXX: do we need this? */
> > #define DRM_CONNECTOR_OOB_DP_REPLUG BIT(1)
> 
> Why is u32 better than enum? So that we could e.g. pass short values inside
> the extra_status?

No, my thought was to be able to define values specific to the
particular connector types and to be able to combine those values.

After sending the email I started thinking about the bridged and
corresponding notifications. There having overlapping values will not
work becasue bridges in the chanin don't easily know the final connector
type.

I think you are correct here, it should be the enum. With the first
iteration defined as:

/**
 * enum drm_connector_status_extra - additional events sent by the sink
 * together or in replacement of the HPD status changes
 /
enum drm_connector_status_extra {
  /**
   * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
   * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
   */
  DRM_CONNECTOR_DP_IRQ_HPD = BIT(0),
};

/**
  * @extra_status: additional information provided by the sink without
  * changing the HPD state (or in addition to such a change). It is an
  * OR of the values defined in the drm_connector_status_extra enum.
  */
void drm_connector_oob_hotplug_event(..., u32 extra_status);

> 
> > For HDMI we might want to define:
> > 
> > /* HDMI 1.4b 8.5, HPD pulse */
> > #define DRM_CONNECTOR_OOB_HDMI_REPLUG BIT(0)
> > 
> > Or might not, 100ms is long enough for all debouncers.
> 
> As I read the spec, there's no usable HPD pulse in HDMI as such. It just
> means that if HPD is low less than 100ms, it should be ignored, and if it's
> low more than 100ms, it should be handled. In other words, from spec
> perspective there's no difference between HPD being low 105ms or five days,
> there's no upper limit for the "pulse".

Yes... Let's see. I don't think we should define any extra API or values
for HDMI until the need arises.

> 
> Still, we probably want to handle the case where the HPD is low only for a
> short period, so that we don't do a full disable/enable-cycle. We can
> interpret it as the same monitor still being connected, we just need to
> check the EDID again.
> 
> But isn't that just a drm_connector_hotplug_event with drm_connector_status
> staying connected? The callee can see that the connector was connected
> before, it's connected now, but we got an event, so let's read the EDID
> again.

As I wrote, I'd be more concerned with the CDC / HEAC / eARC. For the
normal EDID changes I think we are doing a good enough job.

-- 
With best wishes
Dmitry

