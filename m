Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2023BD6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAjEzU0lnm6w9HbHvxnWCw8lQ0bKDnGFd7xXe5yjJo0=; b=RVg0nF3StWt1faybsWCU6VQu5+
	2gIgYb347x+H0oFX0VASXEMbev7VTnYBlPCEOVate2EQ5KfKaYC5uDgZF5yDrWVlE9nA/Vu0G4pRH
	c2RpAx5wdedhBZ51PIPMyS2pht0h9uLuCDI+vzwJNWZRxHBdoPxv/u4EuL/q5eEU7ATW98hQwDK9L
	GOWvz0gl3tbOmxP/Lwy0X56FBMoYK14fRDjdiVQBz5pClPueh15+GDEK8tdci1TbLSAljXZG8gUH7
	YNn2z7zxx+YOVW7/Y0BTQVWe67D/ENMjy738TIGAtnMwiN2tAsF6/KfsjCv1z6cAsuElcyQC2TJXc
	Dc7RjeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsYh-00000006wzB-07HG;
	Wed, 17 Dec 2025 14:31:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsYa-00000006wx3-3EZr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:31:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 15BFC1A2281;
	Wed, 17 Dec 2025 14:31:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3C3E6072F;
	Wed, 17 Dec 2025 14:31:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08228102F0ADF;
	Wed, 17 Dec 2025 15:31:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yAjEzU0lnm6w9HbHvxnWCw8lQ0bKDnGFd7xXe5yjJo0=;
	b=xrG4jKk1868Dv7dPhgpQxbWfGUHPcegpZHAbpsi68LNt1qCvLavT7qg6pk0LyAOpy6g8vf
	uCI/c6WhBKRbvJfH/9PevUAINIRZeoOldyX4fOqO+SKCVogGMwcD+YyeCa1fh6K0TiTtqw
	i7q5sRSu4GJyjVf7mR9Y3/Qri1jAxFNDNws2wV4hE/ssLWNgu61nMSLCC09UXg1/i5guEu
	143vac/E0zy0QYBvBIJMD6V50VaSq7IRSfaV3EGMI8yx/9ZEj9u8cmOSJceVeRYhrjLvTr
	yt97q0vB58aPCsDXYu3m2nq3B4klQ0rtZb1eI7qcWYQlJfN12/1sBA27uTxx/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:31:01 +0100
Message-Id: <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jonathan Corbet" <corbet@lwn.net>, "Kevin Hilman" <khilman@baylibre.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Phong LE" <ple@baylibre.com>, "Robert Foss"
 <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo"
 <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com> <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
In-Reply-To: <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_063112_942564_64284318 
X-CRM114-Status: UNSURE (   7.30  )
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

Hi Maxime,

On Wed Dec 17, 2025 at 11:15 AM CET, Maxime Ripard wrote:
> On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() does not increment the refcount for the returned
>> bridge, but that is required now. However converting it and all its user=
s
>> is not realistically doable at once given the large amount of (direct an=
d
>> indirect) callers and the complexity of some.
>>
>>
>> [ ... ]
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thank you for the prompt review!

All patches are reviewed now except patch 18 which has no reply. I'm just
pointing out in case it's something you missed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

