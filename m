Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8CC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 00:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9n14ecYroU7+DDO7NNn5gqPEvYih3tU4SI/4RTqUOg=; b=omM4z9LJb79jXrAqliRg9jaUkE
	nHbLZADQlLceUYeEj2uw/H+o7GpcRPnFvL8bxC7MMWjAQiX9HmmeIrdx1pPktwwBOcJ8av54bfAck
	goItPZq8b2TWcVo38uu2ge8s0tolqS7/LEKXANSZmxEBZiGXWmTCAEy3jnUGaVwLIxtGKDX0ZvwGg
	dNbK0UpD8UEek6wk+rPAFSTOqMPw+oEUiv9F3gwetXt3Tj2vQ5x6qk7HIvIyGGIn0mRIAM+wsQp7w
	mHfoxtGYF1aNcapHukKBamdLJs2dyDReBN8a6trqigWZOn8uJNuGB8+eQUtm0la+AevysdUKRuUGv
	wdrgsHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8RgK-00000000cba-0P4M;
	Mon, 21 Sep 2026 00:14:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8RgI-00000000cbP-37c2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 00:14:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 214E0411B7;
	Mon, 21 Sep 2026 00:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC77A1F000FF;
	Mon, 21 Sep 2026 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789949690;
	bh=H9n14ecYroU7+DDO7NNn5gqPEvYih3tU4SI/4RTqUOg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=h/BXwGpzwvMMl60jjUUC9Kl6ZHqrND4q9enkECK5ewsMOK6xiYfIdxihYg/EVNTB4
	 jTu2+13wihO63GvQHNT1TmbIdBrYeCO+F+Nw3+JakUmgnUnkxNShbv3gLTsNdZpCYP
	 LPyhoLfWO8VqUcYALZcgwyKmr/M+91PaekaiP5wqK9EGKa6QDzeR7JLqjEdSPW+05T
	 ByzbN5Vob9DXwvDbpnIymLKdGbRl/U5uqJXFHepDu5bDQEsZMS+yolMN8yMBgUkofi
	 x7U2r/jIk9WN4gow267HaZjjuJgKYk+UzadiROdp9dnFoGanZOyRY7rPbZYhpkR5go
	 hFyoxdW1hWm2w==
Date: Mon, 21 Sep 2026 01:14:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, <linux-iio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Sashiko <sashiko-bot@kernel.org>, <stable@vger.kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3] iio: adc: stm32-adc: fix check on internal channel
 availability
Message-ID: <20260921011442.1c5a8403@jic23-hlaptop>
In-Reply-To: <20260916-adc-fix-intchan-v1-v3-1-b5f05b86bc60@foss.st.com>
References: <20260916-adc-fix-intchan-v1-v3-1-b5f05b86bc60@foss.st.com>
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

On Wed, 16 Sep 2026 19:18:38 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> If an unsupported internal channel like vddgpu is requested, the driver
> prints a warning but falls through and assigns it a valid int_ch below.
> 
> This causes a problem later during setup:
> stm32_adc_int_ch_enable() {
>     ...
>     case STM32_ADC_INT_CH_VDDGPU:
>         stm32_adc_set_bits(adc, adc->cfg->regs->or_vddgpu.reg,
>                            adc->cfg->regs->or_vddgpu.mask);
>     ...
> }
> 
> Because the register offset is uninitialized (0), this performs a
> read-modify-write on offset 0, which corresponds to the ISR register.
> 
> Fix this by returning before a valid int_ch is assigned. Choice is
> made to keep current driver behavior to warn about the channel name.
> 
> Fixes: cf0fb80ae167 ("iio: adc: stm32-adc: add stm32mp13 support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260911162602.D323F1F000FF@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied to the fixes-togreg branch of iio.git.

Thanks,

Jonathan

