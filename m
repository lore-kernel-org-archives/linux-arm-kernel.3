Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CC8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y63+X/Dp2CE9yVCvl/H556o9pFY78+UE7i0NS2qgTOQ=; b=KsbodwgRI+Y3WmoLFL+KPu8KMR
	1hgLRM2I6IfxqN2hKCDg1cWkkQuYhK8zIw/RoT8uWfcMEfJljJHdaR3aQ/cNkA4tBZwbnuIF0RgRD
	Hz7VvhdtdiJfJSZwoF+zi//UcK5vSRI007bVKxsw0kqI8mQfLrabKWYWnKO8+gaVvHRKR0SWYs9UA
	6sG1p5zpp5V5QM3Ly+b5E+DeJBaDCG4a3EvbDS/dSGCe+JfnALwlJKzjTIqHCbeaY5BgQhVwiGRhJ
	ZIGKPLdSLBtp/PbrJBFS9jse76aIcPVQ8m6YT9AW9YijPik+tLpm7neg8HTRrhG0NVtKu6uB1PGAx
	6eqawZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whv5f-00000003Xzb-3Ds1;
	Thu, 09 Jul 2026 20:11:23 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whv5c-00000003Xxt-21uL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 20:11:22 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gx5h2054QzMlG0;
	Thu, 09 Jul 2026 22:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783627874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y63+X/Dp2CE9yVCvl/H556o9pFY78+UE7i0NS2qgTOQ=;
	b=kTKLOhlw3dsSSCas3hT947tSt8hLZ7VuE67zkz08cCekv0sCG3XK+UWyejs4mZXm/va7Z5
	PdzXUQCODshhkZkBiwgPll1wKekhioHcvTUQIz9rs3CLR/ZdDEGSX/DTTbXl0zT5h/iHGN
	jbV1mFi1kStbkfj5O5/e5ObfZb3kh40msFybnVGzzry5zDXvxqcGVFQUKFpsYjzOjgrevl
	HyyRYodIxwP6J4Ht0a2+2zo0xHqxVHphGbGty9dqMdopKpBm5/P14gAkOr8bTZYqisaA+R
	A+zEv65aQk2Qb2EUlaiYo8r0C7sLkHE7RL31HoRfoQNDhT1ddd0m67wxpOPgpA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783627871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y63+X/Dp2CE9yVCvl/H556o9pFY78+UE7i0NS2qgTOQ=;
	b=uIkgdiNHZKtufAVbUtlD0aL5irzPN8QnGD6gc3U6mD9xmTsOzlYD6M8kNcqq+9lFU8WzxX
	vU5WAZxE9F75QicH1c667VzICAvmEF8hT49vrqjKaDYi7H0JWlHsHYmpNhRhEA9mUTuMzO
	2E94bRKN2g+6nmfBw8z0dUUc6OUZB5FmftpadY4IPB680c+Z7TaDjqWN7/lQV0n0B0hWXV
	uu5R1uYiTa6eS5Ei4LsnsKqtdybZYew9G+YV0B3A8uGPiho2zRYilhAin6GSbglylT48vu
	24ePWv1x7fGKiGtzNHgl1VuqeQui93ZpxmmOnqnjrKBKNdrHLdGbD8hxtdJKiA==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
Date: Thu,  9 Jul 2026 22:10:03 +0200
Message-ID: <20260709201103.90162-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d77ea4e9cdf5251e9bc
X-MBO-RS-META: 5e9qh5qrbhxy7cjhaabxdnijm8n14tk1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_131120_679075_57D21B30 
X-CRM114-Status: GOOD (  12.86  )
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

Instead of pulling in the whole linux/irqchip/arm-gic-v3.h , copy the
one GITS_TRANSLATER register offset macro directly into the driver.
This repairs the ability to build the driver on non-ARM non-GIC targets
the way it was possible until now, which retains good build test coverage.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
Note: The alternative I could think of would be ifdeffery which
      is not nice and thwarts the build coverage, or limit the
      driver to ARM/ARM64 in Kconfig which also thwarts the build
      coverage. I could also split off the register macros in
      linux/irqchip/arm-gic-v3.h into some separate header
      linux/irqchip/arm-gic-v3-regs.h and include that which
      might be OKish and avoids duplication. Thoughts ?
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 5f7211b91ee5b..4b75615c516f0 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -13,7 +13,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <linux/irqchip/arm-gic-v3.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -26,6 +25,9 @@
 #include "../../pci.h"
 #include "pcie-designware.h"
 
+/* GIC ITS TRANSLATER register offset in GIC ITS space */
+#define GITS_TRANSLATER		0x10040
+
 /* Renesas-specific */
 /* PCIe Mode Setting Register 0 */
 #define PCIEMSR0		0x0000
-- 
2.53.0


