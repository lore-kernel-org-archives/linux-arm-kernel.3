Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF601CE8E7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oZ0Ac+x+u3ydNa0cYENMIYLIzmnwWSTLS7vwsd90kg=; b=oHBfHB/rjhj6p19Jksr7RCqEPd
	d4ant8Uxm2Ur1kJc1JvSwexAUcnizi5ZjvRkktXUu57VX636RUpSgDoyToJnbFo7V1RNAjSTmV7m9
	4d2gof33QZGWUPcvA72rbSW3LxwRRNeKKk8Zuht7BRvOIE6y1j+SKxneSAMVxWzpiL6RXHOeinVTP
	oREEwipzyzYZIZ610Yl/ltqd5GyCWFojOO5zep+omTlKbFAoAbLlI81ps9mmb7/VyCq+5rwdHMCei
	KzZoim7OpHiKfUfQKMtoCLA3edVfbApilmlfJfWGsNfyu8pM3+hyK9om9FxiVj2LyJuTIsc+e+H0M
	W7tqQfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yaJ-00000000evN-13iT;
	Thu, 24 Oct 2024 14:13:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yY9-00000000eJ6-2G32
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63AD55C4B6A;
	Thu, 24 Oct 2024 14:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C82EC4CEC7;
	Thu, 24 Oct 2024 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729779052;
	bh=krhQtm4zm/FOYnIE/tGTH1SAlqRa2tX6XY57qn26xao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaXSy15To3yTWqZHs3NhtB2LSgH6UAKPlDgAu9RHa7JIE32YuivGXDueV4FJsc0Tw
	 lRqaPHtdG3qBZYD5Qa1rFHI60A/Ycbt1R3a0Tvi4UHj/XI79cjebGX+eXnhOtMxebT
	 LoVkkICu07poQAwYKfRkUyk5ghneAKiIaEcs7Y5cUeRXiNWO8eTopBCuATsoWN8OuE
	 3htET69XX7c7wzvKmIDpHgkiikShCdERETvy10+a/a4DeA1uG3N4db1hJ5VMJ3olRw
	 kH3yqNZuYnYbEr90UV3GeLXvIRW3KNvQZ740p0vydbItEgdY/nMt1vF2bvHHOnMyUn
	 ZO8TO5vQq8cwQ==
Date: Thu, 24 Oct 2024 09:10:50 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	ukleinek@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v1 1/2] hwmon: (aspeed-g6-pwm-tacho): Extend the
 #pwm-cells to 4
Message-ID: <20241024141050.GA246869-robh@kernel.org>
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
 <20241024071548.3370363-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024071548.3370363-2-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_071053_642579_EBBAA4BA 
X-CRM114-Status: GOOD (  17.47  )
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

On Thu, Oct 24, 2024 at 03:15:47PM +0800, Billy Tsai wrote:
> Add an option to support #pwm-cells up to 4. The additional cell is used
> to enable the WDT reset feature, which is specific to the ASPEED PWM
> controller.

Use subject prefixes matching the subsystem.

> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Change-Id: Iefcc9622ac3dc684441d3e77aeb53c00f2ce4097

Drop.

> ---
>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> index 9e5ed901ae54..0cc92ce29ece 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> @@ -31,7 +31,11 @@ properties:
>      maxItems: 1
>  
>    "#pwm-cells":
> -    const: 3
> +    enum: [3, 4]
> +    description: |
> +      The value should be 4 to enable the WDT reload feature, which will change the duty cycle to
> +      a preprogrammed value after WDT/EXTRST#.
> +      The range for the fourth cell value supported by this binding is 0 to 255.

Wrap lines at 80.

>  
>  patternProperties:
>    "^fan-[0-9]+$":
> @@ -69,3 +73,22 @@ examples:
>          pwms = <&pwm_tach 1 40000 0>;
>        };
>      };
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    pwm_tach: pwm-tach-controller@1e610000 {
> +      compatible = "aspeed,ast2600-pwm-tach";
> +      reg = <0x1e610000 0x100>;
> +      clocks = <&syscon ASPEED_CLK_AHB>;
> +      resets = <&syscon ASPEED_RESET_PWM>;
> +      #pwm-cells = <4>;
> +
> +      fan-0 {
> +        tach-ch = /bits/ 8 <0x0>;
> +        pwms = <&pwm_tach 0 40000 0 128>;
> +      };
> +
> +      fan-1 {
> +        tach-ch = /bits/ 8 <0x1 0x2>;
> +        pwms = <&pwm_tach 1 40000 0 160>;
> +      };
> +    };
> -- 
> 2.25.1
> 

