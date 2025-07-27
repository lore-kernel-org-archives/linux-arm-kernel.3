Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9A5C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 10:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ycw+FwEwMNFwepsTT4M/3aAYYVR3er1gB6c9vBitnyw=; b=ALo0AFOsw10DkdSkwpgt52uZ/x
	kSho73+3xPHAkv0bdh4x2cAHszCjv5kEM3j5inXINSOl97Gtz7bkMWzuzP+7wSlCfq7fqHP2Re0ci
	Y9boosWUumxEK0vPmU0TlDkNlz/R23m2njmwoa9NGv7vReHbTKllYHfoUgSs7dCnAj21BukFceR8o
	3/TnIY7vJCxeKYGKJvktsf60ZFXqpIlDueuIvyb2+vA0uHIZtEbXId1EpHMJymRpZ63L3WM6+Gh80
	8w3lT/PDAP/nE+8HxIi07bmCXqpz5zEszwo64yJPNTQbO/xNkEHfYfYNRHvZ0nKG3lPZ9NuwXs52X
	mCDKF5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufyle-0000000CcWM-1kUg;
	Sun, 27 Jul 2025 10:38:10 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufyDH-0000000CZlm-1oyV;
	Sun, 27 Jul 2025 10:02:43 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id fyD9uBnh5hOKjfyD9uuogC; Sun, 27 Jul 2025 12:02:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753610552;
	bh=ycw+FwEwMNFwepsTT4M/3aAYYVR3er1gB6c9vBitnyw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lg1guOokmw5lhfHrRRpWCP0dJeZtL6mXaidGHd/V/nZamffVp842m+eWMZoh95c3w
	 hs14scpjDjfaXy1sw5B1j61aojWkm0NpkQ1JpxWvYdZXBD+TklBedyxlXxHU8Y98Ll
	 uunPw5SyFo+uBKaLmgJZIlwPvZ2jwUC/MvENklEdw0kYleHw5PL7N3ZhJ2lsSMT+CG
	 EdYp5dJLOiBktvX1WextfW02JqoRp7vc4KHHJOS0H1jALq3gh5gmF+OZ7zzTIWfSIt
	 NY7Y6FRdpYU9y34t4VDOkfrQ253gM42AZvCLAGHO0mcpZy3BuwGEESx/OgHqgmOmLi
	 CbrpjNfY63IgA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 27 Jul 2025 12:02:32 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: rkvdec: Fix an error handling path in rkvdec_probe()
Date: Sun, 27 Jul 2025 12:02:21 +0200
Message-ID: <b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_030239_878919_C9378CBB 
X-CRM114-Status: GOOD (  11.65  )
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

If an error occurs after a successful iommu_paging_domain_alloc() call, it
should be undone by a corresponding iommu_domain_free() call, as already
done in the remove function.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc..eb0d41f85d89 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1169,15 +1169,17 @@ static int rkvdec_probe(struct platform_device *pdev)
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return -ENXIO;
+	if (irq <= 0) {
+		ret = -ENXIO;
+		goto err_free_domain;
+	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					rkvdec_irq_handler, IRQF_ONESHOT,
 					dev_name(&pdev->dev), rkvdec);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
-		return ret;
+		goto err_free_domain;
 	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
@@ -1193,6 +1195,9 @@ static int rkvdec_probe(struct platform_device *pdev)
 err_disable_runtime_pm:
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+err_free_domain:
+	if (rkvdec->empty_domain)
+		iommu_domain_free(rkvdec->empty_domain);
 	return ret;
 }
 
-- 
2.50.1


