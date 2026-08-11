Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F01C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 02:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MoWxrfO3Q6icLGaAofp8s2umiohjGshMkph3r7NwxhU=; b=Fm889BDRqHS/1MfPbY7xrKzvnh
	IGa0Kd5nIHfNv4tu7ZAHeJT2fLWoQxfFtsAXlx6EAcOCvZLabgZyFf+YziNRDEZSeI3x9uOUDFi9z
	F6mUvcDGyW3FKotLARuie3X3DHjzuqYUzum0pm1OlSuAtxjt7SFbNZDpzxyFmfiFKvF3fXsmf3Qkg
	XkWqoPZH+XQWkmbHK899iKTHRLVYtuiFpSw5iEDt/1KN82InQ8tEKqdcsbwkSzTCHgX7sko30UThE
	0jS+30cWIvFP1AXMonUZ6SEBM7t0mqn8c5AE8HTkmO80JTdFjS1JS3hNg7OHx8G9bTs7fI8PWALyB
	fHt9NIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcdd-0000000DByY-3zGc;
	Tue, 11 Aug 2026 02:54:49 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcdZ-0000000DBsL-2iqX;
	Tue, 11 Aug 2026 02:54:48 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wBHIX7SjnpqOeiCAA--.156S3;
	Tue, 11 Aug 2026 10:54:10 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app2 (Coremail) with SMTP id zC_KCgB3CtHSjnpqsZ7DAw--.40592S2;
	Tue, 11 Aug 2026 10:54:10 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] PCI: rockchip-ep: disable link training work on remove
Date: Tue, 11 Aug 2026 02:53:15 +0000
Message-Id: <20260811025315.136998-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zC_KCgB3CtHSjnpqsZ7DAw--.40592S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?MEjT9gXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncGSG+szpQCInt5Y8rbJUI0qI+tQE2w8INGKFcJ8d4DzpU4NXfzY/1BP2O6TETYvPXes
	MwOqRdL0lUKjDUkPxayp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW7AF4fXw48tF1DXF48CryDurX_yoW8ZF4Upa
	4DXry3ArykWF42vwnxA3ZxZayYq3Zavay7Wwn7G3WfZ3WavF1UG34jgFnrArZxJrW8ZF17
	Crs8tayUuF43WFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU818BUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_195445_858434_412AC62C 
X-CRM114-Status: GOOD (  11.32  )
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

The endpoint driver has no .remove callback, so on unbind the
link_training work can keep running after the devm-allocated ep is freed,
causing a use-after-free.  Add a .remove() callback that disables the
worker.

This issue was found by an in-house static analysis tool.

Fixes: bd6e61df4b2e ("PCI: rockchip-ep: Improve link training")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/pci/controller/pcie-rockchip-ep.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 7994613..fbc2470 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -860,6 +860,7 @@ static int rockchip_pcie_ep_probe(struct platform_device *pdev)
 	}
 
 	ep->epc = epc;
+	platform_set_drvdata(pdev, ep);
 	epc_set_drvdata(epc, ep);
 
 	err = rockchip_pcie_ep_get_resources(rockchip, ep);
@@ -899,12 +900,32 @@ err_exit_ob_mem:
 	return err;
 }
 
+static void rockchip_pcie_ep_remove(struct platform_device *pdev)
+{
+	struct rockchip_pcie_ep *ep = platform_get_drvdata(pdev);
+	struct rockchip_pcie *rockchip = &ep->rockchip;
+
+	if (rockchip->perst_gpio) {
+		ep->perst_asserted = true;
+		disable_irq(ep->perst_irq);
+	}
+
+	/* Disable, not cancel like .stop(): a racing .start() cannot re-arm it. */
+	disable_delayed_work_sync(&ep->link_training);
+
+	rockchip_pcie_write(rockchip,
+			    PCIE_CLIENT_CONF_DISABLE |
+			    PCIE_CLIENT_LINK_TRAIN_DISABLE,
+			    PCIE_CLIENT_CONFIG);
+}
+
 static struct platform_driver rockchip_pcie_ep_driver = {
 	.driver = {
 		.name = "rockchip-pcie-ep",
 		.of_match_table = rockchip_pcie_ep_of_match,
 	},
 	.probe = rockchip_pcie_ep_probe,
+	.remove = rockchip_pcie_ep_remove,
 };
 
 builtin_platform_driver(rockchip_pcie_ep_driver);
-- 
2.34.1


