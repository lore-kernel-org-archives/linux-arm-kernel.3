Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE8ECA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjr5FjezJ3DnctvttPhGjVA1HSx0Nva4gNLgYPU187w=; b=Bq1ho5UmUuRtsTf2nUahY6TvaP
	MHkcoraKVnS/Tn0ssukmaCmVXRfF64565uzK4AKekFlE2awN/iS0sqFCTShyaTJBa3LHZ/LpgJhFn
	QnL93VjdF8RMdVnwYo9mcUwlKmlfsmWWzfHO1Ef/8NR8cWoeZg8iuaAMbWp8aVhSaP4JqftnnWRqZ
	tqMZrJH+ln830XPT6ZHixTQG37XiOmoKkEZuk/lLZes8TjYRbhRe4bdVUPcNhQOTv05VmVCISJcrA
	AlhXQTS2pqUe/KInODi5Q4hhXiyeze+QHLcZKrnwhPeoKD7Y5fuS1bx5rS8v10UadeUPiBgWorYZu
	oaE4otPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqUy-0000000F0Qm-2EPj;
	Wed, 20 Aug 2025 21:37:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomRJ-0000000EVnD-3gk3;
	Wed, 20 Aug 2025 17:17:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755710216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PLrIntXILnml1BIJ4BKOOJHB+dggwwR55pQmTCMNaVaL56E+NhRK0NYvDgVfAppUw9JSWVJF4Fb2oQ7s844Fb6gW5dijwYE/egCvJk+2C2BEKF2BsIRe+KULPPGGpmpVP7/0onVFbWiKK1pmkaC2wiXSJktd6w6mtkUVJjJGeQs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710216; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sjr5FjezJ3DnctvttPhGjVA1HSx0Nva4gNLgYPU187w=; 
	b=hwpkoa+EEzGcfuGj09O2DUaJhu3NH1zsClkAgUEsW22wBsHCCyvGcj9LqBtiKfEllRfrPVb3xMa+7t7KnRGSrgHLtjEYwe7QkRnvCZbu7JXwQkEme1TO05+5DZhzksRlJV1T7l/aS+3Y/QQGLWFxhJmMYfA7oxurqJ2abFqm1BU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710216;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Sjr5FjezJ3DnctvttPhGjVA1HSx0Nva4gNLgYPU187w=;
	b=TvxHDTFqL5xmg0YBTOXCeinVn4RGQeDw+WcChZtVbiilJeA2+ZvhS3b5GZr699c+
	6UrdZhv/P8WzDCeEE2MEmjb/0RYaaQXDKwMJT6YrEYVY1ahn0FkBWU6h0eYCGlZY1EF
	WwEmckYK+LJ0hx59BNRzJb/wUPwSR6ytm8GwUgtQ=
Received: by mx.zohomail.com with SMTPS id 1755710214216103.48931777604218;
	Wed, 20 Aug 2025 10:16:54 -0700 (PDT)
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
Subject: [PATCH v1 12/14] dt-bindings: soc: mediatek: pwrap: Add power-domains property
Date: Wed, 20 Aug 2025 14:13:00 -0300
Message-ID: <20250820171302.324142-13-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101733_968642_4266E8A7 
X-CRM114-Status: UNSURE (   6.91  )
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

Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
power-domains property, which is used in the MT8173 E1 evaluation board
as it needs USB power domain.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/soc/mediatek/mediatek,pwrap.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 4737e5f45d541..54c0cd64d3094 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -98,6 +98,9 @@ properties:
       - const: pwrap
       - const: pwrap-bridge
 
+  power-domains:
+    maxItems: 1
+
   pmic:
     type: object
 
@@ -126,6 +129,18 @@ allOf:
         clock-names:
           minItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-pwrap
+    then:
+      properties:
+        power-domains: true
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


