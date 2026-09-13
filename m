Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DE0C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 23:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zng3/lheQcHYHRf6apSQbhsdybFIgxHykd4cCeRSALs=; b=0889GrgjCx+8TFnmVP/ttd/uAa
	Ay7KBm69jZMUmuh48fpj3Mn6w1paS4jpqUn2kUGAq/8XsVyWXHWWs0Zn/okRtMFjg2wKtOz0Nbf/p
	didcujR5Xwc2W9LmRMkxHV0oM7QZpJtqFZKD+nfGTf3TYaMk9Q9SWecycmGJvdPQ/Hl2+fLzIEsvi
	b1Iv+uDUT1quYYlUCCYIyJ9kbRk1X0Z6oFh8oubdNGQOh0ymMsIlrujqfZjbJNP8ghWk4dwCKBHXK
	oHKyTWuxNFzPea7S3pgRVF+Vuy5Tdp8u4nnMFQs/y2jBDLIZhaqdYqLtN4CLjocg/lzkNjBkA6THA
	DZgoEjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5thx-000000026LN-0jES;
	Sun, 13 Sep 2026 23:34:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5thv-000000026LG-1pIv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 23:33:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E18ED44AA0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC031F008BC
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789342438;
	bh=zng3/lheQcHYHRf6apSQbhsdybFIgxHykd4cCeRSALs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DIuwo+91E9j6P8gcffxeTWibtVYK84E/K0zWh6s/Yed5HdTiBGh4yJD4g8Yy7YMzp
	 Zmb9UrM8SFiukhfEjKlqn74cChv71bxCDBhiCj/l/UQfge2Dm3qkgzsFbSGyqVSqpp
	 Udm+lm2P+eabpV3YMbxtjsRr06pb7oVPf73ngoGqP6jy/KVGDLhpFrdPO/yuSXNhqF
	 P/mNOKNoJ2KD2X8EoD31TZAHK6RsTWpDJuSUh375d6tPe7PrV/jmdpTbTzJGdzxjb1
	 iEp1c93xdl5nZIFDK9qu4pTXYFgqdfiS/ApZ0qsmVcVZZzCDaVwmiBwLQzxdIQXZR+
	 f0lsIW/5EvTVw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a35a64530bso12059921fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 16:33:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwM7zsHplrbFXE+gBCBD6Aa1vmU+yPRtHml95nrJegmUDNFULjmIXgnj0bmAPs8IhKAqMrrCjBC6Src/wuGlkpz@lists.infradead.org
X-Gm-Message-State: AFuF++lWD0LBEvojslz+lVbOu7jfofKN+73XC0kS/+8EcgYtlM2K/XhI
	6fYR+41/S7K4l5Fsay7tsgiIGrDrsWyAzq7BMkWIZJ6JpZeRE0nxO4HgjmdNrXhSK5YhswFTJKG
	fU8qkNZtFN8rs/Rv70nkkF/sJ38sAWbo=
X-Received: by 2002:a05:6512:2204:b0:5b8:9a2d:38d with SMTP id
 2adb3069b0e04-5b8ae8a73aemr7507e87.56.1789342437102; Sun, 13 Sep 2026
 16:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 01:33:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLnN-dhwxWwgmWYVD7COhvVsTxbiexHwoFkzgv8ucGhxqw@mail.gmail.com>
X-Gm-Features: AcwNN1XTt4ClabPMabRSeCfNHr3d8Y53WJSzGM-8HBGT1SAK6TVjQKD-jMPJbKA
Message-ID: <CAD++jLnN-dhwxWwgmWYVD7COhvVsTxbiexHwoFkzgv8ucGhxqw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/pl111: replace struct drm_simple_display_pipe
 with regular atomic helpers
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

On Sun, Jul 26, 2026 at 9:46=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.com=
> wrote:

> Replace the PL111 simple display pipe with explicit plane, CRTC and
> encoder objects.
>
> Move the existing timing, format and pitch validation into explicit
> atomic check paths. Use commit-local plane state in the CRTC enable path
> when reading framebuffer format state.
>
> Move page-flip event handling to the CRTC commit path.
>
> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

This patch 4/8 applied for next.

Yours,
Linus Walleij

