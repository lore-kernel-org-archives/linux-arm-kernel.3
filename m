Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6205AF43832
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NbAmG99UXDypZmNdRrOe6UIcwn2RCGLPmMGHFotL1Gc=; b=LnclOjhNY6WAE7
	WFc6JoBZ6teM4kES6aoJIQDrIc2ucizhkQef5aUDDA7iZKkkt0vvXMzReVOskx0WmkV5W2ysKYRxs
	tRje2FIcQlEQW08JDVClOFyXtd+/mM43LMo8+Im5xFx41tgqaWnRolEI/qmsZecVtRaPBj5YzBGkE
	siLaEmbsZmBuJ6bn1tOk9ztnUqTE8oG+Fk1sQMYPiQpU06jPMj9xVlUnsc2AfB/YCY3xHCaSrNpma
	LxIYytF3oMhQYDGsM/ycaTBKrpXFCSCLbpqTBmIWzHS30/F8iNNeK1RgHvy5mzNmy9iXdiOpQKADz
	WDfnNBz6dqkdjnV83SDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1lr-00000001HDk-3FWG;
	Wed, 15 Apr 2026 15:03:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1lp-00000001HCL-0BYD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:03:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 141FF261AB;
	Wed, 15 Apr 2026 17:03:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RnjOkgDaXLw; Wed, 15 Apr 2026 17:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776265380; bh=7l+7KA0YkOWUGWnQB3bKnDxRm1f18ienYQMvCsVbkTY=;
	h=From:Subject:Date:To:Cc;
	b=KFwB1BjTcU2tLmwV6/OYe6i8h7KaNi/unLzcXPVrK4kgxjh+H77du6cYZr++ImDNL
	 UTY20IDagJ7efbxHXCKRdBQ+lPrWS1GDyFSYUR4hx0/Nku6Oo7Z4Kq1Iio9Pp/J5f4
	 s7/VoRcTTIUAoFdL+c5OgNM2fraQcOTU9tenLLbmndtVsAOHRh74q917xy3NYF4YC8
	 a+9sfy1w5dTDT5D+k+4ELfhaCTcZ2z/JZlxwHGGJZxzeIfSPm8QD+g73fNKAhka6b4
	 akFCd7yc+oTu1e4LmtnlTxC+V8v5idPfpjib6CZ3EU7hAcElR+XUsLyHt85XHlfTup
	 1uodu+ZnugBOA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/2] Configuring DMA threshold value for DW-MMC
 controllers
Date: Wed, 15 Apr 2026 20:32:07 +0530
Message-Id: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+o32kC/3XMQQ6CMBCF4auQWVszLRSqK+9hXDR0gC6gZkqqh
 nB3Cys1cfle8v0LRGJPEc7FAkzJRx+mPMpDAe1gp56Ed3mDQlVjJZVwj3FshRutmAcWEk/ojDK
 abAPZ3Jk6/9x711veg49z4NeeT3J7/5WSFCgabVVXa0NE5cX5yCHMx8A9bK2kPn3161X2FWqDj
 el0Wctvv67rGxkP6qfsAAAA
X-Change-ID: 20260412-dwmmc-dma-thr-1090d8285ea7
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
X-CRM114-CacheID: sfid-20260415_080313_226885_00CA83E1 
X-CRM114-Status: GOOD (  12.42  )
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

In Samsung Exynos 7870 devices with Broadcom Wi-Fi, it has been observed
that small sized DMA transfers are unreliable and are not written
properly, which renders the cache incoherent.

Experimental observations say that DMA transfer sizes of somewhere
around 64 to 512 are intolerable. We must thus implement a mechanism to
fall back to PIO transfer in this case. One such approach, which this
series implements is allowing the DMA transfer threshold, which is
already defined in the driver, to be configurable.

Note that this patch is likely to be labelled as a workaround. These
smaller transfers seem to be successful from downstream kernels,
however efforts to figure out how so went in vain. It is also very
possible that the downstream Broadcom Wi-Fi SDIO driver uses PIO
transfers as well.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Move host->dma_threshold default to dw_mci_alloc_host() (Shawn Lin)
- Move comment to document struct dw_mci::dma_threshold (Shawn Lin)
- Link to v2: https://lore.kernel.org/r/20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org

Changes in v2:
- Remove dt-binding to set DMA threshold (Krzysztof Kozlowski)
- Add comment to describe struct dw_mci::dma_threshold (Shawn Lin)
- Set DMA threshold in Exynos 7870 DW-MMC driver (Krzysztof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20260412-dwmmc-dma-thr-v1-0-75a2f658eee3@disroot.org

---
Kaustabh Chakraborty (2):
      mmc: dw_mmc: implement option for configuring DMA threshold
      mmc: dw_mmc: exynos: increase DMA threshold value for exynos7870

 drivers/mmc/host/dw_mmc-exynos.c | 1 +
 drivers/mmc/host/dw_mmc.c        | 4 ++--
 drivers/mmc/host/dw_mmc.h        | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20260412-dwmmc-dma-thr-1090d8285ea7

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


