Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD54DCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXSJH1a0qCrlXu3jTPMKTqrZAIVF0YLj1lpDK3X8dxQ=; b=nIOjBuNMbNO24z/jfgjpyXTj7N
	jRpfnQXe/bWoGAfulU+abfdi2qS+egedZYQpJuZuMzGaIJKlwG5PgZuJuvgVLCeZMumzswMePaCHO
	AnZfoJvkOGHTDstRVp0Aato6P0lyhX9dYP45vmx+9LIjMQ1onJYWouqFVDEU8GDwEA6LuZFPIr01A
	dwI3NMf3SY0tw+RZURtbze8NfWAOqPfPaPuEv13+3iIZemhdkT2oINsJCPWWaYmlhxlT/ckeEWIBQ
	2vQavc/2DZiMqkttoDFL68dLeRNZvKckunYe+Qs8f0g9zZlp1uS70NwOP4bKfHwPaeuRKxgBvtIP8
	NqKXbC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTCU-00000007Rhk-0E1I;
	Mon, 25 Aug 2025 09:09:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSgw-00000007Kxr-39Z2;
	Mon, 25 Aug 2025 08:36:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB7175C5B8C;
	Mon, 25 Aug 2025 08:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15402C4CEF1;
	Mon, 25 Aug 2025 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756110997;
	bh=WfaWLEgdb3jnJ7oeG9CJd/226yiBCsA11HpFYxtP4ik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AiKVSiOP3IUKqIrE0nTH3NobajH02tOQwEZZspr/7mjkgAUlw30jkvC8fFJFXowLX
	 0WzIXSGAhgnIZdfmsYNAcn0b4ZptW0NHASXukWAToEBV86BHXo8yFsjGa+t+jpI/Tt
	 H+ZFhzDEWliaHAzrUjbGaXVFmIuNuNfh7AaNtL39MnNiHZdp13hGT3OLLrbD9BzYGF
	 7wB6ceHclSvDqzX7iv4OQSAowmeI553BhCTUiYhAPF05UFqNwkDSWYcu6/MhHKuJWY
	 MM1YHmhnjYtTu9F6GpE9Tq3QyysX5PgAziaI/OCrDuEmL8mLy6hZawNVj5zU2+Xnkp
	 8U6Nd0fcpUSyA==
Date: Mon, 25 Aug 2025 09:36:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, Andreas Klinger <ak@it-klinger.de>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Haibo Chen
 <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marius Cristea
 <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, "open list:AVIA HX711 ANALOG DIGITAL CONVERTER
 IIO DRIVER" <linux-iio@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:NXP i.MX 7D/6SX/6UL/93 AND VF610
 ADC DRIVER" <imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open
 list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 2/7] iio: adc: Remove dev_err_probe() if error is
 -ENOMEM
Message-ID: <20250825093622.68c8e5cc@jic23-huawei>
In-Reply-To: <CAFBinCDDMo2Dm1UAoB4QKyf-KKoRUTNNg4i7Qh_vgZh71trMNg@mail.gmail.com>
References: <20250821080723.525379-1-zhao.xichao@vivo.com>
	<20250821080723.525379-3-zhao.xichao@vivo.com>
	<CAFBinCDDMo2Dm1UAoB4QKyf-KKoRUTNNg4i7Qh_vgZh71trMNg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_013638_830385_2194E8A0 
X-CRM114-Status: GOOD (  13.13  )
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

On Thu, 21 Aug 2025 22:31:51 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On Thu, Aug 21, 2025 at 10:07=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.co=
m> wrote:
> >
> > The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
> > Therefore, remove the useless call to dev_err_probe(), and just
> > return the value instead.
> >
> > Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> > ---
> >  drivers/iio/adc/hx711.c           | 2 +-
> >  drivers/iio/adc/imx93_adc.c       | 3 +--
> >  drivers/iio/adc/mcp3564.c         | 2 +-
> >  drivers/iio/adc/meson_saradc.c    | 2 +- =20
> For meson_saradc:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>=20

Hi Martin (applies to others in this series),

For a comment about a tag please use the style submitting-patches suggests.
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # for=
 meson_saradc

Then the tooling picks it automatically.  Sometimes I remember to edit comm=
its
to tidy this up, but not always!

Jonathan

