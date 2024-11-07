Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6F0D5AE76
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 09:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Juwn84S5vUX2aH6VsMCIM7pJOc3sVKVbXwLzJq3+1Jw=; b=ZS3awyVCl+1Z8EstqFhsbO5Fl5
	GCCqoq5VQeaNpYH2bxJzgOFtBDkx/P/ExzDuSJCWpYloVUN2RgVkl0LXzs4zs89lbqvrXxQjXKpWh
	j2Jh43/dvjok7MMJHYCQgcEnlXjTcbqOJ3tIjkfqny3F9fscXrZrK/M9jq6fM1T+G2w2ESjNs2iv5
	qJHK7TQWKPIvMnScfxAEhlxpSV4l8d9c8wAU5dkczvfTAqnYP6cJWISfyLcNGR8mBIQPHlBZsx18w
	veHIJD9C12in6f1B9qC+m+7xXy5y9qNW/TmxlPWMLXxSO5h2zga6y2tQd+HmM+tLq63Xy+YyTAn3d
	RXGizLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yOE-00000006ERr-1cSS;
	Thu, 07 Nov 2024 09:01:18 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yKl-00000006Dl3-2DWA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 08:57:45 +0000
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 32480891FD;
	Thu,  7 Nov 2024 09:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730969861;
	bh=Juwn84S5vUX2aH6VsMCIM7pJOc3sVKVbXwLzJq3+1Jw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZrhR2YFiEJSDeBRViCLCwwv1sJXOY5/PxxKtfkmDpYRzjSvJ3eD0Qa4qprD8iQL0l
	 pXeIEbpBGEL9otKCUwP7JWKDD+ARP/I8NhmAfEg2HbfmZ5UNdhY9ru5TidVLzqXbMj
	 A0wrsfk6WfA0HYpJYSXxSJM5Bo1zAX7Sv23x3dc+3K6fSuwCV3gMmGFvNjAwNioF/L
	 RMsghUxgakjOvRqqyBlTd38hxkcpWDNSwpclWRZqUlYPsLbrnXOfT/7X5uCLlH/QM+
	 WzAid5hldGQDCNnMn+fryDoJQWqEPgbnYhvY80xkjaBXSWAtggPFqXZ+/CEZ2zhla1
	 KMGuP4MN/+zYA==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v11 1/3] dt-bindings: display: Add powertip,{st7272|hx8238a} as DT Schema description
Date: Thu,  7 Nov 2024 09:57:03 +0100
Message-Id: <20241107085705.490940-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_005744_238397_ECE352F9 
X-CRM114-Status: GOOD (  14.26  )
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

This patch provides the DT Schema description of:
- powertip,st7272  320 x 240 LCD display
- powertip,hx8238a 320 x 240 LCD display

Used with the different HW revisions of btt3 devices.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes for v9:
- New patch

Changes for v10:
- None

Changes for v11:
- Combine both separate dt-bindings patches for powertip,st7272 and
  powertip,hx8238a into one
- Drop the quotes for in "title" entry of powertip*.yaml files
---
 .../display/panel/powertip,hx8238a.yaml       | 29 +++++++++++++++++++
 .../display/panel/powertip,st7272.yaml        | 29 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
new file mode 100644
index 000000000000..b7d74faeb5d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Powertip Electronic Technology Co. 320 x 240 LCD panel
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: powertip,hx8238a
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  height-mm: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  width-mm: true
+
+additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
new file mode 100644
index 000000000000..f3622800f13f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Powertip Electronic Technology Co. 320 x 240 LCD panel
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: powertip,st7272
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  height-mm: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  width-mm: true
+
+additionalProperties: false
+
+...
-- 
2.39.5


