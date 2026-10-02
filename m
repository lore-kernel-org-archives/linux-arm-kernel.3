Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252CACA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0gP5fFhWQcd0dRx6A+0u+FZAkcHlePVWvKbvZVgBOQ=; b=oaFylXszTvz7VmC6ee6GCU7I9b
	M6AM9Kzr8SPGNZnLGQOboCA9hOhDRrFdYqJFoOvycEOgzbNPN3lWOjqYWTOzFnOfeqw1ydL+y1vE7
	FkPgwZs6ehNlIgC/hnOyJUIdZpdO6IUeMiZ2/f6B2PskxhgvfRWMQxdALudqYu0KM1ChIVtfqjlMb
	Zm5eiyaXAV8MjePrthKKYvUsSKxzyanVW71XWCOrBStreQ0dA6zA3+DOI9W7W4WcY6GZqdqt4CPgE
	mvXAFaR81+heXvssUYALa0g+1AXb2OFRwEC7IHrtdi1ry6Yqqv22S54XcuW/DO8T5id5izgg9u5g5
	krbDVAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY0c-0000000Atxc-1rQ5;
	Fri, 02 Oct 2026 07:48:46 +0000
Received: from lgeamrelo13.lge.com ([156.147.23.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY0Y-0000000AtvB-3ttU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:48:44 +0000
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 2 Oct 2026 16:48:33 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO BRUNHILD) (10.178.31.97)
	by 156.147.1.126 with ESMTP; 2 Oct 2026 16:48:33 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
Date: Fri, 2 Oct 2026 16:48:33 +0900
From: Chanho Min <chanho.min@lge.com>
To: Linus Walleij <linusw@kernel.org>
Cc: longzhao@ambarella.com, Wei Xu <xuwei5@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Long Zhao <zl020895@163.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 10/18] gpio: pl061: convert register access to regmap
Message-ID: <ar9h0T9+EvRxj6As@BRUNHILD>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com>
 <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_004843_286732_75AEC60A 
X-CRM114-Status: GOOD (  14.44  )
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

On Tue, Sep 22, 2026 at 09:23:21AM +0200, Linus Walleij wrote:
> On Mon, Sep 21, 2026 at 6:23 AM Long Zhao via B4 Relay
> <devnull+longzhao.ambarella.com@kernel.org> wrote:
> 
> > From: Long Zhao <longzhao@ambarella.com>
> >
> > Replace readb()/writeb() with a MMIO regmap while keeping the existing
> > gpio_chip and girq irqchip. Use a raw spinlock so irq_ack() can run
> > under the irq descriptor lock.
> >
> > Signed-off-by: Long Zhao <longzhao@ambarella.com>
> 
> It would be good if some critical users of the PL061 could
> test this patch.
> 
> Wei, can you test this on HiSilicon?
> 
> Chanho, can you test on LGE hardware?

Tested the patch on LGE hardware (LG webOSTV) All 18 PL061 GPIO controllers
registered successfully.  GPIO direction and input read operations passed for
143 available GPIOs, with no failures or new kernel warnings/errors observed.
Output value/readback was also verified on available GPIOs.

Tested-by: <Chanho Min> chanho.min@lge.com

Thanks,
Chanho Min

> 
> but it looks good!
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij

