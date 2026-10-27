Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15C6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xqJ+i8CR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M/p3r4pf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BsTtHMn7/Bq0A/1jvysGVk9cJngoUv9+EZ/xJZLo98o=; b=xqJ+i8CRTYJgntRgVcVJ5bG8BY
	jDj4iJr2Lbj3aDG5RZ5hd23LlroAv31eK+SN2ov4BFI2/eIT728iaZQlae7/nq1EUHySxeJOsxwn+
	+c6s3ASTq/c7IQw/HRta2lcJtsTJJHs5zIPfUjx7inuAsOglljnUu3Jw+OSictVyaXuTVLuzytfok
	tXxWP28Ofhp591mqLMicqjqUQ4Z017LTj97uteGk3jclOXAUxhZlCKvLWFSi/Se8fiUCoM1VCe1Zp
	B9v0G+RgUgGLYbD7K0sArzHJEhaNAPU3yFMhKXfQHVmPCLrdLwg3HxYMR6DF3qTsl0bVI/Id8E8da
	4d0L8fvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc8H-00000003yHf-05JW;
	Tue, 27 Oct 2026 08:02:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc8F-00000003yHK-295d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:02:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4727241983;
	Tue, 27 Oct 2026 08:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5531F01825;
	Tue, 27 Oct 2026 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793088127;
	bh=BsTtHMn7/Bq0A/1jvysGVk9cJngoUv9+EZ/xJZLo98o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M/p3r4pfigJ7VF+xQ0guSGeBUGwLd64vkoeDEiXMbpltCsl9kIARqtyP5zs+5LJha
	 Dwjr6VP1tBEIK1fHQCUZJO45RR3Iyf0I77avSMKMt+k9fvOm+SWpUQHql6Yy+dUK1r
	 UxaLx9qeY9mxHdCigK8e7b2Z4a1x5qR+6UrVoEf/ni3psUBCTB7vx2Yl6842504Zh9
	 0ySfbkpAJKZhQVDAw4qMMoHOByorG/qzjR4YV/ybSyoIbnm5d27zjGLKqrr0exTZMO
	 koEuEpeep51+fCr+T6Kj2scDB2u/QEycVZ3blpmviHRc17/MwsmvyJNTtciBGiamsY
	 zBpYxE8Ttyp7A==
Date: Tue, 27 Oct 2026 09:02:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
Message-ID: <20261027-nifty-reliable-octopus-6cbac5@quoll>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 02:22:24PM -0600, James Hilliard wrote:
> The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
> component parameter register does not report the FIFO depth. Its optional
> register layout also differs from the generic DesignWare integration.
> 
> Add a specific compatible for the integration and allow the standard
> fifo-size property to describe the capacity. Require the documented
> 256-byte size for H616, retaining snps,dw-apb-uart as a fallback.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index e2ca126d58ba..0f8fd0485879 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -13,6 +13,18 @@ allOf:
>    - $ref: serial.yaml#
>    - $ref: rs485.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun50i-h616-uart
> +    then:
> +      properties:
> +        fifo-size:
> +          const: 256
> +      required:
> +        - fifo-size

Why do you require fifo-size if is const? It is implied by the
compatible.

> +
>    - if:
>        properties:
>          compatible:
> @@ -60,6 +72,7 @@ properties:
>            - const: renesas,rzn1-uart
>        - items:
>            - enum:
> +              - allwinner,sun50i-h616-uart
>                - anlogic,dr1v90-uart
>                - brcm,bcm11351-dw-apb-uart
>                - brcm,bcm21664-dw-apb-uart
> @@ -120,6 +133,10 @@ properties:
>        - const: tx
>        - const: rx
>  
> +  fifo-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Transmit and receive FIFO capacity in bytes.

Drop property, not used by any of the devices here.

Best regards,
Krzysztof


