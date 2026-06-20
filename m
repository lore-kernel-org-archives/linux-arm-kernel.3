Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF81CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=AEUQYKqC4okNICar2AeGX30aWQ
	GTF5Zhge0jc7G3HDf5pBVj5EAhfPWVzeYXT0m0kXcUFo3s54M0QPJpW2zqU5rziql+nWc52ORJkBI
	KBEDILoVuqJTJhTdLHFzb2xOfJdwvlj6UKPGR9QiMnNOVT5e/F4J1m9LkwbJ4ujecuRk75J8Hh7ye
	A5ypAFr7kC1JFPd0mFiw/MUefJ0zYLXGQyEqtoJcCGR3q042it4HF/atn5M3K1Ho6iNfGU6Tt3TI1
	G8yChhW0SgnOjgUW9rHmT2zoX/VMrGOyK73dYBEkLSyPBFPn9H+OJOxx3b48SrjaW5N1nnjBSggPb
	B7Q82eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1tS-00000003XB3-2WQM;
	Sat, 20 Jun 2026 20:02:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1tO-00000003X8Q-3xsF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 20:02:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1414853f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 13:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985733; x=1782590533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=KzRUle4T1yfP0EH8596leESJpU4Hnuo9A102Big0Zy/berseXbxCng7a/BLbdRWCNV
         0unHxiy/3+oy05T907imGq7DV2595QkpO7JhHs1d+m3BsFAfBrpfhPrzXefxNhhyKQll
         s5V75XW41JR42L8meMslUtICxGGGsSQNovyX+p51PLmQ6nIu88jtb6/KvZ1uYy9OYz9B
         5ikK/vuOM+J1c18GBb3RITzXYyn29sIeLOhoe07ztKeBghaDyftbGZCQXaX/Mq5FNxpq
         bHQfDcHGEM0XGXZ7ibX1i7P6DZos1VWsMmDEcEHAcxVNDtuyfWYW7VapjMJ7f23RtqqM
         8auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985733; x=1782590533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=LW9G//y1LNkB6u8UgBedjhAkAuIGR2sFxqDxZy7yZwEdVbRTb6oqIZIEg2ktuicfTq
         UfN1lDtkGgR8DaFbZnQStMJ+3QTpNSIhplnDa9VYuFoFiPSwmtPi4PMY0hUyhykzv9aU
         rlfd5xR6gu/AFnuiW2SmsVvwNsthVCQgj4ABIuFAYEVF7SZ6T0S67J5HLoh2XLDbXMml
         uP+QtP+bO91nDpcknk5YkvcErItqIumyU3NLMTfkAZOh0+L7SHonhL0hUqRi4bojBlp/
         J0EkPr68EjNBjwjwVOG4Ep6yr3ZccfJc6RzkyiG+MirEhHIqFnNl4QVrwk7QFMillHjg
         D0zA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7jacbX1wyaLLOUegl5pxnbCvtsRONoqRl7GoPnrdDgp72G5CyrB/gXuC1iGvDgVRv63aG6GwmMV88EVvKZJ3V@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjx6cIYsRLAAfIGxaZMr7EY/tNpDLcDdkpnrwfVVnDj9d4OK7/
	4toWnVl9QKIDoQXLlovyiTon9A/FMHTKeFBBXSZlsiurWc4QSVU9mV5u
X-Gm-Gg: AfdE7cnrWE9T9qa1pW6LSv5Vm9ih5uzf5gxGbv+vhJthx0Qhvf97HyCTeV8+cFxVdrr
	yOAgeClwhKQf22UZe2qRPhj6QlGvPKDsp58nHobS5WyZqlkpfPQtvKlhekrvdKcpPQQZ2+uopeG
	kcbCYkuL5ykbETdkVvDunJ8GMczhCB20Tc2hQR6+tk2GcdnhoQUGd47s3RBuRCxWnm0DPZX0+2w
	bsGU/kqaqTG3Whh7ORf1lx1/yWhfGMtUrzlUI3cOHI4r2IGlARBRGIaVGN6cNtJCBDraCTf2Wp4
	TzHWmDpy5X1MqGkIGBvxDi0kaqlDHEoQZOckSzdTjH3+L40IPGiifdftTqbC1dnCSpIFsztN4En
	NHcKWjAV9F90Yfx2pQm0l2v3UzDWerEQoe88R3hL2OQQsXWtt3Fy45MW896hWmTuYsXHX/4IF5a
	Mdfay7949eZTDVL8eU
X-Received: by 2002:a05:6000:41e6:b0:461:d369:ece6 with SMTP id ffacd0b85a97d-46662806a6fmr6772688f8f.30.1781985732911;
        Sat, 20 Jun 2026 13:02:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:02:11 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
Subject: [PATCH v8 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Sat, 20 Jun 2026 21:56:52 +0200
Message-ID: <20260620200032.334192-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_130215_022240_73750D73 
X-CRM114-Status: GOOD (  12.65  )
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


