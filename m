Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1F9CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 00:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1wSy7RT41DUB91oiRuTHRrSKY56pGjVa906vGGr0fg=; b=DlqS4isHejL710I+3blusS3V8W
	FL0IWw1Re6DESZekvSlA+whmvci3eg2BxToY14wHHg77oRP0uxvG/VLupBZ0ZCip9/4gOYVd/aW2g
	+Or0huukOXnhKCBP30BMIUMZnGFKuFw5foci09yUwZbeA261KIp1kyuhcfBc6Hi4N6XA300c7xvLN
	fEjpKxVYl0oxjzD/ipzYNJ+wmjh1ogb4gOYkioEe8sNSv2oKEJDwQfAJn/h26yxJVGBdUXpHNntE2
	OUkuYA9/+W5Sf0GfKRkjQD4QlAi99K0Vrzy/aK+KpJwh3TGUjA6277lfo7gfe0Sq8Nn/XCqTA2DJN
	xjqw7FQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVZF-00000001bHy-3O11;
	Fri, 16 Oct 2026 00:13:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVZD-00000001bHs-2rtM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 00:12:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 010914193B;
	Fri, 16 Oct 2026 00:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4621D1F000C4;
	Fri, 16 Oct 2026 00:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792109578;
	bh=d1wSy7RT41DUB91oiRuTHRrSKY56pGjVa906vGGr0fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V5lPQ6GpPORb5SLWF7kwvBBnCQ+3e45/bokuvT5IzYSVKznhtClwSRqtO7CfLsado
	 Y2zO/827/v2iIsLLty7x5jRhRshXAjUir2m1C/EF7XA/qXLZTzn2A1sVgDfXB6b0R3
	 Ks+7eZTx6C1aj3ypFb99KtOhtovCJhkhOgaOcwum2iHJWrYZrswcdEQZUC7bHA5EfJ
	 BRWe2s6UAJ3bvKgpe4mNMvJ5+uIzj+SSWduiGF/0JqmpSzelP/2eTRDTSAk7GTTA+J
	 OdU2x67YtGD/5seSzG64ncZjYRNfUmBcVEm8q/6dME2+7zyShbthjUjcDE+VZbL4nB
	 jmX6S9Yo6Uqgg==
Date: Fri, 16 Oct 2026 02:12:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] i2c: stm32f7: close SMBus alert work before removing ARA
Message-ID: <atFp5Tji-ZFX0euI@zenone.zhora.eu>
References: <20261012051608.177145-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012051608.177145-1-mhun512@gmail.com>
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

In order to take it, I need an ack from Pierr-Yves here.

On Mon, Oct 12, 2026 at 01:16:08AM -0400, Myeonghun Pak wrote:
> Clearing ALERTEN does not join a handler that already observed ALERT.
> It can enqueue work after the ARA client has cancelled work and freed
> its backing state.
> 
> Exclude transfers and join both controller IRQs before detaching the
> alert pointer. Check that pointer before queuing ARA work, and handle
> single-line controllers without disabling the same IRQ twice.
> 
> Resume the controller before masking and clearing ALERT. On resume
> failure, skip MMIO while pointer detachment still closes the producer.
> Restore IRQs and release the bus lock before unregistering ARA so its
> worker can finish an I2C transfer.
> 
> This issue was found by static analysis.

it would be nice to have a real issue here. This theoretical fix
leaves me a bit perplexed.

Andi

> Fixes: c8062d11e20c ("i2c: stm32f7: add SMBus-Alert support")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

