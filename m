Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2F8C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WC6fCeHzO2YFdlPk15Xu0GzHqS0QytKrnHjk+4uw7Os=; b=XnqemJNej4uBxJSZarEC8MKUES
	ChziCBqt6tBuOx7uvYOvwZ6zqOCbODuEB+6yp6gaCTglDVMrZtC0XPBWoU3+jVSmnD6jKeioAy9NA
	/4lUPoPH4pOQDH+uH5tS2+jJOHlBdQuPgYwaTwrmE948u92d/AjXtD/gwiWC/Tpd+S/+HNXzU2xRv
	FdQt7u3CYeXiElcqR1qoK1x25c4x02SRsaldnqh7P7tFeDcNzLAs5Qzf3FBLJqouEmCkDCzBt6Ixy
	bUhirobBmSWCa6A0tn1QOV+cGvsrKHZUrzAbax1BiIJbMpecyFmUm5+esUWVF2dBLVUcfzRoYyQ77
	M3i89llg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRoK-0000000CCky-2JDr;
	Mon, 10 Aug 2026 15:21:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRoG-0000000CCiu-349V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:21:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B93E91A1533;
	Mon, 10 Aug 2026 15:21:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AC1E6033B;
	Mon, 10 Aug 2026 15:21:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4959311C4AA3F;
	Mon, 10 Aug 2026 17:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786375255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WC6fCeHzO2YFdlPk15Xu0GzHqS0QytKrnHjk+4uw7Os=;
	b=bqet2n2eP01Bmi288gkUVzylwxbpg3ZQrw9Kq0FnLM7kTlLh+c2GNi9QYK6sN8b/A2VwPs
	x+xyJBOhN3RRqw8kJO9SlYlu8pnvdEGDWbsazcVNG1AwUqm9iqOAdrGsgsAcySocVEaOdX
	aSktSJweJ0ag281Q5sMXmAMxWhbdrq26pVL96m+VonY1iNSIEARdhlMdvvY7yCMEViXZ4w
	Vy474LqWOjj6OPv5it9IyLI7tWIu0qtvfmiscXVWrOVbNJxUE21AB2cFcvgeJj9L0DY1Xz
	SA8vTV3K5Pfn0Zn3phovy+e2J76TxVbKpHwlGqqDj1bNrnFRS00tR8iO8IPbDA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 4/5] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260707040613.1992841-5-damon.ding@rock-chips.com>
References: <20260707040613.1992841-1-damon.ding@rock-chips.com>
 <20260707040613.1992841-5-damon.ding@rock-chips.com>
Date: Mon, 10 Aug 2026 17:20:31 +0200
Message-Id: <178637523124.64950.4597468269792391025.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082104_912557_FEEDDB8B 
X-CRM114-Status: UNSURE (   5.58  )
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

On Tue, 07 Jul 2026 12:06:12 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> Add validity check for samsung,lane-count to ensure DT-provided
> lane count values are specification-compliant.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


