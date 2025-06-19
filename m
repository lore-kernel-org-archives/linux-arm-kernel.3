Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84E8C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/7Q/trZ5SbmALMt3c06DmQkKxihbiVngkXZ1QJXJs8=; b=RFZ2VB3SyHIaeY93fZ8bpeY9tC
	FV93ckVRjvxqk+pQn92LHOJ7x+D6e1f9MG2gM4m+x8otM5kuwGaL48YQ0BT2d81lqmcKSg1NY7oBw
	0zhiwLlfqySdQ6JFcTknva5Ws1ki4UDKT6hH+QS2cSWHPmNfBOwHrkJZMD8NCHzoBiG2ZSeySzYnm
	duQyg49g6OTwlMyrILHx3nbT6EgWGRjtcDyjPhl/8e7C3WjUfHsV4FQk+pYpv1BQv8hevxLiiUtgn
	zAGG12ebnzBG1WxZ9sBJ5mYj8IdNydbXn5qxf/Qqwj9QyXKUwbn9qSxvQyOvp67OSlylJy2yOtUfO
	u98cqTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRk-0000000DRoD-3JcB;
	Thu, 19 Jun 2025 15:45:00 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDJn-0000000CqcZ-2zmQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:20:32 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e8275f110c6so564829276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332031; x=1750936831; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v/7Q/trZ5SbmALMt3c06DmQkKxihbiVngkXZ1QJXJs8=;
        b=MeWSq+N6Kx6oW1/Y0fAG8IvrMgLaG5mGnZKaHLQJi+pifGwr1Bz0mzYlPEh/YwF+zD
         jk0ZKZY6cJJCgCM2h8bXLQ1tj3v1WDwIo74c1xeEbR3SkcG1lwDhpFMD/Hl4IlLehlai
         JQlr3WraYKSdZBnJEan8FhZOPX6WvxGe9SNsq3k6IJ0XrPBEfpO8IkLgioOAYAdSw8Mu
         hI2k7R+3dngzPqNzFRU/2h69tow5CFdJDtkvKqgh1z92xjRI9leAhoELgx+M7+x4avi8
         On4tv2xgggKEx6eyn/HNzNdOM5g0mLlsEH3qiPiwfFmBB1XK0Z3XiZvvnQqenu6HtfV8
         kVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332031; x=1750936831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/7Q/trZ5SbmALMt3c06DmQkKxihbiVngkXZ1QJXJs8=;
        b=ppZTIYoJV6+SndcS5pbeGm0WyKvrXmSs37fs6BlHwsX3i7GJN5m58Lcn/4vewdxF3y
         7HKUl3cR0VtjMwrlGC4bN05l+n/9Z7D9nNum09fREhuF8yK8lysprrlpLNL/m8p+086X
         Bjxhl2gh0QA8JsJzU7Bke+hBmlM4OhrIvCBzTeP8PmLHqWwOUs/gVXA10EXdZH4KiGBT
         hijqTY4fupyknjP+zku2XmeVhZE3pHbS3Dnf9/80+2NNck2Os1ruZJF21ED6JxoSydp/
         yO9Pvn3A/1ltb/8tbtTNyfjJxiHnEw3XMX92qENMrMhh3dz8HHkv3/PoPx68icB83lvh
         2eWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgD2BvJuLtZfGg0lxqPTeyiIPOkQJW8IRw6FtF0kCSHaEPEBS2Kr5ZwGQJyXkvtwCl00tekdQR3zQuGrZCrq4p@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ2jwaLqe8v5C59ewNtBNGIIW/knvrj0Y1+3RZ7oOrMJvQvuB9
	Bg1y2UWA+h+LvJZ3oJOa2/uwlI3XJjc0JCTiiJ7TsKI+3y/ayYJg0LVzH65j+cHBBH4P7uH/zdi
	2gbkPpRuzZBeb5RB1RnR3w6HEMLcHcvm7HHvzDInrmQ==
X-Gm-Gg: ASbGncuYN6W8CAkhE8lUI3QjCsTCxPqKZPhozwb+2pw3d4Gc1zp0ja9VUBxxSgYKpeE
	IrLECexa1onlI7MeLMSXQcYeS9ETX6vjiM/+vy5vXE95s1G0OY6nFwsfdCtAmN3sWcgQmk0fzyx
	aebwU8VZFe1BQFG2wzjha8DWmu64FrRPXv7lS53peKq11q
X-Google-Smtp-Source: AGHT+IGY/qzZki/fMsjjuqz3QT3bNQU2e2XUVD7CMMeyaBLxvbqSsIzzLZ3yi5RD+SHlUmmOxvGIAhjFnpWIBIUm4EQ=
X-Received: by 2002:a05:6902:2189:b0:e82:b91:a7d7 with SMTP id
 3f1490d57ef6-e822ac8e43cmr26709534276.29.1750332030811; Thu, 19 Jun 2025
 04:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250603152245.1068740-1-Frank.Li@nxp.com>
In-Reply-To: <20250603152245.1068740-1-Frank.Li@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:19:54 +0200
X-Gm-Features: AX0GCFt2y5yccN4trdKSkYckbzJZTNRqp_GOOavsdhs8BlNDoJbkpBlOUHNguuE
Message-ID: <CAPDyKFo1dAkvvrO_xb3fk8pguTspB2OWxcA-zdN+Z1yOkbt4ww@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: mmc: mxs-mmc: change ref to
 mmc-controller-common.yaml from mmc-controller.yaml
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, wahrenst@gmx.net
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_042031_758101_B33D014A 
X-CRM114-Status: GOOD (  20.34  )
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

On Tue, 3 Jun 2025 at 17:23, Frank Li <Frank.Li@nxp.com> wrote:
>
> Change ref to mmc-controller-common.yaml from mmc-controller.yaml because
> imx23/imx28 use dual mode controller (spi and mmc). So default dts node
> name use spi instead of mmc. The legacy reason, it use difference
> compatible string to distringuish work mode (spi / mmc).
>
> Fix below CHECK_DTB warnings:
> arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dtb: spi@80010000 (fsl,imx23-mmc): $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
>
> Additional add clocks property.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> change in v3
> - add clocks in example to fix dt_binding_check warnings/errors.
>
> change in v2
> - add clocks to required
> - fix typo legancy in commit message
> ---
>  Documentation/devicetree/bindings/mmc/mxs-mmc.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml b/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
> index 32e512a68ed61..df07ea3b81d15 100644
> --- a/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
> @@ -17,7 +17,7 @@ description: |
>    and the properties used by the mxsmmc driver.
>
>  allOf:
> -  - $ref: mmc-controller.yaml
> +  - $ref: mmc-controller-common.yaml#
>
>  properties:
>    compatible:
> @@ -31,6 +31,9 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  clocks:
> +    maxItems: 1
> +
>    dmas:
>      maxItems: 1
>
> @@ -41,6 +44,7 @@ required:
>    - compatible
>    - reg
>    - interrupts
> +  - clocks
>    - dmas
>    - dma-names
>
> @@ -52,6 +56,7 @@ examples:
>          compatible = "fsl,imx28-mmc";
>          reg = <0x80010000 2000>;
>          interrupts = <96>;
> +        clocks = <&clks 46>;
>          dmas = <&dma_apbh 0>;
>          dma-names = "rx-tx";
>          bus-width = <8>;
> --
> 2.34.1
>

