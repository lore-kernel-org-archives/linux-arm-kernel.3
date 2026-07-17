Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8EDC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=; b=r9qX85Ql6OWVk+j1eG7XoS0gKN
	FyvIs6i6iEnCMAexwbexI9ipP3IONemR/Ay8rIJbQ9tTm3LEgklfksK6Uvj7+zjaOFRvguoLJ5kXA
	x0gFnN2TxmR5md8/rNM9CreImfSWjGev4I8MP0eW4miXAXGg7B7M7qIBtyxBBTlIb0nRBp6uOzAc2
	bJ3BEz6scNcRINoD5CYareXAZWTWPx0Q1eEWirVjhbmt5CM5TZBoJfQd89OplHCoK1r6u+HQosRfN
	3N5aBzTFGGFZkV+qapAGelpzc8iloz9OMtVrkwkUxIF9ROCfjO5+yZ9rIU4TjQ1ka23Iff1jmcF2r
	OaifG0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHf-00000002Zyv-0e3X;
	Fri, 17 Jul 2026 15:15:27 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHQ-00000002Zhy-2FQE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-69e54d9c8c6so1894371a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301311; x=1784906111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=XPUUaIE9eRFPhNDNqDukkaLxgVpXsarlTA/ZpfHiediUG6vl3yDc1KUKJBk2zMi4Kp
         fz3qc6fADj5E5U/QCC+JljJFEYYNnwv/y3hU4YZv4fEKPBprQfad4qMZZD8zNpcrPZMM
         GtuD4wsC9EoO2iSKKudCOY4eNJJZRg/LH67lP48thMQ50NQ+EqnHDLX3fH8f4fKW53XB
         JVyIi47UOP5ofwQ/of53CYMokaZz9wSZge+Uq/HGbxr2R4tJXowWCkxXOGRlIDX8gDsV
         Df1VQRjP20HEk+eaQVo5VNFxgoV4XQ7QIoius/hGnexwKzMPOO0bETGVpSRoYjwtCefy
         gKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301311; x=1784906111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=dutVFb6e/V1afpeer+yN0Urum9hB5LNnAJTiiB3dbKkhPkIUMgap3jbvkDpUNEV7uV
         /SH0VY55yo4tga8h2iTNldoUNoYbVecobVWllEMyh/CclSvYNgzsOa6o1b1qrt0h2lsB
         RPZVya8M32ecm0jY3L52YfVLyaE04/A4AcM0Tnp5llykrd8x8OywkRk4HGBOfIUGPruj
         Ap0eaoSKcQNH71tKqDab3rGFUBok0XTxCf02ZzY2V5QtnuGO+TothaB+B6u5P+nV182z
         xsE6wEYdrIVlfcTRCZNL1ygHoS4dQACbSOtIH0lZ4ndPffBN9umlCi7Rc+1XHOI7Qitn
         Mvcg==
X-Forwarded-Encrypted: i=1; AHgh+RqcjyjdYo9yjw+9dznBJbL+Jln+flWd7Wao0SgvdC2TOAuAM1YCPD56TzF3S+UFaUxl7+TcT27RWiQo6z+eUUw0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+jY/ge+f0TorPvo6ij2o5JQbPUFEoOftytXL3RMyeXkQ4sqdv
	3Q1jbo8fpYBa21A7GZpvLsHFAtgby47nrl595k1l89lAOk9BnqLVGUvh
X-Gm-Gg: AfdE7cmqBWOTFRF2LRjGeV1MycySQ645h9d2NhB3+ItS8SNR3ckOTnDCAu7nU/yot3A
	KmIs5nnITq5mmBhthYe3LOp8AMrGg1a6WaqNI33r23dTArPA+9V2yZmdsXcztR4Ab2Jlc7D0bIg
	MndU8wUY950xxOIQI3iBVymD3nLJQuMhrlvejQdsmhJ5iUT2rakMYOkt4+lfmF75dlw7GO0+0qU
	joVR37X1fAx+KxWAKXsmDGymCZHShv0Wgis7y1eHQSWVFJVywWyu/8K515C2TsXRMrgwstBmTS0
	L6GbUO8pgi1DEHQf6y89mCMN2hC5mJ0x9CKLT9Zgo6nvEtaBw4Tg4Ov4NT/+geCCZ3UumqDi87i
	K6QNdjqr/KEN+TdLXvRBzPnNsLsjrK2MXpV92/Csi3/CbKApQWgLgzKdaUxhoIdomuu8V4yV46Q
	==
X-Received: by 2002:a05:6402:528e:b0:69c:7406:9492 with SMTP id 4fb4d7f45d1cf-69e652e1111mr1154154a12.39.1784301310590;
        Fri, 17 Jul 2026 08:15:10 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:10 -0700 (PDT)
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
Subject: [PATCH 5/7] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Fri, 17 Jul 2026 17:11:12 +0200
Message-ID: <20260717151134.678839-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081512_605946_A22DEC81 
X-CRM114-Status: GOOD (  11.73  )
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


