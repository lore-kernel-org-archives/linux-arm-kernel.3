Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4430CC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjmjfrdSpqXV6oG/2uBZm39p2ERMdlU4gCR4bDOpw+k=; b=eTmCj2O9UrVZBEUvlTlB1BIpQa
	X34TK4rI2idDC55bacpMMIWSQXgEwFbXtmD8n+VBz0ifghZerb4t46C6MQ4C+g/AJEVwkk3Wk9n7u
	XdoXFcu4buv3NG5yifyjUdskyoKbyONtwdtR8Tl90pCeExONaziSejzItXWUles3ENV17Uq18XVZN
	EprJLvjQlc+K4lZdgDFNcH52nh5qvA/6/EUPYkyKMj9ECMDs48BczxrEzGj3FF4rEVnOpkzQlDh5g
	UAFAfJcD6nN/57ZwjAPlLlLtRAppa2PcPWIkUR9NsPAtjq5m8cTct7jdK63K8DqtmuppAu3GaGbKh
	jXCeyRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56UT-0000000APKS-1MZf;
	Wed, 16 Apr 2025 17:24:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55t0-0000000AJK9-0Hpc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:45:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0F2A6A4A411;
	Wed, 16 Apr 2025 16:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB1FC4CEE4;
	Wed, 16 Apr 2025 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821917;
	bh=NZjOGkOVi+7Jb5XsEcxcNcG9G1OBjaxyKDLMX1iDNwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBOpy31DTEtqpmXaAlAh8RgRHpANHVxKHFZIWjkeLoHLMZLHaxr0nPEGAx2hJcYr9
	 v/W7PP4/MzIWHEnPuCuHMzuWSZupktvfTqlaqzyVID/C3+3pnvMovCKIn1QCffwxeI
	 QgKIc+GQCGnm5qymBDf57Wk4CWoK/S3R2o6FyMZ61pn+E4bIDKA5D70KG+OmCsgn4P
	 9RKfzb1ykAQUuTOS6JZXjU+D7QMcDTmGUv/RRa7ns3pURy3uvSZ2y4gIcghq9kViLn
	 eyqHdOkNNrtRlIDK1uwSvNaIpiRTYJVVfz/w9m+7u3N8l58xzP6TW8PnZ9RrROG4Qv
	 d9ORT1a60H/wQ==
From: Philipp Stanner <phasta@kernel.org>
To: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Daniele Venzano <venza@brownhat.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Philipp Stanner <phasta@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH 8/8] net: thunder_bgx: Don't disable PCI device manually
Date: Wed, 16 Apr 2025 18:44:08 +0200
Message-ID: <20250416164407.127261-10-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416164407.127261-2-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094518_245231_AC906D7B 
X-CRM114-Status: GOOD (  13.07  )
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

thunder_bgx's PCI device is enabled with pcim_enable_device(), a managed
devres function which ensures that the device gets enabled on driver
detach automatically.

Remove the calls to pci_disable_device().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index c9369bdd04e0..3b7ad744b2dd 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1608,7 +1608,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	err = pcim_request_all_regions(pdev, DRV_NAME);
 	if (err) {
 		dev_err(dev, "PCI request regions failed 0x%x\n", err);
-		goto err_disable_device;
+		goto err_zero_drv_data;
 	}
 
 	/* MAP configuration registers */
@@ -1616,7 +1616,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!bgx->reg_base) {
 		dev_err(dev, "BGX: Cannot map CSR memory space, aborting\n");
 		err = -ENOMEM;
-		goto err_disable_device;
+		goto err_zero_drv_data;
 	}
 
 	set_max_bgx_per_node(pdev);
@@ -1688,8 +1688,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_enable:
 	bgx_vnic[bgx->bgx_id] = NULL;
 	pci_free_irq(pdev, GMPX_GMI_TX_INT, bgx);
-err_disable_device:
-	pci_disable_device(pdev);
+err_zero_drv_data:
 	pci_set_drvdata(pdev, NULL);
 	return err;
 }
@@ -1708,7 +1707,6 @@ static void bgx_remove(struct pci_dev *pdev)
 	pci_free_irq(pdev, GMPX_GMI_TX_INT, bgx);
 
 	bgx_vnic[bgx->bgx_id] = NULL;
-	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 }
 
-- 
2.48.1


