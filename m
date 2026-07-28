Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965B0C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mlk8JJ7FnZcQE8p0F+cUnb6w0Q/i8g6DjL1yyVN33cA=; b=eGmbdyMVkf0dBu09mg4q17FJUI
	bpCD7OXJ++7U3sKoSPVk23GpOolQv2BeTPsVL784P/A+qnSKhR4hfHeTkZrN4d+UQmh90jnW6cyCt
	zFvSUt/Cl6oMWq/uX462BvYWjxZvUOUFLMuWiCtBE4hWaPr7IxV1LGQ4uRa6sgN7nQ1WEvm1q90Qc
	GPi0+uAAJyXpCll+3P9c+DxE8DBh2FQwkI09HuHZOogbDbnbUmejmTVFkRQkf0ufVEIRNf20GKZsZ
	yg/uDgIIjhe15wXxck6Wcz7M4bZpgqoi1XPwsfDCReAMl9aIKOT3SB/9v52LpStx0J7HJ9GgiaGD9
	ibRU0lOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh18-00000005Fuu-067y;
	Tue, 28 Jul 2026 12:34:42 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh14-00000005Fsj-1EGJ;
	Tue, 28 Jul 2026 12:34:39 +0000
Received: from LAPTOP-99KJFSET (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47e10a915;
	Tue, 28 Jul 2026 20:34:29 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: toke@toke.dk,
	afaerber@suse.de,
	manivannan.sadhasivam@linaro.org
Cc: Hongyan Xu <getshell@seu.edu.cn>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: [PATCH] wifi: ath9k: stop using owl context after completion
Date: Tue, 28 Jul 2026 20:33:42 +0800
Message-ID: <20260728123423.781-8-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fa8b82b5203a1kunm4c64fbaeeecfc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGUkdVkgaGRpKQh4YGUNOTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=jIzPNX0d6vYqddve/BIhGHXOgDi5p/DvXpxrDoJWtQ1KhQPMmyEIXs+VMkzqy9mqsWzAYo68vZUC59WTQiHH+0BZQIVujn1neisnjG1aTENWabywT19MkcPupNViVRuwuqc/tYTb/wNWK3DiqdlfqEqTLUwTjHXlR/WSajiwzqc=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=Mlk8JJ7FnZcQE8p0F+cUnb6w0Q/i8g6DjL1yyVN33cA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053438_515594_A937A222 
X-CRM114-Status: UNSURE (   9.57  )
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

owl_remove() waits for eeprom_load, but both owl_fw_cb() and
owl_nvmem_work() completed it before their last uses of ctx. The
devm-allocated context can therefore be freed while the async path still
dereferences it.

Take a pci_dev reference and copy ctx-owned pointers while ctx is still
protected. Complete only after ctx is no longer needed.
Keep the completion before owl_rescan(). Rescan can remove the device
synchronously.

This issue was found by a static analysis tool.

Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 .../wireless/ath/ath9k/ath9k_pci_owl_loader.c | 31 ++++++++++++-------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
index fe1013a3a..1aefe21d2 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
+++ b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
@@ -125,16 +125,19 @@ static void owl_rescan(struct pci_dev *pdev)
 static void owl_fw_cb(const struct firmware *fw, void *context)
 {
 	struct owl_ctx *ctx = context;
-
-	complete(&ctx->eeprom_load);
+	struct pci_dev *pdev = pci_dev_get(ctx->pdev);
 
 	if (fw) {
-		ath9k_pci_fixup(ctx->pdev, (const u16 *)fw->data, fw->size);
-		owl_rescan(ctx->pdev);
+		ath9k_pci_fixup(pdev, (const u16 *)fw->data, fw->size);
+		release_firmware(fw);
+		complete(&ctx->eeprom_load);
+		owl_rescan(pdev);
 	} else {
-		dev_err(&ctx->pdev->dev, "no eeprom data received.\n");
+		dev_err(&pdev->dev, "no eeprom data received.\n");
+		complete(&ctx->eeprom_load);
 	}
-	release_firmware(fw);
+
+	pci_dev_put(pdev);
 }
 
 static const char *owl_get_eeprom_name(struct pci_dev *pdev)
@@ -158,19 +161,23 @@ static const char *owl_get_eeprom_name(struct pci_dev *pdev)
 static void owl_nvmem_work(struct work_struct *work)
 {
 	struct owl_ctx *ctx = container_of(work, struct owl_ctx, work);
+	struct pci_dev *pdev = pci_dev_get(ctx->pdev);
+	struct nvmem_cell *cell = ctx->cell;
 	void *buf;
 	size_t len;
 
-	complete(&ctx->eeprom_load);
-
-	buf = nvmem_cell_read(ctx->cell, &len);
+	buf = nvmem_cell_read(cell, &len);
 	if (!IS_ERR(buf)) {
-		ath9k_pci_fixup(ctx->pdev, buf, len);
+		ath9k_pci_fixup(pdev, buf, len);
 		kfree(buf);
-		owl_rescan(ctx->pdev);
+		complete(&ctx->eeprom_load);
+		owl_rescan(pdev);
 	} else {
-		dev_err(&ctx->pdev->dev, "no nvmem data received.\n");
+		dev_err(&pdev->dev, "no nvmem data received.\n");
+		complete(&ctx->eeprom_load);
 	}
+
+	pci_dev_put(pdev);
 }
 
 static int owl_nvmem_probe(struct owl_ctx *ctx)
-- 
2.50.1.windows.1

