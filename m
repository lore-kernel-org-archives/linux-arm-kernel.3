Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78688C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMQFE7rKu5qLFZUqPGw05cu44efDbBtBclMwXW+GGUY=; b=TuL4z7R/N+vhrUbV78OoLoVs/y
	ajINmQ85QIWnpcuf+yIvjLbHjpXUs7TLbT7RxDGjvIfSCxVlWsH+AHlQd/VjiHNoRQkXyO62LOkwN
	8Sb3x2jbaSjWM5OGIBxYep1I4oVSjfwYRs8OigxXl856bag8dul1eOWkB5Gg/Wi2CidcAnq9Urid1
	5S3XJVU4dHn+TWABOXhLnPUMgvz0M04R/s/BsmAPgcz+S0/c/0ydWfDjTIZwGbRkrwLx8pZU0ULwH
	ZNGSWOMLauKFwrKbZeioho7N6/eR88n2xCDLrP69tj7Ur20XY/Rogr6liSOTEm1vdENO7Asr1Fs52
	jTfHwzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwpr-0000000DBz5-05Yy;
	Fri, 27 Jun 2025 00:20:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUviV-0000000D1CS-0CIK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 23:09:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C66E452C7;
	Thu, 26 Jun 2025 23:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADE8C4CEEB;
	Thu, 26 Jun 2025 23:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750979354;
	bh=NldmZOZLq6IiyJ7LGJYUM4TN7NywgseMK5R0ow1fO/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6HSjCRPb3tBYcmnXFW9/p22GYEtwy21hP711lYkpkPd4mwOBVxRGjnHQ3R0KjkjH
	 SEYaHKTFRmOrsANeVQbR/0gO0lyVdUySyGuN/rY0tc7d2HYUz/nPff/5x5H/IaCFpy
	 fnE8s17wbZRpNTjj6dQ0BNJEnU68NHfABTerdjf+qRrS/oPTDeR+tWonZQsbATzqMI
	 JT6yYp1vKUSvDC1luTlH51pdNzV3zoUnDoGheZ2voD4CZw+O5WGtv8WQisUrxEM0ew
	 G7tnTvIhhICfW6iAUzzKrc5B3go9Hu8Kaz39mIX5GklyOJQKnMReDZIaMdXQe75dNU
	 SEebhsihP8elA==
Date: Thu, 26 Jun 2025 18:09:13 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v12 1/7] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
Message-ID: <20250626230913.GA1338561-robh@kernel.org>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617134504.126313-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_160915_122495_45C4E137 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Jun 17, 2025 at 02:44:58PM +0100, Prabhakar wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> 
> At boot, the default clock is the PCLKM core clock (synchronous
> clock, which is enabled by the bootloader).
> For different baudrates, the asynchronous clock input must be used.
> Clock selection is made by an internal register of RCSI.
> 
> Add the optional "sck", external clock input.
> 
> Also remove the unneeded serial0 alias from the dts example.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Rob,
> As mentioned in the thread [1] below there are no users of the RSCI binding
> hence this change doesn not break any ABI.
> 
> [1] https://lore.kernel.org/all/CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTOoenDRY=4H6FA@mail.gmail.com/

Please state this in the commit message. If you want to break the ABI 
you have to say that you are and why it is okay.

> 
> Cheers, Prabhakar
> ---
>  .../bindings/serial/renesas,rsci.yaml           | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> index ea879db5f485..1bf255407df0 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -35,10 +35,15 @@ properties:
>        - const: tei
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> -    const: fck # UART functional clock
> +    minItems: 2
> +    items:
> +      - const: operation
> +      - const: bus
> +      - const: sck # optional external clock input
>  
>    power-domains:
>      maxItems: 1
> @@ -60,10 +65,6 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
>  
> -    aliases {
> -        serial0 = &sci0;
> -    };
> -
>      sci0: serial@80005000 {
>          compatible = "renesas,r9a09g077-rsci";
>          reg = <0x80005000 0x400>;
> @@ -72,7 +73,7 @@ examples:
>                       <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
>                       <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-names = "eri", "rxi", "txi", "tei";
> -        clocks = <&cpg CPG_MOD 108>;
> -        clock-names = "fck";
> +        clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE 13>;
> +        clock-names = "operation", "bus";
>          power-domains = <&cpg>;
>      };
> -- 
> 2.49.0
> 

