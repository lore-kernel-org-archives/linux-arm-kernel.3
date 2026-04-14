Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48497ED7B87
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yYweDDx3KYsPHMBIm8Ut/MfrZTg6YcpF4UY4nT3G32o=; b=px5kCqAec7Ywcf
	26aH6ODdRM+SMqnIk/YqPqKBKMcYngZUr2HqZjaqP3vXLl3UCVlKLybn5L3e8BITGv6+IKRxlQiYD
	bVH14CY/3Rc2kHAS0I+t9J8oC4iX6a8m0FJSWmh2IEsqhW5VbI8L3IJJdV/qsUG5BZvkhEEdTe9ZA
	hY/luudtaH2qcHtdbo4k4dgAaqcTHo37/jeKJF+unFZD6L4lF+3Y3/NA4XaUVHY7iD+YYrDQDjMh/
	Yw9l5bmBzoRbqCyHJFeYjkbj/kzY67hVpfiuRptOeJjuUzGakPsb4A754oGCuUfdGe7AbpaVvWgn8
	4BJ+uRs73NRXScn2ui8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZGA-0000000Gzyd-3zGv;
	Tue, 14 Apr 2026 08:36:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZG7-0000000GzxI-2xVm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Apr 2026 08:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=yYweDDx3KYsPHMBIm8Ut/MfrZTg6YcpF4UY4nT3G32o=; b=n6gYF+6x3i8VSfAPwZAZOxSEhv
	SPCsNQN8cV8OV8gkHOwq7bqm2k1Bw+iXNmDh6F02XJjpfJuaTzkR+yYg0znxazcPX7fDTWP5Nrbhj
	Tgs4CExENKUuidLy+SlbRJX6keJJfQrP4447SDN3sK2iDJNKpj3EX4RBDvhTtFWz9x+FNId21dSQ/
	p7MlI3RC7bVEmg7IyPke7yT/I4D6qGbTPMxo7PzXA7iZYJk1/Byd6zp4gDzQsCTttMTbYgm0PVDiY
	aG6EMYGrJDIleq8yHp1+OnhaNHXAcJzMIfp5Lyc1MGZekXSHHsTo4be5TJ8qCrSS366iBwHUpA+Qj
	Qyag9aQA==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZG1-00000000WK0-23P5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 08:36:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A706D264BA;
	Tue, 14 Apr 2026 10:36:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6ZzvqgFef7Y; Tue, 14 Apr 2026 10:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776155772; bh=ghLdmmqYMIFtISlUzNAIj4ZX1t+/pLxltbPOih8nxKk=;
	h=From:Subject:Date:To:Cc;
	b=hJhQQYme8vk8dq5ZHCrGJHQRZmPLJl88kTlIWyPojIbeD9Dg5JR1YMfR5B5hNcxmY
	 08Hwog6a35gr7qe9qGGwmiafeiecf7QWbVjarMRt1k78nQjEOxAuvOVpOiHLiogTFg
	 5mgCaT5kVZnaEec1bEBKmXABQq+tPHOorz6m5biCvZtMSAQuTJTEo9ArWPBqJHilAx
	 +2RvWZAFwQkcubq0I1AauXd6Q6AUI9IvHOerLX9ZfxG4L2LMhYsExIoU33XVsfNeDh
	 wRLt8fsCkNQfy7cya/4aTtd2fqJdcQbLk8ZKaDdV2eAZAVx9WQ7pB6c58qYKH6jSMb
	 xdg0Z2Cup34Fw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/2] Configuring DMA threshold value for DW-MMC
 controllers
Date: Tue, 14 Apr 2026 14:05:59 +0530
Message-Id: <20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/83WkC/3XMQQ6CMBCF4auQWTumrRaQlfcwLBo60FlAzZSgh
 vTuVvYu/5e8b4dEwpSgq3YQ2jhxXEqYUwVDcMtEyL40GGVqddUG/WueB/SzwzUIanVTvjWtJdd
 A+TyFRn4f3qMvHTitUT4Hv+nf+k/aNCpsrDNjbVsiutw9J4lxPUeZoM85fwFCYQFfrAAAAA==
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
X-CRM114-CacheID: sfid-20260414_093630_580990_73056585 
X-CRM114-Status: GOOD (  12.26  )
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
 drivers/mmc/host/dw_mmc.c        | 5 +++--
 drivers/mmc/host/dw_mmc.h        | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20260412-dwmmc-dma-thr-1090d8285ea7

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


