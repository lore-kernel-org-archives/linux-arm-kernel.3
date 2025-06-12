Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C892C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7uOp99Xhix4DCbgkelosQ0oqGiKLPJYCNWVfcTBT5mo=; b=NeSuHOmVa2KyU1
	dsAEM3to4geSbNeQS44KpJWeLmVauzbbzuf28stFrai7wHqIzoWJrCKZhczKjUFWAYizPWMn+cqBi
	R5C5m7A9rcAvp775EDrXFl6HVPL1VLZ5imJdBIDbGMl8+rsALdw6tJ9vdB+Zl5qi+AuyiksC6Jfff
	5W91CQLZ76Nyx9A2BDN/6Ko2cPp3z9NHhmBT5r84iUkeEsqtglFCEAFv0u5hfuWS4tYHK0uP1M1Gd
	o8fh/BP4Cikd7eIPyusPdlr4pvQbUYUrR0mQoUiOVZznlcUPl114IUa5a4xwkKsntnIJj20Mm/ZR8
	/2jFTHmRQai4eSL1UP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpL-0000000DMFP-0GOE;
	Thu, 12 Jun 2025 13:18:43 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPesQ-0000000Cvhc-45Wh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 10:09:44 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 12 Jun
 2025 18:09:33 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Jun 2025 18:09:33 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Nishanth Menon <nm@ti.com>,
	<nfraprado@collabora.com>, Taniya Das <quic_tdas@quicinc.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@google.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<soc@lists.linux.dev>, Mo Elbadry <elbadrym@google.com>, Rom Lemarchand
	<romlem@google.com>, William Kennington <wak@google.com>, Yuxiao Zhang
	<yuxiaozhang@google.com>, <wthai@nvidia.com>, <leohu@nvidia.com>,
	<dkodihalli@nvidia.com>, <spuranik@nvidia.com>
Subject: [PATCH v0 0/5] Add initial AST2700 SoC support
Date: Thu, 12 Jun 2025 18:09:28 +0800
Message-ID: <20250612100933.3007673-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_030943_010177_63811C16 
X-CRM114-Status: GOOD (  11.43  )
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

This patch series introduces initial support for the Aspeed AST2700 SoC
and the AST2700 Evaluation Board (EVB) to the Linux kernel. The AST2700
is the 7th generation Baseboard Management Controller (BMC) SoC from Aspeed,
featuring improved performance, enhanced security, and expanded I/O
capabilities compared to previous generations.

The patchset includes the following changes:
- Device tree bindings for AST2700 boards.
- Addition of the AST2700 platform to the Kconfig menu.
- Basic device tree for the AST2700 SoC.
- Device tree for the AST2700-EVB.
- Updated defconfig to enable essential options for AST2700.

Ryan Chen (5):
  dt-bindings: arm: aspeed: Add AST2700 board compatible
  arm64: Kconfig: Add Aspeed SoC family (ast2700) platform option
  arm64: dts: aspeed: Add initial AST2700 SoC device tree
  arm64: dts: aspeed: Add AST2700 EVB device tree
  arm64: configs: Update defconfig for AST2700 platform support

 .../bindings/arm/aspeed/aspeed.yaml           |   5 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/aspeed/Makefile           |   4 +
 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi     | 380 ++++++++++++++++++
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts    |  54 +++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 451 insertions(+)
 create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts

-- 
2.34.1


