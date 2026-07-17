Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7E7C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=; b=Od7y/KZkLtJgc3X4Ste1cn7vuB
	BkprJDwFTa+oFUGVjeNQMvKFXHSzwiUgHbj+xfWmmA6Dfcr89SSKLSi/QRWwvNXX1M/BCzk3gjd1B
	QyyTV8zET6XMvarEzTOubBMYzuqVd6DPOS4L/JqxXzXpLKgLq+g4HMHafC0ItroueO8yOGi90pn9i
	fWi+PZjtlDBfS+fuRk3XccT5sgM9KPIftFFOAi3jcvDhV/a8dubq9RG3HAGe5smAuoTPqQtydMXs2
	9DSD9ryLwBonh3AaHXgxTMX9zrp8Zf1RRH8DZKvja8MHID8zgHw2BOYjLVuA7eveC7SbUSl435kbk
	WK0wrjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHP-00000002ZiC-2189;
	Fri, 17 Jul 2026 15:15:11 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHH-00000002Zb2-3qUa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:05 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so9482324a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301302; x=1784906102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=YQO4hh2jiqSNnGC2Ozb02J02NGcWmXubpDS4SjS48CO3A1PXjfZzXc9jmiLc9/I8a5
         POvWgkOOzzVKsF4pbbd7BiPtZSdAmo/cofUtT/jOqgXq8Nz1RGONiAOq2FlbLa7y+miR
         5iHROuK14Zk3UIK/4cZoS4L7HMex+JwD1wjbiT2XXE2yLXXB4K8bwMTPaSnVrxG96kiN
         FUAR0dUvVKNE+UxYvoulag2jRAsnAmu5/yFiycUb9NHLuSpmvyCFTjN7APguMbaNwEVW
         lwXUmaJ+fVKXMJtvDCIJzhl9UiR0sNwRNB3j8mPMRyTqFjhJ+eg7VTtaZ1xY6d0dKusA
         Djow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301302; x=1784906102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=tO+1Fv8IDY1fP7Z0UVyuYzE6HGHXacqUgZYm8tOUM5RQ/2Rg90A4zkLZSVgxFfl41/
         /GOysfibnTT1cuC+mwVnPNx9+2ZKfwSIs2jAEDZA8ACJrsZn+f0nTeFQjWA9YoQ0MwWD
         O/KLhguqWYKZK5P51P0wq/Qqlmldye2swxmBX3PU3W3avZ3PkAK1AhlurmCbHNPi68z7
         g7nq/7RcTX873g7wHDM4RrLAVB4Qt4SqclmeVoO48smZ7+2sRyPhF4dN8qk1fAp8vin4
         7b5w5IAnMuXlKJxZ5jtH7nBjK+X03WDRDzadqkuXQt3wW4zj9i05bk+7fHVt2Bxi7JiD
         WNyg==
X-Forwarded-Encrypted: i=1; AHgh+RrYbTJfy08JOOeDtv9EvqkpUEuWT4sSdDAMX945OqAhEdmBm65xgkhUv6JIrnSOS+20FHibcUsVxTPmiCBC4EPz@lists.infradead.org
X-Gm-Message-State: AOJu0YzHvjT5asf0JQtRq/DaqQsssx0H985jEdAn/rm6C3r+60Pn9rel
	/cxFOEinRFbzgsmNOAxUt88bWVJs//sK0mCtvCU810CMIyA95b2l/pmREru/jfM3
X-Gm-Gg: AfdE7ck/HuDuwOwJ1PUbCdX2VaRe/Fs0xRgbYsaB540NHODjw1tmDlcjBsOa4CmsYZZ
	BtardV+9yvAd3Kbzr91evu644NBXv8Gmavr/ZYWf4YcO0nqc96atnRK0jh9HirS7eRKphkImnTb
	J7wLFrdYJUGNJ1VvDfWa2EGdwwRyq9iZtc1Y0kau8u/ROeVvQG1QTp9aw83gfnzJF2hcZNp2rs3
	xJBjYo5YeWLV2ZBSF7K8aL035mXfiDmkwTqp2XWkTKiOMPvVBu1UEQmPS6PQ3LySXTxV+mwbW1h
	0pflHyF2jLc5ukQP7j2kYoqLG6VNpbxHI0f3WHqQ6nWPL9UPTYanzxCIDb0rfYN8HkVjBthloI1
	Sdn2awHZLzWSziXlXjQNwiJyaiMey8eqmAWgx6+Snac0I2dE8CF7XeYdktef5oAMYmIrDDUHRUQ
	==
X-Received: by 2002:a05:6402:504f:b0:698:e614:e4bf with SMTP id 4fb4d7f45d1cf-69e6516b4abmr1042998a12.0.1784301301694;
        Fri, 17 Jul 2026 08:15:01 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:01 -0700 (PDT)
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
Subject: [PATCH 2/7] watchdog: mediatek: Add wdt/toprgu resets for MT6589
Date: Fri, 17 Jul 2026 17:11:09 +0200
Message-ID: <20260717151134.678839-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081503_991866_E5EBF18F 
X-CRM114-Status: GOOD (  12.80  )
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

According to Android sources, MT6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..e61f6ae74327 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -493,7 +498,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
-- 
2.43.0


