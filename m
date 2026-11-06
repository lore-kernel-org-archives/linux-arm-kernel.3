Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E419A606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xwyAETgf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALNRanyN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SR6xEuyBw6oIvKMIL/6nS4NrG69DKzs+pSRIP+OzCzk=; b=xwyAETgfYqinvdkdKIoBuYXFU4
	RZYLAP8fEYhzTZ6lfsrlIwUMPFSqf3+VV1fZeHX2x0gophCrEULqTl+3i7vLQUXl94zOsUw8pkeDV
	Kk7dATckmzQwbsB8WPCfde0L6IsXBpmIMbn6R1O9g4yQesowQo508NsfN0M1kui+7+aHRqIDmrTNW
	bPUVIXOyMpsk0bt8Cjl2hPf2yDuzQJWW9LGv3NBhxTZtEMP/iA8iC8mTuC4d7NYvEMz9ReTIkagUp
	Vmo/p2lbD7uya1ZNtMI8l+biEXUSMhahWnzZ0DdQSaKWstl1YOorwkM0UPYOENy98lnu/keQ1UTQd
	iGOYozgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIX6-0000000CEI9-3uVB;
	Fri, 06 Nov 2026 11:55:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIX5-0000000CEHy-44bU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:54:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B803A43B94;
	Fri,  6 Nov 2026 11:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0521F008A1;
	Fri,  6 Nov 2026 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966099;
	bh=SR6xEuyBw6oIvKMIL/6nS4NrG69DKzs+pSRIP+OzCzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ALNRanyNmzty5a07tMoU5lStDzErmG7k0viAPR7NaSlvv2c+tHrwbgQf4zg1MnPDj
	 RhpkyVw56yt5GGT5DIJ6r61cz1S+qxxH6xJjt4jiTK9BwhDOX26oeDYiUIid8OJeWz
	 QsnVG8TgekI8swgGDiSZH2tx6GgzwiANiiwsdAEnJtrrmId1sE3QvFcPkmKaZJMvA8
	 Zf602FJMrDhF7We3LbBn4EzZT458kgdPTrTKZUw2GkeKJjJ+xin6ii4Xx4oRSIac0G
	 IMcLjBjv6S2iWgvRN3yHaJIbjOY01nt9Fxu5Ubi9lszqfG1hEL8rxmx23k+ot/ILvx
	 OytGND0Qs6xSQ==
Date: Fri, 6 Nov 2026 12:54:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Agner <stefan@agner.ch>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <20261106-athletic-kakapo-of-lightning-364a48@quoll>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
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

On Thu, Nov 05, 2026 at 11:52:59AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The VF610 controller has no gateable clocks,
> so force clocks and clock-names false.
> 
> Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


