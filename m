Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CD6E9E303
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 12:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9a8119aWt/faL8kIM3FP7wFXRRc93I8ASt1myHt9FTc=; b=HgoVuLsVejDuR7yCY0KO/sfzLI
	ttrh//ibu9FtLxUyCZ/d5tW6xlYEG140h+RXZuje6I++Lo1e6qyr/ChFR3Su8OzUGmaVPzZPdwA6+
	jtFTLUyeRRtdkedXbG+6QLwpTwEU7m7IELEVlyDjFzg/Czf2NM3zal91pnZjg5OSe+1wLFIi2UaMj
	kz6nufvdJ3SDm4OGiLLtLDkr8NSWZBNefaZe8rNGETooFe/sKRBtzRNv1jfVNPSMEPUPxd8Y+OfJ3
	lZ85IVGD0qg/q0ifQ5eQpiwvpRRQJlBE89+6HFvH+DrTL2eGBcoJVg7q5wf+GFywcGYy0u8olPQo2
	ywiHhlew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9RX-00000000d1b-2Idz;
	Wed, 11 Feb 2026 12:35:43 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9RR-00000000cz4-3jfw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 12:35:41 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9a8119aWt/faL8kIM3FP7wFXRRc93I8ASt1myHt9FTc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813304;
 b=qCR2XIzmMka8Uv8tP95sgqIaPlOMRfMnRDMyfF0AtQdfysQaxalYsXSmGhTSXejqQUFVHDhd
 Mi4s0JVWLVHXmkmGtArQh1yXKYaKdZ152IJwfTEvEc1KJwUt0vdEuPB6eDFtYuk0bi8UgN5JjcZ
 jFfeDfapkOgspJ4xSD6mCmZeDG3OI8KK5kBJbruDdSRgIi6cWZRaD0yvNxv78hnwLXHJvWkjEUC
 PQ+/jYIYO7eQ3nRek9hrVkLOISRgxWIF0Jyxn1zlKkiZITtvcgUrb19UMK9WGrQ0dlsEMNBhYb6
 9tmhk9W/h2JBkpGS37kzpXY9rKhjA7u9rDSx+kphddbPA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813304;
 b=kUpSCkXS3wbD/IYAZEMJbaa0wALZRszZKuAtVYAESpZ6S1f0Gek1kNdwooopS+MdEvHhvvFi
 Y85yTpIEc6LVZpQ4B1MDZ/4VbjMXy/F3HlCrdGMay6oTo5wfrlTl68CANUtRRPNd5sCSSYNAn9G
 P0xVR9RiJT0mwxzXOdShu+bLnoMNm6tQe5IDDzni8hT3Bj5kzvkVYJ9u4iZwQzSbalVXFcxwroE
 gBJApINiD1rnQHs+K7uvLX3WKwj44krXoSYPLpaGEJ/vB7Eqy9ywfSNiQDiFIYueIbyT8BXhoUc
 QUO1KFs/P5KtSdwutu1YWTTL493agi+MlJ5oBkFOYZWWQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 11 Feb 2026 13:35:04 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C2BD85A03D9;
	Wed, 11 Feb 2026 13:34:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 0/5] Support TQMa8QM
Date: Wed, 11 Feb 2026 13:34:27 +0100
Message-ID: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4f9yYb0fGlz4MQWf
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 8727f709344811bd075061d5eca82f5b
X-cloud-security: scantime:2.347
DKIM-Signature: a=rsa-sha256;
 bh=9a8119aWt/faL8kIM3FP7wFXRRc93I8ASt1myHt9FTc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813304; v=1;
 b=B46m6HDWLUveqKRk/kT3W/6W+CBgUUaDB1ouyIGErMn8VQp4Ii6+0k6pWjJCoMuAUikVpQnZ
 YZGRrmZzRyz9b0hFDR8REp7ztHpNmrCoLHUFv4ooAA9o5LTn16VMGOM1NecepP4KoZhEc/dhx9F
 PZZVzm61Ou3X5P2ko7dJ5G5EhyZZpbQDN038snhqV7JOl6VuJ1c1JdGNN/6+X9UONuRGKHe5X7U
 6SxSgAZCpBLojJRntcHQ9wGy1z9d9AYz5KFNRRFi00XJmteryIH4hYKzGAeUog16Qb1hMVa562i
 e7TQBioNQ76awpe/ekdhhWCTN/AlkO2BFvktxMnb9g6SA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_043539_235925_71B0D59D 
X-CRM114-Status: GOOD (  14.19  )
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

this series adds support for TQ's TQMa8QM. The first 2 patches are prepatory:
1. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

2. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

3 & 4. Device bindings and platform DT

5. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Changes in v2:
The need for clock-output-names properties for renesas,9fgv0441 has
been removed by reworkging the PCIe clocking

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (5):
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: freescale: add initial device tree for TQMa8x
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 869 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 325 +++++++
 6 files changed, 1209 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0


