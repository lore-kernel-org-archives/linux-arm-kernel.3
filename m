Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A23E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZmt2/2hkXrOLhct3aXia2sLyPUqBlVydJ41bkZzSWg=; b=LWD7r2n9Ev4CUPxLFBt8RQwpCR
	zlC5EXtnbtB6Iny7ApDsM3BhGhHN4QyH4fgXvMI1ghdDDT7Hfjvfrdq3aiciO5DDVQGG4rG66AQ6V
	6uIbOT/jeTfKj9RshdxH3BjRY7FV8Is+KEekso6g37s7tQq3fKH9VkoBghGzb8zxTcl0EqPLF5X7E
	WH0Ul/d4Of/0QRwKpqCKbzQAXzXbgvHjU8LtFp54r8EaYodZ/trZ2jOo26zXtawEjDd55nVEkhv8W
	SjkjP2ewjgdBUosn+3oPsKpVhLyF41ahziPQqxZN0bTzeQO3i4jTzb13XEKFUrXp8E4zpWSXZkS+5
	QdUIDNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSc6m-00000007EiE-1v5g;
	Tue, 31 Dec 2024 13:16:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSc5b-00000007EZo-0aJM;
	Tue, 31 Dec 2024 13:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 368535C5CA3;
	Tue, 31 Dec 2024 13:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1147EC4CED2;
	Tue, 31 Dec 2024 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735650914;
	bh=nvsh9Hvz0RPwYbdby7Q7s9xJtS8h+MKFRF15jRDWILo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RX7Ao25i/Zdxjq3X/KZBLxYLx85vtFbipwhsDQ7mhWjFDk3q2buj+hBt0Q6Gwu+v9
	 g3s+V1mFrIo1AS/fQIzHIjpKvXkhjQFs5pnpA6nwzvkhMpagfuXdCO1X5XtgyB8GDm
	 g15BDyzzn55qpz6xywhLU+Btiml6oMPSps9ZkZ+0w0ll6E3BibGfgYI2wVDOnFckpg
	 0Q2sehbWgpFjzsblZyMxswCv8W/TtLTHtFGtB5NMOXDHqzregcOttYmtNfRHmyq9Nd
	 83pZqtwdCV7+Kgn/yOkC688PgYFdnXUcC9LiDeDEVMOJDoKm0sBr3OgsZG3ZaFkdN0
	 AffSaO8hqgQ9Q==
Date: Tue, 31 Dec 2024 07:15:12 -0600
From: Rob Herring <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	review list <kernel-list@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Message-ID: <20241231131512.GA45470-robh@kernel.org>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <20241220-media-rpi-hevc-dec-v1-4-0ebcc04ed42e@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-4-0ebcc04ed42e@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_051515_395654_BCC5BB2C 
X-CRM114-Status: GOOD (  18.68  )
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

On Fri, Dec 20, 2024 at 04:21:15PM +0000, Dave Stevenson wrote:
> Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
> and BCM2712 / Raspberry Pi 5.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/media/raspberrypi,hevc-dec.yaml       | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> new file mode 100644
> index 000000000000..d9e804300297
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi HEVC Decoder
> +
> +maintainers:
> +  - John Cox <john.cox@raspberrypi.com>
> +  - Dom Cobley <dom@raspberrypi.com>
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
> +
> +description: |-

Don't need '|-' if no formatting to preserve.

> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> +  boards respectively.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - raspberrypi,hevc-dec
> +
> +  reg:
> +    items:
> +      - description: The HEVC main register region
> +      - description: The Interrupt control register region
> +
> +  reg-names:
> +    items:
> +      - const: intc
> +      - const: hevc

Doesn't match the description in reg.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The HEVC block clock
> +
> +  clock-names:
> +    items:
> +      - const: hevc

Not really useful when there is only 1 possible entry and also when it 
is optional.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    video-codec@7eb10000 {
> +        compatible = "raspberrypi,hevc-dec";
> +        reg = <0x7eb10000 0x1000>,	/* INTC */
> +              <0x7eb00000 0x10000>; /* HEVC */
> +        reg-names = "intc",
> +                    "hevc";
> +
> +        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&clk 0>;
> +        clock-names = "hevc";
> +    };
> +
> +...
> 
> -- 
> 2.34.1
> 

