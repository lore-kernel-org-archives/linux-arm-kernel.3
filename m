Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500DEC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 23:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvuS/3+qj3jrgC41XTgu3o3reZxECxd13x0obbo/vVw=; b=iH7BvYydl+mCeZ2jecwCH2hIzk
	vLebGuCwzpThSqRMYQ2u15tQDC3CWebUKaLLFIIgtdJyaN7MXoRQYHgTjXtr/ymDv4XgjS3hlDucT
	VExmedZ8dYvJ9D1FmFZYk1w4iIS3Jmp+1Dp5AmogC838+H9hsi0T3lwyDgAoLm7jeqv8o8MROrENF
	yqLeEp7/jx8u3oWp3fcZnl3zMatwZYeexoZy/A0rmPlb4oN2yUc13JhGQ/XKZPECeUEDvGeajsie3
	HT5sUzaLGtVrD8awjnQoHOJqbf8kBF+Gn2v3z9RvYQPR2LTzugBJkzpXEmjGiwmYYQa5mEG/QThox
	Uf69lhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thzG0-00000005XI1-3pqA;
	Tue, 11 Feb 2025 23:01:32 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thzDI-00000005Wsg-3IZs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:58:46 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5de64873d18so6249439a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 14:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314723; x=1739919523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvuS/3+qj3jrgC41XTgu3o3reZxECxd13x0obbo/vVw=;
        b=JRiR6gITJThUO52rMJwnSzkryMM6m+h/dFANzn5+XXGUwRdI7vPZJe7TfllCUZGmME
         Uc8NW46+vlhtxgqIBOTll9uFhYshYj2Kw96bmh3AHKsbiAAq+cy+VnG6UDImBT4irV2J
         IeTU0WzvkeKWJhkKCc+0xpMuj9h7MNwJsPqk3bGBqqx+eeZRRtU/qKP3bLKClnmOI3G8
         q7NHi9V1MzJ5BX4xAqa/4KeyzNqS5BgQMayaglqA7hEjKx3W0oI4MH1X+JVGdb8UjZH/
         LMLPTZHfqRZ/IashiXAilSwbHosaF//hy2JqkWQe+UWSvegERVD4Qv6dVh0BMJk+aiiP
         B+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314723; x=1739919523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvuS/3+qj3jrgC41XTgu3o3reZxECxd13x0obbo/vVw=;
        b=OI5AaJRLnH34saRVdrb/DLHs5xBMlGTh6OZd7je2D39kl2O245jMnr6QcUPo3ympkk
         fjqTThh2tiXZfcPjKsqOZRxQTQdKzf6genLkEGKbnL1PX3cCOErje+2C0q0NrEGNRfG/
         VrWlFM3Rlsvj1wutOv790Ke0l2+/RwpAfYq/SdyetXcJqb7UJP8Emh2t+uE7E0KVmQgj
         LPMEdn1/+SxX7nR40wYcuomSpIfTGAQ+g26O9lNA39GJPu95b7ou9MsAOI+1A2ow8EHX
         DlWJGLf8cE1KHDrV2wyTSZAMH04XpStYRg8BHNIamQKzhZZBwoSQVDlXcHuK1EDiZPLt
         9Dig==
X-Forwarded-Encrypted: i=1; AJvYcCXIM9aWHbMgSQ7HSsNNZkzkb481HpJJmgDc9uLGESFlJEEMV5sPmONPw7l8W+uizAaJ5GpKtkwuk+87tNT0j6A3@lists.infradead.org
X-Gm-Message-State: AOJu0YwNbpycWishbPS1G76XZJawhau8CfIR0iHJjstUZRZiKYbkpfsf
	laOm77/PYktHjqcZisdv1lu+Npkgk2oiHqUxJKWX2mrMiQzR9f0L
X-Gm-Gg: ASbGncuV+Bxce7BwvbP3StcIQ+SPSUggKFbOxG0cnmOyLhYaPih31+eoFDe0W+Z73DG
	Oa8CwJGN5kg77TBzVcAIEJ/WPherQQf4U2VI/zIZpBrfT7j38E7Gf0C77z1j2QfjElOZhMzJUXz
	9ndfzHRlWPQR+uOT2t1NB4IX2KmXyEJRs1uuqe8oThJzDnLDV2FpmpU1ACRyGEQoHLBI0uN56Y6
	lfzzm/D5OPfM34Ovc2Sv1MpubE2Ts3WS3X9Xwvd5maVX2px9LpLW/iBXXOaUUQ7swWwpOtdWevG
	akIBtSIwxGI3S4ZsenKfg/9/wF+2AfLH/7+k85XrGe3y41DD5CoVvg==
X-Google-Smtp-Source: AGHT+IFmYf1ZrXBMSFnoxbMnODcTZWJfKyjsmmdnqh4tb+GgTGoTQYeo7N465iZhYGFhSbbcOGz2yQ==
X-Received: by 2002:a17:907:6095:b0:aa6:a228:afaf with SMTP id a640c23a62f3a-ab7f34da6f5mr58459966b.52.1739314722882;
        Tue, 11 Feb 2025 14:58:42 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm131525166b.89.2025.02.11.14.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:58:42 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
Date: Tue, 11 Feb 2025 17:58:06 -0500
Message-Id: <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_145844_846821_72EF2AE3 
X-CRM114-Status: GOOD (  14.91  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add binding for imx95's CM7 core, used for audio processing.
Additionally, introduce a common binding for NXP audio processors with
Sound Open Firmware (SOF) support.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 +++++++++++++++++++
 .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
new file mode 100644
index 000000000000..f00ae3219e15
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP imx95 CM7 core
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: NXP imx95 CM7 core used for audio processing
+
+properties:
+  compatible:
+    const: fsl,imx95-cm7-sof
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: sram
+
+  memory-region:
+    maxItems: 1
+
+  memory-region-names:
+    const: dma
+
+  port:
+    description: SAI3 port
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - memory-region
+  - memory-region-names
+  - port
+
+allOf:
+  - $ref: fsl,sof-cpu.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    cm7-cpu@80000000 {
+        compatible = "fsl,imx95-cm7-sof";
+        reg = <0x80000000 0x6100000>;
+        reg-names = "sram";
+        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+        memory-region = <&adma_res>;
+        memory-region-names = "dma";
+        port {
+            /* SAI3-WM8962 link */
+            endpoint {
+                remote-endpoint = <&wm8962_ep>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
new file mode 100644
index 000000000000..31863932dbc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP audio processor common properties
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+properties:
+  mboxes:
+    maxItems: 4
+
+  mbox-names:
+    items:
+      - const: txdb0
+      - const: txdb1
+      - const: rxdb0
+      - const: rxdb1
+
+required:
+  - mboxes
+  - mbox-names
+
+additionalProperties: true
-- 
2.34.1


