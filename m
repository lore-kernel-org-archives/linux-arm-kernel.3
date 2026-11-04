Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FAF606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=43L6q3pU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G/5VxXfq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fDVhLMuiku86DHiqPQ9whwOdau0RLv7fIK2bdbK2q6Q=; b=43L6q3pU+2HcoI
	eyN9UhaAO5KOCp9nwJ/00O6lHMpwHvdBBkJHwrQM4o8O7U7kz1Ih7kBIRzplkzXs0aOzS7pdRUlHu
	qpm+ILJnBlfSnS1EFTaUi3UujP24qer7jC097qUGin1EnS5o9b0XeQLi4/TjY/mqpjuFXqtjaA4hJ
	DrS5ToiLvDr3bM0zkWszOmFLkS8++APtUD4LgpawTp2z/+wG0FaQSByWP27Poq3Ay0xrvCHh0gbX/
	Ji+mWf28UVIU/VzVcWim1tFTJkAv6148U9BD6wlNaAaeQ4MSAU3imjvCgTBP/r8ftXcs/NG5766us
	Od8XHieuIqgFyO8YIxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQPx-000000047VU-2DjX;
	Wed, 04 Nov 2026 02:08:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQPx-000000047VO-0DAe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 02:08:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0778760142;
	Wed,  4 Nov 2026 02:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120171F000C1;
	Wed,  4 Nov 2026 02:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793758079;
	bh=fDVhLMuiku86DHiqPQ9whwOdau0RLv7fIK2bdbK2q6Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=G/5VxXfqZ7dUwQ2BqLdiKSksgemsWxcKYzVba92K9ITd7seECvzGkMTCsggnyuzrF
	 qhvgJ9/uad47m42ZIiaGLzrYk10SkkBMqk2O+YIEPlRF6mqyAYdTKBEemBbp6VeaA7
	 wAJhSoKsU6tXHunaJIQK5xQpZuVTdG7ghWG+dCkgHRTDZ3/PJv9KHf0KDkq17y7pWr
	 nTZzJ5bneFpaP+x62rTc5FVD+HBdiCOUg9SgOgp4/gkuPumzxdcPeLr0hWnsF0l/wN
	 1E3k6PyBFM8BuW20XBwzV131sY1SAe8bw3ssZuevlA+uzZg/Ux5CtrKkqiokkS0w8u
	 cTxaWPK0yWITg==
Date: Wed, 4 Nov 2026 02:07:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Eugen Hristev <ehristev@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cosmin Tanislav
 <cosmin-gabriel.tanislav.xa@renesas.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Stepan Ionichev <sozdayvek@gmail.com>, Felix Gu <ustc.gu@gmail.com>, Frank
 Li <Frank.Li@nxp.com>, "Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable
 Hub)" <u.kleine-koenig@baylibre.com>, Shuvam Pandey
 <shuvampandey1@gmail.com>, Piyush Patle <piyushpatle228@gmail.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore
 <cheick.traore-ext@st.com>, Giorgi Tchankvetadze
 <giorgitchankvetadze1997@gmail.com>, Vinod Koul <vkoul@kernel.org>, "Rob
 Herring (Arm)" <robh@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, Kees
 Cook <kees+treewide@kernel.org>, Michael Hennerich
 <michael.hennerich@analog.com>, linux-iio@vger.kernel.org (open
 list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91)
 SoC support), linux-kernel@vger.kernel.org (open list),
 linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/T2H / RZ/N2H A/D
 DRIVER), linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] iio: use dmaengine_desc_set_callback()
Message-ID: <20261104020750.47a3d04a@jic23-hlaptop>
In-Reply-To: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
References: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon,  2 Nov 2026 12:08:47 -0500
Frank.Li@oss.nxp.com wrote:

> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
Given this is obviously a like for like replacement I'll jump
the gun on everyone seeing it and pick it up immediately.

Obviously more reviews always welcome and I might still add
more tags anyone sends.

Applied to the testing branch of iio.git.

Thanks,

Jonathan

