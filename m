Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3ECEC1112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePW5oPXSIMZFrvCYy2NgcvqQ/NoHzPv8EJgBsrDZt6s=; b=a/6Mx470mfTYtCLxiWR0q69grS
	iLIlqZvmz+AERJkBwnuwkoU4Zy5IXaPS6IOBCBOXZJlvmljHYsgaynn0oV+znq/rW0C1tCEy2HEZU
	LuM0ryAL6Pt1yjeQHuOd8Bw5g2b6fHAlzn9v6d327vYXLSg7iRLS6AjgKG6SrpPVjTI10/MRs7u+J
	y4GZvj5dJA8uwgoaVNRa3ot5Dm2nDrZvAfM/BM1xXkww9LnWCtgQ+ztSUdQGvmUeR68Z8PiXQiMym
	YPG8ocGCIG6K+be1aIFTCcoTZ4q9+Bc9au727yBPfwKk0korF7PfOXFVxQu9TH5oj5l5OOk1ULssH
	BkIWCagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZh-00000000kKp-2Bi5;
	Mon, 23 Feb 2026 17:18:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZe-00000000kHk-1THl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:18:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-436317c80f7so3762675f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867101; x=1772471901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePW5oPXSIMZFrvCYy2NgcvqQ/NoHzPv8EJgBsrDZt6s=;
        b=fJNDRUhCg5/ASAH1qplKMCuo3eB7ea2uScowp64K4U52B84UFjyEu7BgORaHrbKR3L
         ot2cjID/KNzkQMjOHeka4gpbi4AfJdK+1s+45vhuMfLreErdtFWerl65Yz6mw1+Ki23i
         kuUEQheh1FeaiDHQ5+LwI0CWysSbCTAOtnwNWG2IRgM7AwuRaTUpGTnoyQDJDZa89juC
         aq8BVTpQFRXC5KJaoStQNEiLFSGuKZC18/qjlrJMc0qwxyQ62X4zPFqO64aKESRcs+e5
         wrQdzAwi4xJ6SHDn08E1bwygd8TWDZNYUcB6SXkBBNU3yEHVqVUA0E18+gen6HVdho2y
         n27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867101; x=1772471901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePW5oPXSIMZFrvCYy2NgcvqQ/NoHzPv8EJgBsrDZt6s=;
        b=DeLUF0k9WJgcYAiNP09R1S4lAkbzwEIxgHB3X5X9G2foAGvlucOwq35SrWyDa1BxBL
         oZXy5WQLSmKGSWfljcZL3C8BBd4Jihl2SVzcnn2/ixeW3LPnG9BFodsNy6nox+OfoWid
         weii+zqz+YmnQ3fn6/73pe80NwFhp5wBmmPWefBEByx8+O7hV4UOZ9vYAmSkOSy/ZVN/
         vuw6bMu+QTxFWnViOnDP9sBWmessZhqswxC1pqnsBM2hDY7in6dRb8+tgmp/fLscaMYU
         V0B8MKNv/SJSMOgOgAgriYiZlbGdx0CIbdZ29nnGylnhurE7uN20aPpWCdT6HwANKWjH
         Fkpw==
X-Forwarded-Encrypted: i=1; AJvYcCXTVzh+dv02w156yURgXqa7fFuREh0p0Cd2wP+7PZfTCHOmzvLAK8VZV7KDEEI/Kiz8+IL8gg6+cNLZ7gCNsG0Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxvdYTaLL4ctSopBk2tEZdk6AXUHpl56/bA03zC2/J4iJWbpnVA
	prUCEY9gDXr4rYdmDwEb9ciocZdyEGvAyFNK8udObPtsgp/vVhqXuiq0
X-Gm-Gg: ATEYQzyuvUszPckBqur7k7OTEWoc+d77s9nudieGt2XxLSilfmwRQdbbnimX0rlyqKS
	KWjDo1Xpl3VqJptJbOlaB66gsbqko0nRtuTqBbPuLJ03OWP10BZkewB9a0AvcoEBZ247rZt2dLk
	URPXGEaGvr3Z/BSOJu7XOmVJF/hGqvsKCCUYrNdU11cwS7SkOB+Nbxa4Nf0QL0SunRkUYHGWzxa
	BUb12wr1OaTWOXf3NJJC1fEozkeLxX66jByGw5BrrQ/ioZ7TYwgRKc/q0MHZAZ1KNN4u9bVGCtQ
	bIdUuJWteEInTdJRKND6cO/68z+3Wnq0huxo/Cgd3hlWv7j0xYRZAvgWFi2qGKrJPgXvEfK8rEX
	TfJe0VS5cUb14Sco64AddLUoFCAjTSifhWlKgCFbH1DwbxYXBzYRUo+41fvplJLAsVleG7fGbNi
	ox/zt2xeAWbHCjiijyyRw=
X-Received: by 2002:a05:6000:22c5:b0:436:549:e15d with SMTP id ffacd0b85a97d-4396ffd6befmr18768227f8f.18.1771867100114;
        Mon, 23 Feb 2026 09:18:20 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:18:19 -0800 (PST)
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
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 7/9] input: keyboard: mtk-pmic-keys: add MT6392 support
Date: Mon, 23 Feb 2026 17:12:46 +0000
Message-ID: <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091822_443897_5984CC17 
X-CRM114-Status: GOOD (  12.46  )
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


