Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D75FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMmWW278S3Hwy+hLP82+XTpci0VAB4ee7BNXBj9aT9k=; b=upe9LGEC2kKyfHwy65DRwxx7DM
	d+KDHMr4vPIyKaOxpfqjsBZwDI0sSVkqaWYixGfv/ecf/tnsQZ4sS24pC24ljWu39h2D7PXypnWGN
	hHUgYO+3YKeYbDeODN636dbzHhOVe48J/7xmxmAr4OthGiiZg9Q5Egb5NV8c6B/QKKTIMvDBosnE2
	xRf1FWOD7FG86NV1sy2/N4wjtW8Zgx9Bp9L6HiHjqPEZRYC54A960wgcmBdDUK3hh9CGZVjQixWU8
	cGYw2At1nmVxXsc3d7u8Z1QUF29MQH+dKazEq2Lx0rDhPww44Elao1G6uf1BxnyvxLyM2cC6L9dfk
	uuxIhafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsL7I-00000008ONr-2VTG;
	Wed, 12 Mar 2025 12:23:20 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKDQ-00000008FSk-3LPv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:25:38 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6f768e9be1aso7975457b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778736; x=1742383536; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMmWW278S3Hwy+hLP82+XTpci0VAB4ee7BNXBj9aT9k=;
        b=b4BUeWEOxpgQNI8l/UoiPKSPnxj7ar0u21vtgBmWA0M7EmM1tAdJOQ6uh8xb2f1rKd
         Eef0NeGxzUr5sxv2Fj7BGhZYiMWPSKGIN476SkudVbnMHb+o1Zl60P3khxl1oe38nB2f
         h+oJzZUytdZHpMyTX3d3RnkmyVyo1c4Y+AfhMaLiE5/25NPm0N0Os3+c6QXCeL3okCDI
         oALOSIrsC/r6fmBehJtjvklBbT4nOddXwSsKTP3KBPlte6gSIzj8Aiy6S5ivR1mRKVLZ
         Cn8i8PuO4CDHsoVxxDsRBqX1JKwvA0InAOvIOyU6Vy5Im5GskXJEEoNuSUFZmrxJM2mp
         p2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778736; x=1742383536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMmWW278S3Hwy+hLP82+XTpci0VAB4ee7BNXBj9aT9k=;
        b=gUCZElxa53BDuSjvGn8YARlH8UJhVWHOx2bm04q2goD2kvC6hTEUtYNv7uAiwLmq3t
         KlG6MSBsmSBowVSuULCXaxROqXAjlAWAkudYzIxi9LwUDvTFTce35NBM8X9Gg1KESXtB
         mcwi55FftHnRTEHJQdLSd8H4THGCyOgY4Q6qyih5x/5cX0Pbht6L2q7wkOZ+TeGtJLIH
         0T8KxLojMauGui5KI8XztG4An+kM65B72QANQ6MWzX4uFe/0FZc/3ASEG22UU73zahNa
         J9jc58C4NtT1RLwjj3CAJpjdkAO7RlJwQdltO5twsy15NuaW2Ehvj9b2UL0SUYAsK6nS
         17MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj6vCzfZnrqRIUVTnRdg6MuVFtFTnJnOXxxLJN2TidKY3zaGHVjDPn+3oeSBY/CA0Ea87RBNzvrk+eXpzVG0TR@lists.infradead.org
X-Gm-Message-State: AOJu0YwoMM8uAbM3KZfEGAOXigJHaCr/1As1HWqMFgjh6tmAYyikWu0A
	EhuQCWLuyLuNHViz2ffKYI2ZlGmYSWRzyDYt1w512Czys98jz1pkyb66cfO8yHoou/6dziDBv/U
	oe9du2NKze/3Mv5j292swUXIm3Wr8dbgsaQO/qw==
X-Gm-Gg: ASbGncu8iaQ+TYsE67p33QWtVmoPQ1JVrIKd6xrD/XsW6XxkbynqgM8lXDs9hAaPliW
	mgM5vrgpO8L0iqzTAYafBc7yumWQioeoCOTJljcWf3F9weDOwxoCJehxpn3oIt5QnM+Be+vwjgL
	QP6EmlzpEabxbdFGYi1oUylcWmjFY=
X-Google-Smtp-Source: AGHT+IF+2TUj0AijHF6r+vPxRqI/7rfE3ie+f/dBAlUG+gV7qBwbChu82fS6cFOmTtK6ezNyic5kn3RkBhCY6+/TI2Y=
X-Received: by 2002:a05:690c:7207:b0:6fb:b38e:207e with SMTP id
 00721157ae682-6ff0a33c8f8mr83949777b3.14.1741778735829; Wed, 12 Mar 2025
 04:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250307005712.16828-1-andre.przywara@arm.com> <20250307005712.16828-2-andre.przywara@arm.com>
In-Reply-To: <20250307005712.16828-2-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:59 +0100
X-Gm-Features: AQ5f1JoiQnCX1EBg93UaXE5EJlbj1n7TONyL__Rgw9VQ-gzhs1UrEpRxnqBou7Y
Message-ID: <CAPDyKFpFgNjy+Tu7ZKB05m55HAf5RQ+AFPgk+6Q8_g1xu0akng@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: mmc: sunxi: Simplify compatible
 string listing
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042536_838169_9B68A48D 
X-CRM114-Status: GOOD (  14.84  )
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

On Fri, 7 Mar 2025 at 01:57, Andre Przywara <andre.przywara@arm.com> wrote:
>
> New Allwinner SoCs only occasionally update their MMC IP, leading to many
> pairs of compatible strings, though there are sometimes a number of them
> being compatible with one particular SoC.
>
> Collate the compatible string listing in the binding, to group those
> being compatible together. This makes the list more readable, and allows
> for easier addition of new SoC's MMC devices.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 36 ++++++++-----------
>  1 file changed, 14 insertions(+), 22 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 0ccd632d56200..8e4c77b7e4ab9 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -30,38 +30,30 @@ properties:
>        - const: allwinner,sun50i-a100-emmc
>        - const: allwinner,sun50i-a100-mmc
>        - items:
> -          - const: allwinner,sun8i-a83t-mmc
> +          - enum:
> +              - allwinner,sun8i-a83t-mmc
> +              - allwinner,suniv-f1c100s-mmc
>            - const: allwinner,sun7i-a20-mmc
>        - items:
> -          - const: allwinner,sun8i-r40-emmc
> +          - enum:
> +              - allwinner,sun8i-r40-emmc
> +              - allwinner,sun50i-h5-emmc
> +              - allwinner,sun50i-h6-emmc
>            - const: allwinner,sun50i-a64-emmc
>        - items:
> -          - const: allwinner,sun8i-r40-mmc
> +          - enum:
> +              - allwinner,sun8i-r40-mmc
> +              - allwinner,sun50i-h5-mmc
> +              - allwinner,sun50i-h6-mmc
>            - const: allwinner,sun50i-a64-mmc
>        - items:
> -          - const: allwinner,sun50i-h5-emmc
> -          - const: allwinner,sun50i-a64-emmc
> -      - items:
> -          - const: allwinner,sun50i-h5-mmc
> -          - const: allwinner,sun50i-a64-mmc
> -      - items:
> -          - const: allwinner,sun50i-h6-emmc
> -          - const: allwinner,sun50i-a64-emmc
> -      - items:
> -          - const: allwinner,sun50i-h6-mmc
> -          - const: allwinner,sun50i-a64-mmc
> -      - items:
> -          - const: allwinner,sun20i-d1-emmc
> -          - const: allwinner,sun50i-a100-emmc
> -      - items:
> -          - const: allwinner,sun50i-h616-emmc
> +          - enum:
> +              - allwinner,sun20i-d1-emmc
> +              - allwinner,sun50i-h616-emmc
>            - const: allwinner,sun50i-a100-emmc
>        - items:
>            - const: allwinner,sun50i-h616-mmc
>            - const: allwinner,sun50i-a100-mmc
> -      - items:
> -          - const: allwinner,suniv-f1c100s-mmc
> -          - const: allwinner,sun7i-a20-mmc
>
>    reg:
>      maxItems: 1
> --
> 2.46.3
>

