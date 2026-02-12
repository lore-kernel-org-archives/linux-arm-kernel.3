Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CABEE3695
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZgZh/Rl+E/fs1x1zIL5h9Jc88D7SbPt0exYEgqnWeE=; b=2wS9mwscgosFcLieKQwDSdBYwf
	mq6NIllLa/RXJ07z6hlbvEazmDJPYSzXVwpMgPlZxz87D3NxbrJDbNSaWEWb/N8tjpfm/v+I/LlF4
	vK8iCBlcVsmzghimIcVbvTdQpHRT6Aeo4rbNtSKlWjj5VKeMTSnrUPN6bi/WytafiEbKZfpj40ZU7
	JrTWWHwYNq3bhA0RQbyOlIJocG3EYZMg4fcLzl4cpUXtCY+HPd2kI7E8l1GI/qXhDBUnIreRnMmLX
	SfdHKxYTN6Oizuh8XO9wSbxt5TXBnGvc7P8I3bUADDBfsTNPGyabdnN+OZMKDyo06Zvr91SulsmdB
	nxnz/DWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYhF-00000002HA2-292f;
	Thu, 12 Feb 2026 15:33:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYhC-00000002H9Y-0w0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 15:33:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 35554C23DA6;
	Thu, 12 Feb 2026 15:28:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE4DD606CA;
	Thu, 12 Feb 2026 15:28:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE86811971B29;
	Thu, 12 Feb 2026 16:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770910067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xZgZh/Rl+E/fs1x1zIL5h9Jc88D7SbPt0exYEgqnWeE=;
	b=oS49II96l26TrTW/awl+bmSz1iSh5Kq1IJOgFVETiBGM548rLYNTnjFGr7Ghz1C4wEESo3
	/Z4Ys57xQAz6fRA4xUtser19qWpinCg3XguSpxyJkwmkb9MbP19Tgk89g4Mif8qxa/kfDX
	wHgAsITVUj8uKc9rzXBcMfBf/WTfQx1r6yTf+A1Oajmj0IUsuHZxtBXp96VTI6BLY9HOaa
	PQDu8TVxu1dOWSWDqLqBeOXq4Ej4H1b6OpO8vkONu3wPQdfdmwu7p/x1++D8E8wz1bb2Gc
	fLheCV/KfqUpsZQo4znSLXJzTMP5KBVEJJjZwgqGYslWSflA+WxMY2u5DtXK4g==
From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Date: Thu, 12 Feb 2026 16:26:15 +0100
Subject: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
In-Reply-To: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_073334_434228_0A338DE1 
X-CRM114-Status: GOOD (  10.12  )
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

Allow overlays to be applied to any DTB. This adds around ~40% to the
total size of the DTB files on average.

Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
--

Enable overlays for all dtb similarly to what has been done for arch64
TI boards, but we could only enable overlays for Beagle Bone and
variant boards if required.
---
 arch/arm/boot/dts/ti/omap/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 14e500846875e..52df04328aff2 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -175,3 +175,6 @@ dtb-$(CONFIG_SOC_TI81XX) += \
 	dm8148-t410.dtb \
 	dm8168-evm.dtb \
 	dra62x-j5eco-evm.dtb
+
+# Enable support for device-tree overlays
+DTC_FLAGS := -@

-- 
2.43.0


