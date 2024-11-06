Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6851D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=44Jj4Axf6VhdEIAU0ENXCGhb1JV9u+U+0Mxi10i0Jj4=; b=d2Zkr/+E6gwYOOm8Tyrx8TEomz
	lqOWO4L7A5NRo296Vpy5M8uzT/p1tUj1PeF1pJWnFg3Fy/crJtDKKf3HWGZD0adrPyfeyjliaFQop
	u18Es9MGB5+ZFroK5WVuIKl+RqVLnNUghm4IVS4TXWLFI/9/KU08VALLCSxtD9Qu3fUPV/yJFxo7k
	1zNW8KomAPVw721qVf7lc3ZLOU2ui1IgEuqH7RMwEBdktqnaalLPaCmEfd+yWjLWUFwtAkvd+FDQz
	binGSX0/cspBj0JT72C9h7Yu+N1lydaG9nze5bZ9gkS/ACEaD4Nu/hmXQFx22DtfjYFxSLIx/jq7y
	cYy/meKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8evP-000000038TZ-0DHQ;
	Wed, 06 Nov 2024 12:14:15 +0000
Received: from mail-40140.protonmail.ch ([185.70.40.140])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dzZ-00000002t9m-1QEB;
	Wed, 06 Nov 2024 11:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730891666; x=1731150866;
	bh=44Jj4Axf6VhdEIAU0ENXCGhb1JV9u+U+0Mxi10i0Jj4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=w11ufpAuhZXSVRhO+3yN3KUxWb3+xqn+03qFy60Uh2a4PZ3L2c5gnRhKpCuIOTshI
	 5qUnWNb8MrKU+4DJx/N4Of6Lz+b7RFD/5fFZBFzT7/xvC1wAOfAu2xyilaaeuSMvhn
	 GDvCNJha3KWg0z12meCJ4lm8BNjeR3IZEu3cleJy5Ns0nef33P1tqE+Bw0QVS1Ieoi
	 KnZZNJzcEMTwnrNZyavS3N4skMCnAcwWTA9CUnbqwkv8UmPUTkeYSjQqfyDBaEsXXh
	 oGXDbc4hXpB1hCrgfEkNjyVIqio5cGhOCzqjmY6n253Qw4LC6i2X32RRJA2YF4EyU/
	 oOAP4gbxEwyGg==
Date: Wed, 06 Nov 2024 11:14:21 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Shih <sam.shih@mediatek.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Daniel Golle <daniel@makrotopia.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] MediaTek MT6735 syscon clock/reset controller support
Message-ID: <20241106111402.200940-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 0dd6bd5ca0773cfa6c0df23af5f595a7210c9feb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_031429_559915_911B80EE 
X-CRM114-Status: GOOD (  10.73  )
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

These patches are part of a larger effort to support the MT6735 SoC family
in mainline Linux. More patches can found here[1].

This series adds support for clocks and resets of the following blocks:
- IMGSYS (Camera)
- MFGCFG (GPU)
- VDECSYS (Video decoder)
- VENCSYS (Video encoder, also has JPEG codec clocks)

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v1:
- Simplify Kconfig dependencies.
- Remove some extra newlines.

Yassine Oudjana (2):
  dt-bindings: clock: mediatek: Add bindings for MT6735 syscon clock and
    reset controllers
  clk: mediatek: Add drivers for MT6735 syscon clock and reset
    controllers

 .../bindings/clock/mediatek,syscon.yaml       |  4 +
 MAINTAINERS                                   | 10 +++
 drivers/clk/mediatek/Kconfig                  | 28 +++++++
 drivers/clk/mediatek/Makefile                 |  4 +
 drivers/clk/mediatek/clk-mt6735-imgsys.c      | 57 +++++++++++++
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c      | 61 ++++++++++++++
 drivers/clk/mediatek/clk-mt6735-vdecsys.c     | 79 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt6735-vencsys.c     | 53 +++++++++++++
 .../clock/mediatek,mt6735-imgsys.h            | 15 ++++
 .../clock/mediatek,mt6735-mfgcfg.h            |  8 ++
 .../clock/mediatek,mt6735-vdecsys.h           |  9 +++
 .../clock/mediatek,mt6735-vencsys.h           | 11 +++
 .../reset/mediatek,mt6735-mfgcfg.h            |  9 +++
 .../reset/mediatek,mt6735-vdecsys.h           |  9 +++
 14 files changed, 357 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6735-imgsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-mfgcfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-vdecsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-vencsys.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-imgsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vencsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-vdecsys.h

--=20
2.47.0



