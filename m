Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF4C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 20:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om5Bfp+PkOP5qOZjcGL+j5llNNGYv0ie3bisiWxhj8s=; b=NW87po+JFwTi7LrcCOxoS5lZsv
	c4Gl1dhZlxmZOG3P97bPleC61/OKJd8JGwhPHKek9xL+oiTzhHSWVqU/7MLtsNIpqlTBiQDfMLGaO
	zk94BuI1zoWVz/BDpD7GrAma1XpvRN53cRYgiWjF3mXIGEMN3/4Wt3BQl7y1DFd7RWFl/hf1xHsF6
	w5VEKvpr+h9xv7jIrmmcT/ylbkRKg3+7rElAyq4d09eM2Lvw94TQ7ZmgkNGH225vj08xGh5/agZM1
	MC72A3T+GD+YgpzU1wiVPScsINACGgC2GRMajkhDdSkm7nfeER3MMm03ZpEMP8dAYEdtJZtjGMdK0
	0cICqUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59Ec-0000000AnQq-38IX;
	Wed, 16 Apr 2025 20:19:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59B3-0000000AmpH-2Xxo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 20:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74E24A49F4F;
	Wed, 16 Apr 2025 20:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D392C4CEE2;
	Wed, 16 Apr 2025 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834568;
	bh=jwbQ9oSC+bgaYojOoHSAKD8W88U01UB8bPPxIaydNTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1s3VSaGDcRvodSkSBu/l93+kcsVMCTj6Dd3f8waYOCnsQAFMptFDEkOb3Ebse0Bx
	 kdHqtETCZYM2/fxjfpOTH2nmmpJgXH8ONpomhRp+qWSEuOwRlrWA8kzCOh0542q/d0
	 JlhInPY2743cQ4tOTWu+mPB6g3zXGLvEqkDlaidMrlyPFTLfEImnxhh6b6GvAw94t5
	 IcgaDBPkwEfW7tqyLWYf8VR5RLsvurczVEP2OUZg1s6cgX9/042BIoEo8xkhITxD1S
	 qTTbHGQXkFOUALnb1MG5nA0YRi68BiKb56Q/kAu/UVZN58ABpl74uDKi/bTvrr3bnS
	 m4zgkoAtermnw==
Date: Wed, 16 Apr 2025 15:16:06 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 06/13] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Message-ID: <20250416201606.GE3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_131609_775156_B7BAA54E 
X-CRM114-Status: GOOD (  20.42  )
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

On Wed, Apr 16, 2025 at 12:21:31PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ---------
>  .../bindings/timer/via,vt8500-timer.yaml           | 36 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
> deleted file mode 100644
> index 901c73f0d8ef05fb54d517b807d04f80eef2e736..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -VIA/Wondermedia VT8500 Timer
> ------------------------------------------------------
> -
> -Required properties:
> -- compatible : "via,vt8500-timer"
> -- reg : Should contain 1 register ranges(address and length)
> -- interrupts : interrupt for the timer
> -
> -Example:
> -
> -	timer@d8130100 {
> -		compatible = "via,vt8500-timer";
> -		reg = <0xd8130100 0x28>;
> -		interrupts = <36>;
> -	};
> diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7d9dc93b708823de9594d20ef6b7e0367c5a36f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA/Wondermedia VT8500 Timer
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: via,vt8500-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 4

Need to define what each entry is.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@d8130100 {
> +        compatible = "via,vt8500-timer";
> +        reg = <0xd8130100 0x28>;
> +        interrupts = <36>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d131004add981446b08b1b3d572a3daa8377fd61..46339ed45ad18ab2b9470c749f604d9aaf72015b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3432,6 +3432,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
>  F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
>  F:	Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
>  F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> +F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
>  F:	arch/arm/boot/dts/vt8500/
>  F:	arch/arm/mach-vt8500/
>  F:	drivers/clocksource/timer-vt8500.c
> 
> -- 
> 2.49.0
> 

