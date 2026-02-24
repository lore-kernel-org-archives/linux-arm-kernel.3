Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB51EFB818
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZvD/6XFqfPCPXyr2nRCWetVJUUTym67DrxVL+hwiSY=; b=MXgQ4OmUCc1Dzt19PQwionUhLC
	UYpN+hr+qAZSzevHHmAVdGEWtoyMg0+fGQeL2588BnrtCilj6B4hKca8F1v4NQvVrGYmz+yjdKB/Q
	e1l5txU5heUQPCzVD7UXcs/Bja1RD9yyy4i49ANVgJ+FqVK2mAMSrivdh/djmJ7RzzCT40Z4D0j+U
	aa21Vx1tq1L9m1GGKBPMpoZ+cHYdXyzYq2oRTYBCvLQQ7DByeramE6An9+nlWwGIlwnUOXOf/Mq9+
	eA4N9mTbi1ZbgthkkNbShBYFU4M9U5mf8Z29ZlEOQ2XOis78tj8rzJFrj8bH4ZBTFZyntKV+Rl83P
	HThrbACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoJL-00000001hie-0gFj;
	Tue, 24 Feb 2026 09:02:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoJF-00000001hh4-1QZU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCF3E44539
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D1AC19424
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923744;
	bh=cZvD/6XFqfPCPXyr2nRCWetVJUUTym67DrxVL+hwiSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dPyJblg8XNBIFwgJpnAlSHMQbMmtUYguxmNAU/HeFketfG3kwyCTDuG+0UMKDiRpz
	 aS5EVmby2GzxMFeRj7A6mNbBGj8JL3RySqiJ2Ecq9vnO/N7mrxtDKFvTr6CEmRKlwI
	 xyPu7vPrYyF+F3jMp2KuTAR7LrgKOakDAChpwXzjIfHqCoYRjPbKlPyAdFlLihkobq
	 l0/ZIyUqxEX4VAdNRY17pTxAkGiqlnQpM7uq94XKM8Jukn0N6rHINsrCedIzrRz560
	 bvvnCjUV11WRlyGm/q/GOSIjrgVMToLq0R8gFVAfZnth+kRb0cO6ltXgFGyOwmgHV+
	 HB+5H+ML5/6ew==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64c97997b0fso893096d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:02:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFT+kQySwe6FDerYxvx0woZ6s90E6FSEX3UHPNEBMI9hpd5dPLpbfCYIHLZBIVXKuykIeLZlyzXvpHX9Uoodw4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ovIk9+6lBwGDrGLJx8rWqGwH3bqasNLyyHSJtWauw6cu0GiC
	DVAe5+cuIKhbria4xmo47Wx1a5gyYYDInIrWieE4/Zw/4eBJt4c/U7nr+NnvAhv93Mq4r+TIMyM
	yLXALypKjUU1Wv7fLjNgnGdIk7TXnNc4=
X-Received: by 2002:a53:b5cc:0:b0:649:ca5c:59a1 with SMTP id
 956f58d0204a3-64c788d108fmr7682076d50.27.1771923743916; Tue, 24 Feb 2026
 01:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com> <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>
In-Reply-To: <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:02:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6e-gRMMXBUV0OqdDu0BAsiXmch1mROZJ8VxnSCsf2oQ@mail.gmail.com>
X-Gm-Features: AaiRm510za3zndD0inGMLCEH7QG-m8mCRLz97beAHEtvRk_6T0tZrIsQM9QjFTA
Message-ID: <CAD++jL=6e-gRMMXBUV0OqdDu0BAsiXmch1mROZJ8VxnSCsf2oQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: convert fsl,imx27-pinctrl.txt
 to YAML
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_010225_402878_76D0B006 
X-CRM114-Status: GOOD (  10.18  )
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

On Wed, Feb 11, 2026 at 10:00=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,imx27-pinctrl.txt to YAML format.
>
> Additional changes:
> - Add the compatible string "fsl,imx1-iomuxc".
> - Add gpio@... child nodes.
> - Add ranges property.
> - Remove the redundant intermediate node between pinmux and group nodes.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This patch (1/4) applied to the pinctrl tree.

Yours,
Linus Walleij

