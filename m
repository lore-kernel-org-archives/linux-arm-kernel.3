Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D38D0D157
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdKzkTxj9PTCi1cKdPFw9rGaA7Z5dzLAEvj5bo/sqKk=; b=v38qFMaQIoo2t60l5OdruPMbeg
	D+NFWb8f/ojEE5PE6YlLJdf90R9IhQgJZ305MdPVk5uuswTYxKq/AMfnCrCoPiPVtVwok57MZiaw6
	kLYOA+Vv+mDqcws+v8ccteqioX2Z5TN8F3dVi4VyWqy9CRHRwCld5zt+aZTCGd4MqUt9eQcZ6KmRy
	PRZG1zXUxtalXRdbqm72SAhRlOWDpE4OxT9SykEheXEHro7e8U0YrerzfZRZEWYCh/VM7k8taEwEl
	T8N3RXlxvTuctlFtfVeE+sypIJ2iVqfG77db4VKFWDW/ngIsaKXuMztyV1m+Cpm+NwcNTtm763P2e
	40pIC6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY01-0000000FQpR-0Xf9;
	Wed, 07 Jan 2026 18:11:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY00-0000000FQpG-0mT8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88F1860007;
	Wed,  7 Jan 2026 18:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8804DC4CEF1;
	Wed,  7 Jan 2026 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767809471;
	bh=yTNbHm4Elx5+p4958R6MqgcPSCwr1JI4nhgkqFvSTQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfK1G1cTgD2fle+eiVWG8uWGL3DLjptNzOtIstqyjt6/KrCcdkcRIYkLMAFg5sqfU
	 23DJAQ6Ihpdb0VBgZEj5n4w3P/+Tfctp8rOxcqAdwIfRgsibuGYiVVhEMNkpf5BavK
	 hAE9zfUD/PvELOxL1BnKLd1mySP9UBmDoUgW70rAsQSmNsdrNvRd3AB9QCLwRqAK+j
	 oxVc3cTy7pQnwCk8nZBquR6VX65USIoYM8/BhK/axE/pa5A6txZuUFQ/C+KsYl/Wdl
	 MWyiwSl+/46epZ2ay12CbjJus5BTD4FfLSnKm9atA3rN+Tu5UGRZsB7JumYPu4T/PH
	 iTN8bHn/qzmQA==
Date: Wed, 7 Jan 2026 19:11:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linusw@kernel.org, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.org, lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 05/15] dt-bindings: i2c: atmel,at91sam: add
 microchip,lan9691-i2c
Message-ID: <aV6hp9_AbKm9IAP9@zenone.zhora.eu>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-6-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-6-robert.marko@sartura.hr>
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

Hi Robert,

On Mon, Dec 29, 2025 at 07:37:46PM +0100, Robert Marko wrote:
> Document Microchip LAN969x I2C compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>

Just this patch merged to i2c/i2c-host.

Thanks,
Andi

> ---
> Changes in v4:
> * Pick Acked-by from Andi
> 
> Changes in v3:
> * Pick Acked-by from Conor
> 
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index e61cdb5b16ef..c83674c3183b 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -26,6 +26,7 @@ properties:
>                - microchip,sam9x60-i2c
>        - items:
>            - enum:
> +              - microchip,lan9691-i2c
>                - microchip,sama7d65-i2c
>                - microchip,sama7g5-i2c
>                - microchip,sam9x7-i2c
> -- 
> 2.52.0
> 

