Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24304C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 21:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NkfEeNib2nAHRGypNGRoaM9481JICC18/vExFNYAQBw=; b=BNlJF6hV9gVTtr
	Zu8cTgb840XvzS2BsbEF6VN9RjAHPtNcODb1PKte1l9lBOkjBXKOH7oHFQzgFSbf5BFuesGd0wYfw
	etS5T/mJlkMClQ93vunCUZtU6MxCITIbH0fXoUeMa4P/RtgqvuBfL7s6HE24i4aKPR2gqIfYOkTpY
	NJWEhuwYvKdGmUuiNB7O3DT5H+d6foSxnIiuQmxmifaeVUCO88M2iPApWxzIyU8TUSG/84uWwGVGJ
	p9j/mkTZEucUmf+x13J9jm+Pzn1wHIBu1tMereVxdZ8cT07qKnDNxotfWDxQMKDaVguXbUBmcOzJd
	vTj/atntTCQOKtlHnAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtB4j-0000000Ajw7-0kQs;
	Sun, 09 Aug 2026 21:28:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtB4g-0000000Ajul-0TH1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 21:28:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4798bea72f9so694472f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310932; x=1786915732; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NkfEeNib2nAHRGypNGRoaM9481JICC18/vExFNYAQBw=;
        b=AfZ31Obx8ewR41SQ8JP27kxhmwVE9OxywC00sM3V4Do0l47adTgahtT8/YSyrD0Sd1
         Z1muTSJ9s31gEPgO9LZjW3RveA5IgClyNRlqqgndf2Xu0oAVrNqAMUx31WY4yIT8dJuM
         HPkUff2w1QixztOXmxfsOGfg3TK92/9H6DRcuSGGAyuWyT9jBnUk4Rd6IdGZQ+1FiTF1
         TfPTaNOewkwWTByIbPeQ8tkEHsqzZF7DEd1L1tRJZmMW00XS2KuDEVFKYInYYwC/ltk3
         phATLws3XSOunr1bVYqEwb3zBM5/6k+0iupmJ9wZKvzfJN0bNHPpNYp6tyXEGuCyfnZN
         bScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310932; x=1786915732;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NkfEeNib2nAHRGypNGRoaM9481JICC18/vExFNYAQBw=;
        b=la7nWn993dk3TGLbg2PRrKQKIbg5x5QqddLHwOAoDACILWW1iCUrOuW1DGegIo/Jop
         3KdvA+COYjQ3VBpo6GbF+c3O4dBvjispZfaduTkvmH6jBym4ESsJWZld6dIsYwycwB5C
         R54474+IOimETem4q4xxxiz1wNbmWBebetTXnTXyzgc4HiGm0Zb/xVH3znIk+0y+eQ5V
         pSV607yRVfaFU7j/wvP0g0gtcX5CpFzUNYQcjBFhdEmEr5txpSPg8WYCIF486d59TuBf
         4xkjDbLFuzC84JEWMrW9XKkdIJ9alOb4cxrQHXXfaxljPbQ17WWdOP11WZ60xKjQZqkg
         h9dQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+vHAZYNwc+fCcQxBPU4nDEXXu+m+gCSSu5azhf+FQ//GlqeVT7ld+KL9O7aCTwCzgO318V/86z96+s+ClgXTJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwRYfP+/PJej6kc5PExu3WldCUE6rCYkQJHznSsd+P+qVhwtxmz
	c76uKihvQAyJ3tAMM65a8P5d8gKal/OZsAYThGDpShZGGrTaQ+7Q63tu
X-Gm-Gg: AR+sD12H9zFGNx4T2623N4e0z2BK7eBQ8JcIyIhgFhai+Omdh/RcQwx6FNEwBnv/WIx
	ozPm4EMHF1kSRjyg/oVm6tDkfyoCJTgmtYd583Q+f/bQLJxdA1/dn6aIGrPaoA+o8qKdNnhx2Wt
	xoCiOICnyie4/zedDOrWwDuH+0yueVLjrEzF1ymSg2BYvc7XJKDdWuvCUYOSLHyhEzkhQmn9VUi
	Zi1JuriTPTvdW2PECfZIZVV8GQ5OjfHAJEuy6EKYAAbUS/XCLPdToM8XpZxq7JGfDCGEqVZeRNi
	RrJNrL1sT3JDLi8gIN5K7ir6Phtd3GmZuMX/ZCKEt6nfQU9NmbISJxJrLyK0K6P+WwQ9Ew5Lw9X
	+aDdez4H4bGC48+s4YmIWXXd1buZxPrklFy8BdrvmnPARw6GF3cyEKn5FvZipx0rX9xmuN2w0IY
	vewMR64KTBpT4CYyojrJf/jCggcZr02JKN/jzDKeNlr1xyAZnv961TRrZop3R+qBJImOhFmn0=
X-Received: by 2002:adf:e012:0:20b0:47f:753c:5393 with SMTP id ffacd0b85a97d-47fec4e888cmr46287976f8f.6.1786310931797;
        Sun, 09 Aug 2026 14:28:51 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:28:51 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v10 00/12] ZTE zx297520v3 clock bindings and driver
Date: Mon, 10 Aug 2026 00:28:19 +0300
Message-Id: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQSW4DIRAF0KtYrNNRUcxe5R5RFgyFjeIh6XZaT
 izfPdhegNrLKvE+Hy5sorHQxNarCxtpLlM5HurA4WXF4tYfNjSUVBcMATUoDsPfGV3cfQ5IMgl
 HgqONrJ7+GimX8z3q/eMxj/T9UxNPjyULfqIhHvf7clqvdLDR+qy4TEa4BEKorJRxQVlFgMEHs
 t6gYbesbZlOx/H33nLm97CnPjMfYCAefMw5k9PmbbP3ZfdaL7xnzNg73hxWhy4DpSgAslo60Tl
 0zYnqosmkJHlhbV462Zzmujl5c945GRIiubR0qnNom1PVGZczSEmSO1w63ZwBbE5XJ4wJBmS2E
 OXSmc5x05ypToKVnMccs9BLZzuHnbO3np6DCfU3eXp6n2vO9j1ddQmUEpCsSmh7d71e/wGNS1i
 uqwIAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8252;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=UjBdBzBXYg8Znb/Jp52IyvPHovSzZo17ugDX1DQT9Co=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEIVd1rySIKpgStz0skca3tAjLUKeIDBd3ak
 TuN3zJhA/WJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxCBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJwqw//VjelfyUPqnKG3P8Wwygeo52MxYK6/ZS
 uj8SLtCoSF/nexyZuRsXvy9uE3IfKYfWh9QiFtSMXYHipVZ9qcURCX2wiPgA6mdORiBeB1VNX2D
 udaYFKd9BagBDvD3R49CvHPaq627sQwXgpOr5sA9f3PII+zTaytFguaC3eMtl+USCO3GLuVO5B0
 p6bQycal1JuePm+QTuaIDtT9lXT7BVfN1qOlmPeXX5LKMkKOPE16MQYHyx13FROdHDmZFPZd76J
 CUhJlNVr0qaAQdGQqdF3PI517uT6bOMMTBaH5O3rddRY4jjYVtGi86BV3XqSDQ/hsK0Mc2cpzIw
 L3hL4mVJp9NRFo/o2HedHrOmWUiGyr1r+BCWTPH/uuUv95YAunEtdZOxc/QmJKR2ICD6ycrwuXi
 Ldvlwoyd3bsJrEQ9bVDvTdbB7JhhtXlRY5GBlZRSGEASzazwxEDtHxQP5CN0BmxKRhTFLxVS6g+
 LGFuxYzXZhiR77U1sOVjo9j8fRw2UYiI2IWFT++LP/QJ6McRtTzpm2VZ/RtUPQtGoMdbcAbhKsY
 oetY7k2H1EGq+GbqqJM4jYuekIkxZWz3kFJ8CgsxPaTEltoNngkuZzdFkJcxNFOetXNb9XWuO7I
 45xY2Sw0sdxGQvxzw9/rQdSwNN030khPgHu4luzLbf2yeBCrdRek=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_142854_215496_3A515CE6 
X-CRM114-Status: GOOD (  27.68  )
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

I am sending version 10 of my zx297520v3 clock patch. It fixes review 
issues and refines the ZSP DSP rproc clocks and resets a little bit.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. AFAIU adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Merge dependencies: The binding patches (1, 2, 3) and DT patch (12) in 
order. The MFD parent (4) is independent, although changing the ordering 
likely needs trivial adjustments in MAINTAINERS. The clock driver 
patches depend on the headers added by 1-3 and apply in order 
(5-10). Reset needs headers (1-3), but it is independent of clock.

Though in practice mfd, clock and reset drivers are dead code until 
patch 12 adds the DT nodes. Clock and reset drivers won't be 
instantiated without the MFD parent.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
What's the next step after all the individual patches are reviewed? 
Should I submit them as pull requests to the DT, mfd, clock, reset 
trees? Or do the maintainers pick them from the list?

Changes in v10:
*) Clock infrastructure: Fix issues pointed out by Brian. The individual 
patches have more details in the changelog
*) MFD infrastructure: Remove _MFD_ from the match data enums
*) Further refinement of LTE related clocks and resets: The ZSP rproc 
has two resets, one in topcrm and one in matrixcrm. I don't know what 
the difference between them is, but both need to be deasserted for it to 
work. Previously I thought the matrixcrm register 0x3c is a clock. The 
clock gate is actually in 0x34.

Changes in v9:
*) Use parent_data in the clock driver instead of parent_names. That 
required some infrastructure to keep track of registered clocks rather 
than devm-and-forget. A nice side effect is that it uncovered a missing 
top->matrix clock link. (Brian)

*) Remove the self-referencing USB PHY reset in topcrm (Krzysztof)

*) (Hopefully) get unevaluatedProperties and additionalProperties right 
in topcrm (Krzysztof)

*) GMAC and SDIO on the matrixcrm controller need topcrm's ahb clock as 
parent. It is added to Matrix's binding and fixed in the driver

*) LSP reset and pclk handling moved from clock child to mfd parent 
driver

- Link to v8: https://lore.kernel.org/r/20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com

Changes in v8:
*) Put #phy-cells into topcrm. The mfd child will have to assign itself 
the MFD parent's of_node to satisfy the check in phy-core.c's
__of_phy_provider_register().

*) Added another register to matrixclk that controls in-controller 
distribution gates. No functional change, but it nicely confirms the 
top->matrix interface

*) Changed clock indices to start at 0, adjusted driver to not use 0 as 
"do not export" marker.

*) Rename DT fixed clock nodes from osc26m -> clock-26m and osc32k -> 
clock-32k

*) Fixed more issues pointed out by Sashiko

- Link to v7: https://lore.kernel.org/r/20260717-zx29clk-v7-0-408411cfcf36@gmail.com

Changes in v7:

*) Moved DT bindings back to clock/ (Krzysztof)
*) Added a usb-phy child node to top to expose the USB status register
*) Add clock gates that control input of PLL clocks into topcrm and 
forward to matrixcrm. Strip down matrixcrm inputs in the bindings to the 
known clocks in this register
*) Add DDR clocks and resets, arm arch timer clock. They are marked 
critical and tell CCF not to gate off the aforementioned input/forward 
gates
*) Remove syscon from matrixcrm (Krzysztof). The DDR mailbox system is 
on a different controller (soc_sys at 0x140000). ZTE's code merely 
controlled clocks in matrixcrm, which doesn't require syscon on this 
controller.
*) Consistently use double quotes in bindings and full include paths 
(Krzysztof)

The individual patches call out changes in more detail.

- Link to v6: https://lore.kernel.org/r/20260702-zx29clk-v6-0-377b704f80c4@gmail.com

Changes in v6:
*) Use MFD for all 3 controllers - I hope both Conor and Philipp will 
agree. I kept top and matrix bindings in soc/zte and lsp in clock/ 
though.

*) Clean up issues found by Sashiko. I pointed them out in the individual 
patches. They are localized fixes and don't affect the overall design

*) Small code consistency: Changed "zx297520v3_lsp" to use "-" , "rst" 
in driver names to "reset"

Changes in v5:
*) Use MFD instead of aux bus for top and matrix clocks
*) Move top and matrix bindings to soc/zte
*) Give USB PHY its own resets
*) Other localized changes are noted in the individual patches
- Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com

Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      mfd: zx297520v3: Add a clock and reset MFD driver
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  101 ++
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   |   98 ++
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      |  122 ++
 MAINTAINERS                                        |    9 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  101 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   28 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  237 +++
 drivers/clk/zte/clk-zx.c                           |  192 +++
 drivers/clk/zte/clk-zx.h                           |  137 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 1599 ++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           |  580 +++++++
 drivers/mfd/Kconfig                                |   13 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |  117 ++
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  237 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  145 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   62 +
 23 files changed, 3802 insertions(+), 12 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


