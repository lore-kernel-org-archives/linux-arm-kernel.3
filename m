Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664E6CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mRBPNmR1OtFkGxuqAKs88NJp8h9p2yjslNUV+/qzLE=; b=0lSoBwA8ITkDtrpcHxuyAqB83G
	O108eBvzBPgcvTzqpoqfll1bjYFRri5Le5VUv2imXwi79Il2vBB3ARc3LijD1/nZVYPguITjprgu2
	8yG5XCPv/tB53i33pGGaCrqbSGfAbjylCqiO/4W7f1+m72s1SBBFRJuEdQrRwrNuDRKLt593rO8Bb
	KVq5E3c1L4VxGsXXNgSiFZcm7ne1FTRblkemCZ9E5gcQdoaV8CokYp5VNwTHiVPOd9SPq2W2sD3fL
	RmRId8oAXc0LAMinWwwWU5Vj5hbl4ZS/VTdZ0JxjmbypUrF9OJ48byBtgkCEe0ZTumU1D0b2IFgJ+
	+ZX5dmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsnh-00000005D8d-2rpt;
	Tue, 09 Jun 2026 09:31:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsnf-00000005D83-1bTD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 09:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4mRBPNmR1OtFkGxuqAKs88NJp8h9p2yjslNUV+/qzLE=; b=mH8AirSv21gEd9cE7OLHOxd9mD
	nfg5vz8ZkXV+6POvaJhX1vlZdFndatn9DHUqCyMh78gA7oSlyMKOddrb/KDRjqwpdnOTSwro7IPge
	IRufxITNs6h/oEh6O2SxAb71LxOdgspz2AxhlBSAwkdwvIgHZM9lQ8ynZ7bTmtZP/J7WU1xlr3oNG
	2Btuf9NUZdcGgDWYyyVffVKIFZTrzmTyMLlMDj3VxlNccjZBubYAksWMlrhFF/JmMASGY2oizErnW
	yrLaIHFwiLdy0Rx1Tndb2TsdtbUuxxLTIqUSjoiYD7a5p/gbfR4I91jGeOZPoF7RZi0SGfQvdHhax
	QpWlrlrA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsnc-00000002FrJ-0N0K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:31:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 625AEC4FED7;
	Tue,  9 Jun 2026 09:31:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1C835FFC1;
	Tue,  9 Jun 2026 09:31:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2156B106A2ACA;
	Tue,  9 Jun 2026 11:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780997463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4mRBPNmR1OtFkGxuqAKs88NJp8h9p2yjslNUV+/qzLE=;
	b=xyprXdNFrB0MTFjyuj1yRt4FGoAYSUSksWS7Jm3cTcx0eI+zTv4/9QMmFUmHzFSeN7BfpA
	Oh2kQLxV4VhmWk8y0DUWCH6baH+UYkAyrIvn7YYbgM11mEVLLTWGlkdYw2/41Z7j/QjVmU
	SdeN2Sbpk8SLYhLbvz72roOjWsMh9PyH7lh+3HQ+ebMbgYEoxnx7m1Ac+ixwcNRrnqJOLK
	JyDVQ7iKg7ADJ1oL9A4wmAH/xPTrNp0Q1+gt9TINL4PDuyQFT0Xt35wOXZ6EIvzo2NK5ul
	6fM2APzJlzP/fZJYdVvX1U3vPjjxj6qK2qjA84MEZy71oY+zccv+Z83Ln3pMQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 11:30:52 +0200
Message-Id: <DJ4EWMIX84PN.3VTENLJT2FWDH@bootlin.com>
Subject: Re: [PATCH 26/37] drm: event-notifier: add mechanism to notify
 about hotplug events
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-26-45e2bdb3dfb4@bootlin.com>
 <20260608-maize-rooster-of-youth-c0bbde@houat>
In-Reply-To: <20260608-maize-rooster-of-youth-c0bbde@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_103108_288442_CF2FA06F 
X-CRM114-Status: GOOD (  13.54  )
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

On Mon Jun 8, 2026 at 2:13 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:43PM +0200, Luca Ceresoli wrote:
>> In preparation for supporting DRM bridge hotplug, add an event notifier =
to
>> allow interested parties to be notified about events they need to react =
to.
>>
>> For the initial implementation of bridge hotplug, two events are needed:
>> bridge detach (happening in drm_bridge.c) and MIPI device attach to MIPI
>> host (happening in drm_mipi_dsi.c).
>>
>> For this reason implement the event notifier in a new common file that
>> event producers can easily use to send events.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> So, you claim in the commit message that it's about a hotplug event, but
> the only events are the bridge being attached and detached, so not a
> hotplug event?
>
> And why a bridge would want to be notified that itself (or another?)
> bridge is being attached or detached?
>
> You need documentation, and a more descriptive commit message.

Yes.

But before that I need a decision about the scope we want to give to this
notifier. It is a very generic module, with basically no dependencies, so
people will try to add more unrelated events and we'd need to set a
boundary.

Options:

 * Should it be for hotplug-related events only?
 * Should it be for any DRM event that needs notifications?
 * Something else?

I'm happy to write that in the docs and commit message once it's agreed, so
any comments would be welcome right now.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

