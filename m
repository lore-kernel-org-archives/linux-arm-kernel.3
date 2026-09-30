Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C24CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcZCpP6kxzypYHCcA9Y6Fe3LYElLJlu/QUBiiAX4hj4=; b=HtlLPMh5nocLt1GNHRixUYS9E0
	1ybVT3ab/hPaIyUqKip9nkrygSSWTc3h9z0qerpgCa6I3rny+ovvaGoVtIOODs6YEfWfrXIocmEwh
	TGe1KF4kTvZNL/TI/sGOBzOHfflfVOJ7iCaw+2hH2D+20rNO9NCoacehCpRnK/a8e+vdWESv4NhcL
	gFIoBX8T7HgC6+zN4TSB8rV77HBln1nWL7SQ8yyfP7j62gXmJFUt7acMf096HdKYNQjVUj5KbUPHT
	NrTbvL6wDVejj4Ul6Y8mAPPD9FhjMfLbfKeNxV8I2sG+hcAZPk2nK6peUzOTLouYfWhATYGmluchw
	tHF4+4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr6Q-00000005dkx-2dR0;
	Wed, 30 Sep 2026 09:59:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr6O-00000005dkZ-3kUe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:59:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3163960236;
	Wed, 30 Sep 2026 09:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1631F000FF;
	Wed, 30 Sep 2026 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762391;
	bh=fcZCpP6kxzypYHCcA9Y6Fe3LYElLJlu/QUBiiAX4hj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QGCu08CWmtyZAgsSl1TpA6dkctpRNZV+QllHJYvd4QS8MUl94IqF7qEqzIWTUU1Le
	 Ub5f1uM90s/YBo0sQ2jKgpDAnVQwU37bZJBdP7yBnFXe4I7m3pQWtauH/KAPOXntoQ
	 e6sC+nF4CrDJWI++BYDBWYPc3+BRJmIaga7Y/jKeEqKi/DErLH9x5SMcCvKQ4lYNZL
	 Dv9dJ7jjxyXz2E9snzDpREL6VA2pfukWkoNWxv4IiFV/Suq9FcdifrZK8f8PTWSXz1
	 za12emyXxvN0ods8cc8s1xVz+ziAwXFLLjTnMtEuzOareEgaGXvkWrt4jKlltIqcCS
	 xclPFzKydafrQ==
Date: Wed, 30 Sep 2026 11:59:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, Robert Chiras <robert.chiras@nxp.com>, 
	Tim Harvey <tharvey@gateworks.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/8] dt-bindings: embedded-controller: remove
 #address-cells and #size-cells from required
Message-ID: <20260930-light-whippet-of-fruition-faf077@quoll>
References: <20260925-cleanup_dtb_warning-v1-0-f999fafbca60@nxp.com>
 <20260925-cleanup_dtb_warning-v1-2-f999fafbca60@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-cleanup_dtb_warning-v1-2-f999fafbca60@nxp.com>
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

On Fri, Sep 25, 2026 at 12:37:51PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The "^fan-controller@[0-9a-f]+$" child node is optional, so it is not

Why is it optional? Hardware can be fan-less? This should be the reason
here.

Best regards,
Krzysztof


