Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD62C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENvtpS84tsD3Oq7Lh425eOrcE7hZaxXtiazbfpO4vpQ=; b=vcKqpKRkJ6RxZ3
	98ADTmxyqHEqwfIZe3v9vq/SM72p3VEjJrhe+lk7kKeuI3XhpNtMol4fHCplgOAfmrKmwj4r451wt
	Iy+/81/CxSV61MrW2BWDSEQPqeIp8Ynn1teSueuVh51u6EQ0KarVoIf5nEY88ql+MaLhSAe1IIEpa
	Uj3IWdx/r1E+2LvSw8cCjCouzap2qsbdR0SitZ7QrRl9axKI3RiV08VXo7JbvO1GtDNE6uGC9bjSn
	D2QRBvsgLOPd3NayCSqcvXz9ctBhkRkSZhyo7VD5zE8PDekUkgAT9MG0KQXYgnGMZuz+NakWPIM6x
	fHGMFkoX9u9MDowla1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7JF-0000000CcaN-3ROA;
	Wed, 15 Jan 2025 17:36:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Gl-0000000Cc24-2L9z;
	Wed, 15 Jan 2025 17:33:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D086A41E9A;
	Wed, 15 Jan 2025 17:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AE0C4CED1;
	Wed, 15 Jan 2025 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736962410;
	bh=7o8Q6dw5w7ZBaDF+qxgJBh5no1oSt0L9ljwV3ZpUqew=;
	h=From:Subject:Date:To:Cc:From;
	b=TiJvsP/SCavBl8s8KUcFxPUl/NySxta50CP3CEfdcThFqc4C4zc0TvhXwsxSds9Rk
	 +fdtQ8YuIPND0vnkRQhBBSe8vplH0FYNVPEtrFHP2J1q866FzxU/8EiFftTzoyUNEG
	 KthxmvubHta38gO6ALVt+dM0x3JTPAIx2/nFeizq6odj37TwFUriR0ZJWNKvlEC02B
	 0BDgDH503jaGXtiUafHjPXcBnPNFoGF3Ogc6brNei4l66M4myDsFbx4Z7auWpy3CBP
	 0L2HAxiTz7HJXH5yyHkMus9Q54OJkp3Zu+LHvn7Me/mhpGHtMVCrrbjdYBMCqzBZzB
	 5JG/T1s885sHg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] PCI: mediatek-gen3: Set PBUS_CSR regs for Airoha
 EN7581 SoC.
Date: Wed, 15 Jan 2025 18:32:29 +0100
Message-Id: <20250115-en7581-pcie-pbus-csr-v1-0-40d8fcb9360f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3xh2cC/x3MQQqAIBBA0avErBvQSMyuEi3MppqNiUMRSHdPW
 r7F/wWEMpPA2BTIdLPwGSt020A4fNwJea2GTnVGaW2QojWDxhSYMC2XYJCMzvV+McoN/Wqhpin
 Txs+/neb3/QBOmdYaZgAAAA==
X-Change-ID: 20250115-en7581-pcie-pbus-csr-994ab50984d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_093331_663370_BBA38A40 
X-CRM114-Status: UNSURE (   7.31  )
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

Configure PBus base address and address mask in order to allow the hw
detecting if a given address is on PCIE0, PCIE1 or PCIE2.
Introduce binding for PBUS_CSR node available on EN7581 SoC.

---
Lorenzo Bianconi (2):
      dt-bindings: arm: airoha: Add the pbus-csr node for EN7581 SoC
      PCI: mediatek-gen3: Configure PBUS_CSR registers for EN7581 SoC

 .../bindings/arm/airoha,en7581-pbus-csr.yaml       | 41 ++++++++++++++++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c        | 29 ++++++++++++++-
 2 files changed, 69 insertions(+), 1 deletion(-)
---
base-commit: d02e16e4e05d5d2530a4836ca92318c6a6b21b01
change-id: 20250115-en7581-pcie-pbus-csr-994ab50984d7

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


