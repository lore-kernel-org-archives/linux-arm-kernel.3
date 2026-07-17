Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495FFC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/vXpkNy3cOqlWapaK3O7CEzY3os4he4uAXH6NOiATU=; b=KiNQEok0kxsHJkAmylu9QRpFNS
	G7mAbq3UhRVNBePa1NEqHxVEYLfPjtI4Nk+lsh6v5Jv6zXFEkhl/niqfN5i9rYpWDL023oKNbHb1+
	z+oGThfV5p+8b94UEOIQbn91zNxvyU0NEcLh7y6jXOUDmX1emgeA8JtYEwsU2t4umJ+5hiVl5/6C7
	JDPRKZK1r4IASFsWuBPaTdkWMCPYFh86psVK4fR0oS63ECNjruvLwZUXdVQzrWrVKxhx0TermA7uU
	yZqDzJ3lSw3P3axlZbUx+HtKZwR/B8+92PjFQ8LH6wPXWcDUbq606kRolF7AK4Y4MwoKgH8SS4YCV
	bcxy40kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke0M-00000001elA-0LZq;
	Fri, 17 Jul 2026 08:33:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke0L-00000001ekU-2pUJ;
	Fri, 17 Jul 2026 08:33:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 349C041A09;
	Fri, 17 Jul 2026 08:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AA71F000E9;
	Fri, 17 Jul 2026 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277189;
	bh=1/vXpkNy3cOqlWapaK3O7CEzY3os4he4uAXH6NOiATU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KLF5yoPqydipFqeq8BtY4outpqLJ+2cNkNOIxCagm/G6UaxMtvukMovZPuSlxY1N2
	 txnUltNAw1nQDIIEus7CxEXxm6aix4k1uLo/BXdFj3yrQ9Ef0vowYe528eozK7f4aO
	 kWZhE3VYyusw2Nz/rdoWafYYDw2PHQPqVuah62Y4E/jXeDHospmit6rHS4J1z2jsTA
	 0E38wK2F9iKFeBqddio9b/Ps7u04RTnyBaBT5WdGRdPcVf29FQzpOCHAP1vwfPVC9z
	 EUe4D+DbAMiejBV2IZ+TwSfWJawIjxP/+Z4s+SRaN5UPQY7XoIHsU1e47SqgqqynlI
	 3DWxEmxCShihg==
Date: Fri, 17 Jul 2026 10:33:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO
 variant
Message-ID: <20260717-prudent-indefinable-labradoodle-fcaa9e@quoll>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
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

On Thu, Jul 16, 2026 at 08:51:09PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 GPIO controller. So far, no changes
> are known, so it can fall back to the cdns,gpio-r1p02 compatible.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> index a84d60b39459..7eacf5af6554 100644
> --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> @@ -14,8 +14,11 @@ properties:
>      oneOf:
>        - const: cdns,gpio-r1p02
>        - items:
> -          - enum:

This should stay enum which would also make your diff easier to read.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


