Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=35CpdFffP/62zFF5JjwRjV4NgkfUPe4DE5l0yRpJh9w=; b=WoaZVe2M0tnVuJ
	CJDO+g0FqIgDMkDiRhwIru1YusMBaQUbXeHsYvxFN08wscV6lCrqV7UI30q0v+6jPT9LZ+shapspI
	GtE7POqvVKcZMx/R4WgIpLMXg+D7tSnqAm9Tx+BOq0VRPqdViv1dPdXSRvYxqF9ANG5MytkiNsVrr
	X3ftLZSJ3msbC3lf0FV/e7OJ6TA9PrCkxrKgs1pArZ2Zfxvn6fLakVB9pdjccz+DHxXYYkzh/aUf0
	hJU4PdW43RZ7N4HWPbxQn+GOdX3oJIf63GGXoXo5S9vyuRpU5DaHyEiYibLdeIVg/LuvZxrUkcIYp
	rTnQDyVaw81sqgQz8bGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrxd-0000000Djfa-44jI;
	Mon, 06 Jul 2026 22:38:45 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrxa-0000000Djdu-2YLz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:38:44 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783377517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=35CpdFffP/62zFF5JjwRjV4NgkfUPe4DE5l0yRpJh9w=;
	b=EFwSFZCzFdnTBKxiciPLYWB8xFR/ASGaIUHatC0RJr/dZ1rOgbrDi3YZJliwaYZxr0k8tM
	EiJetuC90ZV8OKDOHRczEbJZPILydlCdz1H+LvjAaQHa3SBtRIZi12rQklMUL+AIAVA5Y0
	pzHEXKpEGbzS4lnXgTuwoBHyAuHIjiU=
Subject: [PATCH 0/2] PCI: apple: Integrate pwrctrl API
Date: Tue, 07 Jul 2026 00:38:26 +0200
Message-Id: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGIuTGoC/yXMwQrDIBCE4VeRPUfQECzkVUoPcZ20W4IVbdpA8
 N1rk8vAd5h/p4IsKDSqnTI+UuQVG2yniB9TvENLaKbe9M5cjNNTSgt0YmnzzYjahGDhw2x5YGq
 3lDHLdiSvt9Nl9U/w+9+hWn/+ljMSdAAAAA==
X-Change-ID: 20260706-apple-pcie-pwren-0dd1ebdf1c4c
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_153842_879367_0062EAC8 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

Hi all,

this is my attempt at using the pci-pwrctrl framework to power on the
PCIe-connected WiFi and SD card reader on Apple Silicon Macs.
Back in 2022, Hector Martin proposed a custom solution for this[1].
Since then, the pci-pwrctrl framework has evolved and
pci-pwrctrl-generic seems to be the way to do this nowadays.
Device tree changes for t600x are included as an example for how this
could be used.

Link[1]: https://lore.kernel.org/lkml/20220502093832.32778-4-marcan@marcan.st/
Link[2]: https://lwn.net/Articles/1052333/

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (2):
      PCI: apple: Integrate pwrctrl API
      arm64: dts: apple: t600x: Add PCIe pwren gpios

 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 16 +++++++++++++++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 27 ++++++++++++++++++++++++++
 drivers/pci/controller/Kconfig                 |  1 +
 drivers/pci/controller/pcie-apple.c            | 16 +++++++++++++++
 5 files changed, 64 insertions(+)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260706-apple-pcie-pwren-0dd1ebdf1c4c

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


