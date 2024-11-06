Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42011D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrNsJPPKHO5Lk6rFyymH1MtDjL//mpL7mQleFPtlyis=; b=VL/t2qvXFuTd3IVaB0p2Ah2qLA
	gdNdEtingW4R0Gp3bbAZUJhGpgHeBWuuN9UadWq1fitBmkefV5dxa/97oe3oHf/Q7ethANUWNVuGt
	V+rTxRDMMyc+x1T7Mvl8iueR1jM8quyJ3+iubKiXXK3qVfV1Lxs6Bsiilq5xUQcMGLNaXZwnbVDT6
	FXr4FasGaovgUn9SMmV/1eKsFzaoDDHiQ0kagSKIpeHk/qfgyO84L7QkOlvpFKDVOtiSMOMClOXsW
	VH2gYunfL0j61FO3WNDXMYa1l5NhGaSInhQwg80jpVRu+OvnHbCc1VmisX+GVCR0hpyLPaEOkalDx
	qkoSa5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cN1-00000002XjL-2cVa;
	Wed, 06 Nov 2024 09:30:35 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bzQ-00000002PFh-0AXk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:06:13 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9e71401844so609851766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883970; x=1731488770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrNsJPPKHO5Lk6rFyymH1MtDjL//mpL7mQleFPtlyis=;
        b=nJzPMz9XCKE1aAkR8vS2tT6xte99LTLaJ+h4hPZZgR48onyyNSXn85XZcmy1MTq6ba
         6tbR8XZ0UmSN4tK5MLp+QY0L3brNg2oxFfPJDb672Cy9LkiQ/t8d9x0W0YKixMuFYh7b
         8yAY/jvSm6UPUEA1M6okWEdLSugRWHUypaOu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883970; x=1731488770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrNsJPPKHO5Lk6rFyymH1MtDjL//mpL7mQleFPtlyis=;
        b=I6bwkU2ivkT8wBtzdAUnQpoJiBL7/gut/PqjwmozEb10NogA9xwYpLyMuKVAUFjhP0
         33PFRtq/oWCIhEA3vIvmYx0nOV+1crl8gastmqEBdwwdYqEqJQHx5/gDeDoPKz6hxWsB
         TAQWMiLWLv4HeThzGRRs4Yvxu3xDf1Ex4fOgs9DjaG7q6P5JZ3AZWKFfbHiiXNIj53Dc
         0NGkglzdNXqcc6A/7DtAyWO5SfdemnasZ5ShLYXXimIkx8IaSSoAv8aru+SPK3YBYnxd
         zKwBtKI9CoEZCFB5TjKaPxODa+HnFeN8JLxiDyBabt/HltLHG1EcZrVOjrWTXoZYZDZX
         QghA==
X-Forwarded-Encrypted: i=1; AJvYcCX3WP1Ibh2W0kmm94PXhwrq4SJAbmdbAFTUhcFFnv4YXCA8OsquDlEGhkLN/32ScjRF6f8Ls04rFDmy9NBjO+BC@lists.infradead.org
X-Gm-Message-State: AOJu0YxqBhw6uzZ0tw4bILllgE+NcpLjeN8wRrQJqTfJCJ5OBjpSSTDo
	8hmX4Nq/J5rJaYLQoJfboW+JBZLDGD82t+QR8gHZNjzxLZiClGBrmEmIyM+NL+g=
X-Google-Smtp-Source: AGHT+IEsxqy1QIMoDY4Ou1LJy4yOq+pq9/YaekGJg8fDbyA6VV3xENMscgOLE+Qbj+VEcc4PHGIAOQ==
X-Received: by 2002:a17:907:3f9f:b0:a9a:2afc:e4d7 with SMTP id a640c23a62f3a-a9e50b948d0mr2311624866b.44.1730883969647;
        Wed, 06 Nov 2024 01:06:09 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Wed,  6 Nov 2024 09:57:57 +0100
Message-ID: <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010612_105380_1968ECE7 
X-CRM114-Status: GOOD (  12.32  )
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

The patch adds the DT bindings for enabling and tuning spread spectrum
clocking generation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Added in v3
- The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
  imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
  indeed more or less a syscon, so it represents a memory area
  accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

 .../bindings/clock/imx8m-clock.yaml           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..7920393e518e 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,40 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandles of the PLL with spread spectrum generation hardware capability.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) of spread spectrum
+      clocking for each PLL.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate of spread spectrum
+      clocking for each PLL.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      The modulation techniques of spread spectrum clocking for
+      each PLL.
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - down-spread
+        - up-spread
+        - center-spread
+
 required:
   - compatible
   - reg
@@ -76,6 +110,11 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+        fsl,ssc-clocks: false
+        fsl,ssc-modfreq-hz: false
+        fsl,ssc-modrate-percent: false
+        fsl,ssc-modmethod: false
+
     else:
       properties:
         clocks:
@@ -101,6 +140,8 @@ additionalProperties: false
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
@@ -109,6 +150,11 @@ examples:
                  <&clk_ext3>, <&clk_ext4>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4";
+        fsl,ssc-clocks = <&clk IMX8MM_AUDIO_PLL1>,
+                         <&clk IMX8MM_VIDEO_PLL1>;
+        fsl,ssc-modfreq-hz = <6818>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <7>;
+        fsl,ssc-modmethod = "down-spread", "center-spread";
     };
 
   - |
-- 
2.43.0


