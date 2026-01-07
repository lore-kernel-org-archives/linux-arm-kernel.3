Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02D5CFD641
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmdGc8RmqCWZSrmEh+UMwLfS0doFBmXM9vWAXEyLvms=; b=0Hmb0NO37/n1Ew5DbC+L9o3d84
	iB0Rn40DuHl5uqenbujk5p33oQ7M/eI9YvIw8wzX4S02Vfp0Ps1cX2ONCR2/I50OHyD6do3ylTzog
	8khHNFUnLt5FlThK+jYcFfYmlPeXK/4OM4HqoHPbWoPDVlmuTDKuqVm+MPcKDdESEuVxZ9J8SNLod
	BMdYB1mi8+oFGNSNRineNS6i0kaWGzxyEurpcQWmwfoAx+3wGIci+cmrtd2HpfItlkEJaPV9zQkTh
	U7FIbVd6MvCWVIlbWMUtbyZmEDa7+idQtGLH0sUOBp7t1rDO/VIYeqA4z2rmLvQU0t3No+RjH/3K2
	b7vpDLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUKi-0000000F4PJ-3aSJ;
	Wed, 07 Jan 2026 14:16:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUKh-0000000F4P2-3iaH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FC516001A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 14:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CE4C19422
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795378;
	bh=ZmdGc8RmqCWZSrmEh+UMwLfS0doFBmXM9vWAXEyLvms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b0ddnArRLffghGDl9H67g9looF/o7iEk6VfWuNHhEw9p1mkK2qEuKd+TbVJzMEzuQ
	 ZWJgT0buOiaB38fRrktWid8LBGswC5XsJVTwcSCXfQztIP+nwOEe2QspYPGQ/FUsl/
	 6of8LkIvO3zHtEjliTYSSkHCmwzlySuNmH8HWnIBcbUwTEtcDPJ5e5o/UwkqkdNDrS
	 75Pmvj97Gm0CO4MbmcUNZcw3J9H+AqhfyYYLxldAn9DO/4M6yf7MtXNHdp3OMeSB4h
	 G1akDAskW40Gh7Bj5k1lBlw+/GjwR5B9jKBlETiFCKByaGSSijE8LJqVn4H+ud/dzs
	 HR4yihWji0AiA==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6467bed0d2fso2115278d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:16:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNBWtdJ8Flj2rMpXnYra882hwd3xNFT78Y+z2Uj3JgLVEB8aiQj3oLh4lWv/cZX6b5urWz6BuXrCSs4bzGEapV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8qNXsKm73JEwom1gQ7Kkc33wWJy+kuHg2tmud3gr8V+lk8wdl
	5RF8XfMmiHoXBqE/velp2NbMlX+BQ4gT8ZwqBWL36z+00tNFdBvY0ciS1sNGfiupI4vQXd3PEHm
	xxUStJZQLv797OUlBuCiHC4YrA9RV1iA=
X-Google-Smtp-Source: AGHT+IFxG+Miu6GVJ6Vzdd/NVjY5a4LS9F0nizqhKCukNOAT0QGmncWBX5ttR8rNDEh4eEbH8NRqqqLm0PLu+hAnXf8=
X-Received: by 2002:a53:c706:0:b0:646:a1ba:7168 with SMTP id
 956f58d0204a3-64716c3c83emr1880656d50.67.1767795378130; Wed, 07 Jan 2026
 06:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
In-Reply-To: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:16:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLkvYffZ_QRyk6VwuM4bMQVpfxdS8s6DhupXxB1eVU9Mfg@mail.gmail.com>
X-Gm-Features: AQt7F2o1liqmjroptcTd4AFvMzhvkZhes7jvwtRZbA4ijFlbrYVTv9IpNfFQgCo
Message-ID: <CAD++jLkvYffZ_QRyk6VwuM4bMQVpfxdS8s6DhupXxB1eVU9Mfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: imx: Support i.MX952 and update for i.MX94
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
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

On Wed, Dec 17, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> Patch 1:
> For the changes to i.MX94, some pins' mux options are not controlled by
> IOMUXC, they are controlled in WAKUPMIX BLK CTRL. SM extends the pinctrl
> protocol, by adding a new cfg option.
>
> Patch 2:
> Similar as i.MX95 and i.MX94, i.MX952 IOMUXC is also managed by System
> Manager(SM) and exposed to Linux through SCMI pinctrl protocol.
>
> i.MX952's select input register offset is different, so need to update
> driver to include it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Patches applied for Linux v7.0!

Yours,
Linus Walleij

