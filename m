Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E39CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+RgpsLYw/cPjp2ruDkjJ3jO1w+pGqvDA6P4mjEpeYQ=; b=0jY/dPPle4kqh8nc4DZ/8mqvIF
	AMjktvgdGdwgbS6yRgEfsVoavg+cUcnFmNBWnlQGRKZfUP9v9B7IPeLgSo414HbUrdu95QopNJVsA
	y8itweE16BP0NbC56JjsYvUZOj0DPeqPNoSfhVI38uj7MUcKWv1b4yr1iczSOhSevcJj/hKs61Cbd
	45yb1DdrSgMq1wut9Az6/l32vDEPIy2Cmp5S5gl5dq8cnGLgKgLIPF0jcCZ9TrdZKfHi98azJ9M4R
	dHwviHRZIYYO6dE+hMPNjq8BR3BCnOmR5bk1r+QY2Qu0hhVcEGmu2AG1D4hp+J3hSSUfmqdgqTL3c
	TU9U5e9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPoy-000000082eE-2jLe;
	Wed, 24 Jun 2026 15:47:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPov-000000082df-0rOM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:47:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 634231A0913;
	Wed, 24 Jun 2026 15:47:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2AC9E601C5;
	Wed, 24 Jun 2026 15:47:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09C53106C8415;
	Wed, 24 Jun 2026 17:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782316037; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c+RgpsLYw/cPjp2ruDkjJ3jO1w+pGqvDA6P4mjEpeYQ=;
	b=a+dRWHPDzwJTziT6FjhVvOnUCL54shbP9/BKbxIIBc8eYUwCjAXpNVkY3/NkoOEiK/Nlgt
	/ghAhu8kFbPH6Ul5I7wFxxI+bIuPOfcTeE7/EqUZZinIbhVhGekWMvImQ2qt8XX0+3P1Ra
	8EFQkUPBHalpp+L0qRACi7pU/tHmdxB40RZdWFNVRKOEMCD6a9WvDw7VF0S9JJO4Llq/Xl
	ETGeXAAxN8JrAgJm9xcO+qTrINhtGKkReFk48XjbSKrGka7rBdKteLPz6jYGxtO6xuVMp0
	SQD8W7CWWglQg40sZW0MeBDbH47p/AZ+RAral6ZQKCafaJBK8Z4ZKXAXTuzO+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 17:47:10 +0200
Message-Id: <DJHEAWSEZR79.19UFIKS8QJBQ7@bootlin.com>
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code
 creating the connector to a subfunction
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
 <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>
 <20260608-mindful-heavy-frigatebird-be9faf@houat>
 <DJ735MTNMYD1.3LPNV404V8PIU@bootlin.com>
 <20260624-proud-unbiased-pony-ecc3c3@houat>
In-Reply-To: <20260624-proud-unbiased-pony-ecc3c3@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_084721_536938_4B1545CB 
X-CRM114-Status: GOOD (  20.57  )
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

On Wed Jun 24, 2026 at 1:41 PM CEST, Maxime Ripard wrote:
> Hi,x
>
> On Fri, Jun 12, 2026 at 02:56:24PM +0200, Luca Ceresoli wrote:
>> On Mon Jun 8, 2026 at 1:40 PM CEST, Maxime Ripard wrote:
>> > On Tue, May 19, 2026 at 12:37:22PM +0200, Luca Ceresoli wrote:
>> >> In preparation to introduce bridge hotplug, split out from
>> >> drm_bridge_connector_init() the code adding the drm_connector into a
>> >> dedicated function. This will be needed to be able to add (and re-add=
) the
>> >> connector from different code paths.
>> >
>> > Same story here, explaining what you need later on that calls for that
>> > change would be nice.
>>
>> Here's a more verbose version:
>>
>>     Currently drm_bridge_connector_init() does two things:
>>
>>      * allocate and initialize the drm_bridge_connector
>>        (which embeds a drm_connector)
>>      * initialize and register the embedded drm_connector
>>
>>     For bridge hotplug we need to separate these two actions:
>>
>>      * the drm_connector needs to be added and removed at any time based=
 on
>>        hotplug events
>>      * the drm_bridge_connector is designated to create and remove the
>>        drm_connector, so it must be persistent for the card lifetime
>>
>>     As the lifetimes of drm_bridge_connector and drm_connector become
>>     different, we need to create them in different moments.
>>
>>     In preparation to support that, split out from
>>     drm_bridge_connector_init() the code adding the drm_connector into a
>>     dedicated function. No functional changes, just moving code around f=
or
>>     now. A future commit will make the drm_connector be created based on
>>     hotplug events.
>>
>> Looks good?
>
> The message itself, yes, thanks.
>
> However, I have questions now :)
>
> Do we really expect drm_bridge_connector to stick around when a bridge
> gets unplugged? If so, how does it cope with having, say, an HDMI
> connector, and then swapping out the hotplugged part for an LVDS one?
> Does the HDMI connector sticks around indefinitely?

In your example, the HDMI drm_connector would be unregistered and put on
hotunplug. Its allocation will stick around until the last put but that's
quite irrelevant. Then, on plugging the LVDS addon, a new LVDS
drm_connector will be created and registered.

> *Especially* if we're using overlays for this, I'd expect everything
>  after the first hotplugged bridge to be destroyed, no?

As said, it would be unregistered immediately but might be freed later on
if still refcounted.

This is visible in patches 36+15, the path to follow is:

 drm_bridge_connector_handle_event(event =3D DRM_BRIDGE_DETACHED) [patch 36=
]
 -> drm_bridge_connector_dynconn_release()                      [patch 15]

Does this solve your concern?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

