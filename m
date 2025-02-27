Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A3EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lUBG3cVYHEjoNMeivnhEzVrtMLXIn9Qgo6njbWn33FQ=; b=PAwp0jOf6vTWPbXOorP1bn+pcV
	QrzYMy1z9LTJ9jFHP4pJvh1JEryml/ERX/khuXRsuVa5qPR1sSDMunS53zF8ve1i6acQOnNAdCKGM
	BXZfFuiIgnW8pQWVv3IEILGFRnYh0VcRDqY2Ro2ag1RQMy1rL10tmCBEiT0gZRgKnDLhfTqg68vV6
	iDDDv6aEhw4LnumQymLVjCRkX7mP9LZzDuXUdNr4zCESefNiV2fIzZTycyWpbNzMjaAB9BIJ1JiyR
	Bq/eh90Dkod1wbbmQv/zULjOwL+pNj2leqV9QlL60sMDg6WS/KBEDbonbA0S9ktekT5IjEPw9mjtL
	j3GmHblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn9Y-00000009979-14c6;
	Thu, 27 Feb 2025 23:18:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnn7y-000000098gu-1Tx2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:17:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B1C31516;
	Thu, 27 Feb 2025 15:17:28 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D5C13F673;
	Thu, 27 Feb 2025 15:17:11 -0800 (PST)
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
Subject: [PATCH v3 0/8] pinctrl: sunxi: Add Allwinner A523 support
Date: Thu, 27 Feb 2025 23:14:39 +0000
Message-ID: <20250227231447.20161-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_151714_480125_192B5A6B 
X-CRM114-Status: GOOD (  19.81  )
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

this is the third drop of the series introducing pinctrl support for the
Allwinner A523 family of SoCs (comprising A523, A527, T527, H728). [1]
Only small changes this time: renaming a symbol, fixing the DT binding
example, add adding the accrued tags. Many thanks to the reviewers, in
particular Jernej for biting the bullet and looking at patch 5/8!
Changelog below.

==============
The first four patches extend the sunxi pinctrl core code to deal with
some specialities of the new SoC: it uses every of the 11 possible banks
except the first one, which required some register remapping. The first
patch here is some cleanup, which we should take regardless, I think,
since it fixes some hack we introduced with the D1 support.

The main feature is actually patch 5, which introduces a new way to
express the required pinmux values for each function/pin pair. 
Traditionally, we dumped a rather large table of data into the (single
image!) kernel for that, but this approach now puts that value into
the DT, and builds the table at runtime. This patch was posted twice
before [2][3], the last time LinusW seemed to be fine with the idea,
just complained about the abuse of the generic pinmux property. I changed
that to allwinner,pinmux now.

The rest of the patches are the usual suspects: the two files for the
two pinctrl instances of the new SoC (now very small), and the DT
binding.

Based on v6.14-rc1. Please have a look, review and test!

Cheers,
Andre

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3
[2] https://patchwork.ozlabs.org/project/linux-gpio/cover/20171113012523.2328-1-andre.przywara@arm.com/
[3] https://lore.kernel.org/linux-arm-kernel/20221110014255.20711-1-andre.przywara@arm.com/

Changelog v2 .. v3:
- rename POW_MOD_SEL symbol
- drop CCU binding header inclusion in DT binding example
- add review tags (with thanks!)

Changelog v1 .. v2:
- rebased on v6.14-rc1
- extend regulator array to cover PortK as well
- increase number of pins in A523 PortJ from 18 to 28
- extend comment for new pinctrl DT code
- move DT binding into separate yaml file
- Add Jernej's Reviewed-by (with thanks!)


Andre Przywara (8):
  pinctrl: sunxi: refactor pinctrl variants into flags
  pinctrl: sunxi: increase number of GPIO bank regulators
  pinctrl: sunxi: move bank K register offset
  pinctrl: sunxi: support moved power configuration registers
  pinctrl: sunxi: allow reading mux values from DT
  dt-bindings: pinctrl: add compatible for Allwinner A523/T527
  pinctrl: sunxi: Add support for the Allwinner A523
  pinctrl: sunxi: Add support for the secondary A523 GPIO ports

 .../allwinner,sun55i-a523-pinctrl.yaml        | 175 ++++++++
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   3 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |   6 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun5i.c         |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c     |   7 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c      | 374 ++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  54 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  47 ++-
 13 files changed, 758 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c

-- 
2.46.3


