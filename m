Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99BAC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CE+SIH9CU3mvrwPuRIH+h2nOsgV2qTCNT2M+oGbmRW4=; b=HbBxaWzKCl6Hsm
	Wn9nJEeRZEQsLwGk1mKSCE793vLN5dmLMGB0j5fyboM9QLxyICGQ/CWAHG5OZLcROVvx6fxdl6A3i
	vtVeJX8nC93MOuCBtz+R7J1sivCNTSpWZTlrrAkDPB4lZbISyPq707len6WULrwc9QlLTf+rVXojo
	OodclRL3YiFgfEVxovfAlEyQctS0ZoTgUARp+uibO1WKdfQLY6zOCFuMKNOpE83y4bC+9WyO+NN0/
	KamqslMdWEGcLf0t2CzcaGipBnZV8UTFlpt4hvtULV2sJtvyijVKBUQBjBit1W1E725Bd/4eQ4XP1
	SvryKv/Lgmk7BdoIX4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydC-00000001VVe-3XIo;
	Tue, 25 Aug 2026 21:24:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyd9-00000001VUd-2A56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:24:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c25099bb1fbso24000166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693065; x=1788297865; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CE+SIH9CU3mvrwPuRIH+h2nOsgV2qTCNT2M+oGbmRW4=;
        b=OaDMJyf1SA93kP0GFcDuc/fzDTJjoneXwAU8S2XKyqpPsz/qhbLeouB+MX9qfb/cQ/
         L5Yuo3TdOrWj6sHcwvbISCeta/YoGvI69ck5RF5ZRF7805bdcJRWex7ZIVQaOntYfy0L
         98ViHwFJc06DZfZpyvvLI5V0b+/I/FATA2HVWXuJrrvpRCMMswT15h3W3HYUx//nt5Po
         PUc3EFqMF8hx7Ba+xylY/3T+BC3ujplTqVXjP4TrkA+4DeOUVd23hfljlfbUx8uVSVPJ
         nsyHcrQL+tyjBc1xBnbHDazXA7jhOEiLxrhsy0sG1I+R+wRpCarrdctobL7vZ2Vp/53J
         n6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693065; x=1788297865;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CE+SIH9CU3mvrwPuRIH+h2nOsgV2qTCNT2M+oGbmRW4=;
        b=sjsnrVcZZ3kJh9fyWQ/72hQ27jAGzQc3Vs9xDIuMnhaUoztoHlvpFL0fz5f0Eqiv1o
         kqT5rM6qzxNdbmp4f+LdQWKgl9USIevPC18d4nXFXPltwZL09r50rUT7ihNYpbSsXV4w
         9KEwtxYN5KddTCT9+A3t5S80HvOTjgmZvnUpJ+Ih3yGP5bC02abar/9MfN/bKCZI3U1y
         c9KpvIQ7M5XPYOweJwC5AEyWde1UwrWglK4Zf63qnq0Q5sBDkHOErPGKXXwfoXY3ZKfq
         u9jlL1zy+4xB/QTCh+mwFajqhAKismNAur90NS9lNgIjuSJOasPaRg6wo46o7pxfbnWc
         ZBDA==
X-Forwarded-Encrypted: i=1; AHgh+RpiLFAQ0/ty59hk5Km8To/QiFYkY5dsei6lMW+3uzNSUDiZTDl3vRxfqe5jw3+4/iNIMnBFXbIThVTLUHKmyfA8@lists.infradead.org
X-Gm-Message-State: AFuF++ktFKZEMLeoF8zHbuvqtLpUGOT6VwLlZIY41omOxnNRjvLLESlC
	ZmefpuQO6tZC249GcP73M0UoWWAfsKB90gOXO2H43jkoJ+AMX66GEfvX
X-Gm-Gg: AR+sD12o+mGz5DjUiwjn7Im2Nbgxm4k0GUsqV1p2VmAUt+dnqoF91Mdo53oVLSF+3/5
	Uw5p83TqZJzw/U+fZf4b1YJ6fuhrwq3YeW04rjOBgdAQutZqCjtyO6tE8rCmB9/7GLGrpKKHRUI
	BZ7jWsqCKE6CDVnrNCGO15Jm6diraLdZossr48+mxKJNGsVjZvafNUn3OO9Qdlec4dcgQHp0JAT
	WHVLa1YgnOturjDjcrrhEoetIK/wvZFZWWagASBu5zx90weHTYRfdXNK7fJaKbN4HWrpxtN9wQz
	rII1NEz6QpDE7M69tjIWDf+fPptrXgP/Y6/WwHyXnYvJENPhwkch0WyTOhOntNN5tGijyIM3BQR
	hs7S3HLTXeG19jGQipvWUcCx9vYsU31q0bs1BY99a8mUWW2aFjZZhi383O8J+PaoLD/fr6tNgVI
	TEAEA9KLszvhcAUh4uheBWmR90ORF4viaEKU44bwsPq5wuBjsYWiUQqyDP3ATY7P57kfez5FOt/
	m6VM+bIFw1IfIcn6Err
X-Received: by 2002:a17:907:3e90:b0:c24:d430:3929 with SMTP id a640c23a62f3a-c250bb05b51mr191458966b.1.1787693064734;
        Tue, 25 Aug 2026 14:24:24 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:24:23 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v11 00/12] ZTE zx297520v3 clock bindings and driver
Date: Wed, 26 Aug 2026 00:23:59 +0300
Message-Id: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XRzU7DMAwH8FeZeqbIdr5sTrwH4tAmDlQwBu2YB
 tPenWwcEsoxVn7/2PGpW3SedOnuNqdu1sO0TLu3ckC82XTxeXh70n5KpdARkAeH0H8fSeLrS09
 qkxE1SBy7cvt91jwdr1EPj7/nWT8+S+L+t9iNw6J93G230/5uM7AFrz7CGMREhcAMKJ4NmxAts
 HOjcyKuu2Q9T8t+N39duzzgNexfPwfsoVcch5hzVvHh/mk7TK+35cFrxoFah9VRcSQZNEUDkN3
 amcaRVGeKiyGrszoY5rx2tjqPvjp7cYOIHRORSlo71zji6lxxQXIGa9Wi0Nr56gJQdb44E8IYw
 GaGaNcuNA5DdaG4sgiLGHPMxq8dN44ax5c+B4Qwlt/E9G8+qY7bPqW4BM4ZSOwS8dohNPDP4qF
 Ib9h6K2UEiq08n88/ISz1guUCAAA=
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8350;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=lHZ01xK6z7HeMA3bWHVf/8BkzwYtauT1FfmgY7fMppw=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjgf7SoqQLw6/h8DyJLSpVmgTOAytD5yH0gs7/
 Vbe96mgQIqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4H+xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIJxw//WL1K4EPuvDw6Jk6a+mhqgIrNH3bQL8f
 gTWfw+oXY58gQaHrb0aGd2wWpbYLNajB/7Cqs4NrPzwmwVgoGD4a8XB1CgzT6hPATu7u0InP/wE
 VoSbXooW6gFIOCcLsp7eV/GxHj3OcytCtSRguAbro96Ql4nvqjsqbhlKaivCNWpVJQFpjKUXZ7F
 JNKrcKsc/6pLgF94GL7wl0FWByow5Ou5zT0vr/epCuSPEmQ+/wIIuaJgLg/XdoiDzoZvqyJtjct
 GvBiUZ3YXFhtBZjZF7brk0JIvImIMpL7+LdGIN7EK9LvhFaNUs+XdTwaGLZJ426JS9U3H4nW4l8
 lnXeBzRwXAC6Y93gZf+t1Xavuatfl5YBXV1N71W9LQ/LCHyYssZLeV3jvvRjDGFdeCC9aE85ZQl
 YlJzLPJliU7vWL2hSvgEwA4ItwSnIRs7zNNXac4AN5tcEDGWhTUmwAUPiHi4LWjj+B4i+d/N7iq
 UJ4PeyM4ODF6GJEYsbe7NmfioDhNproZIQf1LppMWuQoRYoeBGlcbUhKF2mRT8jF42NL80fTPoB
 jwDxUjYQRzKNjd9l3yQH1j+73uIramaL8PPBPcxcn5tfbKcIK7KrHRoSPuN0P0mgBgazNRjM90L
 eKL810Z7KMwHvdS+wUoe+WRLOZsQhDTwtYJvQ75WFrVcjWncEdK4=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_142427_629138_DCA64688 
X-CRM114-Status: GOOD (  29.42  )
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

I am sending version 11 of my zx297520v3 clock patch. It addresses review 
comments for the MFD driver but has no other substantial changes

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. AFAIU adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Merge dependencies: The binding patches (1, 2, 3) and DT patch (4) in 
order. The MFD parent (5) is independent, although changing the ordering 
likely needs trivial adjustments in MAINTAINERS. The clock driver 
patches depend on the headers added by 1-3 and apply in order 
(6-11). Reset needs headers (1-3), but it is independent of clock.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v11:
Addresses Lee Jones's comments on the MFD patch
Reorder the DTSI patch ahead of the driver patch to give it more 
visibility - it is the only patch in the series that hasn't seen a review 
so far. It is also order independent of the driver patches.

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
      ARM: dts: zte: Declare zx297520v3 CRM device nodes
      mfd: zx297520v3: Add a clock and reset MFD driver
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver

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
 drivers/clk/zte/pll-zx.c                           |  576 +++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |  101 ++
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  237 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  145 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   62 +
 23 files changed, 3781 insertions(+), 12 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


