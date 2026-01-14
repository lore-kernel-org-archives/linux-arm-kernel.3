Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435B8D30CF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQb4APq8JZCf6vJkgFja2UsHU1/oiSPOSOYM2wa7H1g=; b=dE/qps+2TV7OasptHHdLYmquYT
	7BqSoS3tFMX76A8X/2BjfxQt9lMugutSOJn7v/5h8++z3v+d+Mx1i5BAeLPOcBH7Ji1AusVYgPx1M
	NEgf8suZGZ/a4yaJ0vhlcQUbdBiGhGx700GX0hNf4YPdbjKuHEPdCMCl8LMNEQCiFltks2eioWElc
	ZmXbJVbhTzBSZNDuZaofDkOUmBSc6Y/JAuedo0QDK1sxQb32o+KwBEhfWVlOZVnDCM60EzmGp+tWq
	7iL0EYrreGoqo3HuFbrpiySnGvj1eMaroca2xzUqgDFY3WSaO7GcMSwGENKZv4B3WJcQJSJ2AFa9L
	8iKagyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfy1d-00000008lOg-1uGy;
	Wed, 14 Jan 2026 10:22:54 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfy1Z-00000008lMr-48uy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:22:51 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56379cb870bso1042037e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386168; x=1768990968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQb4APq8JZCf6vJkgFja2UsHU1/oiSPOSOYM2wa7H1g=;
        b=W1I7m+v/p+ongwf5n+zi2I9hbwDnCa87NVBY/W7wd6ngaigFhw2nfWgg4Zrp1snBn5
         ZdeD4Hb3RONDpmU0zXOZ5vCPItk1y39L7bkJSC2LpgL4xXuYm1xX0AiUoiQlYJvcKC9W
         FiYXtb+00xx56rfq2WYEzwd+dp6+iESZSl81aFhjCPZ9JnfQ/AN/6Dn0nSp27eYWkaW/
         dT1lXRa9MGGXsWZrhrz0PaCMzVQS1rgWjcepr4UmqPtWP+6LAdqGlFWSsC2ClEqCfuFS
         QNdThb/xhIvjwcS1pkdShP06SsomoNAiZ0wT88xCWSEj6lVroEwpKMyaincNolIcWp8c
         Frqw==
X-Gm-Message-State: AOJu0Yx6IQyXRvFelwHhXQ+4SaRoj/CVJASMzLfu7o0/rnL1NzCbx50w
	X+XtFwEqulaY2IwxV3SZYZlVAb1CsDgJs/Tdg+pwn9hx7cZL+hn0nMVCUoiWUyLd
X-Gm-Gg: AY/fxX66sfuumPjrG+x5jZUV9UwcmxrWf7xTvUJv7S81FYxTvEsznhk3GZqCtAJR0HS
	y2PHg9Jkm+8gx+loyb5RffNk2if+nSTsJ3vmqb6MiHnGgDqjDdnaTQJum0kTpdstNDyFcAUS2w2
	CHBEYmoUweyXcQMm2hA4UEVkMBJcBs9AL/bRw4uBMPmSpF+NrzBX/LFHPYyJpy+zEGCrwXYrrqa
	5L7b5308DPAcKsfK7SggT0PFmV3Cj4yV2nOFrb5fqrB62ha3GSXU+3FMXbUhkW2jZ6cU2JLpUAg
	hcQLoih8KVKG3jPqlPpG19LHojACvLfnLBk7pJRmYMZVghiafUDEJN+ddVmiM/UBj9uNBzKN92m
	L+jKHjwl+xl8bAFv47ymPEIjoI9a7IbZbcX8S8dN583kdmIRV5XoW2cU8MEFSpO3eCfUwKwPBXo
	rxuB4UkXawIF0Sh/5eEarMJHddcT9uwBNKgxS95pn3SnhIAB2a
X-Received: by 2002:a05:6122:311b:b0:563:6df6:1b8 with SMTP id 71dfb90a1353d-563a2050b15mr518929e0c.1.1768386168026;
        Wed, 14 Jan 2026 02:22:48 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5637f6ce00esm10286463e0c.0.2026.01.14.02.22.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:22:47 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-93f573ba819so3399430241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:22:47 -0800 (PST)
X-Received: by 2002:a05:6102:50a6:b0:5ee:a93d:2cdd with SMTP id
 ada2fe7eead31-5f183c02702mr366472137.40.1768386167018; Wed, 14 Jan 2026
 02:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org> <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:22:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZzL7nUCv6LnDaDhpMwfrnJp3ZYPAqQtDJ3BsZyH9k6g@mail.gmail.com>
X-Gm-Features: AZwV_Qi-Eu9-CR2_DSC2JlXjPpAlkxhHqejeDJ45jkp3qmHmsOBPHJManLtOH4I
Message-ID: <CAMuHMdWZzL7nUCv6LnDaDhpMwfrnJp3ZYPAqQtDJ3BsZyH9k6g@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: phy: renesas: usb3-phy: add r8a77990 support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_022250_025058_643A06EA 
X-CRM114-Status: GOOD (  19.67  )
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

Hi Marek,

On Thu, 1 Jan 2026 at 21:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This patch adds support for r8a77990 (R-Car E3).
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
> @@ -20,6 +20,7 @@ properties:
>            - renesas,r8a7796-usb3-phy  # R-Car M3-W
>            - renesas,r8a77961-usb3-phy # R-Car M3-W+
>            - renesas,r8a77965-usb3-phy # R-Car M3-N
> +          - renesas,r8a77990-usb3-phy # R-Car E3
>        - const: renesas,rcar-gen3-usb3-phy
>
>    reg:

According to Section 76.1.3.5 ("PHY Register Configuration"), the
USB3.0 PHY register block is only present on R-Car H3, M3-W, M3-W+,
and M3-N, but not on R-Car E3?

Likewise, Figure 76.1 ("Clock Distribution [R-Car H3, H3-N, M3-W,
M3-W+, M3-N]") does not cover R-Car E3. Unfortunately there is no
separate picture for R-Car E3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

