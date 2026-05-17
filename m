Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5639ACD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 17:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:MIME-Version:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=; b=H4xWBL5c/vcIq3mB4zqsSJCOlq
	e60IO6lO/Pwd5R0VHQZvYx0zv9vFqVzTYDWj5nMuQDkVKb3AM7BsNvUMuevbzzxjSxniwEA2flR0v
	hENPnxq7FikDB3PZrYhgqUT0rsT5p2er3UsAfOT6W1vz2jQOJMmQ0vbb2VxkBXrpKBcH6sZRcr847
	qEzZA6GZK+xNYZYSIkkbqXm+KTxEcShu8i5vqwap4EMw0xQfRdL9GBCRSciBBrYxcpK39AvbWn8O4
	MkE5kQv42bFBAJSfs4i8LecKoSv4HF4x+OKVoLta191hgnjgfMmbgHCcoTVp9nQ7G18a1n8jKQKGX
	RzAbqGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfCe-0000000D6AJ-07b0;
	Sun, 17 May 2026 17:23:00 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfCa-0000000D69e-3DFz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 17:22:58 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso3822024a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 10:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779038575; cv=none;
        d=google.com; s=arc-20240605;
        b=WVisiDU/+exN9DyCtlmr1DqL+oRzR5RNwww3uCV56Ham+x1GRnuNZzDc1e7sjqlMvW
         gC1m6sRMSHxcTzJHRpFPj5rHipIs8qNBudbLzYoriEJDEa/QVHUxd6yLB4mctauFgoeD
         riVDRfFA6TtDa+gbeiJqnNYMM6qib6eljNAqD41G2Jq5Hx38ahyeNjUuJk3EuRBkEYgK
         T9Ixox/m9OYkJai/7fQweIZ9WZrhz0pQdx//5O0Hd+K52DTF3Sl+A/dlProIGV5vEIaJ
         kVoEjJFu3sLmGZrPH+2Wn9RfuS9rJqre0GcrlKGe7FGrgmvevdm3JhErT1ZUKYp7otqX
         U+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
        fh=6KBNP6nN8jXzypVTpKtlUehma1Dbu4SwROWTnY9xdhs=;
        b=FpmYSkBGrEKo21M3ZsQn2dFTtvrG6xROkdFlUOnW3pA6SGAiLILXjR9nTKRZwgiqXU
         8aotrV+1PEYpn8UEAjth4fuUMkMtFH2YDqG+CPaP5yS7m84FobBaXe1xVeDW9kzggrX/
         BtQ63onXlpmO9zyRPIw9nUxmYdAiY1j/Jn6EYo6lrNH/dKcoKxxMRX+jj8yqm3PuJgmj
         PN5LzsRZqMLiW0PNzVMzEp/BafJdZYot0JotcjyHpCnRC4QTdKARK+nsRUzDu9JSnJdH
         lWovBUW44u8H/ERIMriY6/e2EYZA2kwc8hn3AKE5AAUD/kDKlBuy9W4bpiWb1Z4Lv6Oi
         nnRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779038575; x=1779643375; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
        b=HIKkMT7tHAnGdJjcOGC/ODTkwEIpjwZnpC9M/BRwMG87mpnNtsCJ+mTCJLFS3ccHz8
         9+yE7cQ2f52VR7c59SZbB+Ys/oeFgPBOtOAKVB+gDXXKQoDyMAgT9i+PnZvopbB+ymjO
         ETVkv4jH9MNPdKtdEoUPFRfNZ1fw1ejhIMooXTIHC+wxvqBwCG5QZS7nMbafVUspY8TV
         qF9CwCa+V7hdrCbOuBP3DjnIwiVCuS7OiUCdcm+/QAHNwUaPLuFLh57YD02pNEwZg1hC
         a2s27xqHwj8HZhEn2890Lv+do0LJK4JZ9RZFAqM+dq43Na9ABgA5Req9MO9Cl8WO82N9
         bKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038575; x=1779643375;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
        b=AmmpjIR+3c41q5FeM7Lb+mitGc8E0jLPEDTbuTEDyiD13LAePqBkRqUwjkWVoHwVni
         HhF23pDukSsHl9xg82FpFIdSC/Fo3BhXvOSlfUWTh4OiyFr/DSChdxrP9ZM9dDIqjDw9
         OmXyJGC+x5BksgZHMK3KgQwTfwVLiZULVCRv4/a6pF4xHAgDMPz02GT2hGN8v9Syd3vn
         +1v70VgvB19dmiNpEJ3Ho4Y1DKoZ4spxRBXMcyJWXFh9JgImekKX+IuVo5ZDBw2h3zZG
         AM2UZsYXYoKa8LXvMuMivs7ncvSBH/1LIWXwwWgSdnrYTNtKvt1bjJhgT0ASUV6Ow2+f
         3dhg==
X-Forwarded-Encrypted: i=1; AFNElJ9JZqZ+eilOG0JgYsY3V8uNGkXmxshp5Mi0yyRyb1HQEH5euKbatnNm4vjMeu23K7qadM9+i8iSNe74DMzPFS8I@lists.infradead.org
X-Gm-Message-State: AOJu0YyKEOloC+iuij/GY+k+my2ngfyPC2O8iU8sI921PW7X0Bptx7qa
	qhUDh5gnPSxLbbDwrvpqeKlr4ItdVJmJqPQwK7pmv6wrfO7fW8dKnwa0XRNwrNdrsc+wlT6xCKo
	bUCyc/3Uq/bnZ6oGOYQBKIpaKZc+SD/ZUy1G8aAefvw==
X-Gm-Gg: Acq92OGMDEKww/FdDdQujtvvn7Gx62nthnsxLJrqUkaYQ9w8NlMrrvLD94mJzKy2Edn
	Omku1XbDEvnNGiZA0YIH6428OXbbu1kJ0U8L4uI3Ob4ptNWHCiDuLWk8llZtRbQHscIuzaxZQSE
	PwzAuvgNU+qiQfj1F0HFCYRNkV5gzw0y3273WhzJK4rn3aBKee9wDTqQ+fRmgUGTZC9CP39C3kL
	ak7TstyM3LpL3qMJf17RVbzW4yRtZNbHi8Z6YjxBCcjaKkBIAogGuRIGdQg8n5rEPiAI6f5Txor
	uWJoyEa0CQGbIVdz65gNsId8qUR0G9gKyXiC
X-Received: by 2002:a17:907:94c8:b0:bab:d8e9:53a7 with SMTP id
 a640c23a62f3a-bd5178fa6eemr564439666b.29.1779038574485; Sun, 17 May 2026
 10:22:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 10:22:53 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 10:22:53 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Angelo Dureghello <adureghello@baylibre.com>, Steven King <sfking@fdwdc.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
 <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
Date: Sun, 17 May 2026 10:22:53 -0700
X-Gm-Features: AVHnY4LXmzt2FYulHGvc5U-cYyRCzVXS4ho7o5lb3LZyGzYNxvZblCBbDnNF3UY
Message-ID: <CALSJ-wAX_dBYYzLPOPxKZXQQPFQXhW0Oad6FezdZE2bXWfaBcA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock name as per
 driver name
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Steven King <sfking@fdwdc.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_102256_847906_8C2523E0 
X-CRM114-Status: GOOD (  38.99  )
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

Hi,

On Sun, May 17, 2026 at 01:45:44PM +0200, Geert Uytterhoeven wrote:
> Hi Angelo,
>
> There's something wrong with "Mail-Followup-To:", which lists everyone,
> except for you...
>
> On Sun, 17 May 2026 at 11:11, Angelo Dureghello
> <adureghello@baylibre.com> wrote:
> > jfyi, for some reason i was not in to/cc, but i could grab the message
> > in lore.
>
> Might be related...
>

yes, imported the raw msg from lore but was not allowed to send from
lieer, so i removed In-Reply-To:, anyway, thread seems back ok now.

> > On Thu, May 14, 2026 at 10:54:32PM +1000, Greg Ungerer wrote:
> > > On 14/5/26 17:05, Angelo Dureghello wrote:
> > > > On 14.05.2026 11:27, Greg Ungerer wrote:
> > > > > On 13/5/26 19:14, Angelo Dureghello wrote:
> > > > > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > > > >
> > > > > > Later in this patchset, the mcf54415 DAC driver is added.
> > > > > > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > > > > > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > > > > > DACs (mcf54415/6/7/8).
> > > > > >
> > > > > > So updating DAC clock names to bind with proper driver name.
> > > > >
> > > > > I am not sure I like naming the clocks here with a prefix for the
> > > > > specific SoC part number this is in. It might be unlikely now, but
> > > > > what if another ColdFire family SoC member uses this same hardware block?
> > > > > That is very common amongst other hardware blocks within the ColdFire
> > > > > family. Can we come up with a name more specific to just this type
> > > > > of DAC hardware block?
> > > > >
> > > >
> > > > from a brief study, this 12bit DAC, and DAC module in general, is only on
> > > > this mcf45441x family. There are some ColdFire with ADC only, as those
> > > > mcf5249/53/82.
> > > > The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
> > > > So, if i don't miss any existing model, the name may be correct,
> > > > unless we want rename it to a more generic mcf_dac.
> > >
> > > Yes, I would suggest just leaving it as is, "mcfdac".
> > > That is not currently used by any other ColdFire variants supported by
> > > the kernel.
> > >
> >
> > Ok, will fix this in a v3, just asking confirmation on the name to
> > Jonathan and all, since it involves iio too.
> >
> > Chaches are:
> > mcfdac
> > mcf-dac  or mcf_dac (we have drivers as vf610_dac and cio-dac)
>
> The clock names in arch/m68k/coldfire/m5441x.c are the names as
> specified by the producer side, not by the consumer side.

yes sorry, i confused DEFINE_CLK with CLKDEV_INIT where the driver name
must be set.

So sure, thanks, fixing clock names back as mcfdac in v3.

>
> > > > > > --- a/arch/m68k/coldfire/m5441x.c
> > > > > > +++ b/arch/m68k/coldfire/m5441x.c
> > > > > > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> > > > > >    DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> > > > > >    DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > > > > > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > > > > > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > > > > > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > > > > > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > > > > > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> > > > > >         CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> > > > > >         CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> > > > > >         CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > > > > > -       CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > > > > > -       CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > > > > > +       CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > > > > > +       CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> > > > > >         CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> > > > > >         CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> > > > > >         CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
>
> Gr{oetje,eeting}s,
>
>                         Geert
>

Regards,
angelo

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

