Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B881BCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mElU9b/C7GbTRzayuEisivT56pskbTQfjgTfMpMhZqo=; b=HvccKQp2GukN1ODIxI+nQbwFgx
	Zcjt411x3DKvcwswYSPZRME67a3oMs/lkLWrjnUhzFwm4FepnWE5+4u1WS6UbLfCvXOWNw9wa4N++
	qEGUmE2gCMLJejN6VIst0jAf+uHHnD/uhHZG+PMZs4klpoE6FLMbGHRveeEqxUKhznzWTUUnL8d7V
	TakEYqmDQA1Hwo8VQgh1dH1QfaFtE09Wjy+FRfw/UmiVvw3byIiNDM+9OLql7Bu8V31ASmQpYcnDj
	nJZ2tW46h+kAgD8Fs9IcQxk2tkU98S1AHqdrjiG6nXMSOifvQMpKU9Yz/GCEGnJqAUldEz71jmNob
	qTSrQqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAnD-00000007wMi-35rY;
	Thu, 01 Oct 2026 07:01:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAmY-00000007wFY-0i12
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8D3A4478A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52BD1F00A02
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790838041;
	bh=mElU9b/C7GbTRzayuEisivT56pskbTQfjgTfMpMhZqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lai8yV4GET1ANIXcbjD6gxSIgj3Rbewk0/lu4lDjiGBK0AR2xznTwMZ8CAZDJyZ+L
	 EsvRhzhNuZuaLDciN25FVrTaHZkxP0LHlYVvFBYK0H6yACyVsrCMUX1oTjEM7jmYTY
	 Lml8J1D9V8IgUtC3M+fkAuJVWqFWPEeBj49DI/54rn0I8w7EvfJfGvHPCetwRZke+m
	 Jrb5lxpINDotFvbXQ6w5GB2OIVzR4m29U2MsAoAZdl9oH5cDwh1t9GqoAezRLL1zgD
	 8Mx7kcqUrZSvQETzlBiDJnpk2uqEDqsoQyIxANadAG7s+7/C3LEuQcMM5ylc6Q6NmT
	 FapwKDBi/znAg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76cdef66fso21931751fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBqqLLAcLrHnj2sBes45iUenZYn1pcKO+NkpG+5c1YBwsWC35tTAfN40Yo83/Xvzz8XxQctMEjFNU7wYYGgYNH@lists.infradead.org
X-Gm-Message-State: AFq9FYKIq5uauI4kd2JrBURvwoimbbsW4zczHvVnX+r7+J+sfyvDPQMf
	suYemQRwoOQfoaBu5zxIpB+DSPVEAfBxGQ5m0V2BPPF6D2/mqeTZIYWoQMpCx7+ol+3nsoCnGKZ
	dSUWuiCYGboIRWazhqoYNDE80D+GC1qc=
X-Received: by 2002:a05:651c:2212:b0:3a6:5efa:5a41 with SMTP id
 38308e7fff4ca-3a77925f62fmr11207181fa.21.1790838040414; Thu, 01 Oct 2026
 00:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-18-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-18-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:00:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=89=_vKWso6+oj08FAVUqnWbiLv-DK5tkRregOchR+7w@mail.gmail.com>
X-Gm-Features: AclHuK8HpV3tEuh3YdZ0JhZMwoz3UMRkOP0D37dSr_O7f63FhWL-xa0BlDmYi2w
Message-ID: <CAD++jL=89=_vKWso6+oj08FAVUqnWbiLv-DK5tkRregOchR+7w@mail.gmail.com>
Subject: Re: [PATCH v3 18/19] drm/tve200: don't create a panel_bridge
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

On Wed, Sep 16, 2026 at 3:48=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
>
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_get_bridge_by_endpoint().
>
> And since of_drm_find_and_get_bridge() returns a refcounted bridge, take
> care of putting the bridge reference.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

