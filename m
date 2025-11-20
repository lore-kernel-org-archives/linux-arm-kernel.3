Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B079CF857F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3dvUvWVrBnAleSPdlexWv7BS752YfmaiWiXdOLBEtw=; b=vIuAJsDcslOBNyeVyy8VJcKC68
	Y1FarHPsnZWasAaaaSb7TJUPpIm5pwQNQdsT3a9xbLmfMx8ybGrYNCpZIzm4h/wCrerhkq410/2ZZ
	kQ5cNJFib0cM/mmoLFXrIli/ZK8OUhCbqajiKPLGao8LrTroyRINd7gyf99z41wwl3mcgQ9SjGw6c
	+ETUU6bLFFGl71o0vZRf6tsN4E2GcgBABH3ZvqL2/YGYfJzKIRYsqaDJXAOgGIypnFuGuwBuaT3SK
	SCrFGt4TpKDggUlK/8hmUtXMcHrMdt/sr652PN2jFgF4sB+C+IL3OLYWscR7wz0aQE3LbekzMpeU5
	U11TIt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM25Y-00000006Wa6-3QOv;
	Thu, 20 Nov 2025 10:40:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM25W-00000006WZa-0yZm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 10:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E616A4382B;
	Thu, 20 Nov 2025 10:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEB1C116D0;
	Thu, 20 Nov 2025 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763635229;
	bh=yg3PEBAK0vXSHiYm6Rwl7vMN6RwX4AdDjEWGlDFXv3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Byxt52qNfc+rni6YhmiS1E0PWNeqKXddN+uHkoToywxnuRWMrfF05sSOi87AWE2c6
	 QaO82JC//B0IF/DPoI64FQUhoXp6gO0h4tnp4tWsAM0vI0CcWEC5vlFWejwbCPmF7s
	 6bIRyAtpqpAWnpgUYTQ3f9R7olHksYYp/5QZmFTutWvxlnkPT2dBjNJcnEw0LzcAm4
	 Wgwk3MuBBsZecV2FUPzKmGw5Lzj9cvE06e4V2Jgeu4Nmyl6fB/u4ZFgJHMkqV/ov9P
	 C5Ow4Rbzy0ajYBNu+/m17T8QlYmzPE7+A1rQXq7WRtML8B+zoKWN2tHPTJqdoTBOLc
	 VnWHvMV2rK3gA==
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
Message-Id: <176363516985.564017.16048857931060018581.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 10:39:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_024030_293454_4089F64E 
X-CRM114-Status: GOOD (  15.58  )
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[10/10] regulator: make the subsystem aware of shared GPIOs
        commit: b871d9adffe5a64a1fd9edcb1aebbcc995b17901

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


