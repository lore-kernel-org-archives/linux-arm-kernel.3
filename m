Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73434C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63aCLAenr8WeJxjEBK4GeDaPD8Vm1UzrQNPs6BAaFUU=; b=o/b8E9eurtdr6gTJxOJkrIbAT7
	CzXQsdPdv2cGr/2bX6tV66oectLFLj8qpOIVv9A/MTNyRO1x8RHaYHMfzYIekiR/y36n8mwAEQ9rB
	GfIpZBBkDMQfzakWC0rqX/vbazveJMDqNFZ1UY1869U7bL7UjMcGvb6WXgWqIRG3dc962yJTGzR8p
	BUWcHTGuPMVARYx3DOJNORIt8HSzEStz8uN1SmmBhtAt07Ev/ijde+97nFpWP/AuJA7cg+EpFjW+U
	oDlmQnnPbUiYYXK71j77tzW+T1Z9GiWNM+X1plGfEUCbkr6M/zOKVQzmCww+XlPGKDOXQkzX4PRWo
	iSaTKIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke2C-00000001fKG-1sxC;
	Fri, 17 Jul 2026 08:35:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke2B-00000001fJt-1gd2;
	Fri, 17 Jul 2026 08:35:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18E0741A09;
	Fri, 17 Jul 2026 08:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322251F000E9;
	Fri, 17 Jul 2026 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277303;
	bh=63aCLAenr8WeJxjEBK4GeDaPD8Vm1UzrQNPs6BAaFUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QmUcmphvyTev+tyhUnKnKF4pnUGio0/8tkVjKj4SrF0FmwpjD/pyvdYPDADdn3rOz
	 /kajA4XHq2PdGW+ZGZZS59vwBiChthDNTMt7ZwQx37zVqdvWH31NMOU8gbhxW8CM5p
	 03wgP7AVkFVUY2utMXQhcyoiYB5GW3rjSgOsl6VW+Q1OPrdW/2JzqSbzaoqxQpXrm/
	 M8lK2zAgrEb7bNw3IOUUNtnYdi4loQpMpGn8QNyYTkAucUfwF/NgzDw2/hJV2M5CH4
	 ZFYT/ruGvs2KSk+NZ5CRGobTg+wo/Gv3T6VqeVzmZ9aV6+ls6b6RwwamYSz08GY1fV
	 l7kozIek5JXAg==
Date: Fri, 17 Jul 2026 10:34:58 +0200
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
Subject: Re: [PATCH v3 6/8] dt-bindings: spi: dw-apb-ssi: add Axiado AX3005
 SPI variant
Message-ID: <20260717-admirable-robust-adder-7aad70@quoll>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-6-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-6-c429095143ec@axiado.com>
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

On Thu, Jul 16, 2026 at 08:51:13PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 SPI controller. So far, no changes
> are known, so it can fall back to the snps,dwc-ssi-1.01a compatible.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index 8ebebcebca16..7b16053d2244 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -41,6 +41,10 @@ properties:
>          enum:
>            - snps,dw-apb-ssi
>            - snps,dwc-ssi-1.01a
> +      - description: Axiado AX3005 SPI Controller

Rather: Vendor controllers compatible with v1.01a

and then place it after the group with "description: Vendor controllers which
use snps,dw-apb-ssi as fallback".

Best regards,
Krzysztof


