Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49351C2A06C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzt8nsTReCOrFFimHSYnuwYVhyLibD7TXrGiySpB+f0=; b=2WzIAMkUsfVdSwFbXrSPNofKSY
	tLUT/ywT65coCAaqndP+bq6GxBELL3VJGX+mzsejCOcgIFPAvc9JZSm6eLiHvEml6S0gxh893tGzB
	OtReZUdViR2RggqvBg7ImKsnFbpb0i4SulpuTakTLiDPV2dCdOHgj6S0Fv772hNrbn+XAg0Yutf9S
	DwuvZlHTqtDrgHZk8bta30/8JVwN1bPQ1D2Fqko1DJxGsUECnO5f/OmN/jIgZaiLHnFG+W3A7qgq3
	Hfc+xxoa6bc21g/BzNOSJZJRCgGUmo+TmtEOfZF5PJdGGD/7PmXo13Aq/5Hvfj6lOdNRpAY0c+vcv
	4ehui9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMR9-0000000ABpn-0hAj;
	Sun, 04 Jan 2026 11:38:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMR0-0000000ABpF-1sSi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 11:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C6B6013B
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73780C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767526686;
	bh=zzt8nsTReCOrFFimHSYnuwYVhyLibD7TXrGiySpB+f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lSrmBejJxZP8gHrW1lt8qLoXx5i5yIr8c9JjAw76JwT4w2DU5Bw/V3A8ds+61J9gA
	 qrA1BD0oGFxFt5TGFqAv6/RSxsC53w/k7B87GXnPPGu5JyBIFEy/k2xW5XqJfBLQwZ
	 s7To43MM/23LrjwnT2MHsbj2v+MNR3gch8pFv9yPYQDYuMjuaAik+CInCYu5+ZmfZA
	 x9Du36muqnYdgEnwcEtBPGE0Q2krb+xtqRR3x8L+34PJR5hQ5QQvm7VmmsMrN+wnM9
	 I2UaQA0Jag3f/lobO/fONtZhnVUHsQ9680OTtldkoKQt1MckmCleLVqFj0F055vXis
	 sgoDnkXq9m56w==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78f89501423so10866537b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 03:38:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1GdhsClF29NaIxHEhVoTiC/Y2yarYEyrWkCUEa7rl0Z3VR50hbsA61dcA0ISpOJt+EBvEs1fI2vWc+eHGV+2O@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7y+R+gliAZipBSMKzqCQl4eQjtOfroddqXUOEEKtlKrwFLeUh
	U3nhqivnCDQPFRp2B4tvE68jZpJmRysKQDuIfndwtyC3Odkpq+SM8Dg6Dh8s+F0Td7sn8ZX8k/d
	Q+ZcDN3XE5QV9ER1+O5Z6zu9V7q7P8rI=
X-Google-Smtp-Source: AGHT+IF4Orabbp+U3oU6DE4mJfK9KKnbEOxrcm3UcvoG3IBBIUd0oK3DmWjwYq82sAXiIcIbWSh2iznA2Fvf8inAirk=
X-Received: by 2002:a05:690e:b4d:b0:645:591a:cb5c with SMTP id
 956f58d0204a3-646e341a6cdmr3638468d50.23.1767526685648; Sun, 04 Jan 2026
 03:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20251212231203.727227-1-robh@kernel.org>
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:37:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAaAH9_YdTGqHUcOp8PfW+1P=ZLZzS_QseVYWxA4kiWw@mail.gmail.com>
X-Gm-Features: AQt7F2qijkDXeXovdHRRQ5QEL33UZBQlEMiEIzun3p2-rj7cwfnP7kAmQfWhUyg
Message-ID: <CAD++jLkAaAH9_YdTGqHUcOp8PfW+1P=ZLZzS_QseVYWxA4kiWw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove unused includes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Peter Rosin <peda@axentia.se>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-iio@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-sound@vger.kernel.org
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

On Sat, Dec 13, 2025 at 12:12=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Remove includes which are not referenced by either DTS files or drivers.
>
> There's a few more which are new, so they are excluded for now.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Good.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

