Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE7FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HqEE3YRbTbE7T+1H+FMsBDpAKDlGN4RiEhakRYvsKYs=; b=RXAf3ITFSwvzWng/2nxxn5Yqbn
	i5b2VS1IgJBGpTfJRk5tFLF1s7TALMkfu1diA3u1AvAYL5KYzr8WKGfEmPLbJhXEwDzO8xDeDlgT9
	8PlpwbqM+QmyfJLQM3K43sB0AUeMuojLtqgZ+mOMckedf2+Gs5gd1kcBn7cN8jZ9gf+fxAAG0JL3t
	ZgID5BwMfV2n8kwqV1bwdcUAXJzsLyRz5b9LJF4Aor7SjAKimdi5cHfSsf1VIz4AUyjnHIMkXQPb/
	TEXQcc/xxz5w338+QV1IxwMIddh/2edZM80VW7olc/HlWsmRSLHFZrj6q14b3ZnSV5iQtGz08vwac
	S5Ba3e/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tey5J-0000000Foje-0Mty;
	Mon, 03 Feb 2025 15:10:01 +0000
Received: from [198.47.23.235] (helo=lelvem-ot02.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tey3x-0000000FoYN-4Azt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 15:08:39 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513F87PG2214454
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 09:08:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738595288;
	bh=HqEE3YRbTbE7T+1H+FMsBDpAKDlGN4RiEhakRYvsKYs=;
	h=From:To:CC:Subject:Date;
	b=fdwggEnYMuGDpLyX25DdN2X2/f4rp1PO6ToRqREfCBCR0PJsNDNp7d8iFSftz2yMN
	 3qCWIrqFfz1V3F+mmHl7r0LjkIP4LZdZh8a5fPuO7cVU5r2dVx/zevLPQvXMvHQZ7N
	 59b3VaOsTM+c0/bDRNLBANgWjLQaIr06fPGqafXU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513F87DH050204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 09:08:07 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 09:08:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 09:08:07 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513F81hC112820;
	Mon, 3 Feb 2025 09:08:02 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <nfrayer@baylibre.com>, <glaroque@baylibre.com>, <tglx@linutronix.de>,
        <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
Date: Mon, 3 Feb 2025 20:38:01 +0530
Message-ID: <20250203150801.2399555-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_070838_162914_6D66C0F7 
X-CRM114-Status: UNSURE (   8.55  )
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

Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
for core functionality like DMA, GPIO Interrupts which is necessary
during boot, thus make them built-in.

bloat-o-meter summary on vmlinux:
	add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
	...
	Total: Before=31615984, After=31778459, chg +0.51%

Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---

V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/

V1->V2:
	* Add Fixes tag.
	* Add bloat-o-meter summary to commit message.

Previously both of these configs were selected for ARCH_K3 in respective
Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
in dropped this recently without adding those back in arm64
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


