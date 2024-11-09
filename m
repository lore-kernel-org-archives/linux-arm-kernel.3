Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8EFD5E361
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E7Dg8IoNbihmEIAJNAgH2thhepdp2Hj5A4p2E3cJ0r8=; b=tig8qdvUi49FqV
	2Eq94dHlxNd201L0k0aBQyHimwpbeYdxvHn5C/sUuWiYJFni12NoIE2x6RUZoNZnQTGDuJsPdg/Jm
	HKiNMehrkUmaaJai5Xy5QAE9xQqpapTFPnrkzrYRiKY0bxYuo2uX1a08zeWphfPnyAfw2SzHj1ZRK
	P/B2NrlO1sHjIAaBzaogJGUTWZ4BDFsHed9KMdJ5TWOSsmzLRmYjBSAZ0/l/MzKlNZiOdWM2xyzZ7
	IuPMafT9QacKVSlV282hb1Ex45JblBlLzKbNHSNJTPyXDTJtjQlIFcE7t3xg1/lBjrTBiRfFSMEl8
	k10QgJB4NYr4uVXfVDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hoF-0000000CzBp-3V6E;
	Sat, 09 Nov 2024 09:31:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hmT-0000000Cyv6-1GYT;
	Sat, 09 Nov 2024 09:29:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 819AFA400D4;
	Sat,  9 Nov 2024 09:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF91C4CECE;
	Sat,  9 Nov 2024 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731144559;
	bh=dDj9mrjWKbOOETt8VRpVNkCmAIG4TU3oYP0/ohENJWs=;
	h=From:Subject:Date:To:Cc:From;
	b=DQLPw9EKEfEtQmtv+k/c+ds8BRCFi29dZxoKL2WohYN1LEcsjY4dhh1LQJosaJhhQ
	 KxuTaaHAbktGJrDokEv8HS3DY+3tScMkptNXkrNQgIwP7MmZOSmUtza0t/l2TToOoe
	 IOTn7rHBaN7J3JsPzl59wV0eL0duon5JoHbPzTx6lZhUzfLzX2XAy+4SOpRLOf3MjM
	 5IQgTaz1UJsqninxOi+stL+IjJRXG/8DWGH1CT20eEPZ6m+6hijVgeKRJkiwo+R3Ii
	 oYEpybXeo+B7UdTihddN8IoUYmWE2ZK87qQ+kh5cGx/gpj3QifiGET6NNF5NTvfL2x
	 b5xitrXCBAGMQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 0/4] PCI: mediatek-gen3: mtk_pcie_en7581_power_up() code
 refactoring
Date: Sat, 09 Nov 2024 10:28:36 +0100
Message-Id: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQrL2cC/32NQQrCMBBFr1Jm7UgyMaa68h7SRUkn7aAkJZGil
 N7d2AO4fP/z/l+hcBYucG1WyLxIkRQr0KEBP/VxZJShMpCik9bK4eyFkaOzrcYgby5Il7NVNgx
 krIHqzZn3omr3rvIk5ZXyZ79Y9C/9t7ZoVNgH5VtHhox3twfnyM9jyiN027Z9AekVyfazAAAA
X-Change-ID: 20241107-pcie-en7581-fixes-296505fd2353
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_012921_441794_65AFAA5C 
X-CRM114-Status: UNSURE (   5.70  )
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

Minor fixes and code refactoring in mtk_pcie_en7581_power_up() routine

---
Changes in v2:
- added trivial patch 4/4
- improved commit logs and comments
- introduced PCIE_MTK_RESET_TIME_US macro
- Link to v1: https://lore.kernel.org/r/20241107-pcie-en7581-fixes-v1-0-af0c872323c7@kernel.org

---
Lorenzo Bianconi (4):
      PCI: mediatek-gen3: Add missing reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: rely on clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: Move reset/assert callbacks in .power_up()
      PCI: mediatek-gen3: Add comment about initialization order in mtk_pcie_en7581_power_up()

 drivers/pci/controller/pcie-mediatek-gen3.c | 50 ++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 19 deletions(-)
---
base-commit: 3102ce10f3111e4c3b8fb233dc93f29e220adaf7
change-id: 20241107-pcie-en7581-fixes-296505fd2353

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


