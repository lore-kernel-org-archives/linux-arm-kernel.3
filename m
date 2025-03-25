Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB352C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9BYomaOrXBuNI0X4uTrl/CKPbTYsn1WfQ0/aRiNpfU=; b=v4ejdOHyKbFPIJaJqowmhBnnFS
	s6vtG70gYmwMkSCPEI4n68GwnwdsKGwf8V0iT1ykVrHGQaRSCocunqmgsmKOKj9rp2G896h+e9+fO
	720trCmzDpLXv1y6AJrexkaRdwA4lMkQtA6R6KeIr11cnnSXJHkoWzT2P4AdaesI20vYnE+3cSkLh
	rROFN+8YXiw0vqqEBL5P+ooqCu+aXYAqsoKM5+WslEUo+yoU1mPy/mrGQTPGJVXKHznFxuoKRHuTu
	Co33sSanmHZm9TpQzUHQB6Eb1oaGlVFYWFBGLFQfH+UQruojZyFjsz9BN4v6cyy6b33UN6DSQDla6
	1SdOiDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx740-00000006TCX-0nxe;
	Tue, 25 Mar 2025 16:23:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5yx-00000006IzF-2UjR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 15:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=e9BYomaOrXBuNI0X4uTrl/CKPbTYsn1WfQ0/aRiNpfU=; b=j+yDrU3zVBI03Wcch8hCHci3JG
	ObK8XWIZIueK8QIu8qy3hyfRwmzCxVPiKth/r9/oRukd2VptMSMz4zNXl+qmr62l0hmGT8U9PNWIe
	4F8EuwLDAS49lpppIJO5sovZA2YEsn5DB9B+rd9pdhqr1FdKphTUvdnZZnzuOOOkV3lOanOEibvqO
	fJ4W9lAJo5oRvO6qsLbgrDVPQyvvXFKrWoyexah2JufXYOXVe5kxfzJdwRN57RbN34AfOH4j9Zq3z
	O6R/ZrbeTg306AF2bdtlCi4AI0mZnJ/Q3UKOHcNQzFla+7llAsDWlXseo4KTIp37FGEN1EloDEYKp
	ICC6/4MA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5yr-00000005blC-1M1g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=e9BYomaOrXBuNI0X4uTrl/CKPbTYsn1WfQ0/aRiNpfU=; b=SPc4yNT3r+UVTqPntSELDQ9DY/
	nQDCXjZg9NxIiwhxY2lERc9folGnr2s3OC9xAAXT/f9HsqrFiRRlb1H2oJ1H4ssHYmNbXTqezL/g8
	22uMPcvjz2XFkGeTmHu37gbEpdLz4KfnC6IoOW6S3mh4KD7K98AT6QigejSyv/vJcpbs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tx5yj-0074Qk-9i; Tue, 25 Mar 2025 16:14:09 +0100
Date: Tue, 25 Mar 2025 16:14:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, davem@davemloft.net,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 4/5] arm: dts: imx287: Provide description for MTIP L2
 switch
Message-ID: <40c6c272-d4a3-4bf2-87a1-17086d96afea@lunn.ch>
References: <20250325115736.1732721-1-lukma@denx.de>
 <20250325115736.1732721-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325115736.1732721-5-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_151419_079905_35EE37C5 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, Mar 25, 2025 at 12:57:35PM +0100, Lukasz Majewski wrote:
> This description is similar to one supprted with the cpsw_new.c
> driver.
> 
> It has separated ports and PHYs (connected to mdio bus).
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  arch/arm/boot/dts/nxp/mxs/imx28-xea.dts | 56 +++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
> index 6c5e6856648a..e645b086574d 100644
> --- a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
> @@ -5,6 +5,7 @@
>   */
>  
>  /dts-v1/;
> +#include<dt-bindings/interrupt-controller/irq.h>
>  #include "imx28-lwe.dtsi"
>  
>  / {
> @@ -18,6 +19,61 @@ &can0 {
>  	status = "okay";
>  };
>  
> +&eth_switch {
> +	compatible = "fsl,imx287-mtip-switch";

The switch is part of the SoC. So i would expect the compatible to be
in the .dtsi file for the SoC.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mac0_pins_a>, <&mac1_pins_a>;
> +	phy-supply = <&reg_fec_3v3>;
> +	phy-reset-duration = <25>;
> +	phy-reset-post-delay = <10>;
> +	interrupts = <100>, <101>, <102>;
> +	clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
> +	clock-names = "ipg", "ahb", "enet_out", "ptp";

Which of these properties are SoC properties? I _guess_ interrupts,
clocks and clock-names. So they should be in the SoC .dtsi file. You
should only add board properties here.

       Andrew

