Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8551CCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 06:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V9XPtOkvY2xGoEM32FGfKxcwuTkJk/35iPrfDKXNDEk=; b=Y9euby5ajwQdPM91/K44AWERaQ
	+aoRnSgIiGklqCE3/Pl+mKA8l2TT6Cwdp8tVpvS5GxFYtLoq9zgwhcygyaIU48WV5LMVeHKgJ2huk
	gkyNErcBAz7GFnEOI01FDJr6mH7F1OB1f+K7PxDXvYkkXcQdUcob7idByZptCc7E9E/62S7AQC182
	iInp35e/A1+a0BdQgY7+owUvTeCRqbULZSpqV12lzuB2R+rra985gBmuCadGel9VZ3NEywet+V0zk
	RnGiz0NHs8FeP9FSRsdhABKSGRiy0ncXprDpywFPRJ8a5n4fOgeyDXZMrb0/QKEhihLkg9u6+33VE
	hDvCvPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhFA-00000006jLK-2tXR;
	Mon, 19 Oct 2026 06:53:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhF8-00000006jKh-1uCU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 06:53:11 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1375716f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 23:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792392788; x=1792997588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9XPtOkvY2xGoEM32FGfKxcwuTkJk/35iPrfDKXNDEk=;
        b=TF3xLt5wJ97CpwXeOzRqUi3Mi3JBxfKWbhgbsNdKCODIzsCUkP+J4o7lS6AX4TNmal
         A562iNu6rqSX5hxCwuCMs/4QDD2ASijVzmMB+DJYpdQix+ByyZgAwq67clhybTaAFSvB
         3JSRyxt4wh/IkbYIK+K4n7n3X8EvVkUwRIYsLut1//DSO9K+fhH0QtsEps4ISBlrrJqC
         Luau/4WrI+RFIyPnL/Z3+Dnm2CZyNPA3aipnoRNm+Ry1OcBYWsd0Diih87aT+z5m5yR7
         p9QWVxBHQ6wDWjhWv8kVRoQj+JlFvUYA2opE2WDLT5AmOe65HT8brNu2cIU/aNAUm3WZ
         tKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392788; x=1792997588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9XPtOkvY2xGoEM32FGfKxcwuTkJk/35iPrfDKXNDEk=;
        b=H83zf9ckfbkj9/zEDC4QlbKXV+It4dwhfGZ5UPZOt/27DaOSBC0XC+I30q4RNvq8Xd
         2pFhwbAycgT2etnKUqF9MeMLVAOlRrh2Y/Ki6JdGeGU8oL/D1IyZh49OYuXSR8o3Xf6p
         2vo+595FPnvB4O12offPIGuW98drGzz9/R5IGSDbCEBhMl9FE4M7Uz7D/Lb7OOKq0MBa
         eJoImCfVaWnwaipZai6EfXRpO30DZWAuGRnLEQUlbjfGGmWWZxf/TV1dSpootYsR4db/
         RNLzxGITtUAGRQT7eZh4LTm05jQ1A0yqcbSekfpJH2pq9/RZiO319jGHxzKGDiJnOw67
         qSMg==
X-Forwarded-Encrypted: i=1; AKwUvBwXIaaBvqz1VEnm/Je4XX31nv/X7wT+7WC9FwZqacmXL2zOoIA248ik5o8Kvt5ZC2VUQTmjwdoWGKcDAxlMAPqO@lists.infradead.org
X-Gm-Message-State: AFq9FYL6AiuetPGNpzhhMJCL3tkfzV3Oai/zX59p2mWHMokm63EOt1ot
	uqkHHxRsBrOApxUswnMxFRLJeUZal3VQVWa+TW/A/1hmWQ9fR8EhwIsN
X-Gm-Gg: AYBFou2FoM/moQhxR2qE2B+mQC6xE4A2QndQ6QBKEr+vvVavrL0BlmHnwrRA8mifDdQ
	tpWRhulADl9UitYsrATcER1HS/EWXAb+ejgzMP7c9p5iEsk411axtWM4xuYvTTYd04PACxaaGf7
	yiuzjGqwI2UPUJi2fnhomX+zUE5QoQMoFzgmOe5NEc37FlivHEEhhpYbr+r0zqfFmn7H0YwlrqW
	223NcecYMwoc4Iyg8n3DCDxVCWDQNObpYb9fzGmOkTgd7yUp7YalLohKnoHt6yzqGgAbWFb8CcA
	TV6VjXewN0NfTYwbhFZNAR8jI0QKH26NSTsINuUVXi2oK3p95o5Pwmy3CbRSRb44xfY7Kl3bwYy
	1qL7pmxdiVHbAW/t+0MFVD9bsQiV6qKdWLx0aMag6W5bT2YPISJdKlz4N9FpHmcQ3Ne2JUbXlAd
	BisYcAeUHruuPrsJNpds+tHS0IomSBG3cBDU8W9GzXGGGBEYr5Uf+1nNCRf7VOveP7qe5HtX+Hq
	eB5xX2/oFlQLAN+PO6t9VXr/38l1OTZr6UkqYR5JYtAQkFoCJYRo8wfEf1T
X-Received: by 2002:a05:6000:29d2:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48e07975c0emr7979526f8f.7.1792392788079;
        Sun, 18 Oct 2026 23:53:08 -0700 (PDT)
Received: from SVR.localdomain ([158.173.154.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm18545783f8f.37.2026.10.18.23.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:53:07 -0700 (PDT)
From: Semih Baskan <strst.gs@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Semih Baskan <strst.gs@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] PCI: iproc: Skip BCMA-attached controllers in the platform bus driver
Date: Mon, 19 Oct 2026 06:52:49 +0000
Message-ID: <20261019065249.552-1-strst.gs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_235310_541803_AFC67603 
X-CRM114-Status: GOOD (  19.04  )
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

Since commit 767012397976 ("ARM: dts: BCM5301X: Describe PCIe
controllers fully"), the Northstar PCIe nodes under the "brcm,bus-axi"
node have compatible = "brcm,iproc-pcie". bcma_bus_register() creates
platform devices for the children of that node before it registers its
own cores, so pcie-iproc-platform probes these controllers before
pcie-iproc-bcma does, as IPROC_PCIE_PAXB.

IPROC_PCIE_PAXB sets has_apb_err_disable, so the first config read on
bus 1 reads APB_ERR_EN at offset 0xf40. The report in the Closes: link
shows that read taking an external abort. On a BCM47081 (PCIe core
revision 0x01) with a device behind the root port, the board does not
boot, and it boots when has_apb_err_disable is cleared.

Return -ENODEV for a controller whose parent is "brcm,bus-axi", before
the driver allocates or maps anything, so that the controller is left
to pcie-iproc-bcma. The devicetree stays as it is. The check does not
depend on CONFIG_PCIE_IPROC_BCMA, because a kernel with only
pcie-iproc-platform does not boot on the BCM47081 either. On a BCM47094
(core revision 0x07) pcie-iproc-platform enumerates the devices on its
own, so there a kernel without CONFIG_PCIE_IPROC_BCMA loses PCIe, as
before v7.1. CONFIG_PCIE_IPROC_BCMA defaults to y on ARCH_BCM_5301X.

Tested on an ASUS RT-N18U (BCM47081) on a 6.18 kernel with the
controller/iproc-bcma changes backported. With both drivers enabled,
pcie-iproc-bcma binds controller 0, the BCM4360 behind it enumerates
and the platform driver logs nothing. With only pcie-iproc-platform
enabled, the board boots without PCIe. Without this change, neither
configuration boots on this board.

Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Closes: https://lore.kernel.org/r/0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com
Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Semih Baskan <strst.gs@gmail.com>
---
This is on controller/iproc-bcma in pci.git and needs 9850907ee1dd
("PCI: iproc: Use the EROM outbound window on BCMA"). Without that
commit, pcie-iproc-bcma fails with -EBUSY on v7.1 and later, so this
change alone would leave Northstar without PCIe. If this goes to
stable, 39d1c645bb99 and 9850907ee1dd have to go with it.

Mani's sketch [1] returned -EINVAL; this returns -ENODEV, which the
driver core does not log as a probe failure.

[1] https://lore.kernel.org/r/179197555828.38040.6359970121400952902.b4-reply@b4

 drivers/pci/controller/pcie-iproc-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
index 4c9a0c4bb923..63560c733a8f 100644
--- a/drivers/pci/controller/pcie-iproc-platform.c
+++ b/drivers/pci/controller/pcie-iproc-platform.c
@@ -45,6 +45,9 @@ static int iproc_pltfm_pcie_probe(struct platform_device *pdev)
 	struct pci_host_bridge *bridge;
 	int ret;
 
+	if (of_device_is_compatible(np->parent, "brcm,bus-axi"))
+		return -ENODEV;
+
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;

base-commit: 9850907ee1dd4376c09c4129e0adbe3b39d191b7
-- 
2.43.0


