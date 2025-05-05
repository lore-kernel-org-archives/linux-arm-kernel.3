Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3F4C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iGmTc0Dr0hkL932PUVb+1EjpmPVgkyuWFOR3J/G0BE=; b=a20KtSSKHSeHSyvnNk7TR7vwyH
	/WJCfCgpRKRUVccEN3e6R6e6k5yaY5u3dza8NPtTOu9vffblwddrHjs33WyB6TGtOCDIB5LPQEFzW
	+v2FXEuMDkgRfza70YlXAm6i2IfW4XYkmN5XJeNWC2zqGRi+X6vBfZa9OBZX/vCROWYvzY2l4WaEr
	Miop53XXCjXMNJvCL08b7fKUpN7k0O0fqR3/92OyKFc8Og/QiztiayS+wsPji8KmA7O0rnZPJxneq
	Qlf2S/r8GonKuFM+l+lY1cGfgr/WSQQNybxl3arrDNisZPQwiq2hmQLOkvCzx8i5IcVYMXSORuhyg
	AMxWAx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8Y2-00000009sum-2y7b;
	Tue, 06 May 2025 03:00:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4oF-00000008vrp-1dKc;
	Mon, 05 May 2025 23:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7E2D629CE;
	Mon,  5 May 2025 23:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F85C4CEEF;
	Mon,  5 May 2025 23:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486074;
	bh=8Nhg1ffeN3yPY9Tc4uln2i2CXIJkjjf8aWFSD20mPIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WmSqBLW2BfqOUuGsjf2JSiTho+CcjRKDcydzJgf0oaa6K4GGIxfTFPx6Pcc19WzWH
	 Zv6430xeWeFfVgX+o6WJROteM56KTaEu9szCBHJcNfrDxHHufzzfCFBsRMSxiFZ6hw
	 0plJ0rRp4V9WjQdqQxhJwEbQF0g1Nl9LRxBvdkmq3Pa+tWjJIKLWTVFv+g4MjkZ3FH
	 m0TZsfajKdTH1d+u5W9wJn5eczN/igimJJfgo8+c+77kolNgR183iHITIVEmb4gwwu
	 yAad78+L/9bX7BFSLTHYN00iladRQto0mRJ+5iSHzpZkJ5D3ZZF5tFI7JKuKx6qyEo
	 LHOrmKivVm6kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stanimir Varbanov <svarbanov@suse.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jim2101024@gmail.com,
	nsaenz@kernel.org,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 141/294] PCI: brcmstb: Add a softdep to MIP MSI-X driver
Date: Mon,  5 May 2025 18:54:01 -0400
Message-Id: <20250505225634.2688578-141-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
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

From: Stanimir Varbanov <svarbanov@suse.de>

[ Upstream commit 2294059118c550464dd8906286324d90c33b152b ]

Then the brcmstb PCIe driver and MIP MSI-X interrupt controller
drivers are built as modules there could be a race in probing.

To avoid this, add a softdep to MIP driver to guarantee that
MIP driver will be load first.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Ivan T. Ivanov <iivanov@suse.de>
Link: https://lore.kernel.org/r/20250224083559.47645-5-svarbanov@suse.de
[kwilczynski: commit log]
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/pcie-brcmstb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8b88e30db7447..9bcf4c68058eb 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1632,3 +1632,4 @@ module_platform_driver(brcm_pcie_driver);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Broadcom STB PCIe RC driver");
 MODULE_AUTHOR("Broadcom");
+MODULE_SOFTDEP("pre: irq_bcm2712_mip");
-- 
2.39.5


