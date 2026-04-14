Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58580ED7B87
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYuNhr3OzQTUS+jz5yMKk4NFkF+4wx8tO9sN7qPAzcw=; b=d9+yFTjM4fd7AxXPWrXwNrvxzf
	aGyLvohvR6K/ACkEtffiA1fZA1HrO+Azyb2Q+zfw8mPPwRSbD+nWI/0Faz23/ASMd0SXNqJjmIK0S
	MQKIQ0wRMx7EQyWFbHEef2Iw7tFP3QwOtTBZmDIUGg3OrqP162wsGO8G7GZC0PtG1VuCi4hHiBdWN
	Yz9roHmk7Ke5Tf+JfCGbnaBKVJFQOfMwAFsfx73Vw6JYHzh9Ye0oM0+pIhrfDLhh00K7Bbb+VroJb
	aQyeg95WV2/or9lD/qA7AlMd/acaV3BaKdwoR2J+q39Fqfs+3gXCguCV5UVvJZQXkM5WbaUggcjuo
	bWvhI3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZG7-0000000GzxL-2QnN;
	Tue, 14 Apr 2026 08:36:35 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZG1-0000000GztN-3s4H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 08:36:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B648826E15;
	Tue, 14 Apr 2026 10:36:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8is0GWIGNF3i; Tue, 14 Apr 2026 10:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776155784; bh=L84JWopRw4FxKWz9AQYxbsooFwv6BpfQMhWnSZT5k/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OzUEG68BWraLt82oL6eodF8oRYmwxfCV4V6DLSn7ixMtUcgoTkTXeR5eihNNsp7XY
	 y8GCEs24oPSKfRaCrIB+ospXIOJREXsi8C5xf7Q35UY6GhR8mVH9GkCsykC3lmwC04
	 Y5yvtC+VG8cqkEzK0eIFVMEcsB8owjhfO1F1C+al/o54navyRFD4J+zDzK91Fjteme
	 2IYiVMevdh2uMYGpT/hBri3k9GTK73JQXuBavFJ8PuBSrZSc9kb0Jy1QwFWtrvH9KE
	 h9o2Vhiup8ael14tYg/NdFjf6OL/Bo+Y3gfWQRvuzbd6dG4pkWHsYtTUtEvhbir70q
	 dh/TzFf+52uLA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 14 Apr 2026 14:06:01 +0530
Subject: [PATCH v2 2/2] mmc: dw_mmc: exynos: increase DMA threshold value
 for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-dwmmc-dma-thr-v2-2-4058078f5361@disroot.org>
References: <20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org>
In-Reply-To: <20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_013630_438514_7222C778 
X-CRM114-Status: UNSURE (   9.64  )
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

Exynos 7870 compatible controllers, such as SDIO ones are not able to
perform DMA transfers for small sizes of data (~16 to ~512 bytes),
resulting in cache issues in subsequent transfers. Increase the DMA
transfer threshold to 512 to allow the shorter transfers to take place,
bypassing DMA.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/mmc/host/dw_mmc-exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
index 261344d3a8cfe..4b76b997ddc15 100644
--- a/drivers/mmc/host/dw_mmc-exynos.c
+++ b/drivers/mmc/host/dw_mmc-exynos.c
@@ -141,6 +141,7 @@ static int dw_mci_exynos_priv_init(struct dw_mci *host)
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7870_SMU) {
 		/* Quirk needed for certain Exynos SoCs */
 		host->quirks |= DW_MMC_QUIRK_FIFO64_32;
+		host->dma_threshold = 512;
 	}
 
 	if (priv->ctrl_type == DW_MCI_TYPE_ARTPEC8) {

-- 
2.53.0


