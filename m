Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D68CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5ce2vnAWwshsgRlImURtynlRilgSXboTdKci1gbEto=; b=hsTuk96i26BJpT6Gr8UGiMin/0
	7t60MFFfA/4QEFOp37rfwIOiDLIM3RcET6KExDSsQjPvoQn5a13FrwMEiUUtmvgms6EkPoXWwlLrD
	YO5B6kTqwlMfYDUJOT6lWwZvFs7eGyk0ikq+tp3kgRarcfi1TlTVzh7rzognfdmzgDOP4iIQLyg9W
	JNV7RUL0yBPTJBN4QDBMBIoLsBEG51EFRGFjc+cO53VcwQt4y2uYTiymgb0ESDk2XLrELBpitvVfd
	pZO4rSMhZT9KfVKC8jaL+8ifWQRSkuk5Vm+j075LsxtrSUwW++dLpG9GdXzyZX6Ld7PfgWywBDHu2
	qbuh2I/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqI7-0000000Ez6y-1mSS;
	Wed, 20 Aug 2025 21:24:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomQJ-0000000EVW3-3Rns;
	Wed, 20 Aug 2025 17:16:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755710143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hNLFFnLSVZfTH6obyIu9vB7kNyghZB46uNT/owLhChrUkt43dDp2CiEQBc+X98R/RJRqrt8h+Oh8iX1T8k1hBjdOBqxq294Oqq6cRySvRmUWN5ryFv2Ledz+zouEe95+3GYLPbhUHsYTT5w6kwyrvGkceVOn1PLKaH/tAAQNy7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710143; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r5ce2vnAWwshsgRlImURtynlRilgSXboTdKci1gbEto=; 
	b=XINCOMJQ073ZT+t6eryGdxXhIaB/jBYBRPnSaFtbLaOn5zu9/TdTolsWmTqZxQObonwiVm4YUHl43pDT2YbIkXmRjm+B73eBf6c9tyHuf2gfGmAE6lAlxz0uR+er23XIuH23SLkD84Q52L+AoEONYXjTS9OvIqS/CG8Dx+UCR9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710143;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=r5ce2vnAWwshsgRlImURtynlRilgSXboTdKci1gbEto=;
	b=VQR9NnG/NVAZ6T9+0zthHG6IpuE7PIoRMgzP8KW0dXszaYXMff6R+3xjuF42A0sn
	8XLm3HIMEfXrvoqbF4PyQvwSvIGPPmgrr/fBKUfjbfRIXa6ss5bVfcaFZEOPZCh+z/I
	JuOaD7CD1Vln8Bzn3QBp405PC7EtsV50hWldI21o=
Received: by mx.zohomail.com with SMTPS id 17557101417048.584499419248232;
	Wed, 20 Aug 2025 10:15:41 -0700 (PDT)
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
Subject: [PATCH v1 07/14] dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg property
Date: Wed, 20 Aug 2025 14:12:55 -0300
Message-ID: <20250820171302.324142-8-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101631_910119_C992EAB1 
X-CRM114-Status: GOOD (  10.16  )
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

Current, the DT bindings for Mediatek UFOe (Unified Frame Optimization
engine) is missing the mediatek,gce-client-reg property. Add it and
update the example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/display/mediatek/mediatek,ufoe.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 61a5e22effbf2..ecb4c0359fec3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -64,6 +64,14 @@ properties:
       - port@0
       - port@1
 
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -77,7 +85,9 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
     #include <dt-bindings/power/mt8173-power.h>
+
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
@@ -88,5 +98,6 @@ examples:
             interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
             power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
             clocks = <&mmsys CLK_MM_DISP_UFOE>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xa000 0x1000>;
         };
     };
-- 
2.50.1


