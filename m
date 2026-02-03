Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C795E8782F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiDNEn6LPf3NNMPn5SjpOYR+1H1anFvHfyh9Q60C1l0=; b=uE2dhQPIYdXMsEAvjWIifmFSHK
	NjEM+fW+MEDpdqth2hhHuskaR2H/KfKFJXPHjuMLJXwea23+17X3DyCBvAHG7Dhp9PXC4r3POhNSM
	shPoVUKzam29GLD7qoKsJDIyFwXgjKLI32Y1XNq9IMe/f6JKdApSuGqKyt4ziAI3BUPQpRTft2FnS
	mDVGF/4b0FGqECfW2TQUIqPbHew2+cuKF5YGG4UkQKCAEpQR9Ov7gYbYG/3EXfrRJcYyooBImEEWX
	QFLG/72YYKaJbd4JMWTy9XB9IOYtcyO/bD33WR/JlDvgL5GHUikq7gazKw0rOQRuOmbl/3MQS8RyP
	NMabO8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGtC-00000006iQs-3PUj;
	Tue, 03 Feb 2026 13:56:22 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGtA-00000006iQP-0k49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:56:21 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1233bb90317so614176c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770126979; cv=none;
        d=google.com; s=arc-20240605;
        b=PQHMBtAuboQWuFr73VuxKjoTtOaZo3O1S7yffRBhoPRcFasesMITpX/q6+UChD0VaR
         cZKmXqU8bvMXir6vnthBRfE8J1YDtu6mzRHbWDGIS2Cald3eqqgRTjNBwZRcq6SS1sty
         SI7NtojW5wBnygXjvj+MBe3phuIYLPJnLoWMRyxPQ8zrjpQAMVoUVbrrYYyGz0lx8AcG
         xrpKNH43u2T1YpqLHGnG7XIgNgK9KJrYpPokjnkGPS+ZbLc/fTzdQGiINXy3wZlZAZgh
         fDlMlh3VIHZ9HJPvAZ74vmrXODWw4+ZZPRi1vExAZNtJzQdTzaGvM1xH6BzAlQnBSas+
         t7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oiDNEn6LPf3NNMPn5SjpOYR+1H1anFvHfyh9Q60C1l0=;
        fh=WhxVV/NE6Rfqcgb9pFYxXOSffv06WAMM6fMJagk87/8=;
        b=csRF25EwMKZdUiopDkmXLA9F8wUDC4eBqMFNUYBHI9QX1RTldNWyTYi8g8JLp+bNrD
         TvDEM0oHznfZg6PyRxbM3Tp3ZSL8mbSygkqAUGgNtkfZyoud4Kq8Ke0bCZY4XiaRSFHC
         j7hlGeyEttVnj9ozYSW2vmrkS101uIfcPWko0rODG5qZ2k6nhsi1nqpyHnUMnF3iQalj
         7lVPjgtODtHxKjTC7hmIUvCvHs+UMrJL41keZ5ADFxU9VFrma/SP5k2gCkcYNwppRJ4j
         4WsKnFnvGBWDsNwUHT3TFy4VKApU1jdvT3uPAuaJnTbK5xxkSfDjQieogowUuQLYp8zn
         4UaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770126979; x=1770731779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiDNEn6LPf3NNMPn5SjpOYR+1H1anFvHfyh9Q60C1l0=;
        b=QGuOMpUgcNnuduqOcxiVQp7B62u2QuRNQL/8eEBelWzGihfzbJIBreEM8h8Jvc8Y0n
         6iO+N6T82tVHHIEHASLoivZjKm3nAjRTqYdw9hFm1pWh9RKeUoCAFCzdnXrptQad7SFg
         4MWmheml+922E8orYFUaPSZ3g8cxDuoIs1WdVe3GyTC6ZFNqrmR3Ig8bmVsnAz6X2Xp1
         juB+JIQoD9d/z6rk0aHtM+FZp4DdYwViT3X7Wr57MKqN+sRePjfkZuf5c8kLNa5SnTEw
         dfHyk7K7sUj9Ug8+TJbq7DkUR4cWAp19Bj9Q8fSwKdXgPoYCfT7iO25Y8Yxg/DS62WRs
         BIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770126979; x=1770731779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oiDNEn6LPf3NNMPn5SjpOYR+1H1anFvHfyh9Q60C1l0=;
        b=vOXxjI+a5eZ1DRy1zYMSdIfOQYM3RFWb1yUlekWUulmxKANDipcictNlDdFlZdJ60D
         0u/5MYRjNNE7ChWRHhnDcTXffpH0UbmfRH2U6jrPFlFho3HE592Rm3ou7KSh1AN/iaI9
         XsyVfSwZGxriALmxZhM+BzHoE/O8GxFFvUYUQEPuFw/2D0IPgsDBq18Fvk3aKXkm7aZ2
         +n8bPae5MUHpfpnoM4SO3bND8EkOTCxu1NKfC5cOCTT7ZzzT1PtLOVmM9P/LWulHBEug
         KSQYFsbGrbNdjAAV+hjuLqggWtn+j2hQ+oj7jxNCTbRPrzDAklYbgmiJzY1Kigwp6D/W
         3QfA==
X-Forwarded-Encrypted: i=1; AJvYcCWISMwg6BQujPEpe8Xb5r8Jxm1BdA5ln4iquOI8H2QXEm1AYaHnWqMg8VGj/vhnmet/7m5bFD4qy9uHBT3ozfzM@lists.infradead.org
X-Gm-Message-State: AOJu0YynwGu9Bmd4/RALCjKnZiDioWeKN9KHjACu1Qu/iHtTAkJ+TXL8
	C4iIEEy5XMvfN5ikzkt6a1t5dSAm2unPqmCkKdn9GYMOr4ye/heAHNBLMtY1uism4iXfLz6Mp9H
	HhGPSnSSCHjBIWx7zn8l7R0NaXt8kybQ=
X-Gm-Gg: AZuq6aL+mbFiDgnPigkpebkFiQDUcEOaiHCmVQ95GBYu5+8XQp5kotcVRnMG/qCxQ0f
	bIhKDXmU/ntpiqDClO88IFXasfCUw+hKJhVqEFXOyiY8l1b0yIVTnLsnR2LuHX5smmJ6s7QSLg9
	ekdNtbQApzKsSg54PNbp/0ksz//8N690w/v+r1t2vc8m1Zir9yNoibSSBFLPtBUKIU/a2Vukm+m
	DwVEBds0iMK/X6o1sAJSfaWGAYfI9wG0y6jQ33ZIjLPIJO5AtrdmVQpDCl8ta7N/HxIUiFP2T2v
	dz1XHWfNOZQ0yPzsXrmkLMmjLwzg2OHFkvD9DwlCuJH+EwnWCnDFxs6O0SvdgQju1saDBr38YPU
	GiREm2ikIdQ==
X-Received: by 2002:a05:7022:90c:b0:121:d898:edae with SMTP id
 a92af1059eb24-126ea91f3e4mr1123936c88.24.1770126979199; Tue, 03 Feb 2026
 05:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com> <20260202-imx31_dts_warning-v1-5-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-5-434dd2643c3b@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 15:59:04 +0200
X-Gm-Features: AZwV_Qju5F7xT8vnmaZowdmwJ5PbMdVnDwBoeT5wIv_XHgkftgb91IXvaA8NXhI
Message-ID: <CAEnQRZCWcWaDGSFVvV0AT3rp7pO+iPXNnXW+4Dum9PwOFy3nQA@mail.gmail.com>
Subject: Re: [PATCH 05/10] ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_055620_219751_0AFE27C3 
X-CRM114-Status: GOOD (  11.73  )
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

On Mon, Feb 2, 2026 at 9:45=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Rename at45db321d@1 to flash@1 to fix below CHECK_DTBS warnings:
> at45db321d@1 (atmel,at45db321d): $nodename:0: 'at45db321d@1' does not mat=
ch '^(flash|.*sram|nand)(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflas=
h.yaml
>

The commit message should say *why* the commit is needed and not
focus on fixing the warnings from a tool.

e.g:

ARM: dts: imx51-babbage: Use generic name for flash node

Prefer generic node name 'flash' over the existing specific one to reflect
the function of the device.

This fixes below CHECK_DTBS warning:
 at45db321d@1 (atmel,at45db321d): $nodename:0: 'at45db321d@1' does not
match '^(flash|.*sram|nand)(@.*)?$'
         from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash=
.yaml

<snip>

> -       flash: at45db321d@1 {
> +       flash: flash@1 {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
>                 compatible =3D "atmel,at45db321d", "atmel,at45", "atmel,d=
ataflash";
>

Thanks,
Daniel.

