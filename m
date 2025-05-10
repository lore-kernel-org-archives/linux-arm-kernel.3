Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380A4C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DEu0ugbaD/EBsgXHrzA+saK2ZnHcC31tU43n92kMs3Q=; b=KRxj8w2XbbI6JYq3tmeTddB5/O
	DKlBz5iB2mTQna1kfYBjIShwFsL+aGAQxMFfZ/jEO+39/cvYzzJcXtnfbx8CU5JQSyms1NsaNFERK
	DdkyM60YL5AEFkAj3fWjlaBY7O24ujh+Z5XrU92nIVygDQy6o3Jzs/h+pJAJ5+4dSBMTb0Kqc5dcH
	Uw4sdPMdN4oEGx6OOaUfRli7fMs7OAxcrqfhJIeZKxDY346YnubunBKtRTWc5hE27igOi+Z2dfBlz
	S1AgNpVXcZArf8RCQQ/685dxiQupvlWw8eRhoQUVFRhtOe1ciROQIrJp4jw7w7NoTMgO1pkQy0+QZ
	BRDPpBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmgg-000000068h5-3FgQ;
	Sat, 10 May 2025 16:04:30 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmZP-0000000681s-0rDi;
	Sat, 10 May 2025 15:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DE
	u0ugbaD/EBsgXHrzA+saK2ZnHcC31tU43n92kMs3Q=; b=X2PmB14lcNS9bPpiGB
	3NxGhEVTtE7UpB/dr22ViWJ840f8diVGc0uL0PU0EzKcJdSy3O1+x+ej4XuCeQDh
	uFVzrWgi4RRBb+pDwTD9UAEPLkrKPeoPl3pN3ce3qimhaCI4m1bKX4IFkneu9N+X
	liB8/omO2GJu96M9LrKtKTQUs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXjxsYdx9ormDlAQ--.43845S2;
	Sat, 10 May 2025 23:56:09 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	manivannan.sadhasivam@linaro.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 0/2] Configure root port MPS during host probing
Date: Sat, 10 May 2025 23:56:05 +0800
Message-Id: <20250510155607.390687-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXjxsYdx9ormDlAQ--.43845S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4Dtw1fAFW7ur4rGry8Xwb_yoWDKwc_uF
	WrCayDWw47AFyvyF1rKF4Syryjva97uryUW3WvqayakasxZr13Xana9FW2g3WrWFWSkFsx
	Cr9xZrWfAr12vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRdb1nUUUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhhJo2gfbZ-YWwAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_085659_624613_11A5D61D 
X-CRM114-Status: UNSURE (   6.15  )
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

1. PCI: Configure root port MPS during host probing
2. PCI: dwc: Remove redundant MPS configuration

---
Changes for v4:
- The patch [v4 1/2] add a comment to explain why it was done this way.
- The patch [v4 2/2] have not been modified.
- Drop patch [v3 3/3]. The Maintainer of the pci-aardvark.c file suggests
  that this patch cannot be submitted. In addition, Mani also suggests
  dropping this patch until this series of issues is resolved.

Changes for v3:
- The new split is patch 2/3 and 3/3.
- Modify the patch 1/3 according to Niklas' suggestion.

Changes for v2:
- According to the Maintainer's suggestion, limit the setting of MPS
  changes to platforms with controller drivers.
- Delete the MPS code set by the SOC manufacturer.
---

Hans Zhang (2):
  PCI: Configure root port MPS during host probing
  PCI: dwc: Remove redundant MPS configuration

 drivers/pci/controller/dwc/pci-meson.c | 17 ------
 drivers/pci/probe.c                    | 72 +++++++++++++++-----------
 2 files changed, 41 insertions(+), 48 deletions(-)


base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
-- 
2.25.1


