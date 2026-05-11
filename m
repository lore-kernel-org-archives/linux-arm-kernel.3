Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B72CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=; b=GtGUO1oJ+eY6V0mrJ7ann/tvaU
	WwaCfOSE/kPgTl9TyqNqdJb+frRyhJ/mHwE+hv1Nj5ACVCfhJ2eul8F4z+5IVVPegtSqAKW+M3YA4
	uGKxF/G1GGZrI3NYy8dznEoyVqOo1ukqYl+S70nppvXGhpXAlj906OruqUv/Yf0nMeTX5YFgp0jW0
	8p3B0GOOMcZLzXBH3OCPT8qAWvuS257Beu6aCJq0qNikM4mtxXQV0jKSMxt4sQLi+XtjyEbeknzF7
	2UPsbQmmlD7GuJrPV7lUBA+/bQLR64ZYbxK6i3n3Ss+u7Zi7EN3LF0wfF9mzEeX2jLjF+2RiHI4Fm
	50zeByAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkR-0000000E4cx-0toP;
	Mon, 11 May 2026 15:40:47 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkO-0000000E4c7-2zIC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:40:46 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a8891f0c88so2597891e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514043; cv=none;
        d=google.com; s=arc-20240605;
        b=VzFlaEFdvwk1orU7kPM/OeEmzDb2KfbScaOj9jSoUPY7ZU7zP2ggS/eY/bgZAGMpIf
         mr7KM2FPemck0hBN9NUq1HYsspObsoE9kzQElZ2/aJcriYXM1WoPHIFm16TvxGc72LyR
         SmFSnqHya/B9ijg3/a+gDnVWzMmD+e6KFZL15Qf+K5jdklw8ND8CeLR6iCBii9vfhDr8
         f8JMDbs47ozckwCcms8i3EGjJIGhacEPYx+Z17/pZN19xQ9xuma5IJqSYSVOS1sofw2+
         3UayvKVMYovTpubOgKP1O4XOzfJQb6pfdpPz+8tR4GuR6OeqgWZdlfHMnM3HezMNV11q
         AR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        fh=CcVIFMthLY/hxPGKl8x4JY4dn+XNluPajOg4Ql8KRmg=;
        b=SlLxVe9+j0hGk8uH91ivQ0rJ0qWMUpI2H3LDL6Au2OaPH06hNqRe12hm3EbYurkdoz
         vF2zRZ2NPdaL/VP26et6HvN2sIZlz7JjvrNUu36ADU5xEw1dbNXMzlkHPKXgj3nYagYq
         02HW4RfB8lx8toh0OIAI+NRHt4cVqD76Tlx5+IyvrwZcqlEYPNqz4I0zoCVVkOgp3s/v
         H6pDilhOxtZdEWIQ7qTt9f0Mxnm2Cka1CDgWnZiVywj/OI5Pw2zFLZZ9qezJTnKvm8Tm
         2w5KE/IpKdpBAvg3e+XHikNBtTjfpFG6ViWWpaaSUl9SXj4ZfiTcsM/pt62zQwGEc52r
         ZW3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514043; x=1779118843; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        b=LYdwXD8GNV9wA27DuzBw730NvbI0HeDWzMdUoXXH2a4kjjOTxtxb4A4Ec20g3pRaCn
         641srRPEJahsBIWe1xE3guSXxZCRDcow9ADrO8Z726po+Pj0GjiD74KgE6TCTIQNewWN
         vTzRmLDlJxr3jCuMLI3YTQ3ZEFK/xalsmPTHMK8bnOySb3E2Laax+rverp9ZcdNOeMR6
         iY8ZKMUQQzdQvzKgS7/+YKuZOTOhSwlLD6L90H8z/QFgTjkneoPk1j0ytxaFFXg3lL2q
         uLBSqDabFNilS2oakgRi1P4XX/RmkrlLIA4+ky2sNayxnenwd3KDYWPUAdylIhSRBUQK
         hClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514043; x=1779118843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        b=AGEpBQoSyYwHOehLdfMygwjdizfImisRlZKwrXyiqlzlGDYdbnecpB00R7Oh0pHCxI
         yo8SLL4oFZZlH2gYlwXfRYbO94T1Q2j3V/Ri7dbcL1LVOhnd3UGqb7mhUcVtH8lO77//
         35Y7UpNL7W8BYmypCrp36gmG7KHxA9JV8WQNHT1ZJV+ktsmxIVgVgM9Q51lPNEV+Mmk3
         y55dMpwbXm7J3/eVj7pPXhPm6t2DfG5ypnsxEM3lDdwKBLaj1Sby+/d/THv4+po3mvp8
         O2Qpk1zGyY2aTVq0QDNKKoIgiOBd7I+VNIpfYWQoxAzUonYH71wyRmUglvV/Oa6fiOKA
         zEXw==
X-Gm-Message-State: AOJu0Yxy2L6pqXZOftWuVMc0MpGorhtkRKo0ohRkXQHQlMsTB0Q+Ab9f
	plbyw+4LOvu0Llfx+lm/mXKlaoM4WTVzKOuIGg8jDdRj9fXtbaygfa/GmLHfJJYkjqCnH4duyYK
	havrsZCEWuJfD/cXt9IQ1SXFltsQl0hgAdWzkuCth5Q==
X-Gm-Gg: Acq92OFHQId88ftcxTzeK7GeMZrTKEXLl1A/nm4Lmzqa/UwLjlFTX7DcaajpU0A8JVm
	ZuxzwOLGZsH4HAy7KjCACSjP1fu6trFSTGz4L9HIBUPjQM57snjujrp2mBo76qeBBTMtZgoz5eD
	y9esiSL74KhqSZs7NV58T890uXpAzDIxNoSbbYezOIcCzYkpaXijj/9fH8VaEB72gByFjzrltAT
	bIWlgMqQkneQPu75WKEPRc+MV+BXb0fLTPOdUhRPhGSwrJBFTPIXswSK60IwL6WDoSP5irg61Pu
	sWhVXeUu
X-Received: by 2002:a05:6512:3a83:b0:5a8:6e64:e88b with SMTP id
 2adb3069b0e04-5a887add6d3mr7544636e87.4.1778514042559; Mon, 11 May 2026
 08:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:49 +0200
X-Gm-Features: AVHnY4LAe4jSY9ZIU0Jqqg3bAkBng0JF_5D_OZzU-aQcORXNKnNE7TuCtsiJ2MY
Message-ID: <CAPDyKFrDzA-dYF58_N05JCTqdgvPUMvXF+FKeyCFivLyhw5_6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: mmc: renesas,sdhi: Document R-Car
 M3Le support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084044_774378_CC221E5F 
X-CRM114-Status: GOOD (  15.72  )
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

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Document support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - New patch
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 64fac0d11329a..4d66966ce2900 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -52,6 +52,7 @@ properties:
>                - renesas,sdhi-r8a77980  # R-Car V3H
>                - renesas,sdhi-r8a77990  # R-Car E3
>                - renesas,sdhi-r8a77995  # R-Car D3
> +              - renesas,sdhi-r8a779md  # R-Car M3Le
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
>        - items:
>            - enum:
> --
> 2.53.0
>

