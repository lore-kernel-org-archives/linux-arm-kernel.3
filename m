Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D44E606F237
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yCkgQI8U;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boGGx8/S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XSPCp+WIcHbdpqO5iyoSucAVoJTXBn3u+PbDuncVOEI=; b=yCkgQI8UEZVOqWsHHGuLxTQb16
	K/uA9p4d41lPNGFq5u8qYDgsU7f+VXAuvywCnyq+tEWWaRf0b0y/8N9UjqKEMavpWndBB7TZQkGOx
	IgYwcmw0Cdsk/0e3y3deAORkiPPFFiGzvt1b+ZtOMGOjvaXxspnVLaL+Ur7Blrqi9SrPqR482G9ps
	oTz4wACxPofB+/OtODk/ZiK+hu4p16Yhz04QOiHA4o7l5WbTN2Tq/aYfiGAxVYZjqXGv8RNVl4PRU
	sG0nHlIvoRtRDsxOsHJSt0VkhaCWO+kYj/4u4HJDILP1Z2eHCYuZtUp8uLjYuNWGGDgAZg6hmQVED
	7JccoESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvvF-0000000HTVj-0fuY;
	Mon, 02 Nov 2026 17:34:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvvD-0000000HTV0-1mnk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:34:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85EFC602BE;
	Mon,  2 Nov 2026 17:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52571F00A16;
	Mon,  2 Nov 2026 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793640854;
	bh=XSPCp+WIcHbdpqO5iyoSucAVoJTXBn3u+PbDuncVOEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=boGGx8/SSCrZHnJH6HokzRuuYeNmfCfWN6e7hNmfmHRo0cfCQb+W5zOEJ3PoC2dSy
	 3wTaRM1IRiygAzVdUoIb+/L1wZ8lkaKAZ/gmNIuiKUePK8+6FOyfAvjbKJbWiUllct
	 MvJTD4zwtcDkwREOWFWBk1rR4p6zrFov4skl6TlvbkTq6Bjepcx4FlkYFiyBQxzRtW
	 vlUOgz1Zf5EH+chkGPr4uCb4oJTR+SizKci10BmQ09OR+ImPTrfLFdIJ4fckAJRXza
	 UrnHrZTNXd9VS1+cQHSFFzBYFn8R27tGVDe4VhGU6SwuVqbuECKLhMaaC0B7xy8kYG
	 XbY7HjMPxEzyg==
Date: Mon, 2 Nov 2026 18:34:05 +0100
From: Thorsten Blum <blum@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	T Pratham <t-pratham@ti.com>, Frank Li <Frank.Li@nxp.com>,
	Pan Chuang <panchuang@vivo.com>,
	Maxime =?iso-8859-1?Q?M=E9r=E9?= <maxime.mere@foss.st.com>,
	"open list:CRYPTO API" <linux-crypto@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:QUALCOMM CRYPTO DRIVERS" <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] crypto: use dmaengine_desc_set_callback()
Message-ID: <aujJjW1ploEzmcZ4@kernel.org>
References: <20261102164538.3834039-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102164538.3834039-1-Frank.Li@oss.nxp.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On Mon, Nov 02, 2026 at 11:45:30AM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various crypto drivers.
> 
> No functional change intended. Prepare make to struct
                                         ^^^^^^^ to make?

> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/crypto/atmel-aes.c            | 3 +--
>  drivers/crypto/atmel-sha.c            | 6 ++----
>  drivers/crypto/atmel-tdes.c           | 3 +--
>  drivers/crypto/img-hash.c             | 3 +--
>  drivers/crypto/omap-aes.c             | 8 +++-----
>  drivers/crypto/omap-des.c             | 5 ++---
>  drivers/crypto/omap-sham.c            | 3 +--
>  drivers/crypto/qce/dma.c              | 3 +--
>  drivers/crypto/sa2ul.c                | 3 +--
>  drivers/crypto/starfive/jh7110-aes.c  | 3 +--
>  drivers/crypto/starfive/jh7110-hash.c | 3 +--
>  drivers/crypto/stm32/stm32-cryp.c     | 9 +++------
>  drivers/crypto/stm32/stm32-hash.c     | 3 +--
>  drivers/crypto/ti/dthev2-aes.c        | 9 +++------
>  14 files changed, 22 insertions(+), 42 deletions(-)

Reviewed-by: Thorsten Blum <blum@kernel.org>

