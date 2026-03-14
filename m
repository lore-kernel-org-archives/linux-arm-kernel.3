Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1F5107BCEF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxfV68uPaBvNKhPXXyfvlI6yblnGwbZBSFspehcg8rY=; b=DOFCRfGHfUo1f/bV9sWttc6rS+
	NB6GIPEcs031S0eJVaapPrz/0mJVPwGBV46t8jsyZKdO/np7E+Y1/dSz1XRH8TMXmFmwIWMfco9q3
	sY7Evnc063g3wnIph7P2YbQV7K1PKi9KQGcmKCG1+TJGVj7j02qj+glHdPrmz7YWjUTBesT6ZdNso
	90oiMImrkQ5CePgGBtwmXxs9Mbv0gUSebAsfQsla/Z3q6PXOa8IEE3QNFSjk0KnDWDVk75EA1Z6r0
	5Mt7FPVo9/3Oj0uWp21kiAUrsal2Fut21/LEx02U25Cy/F5QzCK+agoYAYmzw5yg+0qNSTqq5oQtH
	fknYLMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1D1z-00000001MXy-1VEq;
	Sat, 14 Mar 2026 00:39:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1D1x-00000001MXY-03qY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 00:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BEAD60008;
	Sat, 14 Mar 2026 00:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76799C19421;
	Sat, 14 Mar 2026 00:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773448739;
	bh=mkaGOENEa1gmtvrXYu8nQ+hbKTdiqqEtszypw75YmEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSMMdnS8V1wzMZQMhbCKNINtDMD9y6wXAU3MpkSL9L3U85rIfZE+OW8OFJ3DcdRBM
	 YdlMha2l9YYahxR4kj2FjM9EIsGgGKsjGe240rTgY0FgMVJZ5AYHRLTwGvMLccLVNR
	 sFz2WQNbn3o50gctD0mN1NXAuSglgXdq7HVcmkXMxw5GjT9mcelaYqR8Xsd8RMb8hK
	 owYs8LuW6U1eIxAPP2q7x9okaM4PPhYfZCdM2ZMaZLIFY9zjOyBOMEgHdIwdOD2yZb
	 nCB9x1UHtacCUygnKE9ucVaWoGCNHzYvZqhCViVk/gWDi/9RQutmV0b0MY/ZniJrZD
	 73jOsFDGNuOXw==
Date: Fri, 13 Mar 2026 19:38:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-kernel@vger.kernel.org,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>, Jingoo Han <jingoohan1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Explicitly
 deprecate reset-gpio
Message-ID: <177344873783.3740802.16889031626294728182.robh@kernel.org>
References: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
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


On Thu, 12 Mar 2026 19:43:45 +0100, Krzysztof Kozlowski wrote:
> The binding references snps,dw-pcie-common.yaml which already deprecates
> "reset-gpio", however mentioning this property here lacks this mark thus
> code is confusing and suggests property is not deprecated.
> 
> OTOH, the property cannot be removed from this schema, because it is an
> ABI implemented by Linux kernel in gpiolib-of.c in backwards-compatible
> map between compatibles, "reset-gpio" and "reset-gpio-active-high"
> properties.
> 
> This creates code and binding which is not obvious to follow, so rewrite
> it and be more explicit about:
> 1. Deprecation of "reset-gpio",
> 2. Relation that "reset-gpio-active-high" is used only for that property
>    and not proper "reset-gpios".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Cc: Sherry Sun <sherry.sun@nxp.com>
> 
> Changes in v2:
> 1. Rewrite the commit completely after Sherry Sun comments - keep the
>    property, but add "not" clause to forbid usavge of
>    "reset-gpio-active-high" and "reset-gpios".
> 2. Because of above not adding Richard's ack.
> 
> v1:
> https://lore.kernel.org/r/20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


