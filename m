Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472A9CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIIdZrvjerU9TUToExl2D/WzzHrGb42zkKRg3dbolEQ=; b=V9UgGC8VFGN7ZCriN4wBWnqpLy
	+SqWAiGsNf/dS4mBHjQzQMHg23+6ySI0ne4kNN1dD+2vOOYtKuI2QLjthVvYxFk7it7bW2K7LbPEO
	JyHVPXaWfx0bmnT+Kh8btYvrfOR09EWqzhCzzirXJyPWDnqHQjN/Vg9ne1F2bgpCYX858uWZ/Qq2Y
	7Sz7pWiiPjeqyHh0dvFq8XRhcbCwYoYTzJcu2PgHxxb83w+6DIHVorFGlTBWyIou8zN73B+5uQw/8
	hfsHQAf8p0+1z1bfXBGPpXFN4agyQFIXzjCxA1T/d/7fppHeKUc1iYcj2JJQcz2x2JEEBCbyxxif+
	kIr/MhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBv2M-00000006JOQ-28z3;
	Thu, 23 Oct 2025 13:07:26 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBv2K-00000006JO4-0Bb7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:07:25 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-557c26c5d43so155107e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224842; x=1761829642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIIdZrvjerU9TUToExl2D/WzzHrGb42zkKRg3dbolEQ=;
        b=pT5P+GBvn2fReNzhSg1MfTLdPeKpBoBPpQ6xzPI1gopxB+6ZLBY6x5L1oIxl82CYHw
         IOPxRvAIqoxSuqvVLUOqxo8MUm6nf891LGNyUkUNX8Dz/8VgGRRKO9jatqKwKLgV0GlJ
         rE5AB0IFErAtCZjQL2UDLVhulnAcS6TrPLOeZp1be4kCCaGW+oESg/frb87vNUocSZu0
         8vjoMGhLg66mbMoIr8ueNUIYwdOnMKd9w6o+OyiKxfYfZZzg64LZUOggNBobww6r1YzM
         2TUDTbyAFHi73CbPorbQc5Ym5gCbl8J3JiI5LrR4nzVy6uPfovDqSt8ZCEStSUGDOxF+
         qIUg==
X-Forwarded-Encrypted: i=1; AJvYcCXOs5QLayMhIbhBU0bZLsAEkJjtAIEaQXs9mUNdoHuX5fZdXJSyxZ5kGG+Tc0aV59MSNpKBqFNLt6jDTbruciIK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy99HWV98WgkFUXeyfLGtebS1Cz20/xQnEp2e/YOZaConBVHhT0
	TiFTDBNH+Keczdy13VOosmzCT2x9C/vwrgwkWXNRo0ti/DKNyVA3jdg/CnSNJaey
X-Gm-Gg: ASbGnctw/9aR50GOQkpEID4D/4oXWEr0d48fLK664gGCfhCMUFM5wOjnGP5QYj4b549
	AmKBBuiI232i2fM+msVzfc6HLBpBHpfJpK1vk/zRTEURMpqND23SvAX/UuofK/wZuLIJgQOCWta
	H567VjV8EHYbC/DYlqgDTBgUfxxcaau4ssKKPqKmjfgYvn+kBEGL6PYHyUV8p4+sxB1/eEVm/yO
	P5q77yAuNfczLGWe+oxnZ/gGvZSLRfn+wttEFdl+GJpsp6c+tqRvx8LG3tlCwePpvdEsIhvl0aJ
	AfJM8z9JVWUMJdu3vb0VYW0dwMLyxnVx6yEYjJEhTm7tkFQ7xYYxcTQKfCMr3HJOrpKE5+iBJx1
	12eKruWxl5CCNvZyO7T088yfKHX5c2E5d9v8SpuiHL0NhptCjyYEPglDevWpoNBUQtFCm5IgIxP
	G4Qx6xwuONMwZh1+SyafIYmdapvkH+ZwI8GocO7Q==
X-Google-Smtp-Source: AGHT+IHzLTFyiF/WOIHNg/3NeJQUGQs8Kv4lD0VJRN5NfBg6oc/QhoPHBw/L56RTffyNB6KWv469wA==
X-Received: by 2002:a05:6122:6593:b0:54c:da0:f709 with SMTP id 71dfb90a1353d-5564eebb778mr7078527e0c.13.1761224842127;
        Thu, 23 Oct 2025 06:07:22 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bdbb82e5sm701019e0c.14.2025.10.23.06.07.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:07:20 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5db385e07a6so99501137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK/PBuGAl88RWMvuBl0CMz0Q3FA7RrnBoYaoK4zJQX2Gc6YmwC5c6Os78og/plNp1RC8O4f4/W/NJHdfVMhGDr@lists.infradead.org
X-Received: by 2002:a05:6102:304a:b0:5d6:18cc:6087 with SMTP id
 ada2fe7eead31-5d7dd6d67e3mr6298079137.30.1761224839798; Thu, 23 Oct 2025
 06:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 15:07:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
X-Gm-Features: AWmQ_bk40KChNfSwzFv_aBWco4C4_I0K0e8reqSSxWUwprZ1XtIdssKPgaWL4cw
Message-ID: <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_060724_111420_AA229AAE 
X-CRM114-Status: GOOD (  23.91  )
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

On Thu, 23 Oct 2025 at 14:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> based implementations, but does also cover SMC and VirtIO ones.
>
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
>
> Note that, because the original base protocol exchange also requires some
> sort of completion mechanism, it is not possible to query SCMI itself for
> this property and it must be described in DT. While this does look a bit
> like policy, the SCMI provider is part of the hardware, hence DT.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -146,6 +146,13 @@ properties:
>        this platform. If set, the value should be non-zero.
>      minimum: 1
>
> +  arm,poll-transport:
> +    type: boolean
> +    description:
> +      An optional property which unconditionally forces polling in all transports.
> +      This is mainly mean to work around uncooperative SCP, which does not generate

meant

> +      completion interrupts.
> +
>    arm,smc-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

