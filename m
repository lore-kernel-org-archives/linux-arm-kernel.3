Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C91CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RM1CPtpcM7iofFgJi6EoZwd3D3Y67w7Up4uLm6O8Je4=; b=cBfwZburVhJXvw48jt8gBK5OfB
	gxvVMA6JZghkevho9FmTox5BWvCDRz9M2vn/s1dAaBcgkVx6j6pnWV7nYseaOPKE1cTqb1pr2C3Um
	XndCDyKHvrweikAbAPAlkNfp2Xo7hhzZsliIs8kLB/sT7Af6mnDnbWTrF0Z1zIxpp8kgiHAr2Ie+y
	PEH5dhQE6T/QQgL3LT14QCvCHYX3M085dusOmBn8I0dBN2/XPomg7rnXbOS1RdAPqCaucdIzht4rF
	2rYtjmp7T4KeCymhdKZKqt62mlGDPHwrchqcJkeoNAosyWeyHop8XoLWmjlD4neLpCPKkng44uPsp
	7co/nFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8es-0000000B2F3-2jef;
	Fri, 12 Sep 2025 18:38:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8eq-0000000B2Av-1JMj;
	Fri, 12 Sep 2025 18:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RM1CPtpcM7iofFgJi6EoZwd3D3Y67w7Up4uLm6O8Je4=; b=O0FLgE0IY95YWyTjo/NnCghlbA
	uOZgqUza0XOlUBBoN3BVSrGdIdZSG8GcvO6ATXvHCTnjZ23YXMY0xtLSRsI3UZEeS90GAYwHE+xxG
	krwTlsLWx26FhT2YpIDKObIqMmLVkxS24Z31+Be0lKk6BCl0voOYRn2OXH2sgPJgp14ximRUrXQZv
	pcGClkpYsLOvKK6F4coVt7TjEOQkkj8Vf2bci5xSwtJV3HlknnvMam/Mq8oTcRNfATtHP+LBrWsLU
	SpM1C0TO63vsy3sbhecsV5V+C3xLSOHTKa68AQdKiyGhcKsts3QoWPiCjQMoTQXFKUnnXvc2nl0L6
	ZWSKuwaA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8em-00000006PN0-0ycb;
	Fri, 12 Sep 2025 18:38:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757702262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=byJeH/qvrKSq0hRdY3YAxb4YuVStbP8Q8VjieV/qNRDppLSnEK62wmkr53+MnMm4UxAvZtcGVL7utDj44rhO3ZR9+Di5/tb7FKkxb2zjqo8Jj5wn1ojzQEVIvW97jmdJL4L2t9CDl7UYbFnJq98yWy9VEEjWxr/zmbIkOilQX1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757702262; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RM1CPtpcM7iofFgJi6EoZwd3D3Y67w7Up4uLm6O8Je4=; 
	b=khTz1fGFOTVAy89miF0ilU82wfp3RnCPCikZlA+QkbOukt/skJOOXsObFcpolr1Nnlmj7pS7PZe0MGoHnbnmB7HZUNrWqq8sjZfpm2iTAnehdNVJ2Vi/2pVl40+E1qVHdoWFy0ujnopjNLJD6WLzJRpb2bFLv6aaaE6SU8q3zJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702262;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RM1CPtpcM7iofFgJi6EoZwd3D3Y67w7Up4uLm6O8Je4=;
	b=PFDyDR206u30J3avNJ3Hwa4+fmfWyq6mBbycW/ult5ii31XcdDrpgc1d5sLYAe5A
	ED0AJv7KMjsSXpoQ4NkWawG/A+LoMKdMbz2pHmrniKUy0aNtzywn50ZHAw4AgYCHFh6
	1gR5r1dMQvBXNifWNlzscfG5lTrdFW5nlGjfjpj0=
Received: by mx.zohomail.com with SMTPS id 1757702259914663.1005178250432;
	Fri, 12 Sep 2025 11:37:39 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 12 Sep 2025 20:37:01 +0200
Subject: [PATCH v2 02/10] dt-bindings: devfreq: add mt8196-gpufreq binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-mt8196-gpufreq-v2-2-779a8a3729d9@collabora.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_193800_685946_FD820686 
X-CRM114-Status: GOOD (  13.01  )
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

On the MediaTek MT8196 SoC, the GPU has its power and frequency
dynamically controlled by an embedded special-purpose MCU. This MCU is
in charge of powering up the GPU silicon. It also provides us with a
list of available OPPs at runtime, and is fully in control of all the
regulator and clock fiddling it takes to reach a certain level of
performance. It's also in charge of enforcing limits on power draw or
temperature.

Add a binding for this device in the devfreq subdirectory, where it
seems to fit in best considering its tasks.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/devfreq/mediatek,mt8196-gpufreq.yaml  | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml b/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9d9efd4e70f1ef7ae446c833c15144beb9641b16
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/devfreq/mediatek,mt8196-gpufreq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MFlexGraphics Performance Controller
+
+maintainers:
+  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+
+description: |
+  A special-purpose embedded MCU to control power and frequency of GPU devices
+  using MediaTek Flexible Graphics integration hardware.
+
+properties:
+  $nodename:
+    pattern: '^performance-controller@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - mediatek,mt8196-gpufreq
+
+  reg:
+    items:
+      - description: GPR memory area
+      - description: RPC memory area
+      - description: SoC variant ID register
+
+  reg-names:
+    items:
+      - const: gpr
+      - const: rpc
+      - const: hw_revision
+
+  clocks:
+    items:
+      - description: main clock of the embedded controller (EB)
+      - description: core PLL
+      - description: stack 0 PLL
+      - description: stack 1 PLL
+
+  clock-names:
+    items:
+      - const: eb
+      - const: mfgpll
+      - const: mfgpll_sc0
+      - const: mfgpll_sc1
+
+  mboxes:
+    items:
+      - description: FastDVFS events
+      - description: frequency control
+      - description: sleep control
+      - description: timer control
+      - description: frequency hopping control
+      - description: hardware voter control
+      - description: FastDVFS control
+
+  mbox-names:
+    items:
+      - const: fast-dvfs-event
+      - const: gpufreq
+      - const: sleep
+      - const: timer
+      - const: fhctl
+      - const: ccf
+      - const: fast-dvfs
+
+  shmem:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the shared memory region of the GPUEB MCU
+
+  "#performance-domain-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - mboxes
+  - mbox-names
+  - shmem
+  - "#performance-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+
+    gpufreq: performance-controller@4b09fd00 {
+        compatible = "mediatek,mt8196-gpufreq";
+        reg = <0x4b09fd00 0x80>,
+              <0x4b800000 0x1000>,
+              <0x4b860128 0x4>;
+        reg-names = "gpr", "rpc", "hw_revision";
+        clocks = <&topckgen CLK_TOP_MFG_EB>,
+                 <&mfgpll CLK_MFG_AO_MFGPLL>,
+                 <&mfgpll_sc0 CLK_MFGSC0_AO_MFGPLL_SC0>,
+                 <&mfgpll_sc1 CLK_MFGSC1_AO_MFGPLL_SC1>;
+        clock-names = "eb", "mfgpll", "mfgpll_sc0",
+                      "mfgpll_sc1";
+        mboxes = <&gpueb_mbox 0>, <&gpueb_mbox 1>, <&gpueb_mbox 2>,
+                 <&gpueb_mbox 3>, <&gpueb_mbox 4>, <&gpueb_mbox 5>,
+                 <&gpueb_mbox 7>;
+        mbox-names = "fast-dvfs-event", "gpufreq", "sleep", "timer", "fhctl",
+                     "ccf", "fast-dvfs";
+        shmem = <&gpufreq_shmem>;
+        #performance-domain-cells = <0>;
+    };

-- 
2.51.0


