Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFFACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5LIwADdeTrYwbX6llVTzDuJpx8CtqSl8BhfaECop4A=; b=oVl7/azsMKc73aJ1f1dC1AldJK
	71Qa0uL62q7Nfnf2mQU24NZ7BSTNrbmwyk+quah1Gb/OsjAvqkNwOKXY/kBZ8sSAMdxA4t0NvY21Q
	N5fp3SOMiHwEyXu3VPcUEsNTwA4wPp6SnPcA+Sx2zFS6jkZMaVof7IHBcUJL2m5SgKARnjgSkpYT1
	bpEDzDFAFwh3l/L3XCSU8gnAKCh7CEHYbBGoNJmZ7UC9wpNOwYyM2cryL+s26l6N2vjUIvzmbAVgH
	V0tCmE51zfD5SQm3c5m8ZsSLXKuO55YsN3xY8G1ySEViFoitNyL/qiwoH3bD29FzUrqdTCuuEL5DC
	9dolWbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7czm-0000000AMi6-17cg;
	Sat, 11 Oct 2025 17:03:02 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7czj-0000000AMgS-2w2c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:03:01 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVKq29N6z9svm;
	Sat, 11 Oct 2025 19:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5LIwADdeTrYwbX6llVTzDuJpx8CtqSl8BhfaECop4A=;
	b=e7edRgvr7JCvLHkAnG2gKhAYgQgN1BDydmcfE24RmzO9bTGEPJoeeueGSxojF6dvwz3vNQ
	TzUJHpnC05SshopU/YEyWiUlSZy5JhrMU8iqs6OoJywYRR7nPXzN+lDFeHDuWVZ9iwScpE
	+t5R1w0MjEs3xnjR0tODpKwGH+53kcbzWwx4je6amDuh6RmJ8MM/b1PDYi7Fr5uaJEhVwX
	Zf82lRtf2TQFKQjIjjFcC5/XZ29Snq0KAStl3g14Ai4zwaMGPVWq8aga0u4mFtmUppaFuK
	t4YNw1cTVjo8aSCXTSGddvVtdquvqbpOyexZ7hieCJ0cSGuZ8hpGtd3sTr0qQw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5LIwADdeTrYwbX6llVTzDuJpx8CtqSl8BhfaECop4A=;
	b=vEZiE5kRykGhGEjoOqVbJP0v71GbvnBv3DNUXoBdCQweCz3kGCpE1TzRUPSDE68yKWXh84
	XKQ3nvmO7zTC1rLi2ERpioTilckplNCIaqRjQ5BSIG9QbCww57kzLBMOvi4OePMczmc6oG
	Hu0Fyk92lCY/f/4/gbtDY/l/eQ4ztCD0/x4fkZ3fcVUYS9/gh53GVpoYwyIDKInj9ZShJK
	lmycnmUlqFM5wOHDOybzS/lrsQwBpgFpYWaaDlAqKKnkm8DC5iJYFa39HoPjQnsFjWj2KF
	msBk3CzVpBnpmGLqZ+talo7CMxhgofzd4DpnlzhKX8jfy3FUyVfSwyW7bS9hmw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display Controller DomainBlend
Date: Sat, 11 Oct 2025 18:51:16 +0200
Message-ID: <20251011170213.128907-2-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gqxarmiuu1o1k3jtio5duniphc4sjzo3
X-MBO-RS-ID: 54db7b2b31df76cf6e5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100259_870288_805B58C2 
X-CRM114-Status: GOOD (  10.47  )
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

i.MX95 Display Controller display engine consists of all processing
units that operate in a display clock domain. Document DomainBlend
block which is specific to i.MX95 and required to get any display
output on that SoC.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../display/imx/fsl,imx95-dc-domainblend.yaml | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
new file mode 100644
index 0000000000000..703f98e3321e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 Display Controller Domain Blend Unit
+
+description: Combines two input frames to a single output frame.
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+properties:
+  compatible:
+    const: fsl,imx95-dc-domainblend
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    domainblend@4b6a0000 {
+        compatible = "fsl,imx95-dc-domainblend";
+        reg = <0x4b6a0000 0x10>;
+    };
-- 
2.51.0


