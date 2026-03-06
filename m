Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8047F0182B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97jIgM6P/d9EfNIE9WeYwD3m3n8Lqle2XokpQhzkWdM=; b=q7WmOMLBXZkDZhJMYYYrgOWogs
	X0NLeJYaWSCKVSPf2bf+q7140wjTuYyxCZPTu3DZDhXgiFys7p150UoEd2twD5QQYFxLhYWSmi81c
	glrl1VqE8fyEsk2q0lWQW0QcA656ueQYlTH6mO+xRz9QmKLkQW0MPerPIsY+dBlovncT4JjgPrmLj
	pSQV12K/A3dLG7JqdEKY/PObcaF3MXX57vovPyKQA9UATKegDVbL55gP5XZJn6EfUe1NGdaH+MDzB
	Xlv2tJRqzu/w96HL9YtionUF41sSWyAKX93lYsfAsQFvp2j6+l1dcSzzJVDChwyAUB1rJWJmaWhgW
	f8Vvysxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTxN-00000003bp7-3WLo;
	Fri, 06 Mar 2026 12:07:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTxK-00000003bmM-2zrL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:07:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-439b790af67so3396394f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 04:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798817; x=1773403617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97jIgM6P/d9EfNIE9WeYwD3m3n8Lqle2XokpQhzkWdM=;
        b=OuKqq//Hy9DZhjsmAuhQRYPStAXyrxAgnpVpb3n2PEAdKODs2bgfPhyE+bLJwfHzbc
         WhcGM6tGQqZ7MNkBdGMjFywz/EfobOtrh4GxtTfolh8g1EuTEttNf/aPaAJ7+NmWMyba
         q5gzLD13BWLP7QX7/Lwag7OjzIFrzRDosnuHzljRGCRL5G3z6DmEH55F4Up5mhy67xjb
         uWgbaLmgaYBpHd6U0WXosvN6hF/8ANEBWNbldLIYilH7+iHU/7+7r/YhDgH3nOzYMaOi
         +XYhUtS7b21GrPUhUm98EtbuK0hXwp8958472n/TJqeNmtuVIeBAZOS4Znf7J1si4g+V
         zbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798817; x=1773403617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97jIgM6P/d9EfNIE9WeYwD3m3n8Lqle2XokpQhzkWdM=;
        b=TMJ/xpG5sDoUn++jj1XlW3Zg0pHTPSU22xJWKIvn+m5Sivx2ljA54lDxy0p8jfY2Da
         b3gqOB/VDT0C+p4xNLF6thqPiFQ5sDrdVPF8rux+YzW3j0+JkX0zqpJHErzl3sraisWm
         gwhk/Hw4FOqcCLkpL8dbY1exOywDRxono8uXhI8cuVM0I8QqjZh7qqaCq1AHUvJLxTgq
         3r7/arkaINbpNLDHGrm6EnBb0rHpjhm3TFehecx+ROwi3Xf94HOLkgcYH+qyxZB21wmo
         iABZm6htNk/ETCFjlVPupMT5z6mTM1GNiRWbsNVqhTFnbEBUcE/0cDSythCwkXI1S+1Y
         hThg==
X-Forwarded-Encrypted: i=1; AJvYcCVN3DHBRX+ybGlAwX2JM+L5l7iW0scR/LC8DB0V83SYRr02A4gJLRTgxJzSzr21NDXzDQfc63WviLtv+mN/bCyO@lists.infradead.org
X-Gm-Message-State: AOJu0YzqFEgYBBug63jfG9X3wqSjodb2Sa1jixoAej/60Vkaf1mk3igv
	OJnj4xvXC2ppXOjpTCvSpMlNr/4AkVegSzGvv1nO2SWNNMiWL2pdK31g
X-Gm-Gg: ATEYQzzD3DzpIJ/GE7vgjUqsGA+tx6E64SL6UGb0MaGfiKhlJKsA7TVLAw6qUXPYyJ9
	qtvRycOlxmd+QzSUjT3LAkuGkXE3m9LiJebsBgdfkebaj6A1IxLdyeqXORZVAcaXIDlxHX1pBKC
	YMeZXlJMfKiu1kauXx1kN8ABbVjHeHUN0AugYKZ1sbhsgtRA5qlTipOcSA+F2jFRLWC+7PnTu8W
	TJzu6YoPrcilDyEHbHH8T1QZd4oesSy0KsGoYFWt/rxHi0AQ5V6hSYFXrv2QQzVYqCOEWPbCHIG
	lPYD4srmPHIx6tviDQGBLmfMW8gzlZFTejKRt2ToHDLRoKeFt6nQsdltx+PllRdEocEkbMkqWCc
	GcOGyc1A7uwV8Ngr507q8XNkLEpSkpa/2xEF5fbSFTH33ckRnI8ua413QO5DSJ32owPvmnyvOPd
	63Rw1e4ZbuTipJNVydQ0U=
X-Received: by 2002:a05:6000:40df:b0:439:c018:60e1 with SMTP id ffacd0b85a97d-439cfd76d02mr10149414f8f.21.1772798816912;
        Fri, 06 Mar 2026 04:06:56 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:06:56 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/7] input: keyboard: mtk-pmic-keys: add MT6392 support
Date: Fri,  6 Mar 2026 12:03:10 +0000
Message-ID: <20260306120521.163654-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040658_793333_84FF6F52 
X-CRM114-Status: GOOD (  12.15  )
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

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..3b9a5b6bc470 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,17 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x2, MT6392_INT_MISC_CON, 0x10, MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x4, MT6392_INT_MISC_CON, 0x8, MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +313,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


