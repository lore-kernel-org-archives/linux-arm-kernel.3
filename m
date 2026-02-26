Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E02FD8FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; b=yH2vhCbi/9DWrRBmSuJMZhakmz
	jdk7WL5bYQwO5AK32czKI7jyVFRQhfa/UboUHryWG3VQFMpZIMjx12hopP83dvdyfJvCey/pndDmK
	0mnFSZKxes1e3KQ4tAjP6RU38DXaHy1kkYFPui3uclslB6WfUW8afZT4mZOvpw2yeqoqH8xZH29cr
	YXdsD7j7PpWGbfBQiHftAmwx772ZSERPrg76WXHkhrNXObzgbAPx2Xhu2DJS8H2qA5ZyA6pN7n4g2
	Sr9N7zW+LGqOAfKGx22Aeg+kF/JsO4ejqcpjlZo8X8CchTgS0lIA+zj2buNflcJqWSG4c6KlzBs0h
	KM49xJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdW5-00000006Xev-2fVG;
	Thu, 26 Feb 2026 15:43:05 +0000
Received: from mx-relay10-hz2.antispameurope.com ([83.246.65.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdW3-00000006Xe7-1Oh5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:43:04 +0000
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120358;
 b=ZB4lHkgMBnLckBRWzS8v0X/zmrmN4MbaDwCQJVed+rUY1nbFVNDgtwxksO1lpt7KVbQmpm2f
 fTAnVCeA1tQrBaOmd1ttsURgoPwQ9vSWIOEdNSuYsxuRn4JZymkj8nYWPVpPWpUwRTKJ36tnLE6
 E5iQrzEe/kaBl26NFuxfhgvEywCCarq4XEIdF0W7xmIrRqKa2kBWDLGkhHQ1cnc7vPdcvya4IFi
 dVZhYgh4gj6fRMlLXR/C1vHcnYuAqYvHOaTxaeSy5RzuTuLH9dBegIeclyyXXzMZR8ACmFKe2bG
 SLTO870R8RbuWe1aejZcWqQp+d36BaC6ErHWBAVHzrqEQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120358;
 b=iTS6WLia7LvhxsIYZg6a3J9i5pjI0YUe4qX1RZRgZ1cIjL61m7LRZCAwb+peF0qywcJa4RJj
 tIpQj2G650g4nCR0z7pvk5uslQ5IBtA55TzYoEVf2zzK61cE2NOgLOEH5eBBSvxisaZuPwbwHuc
 T8P+pE9hB59CXJQHJjn85N3/SocupqmQkdVkAaa/haufHzA1qw15Po0vblozoy14ayUhxNzqmzA
 qdC6/NRq1ODLWXd9DTMywEV0qFFZ2jWc0n3twMeQ84xxlztU6UdggWmkPDLsN3tmSWV8vPM8paE
 Qz1PZshAF/HosWfBbDWKAVk+RJDD8qyUsf/j+Z0DYdh6Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 26 Feb 2026 16:39:18 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EFE42A407F2;
	Thu, 26 Feb 2026 16:39:00 +0100 (CET)
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
Subject: [PATCH v3 0/5] Support TQMa8QM
Date: Thu, 26 Feb 2026 16:38:49 +0100
Message-ID: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4fMFxL2sBsz4F898
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: e6eeaebf4cf021a93157c2a1ac4b54d4
X-cloud-security: scantime:1.938
DKIM-Signature: a=rsa-sha256;
 bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120358; v=1;
 b=PuROiXknrd2tZNsZxuoFjxbtXVJKmO5pLSN0q8sepwKE0E0/QpoWYFlawDCodRUQE2sBlI5O
 fvq8jIkKBBTDkRgLA+1XhfhdsdrD99mjbItvNIOsHyN+imiCP3dzDym3gbfCMC1cl8DXllwl9c8
 5yvkozT/sxYdticALDmcdbuFAK9soSvo9+Y0RN/jmbIRq8gcuEFx5cbY3s93Th8RPf6IU7gNjxn
 BlhXR/3Ly8sQjiCsFdEJPPamR0fToxR3oDHsVRn0yjkvGUIkice4I76qBBWGmpbudkgbV1KqCBL
 iI1u+Qb6yeM0Wfu61udyMjE2BwFfOLOAgccw/xgGIxUEQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_074303_518678_9E7D395F 
X-CRM114-Status: GOOD (  13.79  )
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

Changes in v3:
* Small cleanups in patch 1 & 4

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
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 867 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 325 +++++++
 6 files changed, 1207 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0


