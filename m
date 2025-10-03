Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD4FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DniS63K40mZp/zefKvHAEKMgyEYOkDSoRUV3MskhVNs=; b=mCyq0/LF+fPnEEjvuRj0chM5SL
	A9UTs+86TEFcqAyshwm8lldB22SwnbyYNcexGGr8olVdN+4rl/85uAmsorvAQQqXQtfRbM4DrtWCa
	0cU3FQgMqQA4N3FNCgBud/DKgb6QoWZoUPPeNHzdmzyXXn5Al8uq7ymWjHIwvJ3GeBa7RtBJJRsSO
	8f2iq2tKFGfpJIJxKKYLvt3/TH17xlnxgnzV2JOyAxUD/uqUsWpuEFZ4TI1oE7AD65RVn9LCzjgtf
	O6Jj7woOYpYPTJ8ehZ1EMxVhfUXn1qTQzdf4QyH7SKm6EHWkQba1pwtt5OZzXNNO+LD59VQx//dJx
	X+57hfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4aJq-0000000Bp63-2aAX;
	Fri, 03 Oct 2025 07:35:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4aJn-0000000Bp4b-1iuk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 07:35:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8F4DAC00D9D;
	Fri,  3 Oct 2025 07:34:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 865FF60683;
	Fri,  3 Oct 2025 07:35:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B157102F1C25;
	Fri,  3 Oct 2025 09:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759476901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DniS63K40mZp/zefKvHAEKMgyEYOkDSoRUV3MskhVNs=;
	b=UOuzOIjMWBTMrpGD/VHIltalTbABDWzlzm/0eWOj7r4d7cathtY0DLrjIYc2gZmOnWxme2
	u68J4G+CKIlcGLbDAXifRgxNS2/9+l/ZuO9baNqTeNaLPa6Xb0Q4tQ7RMVEEJmybvzK9DR
	weJ6wE9ndD7E/6zeWFMVOigjQqZCx9cG6gkt6eh9ziaE6SZ+UNuHEtazk56voORfirupVx
	4zVOLDxqDX9mhs7kTn4iu3Mly2bdrECTlw3OinNdGmNg2kGi3wz56AuDyih1hktbTkDWpG
	48ahzOit15uRdHOgWYOWfUsSFhd0yVupBDWZgv5FTrpVvfCnZR6Q3tf9EJfLEw==
Date: Fri, 3 Oct 2025 09:34:35 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <20251003093435.415866c7@booty>
In-Reply-To: <20251001180922.6bbe42ac@booty>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
	<20250930090920.131094-12-damon.ding@rock-chips.com>
	<20251001180922.6bbe42ac@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_003507_626502_EB2253C3 
X-CRM114-Status: GOOD (  10.84  )
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

Hello Damon,

On Wed, 1 Oct 2025 18:09:22 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Another thing to note is that this patch conflicts with [0], which I
> plan to apply in the next few days. The two patches are orthogonal but
> they insist on the same lines (those assigning
> bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
> comes later will be easily adapted. Just wanted to ensure you are aware.
> 
> [0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/

The patch I mentioned is now merged on drm-misc-next [1], so you'll
need to rebase yours on top adapting the changes. I expect it to be
simple enough, but don't hesitate to ask here in case it's not.

[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2be300f9a0b6f6b0ae2a90be97e558ec0535be54

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

