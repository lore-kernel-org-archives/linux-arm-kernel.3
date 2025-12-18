Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D211D6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; b=wxJu+CLsQtSzZcxyqZ4wr38/fc
	G3sZQfz2nKu/bbVKR+d4MxuVkCHR/sj8d4PT+sTNoF3qcMW01SOh7ZSsYtsPHVhHjyp17Xjl+488l
	fK4+iND3Qq7PNPPuRBHUrSmVeDiPBvP/k2o+sa/GUs6tz5/z9aHFZaHOwI1lPQhoHEDGgPMuO4UWy
	Q/dQuxBYS+DmpjIhLP4QlpxemMc1vHlF9kWYshPMOJzrH0Qh+uEPPbG3AfszGOdzbBIUvLJN9TWj5
	7HA14CktfbO1Dv30o5cI3GRn+t0btCRONrgO0kPqB2pj+MavjVNcfeEEMX4z6f1zxX2VSz2GQpQfV
	YDtCQjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFpW-00000008gON-1RMv;
	Thu, 18 Dec 2025 15:22:14 +0000
Received: from mx-relay10-hz2.antispameurope.com ([83.246.65.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFpT-00000008gMU-3930
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:22:13 +0000
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071294;
 b=XO+g0XnAP5xgCLTe9Mg5TNz4QYAdtOvC+ZW17LmqFM0HRLT8ejr2ueBL3akXV3RHS3ven1tk
 dJg8Nh+53SE+8b9eqiLuzcSq/SitKuVTDFTqI+wQOwlCA8/zEvYM47NCoXZtH9b4X+E7y+tfXwf
 5hHy+C88CAp/WNzpHoxbRI1V44iDFVNTVvG7d1HADbX6aLwv1ug0xd4PUX9wLASl15nvUSC1mLM
 eT3PHgNrCgR60r0q5RcW3RFWKe45gkT42/Wl9W2pnFU2OMNXhwZRi7GydVgmwc/HNm9MIzAQHCL
 mr4YxQ3g3P0WkdXAy7isgSie9Kv733hJqpiYsG6FUHInw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071294;
 b=YSgc8feUme/g2++LOb/pAnU5fcNKxi2tNfo19ALI8hcoJPpbKlsGNiMOTE3dmD3d1HLUfGpc
 zn4MQgqHwk8DetS9CmtXx/Li+GQA0HjGUidVmGd21uR+Bosw716jX4ujxjxrD8P7RZWOgyW6Lrl
 AcWVSkpNouVCHyUG9JqESzpgy0EXskqpQhqpKgtrU9HKKImVjnLeENmnxbPPNdo7+taElEfSwtK
 Q0T+6Mnsh9buy9IJB5u2frnQY0oDbCxnjnaq3JQ3e3CNmdaLrzfqtLp9Yc0JceG5obUOJ4aRQDT
 G8bSqxYSGCoT8t+ddNkglUOklF1GI/iC7QWdd/K7BBBLw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 18 Dec 2025 16:21:34 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 16D9ACC0D31;
	Thu, 18 Dec 2025 16:21:04 +0100 (CET)
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
Subject: [PATCH 0/6] Support TQMa8QM
Date: Thu, 18 Dec 2025 16:20:47 +0100
Message-ID: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4dXDrx4SHSz4F929
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 836eb70413c5acce62e457440dd9da8d
X-cloud-security: scantime:4.420
DKIM-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071293; v=1;
 b=AuK7X6FLs/E9Y233uVpShgLrju/5wcSHqO3wFFl5PjKqt34wsVeUbrWVbzO+ia+ZRuu8gUHr
 Iken2KKE085IqqFmxNKemUp4/AbpmdyWliJyuOSSBvx3whvrkEkHzg2Yt5csKy5VTu+ePfy4GNB
 8dqLQi0bDPHtgKfcX6KxpWmJqMY6jRf4OMSzpwl9pJP9qR0xu/MPrgN5LgAmQvQ/ziEXGq/8Uvj
 VCPet3+gJoI0T3lF0UA40nN9QrLRJehu6x8lMWi3UU8UuSKlrUkt2HJPkZFwYZOpbW5mMVptl/J
 /xAm8bMj3rfeVFHMVkTe8LacfrAhU3v9dYkTd3i+GAtUg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_072211_935579_80760212 
X-CRM114-Status: GOOD (  13.86  )
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

this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
property on the parent clock.

2. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

3. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

4 & 5. Device bindings and platform DT

6. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (6):
  dt-bindings: clk: rs9: add clock-output-names property
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: Add TQ imx8qm based board
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../bindings/clock/renesas,9series.yaml       |  37 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |  11 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 869 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 322 +++++++
 7 files changed, 1253 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0


