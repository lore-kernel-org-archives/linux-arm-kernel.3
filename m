Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DCBE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a/1dr0FgUE6eojbK5mAq8KjlXBaz4F21DqMSmZsgWTY=; b=LHz3ncFEgFglvScDqgu0HhZ+mF
	m97KrTW3Sx84MHQ9powC4PuorOOwOX/7XNPnHLFv5HUe6BlvmXvfTSK1Lbg/y+aglus6BAM1iP03D
	g868Wv1ALyItbLAsag6oHDfTMW5QiV6qf0XtYpfYbv+0kIS6z3YYwN2sJY3xliDjFbIo9bhfkUV0t
	8c7LxI1p0TYDTd28NbbCaYmzdxmmx5uj+D4h7s+lnFLy++hsAlFNRzzgBmFtLE1t6duCpMD9U9EWx
	VmPiAISeTdKAaTPPPQZNA/dczYAJGNEtirI+PrQ3PHFhFkJhtZC3DQnzubvnbA54v5NAq7uUnTlpK
	gmtbI/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM15n-000000035h4-2zmS;
	Fri, 13 Dec 2024 08:32:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM14i-000000035ZD-1Ygj;
	Fri, 13 Dec 2024 08:31:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55FD85C6A73;
	Fri, 13 Dec 2024 08:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8982FC4CED0;
	Fri, 13 Dec 2024 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734078663;
	bh=OmnbKPvHVM7MdfRx5FYkdNzBzuqOqnCvvH25yQuyNBA=;
	h=From:To:Cc:Subject:Date:From;
	b=VNk8HE/5qYbZuBa988qzCP0ljdU8d8JT1z7lwgU/ujrmlqidCLhSdNvcuNPKF8uI5
	 EKWmpL9T5FLfBvMoOi213/5kdb/id+Y9DkDKlLpxzsFlttMq9OMJnHm0OaovoooBC9
	 QyxzZ8gW4dlEW4i3CJzv5xQcz+Gs4kXEDxa6KKxgSPyJPfrIDgh7pu8R9D86wcKOT+
	 IgqsZjlQ2GoEEijNseArr7zADkeSQkp93wtce8Xl2xcBKQyCEHPN69rjQH1muW5PBg
	 c8OReZ8kuGiSmWUDwTUH3DY6rnqwxq7nkl1ERJYxFQ0qsyRpdBLkk0PCRCCa5aR/Tz
	 Quc23IjDMmUJA==
From: Arnd Bergmann <arnd@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: mediatek: phy-mtk-hdmi: add regulator dependency
Date: Fri, 13 Dec 2024 09:30:51 +0100
Message-Id: <20241213083056.2596499-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_003104_451348_7E829849 
X-CRM114-Status: UNSURE (   7.96  )
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

From: Arnd Bergmann <arnd@arndb.de>

The driver no longer builds when regulator support is unavailable:

arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi.o: in function `mtk_hdmi_phy_register_regulators':
phy-mtk-hdmi.c:(.text.unlikely+0x3e): undefined reference to `devm_regulator_register'
arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_is_enabled':
phy-mtk-hdmi-mt8195.c:(.text+0x326): undefined reference to `rdev_get_drvdata'
arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_disable':
phy-mtk-hdmi-mt8195.c:(.text+0x346): undefined reference to `rdev_get_drvdata'
arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_enable':

Fixes: 49393b2da1cd ("phy: mediatek: phy-mtk-hdmi: Register PHY provided regulator")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 60e00057e8bc..ba6461350951 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -65,6 +65,7 @@ config PHY_MTK_HDMI
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on OF
+	depends on REGULATOR
 	select GENERIC_PHY
 	help
 	  Support HDMI PHY for Mediatek SoCs.
-- 
2.39.5


