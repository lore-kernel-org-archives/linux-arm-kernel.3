Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D19CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjpGKGMwhhYWC4bhK9Q7/5ATQeU5Nc+8MUNjg9tvLOo=; b=KKd7ec3Ok8SoQ5MlwcAumTMGqm
	YcOJGhDnGxXZ5MuoA7eRcAWbp+PfcHHMRJrydkWs1Av2IfibMqI1nbVuDayMQPytX3uyOCRSQ5Hja
	8Qmr9ItZwXXFLth2N6oHXTRHsvExJWqrYjXfBzRN0CaKDVnq+sAz80/OBkBTORQdHRGCT/q1gXV2W
	ZPt1RooQi2zYQhKS601AUeAnShz1EYmD0YmmbPeGpNKmHlSTfDs+WIZobfMMjxBrV+1oXZ4OOKnUt
	+9jbsHt3KcBB+m0L9B1nzJaWP6II/ODLEO2pr4vWpbp8AsOWQmaCmrzw+C7lPjxXnnpAK8udADnXx
	8AkVlS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtN-00000000x0B-2bJC;
	Tue, 19 May 2026 09:37:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtJ-00000000wwG-2xi9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:37:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A230C2B9DB;
	Tue, 19 May 2026 09:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 578AB606E9;
	Tue, 19 May 2026 09:37:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0770107E89DF;
	Tue, 19 May 2026 11:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779183448; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SjpGKGMwhhYWC4bhK9Q7/5ATQeU5Nc+8MUNjg9tvLOo=;
	b=WZo9Xvhj0ZgMzYD4mB+BuQSkBsZboG5CVc1aJewjda3gQ2ii7Qv/qmKWcm8OTtOvvcLKDh
	9HYKHw8bqquvHKQuPjdUD2TGHjZzoGSz8hsGjMNH9Bq71S/Tcm+U7jeDkb7cXtMwb0dANL
	WyDgwgC49G/+EINQgjeE8bPxifoZUjz5rhA++q/kJufzQtv0LJz0kRBXXEED1iSttNKGjj
	JUjhBbbivPxFAmuAT2ZZ3zxH2F1iqAmysvw66T7zFBItivUWxEJIMaxI34B8sDcAwQRH0H
	+6+cFqaQzJckGhn0U86wdZtkKrMRsHvGAfugiEU1QEb4tFDyY5HCTrfzyTnsLA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
Subject: Re: [PATCH v6 00/11] drm/bridge: handle refcounting for
 bridge-only callers of drm_of_find_panel_or_bridge()
Message-Id: <177918343743.380323.7834378536206184727.b4-ty@b4>
Date: Tue, 19 May 2026 11:37:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_023733_909843_B47632FB 
X-CRM114-Status: UNSURE (   6.96  )
X-CRM114-Notice: Please train this message.
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


On Mon, 11 May 2026 18:40:04 +0200, Luca Ceresoli wrote:
> This series converts all the bridge-only callers of the deprecated
> drm_of_find_panel_or_bridge() API to a new, simpler API that handles bridge
> refcounting.
> 
> All patches acked/reviewed except patches 3 and 4.
> 
> == Series description
> 
> [...]

Applied, thanks!

[01/11] drm/bridge: drm_bridge_put(): ignore ERR_PTR
        commit: 55bb2b137b6d72b3281f70045d9ee5a087df0aa4
[02/11] drm/bridge: add of_drm_get_bridge_by_endpoint()
        commit: 03d1078112fddd706b2c1e4a7d98cf18700eb5df
[03/11] drm/msm/hdmi: switch to of_drm_get_bridge_by_endpoint()
        commit: 5e6016294c16f8975391497037b207ad5d2a71eb
[04/11] drm/hisilicon/kirin: switch to of_drm_get_bridge_by_endpoint()
        commit: f85a3590e31ac7d78dbb62ed617d50954f5ffde6
[05/11] drm/bridge: chrontel-ch7033: switch to of_drm_get_bridge_by_endpoint()
        commit: 7783fc059457c41f641b490e6d0d23c33c8fa89b
[06/11] drm/bridge: lontium-lt9611uxc: switch to of_drm_get_bridge_by_endpoint()
        commit: 91b42aa55c7777545e528bbd991fadea5c561d46
[07/11] drm/bridge: lt9611: switch to of_drm_get_bridge_by_endpoint()
        commit: cd9517f6e2093a4579f8a37ca66214eb34e9cd04
[08/11] drm/bridge: adv7511: switch to of_drm_get_bridge_by_endpoint()
        commit: f08eff4ad2873960d03a3834c04b86bfa4cfcdcb
[09/11] drm/bridge: lt8713sx: switch to of_drm_get_bridge_by_endpoint()
        commit: 898a5e07f7e39d771910fcd9ba73ba6e533f9283
[10/11] drm: zynqmp_dp: switch to of_drm_get_bridge_by_endpoint()
        commit: 62f1a79e1b004b250e68e10c32a29fd954fc9725
[11/11] drm: of: forbid bridge-only calls to drm_of_find_panel_or_bridge()
        commit: 0d5da248ea2d7802a5055ab6762340ac870bd0ee

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



