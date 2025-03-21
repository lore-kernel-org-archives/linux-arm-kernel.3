Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E386C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sSLDnAdQaaRh1ug3/9steXZw1JYzt1ToQ27dvMkXSk=; b=vY2iBLb4gqKkz3ztn21pwl2Tkn
	AYwuW+o8BnT5ScYBPbFEHqqz/erCdxXUeHINmk64BWu8NcId11KJZGiu7+6JYxxDn28Cl1cGdLc5P
	LYhsgLXFGbmlCVc8B9VK6V3sxFYIpOh+2dH4azyOgkDLsvU8IpiW8T6ypUBt7wPgaAFQVLR1ahYCM
	NLTKclSA6zwr4kaPGa8J5KD3I3tfZjrHzsnfiWf6x9nM63uvg0jKXDyFzXpGmXB5W4768ATTt23z5
	/LdLMafY4qY/8bTclLpAW0stlvffosTY1sQ3pl6qH1xkW+UOGtmyVk4qfjYj4upcErC4EkVwcB2R1
	OJOoQmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviyy-0000000GAIV-28md;
	Fri, 21 Mar 2025 20:28:44 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvie4-0000000G7SE-0mxV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:07:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EEFDE101E90A8;
	Fri, 21 Mar 2025 21:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587626; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+sSLDnAdQaaRh1ug3/9steXZw1JYzt1ToQ27dvMkXSk=;
	b=DfXAd422TEJJklzGEddbwWU/OeKgZww3A3cYngRWzDYNyrTTbHl7JC5IXsa9Qkq9vmb8Q4
	kP0GxhPzzlaj+gYSu4507wgC/zWzgL5WeKWdSQTNcmQG5yJkhTBuZw2GneDpLImkWcNHz3
	wylB1+zTksd57JqSTE/wgS5MnmSH3cCPwAn/Lg11muqeiIjyvv1Dm7uZMe6QsmFi5t+92G
	D7AvpAlbnKxL+EzT8wDYQdlgwJANhnY5TVaNLeDs9RrsT0GWnWFtjqle9ajLuieDrlJmz+
	x3bsE+yL1Fwl49kFeUBHt+OZ5G2aM0aVZwMrcZRswxvwmwjja51uKhnIt6ubvw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH v2 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document Freescale i.MX95 GPU reset
Date: Fri, 21 Mar 2025 21:05:51 +0100
Message-ID: <20250321200625.132494-2-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321200625.132494-1-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_130708_367549_ECAF2D2E 
X-CRM114-Status: GOOD (  15.30  )
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

The instance of the GPU populated in Freescale i.MX95 does require
release from reset by writing into a single GPUMIX block controller
GPURESET register bit 0. Document support for this reset register.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: - Fix dt_binding_check errors in example, temporarily use fixed
      numbers to refer to IMX95_CLK_GPUAPB clock and IMX95_PD_GPU
      power-domain
    - Drop trailing pipe after description:
    - Drop leading dash before const in compatible:
    - Switch from fsl, to nxp, vendor prefix
---
 .../reset/nxp,imx95-gpu-blk-ctrl.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml b/Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml
new file mode 100644
index 0000000000000..ca841db20d35b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/nxp,imx95-gpu-blk-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 GPU Block Controller
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description:
+  This reset controller is a block of ad-hoc debug registers, one of
+  which is a single-bit GPU reset.
+
+properties:
+  compatible:
+    const: nxp,imx95-gpu-blk-ctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@4d810000 {
+        compatible = "nxp,imx95-gpu-blk-ctrl";
+        reg = <0x4d810000 0xc>;
+        clocks = <&clk 83>;
+        power-domains = <&scmi_devpd 14>;
+        #reset-cells = <1>;
+    };
-- 
2.47.2


