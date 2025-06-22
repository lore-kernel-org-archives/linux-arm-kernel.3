Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55749C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yu5fGtBFlOLpsSsFFXfoO56UnjkDKEXlkRj/Svbmyxo=; b=NyB9gXY0hiROpWy0JUV6Vo4I+W
	XY2hnjSrheTSApPuyWWDF5RhfF7o8Ft0nXTdWqYpHHq0ca6Ut4fPQy3hD1a1Tgp2QRW5Ar14/H5gg
	L5f4CiPaqW6JLsFt1GhRkHrCnYkml5nPC1bGDzlp/hEuZhYuUU+DuakAx93li+acbYklJKxWQLPg7
	SwaDIKqh7J7JCCISHGdUjeOww26weCn84AcgXDEcun6v3N3Kw59Pm8iHYUtVs+hWrQhJvsy9CDypN
	LcxfD8AdjtgcL8IEnUV2iM9ym49qag/bFDlMGSU7uSKl7ZEiyhSl3LAAKRbj0ryAuPdCchnFijbOV
	rDuFiTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTGoX-00000000fJ0-3JBJ;
	Sun, 22 Jun 2025 09:16:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTGmG-00000000f7U-3TkU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 09:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C425B6112D;
	Sun, 22 Jun 2025 09:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90C6C4CEE3;
	Sun, 22 Jun 2025 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750583655;
	bh=FR0kk1ZyP4ATa4YOUOaLsb7MR+jvx6ZZw5j0miDtcgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sUG2TJzdERrgA1aUMcnNuFM/6Qlm/KqJZq20pmR2XvNqiOZxo41fyBzgYecB8NmGi
	 00nX4LvGveW7uZ7cIslW//6k5zfg/Iqwj89eytcAxkf8JkbGkpDZNOrsYSv/GRSnKz
	 kYmio20WPm2fmsA5ka972FkEPkgcxZIf2SjoqknRu76WPPc2Jkw1FJq95w/rT9OgAB
	 paAdmX2NoloQyHEAobczyCdWtntL5ZfZKhdxDiABT59xhJ+hk23EJngelVRLIr17aw
	 aKmaraDnxDg5UT+u03Ry0TsOBPcfitx40+1VhZ6e2pV4sIei1+qg8GYOGRNc958D6U
	 t/hH1Crz5y+dA==
From: Sven Peter <sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH 00/11] Drop default ARCH_APPLE from Kconfig and use defconfig instead
Date: Sun, 22 Jun 2025 11:13:55 +0200
Message-Id: <175058357351.73238.16083953894785363103.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/drivers-6.17), thanks!

[02/11] soc: apple: Drop default ARCH_APPLE in Kconfig
        https://github.com/AsahiLinux/linux/commit/65293c3276de

Best regards,
-- 
Sven Peter <sven@kernel.org>


