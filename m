Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D28C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 11:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GM6+ah7qzUOGhErR0fDigeV/mrNjuhmW+e9yPW7wu/o=; b=E1cFrSkd0aPXup
	px580Nip1wxQfG/cIjPWATzXM6V0LEbW7lDO02SDGcxYvG76epd6bJ03s/ekgJTK87Qcp19FT5IRd
	3i7IXqAaT3y6vBxc30GoeqZ/6eBsHzEzh+1Ohusni5G9tl/Qg3m0jdT4sNshyK1oy7z25cZBQD2u9
	8j9WSbVSbeHzUZ2YHRg08zf98bqJ6XnCi9976Qk7wgou9G9k01AbQThHJnqNfA5yuPm5RtJkk+5DF
	hqZCkSvYZmqXG8Ew1a/66vMNqAHzT4AZcuRW+cYdl9pBUc1vmcxPst+GefilUwgKMJ2XbItyQQsRG
	X4Vf1yfTqIO4kWfAu4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnrE-00000005Y9T-1a7a;
	Fri, 01 Aug 2025 11:23:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnm5-00000005XGr-1dtQ;
	Fri, 01 Aug 2025 11:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047085;
	bh=PuTz5rP+g1ZNjvUwlN2rQtxoXWKf+C3pIRkEwIk533k=;
	h=From:Subject:Date:To:Cc:From;
	b=TuJJvz8vFL99CAaAFlgj7f3CllPTWHCLan9hM0cD1Cjr+Luo0h5MfgVGpC/p2waZX
	 tzMVV5LhUvsYMg7w+rnZpXAupaLFoR7vx0FZbJ78yHPS1MEt7uSm2Ve7suHVi4kG9W
	 D65RdIu23GcUpsaUqewq2iUTaFhHbeR3Mknbz+oDTM5lgbtZgr5UpUGqdGiKiU7REv
	 mDkFkXBDqN4Y094si7k+fx8PG5BHD/bca8u+180HUyGbyQI+wI/FLjnLQOvI3M9Tak
	 F+5a2PqNF1mZ5xjH24e+xoNQTthUuocashNJX8aZnPdovHcBCQBI/aECzBKEckVWmT
	 Q/0VOoew0NODw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADD4417E01FD;
	Fri,  1 Aug 2025 13:18:04 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/9] MediaTek devicetree/bindings warnings sanitization
 second round
Date: Fri, 01 Aug 2025 13:18:02 +0200
Message-Id: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqijGgC/x3MQQqAIBBA0avIrBvQKIyuEi1KxxoiC5UKwrsnL
 d/i/xciBaYIvXgh0MWRD1+gKgFmnfxCyLYYalm3spMK97ShTTPeU/Dsl4iq1bZxRkmnNZTsDOT
 4+ZfDmPMHxs4ujGIAAAA=
X-Change-ID: 20250801-mtk-dtb-warnings-157d4fc10f77
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_041809_611986_681A3BE2 
X-CRM114-Status: GOOD (  11.25  )
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

This patch series continues the effort to address Device Tree validation warnings for MediaTek platforms, with a focus on MT8183. It follows the initial cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177.html)

The patches in this set eliminate several of the remaining warnings by improving or converting DT bindings to YAML, adding missing properties, and updating device tree files accordingly.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (9):
      dt-bindings: clock: mediatek: Add power-domains property
      dt-bindings: arm: mediatek: Support mt8183-audiosys binding variant
      arm64: dts: mt8183: Rename nodes to match audiosys binding schema
      ASoc: dt-binding: Convert mt8183-afe-pcm binding to YAML
      dt-bindings: sound: Convert MT8183 DA7219 sound card bindings to YAML
      ASoC: dt-binding: Convert MediaTek mt8183-mt6358 bindings to YAML
      dt-bindings: pinctrl: mediatek: mt8183: Allow gpio-line-names
      arm64: dts: mediatek: mt8183-kukui: Fix pull-down/up-adv values
      arm64: dts: mediatek: mt8183-pumkin: Fix pull-down/up-adv values

 .../bindings/arm/mediatek/mediatek,audsys.yaml     |  17 +-
 .../devicetree/bindings/clock/mediatek,syscon.yaml |   3 +
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |   2 +
 .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
 .../devicetree/bindings/sound/mt8183-afe-pcm.yaml  | 225 +++++++++++++++++++++
 .../bindings/sound/mt8183-da7219-max98357.txt      |  21 --
 .../devicetree/bindings/sound/mt8183-da7219.yaml   |  49 +++++
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       |  25 ---
 .../devicetree/bindings/sound/mt8183-mt6358.yaml   |  59 ++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  22 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  22 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   4 +-
 12 files changed, 378 insertions(+), 113 deletions(-)
---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250801-mtk-dtb-warnings-157d4fc10f77

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


