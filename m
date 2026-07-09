Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8304IMO2r4pj+TUymf5H7uwDWcMKI91by7KxmjIwyA=; b=cUp0Z4qZHLGO/6ncGsDSkFb38b
	SwXymtPDhGvVnW7z1D+kvij6jjsG0WjvsesPnmRwimawRSa0lJt+uCBhzEt0OY65l0lQtD4fLbnhJ
	pxis0MZ6GrbJOWdSeCqWi9ppmeYoxQBIAFfTFq66PmZI66Z5MtdvOJWgxzIh/aghLJjoevVllvRzl
	NRf2DU4ZjNmhmT333+ZPQgZvt+/Mg9AlbApOTCXLM45XO8nvFoe3TvdHQqda9IfcqiVHsTMcQn9JY
	eCQNuQ1FWV12ri/eOfieR2GiNLfhtbGqU4Avi33sX9jqGQBeaKhthVxNE8rruNn3I+gHktyjidZ0t
	Le23/ycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiLp-00000001BVW-3bic;
	Thu, 09 Jul 2026 06:35:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiLi-00000001BOD-2P4E;
	Thu, 09 Jul 2026 06:35:07 +0000
X-UUID: 4ff358fe7b6011f1afed4741b24580c9-20260708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t8304IMO2r4pj+TUymf5H7uwDWcMKI91by7KxmjIwyA=;
	b=B2u8TOzmY9LXjuHEuhy7BJR1eI115+uoE17JmILhsKzNBGFahCbPmdDLeNXBREwCl3W/Ho/Uzf8LjgBVfzsMoeVO+SMwyLNB+kpy5e86MMn3iVNzAODH1b1OqSEuKDEdjrXteBDcRiKQRz/M6X07WZfgN84mrLvSj3citK+QmwM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:c30d16c3-ff07-49b2-aff0-64d619cdef1a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:5a272f82-6310-4e6b-a6b1-aca20d98ed8b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ff358fe7b6011f1afed4741b24580c9-20260708
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 858371571; Wed, 08 Jul 2026 23:35:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 14:34:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 14:34:57 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v5 2/4] pinctrl: mediatek: allow common drivers to be built as modules
Date: Thu, 9 Jul 2026 14:33:47 +0800
Message-ID: <20260709063450.1615041-3-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260709063450.1615041-1-justin.yeh@mediatek.com>
References: <20260709063450.1615041-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_233506_627797_58A7E213 
X-CRM114-Status: GOOD (  16.74  )
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

The MediaTek SoC pinctrl drivers link against the shared implementations
in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. These
were built-in only: their Kconfig symbols were bool, they did not export
their entry points and they carried no MODULE_LICENSE().

To let the individual SoC drivers be built as loadable modules (required
for Android GKI + vendor_dlkm, where vendor drivers must live outside the
GKI vmlinux), the shared code they depend on has to be modular too.
Otherwise selecting a SoC driver as =m forces the common symbol to =y and
the resulting module fails to link against the unexported common entry
points.

Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
tristate, export the entry points used by the SoC drivers, and add
MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.

The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() was
never exported. It is called directly by SoC drivers such as mt7623, so
export it as well to keep those drivers linking once they are modular.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig                 | 6 +++---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 5 +++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c    | 8 ++++++++
 drivers/pinctrl/mediatek/pinctrl-mtmips.c        | 4 ++++
 5 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 97980cc28b9c..864e7ffc6044 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -11,7 +11,7 @@ config EINT_MTK
 	default PINCTRL_MTK_PARIS
 
 config PINCTRL_MTK
-	bool
+	tristate
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
@@ -22,13 +22,13 @@ config PINCTRL_MTK_V2
 	tristate
 
 config PINCTRL_MTK_MTMIPS
-	bool
+	tristate
 	depends on RALINK
 	select PINMUX
 	select GENERIC_PINCONF
 
 config PINCTRL_MTK_MOORE
-	bool
+	tristate
 	depends on OF
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 38f15dbe9a28..3247622911cd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/pinctrl/mt65xx.h>
 #include <linux/gpio/driver.h>
+#include <linux/module.h>
 
 #include <linux/pinctrl/consumer.h>
 
@@ -743,3 +744,7 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_moore_pinctrl_probe);
+
+MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Moore");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc2..3813dfb0fa7d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -69,6 +69,7 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 
 	spin_unlock_irqrestore(&pctl->lock, flags);
 }
+EXPORT_SYMBOL_GPL(mtk_rmw);
 
 static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 				   const struct mtk_pin_desc *desc,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 791eddd7a2c6..a58015b508af 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -7,6 +7,7 @@
 
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
@@ -190,6 +191,7 @@ int mtk_pconf_spec_set_ies_smt_range(struct regmap *regmap,
 	regmap_write(regmap, reg_addr, bit);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pconf_spec_set_ies_smt_range);
 
 static const struct mtk_pin_drv_grp *mtk_find_pin_drv_grp_by_pin(
 		struct mtk_pinctrl *pctl,  unsigned long pin) {
@@ -297,6 +299,7 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pctrl_spec_pull_set_samereg);
 
 static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		unsigned int pin, bool enable, bool isup, unsigned int arg)
@@ -1149,6 +1152,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pctrl_init);
 
 int mtk_pctrl_common_probe(struct platform_device *pdev)
 {
@@ -1160,3 +1164,7 @@ int mtk_pctrl_common_probe(struct platform_device *pdev)
 
 	return mtk_pctrl_init(pdev, data, NULL);
 }
+EXPORT_SYMBOL_GPL(mtk_pctrl_common_probe);
+
+MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
index efd77b6c56a1..c9d9de68e282 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
@@ -349,3 +349,7 @@ int mtmips_pinctrl_init(struct platform_device *pdev,
 
 	return PTR_ERR_OR_ZERO(dev);
 }
+EXPORT_SYMBOL_GPL(mtmips_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MIPS Pinctrl Common Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


