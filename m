Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C55CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tec5FQuLPRbdVVuUIDCytMknbBana/Hua8s4K23aD0c=; b=F2ThSKkTUq+ljpsTwM3CE2kXmF
	CYGbjKLrJDBbMk3HvjmP0wNlx6qTkD+MVVdIrkXRJ59/Wxc6Fc2xg4lZ8cPdZD/7v6rZs4FXk2Kys
	XBu0oHz0FAPAf+PWeP0ZhpChzXZAvRXf05bmLB016ncSsXQMyV7p30bTt7mEthg9XDGesCW2JrtVx
	LwiRyZq1saZVrYWqUROUQnDmnc1pPu1Nx9vqMMaD2voxadRDDwp5+4nNfAhabbcqIc/vJqbYhk958
	69jlH/V5DnCJUbpNcrA7NGI2eEQ9ONhb6PtPSDbOPJUwZDI8tVXOhy9qG8NAvBfacCCIZdkHo1Fhi
	+8xCvrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGGn-0000000990p-31m5;
	Thu, 01 Oct 2026 12:52:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGGm-0000000990b-1Rak
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:52:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75D89403DC;
	Thu,  1 Oct 2026 12:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D3E1F000FF;
	Thu,  1 Oct 2026 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790859135;
	bh=tec5FQuLPRbdVVuUIDCytMknbBana/Hua8s4K23aD0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K2poqIT9ceZq6Ra4TaTezpspNG6viPMERp45zFObidAykvZxZAxoOQIIzK3ssGp/Q
	 CcwazjuaWGcA0ukfuqOP8DNdB4JdI9P43/U/uh6t4wGs5l1U5D3VfcJsaZHbxjZUgv
	 I1xPQL6NDREljq3owZtVIHgwzvv9UWf6XJUC1uWY=
Date: Thu, 1 Oct 2026 14:52:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 13/15] serial: 8250_dw: add Ambarella CV75 quirks
Message-ID: <2026100140-overbite-mundane-fc79@gregkh>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-13-486cc289a4b8@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001-cv75-v5-v9-13-486cc289a4b8@ambarella.com>
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

On Thu, Oct 01, 2026 at 08:41:02PM +0800, Long Zhao via B4 Relay wrote:
> From: Long Zhao <longzhao@ambarella.com>
> 
> The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
> licensed block. At the register level it is close enough to DW APB UART
> that a full custom UART driver is unnecessary: reuse 8250_dw with a
> small platform quirk.
> 
> Quirks:
> - keep IER ETOI (bit 5) set for RX timeout behaviour
> - skip set_rate; baud clock is managed outside the UART block
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

When you submit lots of different subsystem patches all in one series,
it's hard, if not impossible, for subsystem maintainers to take them :(

thanks,

greg k-h

