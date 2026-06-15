Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96B3CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:MIME-Version:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=; b=LcNUda1gFqVE1jaURfE+pWB2JT
	n5rwlmoYvyGEsFNm2VJlYymdIZ1rhfW+fFJ9dmNINKqOnclMWh3Jl2e5P1AwNUSQSHBHlFWM0mFDT
	CLfLC9GAO1eed8WWdQZpOfRsfk+U3RgR53U2QS1Yc1+GxjNLo1pctOuRZMu0BAvlizDgkFc8RrX96
	YSuHIDGEih6e+wSB6+rmmaMpjyVtPG9L/6x5tzEfqSQZRl6IT/3LL8ch6om8YlM0diU+rCwuj87Vg
	IqdkSW940JHnT+Yu4FlqGC6gxTSfqMTWj5jteevBRFtCDlzx/mh00ofCGKTfDpUvnMoSxA4hlJ1Vs
	9SIGes4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5Ml-0000000E5gk-3lJh;
	Mon, 15 Jun 2026 11:20:31 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5Mg-0000000E5gF-3zYM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 11:20:29 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so440534166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 04:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781522424; cv=none;
        d=google.com; s=arc-20240605;
        b=gTHbnLTLwWtrJkWjqeSAmYCmd8uokSYi5A0VzotlLrxLlsfjaLWIFQ6R0sojerecEd
         /FHbOu0b9mIPhWvqTaak6O56yFeqrPFg+jHNRDKqaOwByRR1Cau1+G8FWHhfT761cu5C
         aHUJr9rP1uoY0iRR+xBF8ebg3yrFTuwkZnVOqKPhc8UVaaefGHPCnSH7thJOZzLa7R0l
         JxjgP3IzgjHpE5cGaYNa56cvISUtC/N/z0bUVSK1h7CLRichkvm+S2BhnGsQKHg8G/0J
         ihtgBWG/EMljo0t039xh5axb5qq74dngMcqG/By+T59GLW0HL5tt+8Dm+WmRpajYULPt
         w0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
        fh=vp3QQgxxQQBDcgHE1npgN4tro67ZyqvFFzRRaKjhoCY=;
        b=MHy+X8NsvWRqOPnnSCHcbuY9ar86qq1PYZHbGaZAVjvTiaHnxntP68Nfb//SCrLaZI
         gbIyXpT3JqYwv+x17S2CnI+IarRyqzAB+80pS3LEnucMQyG31GNfI09UFg8WTbKUXpTf
         D1l/ewhepr23IPRL8awXE0gcpnKALrx6rXplCzlpT56HRtOrc7MwaQyXyhBLRTPmpYGw
         /rRXle1gYfJKGw2MEYU8Qy9XM2RcWAzPM46b1Q9UBfdhrfdpERSxwL/jPNRMVZkbxW3j
         l7Sf08AcUlyrUG1dr7DnFT5w8fElxCgWE8JjdUgEzUTWOv7PJPTDr8V92PRhXOqL6i/m
         JzRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781522424; x=1782127224; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
        b=aMNYeRrp/+JhoidrnDLOWkpmsMqY829ETI3OhPfETQsbaTCKc+/FH/FHBrRK1LX7kT
         NEnOuCbBEWHgvgQZHzbJJJG9GWNY7ve06PQUJJ66ROX+yHCx/UL7NlXUfsuAxnJeIBb6
         H1EivvPrx7B53DZc4JOAGhSHrZfKMyYSbohGVGI29sv4mGy3roZpoYv5LVkoU5l8/9NB
         u4bdDcP9eag/HVtg4pR6o5s5WV7lbYkZuevGGIjQN4exgro/vQhuUlU6xz8lt/o4ImBv
         msaFMgq9F1cH0GZWGXlM4eJqiVdgIqQtwe7/YMK0vaawEXT8607mqr+ab4GlKdLEjaBM
         TGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781522424; x=1782127224;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
        b=A1Q8zEb9NR1YwsfZrabXT61RAkb1ar7YSsIz0zNlex3Je1xVnv/XuVpk0S3+HgEIfN
         Wj6dYcYT29tPgEge4qY3ReZV7mpjxC7yLzsb38GHoIaECmbsck3Jcny+lVaB0ZE1Su4K
         0cVXaTX0mHJWGhjNeWGGtIKJohykEyimAfl2EBqB0/NiVvhT/tKzyQd5Q9MKtzmY1mKU
         FpWrvAnPZp2OyzfLFnak7vdWtUMZoebpZ28Y4vRqLLP/gOMfJzULnQofa+Sl76w6eLsI
         ZFTTqB4o9yGutwPSkU/NxhU9QdkRG3GG8RoYpKKWa97ewFRYrtlQv6AyNFdkivJpP1ta
         gRNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CYJFQJdLDcCwqGaY+22bPRlMEhae0Y3mhF6QYgbXAlaIr31zYg5mLO+IoN65q7wgWMHFSpPHqvfTK0umbYmT/@lists.infradead.org
X-Gm-Message-State: AOJu0YyS0iAROHd265SaI38ZBjJCaRFAuUm/LE4i2dzvrAjThYLJh++7
	Yh06e4q961JH8x69ALgDBJnDhRX7n2Vg9ENoBM8Mw4HaIL1BEMiu5p59pVmGlO5L0Eky5hP4BLT
	SKB0eutorwxt7AIIUFwj/F/P/Aotk2z6U6ePetsrFog==
X-Gm-Gg: Acq92OFjoiDti57BtWw/H5z8vVgExtMUq7AoIeCigQz5a8sBtHVzY8w+BuczpeyfU8e
	i7UVThDALat+HTlQDZaCTIeeZr9afOp2U1uKe4qA6rHqpSmEmQM7+xXjbXpsiyXSa4ixhIm4Axt
	yvKEFNzD257ilvF6u6SqFsP8nOKjG3OEAAzdauly5rirt1wSWKMNiqBtcDs51q1syYw77o5ZF3s
	2Y5gM1NvX8ktk9/ZX0aODD69MHPoQJJshYdIUYKzE7+XxmmHh6xUJxwUX+VJ8C7pK7dEE5qfNcX
	CU7AN8mKs+cC80txWRbggWGuJ9ZIq+FneT4x
X-Received: by 2002:a17:907:7342:b0:bf2:6d61:3268 with SMTP id
 a640c23a62f3a-bfe2a713a05mr372243766b.23.1781522424173; Mon, 15 Jun 2026
 04:20:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 20:20:21 +0900
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 20:20:21 +0900
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Jonathan Cameron <jic23@kernel.org>, 
	Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
 <20260610-wip-stmark2-dac-v5-9-b76b83366d5c@baylibre.com> <20260611114800.009d9797@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20260611114800.009d9797@jic23-huawei>
Date: Mon, 15 Jun 2026 20:20:21 +0900
X-Gm-Features: AVVi8CcVAgC1MKZdgPIabfG_bEsJqD-RTAVk9pERfc6y7h_8h9norD6F9V9jiEU
Message-ID: <CALSJ-wC9Rsq6WJ_=X87R74jPrg2Y+=L8m0wRRp=1zvN5vSOw6A@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] iio: dac: add mcf54415 DAC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_042027_020965_48CE379D 
X-CRM114-Status: GOOD (  23.84  )
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

Hi Jonathan,

On Thu, Jun 11, 2026 at 11:48:00AM +0100, Jonathan Cameron wrote:
> On Wed, 10 Jun 2026 22:35:14 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
>
> > From: Angelo Dureghello <adureghello@baylibre.com>
> >
> > Add basic version of mcf54415 DAC driver. DAC is embedded in the SoC and
> > DAC configuration registers are mapped in the internal IO address space.
> >
> > The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> > analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> > consists of a conversion unit, an output amplifier, and the associated
> > digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> > are respectively 0 and 0xfff, left untouched in this initial version.
> >
> > This initial version of the driver is minimalistic, "output raw" only, to
> > be extended in the future. DMA and external sync are disabled, default mode
> > is high speed, default format is right-justified 12-bit on 16-bit word.
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> I'm lazy so didn't check earlier versions but assume the two bits
> of feedback from Sashiko are false positives:
> https://sashiko.dev/#/patchset/20260610-wip-stmark2-dac-v5-0-b76b83366d5c%40baylibre.com
>
> The one about clock underflow if resume fails, and then devm cleanup happens later
> is a bit nasty.
>
> I did a bit of digging and maybe it is better to just leave the clock on?
> The status dev.power.is_suspended is set to false whether or not resume succeeded
> and I believe a following suspend will not take into account that resume failed.
>
> I'm not set up to poke the combinations but it might be worth trying that.
> +CC common clk people who may immediately know what the right answer is.
>

was about testing this, there are no bus faults on read/write of registers
with clock disabled, nor warnings in dmesg on double disable.

Anyway, i see now from arch Kconfig that is not possible to have CONFIG_PM
for this specifig CPU (with MMU, PM is force-disabled), so would remove pm_ops.
Ok ?

Will fix all other things you pointyed out in v6.

> Otherwise just a few minor style comments inline.
>
> Thanks,
>
> Jonathan
>

thanks,
regards,
angelo

