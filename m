Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ADACCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 22:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNMvtaeNogKpfQrytqvvbaLOlr19nHijax0++efnMV8=; b=A5XFH/9qW7uBH4gO5vs5TRcl0H
	rv1J9GXzarI1DXA9qn31muP4poI8nrYwxFSKQueLwR5KI8y4KfWlOvNj7DyYAcUJxX34f30SBYW37
	75PFSL8e0W1qTbJfyPFfy4nAN9t2iL+c93tjs//NDJaIi0CFcydCIfYFGjv+Et4/bxQsesrQ33KSY
	HB7P+YMIDTnx0laGpH3IDYnh7/lK8pipDfxzMdFdRUrF8InSTE2r2r3G6B4BvGF20JJ2uIsOjv1ei
	mqjGNH6MlXbLFoDLgnqlucRC4BUY5zLRPQBwXz+oWU4b1e3zJqOQYq+fN39vL9kbLasvftyG4nP1F
	J3W98q7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIZSS-00000006GoO-0Hqj;
	Sun, 18 Oct 2026 22:34:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIZSQ-00000006GoI-3zLM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 22:34:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E703460D9D;
	Sun, 18 Oct 2026 22:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F2F1F000C4;
	Sun, 18 Oct 2026 22:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792362860;
	bh=wNMvtaeNogKpfQrytqvvbaLOlr19nHijax0++efnMV8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bpnwcdIJ4V3mbTDUCzSl1a2GjmcOe1wrdAU1d93mIPpvkGAQjEv1GEqAMxzFQIn2I
	 5QlCDwfrjMBpbYiDoPZUgm9jlNtzpQzkg9Ffp0FD+6lPiH+nxqI2UJ+aaBzRwSqKe+
	 gXh39Tg//hWWa4FZ75ytZQil0gkNp8IK2GsHykYfuHtwSB6VvB35yf1i73u3aioEwN
	 hpQYDyq45CNQ8uVpq/tj0CzSl+S0Wk4W/2onh57udOmQExBCPXzTROv3AES/jNIuP2
	 EkTyw6yyQi7DLjXP1V2rkSTrVTmq3kl/A0mPJi0smuoUi8Vi+n9e0U77+D4Zrtp5px
	 PvNfJPaJ0rdfw==
Date: Sun, 18 Oct 2026 23:34:11 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Joshua Crofts
 <joshua.crofts1@gmail.com>, Marek Vasut <marex@nabladev.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Cheick Traore
 <cheick.traore-ext@st.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Cheick Traore
 <cheick.traore@foss.st.com>
Subject: Re: [PATCH v4 00/15] iio: adc: stm32: add support for stm32mp23 and
 stm32mp25
Message-ID: <20261018233411.31d4e6a0@jic23-hlaptop>
In-Reply-To: <20261006-adc-stm32mp25-v1-v4-0-d31ec75aecf3@foss.st.com>
References: <20261006-adc-stm32mp25-v1-v4-0-d31ec75aecf3@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 6 Oct 2026 09:57:31 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add support for STM32MP23 and STM32MP25 Analog to Digital Converter.
> It's a variant of other supported STM32MP ADCs. Add the DT bindings,
> driver, SOC DTS and an example on stm32mp257f-ev1 board.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied patches 1-10 to the testing branch of iio.git.

Thanks,

Jonathan

