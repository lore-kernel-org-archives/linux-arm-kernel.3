Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3B7C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUasWLCxH7LxsWLp9SXM39DvS8GJWlNPqUTguiGJf9U=; b=dh+rCAWIGKE7Cm3wgME3uL8cqs
	wx65R4b4sniak6Ncmtdy5cWxEo8De5XcMay/naiZUUYgCK2iIftJajoABbXcd3LvRmcM+dI6rWgwq
	rLgTLC4B2VGiXQWeilf5KkeMvZeiWhYZXHbBK7teqe4eE2H7sqaGdLhlvRH4njxyYWTiGYQu3+6Ie
	ZLt6PdFD99f10XYl7Ni7LS+xXTuPP8Xpd0acNdaTWmawjhv8y5ZaF5zo88Z3gUG6x35OGn16NBzr0
	EWMEFpiyzX3xEsW5cy8pFVA1zse+Vs508+/F61fIqrLeWOXwzjLhwRb9l2TuFcRE3KfgolJ0yCVxa
	PaQ/Vvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRaAY-000000083Ur-3ZLZ;
	Tue, 17 Jun 2025 17:32:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRa8L-000000083G1-0eSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 17:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DA75A51980;
	Tue, 17 Jun 2025 17:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C9FC4CEF1;
	Tue, 17 Jun 2025 17:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750181403;
	bh=U4h9R/89hdydTd3pc3WgABdUk8c1TST162ATESWxjuI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pge60F26PUoupxsVy8gGE2POWKr5Xz/YMH7bqFPTQtkSfAFsjHYYtQITlJz888suB
	 qZJ7MC4dRz07KdtR05IQx17vnCVNLfaf6l4TTcRiPsaYBsz4abI+lBV5K7cR5Sr3SG
	 N1xk1AlDfWz6k+jgZhoZUGAaqi+AZGwr+t9Y/vMRV/6erTXcc020Kcg/9rPME61n1i
	 +V/jVm4k+ntO3P+Ln1IHrTh7a/tT2WUoOENO4hXlwTIL0ieiLVSKKKEQf69WDtFXD3
	 2DGlRw3y5vpEjUGrlK5RQGDD8yoqMJ5wtgOdvutpiZfw8yDJMn18C3N2lmIYSYxGDW
	 pmJpNP6o+6cTA==
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Subject: Re: (subset) [PATCH 00/11] Drop default ARCH_APPLE from Kconfig
 and use defconfig instead
Message-Id: <175018139522.182101.4917904244547728654.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 22:59:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_103005_265591_C8FEC99F 
X-CRM114-Status: GOOD (  10.94  )
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


On Thu, 12 Jun 2025 21:11:24 +0000, Sven Peter wrote:
> When support for Apple Silicon was originally upstreamed we somehow
> started using `default ARCH_APPLE` for most drivers. arm64 defconfig
> also contains ARCH_APPLE=y such that this will turn into `default y`
> there by default which is neither what we want nor how this is usually
> done.
> Let's fix all that by dropping the default everywhere and adding the
> drivers to defconfig as modules instead of built-ins.
> None of these patches depend on each other so we can just take them all
> independently through the respective subsystem trees.
> 
> [...]

Applied, thanks!

[09/11] dmaengine: apple-admac: Drop default ARCH_APPLE in Kconfig
        commit: de266931dd996fc2cb8ee8b5d12e39ea463e3f36

Best regards,
-- 
~Vinod



