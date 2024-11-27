Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62962D609CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDXSwxdQFKqF1c/3avYtLd4G9gMBk0YXaL0G1r3dLXc=; b=cjhbrnU4j51CV/bavnOBbty71W
	n5wjYIR0a1djI6qdtIVSoomUaXQ9FNBK2GzOY8UH3L9GdKN+5tTczAl2rzo4MpkUP//hpgt1DQaR6
	iH9Igyjm5p9XUgQmY48+jlGHaduIo679baidS4bgC3Bp6YqoGAQPZ+IWMMFE/MjV8bYOWpcePuN74
	Otriaim7pIwMp7qvNH0B1QuYJq2ub23JMOWhSaZjnoehg+UCvfkqZtbvHaOYbO0uDpzfxWeG/lWDP
	4tMOb4gsvWOqXTcOE5lnrEMsMz+uLpgyv2L879dk5or27kE0nhSuI2LWSa1fz86zi/zqpqtJv1v7C
	lW5tmhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFMg-0000000CraM-2HvY;
	Wed, 27 Nov 2024 10:33:46 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFK8-0000000CqvV-0Zlo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YDXSwxdQFKqF1c/3avYtLd4G9gMBk0YXaL0G1r3dLXc=; b=FIyOGmrPJwNmk5+OJm7laIa2/Z
	ir0dwoYtdw7FyovDD18pnqGkgveT4ngssKEaznw/AGRyt+LREHf0z5UBb1V+3EsyHAN2juTv4u/xu
	uu0MecOyXO1CFWjKrMQ9hei7Rb25PtLZ0ApM/wJ0umLEL62wjYp0/RyCuGLQIOj8t1Fe8/oWMnU2k
	8g67j2E8ybW8KjwylpZZSfPjfo+XrFdN4BudENEusn255TSLZ2mU4ASs4/jypJeMDENSWRvtcQS4t
	I82wv6s+TrMVO1vfLInB8TaGgZ9BCTZ4zCPomzcN/4nBikuz/XMmvYXu6+w79bZFqmOxilm/RsGVw
	7hsrZklA==;
Received: from [89.212.21.243] (port=49750 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tGFK3-007Rx6-2G;
	Wed, 27 Nov 2024 11:31:03 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional property ti,lvds-vcom
Date: Wed, 27 Nov 2024 11:30:29 +0100
Message-Id: <20241127103031.1007893-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127103031.1007893-1-andrej.picej@norik.com>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_023108_629941_856718C2 
X-CRM114-Status: UNSURE (   5.12  )
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

From: Janine Hagemann <j.hagemann@phytec.de>

Add an optional property to change LVDS output voltage. This depends on
the connected display specifications. With this property we directly set
the LVDS_VCOM (0x19) register.
Better register property mapping would be quite tricky. Please check
bridge's datasheet for details on how register values set the LVDS
data lines and LVDS clock output voltage.

Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 48a97bb3e2e0..5b2c0c281824 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -58,6 +58,12 @@ properties:
                   - const: 2
                   - const: 3
                   - const: 4
+              ti,lvds-vcom:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                description: LVDS output voltage configuration. This defines
+                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
+                  details on how register values set the LVDS data lines and
+                  LVDS clock output voltage.
 
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
@@ -78,6 +84,12 @@ properties:
                   - const: 2
                   - const: 3
                   - const: 4
+              ti,lvds-vcom:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                description: LVDS output voltage configuration. This defines
+                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
+                  details on how register values set the LVDS data lines and
+                  LVDS clock output voltage.
 
       port@2:
         $ref: /schemas/graph.yaml#/properties/port
@@ -120,7 +132,7 @@ allOf:
           properties:
             port@1: false
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |
-- 
2.34.1


