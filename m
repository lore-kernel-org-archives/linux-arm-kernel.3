Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD61CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=; b=teJ2WlJbEfwwEwFQ/8KwMfQ0Gd
	lpY0m9ZZO5bngczAMlkODj/zJVsQkZn6CtwztGjUnvL7ojErZfMglTVVuqxdWqFwzS4m5DIrdNg/y
	Rq+UF3LvhFSd5VD8XGwfoEqy7+//SkGfh5EuxD+/41vwnCqojS6ynut8YwRquRpP5LXfJMvT2htZO
	AuUTk2Yy8tAQg/makyo++8yDyKLEHCKoPdt4S+RyZPIJ1wDzPLbfuf1ms54J7DTgtiE9VpuKEMDd+
	x7OaEvLz6a3LqZLtdJnUUSj/3e6rPO1aKMnxYezWqS5Ddg3lZ3nM9IBmpMdpgUYq4sirj7YtjPHML
	eFRw7FWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqNE-0000000EzY6-3c3R;
	Wed, 20 Aug 2025 21:29:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomQY-0000000EVZr-1uT6;
	Wed, 20 Aug 2025 17:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755710172; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RjzT/f8YblOclyalWeryqHbLicp5WmRidds8+LWiFgwkE9fl7bT0/hyPj3LTqJeXSXAr4OAhcXLbqY2CNpvFD5a/wTcMkyamK1NaU2z7PVd5cLpgOygHkjR8yd+hWfk1jCO949KpeCr5UxT5erSCVBc6/TZuG8eMc+eOrW9rFqM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710172; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=; 
	b=kXi+D+/QdGWNCBtsnYxOQdLJXLRy3HbjU3u4lvvI5lzS18JY5DrPM1QAO2iL7441PZ9gQhXxWCd9BnJINXilS4cuVBqPjyHOAY5nXs52e9+1Ll0ruOe/vIG506nf9Xst3yQw0lIoZ0jLzDs8l2yEPgDsj4r9OlVouggGhNqSX8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710171;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=;
	b=YmQ2Juega/HOl6KnUF4i9NncuelEK2VPn9Fh7FH8d1kJ8KFM/jl89+DeORaM96Md
	tjbalhQof5uDLhfAcUBm9ze0luDTFvZORvjFzngrp+KwzKxwc+GW7XKF9YfD5upPrxI
	gO7DRXkvDMKT5w6X0EuHfQf0WPVePsiU/AzLub4g=
Received: by mx.zohomail.com with SMTPS id 1755710169818871.9439170647294;
	Wed, 20 Aug 2025 10:16:09 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	jmassot@collabora.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl: Allow gpio-line-names
Date: Wed, 20 Aug 2025 14:12:57 -0300
Message-ID: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101646_551345_55BCE937 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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

Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
the gpio-line-names property, add it to the associated schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index b9680b896f12f..aa71398cf522f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -43,6 +43,8 @@ properties:
       the amount of cells must be specified as 2. See the below mentioned gpio
       binding representation for description of particular cells.
 
+  gpio-line-names: true
+
   mediatek,pctl-regmap:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-- 
2.50.1


