Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C8BFEDA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx9XOFf+F102qRgcBU1Wfi3j2xvaU33q9Wk8R7lTDqU=; b=e7/3q4VnfEl6BnqfGGmAuoyseS
	582jq3DNwe4bxHwTheFGa5CgWbPxRQC/hHkxMNQbEODUa3Zd8W7z3Yc7xDV2LvcJyfozVUDn3nFzh
	v9ptaqmDFJb4JNSaWiCONRWl0YFz/BOk3Sa8w5xsTDmhWLAIbBSY+CwIpaYEYed0Sx6tJBQkcS3zZ
	MFff6+eGB3aA634F0hyT9+JdjX7gSWTDJzRPFfdMBMR5zsM+Gd+EzyXjaPJGIljfLQzkOUBDezp2K
	m4FXw1cGrmv8w4YzDUyrhtD3dZtkEHExJ/XLdX7sX+TKxqIbfmRI9REbWkByNuMwqxlnB5fEij3ui
	4HvPO4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZR6-000000074kH-0Mrw;
	Tue, 17 Mar 2026 18:46:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZR3-000000074hP-1NfU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:46:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso69485485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773191; x=1774377991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx9XOFf+F102qRgcBU1Wfi3j2xvaU33q9Wk8R7lTDqU=;
        b=DWXd646TlevQFpR13OsFKrJ//nJlU93t2cDQlK6yMhNyQYB8ZfboyljO1g6D9iU0T/
         tYYp1nu2rvfo5s6jWtIpDI1kpHQSHE88s5vgT6nWjOMj9V/CnFGz0eZJJ72d4e8C0+l5
         VJjQK7HZ7OI1i1jDgoEuA7EeBAOKtLi0bt79JevkOR6F1C1CetIekcAUhFf6ESr/4Up1
         fX/LhwlgE+WnwGD1l9tZoGPgcfu5wTbw0C3dwwvoDZmy6u8hI4LaMvCSjEcHpMHH2ZiF
         Do40r7mLi3KBb+8Prf01xyZJHvGvW3dvOaH5qd/WObjMkUFRX5HnIfQwii5KqqTRoowI
         IvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773191; x=1774377991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xx9XOFf+F102qRgcBU1Wfi3j2xvaU33q9Wk8R7lTDqU=;
        b=RCuyGyoiGSq42ZR5lbhSNvnjUKi3PpujYym91MPlhXahAF8W0rnQyseSq9mRobb8Oc
         d3wk4lmTw8E3ET5SUWJt4tPIfHIeXYjq5aOzmgu28of1LV2O8HwcSGbsgxcoOotN2LO/
         I4U9Ae8jFxCrnneo7k9Mxs1Zw3yJrhY9G+E7svvjOlP7tAeI5pE2MpuF3z3qsX/5En/b
         Sleg2mmP/ebPcKkybR5J3AlDC5FsvbN+aK5m1Ozl1IUTr4llgs9nR2pqqnVquD5vNl99
         7oGVxpYkBlPR0OgInC0/ry148U7YRurdHL5n02S3QiovsVE+/ILtFdQakiiRx829HGN8
         F36Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/7ocwE15CARzPeL7xNPrZzHV4ljmkZ+DQW4s2F0E7QyDdlbjS3RkVkYBP/N4HIV6ns4Z/P5yYbV3moxEFXhhf@lists.infradead.org
X-Gm-Message-State: AOJu0YzsVC0FQ5PiIUTBx5npKsXQD/U5LbWsGwd8utyddEPelTG69aNy
	dhtuN3OitmBygs1jWMcabPfUSZUtKI8uQRxTmYGvCYocQXsrL4z0JGc1
X-Gm-Gg: ATEYQzxHfzkYF7GlBpWUBqxZT2KdhQEBVAfpNn9RUyG0KyyZVjl8YGIBh8C8rOZjbDr
	HX0ThvkOhaavV+P5WLFYVECWbYNs6F8wxQ7FI6CURpMOWeU1U1hAYAAM0Nd/gHfLnNqcKd1lED8
	3bmQSpO0V4gDt1ujcEXrD7riU0JCTV9FDJZZJLTzOWwzHkn0/Dpofx36AyHAB6zfO1Qx/RjXe6E
	ss47BidbqKybpvYeVo1gOe+PWsjTPBtgCCGlcmV+08wfM990Sddm3p6FAuuZ+Uo8dbDgPt53Wg9
	Lw6Ji7fR2Lglv5m/kNm320TaoQbvB6CX6znykSWzTlomnoZo4yUjdhmZB+7QLy7H+RePy2nSQht
	Rhf1NdTejMQyEjZhf80lBIFuhDAD6RYvlla1S+wOP+/6YdJuCusTTrcr7xOSvKEm7vTTjiCZhtD
	pheRuKNl0K5PciKkZf8yI=
X-Received: by 2002:a05:600c:a43:b0:485:5981:1423 with SMTP id 5b1f17b1804b1-486f442e6f0mr11506045e9.3.1773773191445;
        Tue, 17 Mar 2026 11:46:31 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:46:31 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 6/9] input: keyboard: mtk-pmic-keys: add MT6392 support
Date: Tue, 17 Mar 2026 18:43:09 +0000
Message-ID: <20260317184507.523060-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114633_384678_D8E78E6E 
X-CRM114-Status: GOOD (  12.78  )
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


