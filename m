Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5567FC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1tgMknXPTxfI4cve9UkbbLLP6ccgRH1mmQbBmeIuqA=; b=cIKBDo0iWwetqzsQeBdu+IhS1f
	VAGpuvwc8soyqBDzI9q5JU7FzekYvocxOPmWocdop6y56XzpbGVt9eNAZ1nkQrBmD5CxBdbo0lt1W
	vf3XGtmSm312SxFdqAkNydQ/z7Sd0+im39QUrlOen1DWIeAzkP7YD3cyfENK588rTSJq/b4vfbwH5
	6RfNLdwHqxEOxHpnYiNV16nKppOBjYSXhk+bseim1ln8ph4OEBIT6rdPhG0J8YMAcd0yldipTo/zY
	jTGm//B4esU8zXg31TZCRoeuI2/CAVdwJoXvPxFvxgEMwZMKUyC3Giz42VEmj7qhYHensLYLOjDBY
	ppwFWZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckLu-0000000BOye-2PyK;
	Mon, 05 Jan 2026 13:10:30 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckLr-0000000BOxb-2gwo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:10:28 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-37a2dced861so18837501fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767618625; x=1768223425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1tgMknXPTxfI4cve9UkbbLLP6ccgRH1mmQbBmeIuqA=;
        b=Bzl1FDKSbj1T53ysHtkfRQTHx5zotSGHUtB08LuUMtbGsCBktaEWaVHcLhHB/iPK/2
         4FGSmiMdr37rB+NhGcPNSLRstiIaq1ss6WW1lUhbZYHBgwbfpFiF07DsOki0HPKKdJkM
         IdsA2TqkHVn5frP3nkoj6LJDkWFK68OWo0Q8oAYbJGZ0n7FB0fo90XAA66ssOgtfvDtv
         3pBXh5hse+s7eaADPXlx20ZOHKouzThIj3Ic3jNcDrLupxTj/ITYwZb3fGnhtQOHwwau
         sE4ji0oR2YM3G3MVRVU6u3jtJULSAPfgR74OjO+EdxVw4pJwL52WhKLCJEWxmK5K6U8o
         /oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618625; x=1768223425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x1tgMknXPTxfI4cve9UkbbLLP6ccgRH1mmQbBmeIuqA=;
        b=O3pfDw1MMQI5EbHgV6L+myeCYn82HccJj+Zg8Q0npiQgLquqPTfObxWuDbJt8Smwkt
         gdU82zDElXHErd2e6iQ7IKaj6pB9dZ0M1L3gKt1W3YnmpJ8Se5UZgrP1zqt2b/wxByYK
         1wTt9fRkVnXlIcP0MBp++lCw4HNCPdE6J2nfEFQChIXrhWDRIgttoiaJSSMGvSGSxs4J
         6ye3YdVBpwU9SrokWW/oiLeozCEWCTcry5DTgIiuvZ5u22uhrFRZBnlb7cqTCRBA8MtQ
         jbF3vQ7C/ujXq86bI0tbl0GEYDkpdF1vCPEfrRxgU3wtVS8oFBOvYzZkBU9EfPl/g526
         qNhw==
X-Forwarded-Encrypted: i=1; AJvYcCWWdr8InLVaZVrMwYdOZOCqkxis6CjN6j7WX2A+swerzmkOh48r7OjX+Ah1SOgtUYedbbGx3P2p5UFv6rHEFc1X@lists.infradead.org
X-Gm-Message-State: AOJu0YwmewBlz6p8HuqLjAE2nfVdcqOIbmffuWiH+vKv+YnzdLoG5pGb
	xo6oR6wMNeJw/L83TVp4KaBXjEwCrENPG81oC6xRMDTBIJ0B6NgGfmDvDa8jTwI8cRsvTmp5nlI
	Owg9TDfQuKXMItpo9z9ydpMvkxYaNPn8=
X-Gm-Gg: AY/fxX7fUvcRFG6SwyYUNp2tkzzCPZbwCtJkwZTfysGpv6lS4085ZxOhKOhFVECVxCu
	6o+U2yYC/c77m/mN1HZ2HyRDf2XvAeUxoS1z092meXVzLeNsnwS7w2OTpA//HL9rCrn7kcYhJ8Z
	AE6kIAKjrURzMtNg3AmryHhWhrBFGjgP5zgni1wKE11wZL8Yrol3ztrL3pThzHJkriHmxsTTkS/
	4QSvWFQsi0p/aBJeNPDDgCXlotsU8bl8wYldF9nXU6SOqSIpGp7fMHQlCX3HP568qbo6BTiH/S6
	hjh/QLowWgiIuf2r23/r0+GmDII=
X-Google-Smtp-Source: AGHT+IEUbLTrvsXoZiZcdhNSheDt5P3vxL7cNjh4Y4VVYLNVJEjIjtJ0okeQhPegnghE+HXm7rcA9IcQ+NuYNy7f2J8=
X-Received: by 2002:a05:651c:994:b0:37e:5208:e2d7 with SMTP id
 38308e7fff4ca-382c519671bmr30052071fa.19.1767618624495; Mon, 05 Jan 2026
 05:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20260105102412.6674-1-stefano.r@variscite.com> <20260105102412.6674-3-stefano.r@variscite.com>
In-Reply-To: <20260105102412.6674-3-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Jan 2026 10:10:13 -0300
X-Gm-Features: AQt7F2rgkl7-0dzR76DPCZQr4IVNxzzcw_bfa9sfWvzvQGQMX6LP6vhLo4zS6yY
Message-ID: <CAOMZO5BSoqQ70K+ihJEn2q6qh2AFKJAsgqufvW3o_fTxsfC=NA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite DART-MX95
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Markus Niebel <Markus.Niebel@tq-group.com>, Primoz Fiser <primoz.fiser@norik.com>, 
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_051027_688858_4705D49B 
X-CRM114-Status: UNSURE (   8.76  )
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

On Mon, Jan 5, 2026 at 7:24=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +&scmi_iomuxc {
> +       pinctrl_bt: btgrp {
> +               fsl,pins =3D <
> +                       IMX95_PAD_CCM_CLKO3__GPIO4_IO_BIT28              =
               0x31e
> +               >;
> +       };
> +
> +       pinctrl_emdio: emdiogrp{

Please add a space before {.

> +               fsl,pins =3D <
> +                       IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC        =
               0x57e
> +                       IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO      =
               0x97e
> +               >;
> +       };
> +
> +       pinctrl_phy0res: phy0resgrp{

Ditto.

