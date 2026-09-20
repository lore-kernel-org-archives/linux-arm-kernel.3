Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF25C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ0jYotdh7ql4qVQopBl9OhnmROuW0b1nFBPITg46xA=; b=DBKW+gezl1/LZ+v2Odv5sAvqdX
	0hbDF54eZYEj18WOZNLdjVyL3tvkTYVW0aEzx8ceR5KZeiiwF3Prhvaq9w3bQF3tfq447Ge62JwoK
	kESX3J34tTQMc3VlQYd9ffvVgTwa/+c8wNCK7Lwo7ZJ1iOD1xJ5xRypTc1Ckyp4cc9pbPb3GR6aPs
	70t3bd2cNgv0n0UhHQhjNj6x7+Ejbm7x2eepEMC4+HZfeCba3HaVhGMHL4DBQT6kiOm6oPvFIJEFJ
	eSERpT5MoioXWtizVhtDSDuPJ1AF9sGdCk9U9yWaZ4arzNuNGN7XU+5VPPN5PVAfwr/QM+iV8qB2U
	RMYTqRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8PzF-00000000Vw5-28WX;
	Sun, 20 Sep 2026 22:26:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8PzD-00000000Vvs-3QMc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:26:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93A5F44047
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A901F008A4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943175;
	bh=OZ0jYotdh7ql4qVQopBl9OhnmROuW0b1nFBPITg46xA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OcHgpT1xwIO6XWROQZZtX0pP7rtvLkq5r+4C9tDUCySI/aHerQeHmuoGb280LlR7k
	 kFhNUn+GqhwuRliePOfHEBYyn7A1//D2+tB41XNUVXh8fVuQJNgDDpOfzagYu7lTeS
	 vTmTNWBIwMt61BJSLWQJ2F3TAkuAQ4/QUOU8MTxm8x+uS7KL+YfwjMsf02PjLHE5TE
	 zHjXQDvyHm9RemWH9GeXYHwPrZ3I+Er3ID5hNWumjVobOl5SNWq+3ROOk7f0eqweOC
	 yvedHq1a3zS00PZfnmfBlJv+8Y56bRJschNdI1KFW2dqtDkPS3UU3dTmtSLndujkca
	 /eIM6LOzE+ybA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so2040359e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqmg7itdJkz1MPGEar0+L9iBzc+M4/a8P6BUYSsRTeXLS6rXlNR8n66TJrcXvQ/uTbO2JC62ddsHC1/2bZ6c9Q@lists.infradead.org
X-Gm-Message-State: AFuF++mAvi1AhDZQOuMDoZhsB4z3zpZSOKKAop/FQsn8FMW/c5t5QvUY
	RQOQMm05D7CsjfDgnIonP9h47Xr3XZD6/xJT1IvkLrzkld5T0V9HrYTAx4RD9L8+Ocosv8KkMUo
	z50Z+kUE12MRfLHIB/IWwGecWa58xq0g=
X-Received: by 2002:a05:6512:1293:b0:5b8:9ee1:10fd with SMTP id
 2adb3069b0e04-5b8c195b2a3mr2597654e87.32.1789943174146; Sun, 20 Sep 2026
 15:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-11-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-11-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:26:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Hu4XDUoBK5RfaQ9K3Jh4NfPkGFfoxa2tL_zSekPEUBA@mail.gmail.com>
X-Gm-Features: AcwNN1UOMCqRmdLLuJ0tewhusvy6SfVdZOwl8-NuoTCzIELTWmTcNqdeLCv7gec
Message-ID: <CAD++jL=Hu4XDUoBK5RfaQ9K3Jh4NfPkGFfoxa2tL_zSekPEUBA@mail.gmail.com>
Subject: Re: [PATCH v3 11/19] drm/mcde: dsi: remove unused includes
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 16, 2026 at 3:47=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> The helpers are included but unused.
>
> However symbols from drm_atomic_helper.h are used, and were previously
> available as a side effect of drm_atomic_helper.h including
> drm_atomic_state_helper.h. Add drm_atomic_state_helper.h.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

