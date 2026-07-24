Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C9FC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4SpAErSPspS4jrFPaNl/RX6dGWCCbI6bzmXbcp3+3Y=; b=bFgRejzYl/JWJFEAHAb7WYZlTA
	0OIeUnkuy1sQ5+bP4aISBCOxY17mP16ESpsNoizgBd52Mcqi7FxNKpn1/rM7Nk8RsmGBfUC6KhT3y
	NmtunJHV2euWkzgrmEeY0C+UbXf25jADOO875QD2NC4lsVBu42gleQpoUqvx/Q1cgHKFg9hs28KQt
	PD1qV4iT2Nuu1TycbN+T6X7Uq7H4NsENUuzg96KeZCiMAzjALEokMBKOsemV41wm855LQHBsbfA4O
	nDlxBGs+GjMZyCRwO6GShGIk8DcDLWL+SikXSbejCilLUeofa8duzYFllIRkpZWty6zFwu7/SzhzE
	GQMJ0Xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9a1-0000000FcQx-29KH;
	Fri, 24 Jul 2026 06:40:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9a0-0000000FcQr-0Y5Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:40:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A21C4015F;
	Fri, 24 Jul 2026 06:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECB71F000E9;
	Fri, 24 Jul 2026 06:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784875219;
	bh=L4SpAErSPspS4jrFPaNl/RX6dGWCCbI6bzmXbcp3+3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gVaJJZTYHaLn397U5HyfQBtSwUbZBMwDylwqYB9qZxwDKmwVXUbBqyY8SDhUlJ5P1
	 QEq6QXO26YNrn7YsqTIVJRtJifexArWJSAPg9XCf+4yO54zMOsF4gDFRm/9APeA33V
	 clGSb3XZNuWQ80DnVmmvgOE0Nqvvib4MHrdpHbbkfmjI1kQC4xPgfw/aiU53rJGC9/
	 aZXEYx7qU0jzm87/JRwf4GSE9bAgi4IMEJLxYD1QS4ja+Qu/X/BqyJwkIKZ1hw/sVL
	 ECXQZg5E281Otsgybigq1ck1IzY+2XjVjJq+VBQnAf2e2gPse+i4Qet7ctleBLeDC2
	 nzDS6weJbr5Bg==
Date: Fri, 24 Jul 2026 08:40:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
	Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com
Subject: Re: [PATCH v2 0/5] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
Message-ID: <20260724-raspberry-otter-of-perception-b8ef80@quoll>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <amFZCkt1EXtOjOYW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amFZCkt1EXtOjOYW@google.com>
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

On Wed, Jul 22, 2026 at 04:58:02PM -0700, Brian Norris wrote:
> On Wed, Jul 22, 2026 at 10:55:51AM +0100, Peter Griffin wrote:
> > Hi folks,
> > 
> > This series adds initial basic support for Laguna (Tensor G5 SoC)
> > found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> > 10 Pro XL) phones.
> 
> ...
> 
> >       arm64: defconfig: enable Tensor G5 SoC family
> 
> I'm not able to apply this one cleanly in my tree, although resolving
> the context conflict is trivial.
> 
> > 
> >  Documentation/devicetree/bindings/arm/google.yaml  |  48 ++-
> >  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
> >  MAINTAINERS                                        |   1 +
> >  arch/arm64/Kconfig.platforms                       |   8 +
> >  arch/arm64/boot/dts/Makefile                       |   1 +
> >  arch/arm64/boot/dts/google/Makefile                |   6 +
> >  arch/arm64/boot/dts/google/lga-blazer.dts          |  15 +
> >  arch/arm64/boot/dts/google/lga-frankel.dts         |  16 +
> >  arch/arm64/boot/dts/google/lga-mustang.dts         |  15 +
> >  arch/arm64/boot/dts/google/lga-pixel-common.dtsi   |  23 ++
> >  arch/arm64/boot/dts/google/lga.dtsi                | 423 +++++++++++++++++++++
> >  arch/arm64/configs/defconfig                       |   1 +
> >  12 files changed, 539 insertions(+), 19 deletions(-)
> > ---
> > base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
> 
> I don't find this base commit in Linus's tree. I only found it in
> linux-next after fetching this hash directly -- it's a linux-next tag
> from 20260507? Seems like an odd old choice. Might be worth refreshing
> your base.
> 
> Apart from that and a small note on patch 4, it works for me:
> 
> Tested-by: Brian Norris <briannorris@chromium.org>

This does not apply to 60% of patches here. Really, you could just reply
to each email.

I expect incorrect tags won't be picked up.

Best regards,
Krzysztof


