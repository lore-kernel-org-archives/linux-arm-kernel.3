Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CB0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhaNNKCxtrPXfELgw/KHgSRSl1aX9JDfH4/Rbi26Vsk=; b=ptAKBQB6wRcTb3tpaR2a+rPzmY
	Q3NCtuzHXvCX6Up1KoiuWS5NI1Z3iJUdvj+Ves3fBRMlEKlC40v+knqXmEuuBDVx93cNRRGxOnxgV
	BxRn0inFLFL4+Pc3utH6OpoAFszeuwsQGd84aLgcZodWJhT6UdsdkbSY4VbaAFYq8oPho+ZldFMUz
	UwkL0FWjbuJfuTON9gTOri+fNFE8xE6iQbu4aK+zQYs969p6KvZkiF8zK6FRjgr+RdGV+EWiutmjT
	v5302w8/AF0HxBr0gPhCzRyVbTV57eSPngF086zqy4Ad6QgYHIsFoeENUoCgRqmFuWRRkBc1VgYwH
	ArJ3A1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCUT-0000000AJii-2d6O;
	Mon, 16 Dec 2024 14:54:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCRL-0000000AJ5x-27oY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:51:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4361815b96cso27470605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 06:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360677; x=1734965477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhaNNKCxtrPXfELgw/KHgSRSl1aX9JDfH4/Rbi26Vsk=;
        b=M1xmHuuDgaFqWgpwuFmVsqGpHFCzSJC1ZAMWUq1rD9bsyEv5a7vQOxvboC0fYJ3Aj3
         wXBAeU84sATRi8a8OjC9RhoYjMDyfa79gIKlbdfjaDrV083pDM5RrYp6r1ZFe27zqRer
         tUVstPQGSgcPWD7ttaaDLD1HtejXOFeDqycPfhWlYhSeCGJF8FiTVAC5iI7em68FvofM
         6EKEcg3hRmzFoettWs3kJxd9Fp17IHKiC25r5DPwJBHjuodttedwwYmEQP+jqBcGR+mo
         tx7ijxuKj4U5Acli1yJKN5snV1aGZczxUug0XziVdG69zUqvV7CWYGNPT8su6IoKJ1Wk
         pHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360677; x=1734965477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhaNNKCxtrPXfELgw/KHgSRSl1aX9JDfH4/Rbi26Vsk=;
        b=IJkylBYKLbnvRX4VD5KdCDq3Iz71T54ue290TNeYZodW1Q2GBBrPl0fdkIfPhpdQuv
         yAMEig7KigZCtGHnPopN8C6hzHiwHYhANfSErcjXO+rH8KpUI+tInc4q3q46q46TgGyk
         /871iV2I3Ss7wfQ/3s9f1Q3Qosat/VvVVfVBLc2qcSlqdyVIMbXbmUlJGS8j+zgViqZp
         UFt7AXwHQHudEEspIrDh5IycLCvpQg0sYBZdb/OyQPdVmDGkVWnQCZ/mrVDkfnZ/Gj3C
         82UFcbl8o4Vw9NAbe8hqOaPkCjaM8zhWP7fimXDs+kF3uJME/ABbR9G1tm4yUpTnZ32n
         AWJQ==
X-Gm-Message-State: AOJu0YyDLRzUBoPE86/ccSUNb47ijOQNl43uUNUt47OQLkRUs0Tibfol
	l8cefpVU+1IyplelwtKGFE6IBu79Ifl9YhxoI46s7bCLvhbt8aL8
X-Gm-Gg: ASbGncsC8DB58Lq2rNWwP/SGRsntM7UuwErmlQLprD933Saoh8tjtIsZ4kEunffWteC
	oDwShW/36MkTQiS3Oj6Eng4zU5I+CIjax70bhzIDaH2j2JO/PsWeqZ08aic/CgjmPMePW5gn17M
	DdxOe390NfZLU4dr+/ul3XvSge6+SRGbmpPNfzvA/xTPoUCGbAzbnef62gZbxaQMNIRckDfMVIF
	fBkAVD8PQTnfa2IDv3w3aUNJntvz8HsC3ZUa6qycwpn91bBoaI8ApTmIxqoENWHDT4+mJ78PT9Y
	SgJB5CT31rSFgT0/
X-Google-Smtp-Source: AGHT+IHp+aRH9ApI2wBs86oXmAT5Zyw16hcSyU7ofzYQJ6VdNQwOe2b+SoQNW7hpWBoCfEejVt7Ieg==
X-Received: by 2002:a05:600c:1da7:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-4362aa9dd6dmr112072165e9.21.1734360677203;
        Mon, 16 Dec 2024 06:51:17 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:16 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] ASoC: dt-bindings: support imx95's CM7 core
Date: Mon, 16 Dec 2024 09:50:36 -0500
Message-Id: <20241216145039.3074-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_065119_550669_86E1AAC2 
X-CRM114-Status: GOOD (  12.87  )
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
new file mode 100644
index 000000000000..cc1eb358f288
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
@@ -0,0 +1,44 @@
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
+allOf:
+  - $ref: fsl,sof-cpu.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx95-cm7-sof
+
+  port:
+    description: SAI3 port
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    cm7-cpu@80000000 {
+        compatible = "fsl,imx95-cm7-sof";
+        reg = <0x80000000 0x6100000>;
+        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+        memory-region = <&adma_res>;
+        port {
+          /* SAI3-WM8962 link */
+          endpoint { remote-endpoint = <&wm8962_ep>; };
+        };
+    };
-- 
2.34.1


