Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0619FCA0EFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1RSaqSBfdEgRZZK4r1EKSpaMqq1K5TQ7okIVP5zzlw=; b=Ki8XJBkOEOHHHg+2F7ZG1GOGOQ
	KR3vHzztRqARHQWNZfycvOOPT5ongeBv+UEXYNJ/iwevrXtUNbWSj06WDe8sJFEY84D7wr+gfC1OX
	YH5Je5Si3bpPGeeR5fDo6jI6T4aFF4khHiVgOe8VPcLcBZWvatlv1RgefRHzQPz4Wjb+3InMo9sut
	aKrCacxF7xUSiLAXizkYaMKSl6xrC/qsk4PHtXf7KJ+5ETrUmil6BQs1FgRC4j02A1GdIWibWxeRG
	3o+8wxvlfcFMGb8eJsItsk0C/TXK7hnpUeX0uMhQ3EQ4y3JeFU1J+7jxOXz2AK7Tn65YvPWv+YIpC
	A3OAkjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrK-0000000BEVa-1GYV;
	Tue, 19 Aug 2025 18:14:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMqm-0000000AgBx-0QHI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AFEF5C5B63;
	Tue, 19 Aug 2025 13:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D65BC4CEF1;
	Tue, 19 Aug 2025 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755611886;
	bh=j1RSaqSBfdEgRZZK4r1EKSpaMqq1K5TQ7okIVP5zzlw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=NxwatY5crFE7fECYQEVBOyoOpjfP5/45PpoptNh0DX5HMNjlR78x6TXhATmaA+bzq
	 4Lujs3/Xpx8qVH+EW3iLIDPQfcsLZ5zwfeCgcNaZ7JxiF2qHhJRpXuv3KWeTi0mq6y
	 UEz1EdD23lMfhpqmWrGRowMgtXIy4WnBZx/T0fDjfN1QpgM8fB0DLO8P8mLFH3p7hf
	 7e8GGuZrDnh8Ps4HHjfe45pI6M4e46Yt8Y7aBMqv+b0744Y+fESCvh32S/ZbKareoS
	 7BwF3oZAKOWHUNzMZRniG87VfOZfezS5oxkraL1dSiP2NNpYYgtHgn7kWBbw2iHH9g
	 in2WzE4R2PUIQ==
Message-ID: <c738eb0e7c6f9383d92a3bc488236d3c@kernel.org>
Date: Tue, 19 Aug 2025 13:58:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 4/9] drm/omapdrm: use
 drm_bridge_chain_get_last_bridge()
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-4-888912b0be13@bootlin.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-4-888912b0be13@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_065808_176098_ECB4D990 
X-CRM114-Status: UNSURE (   7.42  )
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

On Fri, 1 Aug 2025 19:05:26 +0200, Luca Ceresoli wrote:
> Use drm_bridge_chain_get_last_bridge() instead of open coding a loop with
> two invocations of drm_bridge_get_next_bridge() per iteration.
>=20
> Besides being cleaner and more efficient, this change is necessary in
> preparation for drm_bridge_get_next_bridge() to get a reference to the
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

