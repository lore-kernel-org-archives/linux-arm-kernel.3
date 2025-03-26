Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358D5C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrGXGtpLu9V6i8WaDAYslIOE9Xmgz7g6O3/KWU/N4BQ=; b=vWFWZKaYT4PPeI24D+IGUN0wkb
	yNKK1b9qrauY+Cw0BVQfqBLcfn+o3sYmRwzLySrupWuStFBp17s/JdVay3fAEAIx4SZpsKZG9gV9b
	7h+KAQqwSZoNH9lDlKkgD7ynktCAJvHsHNHtNF2d4FKWMGhH/Xx6ssNNCjanyC2dNKG1cBttAzkzl
	Xdz/R8N8m73kYNv3tRNlixjITVKxdlcfJaUIo+Efmi2nSTfnMPZgzPCP/bgy8wB3x4ZFiNxaZKdNO
	3AUMVt8hT+JafJXTtJPLlhDpTXIij9cNgfzLqM+Bfh5utuH+Br/rJdTmlLGZfehr4CYzijztj4/UR
	hvo5mslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOeu-00000008JxM-0Uqs;
	Wed, 26 Mar 2025 11:10:56 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOdA-00000008JiZ-3Ao2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:09:10 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-227a8cdd241so13822245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742987347; x=1743592147; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZrGXGtpLu9V6i8WaDAYslIOE9Xmgz7g6O3/KWU/N4BQ=;
        b=GM0AMapPdzqvH4ubq7WiBZk8X+0I6xRamrD+e/eAXFluA73JqlvazosAmSZAQy3CID
         0h2cI9Eg0mn/bMVudBpcVP8y/27/GNzsa7RXWXP9dEPwvUmODzQkZb7saSTC3JuMM7Ft
         QBUvNfRb9GsoPenq3NTjItHIQ02M2noF1H7gnkkq73vvNqScBLQQi7C7eXcmxHnuqdJc
         a4EoedXtw1oQv9AvEeZHj+pD+wCoJ1uUwW0rj80jx+X+eQX14XtcU8g41atOh/84lP5i
         ItzoWicQKXRrfkf8ywbKgOhqEFTbZMdjZ7RNgUvXkhUSEAReBx1qXLitj10IE8LCCXKi
         zctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742987347; x=1743592147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrGXGtpLu9V6i8WaDAYslIOE9Xmgz7g6O3/KWU/N4BQ=;
        b=X8Dp/iE7i63IZUNytIveBEjwg5v9Dy+9DPk5QKXNZbz50P+N1tnWN34BOwaFnMWrAs
         Ao/wUdwSvcp1joFm4FQS/+tGJclIoQV/mtY6j5QTKhnKBYoVY9ETyFUIbaw/SK/C/0yX
         zJBcc/mMWboXneclwfriOaq54ZOGYTkQ/Esvo6/xOWkKhNRV+6nDtGosMKDxPpxCtVgk
         7U9VzD+nP2+azOWvmJvtdKwRu5p/aA078XcnWuXXQ/ZGYmp5zgYw9tsLuPWbH8TQD4wJ
         w7lB2W9XQADDwMigriU98WYtULTvsHzxPtT0cAU824Pj/G92+3B74vFXL9ItZR1crPFE
         3Trw==
X-Gm-Message-State: AOJu0YzuRpNT+Jz4qiHI6tbaAX2+rAWEfDDl5AuWkSUxIWbtYREtZrN7
	xjF3u6s19Q3Wu6GteU7OKUBhzmqmROasOKxKrYYdiDslTjVcIbYyyKUXnUBS
X-Gm-Gg: ASbGnctOFKZsJzS5QsA4UsIogzM1Li5C+R/0Aa0+1q2w4iZo6OsUKAV1FqjZjx/opnZ
	8GYgB3634K5tvBIaTjaplHuxbwgqlNVaB+uuGyGM7Lpl+10DWToOPiTrGoe9eLHTpRrG7yzCuDA
	sheuZF9QK/YIGwlb4kj+JFFNEJHTPn4As1PORmqKQDdn7Q1iK9zYeDMRFx3js8P+hlG26lqgZ4W
	atAsXtSPal/l3s9UAN+n+IK03pBY4bp3koI03rcdfwwE12tdWQD2WMXGMsIlpRR/l0I2n+dctX2
	dLvRFuGhNfCK1jCpsdqwLBahbUqffEYHt6VTUaKGCrPDFy68rkpuryks4HiZXkuFxbHeDOCM08U
	dHa0=
X-Google-Smtp-Source: AGHT+IEdpeiZOhB9p6BzPG2n+dG5uj/m8aGyipMLZavA4DA41FA6uOxitkCJlsSQo6NctVfLWb7LBw==
X-Received: by 2002:a17:902:d491:b0:224:1074:63a0 with SMTP id d9443c01a7336-22780e0305dmr375094395ad.34.1742987347254;
        Wed, 26 Mar 2025 04:09:07 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm106711465ad.27.2025.03.26.04.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 04:09:06 -0700 (PDT)
Date: Wed, 26 Mar 2025 08:09:00 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <joao.goncalves@toradex.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial support for i.MX
 95 Verdin Evaluation Kit (EVK)
Message-ID: <7ts6jkfg2kfpfhteomlhn5ewxetcaav5bi6x5kgtklqhaa5iph@olxjy6l3icy4>
References: <20250324234013.140440-1-marex@denx.de>
 <20250324234013.140440-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324234013.140440-2-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_040908_793969_9C33C519 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, Mar 25, 2025 at 12:40:02AM +0100, Marek Vasut wrote:
> Add initial support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK. Currently supported is lpuart1 as console,
> SDHC1/2/3 as storage, WM8904 Audio, USB3.0 and ENETC ethernet RGMII
> Gigabit port.
>
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
>
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Tested-by: João Paulo Gonçalves <joao.goncalves@toradex.com> # i.MX95 Verdin EVK

Best Regards,
João Paulo Gonçalves

