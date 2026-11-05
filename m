Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E60606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hLIE5t8M;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4HEJQmN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aCqimnZwAFGyowHxGlAlEMRT7cLaOWAjaF+PQzroRbY=; b=hLIE5t8MghkIKWbjlziLUauMWU
	UIYmhVDsfyI2eBjrxrtEb6f/RUu7AlpVB21k7F2l7QVMaL3GDY4CLJ3f8nycbzqYKOFqTrSJWp6hr
	UI4hJo4F0BeVjZAtHFo6e0yjCjAbLWKUze7smvXNaNdyzxHTL6T6EJNfFnk/lgfh7ZlfZsd4zYpCY
	aDm88wFcc02/ifL/Sp+mZEuWRXLtwj/6DRnkYNNucytRq3WWHPhRsuNK7bWhGvnV9laO04rJlnkwW
	bhaju+C/7I9wwd0j9er7bYSNiGMwQz+Cn97r/6klY6g5jiVhYCQPCv5UXvtba9pNv7e8Jio/JIXDS
	mmHRaiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOse2-000000086zK-04q3;
	Thu, 05 Nov 2026 08:16:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOse1-000000086zE-04kG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:16:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 55C53601F7;
	Thu,  5 Nov 2026 08:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2CC5D1F000C1;
	Thu,  5 Nov 2026 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866584;
	bh=aCqimnZwAFGyowHxGlAlEMRT7cLaOWAjaF+PQzroRbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P4HEJQmNW8JflOOJimMB1ufM60UtpVCT7i2H/JZMGolOesBwaicWwAoP+7XGeRUx5
	 n4pPm2NgpYFgl8xhRPdq+GZqMLRk74kHgespXBg6iXwzQb/OovDkVOjTiLOT5dKzCW
	 5e4JBWrs+16xt47L/Yx1qP16aZzUmeK2tyMet7MZUXIu9Kqxo1BNokGAgfkW+j2Fb6
	 aOdOYy7K5Gsr30p32CUrIqdzpn+4AkzBT8527s1M2AwcbIIXYNNNSVqAooQ0yb92MA
	 zJubGfq3ZRff9+jBPiN9WAJSSv0PJ2vk42DibQp6jsKIZq4E7ba0K1e/fB/1DHAii9
	 abufRnmE2Ff0Q==
Date: Thu, 5 Nov 2026 09:16:16 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jia Jie Ho <jiajie.ho@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	T Pratham <t-pratham@ti.com>, Thorsten Blum <blum@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Pan Chuang <panchuang@vivo.com>, Maxime =?utf-8?B?TcOpcsOp?= <maxime.mere@foss.st.com>, 
	"open list:CRYPTO API" <linux-crypto@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:QUALCOMM CRYPTO DRIVERS" <linux-arm-msm@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] crypto: use dmaengine_desc_set_callback()
Message-ID: <rbrhsoidlozxq3fjrnoeqf6ehb75fmbs7tv7de6dehocc4thxi@5sfhcuwuda3o>
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

On Mon, Nov 02, 2026 at 11:45:30AM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various crypto drivers.
> 
> No functional change intended. Prepare make to struct
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> # QCE

