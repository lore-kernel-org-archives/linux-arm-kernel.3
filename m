Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D5EC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqWr3OCkEbgbUvmDu/uRyxYgoRP9YkYUb5hBzz6eFS4=; b=Fa56ewTRaYxlWfq7Y/DvZHGAl2
	6guaZ2r7od2bp31FzWPglkkHRW91zIYF61Su3ebltxtl8UpDk/aaD0S9/0gSuJimtwpYEGNuA8tB9
	9LvxSVCxncrY9TAiFviDS8FxuhYBpWmTuCg59wjkJFZqJARCRu8gIpue+bkmc4zBlj7dpXjML5pod
	YIFqUDRJwgcdTfjAiVgp/3M4nclkNM84I3QNyNQWHklKi7xw31+7lkbMG3Vt5P0oZvxSKsBdjR/9W
	Krj5oRl7d45NnzNa6jSOWo3ad4aMLClwXmiCPthEAal0H/G7xJsxcs32M83PXOTL9AiPlPBgGNMLe
	Pu2BtCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6liR-00000008o7z-3Atm;
	Wed, 16 Sep 2026 09:14:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6liQ-00000008o7e-2NSu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:14:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A29786053A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD3C1F0089B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550045;
	bh=IqWr3OCkEbgbUvmDu/uRyxYgoRP9YkYUb5hBzz6eFS4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=G4629f/UcKe7I5SlFPmwy6hXIMvYowntf5zI+TVR5dUYVPVgiH/HGqzVVCQI9+K9x
	 r9HPN+Oq8a/822bZWof702+JiwGheNgxzoaFwJMc07QmoyD69TKuZGt8ZvBqRKU6E5
	 ydySK/Mu/7VVjVD/79Z1Y5Ol/GL3efea9FLw+lj2hnBatbnfO+98mZlzKsTeq8+fcr
	 iPlHBdT68m0oPDLgPCIoPG7jwOFP+zKzdDXx3QpR6bSNenfMopFTUSZwA8SdG+this
	 V4rtdEx7iar3eLNPj3luvexbGMwq2uVwhh9X4fLIgHt12mph04moHTNd7A89RwSgXR
	 KdWQOXnCs808g==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692c6so4991091fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:14:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzknhfykwdfbxieC2LxUeQGa3bbWAFptrXARAJga3JKSghflPtOteBsSKeR0lLF7rygGIhPkr5lU2jX4eegcNe6@lists.infradead.org
X-Gm-Message-State: AFuF++kdjJ4fcSOkjGEYMSp5of1kPZlTB8qlMmm11z8cdc5vzuqmzPUZ
	F/DROkud2vH1tvaQL6c73rUdhwJiu8Ce6Fk30ZnjbZAjQb+BNM3QSV1Gqz8wnd7NSkvKwlveEkw
	EV5yIjs/GRCxSukMSKneZRSxkdBIycslP+cW4W8iy/w==
X-Received: by 2002:a2e:b8c3:0:b0:3a2:72c:cde9 with SMTP id
 38308e7fff4ca-3a5dc9a7cefmr3078451fa.4.1789550043681; Wed, 16 Sep 2026
 02:14:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:14:01 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:14:01 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
Date: Wed, 16 Sep 2026 05:14:01 -0400
X-Gmail-Original-Message-ID: <CAMRc=McEOcWq8i3B01AR1PnfBzSQaLEaOzE6Qa+QdVXrvS_YrA@mail.gmail.com>
X-Gm-Features: AcwNN1V2X8i9yMMrAT1QmpJK0AF7EkMhYvRTvc6M9zTS3HHfv-L8qE4KXcdtIiI
Message-ID: <CAMRc=McEOcWq8i3B01AR1PnfBzSQaLEaOzE6Qa+QdVXrvS_YrA@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 15 Sep 2026 13:15:30 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> This series adds minimal Ambarella CV75 support for early bring-up with
> a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> MAINTAINERS.
>
> This is a single unified series. Please apply via the SoC
> tree; subsystem maintainers are Cc'd for their pieces.
>

I would prefer to take the GPIO regmap bits through the GPIO tree and provide
an immutable branch to the SoC tree as it has potential for conflicts that
early into the cycle.

Bart

