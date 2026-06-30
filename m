Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E16C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 23:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9xIVbosf1jApgOmRwC3zrz/SlFmK4cYqX7Bcsrj9+A=; b=lKNkjOrtfCQ4c65k19PpO3Bmk7
	BsKvUUTufRzvSjaxtNOip+pBwoyp00C+2FYaVizsB11iqYl1k/Zf/NEon3JtAZdjOlrofceNpIyYN
	H3d1tDI1l3rmPT57+5c1ba5sC0xP60AyB2fRN1PEPz/fGABwpW9i6afU6USYkyzv9XKg7v11bhcpY
	I5pyOPR+8/MqEt8UjtLU4/jT2C2HKsMbbs5YrxADB6+O4u18rBLrsiGLX9oMnJ83J1tSSjhdNdlLN
	6gkNNnwU1l23M14neZm7Q4aT1j5v4lSuwBzvUxYOaR4fBExTFSbYLqvF0f1+GJOnZsxC+4aHWVM96
	JXC7++0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weiCo-00000000NIW-3RCj;
	Tue, 30 Jun 2026 23:49:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weiCm-00000000NIP-1kAw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 23:49:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81B486001D;
	Tue, 30 Jun 2026 23:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF57A1F000E9;
	Tue, 30 Jun 2026 23:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782863367;
	bh=n9xIVbosf1jApgOmRwC3zrz/SlFmK4cYqX7Bcsrj9+A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JMdPXLIgiAiYDr3pL2l39PgCePdIreehKyUdtQn/eFztXnlQ1cVwoaXLY9CJtvQEW
	 d4UsZr7wDyxd8+KRTYs5A8rfZpomi6zzC+GvoGSffB+sk3YDFTGUw8xN69kkgKEtD8
	 t8ShLmfpz43ipyUwYMHBsKDlqzK7ms5B40qKwGfRuu4QSoD1tS8P7OaOYsOHIfLjRz
	 x6q8uhivFYHO/iVYyhbkctklucEcTS6Sv3H0jty2pRSsCYmUVasLmD2cM3Ms38SOyZ
	 EsgL0Mj1FweA5zPlo9iy7B/I26dl0p6FEZW+QhdWJCaYwdGVtHr4UHxjjoVFW0wOvq
	 mpCbqSneD/UKQ==
Date: Wed, 1 Jul 2026 00:49:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>,
 <jorge.marques@analog.com>, <mazziesaccount@gmail.com>,
 <Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/13] nvmem: microchip-otpc: add tag-based packet
 lookup
Message-ID: <20260701004920.2f084a3c@jic23-huawei>
In-Reply-To: <20260630093603.38663-7-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
	<20260630093603.38663-7-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 30 Jun 2026 15:05:56 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add support for accessing OTP packets by their 4-byte ASCII tag while
> preserving backward compatibility with the existing ID-based lookup.
> 
> The OTP memory layout can vary across devices and may change over time,
> making the packet ID approach unreliable when the memory map is not
> known in advance. The packet tag provides a reliable way to identify
> and access packets without prior knowledge of the OTP memory layout.
> 
> Two offset encoding are now supported:
>   1. Legacy ID-based: offset = OTP_PKT(id) = id * 4
>      Used in DT as: reg = <OTP_PKT(1) 76>;
>   2. TAG-based: offset = 4-byte ASCII packet tag
>      Used in DT as: reg = <0x41435354 0x4c>; (tag "ACST")
> 
> The driver resolves offsets matching valid legacy selectors (multiples
> of 4 within the packet count) through ID lookup, falling back to tag
> lookup for other values. This ensures existing device trees continue
> to work while enabling new tag-based access.
> 
> During probe, packet meta data including the tag is read and cached.
> The driver also validates OTP memory accessibility and emulation mode
> status. When the boot packet is not configured, emulation mode allows
> access to the other packets. When both are not available an
> informational message is logged.
> 
> The stride of the nvmem memory is set to 1 in order to support tag based
> offsets, comment in the header file is updated accordingly.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
A couple of trivial things inline

Thanks,

Jonathan

>  static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>  				  unsigned int offset)
>  {
> @@ -140,8 +198,29 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>   * offset returned by hardware.
>   *
>   * For this, the read function will return the first requested bytes in the
> - * packet. The user will have to be aware of the memory footprint before doing
> - * the read request.
> + * packet.
> + *
> + * Two offset encoding are supported:

"encodings" as there are two of them.

> + *
> + * 1. Legacy ID-based: offset = OTP_PKT(id) = id * 4
> + *    Used in DT as: reg = <OTP_PKT(1) 76>;
> + * 2. TAG-based: offset = 4-byte ASCII packet tag
> + *    Used in DT as: reg = <0x41435354 0x4c>; (tag "ACST")
> + *
> + * To use the legacy ID based packet lookup the user will have to be aware of
> + * the memory footprint before doing the read request.
> + *
> + * But by using the TAG based packet lookup, the user won't have to be aware
> + * of the memory footprint before doing the read request since this driver has
> + * it abstracted and taken care of.
> + *
> + * Practically, there is no way of knowing the mapping of the OTP memory table
> + * in advance for every device. But by using the packet tag - the identifier
> + * ASCII value, the packets can be recognized without being aware of the
> + * flashed OTP memory map table and the payload can be acquired reliably.
> + *
> + * While the legacy ID based lookup is still supported, TAG based approach is
> + * recommended.
>   */
  
> @@ -244,7 +356,8 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>  {
>  	struct nvmem_device *nvmem;
>  	struct mchp_otpc *otpc;
> -	u32 size;
> +	bool emul_enable;
> +	u32 size, tmp;

If possible give tmp a more meaningful name.  reg_val or better yet
something about which register.

>  	int ret;
>  
>  	otpc = devm_kzalloc(&pdev->dev, sizeof(*otpc), GFP_KERNEL);
> @@ -256,10 +369,22 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>  		return PTR_ERR(otpc->base);
>  
>  	otpc->dev = &pdev->dev;
> +
> +	tmp = readl_relaxed(otpc->base + MCHP_OTPC_MR);
> +	emul_enable = tmp & MCHP_OTPC_MR_EMUL;
> +	if (emul_enable)
> +		dev_info(otpc->dev, "Emulation mode enabled\n");
> +
>  	ret = mchp_otpc_init_packets_list(otpc, &size);
>  	if (ret)
>  		return ret;
>  
> +	if (!size) {
> +		dev_warn(otpc->dev, "Cannot access OTP memory\n");
> +		if (!emul_enable)
> +			dev_info(otpc->dev, "Boot packet not programmed and emulation mode disabled\n");
> +	}
> +


