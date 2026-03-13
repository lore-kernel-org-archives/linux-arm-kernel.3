Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F33C107BCD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkpaxYlsToPKG5PCwsUr7hGf9f4Il4PfIr73LI8TjoI=; b=wsQMAlcxFArKuSMLrokGw4lKXZ
	aRWyOS/LtStwHUMZO7nGM4zhMxQE32cAZ1bnQEuA07Ued8fq+KM3r3/Fy7C7ZNwtgMooof8T9bjsP
	ds3iIrrdSv/C1NqH4BcMAir+SxbE3Is3SmfKpWuh/C2cinlZrxLnpjsFeSk5RjaJJoFX9+ABUBFGU
	J1GCjx7FROrjxE7ztaj6AEN2nkAr4mimMJebv8CAsb8YSfATBh32jTLNfmH99UCwLg8Sfr4qkMEb9
	Cz8Bi0NeUgSDfShGvOddTqEFqAQ5yEMKp5fr/K5QPFl74AFQgtjk3aoNC1EpaPY3saQJNRhH6MqpL
	GT/8NMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oT-00000000hYO-0gxl;
	Fri, 13 Mar 2026 16:56:37 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oM-00000000hSu-3WET;
	Fri, 13 Mar 2026 16:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ok
	paxYlsToPKG5PCwsUr7hGf9f4Il4PfIr73LI8TjoI=; b=Lwvqmfx2r7vzhzKL86
	cNaSlDoz6WFzRjorwb3MWnR/mt1beOAiAe1yvOdjyQbUAoXCFPwcG97T8r6nHxIr
	km+dPDoNHlO2N4A6fGms7XRADi+LLPkt0PzUTN7qPd/OmEIM+UO0v4wO5pmHezmT
	lrPjPklTVnyLQdt/1eUXjifQM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX2JV7QbRpTApJAw--.54345S6;
	Sat, 14 Mar 2026 00:55:29 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	florian.fainelli@broadcom.com,
	jim2101024@gmail.com
Cc: robh@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v9 4/5] PCI: controller: Validate max-link-speed
Date: Sat, 14 Mar 2026 00:55:21 +0800
Message-Id: <20260313165522.123518-5-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAX2JV7QbRpTApJAw--.54345S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1rGryftF1rKryUGFyDKFg_yoW5Zr18pa
	9rA3WIyF1UJF45ur4Dt3Z8WF1Yq3ZxZrWDJ3s3W3W7uFnxGFZ8GFyj9FyftF97KFs7ur17
	X3W7tF47GanFyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pim9aLUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:ce47:698d:adec:5bb5]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAH3m2m0QYHKAAAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095631_257680_51AE43F7 
X-CRM114-Status: GOOD (  13.50  )
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

Add validation for the "max-link-speed" DT property in three more
drivers, using the pcie_get_link_speed() helper.

- brcmstb: If the value is missing or invalid, fall back to no
  limitation (pcie->gen = 0).  Fix the previous incorrect logic.
- mediatek-gen3: If the value is missing or invalid, use the maximum
  speed supported by the controller.
- rzg3s-host: If the value is missing or invalid, fall back to Gen2.

This ensures that all users of of_pci_get_max_link_speed() are ready
for the removal of the central range check.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-brcmstb.c       | 5 +++--
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
 drivers/pci/controller/pcie-rzg3s-host.c    | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 062f55690012..714bcab97b60 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1442,7 +1442,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	cls = FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
 	nlw = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
 	dev_info(dev, "link up, %s x%u %s\n",
-		 pci_speed_string(pcie_link_speed[cls]), nlw,
+		 pci_speed_string(pcie_get_link_speed(cls)), nlw,
 		 ssc_good ? "(SSC)" : "(!SSC)");
 
 	return 0;
@@ -2072,7 +2072,8 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(pcie->clk);
 
 	ret = of_pci_get_max_link_speed(np);
-	pcie->gen = (ret < 0) ? 0 : ret;
+	if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
+		pcie->gen = 0;
 
 	pcie->ssc = of_property_read_bool(np, "brcm,enable-ssc");
 
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..3b903ef7d3cf 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1150,7 +1150,7 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 		return err;
 
 	err = of_pci_get_max_link_speed(pcie->dev->of_node);
-	if (err) {
+	if (pcie_get_link_speed(err) != PCI_SPEED_UNKNOWN) {
 		/* Get the maximum speed supported by the controller */
 		max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
 
diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 2809112e6317..00a11f986117 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -966,7 +966,7 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
 	ls = readw_relaxed(host->pcie + pcie_cap + PCI_EXP_LNKSTA);
 	cs2 = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
 
-	switch (pcie_link_speed[host->max_link_speed]) {
+	switch (pcie_get_link_speed(host->max_link_speed)) {
 	case PCIE_SPEED_5_0GT:
 		max_supported_link_speeds = GENMASK(PCI_EXP_LNKSTA_CLS_5_0GB - 1, 0);
 		link_speed = PCI_EXP_LNKCTL2_TLS_5_0GT;
-- 
2.34.1


