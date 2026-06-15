Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB25CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=CamRVAFCPoOp5FQTd9tdDe0KwG
	ioD23XqH/idtm+jixcYBDEyQF/XQ5jeJ4HFRc/NzdxGU59FN3ca2mNInSgYKSHbG7YJKz5IIst2wU
	mkCh1uzmlXAxYCwIQMQjoh4jtYo7ti7hh6K+5se5R8wfwnzDYzgo9dhztPoaTbNPuTX/1Mmmv6kB6
	+NAL1RdlYg2WDEvNERfQe9D/yynVUkxrr2E/2ueWRpjruh+7bPVtQkO6fewbpxxzAEQ4cndIajKQq
	W0M39GMgpoZrQtr1TSM/n78TUYWIiNS/cdSN/VZNQ6uiJI5RNw90KfhtuLjeE+unal/SccVnFEVeD
	XWPT6V7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1cC-0000000DlyE-1SKw;
	Mon, 15 Jun 2026 07:20:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1c9-0000000Dlw4-3Xbb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:20:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so1807258f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508008; x=1782112808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=QKwcSfySm/5xKV+om9wR2Ud6w7bIBdbbOeuDqzjLunMKZp9S8SPysICXkcXYAVfXOr
         kaPrX0XKcJw/yCdf7Fc0vD5kiKAYhgfLRxsShSrZVAai3gFDu7sg+1oBWHx6JLvZOlj1
         4hgaLL8Qf0O6XVBgJEcNsxqZcltL0b5xJlM5nKQbdRXjfKL7+lKrQ2zxj8AqSD6ff1pU
         xhPOtOL/i3QH9gXANi6vsRA3uaGvHReEd1rcQuMD5OU5P3pVxRcQRoeRmHmHQUleWdGY
         ZFHh38DBZScIyBqE72W11uyFrx04hs2GZCmEoKEPORLzY08L3cLiShcdX/YlOJr1/9XO
         PEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508008; x=1782112808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=l//PmQIbUkAR3I/0nGrxu7kFMwh1WloSitEvlIcOruo0m6euJBPR8iScLXwPxqOD9z
         9WSjys3tY3m3CfK3pja/sLeV4RlT7kTAQx03ZdLvVCZb3YMcySeRQos8HVlBdZBvzBji
         Pg1CffmikV5rJFdQqGVT6vLqBm0okLLUkOgKCuvx8SxdFRraMQo+X+paqIjJX1VRQVsr
         M5wRS7+tq5AOBWoKv9pgVsv/WHb6Yv+aOphtDkUsTtpqaI7hFQKzp5df9YHcdMaJdqzC
         tkaNNDTA8cdiraB6JMZXy9DG77tAzU25ara3las1syoURurmoHI8DN749Syq/xnCi4iN
         M1lw==
X-Forwarded-Encrypted: i=1; AFNElJ8kn/LlNG0OnwnOAJ9YJKvA020P8G8Cn8S0j0TvvN6z7rOe3rqSgpu8W6iBHysUiPCrLn2GKjsRssZEhcXmYYKe@lists.infradead.org
X-Gm-Message-State: AOJu0YwNpTZhTKvNzbNXLwLhVFQWS6I/X9FPHfsBRFTTBWqU/jhwP7Vb
	W+QWECgTLl1KjFvsTN4xqPA2/zjzEEpd/Rs61+TwYuseGRKMJKDCpw+B
X-Gm-Gg: Acq92OFOfbyABZE2tPJTGErLjdt47BfaTXS9tl+isOIOBgD8w0WsvxbCNP6TeU9EZjH
	48kNJ2KFzWiuOVw+55LM5wx4PwNtZKZqr+AN/YKO3YuYoGLqrdlQMMnJUK22Npr7mvxvKVJBthj
	8ZbUt7kfHEtuq8hZzARrn45yWWbT9nWkfzOQUqrIkhmspq+2GTd1BtA2ASpOQySW6C10aLrG+qk
	a2i35yq8/CTW5RQiVuLawh4F2cjnuzjqRd/t5smvfxyItb7Os1M9rbsr0cs6xQl1ydT95TneeXK
	rcwTYL5eTOe/470S2+yiWrwHP3JFhRfcOIMqb+KoIU8HQg5gby24qLIezYGyF8fxzRhqZ33cHRQ
	olj18q+w3tRNqFFN4jWxcZY1Ix41IHPi42LZVxAHqyVcd2ZaK7BHU9lr0HX6STIgtU8oeMz2XE0
	WGk8AgznEk0ME72jhl
X-Received: by 2002:a7b:c7c1:0:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-492200e7bf4mr83916975e9.28.1781508007746;
        Mon, 15 Jun 2026 00:20:07 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:20:06 -0700 (PDT)
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
Subject: [PATCH v7 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 15 Jun 2026 09:16:12 +0200
Message-ID: <20260615071836.362883-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_002009_900821_3FAFA311 
X-CRM114-Status: GOOD (  13.12  )
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


