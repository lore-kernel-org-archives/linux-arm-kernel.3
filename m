Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1400C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V/cWI6jCuZn3fcy5zPp0Q323xNqJa1S74loek1ZBh4w=; b=kzATLK7taZhPlTtgSi+eIuvKeH
	omu+5S6FULCnBSqo/wltKV03VNB32Lg0NkwXi580uUgf64vyVWIkGA3ZSba18nXvMHpZwtQAFbSsc
	pAn352Se5kUnifG9qkyieHUq76lPFvCLmdFQMCqoG6yALAEup5XiWGVXcpqr7SAnuQzGUe2LNS6cq
	K+L6GTdB9KHt0zT3QVf7LUxnHI/rjmJeL2Wn8XxM5BFeWwL7eEWNcQFrHrQqdsOqyAe5+YD9jQi6S
	+Gt8dAssdVf1Y4N4zgzF8UXQ20kzbKGjJXDDOwYEWuecenhCLCcJCCmmWxCD8hOullWVCN88tn5MF
	lECZkJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWmy-00000005nXA-3zLn;
	Tue, 04 Mar 2025 18:14:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUWb-00000005HyD-3TYN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741103381; x=1772639381;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V/cWI6jCuZn3fcy5zPp0Q323xNqJa1S74loek1ZBh4w=;
  b=lJlsAKulVw3c44CB5bpgfwLWVYZdo/93SxEjU5gN4Zyp5UXutQynh2YV
   AoFgNgS0N8G1RFNqAvkzqoNmOOO8w7f5/Pn9HUNFeATVDkE/Wwj5zIV0G
   nHkFc59FvRRKwVv9ie9FVrkW06oFhOKB6ME/bD0LzPO5Qq7stMdIuXD/2
   QfJtETk6R8a3Gwo+2jtWxLENUt6UXugcIMpTJhldLWkTLQitQ5udVr15o
   ETPeZ1XZvYq5aQPjA6Dt1aTsQFGWCwSdfydYGGATTMJLBllzVBDz6+K0w
   NHBPbmt06se+GpFopse6naqEABiPOiPoLAAzYXk7NcxKuqUafilqviw43
   Q==;
X-CSE-ConnectionGUID: 5RRrExnVSsyHBiZxymnz2g==
X-CSE-MsgGUID: W9sN2wF4TCe9QgLpWzcDKQ==
X-IronPort-AV: E=Sophos;i="6.14,220,1736809200"; 
   d="scan'208";a="42272726"
X-URL-LookUp-ScanningError: 1
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Mar 2025 16:49:39 +0100
X-CheckPoint: {67C72113-5-2417938-F0170C2B}
X-MAIL-CPID: 1B5DD4582515C3582BD7AD615B33C118_2
X-Control-Analysis: str=0001.0A006369.67C72116.0066,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3DFC16156A;
	Tue,  4 Mar 2025 16:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741103374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V/cWI6jCuZn3fcy5zPp0Q323xNqJa1S74loek1ZBh4w=;
	b=PJ+RHd0k47M0p3Gvk5Gol0p05nmuw6+Wfy0Nb1JicPvJJ/gO0toelssg9xise111CADyl7
	k9XiBKVmJUl8TFfjhQS90zCTMEdVC43H++eqnMUJEnca8KIzLieiJzO2rqdWaTnWM0gZhn
	kIgCkD+cTdqOV5VUqNELxJd7KpUBhbIRymV2BaR1mwwBQFOjP06NQAtuYUFoomLYTYw9f2
	gPkwMdefX3QnbzpT7hTcQgVa5AvH4DsRkW3nzpFF3bR9UMaxrUl5GZpRfF+CKDSGYfk4XK
	qx2B3/aCSatZ0vafCGj8FNiGbpf14hMuks/v5cnwwooOrtYAMoJu1UDbXkvhyw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 0/6] TQMa93xx on MBa93xxLA/CA LVDS support
Date: Tue,  4 Mar 2025 16:49:19 +0100
Message-ID: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074942_361076_45A7330B 
X-CRM114-Status: GOOD (  12.86  )
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

this is v3 for the LVDS support on TQMa93xx module series.

It consists of three parts:
1. New PLL configuration for 477.4 MHz
2. LVDS support for imx93
3. LVDS platform support for tqma9352-mba93xxla & tqma9352-mba93xxca

Patch 1 adds a video PLL configuration for 477.4MHz
Patch 2 is the imx93 equivalent of commit 1cb0c87d27dc ("dt-bindings:
  soc: imx8mp-media-blk-ctrl: Add LDB subnode into schema and example")
Patch 3 is the imx93 equivalent of commit 9cb6d1b39a8f ("soc: imx:
  imx8m-blk-ctrl: Scan subnodes and bind drivers to them")
Patch 4 is the imx93 equivalent of commit 94e6197dadc9 ("arm64: dts:
  imx8mp: Add LCDIF2 & LDB nodes")
Patch 5 adds LVDS DT overlay for tqma9352-mba93xxla platform
Patch 6 adds LVDS DT overlay for tqma9352-mba93xxca platform

Changes in v3:
* Collected Peng's R-b
* Fixed subject prefix in patch 3/6
* Fix 'ranges' property both in bindings example and .dtsi

Changes in v2:
* Rebased to next-20250221
* Reordered patches
* Added 'ranges' to bindings
* Use subnode constraint styles as suggested by Rob Herring
* Use IMX93_CLK_SYS_PLL_PFD0 as parent for IMX93_CLK_MEDIA_AXI
* Use 333MHz for IMX93_CLK_MEDIA_AXI
* Do not set board compatible in orverlays
* Add MBa93xxCA platform as well

I skipped the support for dynamic PLL configuration for now. This is a
separate task, see [2].

Best regards,
Alexander

v2:
* https://lore.kernel.org/all/20250224142831.485159-1-alexander.stein@ew.tq-group.com/
v1:
* https://lore.kernel.org/all/20231020130019.665853-1-alexander.stein@ew.tq-group.com/

Alexander Stein (6):
  clk: imx: clk-fracn-gppll: Add 477.4MHz config for video pll
  dt-bindings: soc: imx93-media-blk-ctrl: Add LDB subnode into schema
    and example
  pmdomain: imx93-blk-ctrl: Scan subnodes and bind drivers to them
  arm64: dts: imx93: Add LCDIF & LDB nodes
  arm64: dts: tqma9352-mba93xxla: Add LVDS overlay
  arm64: dts: tqma9352-mba93xxca: Add LVDS overlay

 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 51 ++++++++++++
 arch/arm64/boot/dts/freescale/Makefile        |  5 ++
 ...3-tqma9352-mba93xxca-lvds-tm070jvhg33.dtso | 40 ++++++++++
 .../freescale/imx93-tqma9352-mba93xxca.dts    | 27 +++++++
 ...3-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso | 40 ++++++++++
 .../freescale/imx93-tqma9352-mba93xxla.dts    | 27 +++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi      | 77 +++++++++++++++++++
 drivers/clk/imx/clk-fracn-gppll.c             |  1 +
 drivers/pmdomain/imx/imx93-blk-ctrl.c         |  7 ++
 9 files changed, 275 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso

-- 
2.43.0


