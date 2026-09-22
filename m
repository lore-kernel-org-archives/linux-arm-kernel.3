Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA26C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxGgdlKXdQehed4Mw0SfXW0axCt+1uRQORUzvBkN0Rc=; b=XIJ4NmxoYop/WrCd6h8bYhIdQE
	yAkHPdmoFbwVMcp7w8mBRbu28urqN2DVCGQV1k1ZtLcASpLqYPPxqueg/v4mAWxgbVHAxQ8OHnAvy
	/9Ss5znhxJ3ta4+QPsBvT0nLel4wDVTM6oNPlEpulU9Rz5fYe8p/w3KZB9yM6i7v6okIcEwMO7QT1
	8cwFwv8YvTYgAwLZEGLGBgvJXfbEDRv6a+lQehaOy3vOXBce80n2bd0c3LbTzsRiyt2vSG3U8DGSz
	0vMDtncCHYeF7aWOmhwYwPRhTXad5M8DISSWVuCS26tPsz80fGAcVHSVxC+KgZDB+cOYfF0Gm3m4F
	a2X3M53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uTG-00000004Qe1-0WHT;
	Tue, 22 Sep 2026 06:59:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uTF-00000004Qdh-1u44;
	Tue, 22 Sep 2026 06:59:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3374B43B79;
	Tue, 22 Sep 2026 06:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F9C1F000FF;
	Tue, 22 Sep 2026 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060357;
	bh=SxGgdlKXdQehed4Mw0SfXW0axCt+1uRQORUzvBkN0Rc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=RwVYOoQfhi9TwqQbw5KayRana+hvfi21GombJmNp6vJqoWCJhdtfGdezAQ9dJwgTB
	 +4IHqXlgTbon0FxFqaIqX5WLujsN7u64cnDGQAfMLkdfokQje93zHp7vQ08UB4cQIf
	 5Z7uc0y7l8KC4oQliasYNUZ9yGvrVEE2ZCH3DLLljQGilqLLBmIOIaj0+/sl+08wA9
	 yNeJDm223TxhLpB4AyFZOBHFmctbpgM/pOwmx+KbZBYJ7Q7oEFHjirJhzVpe1/B+bb
	 2eN+YhW/o8i3A490N29lfp6xXaqchOcW1ZSdbjhLStHgesNM3J3hoeFDvCVmHBJFXD
	 LKjJkON0g+8Sw==
Message-ID: <525095932cd9563fea70b43823c9db88@kernel.org>
Date: Tue, 22 Sep 2026 06:59:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 09/19] drm/bridge: tc358767: don't create a
 panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-9-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-9-83afb4f1a707@bootlin.com>
Cc: asahi@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Albert
 Esteve" <aesteve@redhat.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Linus
 Walleij" <linusw@kernel.org>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Randy Dunlap" <rdunlap@infradead.org>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shuah Khan" <skhan@linuxfoundation.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Wed, 16 Sep 2026 15:45:33 +0200, Luca Ceresoli wrote:
> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
> 
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_get_bridge_by_endpoint().
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

