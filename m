Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A316CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=; b=YCO8/sMeGKe7Wt6zoAs2L4avwe
	TixwLULJ5/4tx8LKGArt5043zaBu9X/71EQN7m/hFdr1U633e4QY2QYzUHy7rLvgVa6q3EcD73kSb
	jH0S4OmzYcRQxmuBQKkHkKKhVI+yc/qDxzPocQdv9mkOOjeHpr/DlSZVUH0COp7qdI4YcMcDeJ4UX
	yNweGaW7qUb/ziJKSG5jWDjQ6VzlZSMTBLw8l5fWP1WovNBmcG0pRJ5thG52O7CVdNFBO0SW2mSmZ
	RIX8vyyzNXOWXqqIn4QGr6k2VgcWSWCIrRMDUZbAZkGAPmughsjW3vjTNNoswSQ2uZ9P/jjCNXbb4
	EW5odAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPg0o-00000004YRZ-2wFN;
	Wed, 20 May 2026 12:27:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPg0l-00000004YQP-2hWO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 12:26:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nR7D446688
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 12:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R2TeQqks38QIoyDMGjnlHZik
	TcCtv1Rua8ztzIrSGMs=; b=IEL3c5PjqWlF+XsnVNBCelp1TMrAsAl6meLx5Fpo
	Qr75sMcTLEqvMdOoHpU+OYtP9rhIOv8nIPX2wfHkYe4nimwsj6eonlhLInzGyoGl
	oVbmLIkw1KIBlyCCv2dRGadc3GEqceUukay8kCYuJCqZoEdQWqv7JKh3rokRh08w
	Uw9B+rDuloBd2LhhoKtrHOmBshYeaAUnYl5ZUQrOOdDMV4niA2Ik+YRqg/JSVkE3
	E569Mg7PhhYWhMWuS8uuPG91zGmYPDzSEjVVfHeVMZ/bqIpFWEmQfMJzWK0Y5oxS
	Hh9rAA455ZRtUUTKQxNd6bvmZcDtMzG4mGTNObVxK1Q1SQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrgj8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 12:26:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-956732444ffso9184603241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280013; x=1779884813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=;
        b=UCdj1uV9lMTrXd5nQlAlyzC1Q1KWO8sw0OtJxTjEbLPwyDVIk+70IKC1yPZfGu4rq9
         /6W+cwq9ZeVqXPjN/uwfUf3S2VLebC3wXEerOiWYQyJpUYSHEE+NGkgFteE6ZcgRpLob
         UbcaCzbMxqCe2r4pK1RSTqrft4YSxE4rbfpqoj/406mfXEeO+/PXZfVd2KXp3uVCBCjK
         +2Ok8bMvu8RN/Z04HszqJNeGlppmnI4Xx0Fw8PMlfotjcosp3tCxI4y91cHY7adGtrfZ
         ZAfr/pTy28lapyMjEnEGZnjg9Nnb6j6Tu1JVq6GzW8AsZgLp/J03PyMX9sU+5HKZt3Hy
         Sk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280013; x=1779884813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=;
        b=DGeonG+zLm3PEF0zBkFvuTzEZK2GQna2tA2Umr/ZSW8OJk3ZpaDzU6ofxGTNvrc7t6
         JvrL8jcOXQ6ZyoXsT9EfHOGA5SwXHcwdSIy6IlNHScj/C455BNZdNycWTJVJOIepwA+K
         U9Sl2ueS6xwQAxaEDohM44Df5Cbdsr/9IpAuKVw+u9TYCg2zwlhr1+sQuzrI4Zb1bu2M
         qgeTN+1Q/k+G7GkAhYX07Jx7DDlSecSWh4lvBZlhYYu0h/ujJM/ntVcyAl643DESAcDK
         IpWhJbsOwFQDpsA6p6EXzPdjHqvrO3L/fO0a5Gq6Idb7nTgjLW+MzBzVjJVdSbEgv5lR
         VsIg==
X-Forwarded-Encrypted: i=1; AFNElJ+PJLm1Jc7QrKlo7qxWLR/3VuP8btSVef9AzfGs7v7g6m9vH+jAjapkmS5T1xCqT2OAs7wCwvYkYY7GShqurcvw@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3eHRK5oXuAT+GD/jAcio9yV7H4OAJ0aSLT72I+e+6p61QYUp
	c2F+Q1b2J6/jxaJhVh3eZ61qbCFsgq5OmtY2wHZ9uII2xhT0y+KaKEsCjVmtP+DxMou1wccAgfC
	vkJBm0uPMvMGsPZ9qnRMNPaJIwoSvQpABqyY+DdU2JN7f0I2+WNheH7mTFvfHSlock9gj9huRVM
	Kb9w==
X-Gm-Gg: Acq92OGyl6K2xJWD//qVbbUIpYblizPSSg7OgCU5YastnBXDas0OfBV52SQzrEWmdrL
	fYtuA+Oh9R+YlNa6b1sUbTvoLlaqRqSIZxltyC3Aqajtj0CXT2+YvTRQxh1lMhMxv5LzNTBZLDq
	qqemJGcrwNaSBzyak4an1lWpGh/Kheg+Q0paJyKpVr7HFP/r6qyWoTydp9xsKhUOflHl4ccwTvN
	cmuOdMIkQkpPoV7W9h6SrjvPSxyM39hKGjvS7AYafGBeysUXLNwUrCVMxAgSB4sIwTIJpSTAE+h
	saduk6DVRwXvIfKyCmZKj2/pZADsmfofhHeXn+ow5N/KMogJEIkmfJeUx443Ikp4G06bypy51Ct
	wRT5pRDA8GI3iE9e+VIntwQNzj6j8jnNAARByycZG1rr3STnkkOOp05vOYMKqqEWDCu0/0o+/tj
	g7nGxaOloSINMDCHvyb2SGdOpUn76woAj3jh0=
X-Received: by 2002:a05:6102:5e86:b0:633:d7ec:153c with SMTP id ada2fe7eead31-63a3c801ffemr13878864137.3.1779280013339;
        Wed, 20 May 2026 05:26:53 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:633:d7ec:153c with SMTP id ada2fe7eead31-63a3c801ffemr13878848137.3.1779280012801;
        Wed, 20 May 2026 05:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7a0sm4868217e87.24.2026.05.20.05.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:26:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <vvlw4f6xo7krq3xoyxuoaa3tecrgduw5qlujp3qf3zzibzjesv@demhqzadavql>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
X-Proofpoint-GUID: t0R0cdQ7e5PQu0dsYyYv1zZr3SFPgQxI
X-Proofpoint-ORIG-GUID: t0R0cdQ7e5PQu0dsYyYv1zZr3SFPgQxI
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0da88e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6jUhzznPuw0D9V4-6sIA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMCBTYWx0ZWRfX2VYT5J/8PKQR
 cb71lD/vXyD8EijmtCoCG6+FMgkZjLskNY0eFe1VfFQYIxx2fCF105N7m4gSVQkCX/IT6P2lFnm
 xRn2J8nc06TJyIUDFOtAbTp3ueB1JolCuJdEaWGQz5O4e1k616wsL8OeFfLs0/Toh6ghjkGWHaa
 OuzC7L5Of4KklF1/bCDUBdWF8BzDQpI3TtywelfunnoCWrU99F2aZx4S/Vyx79ExnqPg9K5D2JT
 8rBTsXfrgsU3F9v828HreI5cp9zGnUFY3dIf4uUDQUplo2S2qoGcIAHzuHEYy2Ns3O4OJfwL910
 5hAcfl9v2EmuUjyDMLbyLBm+HL+AOxYgiTEwlRg8BYgNzg/DWQfX1bEnu9AxnXY/2iRXgyzjveT
 lfyk11FS1B0CqVq4wCKtM/WH94CQKozf0bATG6nMtzWpqyhGhf6Y2gooEpcMFYTAPxG/cgup3Y1
 S5NPbwA29plLyI5PxKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_052655_810817_7CA4B6BC 
X-CRM114-Status: GOOD (  32.65  )
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

On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
> 
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are ported through the bits in the AltMode VDOs.
> 
> Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> events to the DisplayPort Sink drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c          |  5 ++++-
>  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
>  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
>  3 files changed, 33 insertions(+), 6 deletions(-)

Greg, Heikki, would you please ack merging this through the drm tree?

> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 47dc53c4a738..edee9daccd51 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>   * @connector_fwnode: fwnode_handle to report the event on
>   * @status: hot plug detect logical state
> + * @extra_status: additional information provided by the sink without changing
> + * the HPD state (or in addition to such a change).
>   *
>   * On some hardware a hotplug event notification may come from outside the display
>   * driver / device. An example of this is some USB Type-C setups where the hardware
> @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * a drm_connector reference through calling drm_connector_find_by_fwnode().
>   */
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> -				     enum drm_connector_status status)
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status)
>  {
>  	struct drm_connector *connector;
>  
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 35d9c3086990..7182a8e2e710 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  	} else {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						hpd ? connector_status_connected :
> -						      connector_status_disconnected);
> +						      connector_status_disconnected,
> +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
>  		dp->hpd = hpd;
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		if (hpd && irq_hpd) {
> @@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>  	 */
>  	if (dp->pending_hpd) {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -						connector_status_connected);
> +						connector_status_connected,
> +						dp->pending_irq_hpd ?
> +						DRM_CONNECTOR_DP_IRQ_HPD :
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		dp->pending_hpd = false;
>  		if (dp->pending_irq_hpd) {
> @@ -397,7 +402,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			dp->data.conf = 0;
>  			if (dp->hpd) {
>  				drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -								connector_status_disconnected);
> +								connector_status_disconnected,
> +								DRM_CONNECTOR_NO_EXTRA_STATUS);
>  				dp->hpd = false;
>  				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  			}
> @@ -827,7 +833,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  
>  	if (dp->connector_fwnode) {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -						connector_status_disconnected);
> +						connector_status_disconnected,
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  
>  		fwnode_handle_put(dp->connector_fwnode);
>  	}
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f83f28cae207..e05197e970d3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -91,6 +91,22 @@ enum drm_connector_status {
>  	connector_status_unknown = 3,
>  };
>  
> +/**
> + * enum drm_connector_status_extra - additional events sent by the sink /
> + * display together or in replacement of the HPD status changes.
> + */
> +enum drm_connector_status_extra {
> +	/**
> +	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
> +	 */
> +	DRM_CONNECTOR_NO_EXTRA_STATUS,
> +	/**
> +	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
> +	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
> +	 */
> +	DRM_CONNECTOR_DP_IRQ_HPD,
> +};
> +
>  /**
>   * enum drm_connector_registration_state - userspace registration status for
>   * a &drm_connector
> @@ -2521,7 +2537,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
>  }
>  
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> -				     enum drm_connector_status status);
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status);
>  const char *drm_get_connector_type_name(unsigned int connector_type);
>  const char *drm_get_connector_status_name(enum drm_connector_status status);
>  const char *drm_get_subpixel_order_name(enum subpixel_order order);
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

