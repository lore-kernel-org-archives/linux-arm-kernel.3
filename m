Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9310C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JeP86jDP3OwtZtXRx9m6eRsXxfB3H7LIVlvvv7r0Dpg=; b=E+JxvHHX9OMw6LoQ9PDxk8NNnO
	KWdVaUnxDa1YgJRYIq8QNpaD8MD9+XDOvbrizExyQQ8xYz4SIxI/2apGeV32jE96tfEJ/kAVODN9+
	esQ5/OUwrXNepK5xsWadyLVeciX0SspaHzZhfOf36FEqPu1S5EmbsIDtS3xoYFdHpjvhfpfqN7+D+
	d6Da9GNBKfZ+1F2NTIJRIHIgspzS9g/++wgjBAfKZDY5VBknqkYUJW+o8fkWsqopcI+jZw2EiOc9q
	QkP495cEbM3MmfvtvF5wffFh8TKnoxZitOHh9kHo6SGwwrHdUaW5Qq7yZFahppYA245lXd+03551I
	d41ik8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThtS-00000002zVd-3WIH;
	Mon, 23 Jun 2025 14:11:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrG-00000002aqF-35eC;
	Mon, 23 Jun 2025 12:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680065;
	bh=uyxGJ86xnKrIwF7mL8C2j+/YYGNG0EkD6tb5xhkwxoQ=;
	h=From:To:Cc:Subject:Date:From;
	b=DDknmJwhqFXhqysH7Akq9OflP9CRiXHFN6wZrgjG7h+RGO/ZMncB+dzJQi/+cLLCD
	 3mPyEl7anqpRGqnVJCy4Cu7yshGGt9btPE3lgZ/nBUzYxol6DseoFli5FxBEbQXE2K
	 mCduWnubROoSHnA3aebwNy/HCJIKBLrRP34fNN+uRXfuPBlRbhzifsH6onxqv4vvP2
	 UMb/EVBSmOyPPCzvXgTB+QP9ViJnbh2KvKhVxOk1MqUW6/4ZZw9xbjSDnCpapVHhiV
	 h6w87+pFekxKXWwnG9b/TD9C01ZvrgahEQsYFTET5Q6rkH8C7ir4LNYoPUqoxk+vQv
	 +4NB+L/BiD/WA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B4BD17E090E;
	Mon, 23 Jun 2025 14:01:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jianjun.wang@mediatek.com
Cc: ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] mediatek-gen3: Add support for MT8196/MT6991
Date: Mon, 23 Jun 2025 14:00:55 +0200
Message-ID: <20250623120058.109036-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050106_925317_BB849A0D 
X-CRM114-Status: UNSURE (   8.79  )
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

This series adds (at least partial) support for the MediaTek MT8196
Chromebook SoC and for the MT6991 Dimensity 9400 Smartphone SoC's
PCI-Express controller.

Some strange PEXTP settings were omitted, as the intention is to find
a way to set those bits *outside* of the PCI-Express driver itself as
the downstream implementation is using ugly syscons to make the PCIe
controller driver to change bits inside of a clock controller.

In the meanwhile, this is a set of clean changes that are required for
the controller inside those SoCs in *any* case; further development
will occur, with high hopes to find a solution outside of this driver.

AngeloGioacchino Del Regno (3):
  PCI: mediatek-gen3: Implement sys clock ready time setting
  dt-bindings: PCI: mediatek-gen3: Add support for MT6991/MT8196
  PCI: mediatek-gen3: Add support for MediaTek MT8196 SoC

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 35 +++++++++++++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c   | 24 +++++++++++++
 2 files changed, 59 insertions(+)

-- 
2.49.0


