Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE029E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7bWVFZ2ocZx/i+mr3Fjw04VK06XaWuS30/5YDXiDlM=; b=OCUCNOAxlh9j8OMwFFSVZZxXre
	kgCPEhOqnb+dyLKqAouflMRpgBML18135PCMKStFp9uQIGpMEkonZDa9MuUP5jFAWZFXwr9EAXuTN
	C1xFN1iz5zq4xnQfvfJqT4b2HWKaE9uiO4hnomrvImxmRirxKOhgo6zqzSzfVAxp0TJou4FdPQfwH
	Q4zJ8Nl5Ykj29C9IYYEkKlfYtJb6nreLQLRYUfgE+GGoXYJXkcp+qeSlsVXXLPomkmjrCZIFMa8Be
	nOM1fVxK5UZ426E95Q7ndlzkUId4efXp+OSkpiijGFDR/VJJS586XlP2Q5nKl0y+gMC1oK87QPh97
	QZfYoiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPJ2x-000000088dC-37jG;
	Sun, 22 Dec 2024 10:18:51 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPJ1l-000000088YK-42Ph
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 10:17:39 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YGHCC0pywz9sr2;
	Sun, 22 Dec 2024 11:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1734862647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7bWVFZ2ocZx/i+mr3Fjw04VK06XaWuS30/5YDXiDlM=;
	b=jz7MWse3HHVYSkcgb0cSihd2gV9xa6ibXhjO1V9QeYrJiJUvZnDK80sDTpixYf2oeQvDsf
	xyJjXrn3FRCcZUiooF2NQgpQMot0YDYQEkG5OeepMa+cFhUjntBAJJz0dyGq4yYfrdju4g
	etDa9LQoVLzc/tJGH4uQRFU0nZfGqp7yw2uQ5QrLz9aIKUL6nWbQxdaqXzmFORMHlFLgZR
	FaO11Nz4qW3KzkSoX8D8h5tsjngWqloMwcND/DrD0C14fAVnbZ/Rm9TOKcnSYiKgN71HUq
	wZdbH32Y35uV/rH2lTq9SKIXKVY+Z2joaDQ885Es6hS13ITTG9iDbKXLIy0vPA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  Roman Beranek <me@crly.cz>,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH 0/3] arm64: allwinner: a64: fix video output on Pinebook
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com> (Vasily Khoruzhick's
	message of "Sat, 14 Dec 2024 21:34:56 -0800")
References: <20241215053639.738890-1-anarsoul@gmail.com>
Date: Sun, 22 Dec 2024 11:17:09 +0100
Message-ID: <87pllk58ey.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4YGHCC0pywz9sr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_021738_310974_7FD7AC6E 
X-CRM114-Status: GOOD (  13.53  )
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

Hi Vasily,

On 2024-12-14 at 21:34:56 -0800, Vasily Khoruzhick <anarsoul@gmail.com> wro=
te:
> Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in =
TCON0 mux"),
> TCON0 clock parent is always set to PLL_MIPI, but unfortunately it breaks
> video output on Pinebook.
>
> I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
> to the same clock rate and flipped the switch with devmem. Experiment cle=
arly
> showed that whenever PLL_MIPI is selected as TCON0 clock parent, the video
> output stops working.
>
> To fix the issue, I partially reverted mentioned commit and added explicit
> TCON0 clock parent assignment to device tree. By default, it will be
> PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
> override it in their dts.

I've successfully tested this series on my pinephone where it still
correctly selects PLL_MIPI.

Hence,
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on pinephone

I've also tested it on Ond=C5=99ej's downstream kernel (added him to cc),
where also the HDMI output continues to work.

Thank you and best regards,
  Frank

> Vasily Khoruzhick (3):
>   dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
>   arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
>   clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
>
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         |  2 ++
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c                 | 11 -----------
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 |  2 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h            |  2 ++
>  6 files changed, 8 insertions(+), 13 deletions(-)

