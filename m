Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18771C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkBZFniCUCzkEJIn51pXlmXmi8cVBb/p5U1a6qJ9Ixg=; b=ZNpFWLE3RDH6lmlK7KaoVV/iTV
	ql0le8bnWMU79I5vbDTSSvCKZrrTpaN2PiT2Ovz3SBOpM7n2n+/gldAGq8KXBLmFgNsnmfU9GLzux
	MHsuqgvGsY9Iv6xcz1V51FtKujclMKVsS7PRPGLTbkal/jQC5JBpela+vIs28DaFo8q9XpOm4jhBn
	f+0xS85EoA80WVL/bu0j0ojgnh5YWcgFZxd8uGouX7lSH3Felmy4VFysGVfxYKY2nvO3G1wdxU1Zj
	P9ou+A+Rv6QeAFwJqezkayz/nxeWkrsFxO3JobZFD92fb2qNqNMWmQKIPr9C/0sngI4OLQeda9+S4
	cANU8bqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5WI-00000001brb-2bXJ;
	Sun, 26 Jul 2026 20:32:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5WH-00000001brL-0sLl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:32:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0B0A4400F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 20:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850FF1F0155D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785097940;
	bh=nkBZFniCUCzkEJIn51pXlmXmi8cVBb/p5U1a6qJ9Ixg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W4PHVQaN9xLoqX8eDXdj+/bdltzbpdrXuJcD/IwTHED/OAS43NtSi09Vq3d6U04b+
	 OZrfY1BdRBIr3/BvT4jphHKxshW4iPLq0SEQ9WJZ6UCiJXker7nVXzDJTQTJeSQmCJ
	 nqQTHDVkWE6CIw3XfTavcgeKi0qWFBHLD4jbLvVP/w0wy9EuQuHMdSUYi0WkY8Th+6
	 o3h8KWUIz3JqQ5OnPdjn8CRQ129kqIKO0RvU9aDDIqv2knEzTV6ddZotNnccrjNDf3
	 gD5p2j+s8qJDRnjJCabcz24JHju2UhLKMDmQz+l+lUVP9hxrlhIX6gKr3NzT1t2xHy
	 xsYC8WtlBRvmg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39f00ce92d5so12536371fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 13:32:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrkpKl0wv+0e0CcMiP3NvaVMkW0k7NKqSqLMP9ejqIGAWWhwHNdGA95SOazfA4A/eVZzkZWg5LLFR5s6TtA1R8C@lists.infradead.org
X-Gm-Message-State: AOJu0YwX63xgMXTEjRBv2Yovi0xS9g9KK+IIDl8nkQz9FGW2YnS+SR4E
	4TDWPHF3y/EiH8ha5sIM3ZIxcx2FbT3FOuICIJv/KKqgi8hKDAsvgZP6ID72+wmh59g1+9NGAWT
	N6ee4qJvGt9XR09UWwoqq6MhM83C2LCw=
X-Received: by 2002:a2e:b8d5:0:b0:39c:99e9:da37 with SMTP id
 38308e7fff4ca-39f28779970mr10082271fa.1.1785097939063; Sun, 26 Jul 2026
 13:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 26 Jul 2026 22:32:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
X-Gm-Features: AUfX_mwB4HUeh3S2YxcI83VgRSuUorQHaI7-JMSYPXy-LrwQZEzjVUoz5QHNF0A
Message-ID: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drm: replace simple display pipe users with atomic helpers
To: Ze Huang <ze.huang@oss.qualcomm.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	xen-devel@lists.xenproject.org
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

Hi Ze,

On Sun, Jul 26, 2026 at 9:45=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.com=
> wrote:

> struct drm_simple_display_pipe was meant to simplify simple DRM
> drivers, but instead adds an extra wrapper around normal DRM atomic
> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
> should be converted to regular atomic helpers and stop depending on the
> simple-KMS interfaces.

Are these patches independent of other stuff so they can be tested on
top of v7.2-rc1 or do they need other stuff from drm-misc-next?

Yours,
Linus Walleij

