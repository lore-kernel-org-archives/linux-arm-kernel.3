Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8CEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tdmIHdsbzb8umbERSlAF5QUn1kxQ5VRQnjnz4IKcAf4=; b=UOTfhGVxa6HwLL
	vsdixlNHSr0762hULzIaaHYBYlEBkSgl0zF3sL2rj4hRMaCibeqRB5aqhLM/SLDOmm9Es/wDxq00N
	cKqlE7n7ABH8KufV7m+32I9uyfJpGh1s2kdYWMh+xaUa1owQctaj7OeW0Rt4jTp4dJ/9MHD+3lRAM
	lbUvfTyR4Xj9QRNIO6l0ro5rRBRWclQ7m+l9Gzn/ioY9JsxFaSs8M34pU2cjTMQIo9FcBbYucnEiW
	iRGjsWttPOqfpSItak7abt7vJM2LQNRT5CvMAev8+mpbPWcDYrd6h48ybUrzJoRg3sjCLSZDuxdqm
	XYauWV4jUChD/bDEoaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tln12-00000007qME-2ihI;
	Sat, 22 Feb 2025 10:45:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmzZ-00000007qBg-451v;
	Sat, 22 Feb 2025 10:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 310F86113C;
	Sat, 22 Feb 2025 10:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6982FC4CED1;
	Sat, 22 Feb 2025 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740221054;
	bh=1EgGu4K6OScm1oy60Hd1e93/YxaKGFVdoWrvXutqVW0=;
	h=From:Subject:Date:To:Cc:From;
	b=Tut8NhPHV5YQ2j2Cev3+E18p21LBX32h8+hopks7Bc4vtsyFbNqRH4xkbQMBMCJDO
	 OYeTrgmvjXNISssHiWIxn3wS9rVvd/CTcKgMmiFzDcygh3lltunhat8ucN4l3FD2F/
	 NDPFknDY/44+wpxk86KxMULtCFu4nGgDYCP361CpWpGTrtSyW4wBbP04fDM+VNqDk8
	 he1Xu61wRtYpWDS07ojJIXiMYhqHa83hBRDwRG8cSO+9/jnODJGOsM0jIsu5zQFILG
	 AQmAuEuyA8ULMNzAEWBZkPsZwtd9+g9kT3E9GF8PuvYzH7arvfN+dXYlvqZAlUjYJH
	 zHCia7a6oIm4A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v3 0/2] PCI: mediatek-gen3: Set PBUS_CSR regs for Airoha
 EN7581 SoC.
Date: Sat, 22 Feb 2025 11:43:43 +0100
Message-Id: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+quWcC/22NQQ6CMBBFr0Jm7ZhSrIIr72FYwDDARNOSqRIN4
 e5WEncu30/+ewtEVuEI52wB5VmiBJ+g2GVAY+MHRukSgzXWGWtyZH9yZY4TCePUPiNSVOwrOvR
 lSezaAtJ1Uu7ltWmvdeJR4iPoe6vM9rv+hPa/cLZo8Og6alOTqqa63Fg93/dBB6jXdf0A6iDIO
 LkAAAA=
X-Change-ID: 20250201-en7581-pcie-pbus-csr-f9c4f88ce5b3
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
X-Mailer: b4 0.14.2
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

Configure PBus base address and base address mask to allow the hw
to detect if a given address is accessible on the PCIe controller.
Introduce mediatek,pbus-csr phandle array property.

Changes in v3:
- Get base address and base address mask from range property
- Define mediatek,pbus-csr as phandle array
- Link to v2: https://lore.kernel.org/r/20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org

Changes in v2:
- Introduce mediatek,pbus-csr phandle property
- Drop patch 1/2 in v1
- Do not hard-code compatible sting in the driver and use phandle
  instead

---
Lorenzo Bianconi (2):
      dt-bindings: PCI: mediatek-gen3: Add mediatek,pbus-csr phandle array property
      PCI: mediatek-gen3: Configure PBUS_CSR registers for EN7581 SoC

 .../bindings/pci/mediatek-pcie-gen3.yaml           | 17 +++++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c        | 34 +++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)
---
base-commit: b6d7bb0d3bd74b491e2e6fd59c4d5110d06fd63b
change-id: 20250201-en7581-pcie-pbus-csr-f9c4f88ce5b3

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


