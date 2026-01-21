Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E631CD4694A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CbRvxK9+55lgx+qlAoXMUwl5JoWKYBGrDpVOQSZJzo=; b=AAGohfGciZ6R+CFXtGwOBgf2aY
	jMbm7EXqTebGhBKFtLcjVAoupHysT+rNkEzj0rjBYDvBLIIlVlWpCwxWJrhtB26FnkKpaMHyK9nhx
	9zhLczYJ0j93rtDLK8FPoopZrgCDGLVua9/qrk1Dk/brAv5WNPi1qAdT8ysXbR9EjyXcqcFVFEgtW
	KEtVVqevH2RrSgX11hO2Y9fLoKBgVUyP9/2rYSUuap+53j2lfg1DxKIiAac9CUEq8taVQzwZO2rIn
	3z1ZGcxMHJwlspwBqtc4lqwXOg+WRf4VYSFqFaDxmeoMsh/NNtKzp1UNEi+/6/dAZgyXkOKocJcJD
	DPx3piTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1via3N-00000005iKZ-48cO;
	Wed, 21 Jan 2026 15:23:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1via3L-00000005iK8-0Jtz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 15:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D11B437FA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 15:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9FBC2BC86
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769009006;
	bh=iFZDwVA7Uf5gTTRjwXE5KL6hD6mjuWvyyFd50SkCOww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BHDrl9YvUw1kUmyeB5MKtI+9Si9Ol+wXHBplkBKPYd0u6pOod8g+vZMCRzh3eakKZ
	 hxZjqAfUj/a/W3kjBtsXY32Xbx9a3K6gkviSTuquB8U2InBWDrtWxASH6XhKl3Xkum
	 v3rjLqGs7uW2h5QpPZRfiNem8VLwG+aFK7BUg8+mH5s5pfsHJiJyE2PeZQ5+QE+a5L
	 2wzpfED5ThqUGvwIEi8bBzAwhSmusA92wsvS3RVP4UI/H4CspPPYiIi5KHhHPV4kry
	 vpy0Rk8i4nnLzrQOpQlngrMwDebpVBqS3BGVC7aiNetk+R2Cuqh4KGCHLT8SQ0+9fB
	 f8AeZgJbgoYVg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso1834041a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 07:23:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuz+BiJEaKT7cG4P0daAUOe1cHKj7+qLgpyNlVoxZ71CPFNVITWDoDfXYU7OiTEiOKprTc5t/r/Dq0SlDW54wg@lists.infradead.org
X-Gm-Message-State: AOJu0YwHABi88TSSJv9+6+UXljUwH7eQnp4EEFUqNMPkk9UmTo0yYuw/
	rfCbZQZh1S231XVvJbJoNR640NaPRk3YOmPkUgaUDi/7IV8/GwHgNmnNXPYPVkoGE/xS40MT6oh
	hOI9jdcUMJG/bzXGvC79h/e3vcrbPbQ==
X-Received: by 2002:a17:907:3e8c:b0:b87:2579:b6cf with SMTP id
 a640c23a62f3a-b8800348798mr476675266b.41.1769009004718; Wed, 21 Jan 2026
 07:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
 <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Jan 2026 09:23:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLZXwvht0KbPfoMVRhp0doNh971rKKv3FoCOTDjoDWKA@mail.gmail.com>
X-Gm-Features: AZwV_Qgxsl8jhK-Kzr0JzdnglYTDbfqkbMibvySBi5iB5cvgn_7BXkMMMsPSmxU
Message-ID: <CAL_JsqLLZXwvht0KbPfoMVRhp0doNh971rKKv3FoCOTDjoDWKA@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_072327_156884_AEF219E4 
X-CRM114-Status: GOOD (  10.99  )
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

On Thu, Jan 15, 2026 at 9:25=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> From: Liu Ying <victor.liu@nxp.com>
>
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++=
++++++
>  1 file changed, 78 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

