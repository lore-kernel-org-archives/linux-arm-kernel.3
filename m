Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3867D0C5FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KxrytHmxkB3KbKiG8V4DcHZ1mCc5pLP/FlD1m68qCP4=; b=yxOJEMH9Pn+NA7YPM+c3JHdgJe
	ZD64JTWyiAzJVDnp0z85A0OHW7RGQUshL0t3y2BpMgF03O1TTlpRevThGjd1ar7N8r3huNoE2R32Q
	xS/F+CtCMo9A84mA7ahlJaSvLUbBIPh++NU4LiSCRVwLIp5+9Cbx61+FYa7pF05ykg+unWKu7fiQ/
	iLn2gu9h5VZRgkauncRKchFGH+aW0xso1bMcIzNYWxZu/sFczcGd65WbER4Yvcl2lSG1C2co1KSQS
	1mlq/F4YKkVDK4kKVyzwtjwZrbyT3S1XLvDvP8xMEfJs5M2ouscEK8p4TE5RFeMu6ipfCGVPmPKUp
	mq1ZldMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hy0-00000003QYv-1jKg;
	Fri, 25 Oct 2024 10:54:52 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hmy-00000003O8Q-4BYt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:43:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e2bb1efe78so1243407a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853004; x=1730457804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxrytHmxkB3KbKiG8V4DcHZ1mCc5pLP/FlD1m68qCP4=;
        b=dCem0tfQNdo7k7VS4bPvlYc/mcOzVqjcBTa98yz5BLhRCxD6KgteZ/jf0e7tC1IYRh
         bkQOBFdN/OzOuSOxi+5h4SGziQNKGHdfTWySkP++RByuoGu2TNVkWUvonREu+lKjzipd
         X+Sn6N8PmKOA61jyvZdpD/bJDf0G1flfXTIEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853004; x=1730457804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxrytHmxkB3KbKiG8V4DcHZ1mCc5pLP/FlD1m68qCP4=;
        b=D1t1OiOsCrHaAGjtaBkXB9ydkIATnk+fXfwXBypfqv7/riQrc1cOYmImezrECNqZwQ
         tf7eV+C2s3jH60j5sxN6Tss7YSYW8GAbG/2NhMJ83B1mO12F+ZSLwTeCvOLFlqpLrA9U
         j1psP7zjWegoIPkMd0rmk775sZ7CqlHGa0ueaHuIMMp6O+E61nEhjz+HT6X2wjAkUwIB
         Mn/xezdhDY8K7d06cKn/5ZqTzueMqzvIz3iVwa5zFfrC6UcduVcdeQBzA2+XnllJX8hF
         R6KQO596AUHPY/+ZC3SOur1J9/eA+Ww2cfbG3ZE/T3ABF+JCCCRejl1vCAZ80/1q+ToE
         7rfw==
X-Forwarded-Encrypted: i=1; AJvYcCWgC/Q+nOguxNmUFiaW3TH6XcOUPGJg7UlW80KQ9zjfhDBz4LWKqlO6YoJuBRqryg27/CnHtpxYQeCsrGDQzrll@lists.infradead.org
X-Gm-Message-State: AOJu0YzDqafLv7mjDDi8PkXWlKgU3OBZCLou3pve+d7ZsCucvq05ZOXr
	VveHwe4IDMQmdsHgjOSlVgLZjHdy0tpJ8nGyXebzul/+hDHoMcs/k1YNJ9TuCg==
X-Google-Smtp-Source: AGHT+IEc8DWXdGFrPxI2fzHPjMeSAyvo7Jul73y4KLbJM19gxhJsddXsu1xMH6CPalfcWwhWNeu3pg==
X-Received: by 2002:a17:90a:4bc6:b0:2e1:8a41:aaba with SMTP id 98e67ed59e1d1-2e77e88ddfemr7745822a91.19.1729853003888;
        Fri, 25 Oct 2024 03:43:23 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e36a26aasm1093307a91.27.2024.10.25.03.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:43:23 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: display: mediatek: dp: Add #sound-dai-cells property
Date: Fri, 25 Oct 2024 18:42:45 +0800
Message-ID: <20241025104310.1210946-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_034329_261958_AB05462F 
X-CRM114-Status: UNSURE (   9.25  )
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

The MediaTek DP hardware supports audio, and the "#sound-dai-cells"
property is required to describe DAI links and audio routing.

Add "#sound-dai-cells" property to the binding and filter out non-DP
compatibles, as MediaTek eDP doesn't support audio.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../bindings/display/mediatek/mediatek,dp.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 2aef1eb32e11..c05c2b409780 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -42,6 +42,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
@@ -87,6 +90,19 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt8188-dp-tx
+                - mediatek,mt8195-dp-tx
+    then:
+      properties:
+        "#sound-dai-cells": false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.47.0.163.g1226f6d8fa-goog


