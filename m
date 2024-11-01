Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955E3E6B246
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=; b=JvR1tvaSbWOIsndTri8xNybwJO
	OVuaGeeEgaTJM7QDp5h3Hey9Mw0Pa+yS7nmTCMwaPYfJbo+ngBiSLbz9co2L/sF1fC3KgD6WXH/g1
	NSE7QTTmOidlCYwoZ28+FtdFXOMS8H+3my8wx5fBwaP+Sgb1INctZZTlUZsXt5oCIBttzt3D/9l0v
	PGlTc591/ri/zXiLrWg7H1IvV6YRxzgtpYfbuHQwh5cNZO32/BL2C/oMtKQO9s4oEK1yxGq1IguJ/
	yiRv5EV0bRP7Xn00TMflaHfLE99yMdBbR8Ils2olJIIKRjl6Yketlzrr1pW1CwZBf1E1IrpLFbJgv
	7PrxMhvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qGf-00000006pLN-2zdP;
	Fri, 01 Nov 2024 11:56:41 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qDj-00000006obL-3u2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:53:41 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so28402811fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462018; x=1731066818; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=;
        b=Uf99yC52TOfDweQowWl1s8o8pFaxz4glFRo0XEcI51+C02NDEBWfSa+RkhyJiRnLbb
         qEvhf2amO/LpC6vcslG5d7cv816l+/cFOyU01dmoW0bxkRFibXPNk6wa5CVQzjAwlmVD
         kkhmdNOT6TezRcRLctBlK3T2pahap+G7MfZvfH1cw5UoIl+fdSmXuUbtArNRYvc1D8WT
         kQyCEiwKCoMfMjn2qhCAICGp0mWYknhjgHI4RDE55FaDgwwksqIf/kS0gynQIOVk3eHJ
         P5zEAQfizXDaOtbdJz6b62b65NOSlVcEeQm07MEdwtkXkOM49WPUd5imCe/1/+Rdhx5f
         Lb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462018; x=1731066818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=;
        b=BFIKZaVeULs/zfuw17ONiRbIfY4z6NoMxOf2MJLwfGGcOkiWUC51coE0YyMALpi+Jn
         SSKolYOozUEidwQgF1PkvQAoV6/U3ruz6LZ8shQThQYnNBs1EEkORSXuou0kWOOBqYtM
         EBGglJ5oS9PySxdvyxqNuaQ/Q+nYruM3tasQzs+lHngP4DcEB3JxRmW4OA2wgqD7TaKV
         1FQzuQCyrwkKVHm1SetZZwAowiyrOoKoaloNxZ6ioDFjjD1bolbQsV7IZZZDon8F4xVi
         uqwbTiQfoMcpzg+jeG4QEqMnZpbt844i/cKOv+n0o540T80xyBUVuuqS5+Ss0OhgC9KJ
         sbZw==
X-Forwarded-Encrypted: i=1; AJvYcCVTLKIXpQu4W0JR4OjHe/+FMd7nY3bR/tocUk0BWa2dK5M5VJvZNb8qyDbVIvBSTeAQL1kwM1UpgRRoh3L0CjVm@lists.infradead.org
X-Gm-Message-State: AOJu0YxHmkYNgEtBXZ10XyU6XVt/bRNG2r7JPZDR9TXWT9RAlFzGtPDx
	eC3j8SXYAdHt8J4iCfH9PzkJ7uztvmSRijyGUfQqYw40gvqryvud7mIOE3Nf/R/2ttGoZl8+syu
	H9NJkBmrEfn9RBXCFIvobgUAs6BuXnC1BNKkJ1Q==
X-Google-Smtp-Source: AGHT+IGIi5ao43k/vIAO/lA0KVUBT2iz7DHq1Gqz+0/lE6XQd/R5X3Fft6qTZ9ZmTNYTYQonru0QZ16ntriXjkPbnU0=
X-Received: by 2002:a2e:a595:0:b0:2fb:4fd4:668a with SMTP id
 38308e7fff4ca-2fedb49929amr11134431fa.22.1730462017840; Fri, 01 Nov 2024
 04:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com> <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:53:26 +0100
Message-ID: <CACRpkdaFqtMxE26jA6gWDAps6L58zL3KD6CisxTcVJj-DAR+pw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_045340_009009_F3CC2D33 
X-CRM114-Status: GOOD (  10.05  )
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

On Fri, Nov 1, 2024 at 9:06=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> The SIUL2 module is now represented as an mfd device. The pinctrl driver
> is now an mfd_cell. Therefore, remove its compatible and adjust its
> probing in order to get the necessary information from its mfd parent.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
I assume this needs to go in with the rest of the patches.

Yours,
Linus Walleij

