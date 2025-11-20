Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA41CF8856
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0obOKDi9mtFrWgcMnZgvIqL64y1fdoReu5u1jVPyO8=; b=VY/TvFYLQnM0bpP2iUoyKEIjFs
	UqXWMPaPVkG7PQiPAwYSYFk6E0KzWwPiiO41Ug60vkZ+BUgKA+d53Nvk7Pm7v2GVKrXmlWBjEIkvJ
	2V60a5c0RjFDZ2zBn3n1N8NUy9cL0uwjCYiOI6k7fzrPT/vC8mVGDrzP4B0SHgw6pqyBb7DtsLc8h
	S+4uCAmVW07pR3AhK3HIFZDdftu+kPsL12P8rst0+V/+a+c3Dup0G7UAKdbd6yKUmEhreeIs2J3SC
	uMAKGm8mhCwfDJNPKuMhi3NKzb9TaE0XtDFqV313o6fsPpEko99LRUsgkpBBD0ZTPoBMbU7X6bom1
	EpouqDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4q3-00000006kCs-2m2I;
	Thu, 20 Nov 2025 13:36:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4q2-00000006kCl-0gbT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D31A6014A;
	Thu, 20 Nov 2025 13:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21794C4CEF1;
	Thu, 20 Nov 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645801;
	bh=QeW3CEvdKqBT0Wu8GYf8ydAdxWMl51xnLxLsaTIhg8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kcXQuW+fGb4qfDsyuPDFmOZC0Z9xPTm2xTJ1Jf4La0K7lR8FldEsLV/mGaYiyHOha
	 jJ//TH/ycZasivIDTgclaoZbBuAQEjj5qQZcE5oJAlwq0df4aBYDvbm8XS2XipOR3i
	 3Kj/HU9CVbdHbdOyNaJ7LiPlaoSPUrL1+H0FLQgRv+cfbXzFRztc9Emt4aKJ8GC+33
	 JCVq4NjXkPdAKcxsPKi+s7c7dsXsA2UnKSVjNL1IS7aem813+30mF4v2RJtOuV2mVi
	 Pp+x3uKTpf4ySJfKrzNKLzrZiZA77hJB5jkUY28IIxCJQiX3QbXIkC7YMXiwfE6j59
	 pqLW6I39zzOJA==
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
Subject: Re: (subset) [PATCH v4 00/10] gpio: improve support for shared
 GPIOs
Message-Id: <176364579587.23444.3839651662930349117.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 13:36:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Wed, 12 Nov 2025 14:55:29 +0100, Bartosz Golaszewski wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
        commit: d01fbee5c0d3d3061fb16235b71f5a117128e2c1
[09/10] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
        commit: 7a0a87712120329c034b0aae88bdaa05bd046f10

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


