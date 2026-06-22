Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B99FCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTo0C41gBRbYARs5bY4lNZzY8eziG+D7rVsU/ecROJ0=; b=SBlTJir77eMHGoiPiOTNNqLg7a
	dzaxCQFZKbT4kFZuFVrftA9/piVqqzY9J+JM9AIORIEITD34BhWPkYVbTrUxr9Ov5MnsROxqWeH54
	yE41ziZ+uTWE7OxY1xkKAlzqp6Kdu7HmLcfRkvXbzXgolJNzOTyZLTKMOLGua52F8B8VOLOBMIf7N
	TlzIcfZHvIwYVqT4T8M4PKtxLuLaI5GeWQGHpW72QxWmK4T1yWftL3umkkdLX+pwtUod3NjFQ2DKq
	3HowcLSfSIIihuCvnkjJoNnaSoet5N3VAXJfkSnzfpTrEs9mwPFKR7HB/RPuNxUTYiONDfl4eaBcL
	pN6R/EHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbL1-00000004msb-0uNG;
	Mon, 22 Jun 2026 09:53:07 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbKy-00000004ms1-3CyI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:53:06 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bc22d9977cso181884e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121983; x=1782726783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTo0C41gBRbYARs5bY4lNZzY8eziG+D7rVsU/ecROJ0=;
        b=fdO9w9VRLW0xjDY3jy/zRGfx1Dk9G0uoTMxfOL6QMZ+prdr24gX0MaEtd09dtWli0M
         4VTHjEiTCg0rC9G5KBOrHUtEZpQC1Bj2Oh9fciMKYp5Yj/3eroUbc5bHE2D1756Efu+n
         B8qTJesrl1f8l6ZPtAADlP5srvkrdLMa7LZlnhWvRCofPqxyKYBesPI9zg+kinz0TO/A
         dhXDHTC3Ld2EXM5KAD/6uWtF4aKkhP2hb+XP6uCiIm10Nk3g1tyDDQOwaWqNHIxDRRIG
         YyoAjzaAPS+Q8xn/HRhcCQY/d4lTjVpLFzepbYlovWnN0N83FdDUOLea8jTQcggpBfo5
         QYUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9phc9lNSI/ZEMzKjcE8n3zjBmpCYcW9uBp5j/CBp03sNsLRJGkxBzhCjNN0anlgc0TceE3f65SyILWL3W+QOQx@lists.infradead.org
X-Gm-Message-State: AOJu0YzrSbDxtKuM7GBqrRdL34vnW0tzNSqohjnysjyMKd6Nriuuxmy4
	xLrZ9xIDTFFSS3Gbjj+NMVbgeOmpInMiK6bjkTV1GAUdqJsgImo2ttcipID+BGiT
X-Gm-Gg: AfdE7ckHZuTzHAPJm7VFI6sfDuRwEL9x5/BiwnEUIShCIuz86s5lftlWzSsryqACb9C
	+BoYd2dTeLaFj1YgBoFLDwKopmHHiST610ibbuDS5W7p7yhbPgkeKvp2Nw9zi4/ownXxSihqCRg
	KhYhhoHphMxgE0V/yjdPkobRXbIsTuoHwdVkC2440+oSjeZwgkwmCLDF6p92RQtLnSM4rW+nhpB
	F0lKvOuqTCzVwrK/9rJLRoTrPnOuXEeXkVH7ejDGUlR907N1wZ8MPvuJylD91TYGetgojBvTshm
	+Bgcc10/xh/QSb4VSrZ2Tgoeb9/ZKrPosI5AVkjnTZ6HuCJCazlwG90yy9BLL9vd5wb6ZbDq062
	nbBQopZoMCUqnwrjwJu/F+Bi2ZJOkjqUKFvx3lXIMCEv/aQkA0mSI7c9Jk3h/8NrSN9l6G5SPSO
	e3yOnGWOAcN4zcAOTucl6UAK1wu25PpJAaLN5viHeqtWh8eYaZKzUuEW0ZizyY
X-Received: by 2002:a05:6122:608c:b0:59d:ac8d:e130 with SMTP id 71dfb90a1353d-5bbebb8650fmr7940384e0c.9.1782121982822;
        Mon, 22 Jun 2026 02:53:02 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfc00dd02sm6185080e0c.17.2026.06.22.02.53.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:53:02 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-96387efc30aso3245215241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 02:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8xYOfNpGy6x5OqNTSo+cbNpPPdy9YGa4qG1SNPsbhUzo98L6mn6BRDZNSJ9Rf8xlOm0+OErzLBOdRALtqRUsy3@lists.infradead.org
X-Received: by 2002:a05:6102:c03:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-72a1d8282d2mr7518654137.8.1782121981650; Mon, 22 Jun 2026
 02:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org> <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 11:52:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
X-Gm-Features: AVVi8CeD0QzByTLrjVPd1X2DDUj0G8mjwUUWpPVDpYqqWicL4mNi4MB1Xhj4X1I
Message-ID: <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] irqchip/gic-v3: Refactor GIC600 limited to 32bit
 PA erratum handling
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_025304_808266_9968853D 
X-CRM114-Status: GOOD (  25.92  )
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

On Fri, 19 Jun 2026 at 00:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The GIC600 implementation is now known to be used on multiple 64-bit
> SoCs, where it has address width for AXI or APB interface configured
> to 32 bit, and it can access only the first 4GiB of physical address
> space.
>
> Rework the handling of the quirk to work around this limitation such
> that new entries can be added purely as new compatible strings, with
> no need to add additional functions or new its_quirk array entries.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4890,10 +4890,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
>         return true;
>  }
>
> -static bool __maybe_unused its_enable_rk3568002(void *data)
> +static const char * const dma_32bit_impaired_platforms[] = {
> +#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
> +       "rockchip,rk3566",
> +       "rockchip,rk3568",
> +#endif
> +       NULL,
> +};
> +
> +static bool __maybe_unused its_enable_dma32(void *data)

__maybe_unused can be dropped...

>  {
> -       if (!of_machine_is_compatible("rockchip,rk3566") &&
> -           !of_machine_is_compatible("rockchip,rk3568"))
> +       if (!of_machine_compatible_match(dma_32bit_impaired_platforms))
>                 return false;
>
>         gfp_flags_quirk |= GFP_DMA32;
> @@ -4968,14 +4975,12 @@ static const struct gic_quirk its_quirks[] = {
>                 .property = "dma-noncoherent",
>                 .init   = its_set_non_coherent,
>         },
> -#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002

... as the #ifdef is removed.

>         {
> -               .desc   = "ITS: Rockchip erratum RK3568002",
> +               .desc   = "ITS: Broken GIC600 integration limited to 32bit PA",
>                 .iidr   = 0x0201743b,
>                 .mask   = 0xffffffff,
> -               .init   = its_enable_rk3568002,
> +               .init   = its_enable_dma32,
>         },
> -#endif
>         {
>         }
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

