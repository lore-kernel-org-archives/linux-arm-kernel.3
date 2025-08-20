Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32A4CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoPVuBStBvUM57EnDHdyDOSI/MqVu22rPsFJ0LZ4BLU=; b=c79ucLEkYw/F/foaRtEQC4vVJh
	ERcNCu2jZQudoaGHPDPI/7ZdUrpGBscjFjxCgmOmfXxfwBrlWYQUI78pveZhSwBbwdRQhT8tLSiL5
	Cn7PBnqOU6SG6nN0jRclD6LgiiyPqgi0BQKSncx1/ChBZUDPhXQoTPpZNaDK/fE0//fPTMiBRczba
	Tc9BhJAOqvmortY9w/yx93325xlhN3ztURjmdw8mRth5PAdNYdwxNo0UB3Y+Vp6d6bj1hOv0BOo3O
	F37WsepWdvbCJL5DqApFFy75Ze2S7v2A5kl7GlAZkzVxEsQuUamOoi8Uh9c5V8Dyxd/yHteFeRCJZ
	ZglYHtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoq7n-0000000ExjD-2gIx;
	Wed, 20 Aug 2025 21:13:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomPD-0000000EVGE-1QTS;
	Wed, 20 Aug 2025 17:15:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755710085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FTnWVGb5ktCfnaCYrS5yenNeDc7vDsN2aJVUGxm2/9Cqcw4eVg2x/EiacItHeT5AIYXkxGEnWkocJbTpl0iy17gLUoHAlorkG3/lX+3wpyszhE/dajidQ5il1t6s5duZOmHXmfZa5/FbW71YZXchwW5mH7c8a6F+psjgPKpX5M8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710085; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FoPVuBStBvUM57EnDHdyDOSI/MqVu22rPsFJ0LZ4BLU=; 
	b=MTv/99UW8etAyy5/38QR+E2c+ZruaERBMxdoqgEreTKCTZ09U1lN343bk9qUCYH2PBx3GVug3n5QHkIUu2u3e0nclzcRkZkJIePFH+KjzD3aPGg6GUAfG4Ae521HDkvmYOc1kXcWUWr3mSf45kMXm0/1zsj5OvRc+5JPJxWUAvg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710085;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FoPVuBStBvUM57EnDHdyDOSI/MqVu22rPsFJ0LZ4BLU=;
	b=jGjcsFSKI9tNIT2mMc7ULHhV9VXmZ2mN8VTO4r4iatqo2USNHECT9uTRPAvRboVX
	7dseJNDMWoP6p5FI3rov+csDBr/HAyoSmH/HydhHOxtDjdVGeJsO8eo/iVBltpuH39e
	z9+rZe8b9K7VCyyS4CvyFRyVSsAyIU0yJ/VhAeIA=
Received: by mx.zohomail.com with SMTPS id 1755710083545671.3749174712098;
	Wed, 20 Aug 2025 10:14:43 -0700 (PDT)
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
Subject: [PATCH v1 03/14] dt-bindings: arm: mediatek: mmsys: Add assigned-clocks/rates properties
Date: Wed, 20 Aug 2025 14:12:51 -0300
Message-ID: <20250820171302.324142-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101523_437985_8A500863 
X-CRM114-Status: UNSURE (   9.02  )
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

Current, the DT bindings for MediaTek mmsys controller is missing the
assigned-clocks and assigned-clocks-rates properties. Add these and
update the example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 3f4262e93c789..d045d366eb8e2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -68,6 +68,12 @@ properties:
       of the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
   mboxes:
     description:
       Using mailbox to communicate with GCE, it should have this
@@ -130,6 +136,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/power/mt8173-power.h>
     #include <dt-bindings/gce/mt8173-gce.h>
 
@@ -137,6 +144,8 @@ examples:
         compatible = "mediatek,mt8173-mmsys", "syscon";
         reg = <0x14000000 0x1000>;
         power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
+        assigned-clock-rates = <400000000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
-- 
2.50.1


