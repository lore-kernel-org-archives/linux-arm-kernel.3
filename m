Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD3AF3D61F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=PY5QWM1dmQe+Fxqlr0+HNTTfF3
	tP1uUu6H3/oamCrghYZic4TrlbbjXTOF55GNvuhCy2xLaGPffCORitCpRlPe0/nmBhriAYtJBfI8V
	BwJeNU8M6GSgJp6u9c0fZwSUzbuPKbPbwMbhNdwnZ434+cYweHyyofFgqCrqvRUurN48XIfohCd1J
	xHQ0heXc5ig2BlEEWwxQZe4jRWN+aa1cNOK4PfwgsdbKFaiib4ZF12QQ1Vm48g6mFdyH2V4QwsLFO
	+o4Xwyd8PXPuWXf7hev085FOP8Vl0U85cVttEab88FEeV3dE9eCcmFlUaEKAXHIvpi8+Q5zIpr7PC
	Rti8xRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w786K-0000000As96-3OgB;
	Mon, 30 Mar 2026 08:36:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w786I-0000000As6W-11Ue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:35:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48374014a77so50167695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859756; x=1775464556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=GVFfPTvFHevi0Xd1DzxX288NVcneDiQ01i2uXbGH47H1GIz5qkyz+G/RvVHdWz/nU4
         bP7fWvPQBdIpqTyCYJAeGQcwYBRPFIVXpNWfvarikz116j5ESyBd/6YS1rCEcuv9MY6c
         elNqI1JCS/xIRN3auL6KNj/84CJv1TTTHQT4UnayNAzpZYWbCRx5YfhfitbMfYxbA+t0
         sc4G3svSE2ZvxvfXvNsJN+QJ6pZMTB53GyVQ6gjrL5JmnvxDURt0B/z62fkalHlA0JPu
         HBjazi+bFaBxHGVtCu7P+8Aku/mhxhnyCuUKwUbXAqQxZ18CVGg4Xt6EelOm3Y6nxJ27
         ltvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859756; x=1775464556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=Dxg8fAholEW4dogokGFKwZPjACs2IhiiqioTrPxUwpr9eSZ3abJC/32/JX2UbMFdsM
         ySRxai39TbfEMRIeNpZg3AQ/SZceUmkru4Oc9XiZ99ZCwEnyAljMhDM3XaKieo+wLepb
         37AwKo+7GOIQfUSYdFLZfP25uTq6h7Iv9zKlOJa4RXZ83DHQTqABJNccnSH3XvU3DUVj
         QVA0vCU37jk/RSmQ978qXQx8q6NN0jMGVbyFZy/Bse//p08uGQbB3SQFMm+I6y96+gMR
         tOBHatuFJ8yoF9vxM+NRJy1sU8aaFEVpjzc0Nddu+Jo5BTIFy0oUgIFj7osQUmjzsPlV
         MIRg==
X-Forwarded-Encrypted: i=1; AJvYcCXlPkIHRzQtv0hBAh4ErhX7pIVKm/IuVEuxkMSNb/jwtPuU+8iLdXY1LXg4aJ2M9+uKlGJUjzfXxZr3j0QX0dBa@lists.infradead.org
X-Gm-Message-State: AOJu0YzAdfXvb8D8WsW9ifcr9/aGqqnLvuZ3vKJfCkqWxk4aJ0WRtA4P
	rFba2jEhPn2d6E03+lejO4TfTyrQSpC5FfVwsHdfOl86iqjwMt3RCm3/
X-Gm-Gg: ATEYQzxR/reRsYqQToPoTzdsbvSQuZYv67xPcT/Q9TOIstC6QAbJqUnnVwZNg/Yk/y7
	muQ14r7yjgFgYq48NJK4jT7DVhRaiFcffo6GLSt3x1d+1znILdTpvYmnIuPfr5IYGQWQUWLgnMK
	nZK++vUQFAuIFkIPkECRukM37TTYYVbaB6xa3I1mVz6Q850H6NV7hQD9HbZLFclYGqyAYC/XMSN
	zycQj52esKZNYIY+tVnfL7wItR/biQcNv9WWAOJ+aGBUZFhMRnJm0DfkB1XdmmRveNMu6d7L1yH
	ZLiSdOoybwwKNXGv73BCiljeOkpbLBoO0SuIEqZY9zerv2Yc9Pt6AJr+8Z6W0Z+RdjmY2lMz3Xc
	HgeaPAgWAc+fbu8DgrF/sJ0GZzy6Wm7rBQF1/57T5FE7WuNfCuBCv1DDOvJwqSnhmi+Vb1lgDlQ
	MxQDdNEhxnG47fgWkSKvOUmuMzfVxOIA==
X-Received: by 2002:a05:600c:4e15:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-48727d4583dmr192614775e9.6.1774859756104;
        Mon, 30 Mar 2026 01:35:56 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:55 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 30 Mar 2026 09:29:40 +0100
Message-ID: <20260330083429.359819-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013558_315358_717FFC40 
X-CRM114-Status: GOOD (  13.41  )
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


