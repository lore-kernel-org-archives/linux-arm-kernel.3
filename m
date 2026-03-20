Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2781093191
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAWPpMYxT/8uhqK5D14bRQubhtHZvgDqhLxvLqb+jv8=; b=wf/7MPjjk7REle8JlFFXoJuTKZ
	Wxbj/jv3GWNE6ww8VzeTC70Q7xI0FbhWaMzEf1Y5RgWBei6NHJki2cjjKJo4Wvrfe1+k1WQmD9Gfp
	lL0sUs4LqBmwTUgbmh34NvSen0G74OMOhgTJPgNnySVsehM4xCcZNiaNV3XOVbEdzdXMuFZClzQRy
	ZRKQX9Bp16k/u2CjvNSQFKRRW5xG4lpTai5bSdZO8uFUd7IgVvR5L9eRz7RIWnqCOdLsJ3zGr5e0x
	WMELNuUndvHwzsNqUlIwIalZEPd3CupuYTCEf4KoyDpmjMrAeJVVGxHOIYTZKJVu1nStW622tg630
	zjRQOe3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VmJ-0000000CQxq-1qAR;
	Fri, 20 Mar 2026 09:04:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VmI-0000000CQxj-1gtx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:04:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C79F6013A;
	Fri, 20 Mar 2026 09:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4994C4CEF7;
	Fri, 20 Mar 2026 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773997461;
	bh=xUkj9g/+sF9hLqzuMN/RQEM4VIjN8lYjJ0chPrZqsI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B13IVhIdYsDkKyGIkMxVS9c/MB3na1dxWmD0JTg3kt1A0lhM0cflQ92WWV6Js5LeS
	 mHe13DWUJR5o+yDFAZOCmxw3i0bPJlOJgVHJ/QPFovh12DIRNBnKacZWOcVoKB8qOo
	 jMCWFi/p6eYXV0bK0XOZLgLgLAuFIsYAKcaxfUybbTZBT+wEoUdWaAeBLsoHCRBqiL
	 eBccbPQBi8UjNZolplSiY0MmlMnURPDpu97rlfs2uurYNAkoP8m4/OWEvKLm1SvvcT
	 D+KqgdsoGOXFxyKvjEcc+NeDCPpo99dSE0Ac67ihP1IHS04RJ/SEcHdk0hC0lKmzDw
	 nJWpyCes5UvTg==
From: Thomas Gleixner <tglx@kernel.org>
To: Rosen Penev <rosenp@gmail.com>, linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, "open list:IRQCHIP DRIVERS"
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] irqchip/stm32-exti: Use kzalloc_flex
In-Reply-To: <20260320040443.46038-1-rosenp@gmail.com>
References: <20260320040443.46038-1-rosenp@gmail.com>
Date: Fri, 20 Mar 2026 10:04:18 +0100
Message-ID: <87cy0ylvn1.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Mar 19 2026 at 21:04, Rosen Penev wrote:

This is not a new submission. It's either V3 or a resend of V2. Please
follow the documented process.

Also this still applies:

     https://lore.kernel.org/87ms0erbx4.ffs@tglx

> Simplifies allocations by using a flexible array member in these structs.

Simplify ...

> No need for a second kfree.

That's redundant information and can be seen from the patch. No?

Thanks,

        tglx

