Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC622C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 19:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2+iFHur6K9Tc3J42bgSrLThLECutlA+jOCmudPtdQQ=; b=P8q7MYf+TrmVqcVa1zZ9Z6uVNn
	6Lr27NgaPV3+fD4swnwkbTaSJnOitJIpuBNh8bTp+eBL1H2YTaMJwCG3b8PGFbsa9xkgKmNkRA/YP
	GvLq3iUTY+iqn6ATBojjCnTUs3SszAWM1iV+07OyxiJQdlrqLGkZg5hdE9hAAolmQD8bsNWwVm00v
	JtFldm8nIwMf/rrC0FPIm1scgV4z7WbIOlOsB0HDb4iW7cX4KgK2OtF2u2/ZEIar/3YyCGM17KThv
	Gs5UzZZNaUBaLDuWbL1I7g2kh4/VuIezWE4BenGhW8wmL+MIrhY18ah5MFxgQvXtH0EBqxcIkFw9G
	OcDAKupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhC4R-0000000FnNH-0hj2;
	Sat, 17 Jan 2026 19:34:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhC4M-0000000FnLR-0rfb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 19:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E8D660172;
	Sat, 17 Jan 2026 19:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40815C19423;
	Sat, 17 Jan 2026 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768678485;
	bh=1VII0wh1BOHYF1G6k82HsDSKZgInSRAVEk6spvnXkrI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EP6ugdgaGiSCAsv3rkVofx9GZrbafMX91E4lYf4bepvu+DTWjpHi2/yPIFIhf6PRb
	 dnVRsxpsNZnysOInsxhuoACYSoMNB75QSAl3jHEMkY7u10czaMvlxA7/VRX3Mdpk7L
	 DOjyAtJcR7fMftqh4ocxUyARWWNTwSWD/3rV/Wxsy9O1eQLCdUkFwaf6qvGChZTzAr
	 6tX+8ls5+Dtak/W+v+6SuzJUdtF0uvJn04hkKa6Gjk6vxvcophnE7JWjbf85mvy1U9
	 DQB5U/M6HQc2BtuzZ+xGHrnh7dfsjARo+wBZ240JF6Aerq8S/6+jb60TFthoD4tRwK
	 n2URtrKvcwPkw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Doug Anderson <dianders@google.com>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
Subject: Re: (subset) [PATCH v3 0/5] gs101: Add support for Display Process
 Unit (DPU) clocks
Message-Id: <176867848098.124121.13465976483676296810.b4-ty@kernel.org>
Date: Sat, 17 Jan 2026 20:34:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 13 Jan 2026 10:58:57 +0000, Peter Griffin wrote:
> This series adds support for the Display Process Unit (DPU) Clock
> Management Unit (CMU) aka CMU_DPU found on gs101. These will be used for
> the IOMMU and display enablement.
> 
> As all the patches will go via Krzysztof tree it has been sent as one
> series.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes
      https://git.kernel.org/krzk/linux/c/024d8f4aa35970c4563c6ef0c4170133719b2103

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


