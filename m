Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B2AF43834
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYuNhr3OzQTUS+jz5yMKk4NFkF+4wx8tO9sN7qPAzcw=; b=t853/wAbjU+nfmrwuYC55MK2HU
	iM/LDmdmX7z8awOoXx5HWtYldUFesyEfS4Puictz1dfZK+ROYTiNmPLxGQ7MNRurntqx2uGwVtCjU
	HVAEk9OcKz/7eKG8QmwxuJO26XBJnUspY485OCJtIJOJYCFcVkItA7IC1kUSvmR+FPLTmvUYxTOSY
	zX20aGZ+0ilS2fkYZghu8B2Cb7kZ1DAm2sUyX9JigmkKFFka/v8jNVzFQIXcStqX4v9XsZsrN4Etf
	vzdxUvD5KoLcteKEgS6v4y7c/3Ev1kX0zsHxwaFdgTw9FRvkWrCrEb1hkegZh4EGclvs95XrPuDdm
	ZocrWK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1m4-00000001HHS-2LSY;
	Wed, 15 Apr 2026 15:03:28 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1m2-00000001HGk-0nsY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:03:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 101EC27157;
	Wed, 15 Apr 2026 17:03:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6gzkfQ_kabV; Wed, 15 Apr 2026 17:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776265397; bh=L84JWopRw4FxKWz9AQYxbsooFwv6BpfQMhWnSZT5k/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dT3QtYJ2ZkmGSWY2R69mfOtu0cshVPJL3NgQuD6eN14GcsgvCFccoc+1XlY7r1J9P
	 iV35LO9Lj9X1QZsqfXAvQsrc3HZBpMRr8P8CxJFp75ya/I/fzY2Rj9U96vf9eat0x4
	 XGMMFcmgO7cPALyzF9wbBVlVli0mXlXZhYzwa2M6KnO/cLjMY6dX0h+3dDt8BA84VT
	 4Nxo7tB/gixyr0vbhRn19iIb8+2x4lvnD+2BLYHDYqARtiWNedH7XKQTDhar2bc5/4
	 +G3raNE1oOQaY3TXxJ2T/MOu17Y5x4nSqHKCtxyN1S/VDEJqpNUMDXlbsJJYHwmvF6
	 GRrci01HcN7+w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 15 Apr 2026 20:32:09 +0530
Subject: [PATCH v3 2/2] mmc: dw_mmc: exynos: increase DMA threshold value
 for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-dwmmc-dma-thr-v3-2-31014d36b6ee@disroot.org>
References: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
In-Reply-To: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
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
X-CRM114-CacheID: sfid-20260415_080326_365761_5C426FA6 
X-CRM114-Status: UNSURE (   9.71  )
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


