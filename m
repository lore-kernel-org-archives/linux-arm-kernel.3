Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35851CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJwfbKCyn/gh6UMXa/B9wDnCdxqQxEqYbYvEbOHcRzo=; b=Js0bBKcC9ywhHb+6Td1dUYelll
	F9LsYqPX8cgGp2nAn2fMKTc0m0034Yvvuvcgb//vj+FIfN6weqgKvyQe6kCPME7Jjovv9ptD6whjC
	B7QQrHfBtBAZDJ5QgC2wPm98ZO/Wvb55HboXHlfaYTfe80hPHB/wKY/Pp4DBjJ2QzC/M3BdfzgEaY
	MPCbVpkd91RQ2JkdnblIjMGS7uhUZAHVKo0vYX31wHOz0eeCvcVFQGgULvkWGtHt/ldLF4FGItQGR
	HHiZSU+gKndWlT1Zs12T9cDtJ53voiUOGinegZGl6Jg8KmOvyNw222gIurYoLJQlcerXLUvM3h/ql
	4ePkTAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAlp-00000007w8h-3sm4;
	Thu, 01 Oct 2026 06:59:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAlZ-00000007w3S-1CQC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 06:59:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AF7160A65
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 06:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09381F00A09
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837979;
	bh=QJwfbKCyn/gh6UMXa/B9wDnCdxqQxEqYbYvEbOHcRzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Eb7QsxdVvwC6Q6ASOE6RHWopINjqmVsM+asCISC8KzX4TbbjLlLnsFGewjxLBiuAL
	 USpbOV25b9ZmxZxGODhRZ/pIOUEV4j/7ISqQiq/4Q3iBTdt2DVLljYevQD1l6XoyiL
	 /6myJolVu0oJo4EALqct9L6A2ND53yX9mOAI/X1jCNzZ1CH/ZbM+48f/OViR41yaiE
	 YSWVB+jXEhQSQQdD456ShpIZi68mzYXHl+aRD0Dw6RexksYrZgHbY19oPl/9V4B29b
	 xtsP823iFmnkNIANNLcxBYI21WhoxAkFuarvbrBPjvq3midaRtXgYMBNaY+ttNwSXN
	 HLUC7j9fQRUAA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so52239031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 23:59:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxz/i78VWYx6rfNvkdln/owRtw7eh5y9hgkUjE2lhJV/KEiaiYQB5hjEJHtlHBCUaqL4iXUCgUtG5hdnZKeO5hL@lists.infradead.org
X-Gm-Message-State: AFq9FYJhDpa0PRDNZfcB9RagNAggoIb7LlIIWY1lRX8bt+DTbdQPPwO1
	QUVqi7+t5FA2Z7PQH8c+a6G6v7EoyfwvY1+qIXGWN0jAq0UiyWnuo1uGgRciaCMTYhrXUo9YBMD
	JKoKjo9B2fuUp4Hh2rHA6reLGBwL6N04=
X-Received: by 2002:a2e:a99a:0:b0:3a7:812b:d0b with SMTP id
 38308e7fff4ca-3a7812b1f22mr7437971fa.11.1790837978465; Wed, 30 Sep 2026
 23:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-8-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-8-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 08:59:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=G5ObsdvbhHFsEOeGYQFSd8Ggo7jaEupRTEdPmQD1e1A@mail.gmail.com>
X-Gm-Features: AclHuK_sHPl7UkC73IJwZdQ3ifWpNCzHWYkFbMbP-K9-g_pDmrUnJv1iVcxQNBo
Message-ID: <CAD++jL=G5ObsdvbhHFsEOeGYQFSd8Ggo7jaEupRTEdPmQD1e1A@mail.gmail.com>
Subject: Re: [PATCH v3 08/19] drm/todo: add entry for removing the
 panel_bridge API
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

On Wed, Sep 16, 2026 at 3:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now that a drm-bridge is embedded into every drm_panel during the panel
> creation, the panel_bridge does not really exist anymore. Its API has bee=
n
> deprecated and kept until drivers convert to the bridge API.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

