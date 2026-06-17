Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87E8CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdX/1r/VC5gVdSWCvpldxzdbyoom7W8WRGEDFlCTq6c=; b=zfY54QtewIHUlas2yOFSr7poP/
	AbWBe7FAznuX57x5ahaUoYf34fnkRY8aUl6st9tHI/GuCyMLtW4BDm10VlFOwQG15WkdlwFKT5Rqa
	Z47aHVTtu9rZSt8iaRI5d1L5cNEjrTE7eSJgEpLI6G9qrITds5V9b6wvqH+02T4F1uThcJaRrVQaW
	HW5Vw+UYzcqtSy+5O1wxINz420wHuRP7O5c4gGlxG+q2YDPay2Gu4gKnwZBKxv17v6fYiWDc14Drx
	t5SvRca9GM+Lrs6P9zgOlldoL+MVHOhkibgMwFjMRAgjsRCvG9WhaoUdb0hLEXKRUV5kARTzJee+V
	nWR3Az2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkWU-0000000GoCy-0qD4;
	Wed, 17 Jun 2026 07:17:18 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkWS-0000000GoBp-1qtP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 07:17:17 +0000
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8cceb2ecc03so50977706d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680634; x=1782285434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdX/1r/VC5gVdSWCvpldxzdbyoom7W8WRGEDFlCTq6c=;
        b=WKEVbnUgJr7OQD4tx1RzdQcY+8v2MDK9gwUu1G1cNhr84UwyPkNVpaK63xvd5MR1Cf
         4CQBCLRakGeh6GtZ8w6t4KZWX6VJD/nIqY49DGIL4HosISnwOoUysaUgqif3v1NJfaLv
         WZoIK4ZM6VEhPHPX6Om1dB/ctmgfRmB7pW7gEY8Dg9aLXtZMEZEhmBSTrLNIT5j7081d
         j/x9DNg/gG2eUbpugQFrO8GQiez3Y0rr6FZDehxICXE+QizX1eM7o0T+mfLBLplqG8En
         ntojm4sEN9A/51L+YEJQnvj6IL29dZpgtn1xs3mDyZw9KzXu886CpeL/IEjaKWen6FM/
         J5NA==
X-Forwarded-Encrypted: i=1; AFNElJ8Zqn10r5O5ciidc2A5dAnqXBs59bPtTJz6kVZ2634sFhH62bLOO9NdmF6fSHirnswmPpNYlwtxAEGXPHggHcr0@lists.infradead.org
X-Gm-Message-State: AOJu0YymOFp3oWNFGHrhxtqmmdDSDW7kziVG7y2RhG687QQUjrOfqR+o
	sbBkFM5+BhNB1aXx/Xthi3Vd6cGnMMWUsCmQv9kLwaR6Fa8laySqkZZYSnHjMyUb
X-Gm-Gg: AfdE7cmw9Y5DCYF/VK8Fk692SVDvQoISFZbz4l6p82WCIuhkgKv//Rslu18IoK5feW7
	mVff78gmA5s+HY05vT07+GhTEuKIUhQYPH1IdqQQbgrDXOg7KJYH5qR82fXgkMonM9Dd5WCQLN0
	1FmXl1E/HSp1OHkaypCRnkLcF637FpmPO7AgOnVhsDWtYveWAYNeFBC+AFZDG2nEQoy5xXcNyIv
	8EIT9Da56zP8w0qfpj5xI2LiGTwjj8dEFgrt57fD6hSePgpKLvtIkvifziO3NoGyimRi7wgCxvA
	wvrNz51fshX4HboPl0ySIIWEpLz8rWZOSfRnuvAJF1Z6MY7HyW1LibP5Emr6UDqfXaSNu8wMBIa
	dAg1h/OXD193bCgIQc7dyXFVvNl1Jkq5c24eOSfXl3lKY6P4Er45dnhFGMj3kEHB/MjX9Qc3szH
	Z71S9rCLWIqb5gwZVq8XfpB6m/U6EDZsllNCbCo5fQhtD5NLXoTXLgvphzeYhkHq/v
X-Received: by 2002:a0c:c384:0:b0:8cc:ce03:c020 with SMTP id 6a1803df08f44-8db5d7a4049mr39409616d6.20.1781680634590;
        Wed, 17 Jun 2026 00:17:14 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8dba79d0e40sm13565256d6.15.2026.06.17.00.17.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:17:14 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-915e1354934so574871485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9E0YbPGR0vrMPkMrzmXAVC7bCDm+8KR8U/wPiot9XITQRd2uQMHxxiqafaOo2KwRT9pZfoL390CwptewKae+Q+@lists.infradead.org
X-Received: by 2002:a05:6102:8386:20b0:631:e729:4575 with SMTP id
 ada2fe7eead31-7245cec45e5mr949237137.5.1781680186567; Wed, 17 Jun 2026
 00:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org> <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:09:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
X-Gm-Features: AVVi8Cf4irFbaHbMK6oTTjowYmtlzx-ojJFWgXAHjFGSCYVJj8Ydp7M37Z78yvQ
Message-ID: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001716_482009_B018E083 
X-CRM114-Status: GOOD (  25.62  )
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

On Wed, 17 Jun 2026 at 05:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> or APB interface configured to 32 bit, it can therefore access only
> the first 4 GiB of physical address space. This information comes from
> R-Car V4H Interface Specification sheet, there is currently no technical
> update number assigned to this limitation. Further input from hardware
> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> limitation.
>
> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
> common for many ARM GICv3 implementations. Therefore, add an extra
> of_machine_is_compatible() check.
>
> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4901,6 +4901,18 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
>         return true;
>  }
>
> +static bool __maybe_unused its_enable_renesas_gen4(void *data)
> +{
> +       if (!of_machine_is_compatible("renesas,r8a779f0") &&
> +           !of_machine_is_compatible("renesas,r8a779g0") &&
> +           !of_machine_is_compatible("renesas,r8a779h0"))

of_machine_compatible_match() with an array of strings might generate
smaller code (I didn't check if 3 entries is enough to trip the balance).

> +               return false;
> +
> +       gfp_flags_quirk |= GFP_DMA32;
> +
> +       return true;
> +}
> +
>  static const struct gic_quirk its_quirks[] = {
>  #ifdef CONFIG_CAVIUM_ERRATUM_22375
>         {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

