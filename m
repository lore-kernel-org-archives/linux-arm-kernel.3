Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF08CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PjYqH6B5CCi+AgizGsioIFSGilvnDrEyUJqaQhvTuKc=; b=BxEqZQ/hX8bsWgWeqUNgAD1p2G
	djdWAvULGCVem+gXweV0XVk16HnB90/2hX36jzh6DMQ7rtkimHb7Q7IZn6ueBAYV/MH+6i5vNjXpm
	RTwUDkKs8LaXNaWsr5jz87Y4smiqiZKUh2dXWa4ZwxuH9avXo1JwVwpS+Pxe65S5ejkBOBZz6mnzU
	l6rp+PN0dpKwl3/9C+LCYQDK6XLM9ikgHBMsqLbhHwaoYJ97Oew6OSNmqPISoK3RvJEwAjHyKOHI8
	f9yfWGDa9cIX7scfak30MZDlg2N6r+yCv36pvFqSEP70PflKNqxpqxv/jWOoa6VDqgWUa6IG9QL9k
	f/Yv04ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKZ8-00000007zGe-35Hw;
	Wed, 10 Jun 2026 15:10:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKZ7-00000007zGH-3yoh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 15:10:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE26C601DC;
	Wed, 10 Jun 2026 15:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FB71F00893;
	Wed, 10 Jun 2026 15:09:56 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
Date: Wed, 10 Jun 2026 17:09:52 +0200
Message-ID: <cover.1781103355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

	Hi all,

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
series drop all such masks where they are still present.

Changes compared to v1:
  - Drop applied patches,
  - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
    EL2 virtual timer interrupt") in soc/for-next.

This has been compile-tested only.  But note that all such masks were
removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
systems")).

Thanks for your comments!

[1] "[PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts"
    https://lore.kernel.org/cover.1772643434.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: tegra: Drop CPU masks from GICv3 PPI interrupts

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
 arch/arm64/boot/dts/nvidia/tegra234.dtsi     | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

