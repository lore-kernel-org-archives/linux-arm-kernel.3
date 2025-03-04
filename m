Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81A6C282E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGrYAp2UYRB4ahPvzjkNTvyhBhRpzSJnkRhzP34zvcs=; b=VMzVPCvkyvi8g1VVAh2fQ4j6K4
	Sus73GlnBumefGX4lV7NcNu1n8vejvjtWZTmas3VdcuTGClaXOL2yUCOSqmEI9GEZVQ9nTwTtLIDR
	il21Qqf0z2D6CFby05E+fty3iSFncJpqXL3U/3Hjc0uuI4xLGccJ3TAGteoZWU9t69ci+svcHhRnk
	ty2AImqpG1JUY2JcjTC4duQ874QQHDWzueCBPDrt/SoUVKAmQIVX1XsFBQ9YZoaY80xycmBMPj/0h
	NZtDhRos/jsAyIbsSiIFWTQJXrOac3z6P58GgydqZ8IPxzENEEbRrcyxSsTcdvpOlgQZSrK+Yo5Nk
	hCtKx95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcb-00000004AwA-1SB9;
	Tue, 04 Mar 2025 10:35:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPDn-000000044KR-2Y7S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:09:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741082994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dGrYAp2UYRB4ahPvzjkNTvyhBhRpzSJnkRhzP34zvcs=;
	b=1umtxGShTe/HM+xs3bZ9BbOVGzCe2+AifYvLvOD7LbDIzG3k9DovpDEe3hbkcKG/gGy0pO
	kCNEbrRfXhxm6h+ZWnKLzaPPCTBfQgcGRHdPa9laVB4R4srBdRo7dgzx8Nnr5Y6VCA1dqB
	6Yj8c6GtisdPxbuc6ys7Qrqyp9zYK+ZA82wuDJBRXL99FnB5ylI/CFPIfrGbDqjIGaOJvZ
	kF2yf3Ju0wgKapobQxMVttUxgwq8HSEtQo4OCiKUI8pKlAdzUXKkhcQypCKa5KnFRny9Ly
	E9AxM2s4TTKd2ejwAlyI7nGl91W66NBgbsxzA2v/of7ieCW5amVYD2zyjIo3Ow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741082994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dGrYAp2UYRB4ahPvzjkNTvyhBhRpzSJnkRhzP34zvcs=;
	b=P7Qostk+Q2bXrVqb2DnypZKDI/nn16FYUiL0Zw/eiCQzbwL+O6vI00L7Pq9mXI4tuuItMZ
	+mtiNDa5jOQadkCA==
To: Jacky Bai <ping.bai@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 aisheng.dong@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 shengjiu.wang@nxp.com
Subject: Re: [PATCH] irq: imx-irqsteer: irq_count can larger than registered
 irq
In-Reply-To: <20250304094513.1964356-1-ping.bai@nxp.com>
References: <20250304094513.1964356-1-ping.bai@nxp.com>
Date: Tue, 04 Mar 2025 11:09:53 +0100
Message-ID: <87bjuh6r9q.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_020955_786159_A6C02066 
X-CRM114-Status: GOOD (  11.04  )
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

On Tue, Mar 04 2025 at 17:45, Jacky Bai wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>

Please use the proper subsystem prefix as documented:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

Also 'irq_count can larger than registered irq' is not a sentence and
tells absolutely nothing what this patch is about.

> The irqsteer IP itself can support up to 5 channels and each
> channel can support max 960 IRQs per. The actual number of

Can you please write out words, i.e. interrupts, hardware etc.. This is
a changelog and not twatter.

Aside of that: 'per.' does not make any sense. 'per' wants to be
followed by a noun: '...per $WHAT.'

> channels and IRQ per channel implemented in HW is SoC related.

> For previous i.MX SoCs, normally only one channel and max 512
> IRQ is implemented, But for i.MX94, the irqsteer HW is implemented
> for 960 IRQs, even it only has 384 IRQs connected.
>
> That means on i.MX94, the 'irq_number' is 6 but the 'irq_count' is

What means irq_number and irq_count here? 

> 15, so we need to increase the CHAN_MAX_OUTPUT_INT to 0xF(960 / 64)

What kind of math is 0xF(960 / 64) ? And what has this to do with
irq_number=6 ad irq_count=15?

Thanks,

        tglx


