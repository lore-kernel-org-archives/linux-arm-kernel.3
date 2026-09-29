Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A793CA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHgcVzckw7J9hKLtbO0xprD/AIvMCE5AqxCP6hOVswI=; b=wo2xCrfV1x915Cbrrc8dKPTuMC
	ILmW+rssxKqWDcuNLKu6t/T+suP9PIs2pu3lWUlVbsuGwwtMQwW2XzaU7oia7iNersXgwmHoZWakC
	sA+yMLtG/0E6ZoYu7Ryw+O77zfst+kAeJFHbDIsFJnqKjQrQ8KnRu0g8/nqcmU6+DmUZASQL9rvOG
	EYb/tLRnJjR3NOyMhasG3MeyWS5qRhWzzeOiqag/lJV76/CSmuKNTJclfEEEitElL0pLm5nfb03Et
	sylNxQu3LY0X8y5Ix75Is08WOJZIfp5lpNvd1uECyT9KdlaJeymJFR+e3s20eHj/bidDcs/mBtfWq
	M8pmkOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXn5-00000003f5V-2lpL;
	Tue, 29 Sep 2026 13:22:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXmv-00000003f2Q-2WP4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FHgcVzckw7J9hKLtbO0xprD/AIvMCE5AqxCP6hOVswI=; b=CrrOYBzpeH2pHiXndPyKdWeVK2
	hsOvoCjch1aK5N2mAnGmlckDBjXNJg+X3C3RCmVJ8kcX4PP++TAU09gTyubF51rAzwTl0OfOH0Ef6
	sZDrRTrzrpMysMxcFAjCABmGTma2XzrtckJYSWIH5RldGvPrLZVnEqX20Fyh3yjkdoTIBw+o1tGoz
	8uQMSifRBB7OYUgmf4AKddxMqeGRQgCpUdH67v+yZX3pfpdaZ/HAXZ2iBSGabBVXNrd8qvg7ewsWp
	wsCOzKJWNe2MDvJaGPxtBW+WUkZvxYoiLjXpRBiQIVqTeEmInx1c/r5G/JLQuYrVtu4ojyXbjFvwP
	E31wL6QQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBXmr-00000002fji-0sa8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:22:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 24D251A1065;
	Tue, 29 Sep 2026 13:22:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3F04601BD;
	Tue, 29 Sep 2026 13:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4324103297BB;
	Tue, 29 Sep 2026 15:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790688136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FHgcVzckw7J9hKLtbO0xprD/AIvMCE5AqxCP6hOVswI=;
	b=rREzCYs57TauLcCmyy1DL91h0dU96/3qi9aWRsbrKpBJlyYKn6+1p4Z1Iq1IzIeXXLaXTa
	kkq1+U5xL+3X0/gtmGoyBH4m0XubttAXozmLBSL+g25FBjPSnoKpZB3TrzUOClghvgRGVi
	w8kR6pqXnhXOG9/9zVP63yGDrFQq7PddFN3sovGRXnWKbiOHRb+l1kWChR17B0l039IF8A
	JClQQixWJXQHu0hfr4dEsBEiQeHohjDiBjWnjNeh6BVE4ggU9ypyfSYmUgQUa6GIKdEb2m
	p6Sf7W5UZ41wK7GFTTlY6rTaRLw3QYtRRD7DU9JLVi2OFD+Xb0p2Nbt4SMIefg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 15:22:08 +0200
Message-Id: <DLRTYPGLOGLJ.1RWIVEF7K6OCB@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Doug Anderson"
 <dianders@chromium.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
X-Mailer: aerc 0.22.0
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com> <c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn>
In-Reply-To: <c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_142225_405513_C6541F9A 
X-CRM114-Status: GOOD (  12.67  )
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

Hello Icenowy,

On Tue Sep 29, 2026 at 12:46 PM CEST, Icenowy Zheng wrote:
> =E5=9C=A8 2026-09-29=E4=BA=8C=E7=9A=84 12:36 +0200=EF=BC=8CLuca Ceresoli=
=E5=86=99=E9=81=93=EF=BC=9A
>> After commit Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code
>> to
>> drm_panel.c") some drivers fail building:
>>
>> =C2=A0 error: implicit declaration of function 'devm_drm_of_get_bridge'
>>
>> This is because devm_drm_of_get_bridge() (and drmm_of_get_bridge())
>> have
>> been moved to drm-panel.h.
>>
>> The affected drivers are those which:
>>
>> =C2=A0* can be built without CONFIG_OF, and
>> =C2=A0* don't include drm_panel.h
>>
>> The affected drivers are 3, fix them (patches 1-3) by replacing the
>> deprecated *_of_get_bridge() calls with
>> of_drm_get_bridge_by_endpoint().
>
> The comment of drm_of_find_panel_or_bridge() still suggests
> devm_of_get_bridge(), and the documentation at the head of drm_bridge.c
> also mentions it.

Ah, thanks for noticing. I'm taking a note to fix this later.

> BTW should drm_of_get_bridge_by_endpoint() has some drmm/devm variant?

Maybe, but not sure, as we introduce hotplug devm/drmm becomes pretty
useless and even annoying. However I haven't checked all the cases, so we
might reconsider this idea as we start converting more drivers though.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

