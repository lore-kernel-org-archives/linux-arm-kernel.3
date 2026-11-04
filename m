Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A6606D811
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=byTTmJXL;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=q0YhZEKt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dx+ZTZohe60n7nAUUGj/dbTq2EwCer1csMhEs/N7uq8=; b=byTTmJXLcjHmvsD4mcbQJ0o77J
	JyeFP1Bwvc3C5MFM0s/N/ydDxzAbjFkqGbgReBDAdnN+TCAotMHjbn0aM72Os5d9fgODlz/jqeZBb
	mMtPQZBburq92ghFiGWewmi/+d2eu2P7m59Vqdq3EwueYTEPIAhEeZyxZhRZwfyUNaLc5USP0PvMg
	ac/oeSp0C1r2WBK3uGSNqPcJ6HLMxZTky7rkTpXg1gANWGhVG2X0ji6U9vBq0WS9bvqCRuBJFCHbK
	3yNHPk1V69CKpC1s5vTQ5Ay0bYZvtF1XNwsbmW2rJwBUHJ4xGIGregZ78ad+XRcTWKH2akS36wOGG
	DHEpCCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZMN-00000005Cej-1Ew5;
	Wed, 04 Nov 2026 11:40:56 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZMJ-00000005CZT-3C7E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:40:53 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793792436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dx+ZTZohe60n7nAUUGj/dbTq2EwCer1csMhEs/N7uq8=;
	b=q0YhZEKt/191YdKM/l+D7NiR0idUSqYPf52teu+ideQmCJ5v6VpbQFXfJE7WbmDhPVz1WZ
	g2j9eUbU11vYZWe7qWNIv4uzkKkK5X6NiJ1gH4Ht2m3FT6fnjTJYhxa5AkykfFVftCnB5J
	PT8j8aHkOdqtKmWhY8qa+yMMfRBf6MA=
Subject: [PATCH v2 0/3] PCI: apple: Integrate pwrctrl API
Date: Wed, 04 Nov 2026 12:40:28 +0100
Message-Id: <20261104-apple-pcie-pwren-v2-0-216a4066965f@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOywrCMBBFf6XM2kgStC2u/I/SRR4TOyJpSGq0l
 P67acWVmwsH7py5CySMhAku1QIRMyUafQF5qMAMyt+QkS0MksuaN7xmKoQHsmCoxCuiZ9xagdo
 6YU4GylmI6Oi9K7v+y+mp72imzbM1BkrTGOf9ZxZb76dv/vVZMM7OSrZCi1Y6lFcza4xl3JiOF
 jP067p+ANMssBrHAAAA
X-Change-ID: 20260706-apple-pcie-pwren-0dd1ebdf1c4c
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_034051_964389_34AA5AC4 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

This series integrates the PCI pwrctrl framework into the Apple PCIe
host driver to provide standardized power management for PCI ports.

This allows powering on the WiFi, SD card reader, and USB xHCI on
Apple Silicon Macs through the pwrctrl framework before probing the ports.

The first patch in this series exposes the necessary APIs to create,
destroy, and power on/off pwrctrl devices for individual ports.
The second patch integrates these APIs into the Apple PCIe driver on a
per-port basis. The third patch adds device tree changes for t600x as an
example.

Originally, a custom solution for powering on the WiFi and SD card
reader was proposed[1], but we can now use the pci-pwrctrl framework
for this purpose.

Link[1]: https://lore.kernel.org/lkml/20220502093832.32778-4-marcan@marcan.st/
---
Changes in v2:
- Split the pwrctrl API integration to work on a per-port basis for
  consistency with the rest of the driver
- Correctly use ERR_PTR to convert the error value before printing

To: Bartosz Golaszewski <brgl@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Marc Zyngier <maz@kernel.org>
To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org

---
Yureka Lilian (3):
      PCI/pwrctrl: Export per-device APIs
      PCI: apple: Integrate pwrctrl API
      arm64: dts: apple: t600x: Add PCIe pwren gpios

 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  4 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 16 ++++++++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 27 ++++++++++++++
 drivers/pci/controller/Kconfig                 |  1 +
 drivers/pci/controller/pcie-apple.c            | 23 ++++++++++++
 drivers/pci/pwrctrl/core.c                     | 51 +++++++++++++++++++++++---
 include/linux/pci-pwrctrl.h                    |  4 ++
 7 files changed, 121 insertions(+), 5 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260706-apple-pcie-pwren-0dd1ebdf1c4c

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


