Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF028C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eqKxRAE0hEhB/gkwHUJjHYvFkAhY4M48O0HRCPE2xfU=; b=oqgelG6f8enPzDgL0eTHTVVIkO
	5ljHj9zeUbV61nszKdna3eIk709e1QDix2y8fxFPPUz0KFLXXhTdPQsa9A/sS5SRFF7dnyqfBTrU5
	iAE8iwYI3LSl+KUL4zqCVg76Wkk1guORc96rkbrCPH/Rok/NPsKsL3oKl8xlVEyo1+Y12rmE4tqRr
	LooceX3Hkw6OkuT0GsFdsVMOhum4A9TUckePzKL/Pf8D2CRibnlp7Bk2CWImoywfZkvjKZcHc+g8I
	ouqc2v/NJqI6ajYy1hTZhCedZGOqcK5m9zC0gqfYNkPFtlEpyGnzn7mdpjDiaKNnVUVSy5bv93Rek
	di3a2g2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYpt-00000002Pue-2Ppt;
	Wed, 05 Feb 2025 06:24:33 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYoX-00000002PYG-0baN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 06:23:10 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5156MaeQ3300929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 00:22:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738736556;
	bh=eqKxRAE0hEhB/gkwHUJjHYvFkAhY4M48O0HRCPE2xfU=;
	h=From:To:CC:Subject:Date;
	b=M6kIYbzB80Dul28IF5RJDxDRWcCqB/Jtb29S/cnvoqqeP2fKjEj2abTh9S4wQ/8nL
	 TBnkjtXBptqBcNCNV9BrHaemf/9iSiyroyx21zZPqJoV5wd+GQ/FEjXDFWpEhUfgWw
	 RjJl0vkckD26cbR5AVgWs7AaVBIWvwUNNOYkwjgQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5156Ma8w091493
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 00:22:36 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 00:22:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 00:22:36 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5156MT6A076445;
	Wed, 5 Feb 2025 00:22:30 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <nfrayer@baylibre.com>, <glaroque@baylibre.com>, <tglx@linutronix.de>,
        <u-kumar1@ti.com>, <geert@linux-m68k.org>, <d-gole@ti.com>,
        <vaishnav.a@ti.com>
Subject: [PATCH v3] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
Date: Wed, 5 Feb 2025 11:52:29 +0530
Message-ID: <20250205062229.3869081-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_222309_270488_05EE5B8D 
X-CRM114-Status: GOOD (  10.32  )
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

Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
for core functionality like DMA, GPIO Interrupts which is necessary
during boot, thus make them built-in.

bloat-o-meter summary on vmlinux:
	add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
	...
	Total: Before=31615984, After=31778459, chg +0.51%

These configs were previously selected for ARCH_K3 in respective Kconfigs
till commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
dropped them and few driver configs (TI_K3_UDMA, TI_K3_RINGACC)
dependent on these also got disabled due to this. While re-enabling the
TI_SCI_INT_*_IRQCHIP configs, these configs with missing dependencies
(which are already part of arm64 defconfig) also get re-enabled which
explains the slightly larger size increase from the bloat-o-meter summary.

Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Tested-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
---

V2 : https://lore.kernel.org/all/20250203150801.2399555-1-vaishnav.a@ti.com/
V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/

V2->V3:
	* Justify in commit message that the patch only restores
	previous behaviour and also the reason for size increase.
	* Collect Dhruva's T-by/R-by.
V1->V2:
	* Add Fixes tag.
	* Add bloat-o-meter summary to commit message.

Previously both of these configs were selected for ARCH_K3 in respective
Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
dropped this recently without adding those back in arm64
defconfig, this causes boot failure in all TI K3 platforms.

Passing bootlog with configs enabled:
https://gist.github.com/vaishnavachath/03d8d3ce0f22219643c2f4d1dd243fd1

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..1f25423de383 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1551,6 +1551,8 @@ CONFIG_PWM_VISCONTI=m
 CONFIG_SL28CPLD_INTC=y
 CONFIG_QCOM_PDC=y
 CONFIG_QCOM_MPM=y
+CONFIG_TI_SCI_INTR_IRQCHIP=y
+CONFIG_TI_SCI_INTA_IRQCHIP=y
 CONFIG_RESET_GPIO=m
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
-- 
2.34.1


