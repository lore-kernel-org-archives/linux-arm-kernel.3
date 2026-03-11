Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B9C112583A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kkt3A1e6l/KLgh24uOCTImlNQ3maInjpGSRh0bHez1U=; b=lLAOBAjdybVzb8v4d66BezcDFZ
	hNFTG8xOMqzcWvnV+QqaIxkPTqnIOXh/SgHXIJvksDOQGFKvHFHvcAAculNNzy8MLfLOvzxtlu8Sq
	p48iUnTr8YtkwzNImaqOSOBryPyTHSAS9OkSU6DnSWjwtYVRHfvuVh3xrU67eO6Blw7uX/D6I/ft9
	4u+ULSi/vNdoGzz+7yltdjSTltV3nDre4gwlgwz+eHYbgvgHSrN4KkfaEo9vJe93i0n0VER2K1AV8
	3Oozs43VbtURUj0jdZiPKVawwz3rFyiEjGnLQ6y5sSOmrb/FKRHT1QKgJbLn60Baz9/dJJHgFZBRT
	nGbnrvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KcF-0000000Bi7J-2m2f;
	Wed, 11 Mar 2026 14:32:51 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KcC-0000000Bi5x-3qFq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Kkt3A1e6l/KLgh24uOCTImlNQ3maInjpGSRh0bHez1U=; b=OCbYZYhZQZHRhApD9dltpqMqGE
	exnAuIcBSkHoBUv8XAPktsZGgy+TznUd2rbhWKCmRQyAfyzF1GSV9gTahWyfEPFgDSl07LG/lSxgf
	HuR2ZKlys9vb/3zv0T2FgDun2nTOWbllECxBs83qQNnQoyEHqQULl3r4Uf+gck3NzmtCZclWL1Wjt
	OKimXou+JaXkpAvx46qICQKiJvtmU8JE29+b9r2vEvxOrrSO/51/quZtmVimgEIQdQ/0U1uRaE91u
	FmZNY6I9cl68khuX2aXXDb9hWmwjZ0rj3cXv3CYvJ0RBQnCFucXRTg5BbZlWvPE6PsG9INRChP8ho
	Qka1h+xA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Kc5-000Or3-1z;
	Wed, 11 Mar 2026 15:32:41 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Kc4-000GoI-39;
	Wed, 11 Mar 2026 15:32:41 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/6] TQMa91/TQMa93: display support on MBa91xxCA
Date: Wed, 11 Mar 2026 15:32:03 +0100
Message-ID: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_073249_084362_67FF5324 
X-CRM114-Status: GOOD (  10.46  )
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

this series adds support for parallel and LVDS displays on MBa91xxCA, both for
TQMa91 and TQMa93. The parallel display is attached directly, while the LVDS
uses an LVDS-Encoder. To actually work it needs the pdfc driver from [1].

The first two patches add required (Video) PLL configurations to achieve the
necessary pixel clocks for both displays.
The last 4 patches add the overlays for TQMa91 and TQMa93, although the
overlays for TQMa91 use the same overlay for TQMa93.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de/

Alexander Stein (6):
  clk: imx: fracn-gppll: Add 333.333333 MHz support
  clk: imx: fracn-gppll: Add 477.4MHz support
  arm64: dts: imx93-tqma9352-mba91xxca: Add parallel display overlay
  arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
  arm64: dts: imx91-tqma9131-mba91xxca: Add parallel display overlay
  arm64: dts: imx91-tqma9131-mba91xxca: Add LVDS display overlay

 arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
 ...3-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso | 56 ++++++++++++++++
 ...93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso | 66 +++++++++++++++++++
 drivers/clk/imx/clk-fracn-gppll.c             |  2 +
 4 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso

-- 
2.43.0


