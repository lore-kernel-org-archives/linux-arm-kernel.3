Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0274FD16806
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiCIIDZ8DQ4eVHwh0jh/RzqDH1KSvakfkkduuvCNYtk=; b=fPaIXGCJ/1l3MZgHoqyFdWN6PN
	YC/HU3yJoPsVZVGStT+VahLgVH9Wc/kzPA2cqgNVYdXy+/iv7iq3yIGq6YbRMj8dT4/+dfMaLkRpQ
	OrDc1Q1wWA4yncaov6sWSs9uJLN7D5RjntC1rHsh0q5HigvgrzwOPki/DdziZodm5PgFgfYaHzq3E
	JsV1aj6nTI9DFRdiy9bu8dY++9BnpfNYq/5cbDX7i5Mf0kERWWDRUx/Xu1R3GphhgQnRxF5x5bwzq
	h+T/k49eIIGLXe7MbdD6Dc6YSjjoTBtCR1wGxFz7CyE/x4CVAoO3pF0iT5zdjOPFmjtbEDEvPZmc0
	9OqllYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9yZ-000000029f8-1b5J;
	Fri, 09 Jan 2026 10:44:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9yV-000000029eS-45QJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:44:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5D95C1F6D3;
	Fri,  9 Jan 2026 10:43:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E132160734;
	Fri,  9 Jan 2026 10:44:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81CCF103C88D6;
	Fri,  9 Jan 2026 11:43:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767955445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SiCIIDZ8DQ4eVHwh0jh/RzqDH1KSvakfkkduuvCNYtk=;
	b=CHHVmWabxW4J/FmEQWQbUQcLH8cRIxzAgak+rlrLVxhBB2O5qUMp+0aTrZYpUZwDEM2+k0
	4y3Pq+0kpPbv3sEh0MQO68+EKWWON4m3vFnbhSeAfcEEskuzDo6oKvKTvr3ItBGPbchM2b
	6iopx7goSrbT2ijmFwt27qimHfFzTsgWNNhEoAKS/4YyyMZhk73zlTXB5jrgbXS//0Jdee
	sx6pS0gYykrS3erWjnqH64b2J1cmOGYPQ3/LMT3yKQQ3gd8HUm4pICNfR5iOtUMblWVHIz
	LicE7Ye8j8vmLi6pipJmBpcPYwmdDo2RBgVA0SvgJNBTZDOG8JcDnxvvjFnkJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 11:43:57 +0100
Message-Id: <DFJZWBL17LBX.X68EJ7CSQFB8@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 0/4] drm/bridge: add of_drm_find_and_get_bridge() and
 a managed *next_bridge, deprecate of_drm_find_bridge()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <7d937ad1-dd7c-4a68-9af7-f386ca2c27dc@nxp.com>
In-Reply-To: <7d937ad1-dd7c-4a68-9af7-f386ca2c27dc@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_024412_432676_D1AF09F9 
X-CRM114-Status: GOOD (  13.30  )
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

Hello Liu,

On Fri Jan 9, 2026 at 10:53 AM CET, Liu Ying wrote:
>
>
> On 1/7/26 17:56, Luca Ceresoli wrote:
>> This v4 contains the leftovers of the v3 series that deprecated
>> of_drm_find_bridge(), added a replacement which handles bridge refcounti=
ng,
>> and converted some of the direct users. All patches have been applied
>> except the imx8qxp-pixel-link ones, which still need a review for the fi=
rst
>> patch.
>>
>> @Liu, patch 1 is waiting for a review and it's non-trivial, it would be
>> nice if you could have a look at that one at least.
>
> Luca, I'v been too busy recently for tasks assigned by my employer to
> give an in-time review, sorry about that.  I'll try to review this late
> next week if not sooner.

That would be great, thanks! And I understand, aren't we all busy? :)

I have resent as v4 just to ensure it's clear that these patches are not
yet applied. My e-mail [0] might have suggested the opposite, due to my
total noobness in using the b4 auto-thankanator, sorry if that was the
case.

Having patch 1 reviewed is the most important thing here. Other patches are
already reviewed by Maxime, so your review would of course be very useful
but not strictly necessary for this series to go forward.

[0] https://lore.kernel.org/lkml/176708623356.127863.8623917477288453126.b4=
-ty@bootlin.com/

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

