Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90F7C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQLSCU6s7tadJXW3ijfkRaS6QjwulBRxirc1q6sY6so=; b=MuSm9cr6XFMj/F7FdUNWmW0WJW
	SHVJxP6NiUK1D8U4g/ODzDUEMJ3+lxKxeXC6whxHc699v5wrUhhspg3PMsYt9dWVpW6vBsoOWYZIe
	VQ95+/oXcw9OMhX9WQ7reKdSWdNl/ptFUvNwNDzpUE8LoEK6d/cJlvYAr4FbOHMUto3sezFbDgJUx
	+CJhVHfK+PQukoLN47RqEvUXcfMNFObPeQNv1AxMl+KXK848QsvRbH9+dGvmNP9TkxHPUxCnr9h80
	nrv87Z2RqPXRGUbAOPQ3I/PmTptkcqix+2XfC96LQTjPL8Sxe/yWG7gNIfQIkUy2WqmVjGBD3onqu
	lRNib7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyp-0000000EImZ-1PMg;
	Fri, 04 Jul 2025 11:53:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXecK-0000000EEoh-170G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 11:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751628608; x=1783164608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQLSCU6s7tadJXW3ijfkRaS6QjwulBRxirc1q6sY6so=;
  b=OIsG7Ij3AG2IZL3NvAndB4AIBWeWdo28Ty9QKZqB9sStL0AenSZr/cGx
   CgqALvouK5PdeRlAarSOfrXRgYbbGCL4kwkFYXDlsKYSgcP7lkPLXr6Kt
   17iUHwTGam1pN2gY+9U6IiJ913coctf/bK8nH86ZNFaMtXVMTwPd9osIY
   qr6rzJ1oycjjRjIUYi5CbGi13yyIsWr4RnLpvQ6sALQr391oBViziSRGD
   lj1DR6e7+FqZrVlILIyY4Fc7KKjobRse9P14U8K1kPCQk5hi9NFwFshEB
   Sy8Eu5S0S288doXeThQJW1bsgs4XqNTCGc7k8eJnjrGOmGY45/x5+C1iZ
   w==;
X-CSE-ConnectionGUID: jSRuNTPpRsydYLYRPhbXQg==
X-CSE-MsgGUID: R+RKeJOgQ+S5uDN6S6S9fA==
X-IronPort-AV: E=Sophos;i="6.16,287,1744063200"; 
   d="scan'208";a="45031135"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Jul 2025 13:30:04 +0200
X-CheckPoint: {6867BB3C-30-4FC15ADB-CD71293B}
X-MAIL-CPID: 407389F97A04FFAD1E4F8CCE6D42EE93_0
X-Control-Analysis: str=0001.0A006396.6867BB4C.0063,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC794165607;
	Fri,  4 Jul 2025 13:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751628600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oQLSCU6s7tadJXW3ijfkRaS6QjwulBRxirc1q6sY6so=;
	b=W4gdiY2u+KnVU6AEdD0acwe3gCkG8t/uyJscqkMzNXOpRFSqpVNFfLN9jFk/1GB+71IMXE
	kWwh6jGmZ+hBi4ZZ98dPY9+hZRc8zDTWF5S42ufc3p0vo0uB7aULUruYxiNzkCrNAT/dIp
	Qpw3v6qWfXz7EwZcnEe677+Ytex/+2ODif3jwmve/nnfYpoL1eTfa7lWOOciCU3ukcS0hr
	d0eYqEiAt1eRyuRZmrjbZV+VihawcFagHfXxm7z1ahKQ7+MsGLI4O48PqNOEl8w9aK2jpC
	vr9n7V6SlBwd92LVSYrWcBgrTkMgNkpj7p61/UB0iymUekecOOfIsYbbIAq8Aw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 04/14] drm/imx: dc-fu: Fix dimensions
Date: Fri, 04 Jul 2025 13:29:57 +0200
Message-ID: <3702593.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_043008_794392_A9117192 
X-CRM114-Status: GOOD (  13.56  )
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

Hi,

thanks for the patch.

Am Freitag, 4. Juli 2025, 11:03:51 CEST schrieb Liu Ying:
> Fix off-by-one issue in LINEWIDTH, LINECOUNT, FRAMEWIDTH and FRAMEHEIGHT
> macro definitions.  The first two macros are used to set a fetchunit's
> source buffer dimension and the other two are used to set a fetchunit's
> frame dimension.  It appears that display controller itself works ok
> without this fix, however, it enters panic mode when prefetch engine(DPRC
> and PRGs) attaches to it without this fix.
>=20
> Fixes: 0e177d5ce01c ("drm/imx: Add i.MX8qxp Display Controller pixel engi=
ne")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/gpu/drm/imx/dc/dc-fu.c | 4 ++--
>  drivers/gpu/drm/imx/dc/dc-fu.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-f=
u.c
> index f94c591c815891468a5c2a940076963eeaa4d51c..b36d3034b8d5962eaab212b6b=
65ebbb5c29f978c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -31,8 +31,8 @@
>  #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
> =20
>  /* SOURCEBUFFERDIMENSION */
> -#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
> -#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
> +#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
> =20
>  /* LAYEROFFSET */
>  #define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-f=
u.h
> index e016e1ea5b4e0471cf6627782603e72d0475c4e8..518d1af49f5ae9d4f67da5e6c=
2e80abd7e962120 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -38,8 +38,8 @@
>  #define SOURCEBUFFERENABLE		BIT(31)
> =20
>  /* FRAMEDIMENSIONS */
> -#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
> -#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
> +#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
> =20
>  /* CONTROL */
>  #define INPUTSELECT_MASK		GENMASK(4, 3)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



