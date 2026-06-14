Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A0CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 02:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A+FxAlvu+74WmZK0ANpEi4u2g+JsLZf/9T/GHqq354c=; b=hiDyFr2z4hsdVob4Qlkro1xX8A
	HVSdp+Qx7e3HL1xHgTEcpmC8Q9xM34o4ZifXs013t0XQPWz7L7UStoCE+I4DJQIJ65Tai6WADkHns
	zdfsX8G7w3y3yKzmqKwAlH2njEW3ZKqUj+TAPIJI7Epz72anD1VABiFHKZDa8vst3SJo1rEqKpWZR
	hqlCHaxOPs2kNBhYxl+5vKdgUHsnjib/GPo+eyTdurn9EA461BpA6macWaBUxiYf/zK7PoWZZZ/Tr
	Yx35tvAVuSUFxucfb8O1AdcBaWoQZw7U1lC89KiGy5HHeY1CukuSYi2G51MEHyFLxNCmBUmOAkLEr
	i8Pl54Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYaUW-0000000CgIj-0MZw;
	Sun, 14 Jun 2026 02:22:28 +0000
Received: from ferryfair.com ([103.227.96.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYaUT-0000000CgIH-0P2b;
	Sun, 14 Jun 2026 02:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ferryfair.com; s=s1; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A+FxAlvu+74WmZK0ANpEi4u2g+JsLZf/9T/GHqq354c=; b=wQ0Xrke+mswiU+47Dtt52p3n0D
	oqHwKFCxOd0VKnMXD17qYfuRKeaGkVfaaRUDwGFjLeqXisfGbZiso2F4iJtdqRAfPUp84GS24c5Pk
	j+1sVQpjxikOIdhQD2ayYB3sSnIyHabg/9BToofR2tmJdDAbJ4TgCtWmN+iBZ8CWrNvmbxqEpFlsD
	pQm807ViVcKF3YEpx52Q9tCWfQ8QkyX1lTGORvqD4GCFHkIHnCq3J1mVxKDo+fR3jy13JO/XpbLzE
	JlMavtCIQZWuSfC3n5zMpyOSHS5zA/kH+HjlBWkX6dOZpwrhrZyPsaAte4/334SUCdUU1DXz3VID3
	Ls5zSm6w==;
Received: from gowtham by ferryfair.com with local (Exim 4.99.3)
	(envelope-from <gowtham@ferryfair.com>)
	id 1wYa5x-000000005KI-3Bfp;
	Sun, 14 Jun 2026 07:27:05 +0530
From: Gowtham Kudupudi <gowtham@ferryfair.com>
To: yue.wang@Amlogic.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: robh@kernel.org,
	bhelgaas@google.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-pci@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gowtham Kudupudi <gowtham@ferryfair.com>
Subject: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before LTSSM enable
Date: Sun, 14 Jun 2026 07:26:20 +0530
Message-ID: <20260614015620.20432-1-gowtham@ferryfair.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_192225_271025_B3BBEC70 
X-CRM114-Status: GOOD (  10.15  )
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

On warm reboot, the PCIe controller's LTSSM starts link training
immediately if PERST# is already deasserted from the previous boot.
The driver then pulses PERST# for only 500us, which is too short to
properly reset the endpoint device that has already started training.

Fix by moving the PERST# assert/deassert pulse BEFORE enabling LTSSM,
so the endpoint gets a clean reset cycle before link training begins.

This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
Cold boot worked because POR held PERST# low; warm reboot did not.
The fix was confirmed on a Banana Pi CM4 with Waveshare IO base board.

Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 5f8e2f4b3c12..3a7e9f1d5b8c 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -310,8 +310,8 @@ static int meson_pcie_start_link(struct dw_pcie *pci)
 {
 	struct meson_pcie *mp = to_meson_pcie(pci);
 
+	meson_pcie_assert_reset(mp);
 	meson_pcie_ltssm_enable(mp);
-	meson_pcie_assert_reset(mp);
 
 	return 0;
 }
-- 
2.49.0

