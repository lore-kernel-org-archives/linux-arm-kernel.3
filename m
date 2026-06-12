Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DF2CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 20:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=OvNPf+cAoKBXLP3ZG1boG5Wxv1
	+nPQnGxpeX2D5vv0y9Y81ipMaL9OYBpiUqJGpRoGXM2sg2GdbvgEtdRUTqA9+7wzCma1fPPsHDJX6
	pztbwztYVHC/d5Qpdh6h0+h91z1zXGkLfZu1urF8/2KQa+7LrtXkbuC2MaOmXng+IfN97CloxC39b
	ELkR+5XVHtt3FyC2YcNH/9YdYE9KR9YIvcg1n+KtqehzHTncxpEMqvffS75bh+zXXA4/t5Wh6lOA1
	cF0am5/zlurjm9EjiraRSkeyUuIk9kXSeE6M9hdoJWbREyOrUoD/2l/o2hsNmphlgR8eqswhlC9my
	OCRxwi+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8T9-0000000BY44-3Jao;
	Fri, 12 Jun 2026 20:27:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8T7-0000000BY1q-0A1s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 20:27:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so1095201f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296027; x=1781900827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=eaOWZZbLbc09gvI4c7pzyiOzRrVVwCW/N5wJo1M1FpBdw0InNHxziMSqptopCjax/R
         9GJGbSnQLsAn821NPQHZYaBeTHSTQQyXcCvp2IsA3xnhcxNn5xVwEGQnABwFdbY+kRqW
         W9ucUQgqO7tjdqYkSG4oa826qMjkHG1YGuh324X5w6j/EA4Nr1o6tz4LeRl2NJc1hdKK
         d2H3v2OH8yzB4xtJgPm6QUkeDambtahoruSfbA7cryFPKbWYM8J3slac4Fk/4xOAPzvw
         r9NIFCrDgikBKjkk9pN4nOxHifCLvQBeFeKHhPQMCzv76JOPkSjbV2DF8aFoBcm7Zqi5
         dyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296027; x=1781900827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=nTelHBhiY71qBu7kGxDAo6Q14sljsclhOCP5BRnAT7bDWKfUaGoNoL17kdl1kC67Ve
         UkGkYmeYmi4k0SoweK25TtC7oDFextxoMlaGWpPHHH86EKe2C1vYuJJUXzWg6M+6bWdl
         HB2DAIVPH5Koclmd13WzFdJ65WoHZtvNF1kTI/qNUA8NZyzGYOs7k0glNHi23JTt76Xz
         YXGITZrmyOpkPe8k5evfQ0OAOq0sQ8NfWUV22cj84fyvrX21d7MYBQ0XwpC8z0qXWvZv
         J0K/cX2G+sgt3BG6lBxqtai++JM3Obe9ACaElHERNDwRRs5GrBRhm4vTFzBtmST+3sLY
         Oikw==
X-Forwarded-Encrypted: i=1; AFNElJ99gHIROU1gEhrTnhZRvPmQrDsQH3/CnrRXwFbCCwV5l9sESSXATEZ+FIv9zg9G7ZXJHKh4tBHgtoqFtWcApkti@lists.infradead.org
X-Gm-Message-State: AOJu0YzXmrWDKIP2ajpuTAuOAqH44AOqMN1XY2YROFTl66cE4LX8Dg9E
	1XtbXNLd0Tj6zPvhV3IktyTitEfXCYIpZ/TFWYqF5Rkd8afBvmCr4AZa
X-Gm-Gg: Acq92OEeIGdrL4NhNWiB9TCeRcGkRILITJhlLqc7orIyFRrlgXlUB2MbivJKM2kYSgy
	syjwy4SDFBxUSvHJQIWApaUF7UqXZuUvvEgH8K/cPgher550NAj1vAR8CUJwZQVg6YcX4JnV7Fb
	OTMf2EqEXm1qmROP3hfrjCSZvNUg3jxrF0vhL/+a7HFg1IborwqUiGr6vzb0WWa1xk9yD3+5UaC
	1w2t+P7Kff1tOF6PVrNkcfIyMDJuv3r1VOHn9nNIaipJkw+Gbc0pNTVYAIb9OXvUIQuBs0lAyC3
	N+f2frHq6lJ1jtzvt3hqGCLTEldI14BJnXvUSq+j8w00J6o+Harb6eF/w0l6lxTy+FFjOim/bAR
	Duf6hbMxuN5eXeLMEa70HCGDywYYVR9xpRFO/MfK8tYi0BYJ7HKhbpIjR518DJFagghxTkCoo/1
	rGHCqENHy/0r4vwke2
X-Received: by 2002:a05:6000:402a:b0:460:f4e:a481 with SMTP id ffacd0b85a97d-4607ebee2ccmr873998f8f.34.1781296026959;
        Fri, 12 Jun 2026 13:27:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:27:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 5/7] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Fri, 12 Jun 2026 22:04:10 +0200
Message-ID: <20260612200717.361018-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132709_101710_55DF6D6E 
X-CRM114-Status: GOOD (  12.61  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
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
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
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


