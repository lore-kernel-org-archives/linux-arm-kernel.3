Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89343C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEEAa29K82FIERUR9PDaVGFQH+K+Jr3FsqpVw9J+V5U=; b=yQzEbNlMnBV6b16SLPWHFErmWQ
	36SZhjtpbn7CTwtEkQhT9i9KN0ouvQhEGF6yNW/Ynch0LAz1zWwKen59KIGSxEw/kMm/icA+NYBgw
	xdW3OJz+Zee3VD6CYATSmY/oytARx6t1Eq+eE13sSdhgOepyjqKFKHTrAMWIynaiwDWvPCGOzAYxV
	BZZrHlrMmIUoNx/PbnZHqTa6FIzIkC/16eFFACMZJYuAXAV0f0QsPAuhF53uCcEM/gmBkpQEYaLvF
	tdVpKzL7r2Cb9uZszwXk5zsDXr5eo5zOLCLfgCvvvSk+PAND9QAu+BZzPeIFLDvE/ik+x0DSQGx4E
	BrRL3OmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfb5-0000000ANEA-2OlM;
	Thu, 10 Jul 2025 00:57:11 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf29-0000000AJOm-2RKv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106863; bh=o3a1bC8AN1reTFYV1DZL9sumN+dkxNJ8J+cIRkSOHq8=;
	l=2392; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=SR5H6bthxDFxdS5cyI+hWgdw41e3CnSNSyPkSZ6RBikniRnyU6gkSV4fjpI03JhQz
	 5XtwwWM/KrrvlQZqPaiX2eBMSO3VvXDKS0sEJlm0Fnk0iSFmxqlt5rFaY0ZZaDHuTU
	 g+k7aN7unBUfet3TtSP6+s9FrFGtH91MBz9N0r/4=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:21:03 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ksk4725@coasia.com,
	smn1196@coasia.com,
	ravi.patel@samsung.com,
	linux-arm-kernel@axis.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	SeonGu Kang <ksk4725@coasia.com>,
	SungMin Park <smn1196@coasia.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	linux-arm-kernel@axis.com
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 13/16] dt-bindings: arm: Add Axis ARTPEC SoC platform
Date: Thu, 10 Jul 2025 09:20:43 +0900
Message-Id: <20250710002047.1573841-14-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172105_889031_7EE0EEF3 
X-CRM114-Status: GOOD (  12.96  )
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

From: Ravi Patel <ravi.patel@samsung.com>

Add device tree bindings for the Axis ARTPEC-8 SoC platform
and ARTPEC-8 Grizzly board.

Also move the existing ARTPEC-6 related bindings from .txt
to yaml format.

Signed-off-by: sungminpark <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../devicetree/bindings/arm/axis.txt          | 13 -------
 .../devicetree/bindings/arm/axis.yaml         | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml

diff --git a/Documentation/devicetree/bindings/arm/axis.txt b/Documentation/devicetree/bindings/arm/axis.txt
deleted file mode 100644
index ebd33a88776f..000000000000
--- a/Documentation/devicetree/bindings/arm/axis.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-Axis Communications AB
-ARTPEC series SoC Device Tree Bindings
-
-ARTPEC-6 ARM SoC
-================
-
-Required root node properties:
-- compatible = "axis,artpec6";
-
-ARTPEC-6 Development board:
----------------------------
-Required root node properties:
-- compatible = "axis,artpec6-dev-board", "axis,artpec6";
diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
new file mode 100644
index 000000000000..70fb3caa70df
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axis.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axis ARTPEC platforms
+
+maintainers:
+  - Jesper Nilsson <jesper.nilsson@axis.com>
+  - SeonGu Kang <ksk4725@coasia.com>
+  - SungMin Park <smn1196@coasia.com>
+  - Ravi Patel <ravi.patel@samsung.com>
+  - linux-arm-kernel@axis.com
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Axis ARTPEC-6 Development board
+        items:
+          - enum:
+              - axis,artpec6-dev-board
+          - const: axis,artpec6
+
+      - description: Axis ARTPEC-8 Grizzly board
+        items:
+          - enum:
+              - axis,artpec8-grizzly
+          - const: axis,artpec8
+
+additionalProperties: true
+
+...
-- 
2.34.1


