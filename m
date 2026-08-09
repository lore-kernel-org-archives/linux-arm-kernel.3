Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F388C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=; b=pQA+u7nHe8l1YIpWWeiekipir8
	4hv0bY/l1npSH7lrlCZhxnYtV51eC7eIFAia8NyPr9i1tgpGHsYrrb2E8kt2J6mkfjOkxOOn3PH+w
	Yu9Tj6/4lPHy1BFy+Z+aAkFHeK7aQvk3swjELper0O6eOE+brYgQJOlN0IyA9CYyVP5K8WMEdjkFs
	HwlFV9B3c++5EKdBDDyuEMTAEGKbLUPuRxtW9mpZ3kfARam79rAbjIhiRAEuiuVb5fdPPXZVpPNJ3
	luq1ex+1a599nEbpapUtt3QEcOMdmTQRhgc3tEjRbWunMmEukz/INMws0vyurvSWotnXyqI8SGL2Y
	hoGsJ5FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63V-0000000ATQI-3Gav;
	Sun, 09 Aug 2026 16:07:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63S-0000000ATJz-41WK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso25029015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291637; x=1786896437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=ow52XxpvltpKmgD/HeBLj0Tvvg19o1/TaGs/YpX26q+HErmcanc09CBFZYOl/K0hQW
         QD1r5rVeXZ5prsUufPE4HG+kpjo7Z38eG5DO9fbeejCdZ+D4AAp7aBiaKMtjXMjBgOqo
         S18Z937c5IN74JYQD4l1GipZuBb3DaqVvAt2dgZ79x4pux+/aDEov+zrEkoeq4e1sQbO
         5QqEfvg06cCwjpRmsnEWLJezhjqLE1TIhRubUSjBhuzUDFa05iLkS46KjL7O7CpISt5o
         LJVl62IVKYI5Ni95wCnppWpQd7mPSHB4V68NdoYgUZvT/2sVvSS+eIXgzdJPsCQ/VbCR
         Q0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291637; x=1786896437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=CvcFLLLx230v9mT8NTTFffBQZbDxEOfAML63BUN1Ou/IHQT/YoxrwZvBLYwhRuphM5
         IuTyqxVmJePUgBgFex+q+zv1stfLm+q2ExS+S2utkpGbnwZ+kYKLz8j5PcW4A3G9yiOb
         5FoBaiRPdzu8mTSJ9b7JlJq28Vi9S/ZRRXusBXyg+Cgti/W6p3zSqqjTEzVOQYznCSyR
         /hZjg7f3nLalEIM33UZDVPuIU+nVTALesljzv0GPYSmk+GZNEjZf+tDiRheqFOfkXPuC
         wtUCF+fOYKwZKAJdhNYyTtDTpZe+2celGl0NlEdUYGBQTG9Xg64S141sdJPFJ5zlbJV9
         d8gg==
X-Forwarded-Encrypted: i=1; AHgh+RrdNMMtTEO4Z9A9X6REQE6qyIp5piVp5mmL/QJIlJnlfCFFFeKa/AfF27/S46Waq7/loy184E65mR7ZmyRWT/po@lists.infradead.org
X-Gm-Message-State: AOJu0YzVjQT7RirykeVYbz5riihwGpgsJNv1NHygIRp2eTVkq929vJ/x
	Znry5n+BmRYAq4ntj4buTEE9fuy9EEZj3B+mcExuiK2V/7FHbW4v00q6
X-Gm-Gg: AR+sD13Zl0Ymf3QDJuH8iOEaar+EVu9RqxQE2EQGgb1tzaDh7twKpyIL5iv8UZvUnBq
	lp5+5SCPkCdoV343uo0q482KnIy1Pmwoj5tQ6jsEIVJvhqL2AYPvCAxpKxzvyNBWTxju9rYXA1x
	DzSk26z5N0sXavQ3OnftgdSh15Lg6yIzdnerbld37qfXYd802m3B0QEarAbEt55I7a71WpyCRFj
	qWdGGb4zpPdQS0gjXV5QJJ1u/JUjId1P46CeP7xvGoJKdYJAnvz1FSKTEvl8C6ejdttXLxPfGqQ
	75UYb6j4LUmfTpu7f6tMGn8MhVpOiKcUm9ka9o7OzzI3utwhL5o/pA7oncR+esN1+1T5cM83SuA
	ufwsX6NVT7Hlf/sgcB1USfP2itlZ1ZR1FKVaxZPaw1S4Yrgh0q67uuUzkeK+TFQ13MPD/JqFMOh
	kDFhCGc2FChUzklMCaRMqRaLBke68xXtJiT75k9psxj3O8EX+5eklo3A==
X-Received: by 2002:a05:600c:c87:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49962472d69mr121132385e9.6.1786291636950;
        Sun, 09 Aug 2026 09:07:16 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:16 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 6/8] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Sun,  9 Aug 2026 18:03:30 +0200
Message-ID: <20260809160643.33991-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090719_036392_C8D2BAB2 
X-CRM114-Status: GOOD (  12.81  )
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

Add support for the Top Reset Generation Unit/Watchdog Timer found on
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e61f6ae74327..10a3d4b5ee30 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
@@ -110,6 +111,10 @@ static const struct mtk_wdt_data mt7988_data = {
 	.has_swsysrst_en = true,
 };
 
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_num = MT8167_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -503,6 +508,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0


