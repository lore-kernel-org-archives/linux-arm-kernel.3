Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FA7D12D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IvVz9NVbyfbTY0pRXMs/wl6EXEHRibNkv8Zs+cmkDwM=; b=yjxAeoZr+NHG+hol8jEPpChPsP
	HGpvelJI/s1RTGpHo7cXxewlva08zZD2vZOvt79bMWn7L85FBZdgw6f4YIrVOd7b2GCQ9e6eSvEDk
	LVHARDlkMski6Lf/RJZGs3b0bXeURajyONjQxAsltnAMfO8MF80f1YKehdp2VYyE2iuaUr9tuvf/0
	Np4C587gsp+AnSpJ6kHHTdIeLSWGq1WdnhEN84KtTqvPVsBwB/TdP3+WdN2mtLVANJX5naejDq9oo
	LRZxOKv0EjCktqUSY0vo6bBSq77w9rFVyhQdg3Zg6F/thHqBzs2zZdFKmv/nlKR1/GomngtNP1uID
	cqj8GYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIsH-0000000Fzaj-481i;
	Mon, 11 Nov 2024 01:05:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIkh-0000000FyXh-2rCP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 00:58:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F24BE13D5;
	Sun, 10 Nov 2024 16:58:28 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66A2A3F66E;
	Sun, 10 Nov 2024 16:57:57 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A523 support
Date: Mon, 11 Nov 2024 00:57:43 +0000
Message-ID: <20241111005750.13071-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_165759_829668_90183A39 
X-CRM114-Status: GOOD (  20.08  )
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

Hi,

this series introduces pinctrl support for the Allwinner A523 family
of SoCs (comprising A523, A527, T527). [1]
The first three patches extend the sunxi pinctrl core code to deal with
some specialities of the new SoC: it uses every of the 11 possible banks
except the first one, which required some register remapping. The first
patch here is actually some cleanup, which we should take regardless, I
think, since it fixes some hack we introduced with the D1 support.

The main feature is actually patch 4, which introduces a new way to
express the required pinmux values for each function/pin pair. 
Traditionally, we dumped a rather large table of data into the (single
image!) kernel for that, but this approach now puts that value into
the DT, and builds the table at runtime. This patch was posted twice
before [1][2], the last time LinusW seemed to be fine with the idea,
just complained about the abuse of the generic pinmux property. I changed
that to allwinner,pinmux now. For yet another alternative, see below.

The rest of the patches are the usual suspects: the two files for the
two pinctrl instances of the new SoC (now very small), and the DT
binding.

Based on v6.12-rc1. Please have a look, review and test!

Cheers,
Andre

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3
[2] https://patchwork.ozlabs.org/project/linux-gpio/cover/20171113012523.2328-1-andre.przywara@arm.com/
[3] https://lore.kernel.org/linux-arm-kernel/20221110014255.20711-1-andre.przywara@arm.com/

P.S. LinusW's comment about "pinmux" being something different made me
think about whether we should adopt an even different approach, and
follow the Apple silicon GPIO driver. That conflates the existing "pins"
and "allwinner,pinmux" properties into the standard "pinmux" one, like
this:
	uart0_pb_pins: uart0-pb-pins {
		pinmux = <SUNXI_PIN(PB, 9, 2)>,
			 <SUNXI_PIN(PB, 10, 2)>;
		function = "uart0";
	};
That looks like a neat solution to me, with the huge drawback of
requiring a completely different of_xlate function, which I guess means
a more or less completely separate pinctrl driver.
Let me know if you think that's worthwhile.

Andre Przywara (7):
  pinctrl: sunxi: refactor pinctrl variants into flags
  pinctrl: sunxi: move bank K register offset
  pinctrl: sunxi: support moved power configuration registers
  pinctrl: sunxi: allow reading mux values from DT
  dt-bindings: pinctrl: add compatible for Allwinner A523/T527
  pinctrl: sunxi: Add support for the Allwinner A523
  pinctrl: sunxi: Add support for the secondary A523 GPIO ports

 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  23 +-
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   3 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |   6 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun5i.c         |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c     |   7 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c      | 357 ++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  54 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  45 ++-
 13 files changed, 586 insertions(+), 51 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c

-- 
2.46.2


