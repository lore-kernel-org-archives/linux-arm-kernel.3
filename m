Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B26CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2j4Xg82+Ip2/lcscGXYAAN0FTOLzSOwafKLqgXQ6dA=; b=X65j5heRg9NlNrTQYYsQ2urFD8
	X/guYfPSBDjvMKXW9Bn0UxOaJlpbO5PlZ6bsM4mww0Vo69M673VpONg+Ln7tBlrdFOJ5QxUGwwSqB
	H515C3FzFapdpbDZVGRsS1UgQJ94me0BTnL4waYRX/aBy550AnrrL+7KJzWB3coy2DwZWUDgdvK4G
	o6B+0YMcHQ8Kz8VK8Wv++LRhyT8vWlsJxPqt4uZ28dgHsDBVlJ5vyfKo32W8Oj5C/hyTPsdWTVnrK
	jmlg3AlRlqTqUG2iDFfazyNY+3mzTIyOCMJ7UbIG8ImXlhATGy1GCzfGc8p2Fg4+sQSyWvouPREbh
	jr78qy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqT7H-00000007R6J-2LKk;
	Mon, 25 Aug 2025 09:03:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSlt-00000007MNo-0dd5;
	Mon, 25 Aug 2025 08:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8C17404BD;
	Mon, 25 Aug 2025 08:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E789C4CEED;
	Mon, 25 Aug 2025 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756111304;
	bh=K2j4Xg82+Ip2/lcscGXYAAN0FTOLzSOwafKLqgXQ6dA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZBAHoObexxJACm0CyT3rWXmTuEE3szQxoY+ur1d3YdWHQaypq84Bs3bw170XTdiJs
	 Fbkj+dLEIluoQjMCiePR3+JYeu2vjM/kZ5FUo4gmjOAVjqhrIrxUIsYMfm0z55V5z/
	 fs4QYjZqJi7rxJ5VxWWchq/yTvwSj7xStzfihEv9Y/SsfJc5slYpJUGrOf93HPIvFL
	 a0e7q75do94CVIMGHOgJ/VpMIDC2D7nFQOtpeEnLr/Hwr8tUNlSMSo5UrwGktdFcu5
	 gPtDrlIV1iPA+gG1UmsY6pAtRTF1+7Jm+owKUNZpYQ3OlNR15vKbyaHqY2irS2NWEi
	 81EoJrJwx/hEw==
Date: Mon, 25 Aug 2025 09:41:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Haibo
 Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marius Cristea
 <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner
 <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Gustavo Silva <gustavograzs@gmail.com>, Tomasz
 Duszynski <tomasz.duszynski@octakon.com>, Jagath Jog J
 <jagathjog1996@gmail.com>, Crt Mori <cmo@melexis.com>, Per-Daniel Olsson
 <perdaniel.olsson@axis.com>, Waqar Hameed <waqar.hameed@axis.com>, Yasin
 Lee <yasin.lee.x@gmail.com>, Julien Stephan <jstephan@baylibre.com>, "open
 list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:NXP i.MX 7D/6SX/6UL/93 AND VF610
 ADC DRIVER" <imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open
 list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 0/7] iio: Remove dev_err_probe() if error is -ENOMEM
Message-ID: <20250825094128.7d2834fa@jic23-huawei>
In-Reply-To: <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
References: <20250821080723.525379-1-zhao.xichao@vivo.com>
	<CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_014145_207555_ED392CBC 
X-CRM114-Status: GOOD (  11.61  )
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

On Thu, 21 Aug 2025 11:13:00 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Aug 21, 2025 at 11:07=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.co=
m> wrote:
> >
> > The dev_err_probe() doesn't do anything when error is '-ENOMEM'. =20
>=20
> when the error
>=20
Tweaked and applied.

> > Therefore, remove the useless call to dev_err_probe(), and just
> > return the value instead. =20
>=20
> In favour of this series,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> (yes, I indeed looked at all patches in this one :-)
>=20


