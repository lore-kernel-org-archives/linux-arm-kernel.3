Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A7CF43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJ5VTzzADEOQOXFJCPdSyMCR8UJZ4vCLNXaTwf7HcDk=; b=Gu5Zz+y2ntBRe59U3CRUHIrzB/
	Iy8LM7ykW9Dz4r6ElVLtpUsdf4dVyXWDT1+Eyv4ZXLqoxJEtV7SwjiSn7XeDAUpWp5Gzu8TJ0ae/E
	z4PIoYUUtopju9vo2zsfMZpulpVoVSJvyZ/p4TlgeM4cMfXqsFyKZV1MswTerKlMyeUjLYNu+hlAL
	HnqJx/ytsSHsZgeulkjxM0xX3rP4ld5qNj/LH3X/ed1l7bmxsN7CB+AJBiKkerT9bSvJAGSTmB+VT
	51843mD+pAwXkxHeWr8N/M8e6DpwLbIOPSZczHobJomP4SuGkMvd2qoUJF4P+GDJ78SX4L3EAPbTS
	MZmDwgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfWB-00000003paz-20uG;
	Fri, 17 Apr 2026 09:29:43 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfW9-00000003pZr-0BLF;
	Fri, 17 Apr 2026 09:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776418181; x=1807954181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qC+sy+TbfVbQqd4P/J3aO52mIqEN7Qgp8Zj1bnODJ7s=;
  b=Ft0pl/vy2q+KW73rsgQuzyPD9nZjuFSd2p74NTd48QCvguzi6YYh3aZp
   rzC87BEbOt88tQDJSlY5S/A5sTOxkFDc3XqTQgfr0mo/Pcn1LfmufFKL0
   zOqcEPY9QJ6vVZU4iX+i70k/QGUY3ZkLsGtjKFfD0sG7I6syYyfe7lEyl
   whquEnnNEI1RS1GNTpeZI2KYYwyuUFG8U5CHXcsAirzWDzwiWYi7LxiuI
   Yv+/ft5CWeRtRBYPGL3HMdJXtT6SeEqvUzbF6p/Q1TBnNI9XpCNG6/tL8
   xdmdD4vO5ugW4QZ3a3iss5GK5ES+E59zTeIGHQ3TXWOe8sUPxTbeh5KTF
   A==;
X-CSE-ConnectionGUID: D62HofagTmeSy4ERIpD8cA==
X-CSE-MsgGUID: SWb8Ue3ZRrOR4rFNReJlSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77550741"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77550741"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:29:39 -0700
X-CSE-ConnectionGUID: 5lmnra43SHGoKNY16mjc4g==
X-CSE-MsgGUID: gcHNK5CaSOWz7P7ldgMCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="229980212"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2026 02:29:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id B928F95; Fri, 17 Apr 2026 11:29:27 +0200 (CEST)
Date: Fri, 17 Apr 2026 12:29:26 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [PATCH 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
Message-ID: <aeH9dpLv-ZVTfhty@kuha>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022941_094636_67433A2F 
X-CRM114-Status: GOOD (  13.90  )
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

Thu, Apr 16, 2026 at 02:22:37AM +0300, Dmitry Baryshkov kirjoitti:
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index ca749fde49bd..328ba92e1b44 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -299,10 +299,11 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
>  
>  	/* UCSI callback .connector_status() have set orientation */
>  	if (port->bridge)
> -		drm_aux_hpd_bridge_notify(&port->bridge->dev,
> -					  port->hpd_state ?
> -					  connector_status_connected :
> -					  connector_status_disconnected);
> +		drm_aux_hpd_bridge_notify_with_irq(&port->bridge->dev,
> +						   port->hpd_state ?
> +						   connector_status_connected :
> +						   connector_status_disconnected,
> +						   port->hpd_irq);
>  
>  	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
>  }
> 
> -- 
> 2.47.3

-- 
heikki

