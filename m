Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4F5C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XSWaTM1tBQVfHgrp4sw1lVesZlq79impBsPYXVNYsQ=; b=rsA5GfRqhy3XjP/MGBROmdAmFG
	Jn1QWhqw8ZvWl31uxtHN++/q06CeWMrgFcrNx4CSuLV1R0A4APYgvaln5GZMAFQ92E87PBC5fydxd
	CarBCXaKt8tBWs0g6jOQljnS5Lyq6aWOvnEjuc0VAGuu+AmGNsz8kbxxdpTJCiXEDuDcoJsUIQcbH
	8cDr07erQ4O0l2px++qpg1F8P8GYU9Y+/Jyw2Dv93/eRF3S+VTDo1rZMRPq/VPIp2/rzButMQDEB6
	Mfj2RsUBYwnEWgGCyOIbSqVn9K6o6D6J6Ls9jdZ+vQXT8Nj+hWqDL4GWYRyU9XEB4RM5NIWcQcSN9
	2MpO7A0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoT-0000000080i-3leX;
	Thu, 16 Jul 2026 16:19:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoO-000000007xF-1zUr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8487214ad2bso4911078b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218788; x=1784823588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XSWaTM1tBQVfHgrp4sw1lVesZlq79impBsPYXVNYsQ=;
        b=m4TA0o5QdrkKwc+t5z953vG10n/oH7w8EruGrDxFH/rV4nDVPDK4ecd4suJn0HcCPs
         +zefD5u9wbW7B4miQMs77K0JItxgh1GRdADuq6LOYtCMh5w/6EP5Ub1nCpkk+4s0GGzW
         fItFmiN+GmB4wIWd+K4PxgTMpsyAKuoO006n2rhcv6v7Z2OjtMWhyNIR/YAOPm6eGAte
         3M6htmu7vlvz8QsFA4LMhZjIBVkTmnspR2//ZWLlX2OMK5URVKmJvkofHtKcPwoSgSGN
         gyNus0vkpREzalxRpeIaKw7UJrE+d1ZaPjyGd8+LEZ+vo0mLl7VCOup5qrcKLqrKwdJz
         ifBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218788; x=1784823588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XSWaTM1tBQVfHgrp4sw1lVesZlq79impBsPYXVNYsQ=;
        b=d6xJCl92/SYOQnEDSLR5+uLoVBNSEMMkE+wZOYrEWaYymfXHPdIpPqy/QQsElwGtZE
         qAuM3aVqsfDbcjwgnH7ZsW/Tww4Bh+fkA4dAkF53/gH31RBogjd1XGZvSfUm3QbuBncw
         G/FCLBB3zcu+LMsGHZhvaCCpfWzpaK+a625s94PmioBLt5Nm6z0/RO1eL+ejmCGIxJSp
         POehbc6hWgBoSG0gy2RyLJuS3gwmit3t8NF3NbcKmJtYcj+4C4VPIU2yhKJc6ajlSGXY
         LVqBC8y7sk1y9WnBUbGXVCS+7MqbJitFLH91lkDvsfufhmJxnvlYqvV0YnvEzdlyFTrz
         RMVw==
X-Forwarded-Encrypted: i=1; AHgh+RrlWbg8NqQHtPUNO3QnHV5fYc50fUw0K2dza/sDFyoDt+E6Dj68hsJ7ZJ7sPuB7vlwam2odbElJ53iE1uK1JW6A@lists.infradead.org
X-Gm-Message-State: AOJu0YxP2phxBbla4O1fi9kd6MZyGPDeP0ZeftaMnm5n79n7QWdXJVSO
	65QUMwY7p7RQEoqreoN6NmkenzL2yBDQukOf06C9/a0fEAxm+Lof0U+p
X-Gm-Gg: AfdE7cmxOzVpkbOEmJBqAUKaE2pnP+cyLSom7xi4xkk4kqFKLrbZR4KoP57PV4Fiz5i
	uA2pUV8nQ8e+FvNUeUopRT0jFSyNUzWGcO4ZJ5+vAJi4t+xOyYzXaE8g1dyAqcY86sD6YBw+Ns3
	xya2YD3bGLl7joAJNu01aO3vZaPsAcODpdt+7/GUIGKYIRXNHEkjG1zWjDtLSwgmsZbb8pBAKEP
	uExd3kbEN1In7q8C9fsJDI0UTCgIAYOizJAU6vGclIHWBUA17YP9jYeGcX5i29VR4SyaRaCwiUK
	5Pz19AB1ZbmYlB/RgYQUnvF70dq6gCYttRs4gkkInlxvGf9YoA+KWSSRYef6NE1IietWMG2YIIj
	sOjk0ikE77Aa0t0MDYFTH190Pli22+rOKAGTjBmZGKyoxoE+MOafj9K89W6ddNVL9CUMOf/y6cl
	OKUXBD4gOfSk+bANLeYFgnsJH2Ak/BqxpmLQ==
X-Received: by 2002:a05:6a00:9504:b0:848:6895:b754 with SMTP id d2e1a72fcca58-84889643b57mr24897638b3a.28.1784218787589;
        Thu, 16 Jul 2026 09:19:47 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:47 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 1/7] watchdog: mtk_wdt: add explicit compatibles for SoCs using mt6589 fallback
Date: Fri, 17 Jul 2026 01:19:17 +0900
Message-ID: <20260716161923.266315-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091948_514331_99E872A4 
X-CRM114-Status: GOOD (  11.09  )
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

Several SoCs currently rely on matching "mediatek,mt6589-wdt" via the
fallback compatible. Add dedicated of_device_id entries for each of
them so that the driver can match directly on the SoC-specific string.

This is a prerequisite for DTS to safely drop the fallback string.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..345d2e89f414 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -492,17 +492,28 @@ static int mtk_wdt_resume(struct device *dev)
 }
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
+	{ .compatible = "mediatek,mt2701-wdt" },
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
+	{ .compatible = "mediatek,mt6572-wdt" },
+	{ .compatible = "mediatek,mt6582-wdt" },
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt6797-wdt" },
+	{ .compatible = "mediatek,mt7622-wdt" },
+	{ .compatible = "mediatek,mt7623-wdt" },
+	{ .compatible = "mediatek,mt7629-wdt" },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8173-wdt" },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
+	{ .compatible = "mediatek,mt8189-wdt" },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
 	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
+	{ .compatible = "mediatek,mt8365-wdt" },
+	{ .compatible = "mediatek,mt8516-wdt" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.54.0


