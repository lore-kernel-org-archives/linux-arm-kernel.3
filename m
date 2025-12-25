Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4139EE784A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHOlNr3v9BiOzT34bmSgwncIxbpt67Zq7y9gx9VnnAw=; b=gbKXVhidgqvBAG
	/qRmBcYvdrgJpX+oYcHxaG+tgSbuMIFR9F9Y7A3UrnrEJ6EQ1BoYT+bgfctE1if+g/KnfqgyZ7SUq
	dfFNxgSk2+dCiUc3zEuTqW34HfHEdMSnYxjO5I/aMRO9xybP5aWc1Knog/54GrVno9xylbLvtcoyD
	5jLPS6Hgc9E6chgWGB4SXDEFdjhy8gGmR2LfrUq0D8kv96BRum8S/xTgSShRcFg02l3PLLRm8q96i
	Ra3L4Bor2NW4bux26V8uuDb2FN2H97J+FIfHX0z+h3Bp/xtgGxdRRqtYIqqBEu3+12mwgP+OJDJ/Z
	O7+SG7ls6e/UhUeX9pQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhK8-00000000GCT-2haA;
	Thu, 25 Dec 2025 09:07:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhK5-00000000GBh-3b0j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 09:07:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08DF644497
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC685C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653672;
	bh=hZc1+DU7BxaZ0pHjHw8/tfR/Nq71rMC9Z07diFqHTEw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=CT8cZl2uFKLiTpaQOQBp9gYmCflZEBYDeYfJB/2enatbFWeqPj6/ldI8cWJeC2hxj
	 rqgDICrR1nVDeyu0zbuJZiULKiiPUMu79YfHcDbOGAmgD4b9eV8akAOe1m0DcvTlB+
	 XOiAmSVHMcqj676aNSLd4X35T2IUpDCWLOKMJ/4NhD/sM+6vsUso+GxZI2UIt/yZ4Z
	 koo4vF8fZtJI2H1LW1oY6DvYpOPYJWlj7IlYMFyv+PzR3MAtThGqDIbh69Bph9I9IO
	 Gb6TLDUaEiRhiI7y+k0bZiMMw2PTd6/MM1YU4jN226aHcHLSFqZLN0oOl17hWq5Sij
	 8iWe4DrFAmjHA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so6843749e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 01:07:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUECZuHwEeY23xF7oiYMTHzAhRbMg0XNwE0t4MruzOyM28r54GYXXWTAhTNEdnVGcbZLC80zW9cPJLiKlAw223Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7CppPX+iUbjI4LxDxhbpdwfpT9MofesxxuM11bHKurq55hCRq
	1V5RQToxi0iWbsOidoVXTsn8d5mw9Kz1UKOVhlaq6pa2a1kq7+DmK0cA9QEhs4w6ai6llzCzCi7
	Y4TjWzBnJmf8smnzgoB2JIG9iTAEqR0M=
X-Google-Smtp-Source: AGHT+IHfPWz1heWtm82AOh8ny5sgT9kzx+lyzDjyJcBgqVf6WZJpwpmEyZeQVabkjvt5oV4xlzU03UcKE5H1xk8UgF0=
X-Received: by 2002:a05:651c:1470:b0:378:e0f3:53c1 with SMTP id
 38308e7fff4ca-38113275820mr72648701fa.18.1766653671109; Thu, 25 Dec 2025
 01:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20251212231203.727227-1-robh@kernel.org>
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:07:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Pt=c7rNtE-u7j_=SbT4DLw03iOw=PFchbisPQenhOtg@mail.gmail.com>
X-Gm-Features: AQt7F2qwpZzDsTD1g9DqdU3xoJFe0KlIMNtkshCEa1nlt61s05fF43c85tHciK8
Message-ID: <CAGb2v65Pt=c7rNtE-u7j_=SbT4DLw03iOw=PFchbisPQenhOtg@mail.gmail.com>
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
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_010753_999069_D541A159 
X-CRM114-Status: GOOD (  11.71  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 13, 2025 at 7:12=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Remove includes which are not referenced by either DTS files or drivers.
>
> There's a few more which are new, so they are excluded for now.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/clock/oxsemi,ox810se.h    |  19 --
>  include/dt-bindings/clock/oxsemi,ox820.h      |  29 --
>  include/dt-bindings/clock/qcom,mss-sc7180.h   |  12 -
>  include/dt-bindings/clock/xlnx-versal-clk.h   | 123 ---------
>  include/dt-bindings/clock/xlnx-zynqmp-clk.h   | 133 ---------
>  include/dt-bindings/dma/jz4775-dma.h          |  44 ---
>  include/dt-bindings/dma/x2000-dma.h           |  54 ----
>  include/dt-bindings/gce/mt6779-gce.h          | 222 ---------------
>  .../dt-bindings/iio/qcom,spmi-adc7-pmr735b.h  |  30 --
>  .../dt-bindings/iio/qcom,spmi-adc7-smb139x.h  |  19 --
>  include/dt-bindings/memory/mt6779-larb-port.h | 206 --------------
>  include/dt-bindings/mux/ti-serdes.h           | 190 -------------
>  include/dt-bindings/pinctrl/mt6397-pinfunc.h  | 257 ------------------
>  .../power/allwinner,sun20i-d1-ppu.h           |  10 -

For this one, a node is present in the DT, but there are currently no
references to it, and thus no users of the header.

Also this chip hasn't seen a lot of interest after it was initially
brought up. None of the peripherals that have a separate power
domain have been enabled.


ChenYu

