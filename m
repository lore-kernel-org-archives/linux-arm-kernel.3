Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49752C982CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krjhFSRUjjcodVOjvmoECQPfmzBFrbf2f9ZT/pSJOz8=; b=YRlB+srjlgFtG2g5cCFITOg/ws
	VhtByClaFXZ3gM4jpUPwBSUYZMCKaR65jixDAMUpFJ/5W1d8Dso4w2PTvk2GW6OSQIDMaA5d2g8QO
	AYQprk9kBHJva866G4XgRI7vPXlvuDL+rmYNZkYebfNxGbEc3mlLlWtCSdYLGmpa3DzQJVOihTGyE
	McgiWum7HnZOI/ah2jJdJRoXik4vzQZ7ZjFDgPUWpvtGMkD/POyBACZ7X7s67s1JIA2JMzkWHbw8K
	qJ/UcBsm58DXfVVgx5TGO9WA5vntbavN272/vyY+Oi3rgn0q/6K96d+P7Wh8Rin4rOW5OcOeVEQBK
	WvGlFLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V93-00000007AfW-0BVI;
	Tue, 15 Sep 2026 15:32:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V8x-00000007Aah-3jdY;
	Tue, 15 Sep 2026 15:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=krjhFSRUjjcodVOjvmoECQPfmzBFrbf2f9ZT/pSJOz8=; b=fP8StvC6SzRHej9CCjMAqvF4zD
	AcGPeefdBJWhRycL3BXdeIqhI5vuku7oJyFBFV5fDsJrdrSW0Z+BhlISkOkpHrQZlXF4F3S9NejtP
	fgDF6fim+2w36YKTHcKFHa2XOFR9hYai9edVooMrvvsfNN6nFeCO5Z4AUsqHzVroco4tcDaBpntZW
	dHmIYZjaxZKSEVbeI2Ilem+kHFXp/FDOoP6T4AlLccDH+OqsMzEuoO49BsRBgBpFUxfIQt7s9DHO9
	+yGzy5kVvElLglBh08gvvM564y7+o/CYnBdSWsxfhWlMc5jUChkI0lUd58aETqMMXyj1YTtKxbWv0
	BTJWStHw==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6V8u-00000006wWD-3PeF;
	Tue, 15 Sep 2026 15:32:22 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153215euoutp01f6a41b1c13a34f9a2128aa823aa5ebb6~ViFdSE2CA0097300973euoutp01c;
	Tue, 15 Sep 2026 15:32:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260915153215euoutp01f6a41b1c13a34f9a2128aa823aa5ebb6~ViFdSE2CA0097300973euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486335;
	bh=krjhFSRUjjcodVOjvmoECQPfmzBFrbf2f9ZT/pSJOz8=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=W53K8ELKFpEAxnCP1RILam1PxVQ2gEEA+7eKnxtYbc7sX9T5MUJkJTSO+un9vBInQ
	 zpOKLHFKU/nfy7ckAnG0F/bdt3z6LoS+0mIOY1185dkqX2l+0P1qhcL1Jawf3fVeBV
	 9MNEP2PKXh2SjuGmIsaZdfYv/uaWF/6UQ7z+NqO8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125~ViFctveW01216312163eucas1p2Q;
	Tue, 15 Sep 2026 15:32:14 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153213eusmtip1506e9aac16998b42934c3838840ebe79~ViFbDT1fr0419704197eusmtip1z;
	Tue, 15 Sep 2026 15:32:13 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:09 +0200
Subject: [PATCH v4 01/20] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125
X-EPHeader: CA
X-CMS-RootMailID: 20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_163220_911321_688F2AFF 
X-CRM114-Status: GOOD (  13.63  )
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

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.

This device is a child of the starfive,jh7110-hdmi-subsystem node. It
functions as both a PHY provider for the controller and as a clock
provider for the variable pixel clock (hdmi_pclk), which it generates
from its refoclk.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f838fcc238ec7db0a8e794234bdceec36cb6d9e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon INNO HDMI PHY
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The PHY portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-phy
+
+  clocks:
+    maxItems: 1
+    description: Reference oscillator.
+
+  '#clock-cells':
+    const: 0
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    phy {
+        compatible = "starfive,jh7110-inno-hdmi-phy";
+        #clock-cells = <0>;
+        clocks = <&xin24m>;
+        #phy-cells = <0>;
+    };
+
+...

-- 
2.34.1


