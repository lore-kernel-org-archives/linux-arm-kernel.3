Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0FEC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dBQjMBqJhv05xBZ/uzzxA84N7qyht7dUENlLGM1TnPU=; b=nFQ2fqtyx+3hAYZmchlFYCLSr7
	zDHr+VDXEfhZwJmVVs4QYoghiyN2Bl92lhKsKt1xqE4h9SYnWVaCRjQd6sVlEWV2RzRd/t4r5VrfL
	fghhsRr6KwEapBamVEZrobs+xNq8c+NV1D2LVvPF0jU+UH9v2BoZXvNc5hMd6SctuwGCqSr1li8eK
	tb/UmY4OKs4tun7Kg8rheRRONHF0cFxNn3AjADKwxTRTfU8gzfSO2I7JGfAK2NMudfGAJo0EZsym/
	dCRsHeHNfMgipDlYUROYk6iDea8i5FX4QDaf6pr0ViMNhUnE7eI6zczcq2hNkBI+WinGQqv+EPfq/
	zAfMvuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKC7-0000000DynI-0GQU;
	Thu, 19 Jun 2025 18:41:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSImW-0000000DiOj-23lU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF2C0617F0;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFD5C4CEF0;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750353031;
	bh=8hxDZ0YSUK5GNrtuai7MmCbxc9EplTXFmwAHYdeKd2E=;
	h=From:To:Cc:Subject:Date:From;
	b=KToOsjICUEUoTbUKv8eO/Zl1IVmaG/KZnNYKRiwpw2a4YFz2QenEUH2zE38mmY42E
	 DTetmPdRhFGWLKWEyl+Z/YuhhNN4YDmwfoGfOvvtwjBNMCyFTjCGyxuULi6P9iqry9
	 YJ34CU9/nNHhF3KAYtLFB2N8NafC7bsa+6hmVMf78eyIa2wSF1VKHr029LlSxH6GMJ
	 h8hBlRwdg8IdbT31lsU1xuiz1L95zSmySdV1ipqG1JJxMVtJmXEM6xHDgNKXH0hb5N
	 8Qgk3sYIfzJiP5ZH7o+rDf2W4Xhq6t++WP7P9CRU/Wpc0OtOwala9jmdmblqxZeRgK
	 xz5uWUol/cg4g==
Received: by wens.tw (Postfix, from userid 1000)
	id 72BED5FEF5; Fri, 20 Jun 2025 01:10:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset
Date: Fri, 20 Jun 2025 01:10:23 +0800
Message-Id: <20250619171025.3359384-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Chen-Yu Tsai <wens@csie.org>

There is a PPU0 reset control bit in the same register as the PPU1
reset control. This missing reset control is for the PCK-600 unit
in the SoC. Manual tests show that the reset control indeed exists,
and if not configured, the system will hang when the PCK-600
registers are accessed.

This series adds a reset entry for it at the end of the existing ones,
in both the DT binding header file and the driver.

I will take both patches through the sunxi trees since I need the
header file change for a subsequent patch series.

Please have a look.


ChenYu


Chen-Yu Tsai (2):
  dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
  clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c      | 1 +
 include/dt-bindings/reset/sun55i-a523-r-ccu.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.39.5


